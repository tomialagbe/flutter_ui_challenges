enum DrinkType { frappe, glass }

class Drink {
  DrinkType drinkType;
  double price;

  String get asset => drinkType == DrinkType.glass
      ? "assets/images/glass_with_straw.png"
      : "assets/images/frappe_with_straw.png";
}

List<Drink> getDrinks(DrinkType type) {
  return _drinks[type];
}

Map<DrinkType, List<Drink>> _drinks = <DrinkType, List<Drink>>{
  DrinkType.frappe: <Drink>[
    new Drink()
      ..drinkType = DrinkType.frappe
      ..price = 7.0,
    new Drink()
      ..drinkType = DrinkType.frappe
      ..price = 8.0,
    new Drink()
      ..drinkType = DrinkType.frappe
      ..price = 7.0,
    new Drink()
      ..drinkType = DrinkType.frappe
      ..price = 8.0,
    new Drink()
      ..drinkType = DrinkType.frappe
      ..price = 7.0,
    new Drink()
      ..drinkType = DrinkType.frappe
      ..price = 8.0,
    new Drink()
      ..drinkType = DrinkType.frappe
      ..price = 7.0,
    new Drink()
      ..drinkType = DrinkType.frappe
      ..price = 8.0,
  ],
  DrinkType.glass: <Drink>[
    new Drink()
      ..drinkType = DrinkType.glass
      ..price = 15.0,
    new Drink()
      ..drinkType = DrinkType.glass
      ..price = 12.0,
    new Drink()
      ..drinkType = DrinkType.glass
      ..price = 15.0,
    new Drink()
      ..drinkType = DrinkType.glass
      ..price = 12.0,
    new Drink()
      ..drinkType = DrinkType.glass
      ..price = 15.0,
    new Drink()
      ..drinkType = DrinkType.glass
      ..price = 12.0,
    new Drink()
      ..drinkType = DrinkType.glass
      ..price = 15.0,
    new Drink()
      ..drinkType = DrinkType.glass
      ..price = 12.0,
  ],
};
