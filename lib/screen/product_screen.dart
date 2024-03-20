import 'package:flutter/material.dart';
import 'package:widcy2/model/product.dart';
import 'package:widcy2/screen/product_add_new_screen.dart';
import 'package:widcy2/screen/product_detail_screen.dart';
import 'package:widcy2/service/product_service.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  // late Future<List<Product>> productList;

  @override
  void initState() {
    super.initState();
    // loadProductList();
  }

  void loadProductList() async {
    var productList = await ProductService().loadProductList();
    setState(() {
      productList = productList;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
        elevation: 5,
        // leading: Image.asset("assets/img/widcy_logo.jpg"),
        actions: [
          GestureDetector(
            child: Icon(Icons.add),
            onTap: (){
              final route = MaterialPageRoute(builder: (context) => ProductAddNewScreen());
              Navigator.push(context, route);
            },
          )
        ],
      ),
      body: FutureBuilder<List<Product>>(
        future: ProductService().loadProductList(),
        builder: (BuildContext context, AsyncSnapshot<List<Product>> asyncSnapshot){
          if(asyncSnapshot.connectionState == ConnectionState.done){
              if(asyncSnapshot.hasError){
                return Center(
                  child: Text("Error : ${asyncSnapshot.error}"),
                );
              }
              if(!asyncSnapshot.hasData){
                return Center(
                  child: Text("No Data"),
                );
              }
              List<Product> products = asyncSnapshot.data as List<Product>;

              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, int indexItem){

                  Product product = products[indexItem];

                  return GestureDetector(
                    child: Card(
                      elevation: 5,
                      child: ListTile(
                        title: Text(product.name!),
                        subtitle: Text("${product.price} ${product.currency}"),
                        leading: FadeInImage(
                          image: NetworkImage("http://ec2-52-77-234-132.ap-southeast-1.compute.amazonaws.com/mshop/${product.image}"),
                          placeholder: AssetImage("assets/img/default_image.jpeg"),
                        ),
                        trailing: Icon(Icons.navigate_next),
                      ),
                    ),
                    onTap: (){
                      final route = MaterialPageRoute(builder: (context) => ProductDetailScreen(product: product,));
                      Navigator.push(context, route);
                    },
                  );
                },
              );
          }else{
            return Center(
              child: Text("Error : ${asyncSnapshot.error}"),
            );
          }
        },
      ),
    );
  }
}
