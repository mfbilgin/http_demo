class Product {
  late int id;
  late int categoryId;
  late String productName;
  late String quantityPerUnit;
  late double unitPrice;
  late int unitsInStock;

  Product(this.id, this.categoryId, this.productName, this.quantityPerUnit,
      this.unitPrice, this.unitsInStock);

  Product.fromJson(Map json) {

    id = int.parse(json["id"].toString());
    categoryId = int.parse(json["categoryId"].toString());
    productName = json["productName"].toString();
    quantityPerUnit = json["quantityPerUnit"].toString();
    unitPrice = double.parse(json["unitPrice"].toString());
    unitsInStock = int.parse(json["unitsInStock"].toString());
  }

  Map toJson() {
    return {
      "id": id,
      "categoryId": categoryId,
      "productName": productName,
      "quantityPerUnit": quantityPerUnit,
      "unitPrice": unitPrice,
      "unitsInStock": unitsInStock
    };
  }
}
