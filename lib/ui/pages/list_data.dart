part of 'pages.dart';

class ListData extends StatefulWidget {
  @override
  State<ListData> createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  Controller cont = Controller();

  @override
  void initState() {
    super.initState();
  }

  final _lightColors = [
    mainColor,
    thirdColor,
    secondaryColor,
    Colors.pinkAccent.shade100,
  ];

  @override
  Widget build(BuildContext context) {
    return Background(
      child: cont.dataPerson.length != 0
          //we use masonry grid to make masonry card style
          ? MasonryGridView.count(
              crossAxisCount: 2,
              itemCount: cont.dataPerson.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  // onTap: () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => Edit(id: _get[index]['id'],)));
                  // },
                  child: Card(
                    //make random color to eveery card
                    color: _lightColors[index % _lightColors.length],
                    child: Container(
                      //make 2 different height
                      constraints:
                          BoxConstraints(minHeight: (index % 2 + 1) * 85),
                      // BoxConstraints(minHeight: (index % 1 + 4) * 85),
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            // '${_get[index]['userid']}',
                            'id Doc = ${cont.dataPerson[index].name}',
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'keterangan Belanja = ${cont.dataPerson[index].birtdhay}',
                            // '${_get[index]['nama']}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${cont.dataPerson[index].address}',
                            // 'update at = ${_get[index]['updated_at']}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          : Center(
              child: Text(
                'NO DATA',
                style: redFontStyle,
              ),
            ),
    );
  }
}
