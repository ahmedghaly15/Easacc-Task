import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
sealed class UserModel with _$UserModel {
  @JsonSerializable()
  const factory UserModel({
    String? userId,
    String? email,
    String? accessToken,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.empty() =>
      const UserModel(userId: '', email: '', accessToken: '');

  factory UserModel.fromSession(Session session) => UserModel(
    userId: session.user.id,
    email: session.user.email,
    accessToken: session.accessToken,
  );
}
