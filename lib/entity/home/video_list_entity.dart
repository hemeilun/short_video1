/// list : [{"id":"60","userId":1547171271555522564,"nickName":"JDY2207181779默认用户","avatar":null,"deleted":0,"createTime":1658227079,"updateTime":1658227079,"likesCount":10,"commentCount":10,"title":"2342士大夫士大夫胜多负少","imgUrl":"https://cloud-res.obs.cn-east-3.myhuaweicloud.com:443/image/20220719/file/06f65f3a67844ffb98cccd385b640087.png","videoUrl":"https://cloud-res.obs.cn-east-3.myhuaweicloud.com:443/video/20220719/file/6f587dd836474605b89a354d49bef00b.mp4"}]
/// pageCurrent : 1
/// pageSize : 10
/// total : 5
/// hasNext : false
/// pages : 0

class VideoListEntity {
  VideoListEntity({
      this.list, 
      this.pageCurrent, 
      this.pageSize, 
      this.total, 
      this.hasNext, 
      this.pages,});

  VideoListEntity.fromJson(dynamic json) {
    if (json['list'] != null) {
      list = [];
      json['list'].forEach((v) {
        list?.add(VideoEntity.fromJson(v));
      });
    }
    pageCurrent = json['pageCurrent'];
    pageSize = json['pageSize'];
    total = json['total'];
    hasNext = json['hasNext'];
    pages = json['pages'];
  }
  List<VideoEntity>? list;
  int? pageCurrent;
  int? pageSize;
  int? total;
  bool? hasNext;
  int? pages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (list != null) {
      map['list'] = list?.map((v) => v.toJson()).toList();
    }
    map['pageCurrent'] = pageCurrent;
    map['pageSize'] = pageSize;
    map['total'] = total;
    map['hasNext'] = hasNext;
    map['pages'] = pages;
    return map;
  }

}

/// id : "60"
/// userId : 1547171271555522564
/// nickName : "JDY2207181779默认用户"
/// avatar : null
/// deleted : 0
/// createTime : 1658227079
/// updateTime : 1658227079
/// likesCount : 10
/// commentCount : 10
/// title : "2342士大夫士大夫胜多负少"
/// imgUrl : "https://cloud-res.obs.cn-east-3.myhuaweicloud.com:443/image/20220719/file/06f65f3a67844ffb98cccd385b640087.png"
/// videoUrl : "https://cloud-res.obs.cn-east-3.myhuaweicloud.com:443/video/20220719/file/6f587dd836474605b89a354d49bef00b.mp4"

class VideoEntity {
  VideoEntity({
      this.id, 
      this.userId, 
      this.nickName, 
      this.avatar, 
      this.deleted, 
      this.createTime, 
      this.updateTime, 
      this.likesCount, 
      this.commentCount, 
      this.title, 
      this.imgUrl, 
      this.videoUrl,});

  VideoEntity.fromJson(dynamic json) {
    id = json['id'];
    userId = json['userId'];
    nickName = json['nickName'];
    avatar = json['avatar'];
    deleted = json['deleted'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
    likesCount = json['likesCount'];
    commentCount = json['commentCount'];
    title = json['title'];
    imgUrl = json['imgUrl'];
    videoUrl = json['videoUrl'];
  }
  String? id;
  int? userId;
  String? nickName;
  dynamic avatar;
  int? deleted;
  int? createTime;
  int? updateTime;
  int? likesCount;
  int? commentCount;
  String? title;
  String? imgUrl;
  String? videoUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['userId'] = userId;
    map['nickName'] = nickName;
    map['avatar'] = avatar;
    map['deleted'] = deleted;
    map['createTime'] = createTime;
    map['updateTime'] = updateTime;
    map['likesCount'] = likesCount;
    map['commentCount'] = commentCount;
    map['title'] = title;
    map['imgUrl'] = imgUrl;
    map['videoUrl'] = videoUrl;
    return map;
  }

}