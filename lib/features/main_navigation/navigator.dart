import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/gaps.dart';
import '../videos/video_timeline_screen.dart';
import 'post_video_button.dart';

import 'widgets/nav_tab.dart';

class NaviState extends StatefulWidget {
  const NaviState({super.key});

  @override
  State<NaviState> createState() => _NaviStateState();
}

class _NaviStateState extends State<NaviState> {
  int _selectedIndex = 0;

  void _onTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostVideoButtonTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Post Video'),
          ),
        ),
        fullscreenDialog: true, // 전체화면으로 덮음
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: screens.elementAt(_selectedIndex),
      body: Stack(
        children: [
          Offstage(
            // Offstage는 화면에 보이지 않게 할 수 있음
            offstage: _selectedIndex != 0,
            child: const VideoTimelineScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: Container(),
          ),
          Offstage(
            offstage: _selectedIndex != 2,
            child: Container(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: Container(),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 20,
              ),
              child: BottomAppBar(
                  elevation: 0,
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 196, 196, 247)
                              .withOpacity(0.1),
                          blurRadius: 3,
                          spreadRadius: 3,
                          offset: const Offset(0, 0),
                        ),
                      ],
                      color: const Color(0xff807FFF),
                      borderRadius:
                          const BorderRadius.all(Radius.elliptical(20, 20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 9,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          NavTab(
                            isSelected: _selectedIndex == 0,
                            icon: SvgPicture.asset(
                                'assets/menu/chatButtonOn.svg'),
                            // 자식에서 함수를 전달해 부모속성을 변겨할 수 있음
                            // 그리고 setState를 통해 화면을 다시 그림
                            tap: () => _onTab(0),
                          ),
                          NavTab(
                            isSelected: _selectedIndex == 1,
                            icon:
                                SvgPicture.asset('assets/menu/favoriteOn.svg'),
                            tap: () => _onTab(1),
                          ),
                          Gaps.h16,
                          GestureDetector(
                            onTap: _onPostVideoButtonTap,
                            child: const PostVideoButton(),
                          ),
                          Gaps.h16,
                          NavTab(
                            isSelected: _selectedIndex == 2,
                            icon: SvgPicture.asset('assets/menu/PTOn.svg'),
                            tap: () => _onTab(2),
                          ),
                          NavTab(
                            isSelected: _selectedIndex == 3,
                            icon: SvgPicture.asset('assets/menu/MyOn.svg'),
                            tap: () => _onTab(3),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
