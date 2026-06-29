import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';

import '/presentation/widget/loading_widget.dart';
import '../../../../presentation/utils/constraints.dart';
import '../../../../presentation/widget/custom_rounded_app_bar.dart';
import '../../../../presentation/widget/custom_test_style.dart';
import '../../../logic/cubit/privacy_policy/privacy_policy_cubit.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  Widget conditionText(String heading, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextStyle(
          text: heading,
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
          color: blackColor,
        ),
        const SizedBox(height: 4.0),
        Text(
          text,
          textAlign: TextAlign.justify,
          style: GoogleFonts.dmSans(
              height: 1.6,
              fontWeight: FontWeight.w400,
              color: grayColor,
              fontSize: 14.0),
        ),
        const SizedBox(height: 8.0),
      ],
    );
  }

  Widget sectionTitle(String title) => Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 8),
    child: Text(title,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
  );

  Widget paragraph(String text) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Text(text, style: const TextStyle(fontSize: 13, height: 1.5)),
  );

  @override
  Widget build(BuildContext context) {
    final privacyCubit = context.read<PrivacyPolicyCubit>();
    privacyCubit.getPrivacyPolicy();
    return Scaffold(
      appBar: const CustomRoundedAppBar(
        text: 'Privacy Policy',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            sectionTitle("1. Information Collection"),
            paragraph(
                "This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You."),
            paragraph(
                "We use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy."),

            sectionTitle("2. Personal Data"),
            paragraph("While using Our Service, We may ask You to provide Us with personally identifiable information including:"),
            paragraph("• Email address"),
            paragraph("• First name and last name"),
            paragraph("• Phone number"),
            paragraph("• Address, State, Province, ZIP/Postal code, City"),
            paragraph("• Usage Data"),

            sectionTitle("3. Usage Data"),
            paragraph(
                "Usage Data is collected automatically and may include your IP address, browser type, pages visited, time/date of visit, and device details."),
            paragraph(
                "When using mobile, it may also include device type, OS, unique IDs, and mobile browser details."),

            sectionTitle("4. Retention of Your Data"),
            paragraph(
                "We retain Personal Data only as long as necessary to fulfill legal obligations and business needs."),
            paragraph(
                "Usage Data is typically retained for shorter durations unless required for security or functionality."),

            sectionTitle("6. Transfer of Your Data"),
            paragraph(
                "Your data may be transferred and stored in regions with different laws. Your submission implies consent to such transfers."),
            paragraph(
                "We ensure secure handling and won't transfer your data without proper safeguards."),

            sectionTitle("7. Delete Your Personal Data"),
            paragraph(
                "You may delete, update, or request deletion of your personal data at any time via account settings or by contacting us."),
            paragraph(
                "However, we may retain some data to meet legal obligations."),

            sectionTitle("8. Business Transactions"),
            paragraph(
                "If the company undergoes a merger, acquisition, or asset sale, your data may be transferred with notice provided beforehand."),

            sectionTitle("9. Security of Your Personal Data"),
            paragraph(
                "We use commercially acceptable means to protect your data, but no method is 100% secure."),

            sectionTitle("Children's Privacy"),
            paragraph(
                "We do not knowingly collect data from anyone under 13. If a child has submitted data, contact us for removal."),

            const SizedBox(height: 20),
            const Text(
              "By using our service, you acknowledge that you have read and accepted our Privacy Policy.",
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ]),
        ),
      )
    );
  }
}

class LoadedPrivacyPolicy extends StatelessWidget {
  const LoadedPrivacyPolicy({super.key, required this.policyText});
  final String policyText;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: borderRadius,
      ),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          // conditionText('1.Eligibility', eligibility),
          // conditionText('2.Cancellation and Refund', refundCondition),
          // conditionText('3.Terms of Service', termsService),
          // conditionText('4.Payment & Refunds', termsService),
          // conditionText('5.Cancel Order', cancelOrder),
          Html(
            data: policyText,
            style: {
              'p': Style(
                textAlign: TextAlign.justify,
              ),
            },
          ),
        ],
      ),
    );
  }
}
