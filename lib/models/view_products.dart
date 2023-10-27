class ViewProducts {
  List<Data>? data;
  int? total;
  int? perPage;
  int? currentPage;
  int? lastPage;
  String? nextPageUrl;
  Null? prevPageUrl;

  ViewProducts(
      {this.data,
        this.total,
        this.perPage,
        this.currentPage,
        this.lastPage,
        this.nextPageUrl,
        this.prevPageUrl});

  ViewProducts.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    total = json['total'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    lastPage = json['last_page'];
    nextPageUrl = json['next_page_url'];
    prevPageUrl = json['prev_page_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['per_page'] = this.perPage;
    data['current_page'] = this.currentPage;
    data['last_page'] = this.lastPage;
    data['next_page_url'] = this.nextPageUrl;
    data['prev_page_url'] = this.prevPageUrl;
    return data;
  }
}

class Data {
  int? id;
  String? productName;
  int? price;
  int? offerPrice;
  String? category;
  String? subCategory;
  String? quantity;
  String? description;
  String? availability;
  String? taxInfo;
  String? productThumbnail;
  String? image;
  String? createdAt;
  String? updatedAt;
 // double? discountPrice;

  Data(
      {this.id,
        this.productName,
        this.price,
        this.offerPrice,
        this.category,
        this.subCategory,
        this.quantity,
        this.description,
        this.availability,
        this.taxInfo,
        this.productThumbnail,
        this.image,
        this.createdAt,
        this.updatedAt,
        //this.discountPrice
      });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    price = json['price'];
    offerPrice = json['offer_price'];
    category = json['category'];
    subCategory = json['sub_category'];
    quantity = json['quantity'];
    description = json['description'];
    availability = json['availability'];
    taxInfo = json['tax_info'];
    productThumbnail = json['product_thumbnail'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  //  discountPrice = json['discount_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_name'] = this.productName;
    data['price'] = this.price;
    data['offer_price'] = this.offerPrice;
    data['category'] = this.category;
    data['sub_category'] = this.subCategory;
    data['quantity'] = this.quantity;
    data['description'] = this.description;
    data['availability'] = this.availability;
    data['tax_info'] = this.taxInfo;
    data['product_thumbnail'] = this.productThumbnail;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
   // data['discount_price'] = this.discountPrice;
    return data;
  }
}