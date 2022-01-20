class Donate {
  final int id;
  final String title;
  final String description;
  final String address;
  final String country;
  final String city;
  final String blood;
  final String telephone;
  final String date;
  final String userId;
  // final String userName;
  // final String userImage;
  // final String userEmail;

  Donate({
    required this.id,
    required this.title,
    required this.description,
    required this.address,
    required this.country,
    required this.city,
    required this.blood,
    required this.telephone,
    required this.date,
    required this.userId,
    // this.userName,
    // this.userImage,
    // this.userEmail,
  });

  getId() => id;
  getTitle() => title;
  getDescription() => description;
  getAddress() => address;
  getCountry() => country;
  getCity() => city;
  getBlood() => blood;
  getTelephone() => telephone;
  getDate() => date;
  getUserId() => userId;
  // getUserName() => userName;
  // getUserImage() => userImage;
  // getUserEmail() => userEmail;
}
