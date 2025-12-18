// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] as String,
  email: json['email'] as String,
  username: json['username'] as String,
  fullName: json['fullName'] as String,
  phoneNumber: json['phoneNumber'] as String?,
  profileImageUrl: json['profileImageUrl'] as String?,
  isEmailVerified: json['isEmailVerified'] as bool,
  authProvider: json['authProvider'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  lastLoginAt: json['lastLoginAt'] == null
      ? null
      : DateTime.parse(json['lastLoginAt'] as String),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'username': instance.username,
  'fullName': instance.fullName,
  'phoneNumber': instance.phoneNumber,
  'profileImageUrl': instance.profileImageUrl,
  'isEmailVerified': instance.isEmailVerified,
  'authProvider': instance.authProvider,
  'createdAt': instance.createdAt.toIso8601String(),
  'lastLoginAt': instance.lastLoginAt?.toIso8601String(),
};
