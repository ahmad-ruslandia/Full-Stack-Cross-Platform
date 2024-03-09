class UserListResponse {
  UserListResponse({
    required this.status,
    required this.message,
    required this.data,
  });
  late final bool status;
  late final String message;
  late final List<User> data;

  UserListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e) => User.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final adata = <String, dynamic>{};
    adata['status'] = status;
    adata['message'] = message;
    adata['data'] = data.map((e) => e.toJson()).toList();
    return adata;
  }
}

class User {
  User({
    required this.id,
    required this.fullName,
    required this.mobileNumber,
  });
  late final int id;
  late final String fullName;
  late final String mobileNumber;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    mobileNumber = json['mobileNumber'];
  }

  Map<String, dynamic> toJson() {
    final adata = <String, dynamic>{};
    adata['id'] = id;
    adata['fullName'] = fullName;
    adata['mobileNumber'] = mobileNumber;
    return adata;
  }
}

class UserResponse {
  UserResponse({
    required this.status,
    required this.message,
    required this.data,
  });
  late final bool status;
  late final String message;
  late final User? data;

  UserResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = (json['data'] != null) ? User.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final adata = <String, dynamic>{};
    adata['status'] = status;
    adata['message'] = message;
    adata['data'] = data!.toJson();
    return adata;
  }
}
