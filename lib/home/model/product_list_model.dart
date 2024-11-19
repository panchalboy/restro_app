class ProductListModel {
  String? name;
  String? prodDiscription;
  String? productImage;
  String? productFullDic;
  double? price;
  int? id;
  int? qty;
  double? totalPrice;
  ProductNutrition? productNutrition;

  ProductListModel(
      {this.name,
      this.prodDiscription,
      this.productImage,
      this.productFullDic,
      this.price,
      this.id,
      this.productNutrition,
      this.qty,
      this.totalPrice});

  factory ProductListModel.fromJson(Map<String, dynamic> json) =>
      ProductListModel(
          name: json["name"],
          prodDiscription: json["prodDiscription"],
          productFullDic: json["productFullDic"],
          productImage: json["productImage"],
          price: json["price"],
          id: json['id'],
          qty: json['qty'],
          totalPrice: json['totalPrice'],
          productNutrition: ProductNutrition.fromJson(json["delivery_man"]));

  Map<String, dynamic> toJson() => {
        "name": name,
        "prodDiscription": prodDiscription,
        "product_image": productImage,
        "productFullDic": productFullDic,
        "price": price,
        "id": id,
        'qty': qty,
        "totalPrice": totalPrice,
        "productNutrition": productNutrition!.toJson(),
      };
}

class ProductNutrition {
  double? kcal;
  double? weight;
  double? proteins;
  double? fats;
  double? cabs;
  ProductNutrition(
      {this.kcal, this.weight, this.proteins, this.fats, this.cabs});

  factory ProductNutrition.fromJson(Map<String, dynamic> json) =>
      ProductNutrition(
        kcal: json["kcal"],
        weight: json["weight"],
        proteins: json["proteins"],
        fats: json["fats"],
        cabs: json["cabs"],
      );

  Map<String, dynamic> toJson() => {
        'kcal': kcal,
        "weight": weight,
        "proteins": proteins,
        "fats": fats,
        "cabs": cabs,
      };
}
