class Demand {
  final int id;
  final String title;
  final String blood_type;
  final String address1;
  final String address2;
  final String address3;
  final String city;
  final String country;
  final String demander_name;
  final String contact_name;
  final String contact_tel;
  final String notes;
  final String date_created;
  final String publish_date;
  final bool published;
  final bool status;
  final String author;

  Demand({
    required this.id,
    required this.title,
    required this.blood_type,
    required this.address1,
    required this.address2,
    required this.address3,
    required this.city,
    required this.country,
    required this.demander_name,
    required this.contact_name,
    required this.contact_tel,
    required this.notes,
    required this.date_created,
    required this.publish_date,
    required this.published,
    required this.status,
    required this.author,
  });

  getId() => id;
  getTitle() => title;
  getBloodType() => blood_type;
  getAddress1() => address1;
  getAddress2() => address2;
  getAddress3() => address3;
  getCity() => city;
  getCountry() => country;
  getDemanderName() => demander_name;
  getContactName() => contact_name;
  getContactTel() => contact_tel;
  getNotes() => notes;
  getDateCreated() => date_created;
  getPublishDate() => publish_date;
  getPublished() => published;
  getStatus() => status;
  getUser() => author;
}
