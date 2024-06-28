import 'package:wireframe/constants/constants.dart';

class LoaderClass extends StatefulWidget {
  const LoaderClass({super.key});

  @override
  State<LoaderClass> createState() => _LoaderClassState();
}

class _LoaderClassState extends State<LoaderClass> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: MediaQuery.of(context).size.width),
          Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Image.asset(loadingGif),
            ),
          ),
        ],
      ),
    );
  }
}
