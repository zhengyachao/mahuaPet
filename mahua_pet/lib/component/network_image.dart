
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TKNetworkImage extends StatelessWidget {

  final String imageUrl;
  final ImageWidgetBuilder imageBuilder;
  final String placeholder;
  final double width;
  final double height;
  final BoxFit fit;
  final double borderRadius;
  final double borderWidth;
  final Color borderColor;
  final bool showProgress;


  TKNetworkImage({
    Key key,
    @required String imageUrl,
    this.imageBuilder,
    this.placeholder,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.borderRadius = 4,
    this.borderWidth = 0.0,
    this.borderColor = const Color(0x00000000),
    this.showProgress = false,
  }): imageUrl = imageUrl ?? '', super(key: key);


  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fadeOutDuration: const Duration(milliseconds: 300),
      fadeInDuration: const Duration(milliseconds: 300),
      imageBuilder: imageBuilder == null ? (ctx, imageProvide) {
        return renderImage(imageProvide);
      } : imageBuilder,
      placeholder: (ctx, url) {
        if (placeholder.length > 0) {
          return renderImage(AssetImage(placeholder));
        }
        return Icon(Icons.error, size: width > height ? height : width, color: Colors.black38);
      },
      errorWidget: (ctx, url, error) {
        if (placeholder.length > 0) {
          return renderImage(AssetImage(placeholder));
        }
        return Icon(Icons.error, size: width > height ? height : width, color: Colors.black38);
      },
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return showProgress ? CircularProgressIndicator(
          value: downloadProgress.progress,
        ) : null;
      },
    );
  }

  Widget renderImage(ImageProvider image) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: image,
          fit: fit
        ),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          width: borderWidth,
          color: borderColor
        )
      ),
    );
  }
}

