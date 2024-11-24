class subcatmodel {
  String? name;
  String? image;
  String? slug;
  int? id;

  subcatmodel({this.name, this.image, this.id,this.slug});


  subcatmodel.fromJson(Map<String, dynamic> data) {
    name = data['name'];
    image = data['image'];
    id = data['id'];
    slug = data['slug'];
  }


}
