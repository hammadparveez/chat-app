import 'dart:convert';

class ChatModel {
  final String userID;
  final String messageID;
  final String  message;
  final String  date;
  final String? displayName;
  final String?  attachment;
  final String? profilePic;
  final bool isSender;
  ChatModel({
    required this.userID,
    required this.messageID,
    required this.message,
    required this.date,
    this.displayName,
    this.attachment,
    this.profilePic,
    required this.isSender,
  });

  ChatModel copyWith({
    String? userID,
    String? messageID,
    String? message,
    String? date,
    String? displayName,
    String? attachment,
    String? profilePic,
    bool? isSender,
  }) {
    return ChatModel(
      userID: userID ?? this.userID,
      messageID: messageID ?? this.messageID,
      message: message ?? this.message,
      date: date ?? this.date,
      displayName: displayName ?? this.displayName,
      attachment: attachment ?? this.attachment,
      profilePic: profilePic ?? this.profilePic,
      isSender: isSender ?? this.isSender,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'messageID': messageID,
      'message': message,
      'date': date,
      'displayName': displayName,
      'attachment': attachment,
      'profilePic': profilePic,
      'isSender': isSender,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      userID: map['userID'] ?? '',
      messageID: map['messageID'] ?? '',
      message: map['message'] ?? '',
      date: map['date'] ?? '',
      displayName: map['displayName'],
      attachment: map['attachment'],
      profilePic: map['profilePic'],
      isSender: map['isSender'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) => ChatModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChatModel(userID: $userID, messageID: $messageID, message: $message, date: $date, displayName: $displayName, attachment: $attachment, profilePic: $profilePic, isSender: $isSender)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ChatModel &&
      other.userID == userID &&
      other.messageID == messageID &&
      other.message == message &&
      other.date == date &&
      other.displayName == displayName &&
      other.attachment == attachment &&
      other.profilePic == profilePic &&
      other.isSender == isSender;
  }

  @override
  int get hashCode {
    return userID.hashCode ^
      messageID.hashCode ^
      message.hashCode ^
      date.hashCode ^
      displayName.hashCode ^
      attachment.hashCode ^
      profilePic.hashCode ^
      isSender.hashCode;
  }
}


/* 
  userID,
  displayName, (nullable)
  messageID,
  message,
  attachment (nullable)
  date,
  isSender,
  profilePic , (nullable)

 */