class Model{

  int? id;
  String? name;
  String? category;
  String? imageURL;
  String? oldPrice;
  String? price;


  Model(this.id, this.name, this.category, this.imageURL,
      this.oldPrice, this.price);

  Model.fromJson(Map<String,dynamic> json){
    name = json['name'];
    id = json['id'];
    category = json['category'];
    imageURL = json['imageUrl'];
    oldPrice = json['oldPrice'];
    price = json['price'];
  }
}