import 'package:flutter/material.dart';
// import 'package:readyplates_restaurants/utils/my_color.dart';

class OnboardingButton extends StatelessWidget {
  final void Function() onTap;
  final Color buttonbackgroundColor;

  final String text;
  final Color buttontextColor;
  const OnboardingButton(
      {Key? key,
      required this.onTap,
      required this.buttonbackgroundColor,
      required this.text,
      required this.buttontextColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: onTap,

        //  () async {
        //   formKey.currentState!.save();
        //   if (formKey.currentState!.validate())
        //     controller.onboardingApi(OnBoardingMethod.api1);
        // },
        child: Container(
          height: 40.11,
          decoration: BoxDecoration(
            color: buttonbackgroundColor,
            //  (
            //    controller.resNameController.text.isEmpty ||
            //         controller.firstNameController.text.isEmpty ||
            //         controller.lastNameController.text.isEmpty ||
            //         controller.ownemailController.text.isEmpty ||
            //         controller.ownMobileController.text.isEmpty ||
            //         controller.rescity.isEmpty ||
            //         controller.pocController.text.isEmpty ||
            //         controller.pocNumberController.text.isEmpty)
            //     ? MyTheme.buttonColor
            //     : MyTheme.buttonchangeColor,
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          child: Center(
            child: Text(
              text,
              // 'CONTINUE',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                fontFamily: 'Inter-Regular',
                fontWeight: FontWeight.w600,
                letterSpacing: -0.28,
                // color: MyTheme.buttontextColor,
                color: buttontextColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
