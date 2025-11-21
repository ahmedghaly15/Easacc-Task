import 'package:freezed_annotation/freezed_annotation.dart';

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
}
