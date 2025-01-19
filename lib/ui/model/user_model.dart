class UserModel {
  static const String collectionName = "users";
  String? name;
  String? email;
  String? id;
  String? image;
  UserModel({required this.name, required  this.email,required this.id ,  this.image = "",});

   // Safely create a UserModel from Firestore data
  factory UserModel.fromFirestore(Map<String, dynamic>? snapshot) {
    if (snapshot == null) {
      throw ArgumentError('Snapshot cannot be null');
    }

    return UserModel(
      name: snapshot['name'] ?? 'No Name', // Fallback for safety
      email: snapshot['email'] ?? 'No Email', // Fallback for safety
      image: snapshot['image'], // Allow null if no image is provided
      id: snapshot['id'],
    );
  }



  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'email': email,
      'id': id,
      if (image != null) 'image': image, // Include image only if it's not null
    };
  }
}
