import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finmanageapp/core/util/enums.dart';
import 'package:finmanageapp/core/util/params/description_params.dart';

class DescriptionEntity {
  String? id;
  final String textUpper;
  final String text;
  final String userId;
  final TransactionType type;

  DescriptionEntity(
      {this.id,
      required this.textUpper,
      required this.text,
      required this.userId,
      required this.type});

  factory DescriptionEntity.fromJson(Map<String, dynamic> json) {
    return DescriptionEntity(
        textUpper: json['textUpper'],
        text: json['text'],
        userId: json['userId'],
        type: TransactionType.values
            .firstWhere((type) => type.name == json['type']));
  }

  Map<String, dynamic> toJson() => {
        'textUpper': textUpper,
        'text': text,
        'userId': userId,
        'type': type.name
      };

  factory DescriptionEntity.fromDocument(DocumentSnapshot doc) {
    final description =
        DescriptionEntity.fromJson(doc.data() as Map<String, dynamic>);
    description.id = doc.id;

    return description;
  }

  factory DescriptionEntity.fromParams(
      String userId, CreateDescriptionParams params) {
    return DescriptionEntity(
        textUpper: params.description.toUpperCase(),
        text: params.description,
        userId: userId,
        type: params.type);
  }
}
