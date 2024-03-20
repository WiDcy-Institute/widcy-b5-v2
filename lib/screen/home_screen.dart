
import 'package:flutter/material.dart';
import 'package:widcy2/model/product.dart';
import 'package:widcy2/service/product_service.dart';
import 'package:widcy2/widgets/app_search_bar.dart';

class HomeScreen extends StatefulWidget {

   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  TextEditingController searchController = TextEditingController();


  List<String> data = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Elderberry',
    'Fig',
    'Grapes',
    'Honeydew',
    'Kiwi',
    'Lemon',
  ];

  List<String> searchResults = [];

  void onQueryChanged(String query) {
    setState(() {
      searchResults = data
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
    _tabController = TabController(length: data.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    List<Tab> tabList = data.map((e) => Tab(text: e),).toList();
    List<Widget> tabBarViewList = data.map((e) => HomeTab()).toList();
    
   
    return Scaffold(
        body: Column(
          children: [
            Padding(padding: EdgeInsets.only(left: 16, right: 16),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Explore",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                Icon(Icons.settings)
              ],
            ),),

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

  List<Widget> cardList = List.generate(10, (index) => Card(
    elevation: 2,
    child: SizedBox(
      width: 100,
      height: 200,
      // child: FadeInImage.assetNetwork(placeholder: "assets/img/widcy1.jpg", image: "https://cdn.britannica.com/83/78183-004-345353F4/Stack-books.jpg"),
      child : Image.asset("gw-ob-nonprod-apim.kbprasacbank.com.kh")
    ),
  )).toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: cardList,
    ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: cardList,
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: cardList,
        )
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