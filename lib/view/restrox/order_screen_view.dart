import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restrox_demo/constants/images_path.dart';
import 'package:restrox_demo/utils/color.dart';
import 'package:restrox_demo/view/restrox/order_screen.dart';
import 'package:restrox_demo/widgets/add_order_button.dart';

class OrderScreenView extends StatefulWidget {
  const OrderScreenView({super.key});

  @override
  _RestroxUiState createState() => _RestroxUiState();
}

class _RestroxUiState extends State<OrderScreenView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Orders",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 0.1,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(
                      height: 25,
                      width: 25,
                      ImagesPath.login,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Coffee Ghar",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SvgPicture.asset(
              ImagesPath.menu,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              TabBar(
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: AppColors.restroXprimary,
                labelColor: AppColors.restroXprimary,
                controller: _tabController,
                tabs: const [
                  Tab(
                    child: Text(
                      "Live Order",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Table",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Kot",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    OrderScreen(),
                    Center(
                        child: Text(
                      "Pending Orders",
                    )),
                    Center(
                        child: Text(
                      "Completed Orders",
                    )),
                  ],
                ),
              ),
              AddNewOrderButton(onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
