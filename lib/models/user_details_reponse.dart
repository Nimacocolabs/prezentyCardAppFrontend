//
// class User {
//   String? name;
//   String? storeId;
//   String? employeeId;
//   String? email;
//   String? phone;
//   String? role;
//   String? updatedAt;
//   String? createdAt;
//   int? id;
//
//   User(
//       {this.name,
//         this.storeId,
//         this.employeeId,
//         this.email,
//         this.phone,
//         this.role,
//         this.updatedAt,
//         this.createdAt,
//         this.id});
//
//   User.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     storeId = json['store_id'];
//     employeeId = json['employee_id'];
//     email = json['email'];
//     phone = json['phone'];
//     role = json['role'];
//     updatedAt = json['updated_at'];
//     createdAt = json['created_at'];
//     id = json['id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['store_id'] = this.storeId;
//     data['employee_id'] = this.employeeId;
//     data['email'] = this.email;
//     data['phone'] = this.phone;
//     data['role'] = this.role;
//     data['updated_at'] = this.updatedAt;
//     data['created_at'] = this.createdAt;
//     data['id'] = this.id;
//     return data;
//   }
// }

class User {
  String? name;
  String? storeId;
  String? employeeId;
  String? email;
  String? phone;
  String? role;
  String? updatedAt;
  String? createdAt;
  int? id;

  User(
      {this.name,
        this.storeId,
        this.employeeId,
        this.email,
        this.phone,
        this.role,
        this.updatedAt,
        this.createdAt,
        this.id});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    storeId = json['store_id'];
    employeeId = json['employee_id'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['store_id'] = this.storeId;
    data['employee_id'] = this.employeeId;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['role'] = this.role;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
