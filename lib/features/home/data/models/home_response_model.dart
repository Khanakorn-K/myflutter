import 'package:equatable/equatable.dart';

class HomeResponseModel extends Equatable {
  final String? id;
  final String? title;

  const HomeResponseModel({
    this.id,
    this.title,
  });

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) {
    return HomeResponseModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, title];
}