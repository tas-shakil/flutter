class CatalogModel{
  static final items =[
    Item(1, "iphone 12 pro", "Apple i phone 12th generation", 999, "#33505a", "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50"),
    Item(2, "iphone 12 pro", "Apple i phone 12th generation", 999, "#33505a", "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50")
  ];

}



class Item{
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(this.id, this.name, this.desc, this.price, this.color, this.image);


}

