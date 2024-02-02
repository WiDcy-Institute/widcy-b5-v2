
import 'package:flutter/foundation.dart';

class Product {

  late String? id;
  late String? name;
  late String? price;
  late String? image;

  Product(this.id, this.name, this.price, this.image);

  Map<String , dynamic> toJson(){
    return {
      "id" : id,
      "name" : name,
      "price": price,
      "image":image
    };
  }

  //  Product.fromJson(Map<String, dynamic> json){
  //     Product product = Product(json["id"], json["name"], json["price"], json["image"]);
  //     return product;
  // }
  
  Product.fromJson(Map<String, dynamic> json) : id = json["id"], name = json["name"], price = json["price"], image = json["image"];

}