import 'package:cloud_firestore/cloud_firestore.dart';

class  GeneralUser{//data model
  String? id;
  String? imageURL;
  String? name;
  String? title;
  String? location;
  String? bio;
  String? github;
  String? facebook;
  String? instagram;
  String? linkedIn;
  String? stackOverFlow;
  String? phone;
  String? email;
   GeneralUser({this.id,this.imageURL,this.name,this.title,this.location,this.bio,this.github,this.facebook,this.instagram,this.linkedIn,this.stackOverFlow,this.phone,this.email});

//from map
   factory GeneralUser.fromMap(Map<String,dynamic>json)=>GeneralUser(
     id: json["id"],
      imageURL:json["imageURL"],
      name: json["name"],
      title: json["title"],
      location: json["location"],
      bio: json["bio"],
      github: json["github"],
      facebook: json["facebook"],
      instagram: json["instagram"],
      linkedIn:json["linkedIn"] ,
      stackOverFlow: json["stackOverFlow"],
      phone: json["phone"],
      email: json["email"]
     );

  // toMap()
  Map<String, dynamic> toMap() => {
        "id": id,
        "imageURL": imageURL,
        "name": name,
        "title": title,
        "location": location,
        "bio": bio,
        "github": github,
        "facebook": facebook,
        "instagram": instagram,
        "linkIn": linkedIn,
        "stackOverflow": stackOverFlow,
        "phone": phone,
        "email": email,
      };

}