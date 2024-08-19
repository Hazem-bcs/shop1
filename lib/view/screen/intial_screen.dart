import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screen/Home/home.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background.jpg"),
                    fit: BoxFit.cover)),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.5),
          ),
          const TextLayer(),
          const ButtonLayer(),
        ],
      ),
    );
  }
}

class TextLayer extends StatelessWidget {
  const TextLayer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 40),
          children: const [
            TextSpan(text: '24/7\n'),
            TextSpan(text: 'Shopping App'),
          ],
        ),
      ),
    );
  }
}

class ButtonLayer extends StatelessWidget {
  const ButtonLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20,
      bottom: 30,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildElevatedButton(
            context: context,
            backGroundColor: Theme.of(context).colorScheme.primary,
            borderSideColor: Theme.of(context).colorScheme.primary,
            onTap: () {},
            text: "Login or Register",
          ),
          const SizedBox(height: 15),
          buildElevatedButton(
              context: context,
              backGroundColor: Colors.transparent,
              borderSideColor: Colors.white,
              text: "Sing Up as Gust",
              onTap: () {
                Get.to(() => const Home());
              })
        ],
      ),
    );
  }

  ElevatedButton buildElevatedButton({
    required BuildContext context,
    Color? backGroundColor,
    required Color borderSideColor,
    void Function()? onTap,
    required String text,
  }) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(backGroundColor),
        padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 40, vertical: 10)),
        minimumSize: WidgetStatePropertyAll(
            Size(MediaQuery.of(context).size.width - 40, 50)),
        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
          side: BorderSide(color: borderSideColor, width: 2),
        )),
      ),
      child: Text(text, style: Theme.of(context).textTheme.bodyLarge),
    );
  }
}
