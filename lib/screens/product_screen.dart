import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prezenty_card_app/screens/deals_view_product.dart';
import 'package:prezenty_card_app/screens/offers_view_product.dart';
import 'package:prezenty_card_app/utils/app_helper.dart';
import 'all_view_product.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    String card_type=Get.arguments;
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              color: primaryColor,
            ),
            title: Text("Products"),
            elevation: 0,
            bottom: TabBar(
                unselectedLabelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: secondaryColor),
                tabs: [
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("All"),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Deals"),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Offers"),
                      ),
                    ),
                  ),
                ]),
          ),
          body: TabBarView(children: [
            AllViewProductList(cardType:card_type),
            DealsProductList(cardType:card_type),
            OffersProductList(cardType:card_type)
          ]),
        ));
  }
}
