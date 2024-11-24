class productmodel {
  int? id;
  int? seller_id;
  int? brand_id;
  int? category_id;
  int? sub_category_id;
  int? inner_sub_category_id;
  String? name;
  String? description;
  String? main_image;
  String? price;
  String? discount;
  double? reviews_avg_rating;
  productmodel(
      {this.id,
      this.seller_id,
      this.brand_id,
      this.category_id,
      this.sub_category_id,
      this.inner_sub_category_id,
      this.name,
      this.description,
      this.main_image,
      this.price,
      this.discount,
      this.reviews_avg_rating});

  productmodel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    seller_id = json['seller_id'];
    brand_id = json['brand_id'];
    category_id = json['category_id'];
    sub_category_id = json['sub_category_id'];
    inner_sub_category_id = json['inner_sub_category_id'];
    name = json['name'];
    description = json['description'];
    main_image = json['main_image'];
    price = json['price'];
    discount = json['discount'] ?? "0";
    reviews_avg_rating = json['reviews_avg_rating'] ?? 0;
  }
}
