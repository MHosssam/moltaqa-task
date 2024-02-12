import 'package:task/features/alerts/domain/entities/alerts.dart';

class AlertModel {
  List<Alerts>? data;
  Links? links;
  int? status;

  AlertModel({this.data, this.links, this.status});

  AlertModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Alerts>[];
      json['data'].forEach((v) {
        data!.add(Alerts.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      data['links'] = links!.toJson();
    }
    data['status'] = status;
    return data;
  }
}

class Links {
  String? first;
  String? last;
  String? prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});
  bool checkIfMore() => next != null;
  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first'] = first;
    data['last'] = last;
    data['prev'] = prev;
    data['next'] = next;
    return data;
  }
}
