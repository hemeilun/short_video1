/// token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwaG9uZSI6IjEzNzk3MDM5MzIxIiwiZXhwIjoxNjU5NDMxODgxLCJpYXQiOjE2NTg4MjcwODEsInVzZXJJZCI6IjE1NDcxNzEyNzE1NTU1MjI1ODIifQ.MkxyALmhv36x_0Vny4nK8WmD9BjxbI1D5zPmiFpTsGM"
/// userInfo : {"id":"1547171271555522582","nickName":"会员.eyh52","phone":"13797039321","avatar":null,"status":1,"createTime":1658827081,"updateTime":null,"totalLikes":null,"totalFans":null,"totalAttention":null}

class UserEntity {
  UserEntity({
      this.token, 
      this.userInfo,});

  UserEntity.fromJson(dynamic json) {
    token = json['token'];
    userInfo = json['userInfo'] != null ? UserInfo.fromJson(json['userInfo']) : null;
  }
  String? token;
  UserInfo? userInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    if (userInfo != null) {
      map['userInfo'] = userInfo?.toJson();
    }
    return map;
  }

}

/// id : "1547171271555522582"
/// nickName : "会员.eyh52"
/// phone : "13797039321"
/// avatar : null
/// status : 1
/// createTime : 1658827081
/// updateTime : null
/// totalLikes : null
/// totalFans : null
/// totalAttention : null

class UserInfo {
  UserInfo({
      this.id, 
      this.nickName, 
      this.phone, 
      this.avatar, 
      this.status, 
      this.createTime, 
      this.updateTime, 
      this.totalLikes, 
      this.totalFans, 
      this.totalAttention,});

  UserInfo.fromJson(dynamic json) {
    id = json['id'];
    nickName = json['nickName'];
    phone = json['phone'];
    avatar = json['avatar'];
    status = json['status'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
    totalLikes = json['totalLikes'];
    totalFans = json['totalFans'];
    totalAttention = json['totalAttention'];
  }
  String? id;
  String? nickName;
  String? phone;
  dynamic avatar;
  int? status;
  int? createTime;
  dynamic updateTime;
  dynamic totalLikes;
  dynamic totalFans;
  dynamic totalAttention;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['nickName'] = nickName;
    map['phone'] = phone;
    map['avatar'] = avatar;
    map['status'] = status;
    map['createTime'] = createTime;
    map['updateTime'] = updateTime;
    map['totalLikes'] = totalLikes;
    map['totalFans'] = totalFans;
    map['totalAttention'] = totalAttention;
    return map;
  }

}