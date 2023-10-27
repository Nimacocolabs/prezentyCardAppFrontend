import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prezenty_card_app/models/view_products.dart';
import 'package:prezenty_card_app/network/api_provider.dart';
import 'package:prezenty_card_app/network/apis.dart';

class PaginatedProductList extends StatefulWidget {
  @override
  _PaginatedProductListState createState() => _PaginatedProductListState();
}

class _PaginatedProductListState extends State<PaginatedProductList> {
  List<Data> products = [];
  String? nextPageUrl;
  ApiProvider apiProvider = ApiProvider();
  late ApiProvider apiClient;
  @override
  void initState() {
    super.initState();
    apiClient = ApiProvider();
    fetchData();// Initialize apiClient here
  }

  @override
  AuthRepository() {
    apiClient = ApiProvider();
  }

  @override
  Future<void> fetchData() async {
    final response = await apiClient
            .getJsonInstance()
            .post(nextPageUrl??Apis.ViewProduct, data: {"cardType":"apl"});
    if (response.statusCode == 200) {
      final data = response.data;
      nextPageUrl = data['next_page_url'];
      final List<Data> newProducts =
      List.from(data['data'].map((item) => Data.fromJson(item)));
      setState(() {
        products.addAll(newProducts);
      });
    }
  }
String query="";
  // Future<List<Map<String, dynamic>>> performSearchApi() async {
  //
  //   final response =
  //   await apiClient.getJsonInstance().post(Apis.ViewProduct, data: {"cardType":"apl","search":_searchController.text});
  //   print("res-?${response}");
  //   if (response.statusCode == 200) {
  //     final  data = response.data;
  //     print("ghjh->${data}");
  //     final List<Map<String, dynamic>> cards = List.from(data['card']);
  //     return cards;
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }
  // void performSearch() async {
  //   try {
  //     final results = await performSearchApi();
  //     print("res->${results}");
  //     setState(() {
  //       //searchResults = results;
  //       //  print("res->${searchResults}");
  //     });
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }

  TextEditingController _searchController = TextEditingController();
  // Future<void> fetchData() async {
  //   if (nextPageUrl == null) {
  //     // Initial data fetch
  //     final response = await apiClient
  //         .getJsonInstance()
  //         .post(Apis.ViewProduct, data: {"cardType":"apl"});
  //     final data=response.data;
  //     print("oppo>${data}");
  //    nextPageUrl = data["next_page_url"];
  //   // final List<Data> newProducts = products));
  //     setState(() {
  //    //  products.addAll(newProducts);
  //     });
  //   } else {
  //     // Fetch data for the next page
  //     final response = await http.get(nextPageUrl! as Uri);
  //     final data = json.decode(response.body);
  //     nextPageUrl = data['next_page_url'];
  //     final List<Data> newProducts = List.from(data['data'].map((item) => products));
  //     setState(() {
  //       products.addAll(newProducts);
  //     });
  //   }
  // }
  List<Data> filterProducts(String query) {
    return products.where((product) {
      return product.productName!.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: Column(
        children: [
      Center(
      child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
       controller: _searchController,
        decoration: InputDecoration(
          labelText: 'Search',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onChanged: (value) {
          setState(() {
            query = value;
          });

        },
      ),
    ),
    ),

          Expanded(
              child: ListView.builder(
                itemCount:filterProducts(query).length,
                itemBuilder: (context, index) {
                  final product = filterProducts(query)[index];
                  return ListTile(
                    leading:
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: Container(
                        width: 100,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage("${product.productThumbnail}"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    title: Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: Text("${product.productName}",style: const TextStyle(fontSize: 18),),
                    ),

                  subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(
                  '\$${product.offerPrice?.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 18,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  ),
                  ),
                  Text(
                  '\$${product.price?.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 18,
                  decoration: TextDecoration.lineThrough,
                  color: Colors.red,
                  ),
                  ),
                  // Text(
                  // 'Save \$${(product.price! - product!.discountPrice).toStringAsFixed(2)}',
                  // style: TextStyle(
                  // color: Colors.green,
                  // ),
                  // ),
                  Text(
                  'Availability: ${product.availability}',style: TextStyle(fontSize: 18),
                  ),
                  ],
                  ),

                  );
                },

            ),
          ),
        ],
      ),
      // bottomNavigationBar: nextPageUrl != null
      //     ? ElevatedButton(
      //   onPressed: fetchData,
      //   child: Text('Load More'),
      // )
      //     : null,
    );
  }
}


