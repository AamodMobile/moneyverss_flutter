import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:wireframe/models/dashboard_model.dart';

import '../constants/constants.dart';
import '../constants/get_device_type.dart';

class ItemTestimonial extends StatefulWidget {
  final Testimonial testimonialList;

  const ItemTestimonial({super.key, required this.testimonialList});

  @override
  State<ItemTestimonial> createState() => _ItemTestimonialState();
}

class _ItemTestimonialState extends State<ItemTestimonial> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      margin:  EdgeInsets.only(right:MediaQuery.of(context).size.width * 0.03),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: const Color.fromRGBO(233, 238, 255, 1)
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              padding: const EdgeInsets.all(7),
              width: MediaQuery.of(context).size.width * 0.45,
              height: GetDeviceType().getDeviceType(context)? 285 : 165,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: whiteColor,
              ),),
          ),
          Container(
            margin:  EdgeInsets.only(right:MediaQuery.of(context).size.width * 0.03),
            padding: const EdgeInsets.all(7),
            width: MediaQuery.of(context).size.width * 0.45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.transparent,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Html(
                  data: widget.testimonialList.description,
                  style: {
                    "body": Style(
                      maxLines: GetDeviceType().getDeviceType(context)? 6 : 3,
                      textAlign: TextAlign.start,
                      fontSize: FontSize(GetDeviceType().getDeviceType(context)?14 : 10),
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontFamily: medium,
                      color: textColorSec,
                    ),
                  },
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: GetDeviceType().getDeviceType(context)? 46 : 36,
                                width: GetDeviceType().getDeviceType(context)? 46 : 36,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(GetDeviceType().getDeviceType(context)? 25 : 20),border: Border.all(color: draKText)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(GetDeviceType().getDeviceType(context)?25 : 20),
                                  child:  widget.testimonialList.image != ""
                                      ? CachedNetworkImage(
                                    errorWidget: (context, url, error) =>
                                        Image.asset(
                                          defult,
                                          fit: BoxFit.fill,
                                        ),
                                    fit: BoxFit.fill,
                                    height: GetDeviceType().getDeviceType(context)? 30 : 30,
                                    width: GetDeviceType().getDeviceType(context)?30 : 30,
                                    imageUrl:  widget.testimonialList.image.toString(),
                                    placeholder: (a, b) =>
                                    const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                      : Image.asset(
                                    defult,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: GetDeviceType().getDeviceType(context)?12 : 8,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.testimonialList.name.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(color: mainColor, fontFamily: medium, fontWeight: FontWeight.w500, fontStyle: FontStyle.normal, fontSize: GetDeviceType().getDeviceType(context)?16 : 12),
                                  ),
                                  RatingBarIndicator(
                                    rating: double.parse(widget.testimonialList.rating.toString()),
                                    itemCount: 5,
                                    itemSize: GetDeviceType().getDeviceType(context)? 13 : 9,
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color:draKText,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Image.asset(coma,height: 15,width: 20,)
                    ],
                  ),
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),


        ],
      ),
    );
  }
}
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0.0, size.height - 20.0); // Start from the bottom-left
    path.quadraticBezierTo(
      size.width / 4,
      size.height + 20.0,
      size.width / 2,
      size.height - 20.0,
    ); // Wave curve
    path.quadraticBezierTo(
      (3 * size.width) / 4,
      size.height - 50.0,
      size.width,
      size.height - 30.0,
    ); // Wave curve
    path.lineTo(size.width, 0.0); // End at the bottom-right

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
