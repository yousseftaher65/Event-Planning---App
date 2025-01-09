class EventModel {
  static const String collectionName = 'events';
  String id;
  String image;
  String name;
  String title;
  String description;
  DateTime date;
  String time;
  String? location;
  bool isfavorite;

  EventModel({
    this.id = '',
    required this.image,
    required this.name,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    this.location,
    this.isfavorite = false,
  });

  EventModel.fromFirestore(Map<String, dynamic>? snapshot):
      this(
        id: snapshot!['id'],
        image: snapshot['image'],
        name: snapshot['name'],
        title: snapshot['title'],
        description: snapshot['description'],
        date: DateTime.fromMillisecondsSinceEpoch(snapshot['date']),
        time: snapshot['time'],
        location: snapshot['location'],
        isfavorite: snapshot['isfavorite'],
      );
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'title': title,
      'description': description,
      'date': date.millisecondsSinceEpoch,
      'time': time,
      'location': location,
      'isfavorite': isfavorite,
    };
  }
}