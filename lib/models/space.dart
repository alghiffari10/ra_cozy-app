class Space {
  late int id;
  late String name;
  late String imageUrl;
  late int price;
  late String city;
  late String country;
  late int rating;
  late String address;
  late String mapUrl;
  late String phone;
  late List photos;
  late int numberOfKitchens;
  late int numberOfBedrooms;
  late int numberOfCupBoards;
  Space({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.city,
    required this.country,
    required this.rating,
    required this.address,
    required this.mapUrl,
    required this.phone,
    required this.photos,
    required this.numberOfKitchens,
    required this.numberOfBedrooms,
    required this.numberOfCupBoards,
  });
  Space.fromJson(json) {
    id = json["id"];
    name = json["name"];
    city = json["city"];
    country = json["country"];
    imageUrl = json["image_url"];
    price = json["price"];
    rating = json["rating"];
    photos = json["photos"];
    address = json["address"];
    phone = json["phone"];
    mapUrl = json["map_url"];
    numberOfKitchens = json["number_of_kitchens"];
    numberOfBedrooms = json["number_of_bedrooms"];
    numberOfCupBoards = json["number_of_cupboards"];
  }
}
