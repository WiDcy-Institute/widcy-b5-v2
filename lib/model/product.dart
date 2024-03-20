
class Product {

  late String? id;
  late String? name;
  late String? nameKh;
  late String? price;
  late String? currency;
  late String? image;

  Product({this.id, this.name, this.nameKh, this.price, this.currency, this.image});

  Map<String , dynamic> toJson(){
    return {
      "id" : id,
      "name" : name,
      "nameKh": nameKh,
      "price": price,
      "currency": currency,
      "image":image
    };
  }

  factory Product.fromJson(Map<String,dynamic> json){
    String id = json["id"];
    String name = json["name"];
    String nameKh = json["name_km"];
    String price = json["price"];
    String currency = json["currency"];
    String image = json["image"];
    Product products = Product(id : id, name : name, nameKh: nameKh, price: price,currency: currency, image : image);
    return products;
  }


// Product.fromJson(Map<String, dynamic> json) : id = json["id"], name = json["name"], price = json["price"], image = json["image"];

}