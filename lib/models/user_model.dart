class UserModel {
  final String message;
  final bool status;
  final User? users;

  UserModel({required this.message, required this.status, required this.users});

  factory UserModel.fromJson(Map<String, dynamic> json) {
  var userJson = json['user'];

  var user = User(
    id: userJson['id'] ?? 0,
    userName: userJson['userName'] ?? "",
    password: userJson['password'] ?? "",
    confirmPassword: userJson['confirmPassword'] ?? "",
    email: userJson['email'] ?? "",
    bio: userJson['bio'] ?? "",
  );

  return UserModel(
    message: json["message"] ?? "",
    status: json["status"] ?? false,
    users: user,
  );
}

}

class User {
  final String? userName;
  final String? password;
  final String? confirmPassword;
  final int? id;
  final String? email;
  final String? bio;

  User({
    required this.id,
    required this.userName,
    required this.password,
    required this.confirmPassword,
    required this.email,
    required this.bio,
  });
}
