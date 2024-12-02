import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restrox_demo/bloc/bottomNavigation/bloc/bottom_navigation_bloc.dart';
import 'package:restrox_demo/utils/color.dart';
import 'package:restrox_demo/utils/customlogger.dart';
import 'package:restrox_demo/view/restrox/order_screen_view.dart';

class MainPage extends StatelessWidget {
  static const routeName = "/main_page";
  MainPage({super.key});

  final List<Widget> _pages = [
    const HomePage(),
    const OrderScreenView(),
    const SizedBox(),
    const NotificationPage(),
    const ManagePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        if (state is BottomNavState) {
          return Scaffold(
            body: _pages[state.index],
            floatingActionButton: Container(
              height: 64,
              width: 64,
              margin: const EdgeInsets.only(top: 30),
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                elevation: 2,
                onPressed: () {},
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildDot(),
                          const SizedBox(width: 4),
                          _buildDot(),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildDot(),
                          const SizedBox(width: 4),
                          _buildDot(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
                child: BottomNavigationBar(
                  currentIndex: state.index,
                  onTap: (index) {
                    Customlogger.logInfo("BottomNavigationBloc $index");
                    context
                        .read<BottomNavigationBloc>()
                        .add(BottomNavigationPressed(index));
                  },
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.white,
                  selectedItemColor: AppColors.restroXprimary,
                  unselectedItemColor: Colors.black,
                  selectedFontSize: 12,
                  unselectedFontSize: 12,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_rounded),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.receipt_outlined),
                      label: 'Order',
                    ),
                    BottomNavigationBarItem(
                      icon: SizedBox(height: 0),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.notifications_outlined),
                      label: 'Notification',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.more_horiz),
                      label: 'Manage',
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        return Container();
      },
    );
  }

  Widget _buildDot() {
    return Container(
      width: 8,
      height: 8,
      decoration: const BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Home Page"));
  }
}

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Notification Page"));
  }
}

class ManagePage extends StatelessWidget {
  const ManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Manage Page"));
  }
}
