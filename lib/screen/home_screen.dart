import 'package:flutter/material.dart';
import 'package:music_player/screen/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
          child: Column(
            children: [
              HeaderWidget(),
              SizedBox(height: 30),
              RecommendedWidget(),
              SizedBox(height: 30),
              DetailWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.chevron_left,
              size: 30,
              weight: 6,
              color: Color(0XFF585c73),
            ),
            SizedBox(width: 5),
            Text(
              'Music',
              style: TextStyle(
                color: Color(0XFF585c73),
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
        Row(
          children: [
            Stack(
              children: [
                Icon(
                  Icons.notifications,
                  color: Color(0XFF162e4f),
                ),
                Positioned(
                  right: 1,
                  child: CircleAvatar(
                    minRadius: 5,
                    maxRadius: 5,
                    backgroundColor: Colors.red,
                  ),
                )
              ],
            ),
            SizedBox(width: 10),
            Icon(
              Icons.shopping_cart,
              color: Color(0XFF162e4f),
            )
          ],
        ),
      ],
    );
  }
}

class RecommendedWidget extends StatefulWidget {
  const RecommendedWidget({Key? key}) : super(key: key);

  @override
  State<RecommendedWidget> createState() => _RecommendedWidgetState();
}

class _RecommendedWidgetState extends State<RecommendedWidget> {
  final _pageController = PageController(viewportFraction: 0.9);

  double currentPage = 0;

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!.toDouble();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imageList = [
      "https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80",
      "https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
      "https://images.unsplash.com/photo-1584810359583-96fc3448beaa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80"
    ];
    final List<String> priceList = ['\$125', '\$120', '\$100'];

    return SizedBox(
      height: 440,
      child: PageView(
        physics: const BouncingScrollPhysics(),
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        children: List.generate(
          imageList.length,
          (index) => CardWidget(
            image: imageList[index],
            price: priceList[index],
          ),
        ),
      ),
    );
  }
}

class DetailWidget extends StatelessWidget {
  const DetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imageList = [
      "https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80",
      "https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
    ];

    final List<String> priceList = ["\$125", '\$199'];

    final List<String> titleList = [
      "Queen's Concert | Buy Ticket",
      'Blue Jazz Concert | Buy Ticket'
    ];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DetailScreen(),
          ),
        );
      },
      child: Row(
        children: List.generate(
          imageList.length,
          (index) => Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    child: Image.network(
                      imageList[index],
                      width: 200,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    titleList[index],
                    style: const TextStyle(color: Color(0XFF615f6b)),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    priceList[index],
                    style: const TextStyle(
                      color: Color(0XFF7e8389),
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String image;
  final String price;
  const CardWidget({
    Key? key,
    required this.image,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 300,
          margin: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(image),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          price,
          style: const TextStyle(
            color: Color(0XFF616372),
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Music Album',
          style: TextStyle(
            color: Color(0XFF383757),
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Rock music  is a genre of popular music.\nIt developed during and after the 1960s in the United Kingkom',
          style: TextStyle(color: Color(0XFFADB2BD)),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
