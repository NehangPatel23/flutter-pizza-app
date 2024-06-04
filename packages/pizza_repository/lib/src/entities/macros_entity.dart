class MacrosEntity {
  int calories;
  int proteins;
  int fats;
  int carbs;

  MacrosEntity(
      {required this.calories,
      required this.proteins,
      required this.fats,
      required this.carbs});

  Map<String, Object?> toDocument() {
    return {
      'calories': calories,
      'proteins': proteins,
      'fats': fats,
      'carbs': carbs
    };
  }

  static MacrosEntity fromDocument(Map<String, dynamic> doc) {
    return MacrosEntity(
        calories: doc['calories'],
        proteins: doc['proteins'],
        fats: doc['fats'],
        carbs: doc['carbs']);
  }
}
