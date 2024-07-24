import 'package:collection/collection.dart';

class PostModel {
	int? userId;
	int? id;
	String? title;
	String? body;

	PostModel({this.userId, this.id, this.title, this.body});

	factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
				userId: json['userId'] as int?,
				id: json['id'] as int?,
				title: json['title'] as String?,
				body: json['body'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'userId': userId,
				'id': id,
				'title': title,
				'body': body,
			};

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! PostModel) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode =>
			userId.hashCode ^
			id.hashCode ^
			title.hashCode ^
			body.hashCode;
}
