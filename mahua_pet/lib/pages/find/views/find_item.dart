import 'package:flutter/material.dart';
import 'package:mahua_pet/component/network_image.dart';
import 'package:mahua_pet/pages/find/contents/find_detail.dart';
import 'package:mahua_pet/pages/find/models/focus_post_model.dart';

import 'package:mahua_pet/styles/app_style.dart';
import 'package:mahua_pet/component/component.dart';
import 'package:mahua_pet/utils/utils_index.dart';

import './find_item_image.dart';

class FindListItem extends StatelessWidget {

  final int _index;
  final FocusPostModel _model;

  FindListItem(this._index, this._model, Key key): super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 10.px, left: 16.px, right: 16.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: getItemList(context)
            ),
          ),
          Container(height: 10.px, color: TKColor.color_f7f7f7)
        ],
      ),
      onTap: () {
        TKRoute.push(context, FindDetailPage(messageId: _model.messageId));
      },
    );
  }

  List<Widget> getItemList(BuildContext context) {
    List<Widget> itemList = [];
    itemList.add(userInfoItem(context));

    if (_model.messageInfo != null && _model.messageInfo.isNotEmpty) {
      itemList.add(SizedBox(height: 10.px));
      itemList.add(renderTextItem(context));
    }

    if (_model.fileCount > 0) {
      itemList.add(renderMediaItems(context));
    }

    if (_model.userInfo.city != null && _model.userInfo.city.isNotEmpty) {
      itemList.add(renderLocationItem());
    }

    if (_model.commentList.length > 0) {
      itemList.add(SizedBox(height: 10.px));
      itemList.add(renderCommonList());
    }

    itemList.add(SizedBox(height: 8.px));
    itemList.add(Divider(color: TKColor.color_e8e8e8, height: 0.5));
    itemList.add(renderBottomItem(context));
    return itemList;
  }

  Widget userInfoItem(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: TKNetworkImage(
                imageUrl: _model.userInfo.headImg,
                width: 45.px, height: 45.px,
                borderRadius: 30.px,
                fit: BoxFit.cover,
              ),
              onTap: () {},
            ),
            SizedBox(width: 8.px),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(_model.userInfo.nickname, style: TextStyle(fontSize: 15.px, color: TKColor.color_333333)),
                Text(_model.createTime, style: TextStyle(fontSize: 11.px, color: TKColor.color_999999)),
              ],
            )
          ],
        ),
        SmallButton(
          title: _model.followStatus == '关注' ? '已关注' : '关注',
          disabled: _model.followStatus != '关注',
          onPressed: (){
            if (_model.followStatus != '关注') { return; }

          }
        )
      ],
    );
  }

  Widget renderTextItem(BuildContext context) {
    return Text(
      _model.messageInfo ?? '',
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 14.px, color: TKColor.color_333333),
    );
  }

  Widget renderMediaItems(BuildContext context) {
    final media = _model.fileList.first;
    if (media.fileType == '0') {
      return renderImages(context);
    }
    return Container();
  }

  Widget renderImages(BuildContext context) {
    final imgArray = _model.fileList;
    if (imgArray.length == 1) {
      final imgModel = imgArray.first;
      return Container(
        padding: EdgeInsets.only(top: 8.px),
        child: FindItemImage(
          imageUrl: imgModel.fileUrl,
          width: 140.px,
          height: 180.px,
          radius: 10.px,
          onPress: () {

          },
        ),
      );
    } 
    final imageWidth = imgArray.length == 4 ? 120.px : 107.px;
    return Container(
      padding: EdgeInsets.only(top: 8.px),
      child: Wrap(
        spacing: 10.px,
        runSpacing: 10.px,
        children: imgArray.map((item) {
          final itemIndex = imgArray.indexOf(item);
          return FindItemImage(
            imageUrl: item.fileUrl,
            width: imageWidth,
            height: imageWidth,
            radius: 4.px,
            onPress: () {},
          );
        }).toList(),
      ),
    );
  }

  Widget renderLocationItem() {
    return Container(
      padding: EdgeInsets.only(top: 8.px),
      child: Row(
        children: <Widget>[
          Icon(Icons.location_on, size: 16.px, color: TKColor.color_666666),
          SizedBox(width: 4.px),
          Text(_model.userInfo.city, style: TextStyle(fontSize: 13.px, color: TKColor.color_6f6f6f))
        ],
      ),
    );
  }

  Widget renderCommonList() {
    return Container(
      padding: EdgeInsets.all(8.px),
      width: SizeFit.screenWidth - 32.px,
      decoration: BoxDecoration(
        color: TKColor.color_f7f7f7,
        borderRadius: BorderRadius.circular(4.px)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: renderCommonChildren(_model.commentList)
      ),
    );
  }

  List<Widget> renderCommonChildren(List<CommentList> commonList) {
    List<CommentList> newList = commonList.length > 3 ? commonList.sublist(0, 3) : commonList;
    List<Widget> commonWidgets = [];
    for (var i = 0; i < newList.length; i++) {
      CommentList item = newList[i];
      Widget span = Text.rich(
        TextSpan(
          children: <InlineSpan>[
            WidgetSpan(
              child: Text(item.nickname + ': ', style: TextStyle(fontSize: 13.px, color: TKColor.color_526e94)),
              alignment: PlaceholderAlignment.middle
            ),
            ...item.commentInfo.runes.map((rune) {
              return WidgetSpan(
                child: Text(String.fromCharCode(rune), style: TextStyle(fontSize: 13.px, color: TKColor.color_666666)),
                alignment: PlaceholderAlignment.middle
              );
            }).toList()
          ]
        ),
        softWrap: true,
      );
      commonWidgets.add(span);
      if (i < newList.length - 1) {
        commonWidgets.add(SizedBox(height: 3.px));
      }
    }

    if (commonList.length > 3) {
      commonWidgets.add(SizedBox(height: 5.px));
      Widget spanIcon = Text.rich(
        TextSpan(
          children: <InlineSpan>[
            WidgetSpan(
              child: Text('查看更多评论', style: TextStyle(fontSize: 13.px, color: TKColor.color_526e94)),
              alignment: PlaceholderAlignment.middle
            ),
            WidgetSpan(
              child: Icon(Icons.keyboard_arrow_right, size: 20.px, color: TKColor.color_526e94),
              alignment: PlaceholderAlignment.middle
            )
          ]
        ),
      );
      commonWidgets.add(spanIcon);
    }

    return commonWidgets;
  }

  Widget renderBottomItem(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 16.px),
      height: 40.px,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: getBottomItem(),
      ),
    );
  }

  List<Widget> getBottomItem() {

    List<Widget> itemList = [];

    itemList.add(bottomItem(Icons.favorite_border, TKColor.color_666666, _model.cntAgree));
    itemList.add(bottomItem(Icons.star_border, TKColor.color_666666, _model.cntRead));
    itemList.add(bottomItem(Icons.message, TKColor.color_666666, _model.cntComment));
    itemList.add(bottomItem(Icons.share, TKColor.color_666666, _model.fileCount));

    return itemList;
  }

  Widget bottomItem(IconData icon, Color iconColor, int number) {
    return GestureDetector(
      child: Container(
        width: 70,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 20.px, color: iconColor,),
            SizedBox(width: 3.px),
            Text('$number', style: TextStyle(fontSize: 13.px, color: TKColor.color_666666))
          ],
        ),
      ),
      onTap: () {

      },
    );
  }
}