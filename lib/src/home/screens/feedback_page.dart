import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/models/feedback_model.dart';
import 'package:readyplates_restaurants/src/home/home_controller.dart';
import 'package:readyplates_restaurants/src/home/screens/add_food_item.dart';
import 'package:readyplates_restaurants/src/home/screens/performance_page.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/onboardingbutton.dart';
import 'package:readyplates_restaurants/widgets/text_widget.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class FeedbackPage extends StatefulWidget {
  final FeedbackModel feedbackModel;
  FeedbackPage({Key? key, required this.feedbackModel}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final controller = Get.find<HomeController>();

  FeedbackModel get feedbackModel => widget.feedbackModel;
  List<String> ratingText = [
    '',
    'Poor',
    'Average',
    'Good',
    'Very Good',
    'Excellent'
  ];
  stringText(String value) {
    if (value == "0.0")
      return ratingText[0];
    else if (value == "1.0")
      return ratingText[1];
    else if (value == "2.0")
      return ratingText[2];
    else if (value == "3.0")
      return ratingText[3];
    else if (value == "4.0")
      return ratingText[4];
    else if (value == "5.0")
      return ratingText[5];
    else
      return ratingText[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.appbackgroundColor,
      appBar: AppBar(
        backgroundColor: MyTheme.appbackgroundColor,
        elevation: 0,
        leading: IconButton(
            iconSize: 14.83,
            icon: FaIcon(
              FontAwesomeIcons.chevronLeft,
              color: MyTheme.iconColor,
            ),
            onPressed: () {
              Get.back();
            }),
        centerTitle: true,
        title: Text(
          'Feedback',
          style: GoogleFonts.inter(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 17,
            color: MyTheme.appbartextColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 12,
              ),
              Textwidget(
                text: 'Rate your overall Experience',
              ),
              SizedBox(
                height: 9,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothStarRating(
                    rating: double.parse(feedbackModel.overall_experience),
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star_half,
                    defaultIconData: Icons.star_border,
                    allowHalfRating: false,
                    starCount: 5,
                    size: 30,
                    spacing: 22,
                    borderColor: MyTheme.ratingfillColor,
                    color: MyTheme.ratingfillColor,
                  ),
                  Text(stringText(feedbackModel.overall_experience),
                      style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          color: Color(0xff6E6D7A))),
                ],
              ),
              SizedBox(
                height: 19,
              ),
              Textwidget(
                text: 'Rate the taste',
              ),
              SizedBox(
                height: 9,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothStarRating(
                    rating: double.parse(feedbackModel.taste),
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star_half,
                    defaultIconData: Icons.star_border,
                    allowHalfRating: false,
                    starCount: 5,
                    size: 30,
                    spacing: 22,
                    borderColor: MyTheme.ratingfillColor,
                    color: MyTheme.ratingfillColor,
                  ),
                  Text(stringText(feedbackModel.taste),
                      style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          color: Color(0xff6E6D7A))),
                ],
              ),
              SizedBox(
                height: 19,
              ),
              Textwidget(
                text: 'Rate the ambience',
              ),
              SizedBox(
                height: 9,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothStarRating(
                    rating: double.parse(feedbackModel.ambience),
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star_half,
                    defaultIconData: Icons.star_border,
                    allowHalfRating: false,
                    starCount: 5,
                    size: 30,
                    spacing: 22,
                    borderColor: MyTheme.ratingfillColor,
                    color: MyTheme.ratingfillColor,
                  ),
                  Text(stringText(feedbackModel.ambience),
                      style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          color: Color(0xff6E6D7A))),
                ],
              ),
              SizedBox(
                height: 19,
              ),
              Textwidget(
                text: 'Rate the serving time',
              ),
              SizedBox(
                height: 9,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothStarRating(
                    rating: double.parse(feedbackModel.serving_time),
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star_half,
                    defaultIconData: Icons.star_border,
                    allowHalfRating: false,
                    starCount: 5,
                    size: 30,
                    spacing: 22,
                    borderColor: MyTheme.ratingfillColor,
                    color: MyTheme.ratingfillColor,
                  ),
                  Text(stringText(feedbackModel.serving_time),
                      style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          color: Color(0xff6E6D7A))),
                ],
              ),
              SizedBox(
                height: 17,
              ),
              Container(
                decoration: BoxDecoration(
                    color: MyTheme.appbackgroundColor,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: MyTheme.borderColor,
                      width: 1,
                    )),
                height: 92,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                      feedbackModel.feedback,
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(
                        overflow: TextOverflow.visible,
                        fontSize: 12,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.normal,
                        color: MyTheme.text3Color,
                      )),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 17,
              ),
              Container(
                decoration: BoxDecoration(
                  color: MyTheme.containerColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                height: 228,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  getUrl(feedbackModel.image),
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage("assets/images/imgLogo.png"),
                        ),
                        Text(
                          "Mo Image Provided",
                          style: GoogleFonts.inter(),
                        )
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Hero(
                tag: feedbackModel.id,
                child: OnboardingButton(
                  height: 44,
                  onTap: () {
                    Get.back();
                  },
                  buttonbackgroundColor: MyTheme.buttonchangeColor,
                  text: 'Back',
                  buttontextColor: MyTheme.buttontextchangeColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 17,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
