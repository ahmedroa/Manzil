import 'package:flutter/material.dart';
import 'package:manzil/features/home/data/model/unit.dart';
import 'package:manzil/features/home/ui/widgets/nearby_your_location/nearby_your_location.dart';

class SeeAllUnit extends StatefulWidget {
  final List<UnitModle> units;

  const SeeAllUnit({super.key, required this.units});

  @override
  State<SeeAllUnit> createState() => _SeeAllUnitState();
}

class _SeeAllUnitState extends State<SeeAllUnit> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late List<UnitModle> _unitsToShow;

  @override
  void initState() {
    super.initState();
    _unitsToShow = [];
    _addUnitsWithAnimation();
  }

  void _addUnitsWithAnimation() async {
    for (int i = 0; i < widget.units.length; i++) {
      await Future.delayed(const Duration(milliseconds: 100)); // إضافة تأخير بين كل عنصر
      _unitsToShow.add(widget.units[i]);
      _listKey.currentState?.insertItem(_unitsToShow.length - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Units'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: AnimatedList(
          key: _listKey,
          initialItemCount: _unitsToShow.length,
          itemBuilder: (context, index, animation) {
            return SlideTransition(
              position: animation.drive(
                Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
                    .chain(CurveTween(curve: Curves.easeInOut)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NearbyYourLocation(
                      unitList: _unitsToShow[index],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
