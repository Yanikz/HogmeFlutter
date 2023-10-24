class User {
  //initialized the user data models into null safety values
  int? id;
  String? firstname;
  String? lastname;
  String? contactnumber;
  String? facilitypicture;
  String? validid;
  String? email;
  String? password;

  String? token;

  //assigned the values
  User({
    this.id,
    this.firstname,
    this.lastname,
    this.contactnumber,
    this.facilitypicture,
    this.validid,
    this.email,
    this.password,
    this.token,
  });

  //convert the data format into json format
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user']['id'],
      firstname: json['user']['firstname'],
      lastname: json['user']['lastname'],
      contactnumber: json['user']['contactnumber'],
      facilitypicture: json['user']['facilitypicture'],
      validid: json['user']['validid'],
      email: json['user']['email'],
      password: json['user']['password'],
      token: json['user']['token'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "contactnumber": contactnumber,
        "facilitypicture": facilitypicture,
        "validid": validid,
        "email": email,
        "password": password,
        "token": token,
      };
}
