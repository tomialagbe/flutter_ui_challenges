enum DrinkType { frappe, glass }

class Drink {
  DrinkType drinkType;
  double price;
}

Map<DrinkType, List<Drink>> drinks = <DrinkType, List<Drink>>{
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
