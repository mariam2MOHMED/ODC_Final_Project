
class ItemModel {
  List<Items>? items;

  ItemModel({this.items});

  ItemModel.fromJson(Map<String, dynamic> json) {
    items = json["items"] == null ? null : (json["items"] as List).map((e) => Items.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(items != null) {
      _data["items"] = items?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Items {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  Items({this.name, this.quantity, this.price, this.currency});

  Items.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    quantity = json["quantity"];
    price = json["price"];
    currency = json["currency"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["quantity"] = quantity;
    _data["price"] = price;
    _data["currency"] = currency;
    return _data;
  }
}