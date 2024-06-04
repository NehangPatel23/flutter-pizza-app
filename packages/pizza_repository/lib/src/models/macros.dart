import '../entities/macros_entity.dart';

class Macros {
  int calories;
  int proteins;
  int fats;
  int carbs;

  Macros(
      {required this.calories,
      required this.proteins,
      required this.fats,
      required this.carbs});

  MacrosEntity toEntity() {
    return MacrosEntity(
        calories: calories,
        proteins: proteins,
        fats: fats,
        carbs: carbs);
  }

  static Macros fromEntity(MacrosEntity entity) {
    return Macros(
        calories: entity.calories,
        proteins: entity.proteins,
        fats: entity.fats,
        carbs: entity.carbs);
  }
}
