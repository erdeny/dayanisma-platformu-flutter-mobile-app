class DonationModel {
  DateTime? createdAt;
  int? id;
  String? productName;
  String? status;
  String? thumbnail;

  DonationModel(
      {this.createdAt, this.id, this.productName, this.status, this.thumbnail});

  DonationModel.fromJson(Map<String, dynamic> json) {
    createdAt = DateTime.parse(json['created_at']);
    id = json['id'];
    productName = json['product_name'];
    status = json['status'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['product_name'] = this.productName;
    data['status'] = this.status;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}
