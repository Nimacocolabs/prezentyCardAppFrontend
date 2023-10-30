import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prezenty_card_app/models/view_products.dart';
import 'package:prezenty_card_app/network/api_provider.dart';
import 'package:prezenty_card_app/network/apis.dart';
import 'package:prezenty_card_app/utils/app_helper.dart';

class AllViewProductList extends StatefulWidget {
  AllViewProductList( {required this.cardType});
  final String cardType;

  @override
  _AllViewProductListState createState() =>
      _AllViewProductListState();
}

class _AllViewProductListState extends State<AllViewProductList> {
  List<Data> products = [];
  String? nextPageUrl;
  ApiProvider apiProvider = ApiProvider();
  late ApiProvider apiClient;
  @override
  void initState() {
    super.initState();
    apiClient = ApiProvider();
    fetchData(); // Initialize apiClient here
  }

  @override
  AuthRepository() {
    apiClient = ApiProvider();
  }

  @override
  Future<void> fetchData() async {
    final response = await apiClient
        .getJsonInstance()
        .post(nextPageUrl ?? Apis.ViewProduct, data: {"cardType": widget.cardType});
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

  String query = "";
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
    return Column(
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
            itemCount: filterProducts(query).length,
            itemBuilder: (context, index) {
              final product = filterProducts(query)[index];
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  color:Colors.grey[400],
                  child: ListTile(
                    leading:  Container(
                      height: 70,
                      width: 70,
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          imageUrl: '${product.productThumbnail}',
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) => ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/dp.png'),
                              // height: 60,
                              // width: 60,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      "${product.productName}",
                      style: const TextStyle(fontSize: 18,color: Colors.black),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '\$${product.price?.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 18,
                                decoration: TextDecoration.lineThrough,
                                color: Colors.red,
                              ),
                            ),
                            SizedBox(width: 5,),
                            Text(
                              '\$${product.offerPrice?.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        product.availability =="In stock" || product.availability =="In Stock"?
                        Text(
                          '${product.availability}',
                          style: TextStyle(fontSize: 18,color: Colors.green),
                        ) :
                        Text(
                          '${product.availability}',
                          style: TextStyle(fontSize: 18,color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
