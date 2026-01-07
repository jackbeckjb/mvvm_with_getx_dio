import 'package:structure_mvvm/data/domain/dtos/user/user_dto.dart';
import 'package:structure_mvvm/data/domain/entities/user/user.dart';

class UserMapper {
  static User formUserDto(UserDto dto) {
    return User(
      id: dto.id,
      firstName: dto.firstName,
      lastName: dto.lastName,
      avatar: dto.avatar,
      email: dto.email,
      isOnline: dto.isOnline,
      walletAmount: dto.walletAmount,
    );
  }
}


// use can make it as extension as well
// extension UserMapper on UserFlatDto {
//   User toDomain() {
//     return User(
//       id: id,
//       firstName: firstName,
//       lastName: lastName,
//       walletAmount: walletAmount,
//     );
//   }
// }