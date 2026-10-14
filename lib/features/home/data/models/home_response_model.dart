// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class HomeResponseModel extends Equatable {
  final String id;
  final String title;
  const HomeResponseModel({required this.id, required this.title});

  HomeResponseModel copyWith({String? id, String? title}) {
    return HomeResponseModel(id: id ?? this.id, title: title ?? this.title);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'title': title};
  }

  factory HomeResponseModel.fromMap(Map<String, dynamic> map) {
    return HomeResponseModel(
      id: map['id'] as String,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeResponseModel.fromJson(String source) =>
      HomeResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, title];
}
