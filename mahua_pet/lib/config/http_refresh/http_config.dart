
class HttpConfig {

  /// 请求配置参数
  static const bool isFormat = true;
  static const String baseURL = "https://gate.ieasydog.com/api/";
  static const int timeout = 30000;


  /*
   * 登录注册相关接口
   */
  /// 上传设备信息
  static const String imei = 'user/imei/v2006/wjt/imei';
  /// 用户信息埋点
  static const String putEventBase = 'user/eventBase/v1908/wjt/putEventBase';
  
  /// 获取验证码, get, phone=13456789417
  static const String sendCode = 'user/common/sendCode';
  /// 密码登录
  static const String applogin = 'user/user/applogin';

  /// 获取用户信息
  static const String userIndex = 'user/user/userIndex';


  /*
   * 宠物相关接口
   */
  /// 获取宠物列表: https://gate.ieasydog.com/api/user/pet/selectUserId?userId=136899
  static const String selectUserId = 'user/pet/selectUserId';

  /// 获取宠物和问答信息: /api/user/pet/v2001/lt/getHomePagePetList?pageIndex=1&pageSize=1&petId=19572&userId=136899
  static const String getHomePagePetList = 'api/user/pet/v2001/lt/getHomePagePetList';

  /// 保存宠物信息: /api/user/pet/save
  static const String pet_save = 'user/pet/save';



  /*
   * 首页相关接口
   */
  /// 轮播图: discover/advertUnit/selectPageList?locationName=2&locationPage=1
  static const String selectPageList = 'discover/advertUnit/selectPageList';

  /// 首页种草列表: auditStatus=1&pageIndex=1&pageSize=10&userLoginId=136899
  static const String getTrialReportList = 'user/trialReport/getTrialReportList';

  /// 首页推荐列表: messageTotal=0&pageIndex=1&reportTotal=0&thirtyPieces=1&userLoginId=136899
  static const String selectMessageRecommendList = 'user/message/selectMessageRecommendList';

  



  /**
   * 我的部分
   */
  /// 个人主页--日记: user/message/selectPageList?pageIndex=1&pageSize=10&userId=530&userLoginId=136899

  /// 个人主页-种草: user/trialReport/getTrialReportList?auditStatus=1&pageIndex=1&pageSize=10&userId=530&userLoginId=136899

  /// 个人主页-提问: user/question/v1911/lik/selectMyQuestionList?pageIndex=1&pageSize=10&userId=530

  /// 个人主页-答案: user/question/v1911/lik/selectMyAnswerList?orderType=1&pageIndex=1&pageSize=10&userId=530
  /// 个人主页-粉丝列表: https://gate.ieasydog.com/api/user/relation/selectAttentionMeById?pageIndex=1&pageSize=10&userId=1204&userLoginId=136899
  /// 个人主页-关注列表: https://gate.ieasydog.com/api/user/relation/selectMyAttention?pageIndex=1&pageSize=10&userId=1204&userLoginId=136899
  /// 保存用户信息: https://gate.ieasydog.com/api/user/userinfo/save
  /// {"sex":"M","nickname":"铲屎官06209417","userinfoId":139260}

  /// 我的收藏: user/collections/getMyCollectionsByCollectionType?collectionsType=0&pageIndex=1&pageSize=10&userId=136899
  /// 消息个数: https://gate.ieasydog.com/api/user/user/userMessageCount?userId=136899
  /// 系统消息列表: https://gate.ieasydog.com/api/user/sysMsg/selectPageOfUser?pageIndex=1&pageSize=10&userId=136899
  /// 系统消息详情: https://gate.ieasydog.com/api/user/messageLabel/getMessageAndReportBylabel?messageLabelId=393&orderType=1&pageIndex=1&pageSize=10&userLoginId=136899
  /// 系统消息标题: https://gate.ieasydog.com/api/user/messageLabel/getMessageLabelTopInfo?messageLabelId=393
  /// 消息-点赞列表: https://gate.ieasydog.com/api/user/user/selectAgreeList?pageIndex=1&pageSize=10&userId=136899
  /// 消息-收藏列表: https://gate.ieasydog.com/api/user/user/v2006/wjt/selectCollectList?pageIndex=1&pageSize=10&userId=136899
  /// 消息评论列表: https://gate.ieasydog.com/api/user/user/selectCommentList?pageIndex=1&pageSize=10&userId=136899
  /// 消息@我列表: https://gate.ieasydog.com/api/user/user/selectAtUserList?pageIndex=1&pageSize=10&userId=136899
}

