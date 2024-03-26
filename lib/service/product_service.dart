import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:widcy2/model/product.dart';
import 'package:widcy2/util/Constant.dart' as constant;

class ProductService {

  Future<List<Product>> loadProductList() async{
      try{
        Uri uri = Uri.http(constant.baseURL, "mshop/api/product.php");
        var response = await http.get(uri);
        if(response.statusCode == 200){
          print(response.body);
          var responseBody = convert.jsonDecode(response.body);
          List<Product>  productList = List<Product>.from(responseBody["data"].map((o) => Product.fromJson(o))).toList();
          return productList;
        }else{
          throw("Internal Server");
        }
      }catch (err){
          throw("Internal Server : $err");
      }
  }

  Future<Product> addNewProduct(Product product) async{
    try{
      Uri uri = Uri.http(constant.baseURL, "mshop/api/product.php");
      var headers = {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': '*/*'
      };
      var bodyReq = convert.jsonEncode(product);
      print(bodyReq);
      var res = await http.post(uri, headers: headers, body: bodyReq);
      print(res);
      if(res.statusCode == 200){
        print(res.body);
        var resBody = convert.jsonDecode(res.body);
        return Product.fromJson(resBody["data"]);
      }else{
        throw("Internal Server");
      }
    }catch (err){
      throw("Internal Server : $err ");
    }

  }
}