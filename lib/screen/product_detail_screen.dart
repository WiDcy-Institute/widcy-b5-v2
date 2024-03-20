import 'package:flutter/material.dart';
import 'package:widcy2/model/product.dart';

class ProductDetailScreen extends StatefulWidget {

  late Product product;

  ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {


  @override
  Widget build(BuildContext context) {

    Product product =  widget.product;

    return Scaffold(
      appBar: AppBar(
        title: Text("Producut Detail"),
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage("http://ec2-52-77-234-132.ap-southeast-1.compute.amazonaws.com/mshop/${product.image}"),
          placeholder: AssetImage("assets/img/default_image.jpeg"),
        ),
      ),
    );
  }
}
