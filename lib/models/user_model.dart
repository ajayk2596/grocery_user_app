class UserModel {
  String? uid;
  String? uname;
  String? uemail;
  String? phone;
  String? passWord;
  String? profilePicture;

  UserModel({this.uid, this.uname, this.phone, this.uemail, this.profilePicture});

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    uname = json['uname'];
    uemail = json['uemail'];
    phone = json['phone'];
    passWord = json['passWord'];
    profilePicture = json['profilePicture'];
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'uname': uname,
      'uemail': uemail,
      'phone': phone,
      'passWord': passWord,
      'profilePicture': profilePicture,
    };
  }
}
