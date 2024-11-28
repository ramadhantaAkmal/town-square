class Item {
  String name;
  String category;

  Item(this.name, this.category);
}

List<Item> filterByCategories(
    List<Item> items, List<String> selectedCategories) {
  return items
      .where((item) => selectedCategories.contains(item.category))
      .toList();
}

// void main() {
//   List<Item> items = [
//     Item('Basketball', 'sport'),
//     Item('Soccer', 'sport'),
//     Item('Drawing', 'creative'),
//     Item('Ice Cream', 'food'),
//     Item('Concert', 'popular'),
//     Item('Yoga', 'calm'),
//     Item('Playground', 'kids'),
//   ];

//   List<String> selectedCategories = ['sport', 'food'];

//   List<Item> filteredItems = filterByCategories(items, selectedCategories);

//   for (var item in filteredItems) {
//     print('${item.name} belongs to ${item.category} category');
//   }
// }
