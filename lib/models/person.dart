part of 'models.dart';

class Person {
  late String name;
  late String address;
  late String birtdhay;
  late int height;
  late int weight;
  late String pictPath;

  Person(
      String name,
      String address,
      String birtdhay,
      int height,
      int weight,
      String pictPath) {
    this.name = name;
    this.address = address;
    this.birtdhay = birtdhay;
    this.height = height;
    this.weight = weight;
    this.pictPath = pictPath;
  }

  // factory Person.createUser(String name1, String address1, String birthday1, int height1, int weight1, String pictPath1){
  //   return Person(
  //    name: name1,
  //    address: address1,
  //    birtdhay: birthday1,
  //    height: height1,
  //    weight: weight1,
  //    pictPath: pictPath1
  //   );
  // }

  // static List<Person> getPerson(){
  //   return
  // }

}
