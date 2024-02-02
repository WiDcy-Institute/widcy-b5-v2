
import 'package:flutter/material.dart';
import 'package:widcy2/product.dart';
import 'package:widcy2/product_service.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        body: FutureBuilder(
            future: ProductService().loadProductList(),
            builder: (BuildContext context,AsyncSnapshot<List<Product>> snapshot) {
                if(snapshot.connectionState == ConnectionState.done){
                    if(snapshot.hasError){
                        return Center(
                          child: Text("Error ${snapshot.error}"),
                        );
                    }else{
                          List<Product> productList = snapshot.data as List<Product>;
                          if(productList.isEmpty){
                        return Center(
                          child: Text("No data"),
                        );
                          }else{

              
                              return ListView.builder(
                                itemCount: productList.length,
                                itemBuilder: (context, index) {

                                   Product product = productList[index];
                                   return Card(
                                    elevation: 3,
                                    child: ListTile(
                                      title: Text("${product.name}"),
                                      trailing: Text("${product.image}"),
                                    ),
                                   );

                                },
                              );
                          }
                    }
                }else{
                    return Center(child: CircularProgressIndicator());
                }
            }),
    );
  }
}