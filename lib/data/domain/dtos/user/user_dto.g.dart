// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
  id: (json['id'] as num).toInt(),
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  avatar: json['avatar'] as String,
  email: json['email'] as String,
  isOnline: json['isActive'] as bool? ?? true,
  walletAmount: (json['walletAmount'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
  'id': instance.id,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'email': instance.email,
  'avatar': instance.avatar,
  'isActive': instance.isOnline,
  'walletAmount': instance.walletAmount,
};
