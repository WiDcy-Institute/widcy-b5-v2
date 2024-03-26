
import 'package:flutter/material.dart';
import 'package:widcy2/model/product.dart';
import 'package:widcy2/service/product_service.dart';
import 'package:widcy2/widgets/app_search_bar.dart';
import 'package:widcy2/data/data.dart' as data;

class HomeScreen extends StatefulWidget {

   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  TextEditingController searchController = TextEditingController();


  List<String> searchResults = [];

  void onQueryChanged(String query) {
    setState(() {
      searchResults = data.subject
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  late TabController _tabController;
  int _currentTabIndex = 0;

  void _onTabChanged(int index) {
    setState(() {
      _currentTabIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: data.subject.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    List<Tab> tabList = data.subject.map((e) => Tab(text: e),).toList();
    List<Widget> tabBarViewList = data.subject.map((e) => HomeTab()).toList();
    
   
    return Scaffold(
      appBar: AppBar(
        title: Text("WiDcy Institute"),
        actions: [
          Icon(Icons.circle_notifications_outlined)
        ],
        centerTitle: false,
        ),
        body: Column(
          children: [
            // Padding(padding: EdgeInsets.only(left: 16, right: 16),
            //   child: Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text("Explore",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            //     Icon(Icons.settings)
            //   ],
            // ),
            // ),

            // SearchBar(onChanged : onQueryChanged,
            //   hintText: "Search...",
            //   trailing: [Padding(padding: EdgeInsets.only(right: 16),child: Icon(Icons.search), )],),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: searchResults.length,
            //     itemBuilder: (context, index) {
            //       return Card(
            //         elevation: 0.5,
            //         child: ListTile(
            //           leading: Icon(Icons.book),
            //           title: Text(searchResults[index]),
            //           trailing: Icon(Icons.navigate_next),
            //         ),
            //       );
            //     },
            //   ),
            // ),

            TabBar(
              // indicator: BoxDecoration(
              //   borderRadius: BorderRadius.circular(2),
              //   color: Colors.cyan
              // ),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
              isScrollable: true,
              tabs: tabList,
              onTap: _onTabChanged,
              labelPadding: EdgeInsets.all(16), // Remove padding around the labels
              controller: _tabController,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: tabBarViewList,
              ),
            ),
          ],
        )



        // FutureBuilder(
        //     future: ProductService().loadProductList(),
        //     builder: (BuildContext context,AsyncSnapshot<List<Product>> snapshot) {
        //         if(snapshot.connectionState == ConnectionState.done){
        //             if(snapshot.hasError){
        //                 return Center(
        //                   child: Text("Error ${snapshot.error}"),
        //                 );
        //             }else{
        //                   List<Product> productList = snapshot.data as List<Product>;
        //                   if(productList.isEmpty){
        //                 return Center(
        //                   child: Text("No data"),
        //                 );
        //                   }else{
        //
        //
        //                       return ListView.builder(
        //                         itemCount: productList.length,
        //                         itemBuilder: (context, index) {
        //
        //                            Product product = productList[index];
        //                            return Card(
        //                             elevation: 3,
        //                             child: ListTile(
        //                               title: Text("${product.name}"),
        //                               trailing: Text("${product.image}"),
        //                             ),
        //                            );
        //
        //                         },
        //                       );
        //                   }
        //             }
        //         }else{
        //             return Center(child: CircularProgressIndicator());
        //         }
        //     }),
    );
  }

  Widget get searchBarWidget{
    return SearchAnchor(
        builder: (BuildContext context, SearchController controller) {
          return SearchBar(
            controller: controller,
            // padding: MaterialStatePropertyAll<EdgeInsets>(
            //     EdgeInsets.symmetric(horizontal: 16.0)),
            onTap: () {
              controller.openView();
            },
            onChanged: (_) {
              controller.openView();
            },
            leading: Icon(Icons.search),
            trailing: <Widget>[
              Tooltip(
                message: 'Change brightness mode',
                child: IconButton(
                  isSelected: true,
                  onPressed: () {
                    setState(() {

                    });
                  },
                  icon: const Icon(Icons.wb_sunny_outlined),
                  selectedIcon: const Icon(Icons.brightness_2_outlined),
                ),
              )
            ],
          );
        }, suggestionsBuilder:
        (BuildContext context, SearchController controller) {
      return List<ListTile>.generate(5, (int index) {
        final String item = 'item $index';
        return ListTile(
          title: Text(item),
          onTap: () {
            setState(() {
              controller.closeView(item);
            });
          },
        );
      });
    }
    );
  }



}

class HomeTab extends StatelessWidget {

  





  @override
  Widget build(BuildContext context) {

  double widthSize = MediaQuery.of(context).size.width;

  List<Widget> cardListWidget = data.subject.map((e) => Card(
    elevation: 1,
    child: SizedBox(
      width: (widthSize / 2) - 40,
      height: 300,
       child: Column(children: [
        FadeInImage.assetNetwork(placeholder: "assets/img/default_image.jpg", image: "https://www.widcy-institute.com/wp-content/uploads/2023/11/399927046_728506162641065_2818228946556903479_n.jpg"),
        Text("$e")
       ]),
    ),
  )).toList();

  // List<Widget> cardList = List.generate(2, (index) => Card(
  //   elevation: 1,
  //   child: SizedBox(
  //     width: (widthSize / 2) - 10,
  //     height: 200,
  //      child: FadeInImage.assetNetwork(placeholder: "assets/img/default_image.jpg", image: "https://www.widcy-institute.com/wp-content/uploads/2023/11/399927046_728506162641065_2818228946556903479_n.jpg"),
  //   ),
  // )).toList();

    return Column(
      children: [
      Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: cardListWidget,
    ),
        // SizedBox(height: 10,),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: cardListWidget,
        // ),
        // SizedBox(height: 10,),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: cardListWidget,
        // )
      ],
    );
  }
}

class FavoritesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Favorites Tab',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Profile Tab',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}