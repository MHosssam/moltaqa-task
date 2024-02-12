import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String mobile;
  final int isActive;
  final String createdAt;
  final String isoCode;
  final String countryKey;
  final String subscriptionType;
  final String sound;
  final String image;
  final int loginCount;
  final String lastLogin;
  final bool isVerified;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
    required this.isActive,
    required this.createdAt,
    required this.isoCode,
    required this.countryKey,
    required this.subscriptionType,
    required this.sound,
    required this.image,
    required this.loginCount,
    required this.lastLogin,
    required this.isVerified,
  });

  @override
  List<Object> get props => [
        id,
        name,
        email,
        mobile,
        isActive,
        createdAt,
        isoCode,
        countryKey,
        subscriptionType,
        sound,
        image,
        loginCount,
        lastLogin,
        isVerified,
      ];
}
