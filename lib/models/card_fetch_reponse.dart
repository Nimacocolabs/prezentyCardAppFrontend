class CardFetchResponse {
  bool? status;
  String? message;
  List<Card>? card;

  CardFetchResponse({this.status, this.message, this.card});

  CardFetchResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['card'] != null) {
      card = <Card>[];
      json['card'].forEach((v) {
        card!.add(new Card.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.card != null) {
      data['card'] = this.card!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Card {
  int? id;
  String? cardNumber;
  String? type;
  String? issuedDate;
  String? userName;
  String? phone;
  String? email;
  int? status;
  String? createdAt;
  String? updatedAt;

  Card(
      {this.id,
        this.cardNumber,
        this.type,
        this.issuedDate,
        this.userName,
        this.phone,
        this.email,
        this.status,
        this.createdAt,
        this.updatedAt});

  Card.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cardNumber = json['card_number'];
    type = json['type'];
    issuedDate = json['issued_date'];
    userName = json['user_name'];
    phone = json['phone'];
    email = json['email'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['card_number'] = this.cardNumber;
    data['type'] = this.type;
    data['issued_date'] = this.issuedDate;
    data['user_name'] = this.userName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}