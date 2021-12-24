import 'dart:convert';

class UserModel {
  final String uid;
  final String? displayName;
  final String? email;
  final String? profilePic;
  UserModel({
    required this.uid,
    this.displayName,
    this.email,
    this.profilePic,
  });

  UserModel copyWith({
    String? uid,
    String? displayName,
    String? email,
    String? profilePic,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      profilePic: profilePic ?? this.profilePic,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'displayName': displayName,
      'email': email,
      'profilePic': profilePic,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      displayName: map['displayName'],
      email: map['email'],
      profilePic: map['profilePic'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(uid: $uid, displayName: $displayName, email: $email, profilePic: $profilePic)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.uid == uid &&
      other.displayName == displayName &&
      other.email == email &&
      other.profilePic == profilePic;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
      displayName.hashCode ^
      email.hashCode ^
      profilePic.hashCode;
  }
}
