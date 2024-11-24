class categoriesModel {
 String? name;
 String? image;
 int? id;
 categoriesModel({
  this.name,
  this.image,
  this.id
});
 categoriesModel.fromJson(Map<String, dynamic> data) {
  name = data['name'];
  image = data['image'];
  id = data['id'];
 }
}