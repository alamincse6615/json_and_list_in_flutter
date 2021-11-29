class ProductDataModel{
  //data Type
  int? id;
  String? name;
  String? category;
  String? imageURL;
  String? oldPrice;
  String? price;

  ProductDataModel(this.id, this.name,);





  ProductDataModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    name =json['name'];
    category = json['category'];
    imageURL = json['imageUrl'];
    oldPrice = json['oldPrice'];
    price = json['price'];
  }

}