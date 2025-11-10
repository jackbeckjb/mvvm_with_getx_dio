import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int id;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  final String email;
  final String avatar;
  @JsonKey(name: 'isActive', defaultValue: true)
  final bool isOnline;
  @JsonKey(name: 'wallet_amount', defaultValue: 0.0)
  final double? walletAcount;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.avatar,
    required this.email,
    required this.isOnline,
    this.walletAcount,
  });

  // This command runs the Dart build_runner to automatically generate code for
  // JSON serialization and deserialization (fromJson and toJson functions)
  // for classes annotated with json_serializable.
  // The `watch` option keeps it running and updates generated files automatically
  // when source files change.
  // The `--delete-conflicting-outputs` flag ensures that any old generated files
  // that conflict with new ones are removed before generating new code.
  // ================================================================
  //  RUN THIS COMMAND TO GENERATE fromJson/toJson:
  //  dart run build_runner watch --delete-conflicting-outputs
  // ================================================================
  //                        OR
  // ================================================================
  //  Or RUN THIS COMMAND TO GENERATE fromJson/toJson:
  //  # One-time generation
  //  flutter pub run build_runner build --delete-conflicting-outputs
  // ================================================================
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
