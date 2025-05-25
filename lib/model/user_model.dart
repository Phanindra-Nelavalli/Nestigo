enum UserRole { tenant, landlord }

class UserModel {
  final String id;
  final String fullName;
  final String email;
  final String? phoneNumber;
  final String? avatarUrl;
  final UserRole role;
  final List<String>? ownedPropertyIds;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    this.phoneNumber,
    this.avatarUrl,
    required this.role,
    this.ownedPropertyIds,
  });

  static List<UserModel> dummyUsers = [
    UserModel(
      id: '1',
      fullName: "John Doe",
      email: "johndoe@gmail.com",
      role: UserRole.tenant,
    ),
    UserModel(
      id: '2',
      fullName: "Alex",
      email: "alex@gmail.com",
      role: UserRole.landlord,
      ownedPropertyIds: ['1', '2'],
    ),
  ];
}
