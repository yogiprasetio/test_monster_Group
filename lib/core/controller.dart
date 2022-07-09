import 'package:test_monter_yogi/models/models.dart';

class Controller {
  List<Person> dataPerson = [];

  void tambahPerson(String name1, String address1, String birthday1,
      int height1, int weight1, String pictPath1) {
    var person1 = Person(name1, address1, birthday1, height1, weight1, pictPath1);
    dataPerson.add(person1);
        print('tambah person');
        print(dataPerson[0].name);
        print(dataPerson.length);
  }

  List<Person> getData(){
    return dataPerson;
  }

}
