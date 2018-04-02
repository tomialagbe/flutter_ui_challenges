enum DrinkType { frappe, glass }

class Drink {
  DrinkType drinkType;
  String name;
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
      ..name = 'Latte Macchiato'
      ..price = 7.0,
    new Drink()
      ..drinkType = DrinkType.frappe
      ..name = 'Doppio'
      ..price = 8.0,
    new Drink()
      ..drinkType = DrinkType.frappe
      ..name = 'Americano'
      ..price = 7.0,
    new Drink()
      ..drinkType = DrinkType.frappe
      ..name = 'Espresso Macchiato'
      ..price = 8.0,
    new Drink()
      ..drinkType = DrinkType.frappe
      ..name = 'Latte'
      ..price = 7.0,
    new Drink()
      ..drinkType = DrinkType.frappe
      ..name = 'Cappuccino'
      ..price = 8.0,
    new Drink()
      ..drinkType = DrinkType.frappe
      ..name = 'Caramel Macchiato'
      ..price = 7.0,
    new Drink()
      ..drinkType = DrinkType.frappe
      ..name = 'Mocha'
      ..price = 8.0,
  ],
  DrinkType.glass: <Drink>[
    new Drink()
      ..drinkType = DrinkType.glass
      ..name = 'Cool Lime'
      ..price = 15.0,
    new Drink()
      ..drinkType = DrinkType.glass
      ..name = 'Ombré Pink Drink'
      ..price = 12.0,
    new Drink()
      ..drinkType = DrinkType.glass
      ..name = 'Vanilla Sweet Cream'
      ..price = 15.0,
    new Drink()
      ..drinkType = DrinkType.glass
      ..name = 'Nariño 70'
      ..price = 12.0,
    new Drink()
      ..drinkType = DrinkType.glass
      ..name = 'Iced Coffee'
      ..price = 15.0,
    new Drink()
      ..drinkType = DrinkType.glass
      ..name = 'Nitro'
      ..price = 12.0,
    new Drink()
      ..drinkType = DrinkType.glass
      ..name = 'Strawberry Acai Beverage'
      ..price = 15.0,
    new Drink()
      ..drinkType = DrinkType.glass
      ..name = 'Violet Drink'
      ..price = 12.0,
  ],
};
