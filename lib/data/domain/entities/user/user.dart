// CANONICAL MODEL OWN BUSINESS LOGIC
class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String avatar;
  final bool isOnline;
  final double? walletAmount;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.avatar,
    required this.email,
    required this.isOnline,
    this.walletAmount,
  });

  // HERE IS LOGIC
  bool get isPremiumUser => (walletAmount ?? 0) > 100;
  String get displayName => '$firstName $lastName';
}
