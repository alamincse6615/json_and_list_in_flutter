class ProductDataModel{

  int? id;
  String? name;
  String? category;
  String? imageURL;
  String? oldPrice;
  String? price;
  ProductDataModel(this.id, this.name, this.category, this.imageURL,
      this.oldPrice, this.price);
  ProductDataModel.fromJson(Map<String, dynamic> abc){
    id = abc['id'];
    name = abc['name'];
    category = abc['category'];
    imageURL = abc['imageUrl'];
    oldPrice = abc['oldPrice'];
    price = abc['price'];
  }




















}