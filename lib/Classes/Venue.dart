class Venue {
  String name;
  String subtitle;
  String description;
  String weekdayHours;
  String weekendHours;
  String image;
  String location;

  Venue({
    required this.name,
    required this.subtitle,
    required this.description,
    required this.weekdayHours,
    required this.weekendHours,
    required this.image,
    required this.location,
  });

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        name: json["name"],
        subtitle: json["Subtitle"],
        description: json["Description"],
        weekdayHours: json["Weekday_hours"],
        weekendHours: json["Weekend_hours"],
        image: json["Image"],
        location: json["Location"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "Subtitle": subtitle,
        "Description": description,
        "Weekday_hours": weekdayHours,
        "Weekend_hours": weekendHours,
        "Image": image,
        "Location": location,
      };
}
