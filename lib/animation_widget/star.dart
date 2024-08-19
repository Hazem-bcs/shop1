import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class RateStarWidget extends StatelessWidget {
  const RateStarWidget({
    super.key,
    required this.width,
    required RateStarController controller,
  }) : _controller = controller;

  final RateStarController _controller;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RateStarController>(
      builder: (controller) => _controller.getRiveArtBord() == null
          ? const SizedBox(child: Text("data"))
          : SizedBox(
        width: width,
        height: width / 5,
        child: Stack(
          children: [
            Rive(
              fit: BoxFit.contain,
              artboard: _controller.getRiveArtBord()!,
            ),
            Row(
              children: [
                SizedBox(width: width * 0.1),
                hoverOnStar(controller: _controller, starNumber: 1, setTriggerValue:  _controller.setTrigger1Value),
                SizedBox(width: width * 0.06),
                hoverOnStar(controller: _controller, starNumber: 2, setTriggerValue:  _controller.setTrigger2Value),
                SizedBox(width: width * 0.06),
                hoverOnStar(controller: _controller, starNumber: 3, setTriggerValue:  _controller.setTrigger3Value),
                SizedBox(width: width * 0.06),
                hoverOnStar(controller: _controller, starNumber: 4, setTriggerValue:  _controller.setTrigger4Value),
                SizedBox(width: width * 0.06),
                hoverOnStar(controller: _controller, starNumber: 5, setTriggerValue:  _controller.setTrigger5Value),
              ],
            ),
          ],
        ),
      ),
    );
  }
  GestureDetector hoverOnStar(
      {required RateStarController controller,required int starNumber,required Function setTriggerValue}
      ) {
    return GestureDetector(
      onTapUp: (_) {
        if (_controller.getNumber() == starNumber.toDouble()) {
          _controller.setNumberValue(0.0);
        } else {
          _controller.setNumberValue(starNumber.toDouble());
        }
        Future.delayed(const Duration(milliseconds: 200), () {
          setTriggerValue(false);
        });
      },
      onTapDown: (_) {
        setTriggerValue(true);
      },
      onTapCancel: () {
        setTriggerValue(false);
      },
      child: Container(
        color: Colors.transparent,
        width: width * 0.11,
        height: double.infinity,
      ),
    );
  }
}

class RateStarController extends GetxController {
  final double _fullWidth = 400;
  final _starWidth = 400 * 0.11;
  final _marginWidth = 400 * 0.06;
  final _firstMarginWidth = 400 * 0.1;
  Artboard? _riveArtBord;
  SMIInput<double>? _number;
  SMIInput<bool>? _trigger1;
  SMIInput<bool>? _trigger2;
  SMIInput<bool>? _trigger3;
  SMIInput<bool>? _trigger4;
  SMIInput<bool>? _trigger5;

  Future<void> loadAnimation() async {
    final data =
    await rootBundle.load('assets/animations/pro_five_star_review.riv');
    final file = RiveFile.import(data);
    final artboard = file.mainArtboard;
    final controller =
    StateMachineController.fromArtboard(artboard, 'Pro Five Star Review');
    if (controller != null) {
      artboard.addController(controller);
      setNumber(controller.findInput('Number 1'));
      setTrigger1(controller.findInput('Star1 hover'));
      setTrigger2(controller.findInput('Star2 hover'));
      setTrigger3(controller.findInput('Star3 hover'));
      setTrigger4(controller.findInput('Star4 hover'));
      setTrigger5(controller.findInput('Star5 hover'));
      setRiveArtBord(artboard);
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadAnimation();
  }

  void setRiveArtBord(Artboard? artboard) {
    _riveArtBord = artboard;
    update();
  }

  void setNumber(SMIInput<double>? value) {
    _number = value;
  }

  void setTrigger1(SMIInput<bool>? value) {
    _trigger1 = value;
  }

  void setTrigger2(SMIInput<bool>? value) {
    _trigger2 = value;
  }

  void setTrigger3(SMIInput<bool>? value) {
    _trigger3 = value;
  }

  void setTrigger4(SMIInput<bool>? value) {
    _trigger4 = value;
  }

  void setTrigger5(SMIInput<bool>? value) {
    _trigger5 = value;
  }

  void setNumberValue(double value) {
    _number?.value = value;
    update();
  }

  void setTrigger1Value(bool value) {
    _trigger1?.value = value;
    update();
  }

  void setTrigger2Value(bool value) {
    _trigger2?.value = value;
    update();
  }

  void setTrigger3Value(bool value) {
    _trigger3?.value = value;
    update();
  }

  void setTrigger4Value(bool value) {
    _trigger4?.value = value;
    update();
  }

  void setTrigger5Value(bool value) {
    _trigger5?.value = value;
    update();
  }

  Artboard? getRiveArtBord() {
    return _riveArtBord;
  }

  double? getNumber() {
    return _number?.value;
  }

  bool? getTrigger1() {
    return _trigger1?.value;
  }

  bool? getTrigger2() {
    return _trigger2?.value;
  }

  bool? getTrigger3() {
    return _trigger3?.value;
  }

  bool? getTrigger4() {
    return _trigger4?.value;
  }

  bool? getTrigger5() {
    return _trigger5?.value;
  }

  double getFullWidth() {
    return _fullWidth;
  }

  double getStarWidth() {
    return _starWidth;
  }

  double getMarginWidth() {
    return _marginWidth;
  }

  double getFirstMarginWidth() {
    return _firstMarginWidth;
  }
}
