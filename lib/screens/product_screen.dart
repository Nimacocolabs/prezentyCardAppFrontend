import 'package:flutter/material.dart';
import 'package:prezenty_card_app/utils/app_helper.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [primaryColor, secondaryColor],
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: BackButton(color: Colors.white),
            title: const Text("Products"),
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [primaryColor, secondaryColor],
              ),
            ),
            child: TabBarView(children: [
              // LiveProductlistScreen(),
              // UpcomigProductlistScreen(),
              // ClosedProductlistScreen()
              Text("All"),
              Text("Deals"),
              Text("Offers"),
            ]),
          ),
        ));
  }
}
