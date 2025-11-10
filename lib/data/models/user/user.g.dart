// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: (json['id'] as num).toInt(),
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  avatar: json['avatar'] as String,
  email: json['email'] as String,
  isOnline: json['isActive'] as bool? ?? true,
  walletAcount: (json['wallet_amount'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'email': instance.email,
  'avatar': instance.avatar,
  'isActive': instance.isOnline,
  'wallet_amount': instance.walletAcount,
};
