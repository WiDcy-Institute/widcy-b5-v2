import 'package:flutter/material.dart';
import 'package:widcy2/model/product.dart';
import 'package:widcy2/service/product_service.dart';

class ProductAddNewScreen extends StatefulWidget {

  const ProductAddNewScreen({super.key});

  @override
  State<ProductAddNewScreen> createState() => _ProductAddNewScreenState();
}

class _ProductAddNewScreenState extends State<ProductAddNewScreen> {



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TextButton(
            child: Text("TextButton"),
            onPressed: (){
              onSaveClick();
            },
          ),
          TextButtonTheme(
              data: TextButtonThemeData(
                style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.blue,
                textStyle: TextStyle(fontSize: 20),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
              child:  TextButton(
                onPressed: () {
                  // Button action goes here
                },
                child: Text('TextButton'),
              ),)
        ],
      ),
    );
  }

  void onSaveClick() async{
    Product productReq = Product(name : "ABC", nameKh: "ABC", price: "200",currency: "USD", image: "images/1710652027_54c9685cb1d21caa.jpeg");
    final productRes = await ProductService().addNewProduct(productReq);
    if(productRes.id == 0){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('Error'),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(2))),
          );
        },
      );
    }else{
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('Successs'),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(2))),
          );
        },
      );
    }
  }
}
