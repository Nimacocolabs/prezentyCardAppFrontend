import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prezenty_card_app/models/view_products.dart';
import 'package:prezenty_card_app/network/api_provider.dart';
import 'package:prezenty_card_app/network/apis.dart';


class OffersProductList extends StatefulWidget {
  OffersProductList( {required this.cardType});
  final String cardType;


  @override
  _OffersProductListState createState() =>
      _OffersProductListState();
}

class _OffersProductListState extends State<OffersProductList> {
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
        .post(nextPageUrl ?? Apis.ViewOfferssProduct, data: {"cardType": widget.cardType});
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

  TextEditingController _searchController = TextEditingController();

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
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 250,
                    childAspectRatio: 4.8 / 5.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: filterProducts(query).length,
                itemBuilder: (BuildContext ctx, index) {
                  final product = filterProducts(query)[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    elevation: 3.0,
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.12,
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl: '${product.productThumbnail}',
                              placeholder: (context, url) => Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) => ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image(
                                  image: AssetImage('assets/images/no_data.png'),
                                  // height: 60,
                                  // width: 60,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, left: 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "${product.productName}",
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "₹${product.price?.toStringAsFixed(2)}",
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontSize: 16,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "₹${product.offerPrice?.toStringAsFixed(2)}",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 7,
                            )
                          ],
                        ),
                        product.availability == "In stock" ||
                            product.availability == "In Stock"
                            ? Padding(
                          padding: EdgeInsets.only(top: 5, left: 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              '${product.availability}',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.green),
                            ),
                          ),
                        )
                            : Padding(
                          padding: EdgeInsets.only(top: 5, left: 5),
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                '${product.availability}',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.red),
                              )),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
        SizedBox(height: 10,)
      ],
    );
  }
}
