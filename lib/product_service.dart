import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:widcy2/product.dart';


class ProductService {

  final String productUrl = "http://ec2-54-151-131-128.ap-southeast-1.compute.amazonaws.com/products_api.php";

  Future<List<Product>> loadProductList() async{
      var url = Uri.parse(productUrl);
      try{
        var response = await http.get(url);
        if(response.statusCode == 200){
          var responseBody = jsonDecode(response.body);
          List<Product>  productList = responseBody.map((o) => Product.fromJson(o)).toList();
          return productList;
        }else{
          throw("Internal Server");
        }
      }catch (err){
          throw("Internal Server : $err");
      } 
  }

}