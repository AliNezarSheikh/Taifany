class vendormodel {
  String? logo;
  String? name;
  String? description;
  String? banner;
  String? instagram;
  String? facebook;
  String? twitter;
  String? snapchat;
  String? youtube;
  String? tiktok;
  String? slug;

  vendormodel(
      {this.logo,
      this.name,
      this.description,
      this.banner,
      this.instagram,
      this.facebook,
      this.twitter,
      this.snapchat,
      this.youtube,
      this.tiktok,
      this.slug}
      );
  vendormodel.fromJson(Map<String, dynamic> json) {
    logo = json['logo_image'];
    name = json['name'];
    description = json['description'];
    banner = json['banner_image'];
    instagram = json['instagram_link'];
    facebook = json['facebook_link'];
    twitter = json['twitter_link'];
    snapchat = json['snapchat_link'];
    youtube = json['youtube_link'];
    tiktok = json['tiktok_link'];
    slug = json['slug'];
  }
}
