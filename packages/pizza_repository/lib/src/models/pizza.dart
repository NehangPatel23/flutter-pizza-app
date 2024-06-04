import '../entities/entities.dart';
import 'macros.dart';

class Pizza {
  String pizzaId;
  String picture;
  bool isVeg;
  int spiceLevel;
  String name;
  String description;
  int price;
  int discount;
  Macros macros;

  Pizza(
      {required this.pizzaId,
      required this.picture,
      required this.isVeg,
      required this.spiceLevel,
      required this.name,
      required this.description,
      required this.price,
      required this.discount,
      required this.macros});

  PizzaEntity toEntity() {
    return PizzaEntity(
        pizzaId: pizzaId,
        picture: picture,
        isVeg: isVeg,
        spiceLevel: spiceLevel,
        name: name,
        description: description,
        price: price,
        discount: discount,
        macros: macros);
  }

  static Pizza fromEntity(PizzaEntity entity) {
    return Pizza(
        pizzaId: entity.pizzaId,
        picture: entity.picture,
        isVeg: entity.isVeg,
        spiceLevel: entity.spiceLevel,
        name: entity.name,
        description: entity.description,
        price: entity.price,
        discount: entity.discount,
        macros: entity.macros);
  }
}
