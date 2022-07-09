part of 'pages.dart';

class MainPages extends StatefulWidget {
  const MainPages({Key? key}) : super(key: key);

  @override
  State<MainPages> createState() => _MainPagesState();
}

class _MainPagesState extends State<MainPages> {
  int selectedPage = 0;
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SafeArea(
            child: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              selectedPage = index;
            });
          },
          children: [
            Center(
              child: ListData(),
            ),
            Center(child: InputForm()),
            Center(
              child: Text(
                "Profile",
                style: blackFontStyle1,
              ),
            ),
          ],
        )),
        Align(
          alignment: Alignment.bottomCenter,
          child: CustomBottomNavbar(
            selectedIndex: selectedPage,
            onTap: (index) {
              setState(() {
                selectedPage = index;
              });
              pageController.jumpToPage(selectedPage);
            },
          ),
        )
      ],
    ));
  }
}
