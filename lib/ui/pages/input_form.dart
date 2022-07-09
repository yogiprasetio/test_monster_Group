part of 'pages.dart';

class InputForm extends StatefulWidget {
  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  Duration duration = Duration();
  int selectedIndex = 1;
  File? _foto;
  Timer? timer;
  TextEditingController _tglLhrController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController _fotoController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController tinggiController = TextEditingController();
  TextEditingController brtController = TextEditingController();
  late String userName, alamat, tglLhr, fotoProfile;
  late int tinggi, brt;
  bool disabledButton = true;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void addTime() {
    final addSeconds = 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      duration = Duration(seconds: seconds);
    });
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    if (minutes == '01' && seconds == '30') {
      setState(() {
        disabledButton = false;
      });
      return Text('ANDA KEHABISAN WAKTU !', style: redFontStyle,);
    }
    return Text(
      '$minutes:$seconds',
      style: redFontStyle,
    );
  }

  Future getImage(ImageSource media) async {
    dynamic img = (await ImagePicker().pickImage(source: media));
    setState(() {
      _foto = File(img.path);
      print(_foto);
    });
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Pilih direktori image'),
            content: Container(
              color: secondaryColor,
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget inputAlamat() {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                  color: mainColor, borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Expanded(
                    child: TextFormField(
                  style: blackFontStyle3,
                  controller: alamatController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Alamat tidak boleh kosong';
                    }
                  },
                  decoration: InputDecoration.collapsed(
                    hintText: 'Masukkan Alamat',
                    hintStyle: greyFontStyle,
                  ),
                )),
              ),
            )
          ],
        ));
  }

  Widget inputFoto() {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            _foto == null
                ? GestureDetector(
                    onTap: () {
                      myAlert();
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)),
                      child: CircleAvatar(radius: 100),
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.file(
                      _foto!,
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                  )
            // Container(
            //   height: 50,
            //   padding: EdgeInsets.symmetric(
            //     horizontal: 16,
            //   ),
            //   decoration: BoxDecoration(
            //       color: mainColor, borderRadius: BorderRadius.circular(12)),
            //   child: Center(
            //     child: Expanded(
            //         child: TextField(
            //       keyboardType: TextInputType.none,
            //       showCursor: false,
            //       style: blackFontStyle3,
            //       controller: _fotoController,
            //       decoration: InputDecoration.collapsed(
            //         hintText: 'Pilih Foto',
            //         hintStyle: greyFontStyle,
            //       ),
            //       onTap: () async {
            //         myAlert();
            //         if (_foto != null) {
            //           setState(() {
            //             _fotoController.text = _foto.toString();
            //           });
            //         }
            //       },
            //     )),
            //   ),
            // )
          ],
        ));
  }

  Widget inputTinggi() {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                  color: mainColor, borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Expanded(
                    child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: blackFontStyle3,
                  controller: tinggiController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Masukkan Tinggi Badan',
                    hintStyle: greyFontStyle,
                  ),
                )),
              ),
            )
          ],
        ));
  }

  Widget inputTglLhr() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            height: 55,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: mainColor, borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: Expanded(
                  child: TextField(
                keyboardType: TextInputType.none,
                showCursor: false,
                controller: _tglLhrController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_today_rounded),
                  labelText: "pilih Tanggal",
                ),
                style: blackFontStyle3,
                onTap: () async {
                  DateTime? pickDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100));

                  if (pickDate != null) {
                    setState(() {
                      _tglLhrController.text =
                          DateFormat('dd/MMMM/yyyy').format(pickDate);
                    });
                  }
                },
              )),
            ),
          )
        ],
      ),
    );
  }

  Widget inputBerat() {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                  color: mainColor, borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Expanded(
                    child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: blackFontStyle3,
                  controller: brtController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Masukkan Berat Badan',
                    hintStyle: greyFontStyle,
                  ),
                )),
              ),
            )
          ],
        ));
  }

  Widget inputUsername() {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                  color: mainColor, borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Expanded(
                    child: TextFormField(
                  style: blackFontStyle3,
                  controller: userNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                  },
                  decoration: InputDecoration.collapsed(
                    hintText: 'Masukkan Username',
                    hintStyle: greyFontStyle,
                  ),
                )),
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: ListView(
        children: [
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              height: 100,
              width: double.infinity,
              child: Text('timer')//buildTime()
              ),
          SizedBox(
            height: defaultMargin * 4,
          ),
          inputUsername(),
          SizedBox(height: defaultMargin / 2),
          inputAlamat(),
          SizedBox(
            height: defaultMargin / 2,
          ),
          inputTinggi(),
          SizedBox(
            height: defaultMargin / 2,
          ),
          inputBerat(),
          SizedBox(
            height: defaultMargin / 2,
          ),
          inputTglLhr(),
          SizedBox(
            height: defaultMargin / 2,
          ),
          inputFoto(),
          SizedBox(
            height: defaultMargin / 2.5,
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                onSurface: secondaryColor,
              ),
              child: Text('Submit'),
              onPressed: disabledButton
                  ? () {

                      userName = userNameController.text;
                      brt = int.parse(brtController.text);
                      tinggi = int.parse(tinggiController.text);
                      alamat = alamatController.text;
                      tglLhr = _tglLhrController.text;
                      fotoProfile = _foto.toString();
                      Controller control = Controller();
                      print(control.dataPerson.length) ;
                      control.tambahPerson(userName, alamat, tglLhr, tinggi, brt, fotoProfile);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => MainPages()),
                          (Route<dynamic> route) => false);
                    }
                  : null,
            ),
          )
        ],
      ),
    );
  }
}
