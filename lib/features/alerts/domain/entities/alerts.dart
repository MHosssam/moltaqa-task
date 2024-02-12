class Alerts {
  int? id;
  int? senderId;
  String? senderName;
  String? status;
  String? avatar;
  String? reminderStatus;
  String? type;
  String? title;
  String? sendDate;
  String? sendTime;
  String? createdAt;
  // List<Receiver>? receiver;

  Alerts({
    this.id,
    this.senderId,
    this.senderName,
    this.status,
    this.avatar,
    this.reminderStatus,
    this.type,
    this.title,
    this.sendDate,
    this.sendTime,
    this.createdAt,
    // this.receiver,
  });

  Alerts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderId = json['sender_id'];
    senderName = json['sender_name'];
    status = json['status'];
    avatar = json['avatar'];
    reminderStatus = json['reminder_status'];
    type = json['type'];
    title = json['title'];
    sendDate = json['send_date'];
    sendTime = json['send_time'];
    createdAt = json['created_at'];
    // if (json['receiver'] != null) {
    //   receiver = <Receiver>[];
    //   json['receiver'].forEach((v) {
    //     receiver!.add(Receiver.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sender_id'] = senderId;
    data['sender_name'] = senderName;
    data['status'] = status;
    data['avatar'] = avatar;
    data['reminder_status'] = reminderStatus;
    data['type'] = type;
    data['title'] = title;
    data['send_date'] = sendDate;
    data['send_time'] = sendTime;
    data['created_at'] = createdAt;
    // if (receiver != null) {
    //   data['receiver'] = receiver!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

// class Receiver {
//   int? id;
//   String? name;
//   String? avatar;
//   String? stauts;
//   int? chatId;
//   String? createdAt;
//
//   Receiver({this.id, this.name, this.avatar, this.stauts, this.chatId, this.createdAt});
//
//   Receiver.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     avatar = json['avatar'];
//     stauts = json['stauts'];
//     chatId = json['chat_id'];
//     createdAt = json['created_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['avatar'] = avatar;
//     data['stauts'] = stauts;
//     data['chat_id'] = chatId;
//     data['created_at'] = createdAt;
//     return data;
//   }
// }
