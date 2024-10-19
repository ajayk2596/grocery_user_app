// import 'package:flutter/material.dart';
//
// class CustomImageSlider extends StatefulWidget {
//
//   final List<String> imageList;
//
//   const CustomImageSlider({Key? key, required this.imageList}) : super(key: key);
//
//   @override
//   _CustomImageSliderState createState() => _CustomImageSliderState();
// }
//
// class _CustomImageSliderState extends State<CustomImageSlider> {
//   int _currentIndex = 0;
//   final PageController _pageController = PageController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 300,
//           child: PageView.builder(
//             controller: _pageController,
//             itemCount: widget.imageList.length,
//             onPageChanged: (index) {
//               setState(() {
//                 _currentIndex = index;
//               });
//             },
//             itemBuilder: (context, index) {
//               return Container(
//                 margin: const EdgeInsets.all(6.0),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8.0),
//                   image: DecorationImage(
//                     image: AssetImage(widget.imageList[index]),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//         const SizedBox(height: 20),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: widget.imageList.asMap().entries.map((entry) {
//             return GestureDetector(
//               onTap: () => _pageController.animateToPage(
//                 entry.key,
//                 duration: const Duration(milliseconds: 500),
//                 curve: Curves.easeInOut,
//               ),
//               child: Container(
//                 width: 12.0,
//                 height: 12.0,
//                 margin: const EdgeInsets.symmetric(horizontal: 4.0),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: _currentIndex == entry.key ? Colors.blueAccent : Colors.grey,
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       ],
//     );
//   }
// }
//
// class SliderScreen extends StatelessWidget {
//   final List<String> images = [
//     'assets/images/j.jpeg',
//     'assets/images/j.jpeg',
//     'assets/images/j.jpeg',
//   ];
//
//   SliderScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Custom Image Slider')),
//       body: Center(
//         child: CustomImageSlider(imageList: images),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();

  final List<String> images = [
    'assets/images/j.jpeg',
    'assets/images/j.jpeg',
    'assets/images/j.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Slider')),
      body: Column(
        children: [
          CarouselSlider(
            items: images.map((imagePath) {
              return Container(
                margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
            options: CarouselOptions(
              height: 300.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.8,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
           // carouselController: _carouselController,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.asMap().entries.map((entry) {
              return GestureDetector(
              //  onTap: () => _carouselController.animateToPage(entry.key),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == entry.key ? Colors.blueAccent : Colors.grey,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}