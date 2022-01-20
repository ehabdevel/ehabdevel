class User {
  final String username;
  final String firstName;

  User({
    required this.username,
    required this.firstName,
  });

  getUsername() => username;
  getFirstName() => firstName;
}
