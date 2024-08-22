import 'package:flutter/material.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  //
  int _itemCount = 4;
  final PageController _pc = PageController();
  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
  ];
  void onPageChanged(int index) {
    //_pc로 강제이동가능
    _pc.animateToPage(index,
        duration: const Duration(milliseconds: 150), curve: Curves.linear);
    if (index == _itemCount - 1) {
      _itemCount = _itemCount + 4;
      // print("현재페이지: ${index + 1}, 전체페이지수: $_itemCount");
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      // 페이지가 바뀔 때 현재 index를 매개변수로 받음
      onPageChanged: onPageChanged,
      controller: _pc,
      scrollDirection: Axis.vertical,
      // 넣으려는 전체 페이지 수
      itemCount: _itemCount,
      // itemCount 숫자만큼에서 index를 지정해서 받아옴
      itemBuilder: (context, index) => Container(
        color: colors[index % 4],
        child: Center(
          child: Text(
            "${index + 1}번째 페이지",
            style: const TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
