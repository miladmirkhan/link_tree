class User{//data model
  num id;
  String imageURL;
  String name;
  String title;
  String location;
  String bio;
  String github;
  String facebook;
  String phone;
  String email;
  User(this.id,this.imageURL,this.name,this.title,this.location,this.bio,this.github,this.facebook,this.phone,this.email);

static List<User> generateUsers(){
return 

[User(1,
 'https://scontent.ffor23-1.fna.fbcdn.net/v/t1.0-9/40652586_1417070448396703_6860767577375768576_n.jpg?_nc_cat=103&_nc_sid=09cbfe&_nc_ohc=Zj0lWBYDZ8kAX_OTXi2&_nc_ht=scontent.ffor23-1.fna&oh=9c660a21cc1c4662ac3928c0992bc8d2&oe=5F1EFE0D',
'milad Mirkhan Majeed',
'Software Enginner',
'soran-erbil',
'"Why do you need a bio? As said, it reveals and displays your life and career is major accomplishments. "',
"https://github.com/miladmirkhan",
"https://facebook.com",
"00964",
'msherwani92@gmail.com'),];
 }
 }