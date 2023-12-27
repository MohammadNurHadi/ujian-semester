import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            const HeaderWidget(),
            Positioned(
              bottom: -250,
              width: MediaQuery.of(context).size.width,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                ),
                child: const DetailWidget(),
              ),
            ),
            const Positioned(
              bottom: 85,
              right: 40,
              child: CircleAvatar(
                backgroundColor: Color(0XFF5E74DA),
                minRadius: 30,
                maxRadius: 30,
                child: Icon(
                  Icons.chat_bubble,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          "https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80",
          height: 450,
          fit: BoxFit.fitHeight,
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: 30,
            left: 20,
            right: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.chevron_left,
                color: Colors.white,
                size: 30,
              ),
              Row(
                children: [
                  Stack(
                    children: [
                      Icon(
                        Icons.notifications,
                        color: Colors.white,
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
                    color: Colors.white,
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DetailWidget extends StatelessWidget {
  const DetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> sizeList = ['36.5', '37', '37.5', '38', '39', '40'];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          const Text(
            'Shoes',
            style: TextStyle(
              color: Color(0XFF2D2A41),
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    minRadius: 20,
                    maxRadius: 20,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jessica Jones',
                        style: TextStyle(
                          color: Color(0XFF626772),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Pro Seller',
                        style: TextStyle(
                          color: Color(0XFF626772),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Text(
                "\$899",
                style: TextStyle(
                  color: Color(0XFF4d5565),
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              )
            ],
          ),
          const SizedBox(height: 35),
          const Text(
            'Size',
            style: TextStyle(
              color: Color(0XFF626772),
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            children: List.generate(
              sizeList.length,
              (index) => Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.2),
                ),
                child: Center(
                  child: Text(
                    sizeList[index],
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0XFF626772),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 35),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0XFF5E74DA),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              fixedSize: Size(MediaQuery.of(context).size.width, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            onPressed: () {},
            child: const Text(
              'Add to Cart',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
