import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../presentation/utils/constraints.dart';
import '../../../../presentation/widget/custom_rounded_app_bar.dart';
import '../../../../presentation/widget/custom_test_style.dart';
import '../../../logic/cubit/privacy_policy/privacy_policy_cubit.dart';
import '../../widget/loading_widget.dart';

class TermsAndConditionScreen extends StatelessWidget {
  const TermsAndConditionScreen({super.key});

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

  Widget sectionTitle(String text) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: Text(text,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
  );

  Widget bullet(String text) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("• ", style: TextStyle(fontSize: 16)),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 13))),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final privacyCubit = context.read<PrivacyPolicyCubit>();
    privacyCubit.getTermsAndCondition();
    return Scaffold(
      appBar: const CustomRoundedAppBar(
        text: 'Terms & Conditions',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome to matpit.com, a platform dedicated to providing clear title properties for sale or rent. By accessing and using our website, you agree to be bound by these Terms and Conditions.",
                style: TextStyle(fontSize: 16),
              ),

              sectionTitle("1. Clear Title Properties"),
              bullet(
                  "We deal only in RERA-registered, clear title properties free from legal disputes or encumbrances."),
              bullet(
                  "Our listings offer transparency and reliability for confident investment."),

              sectionTitle("2. Property Listings"),
              bullet("Listings come only from verified owners or authorized agents."),
              bullet("A strict authentication process is in place."),
              bullet("Agents must submit valid authorization documents."),

              sectionTitle("3. User Responsibilities"),
              bullet("Users must do their own due diligence before any transaction."),
              bullet("Title Verification, Documentation, Physical Inspection, RERA, Legal Clearance, Market Research, Financial Planning."),
              bullet(
                  "We recommend consulting legal/property experts for verification."),

              sectionTitle("4. Disclaimer"),
              bullet("We strive for accuracy, but some data may not be current."),
              bullet("Users are responsible for verifying property details."),
              bullet("Listings may change without notice."),
              bullet("Some data may come from third-party sources."),

              sectionTitle("5. Limitation of Liability"),
              bullet("We are not liable for financial loss from website use."),
              bullet("Use at your own risk."),
              bullet("External market or legal factors are not our responsibility."),
              bullet(
                  "Our platform is not a substitute for professional legal or financial advice."),

              sectionTitle("6. Governing Law"),
              bullet("Indian Contract Act, 1872"),
              bullet("Transfer of Property Act, 1882"),
              bullet("RERA Act, 2016"),
              bullet("Information Technology Act, 2000"),

              sectionTitle("7. Dispute Resolution"),
              bullet("Notice of dispute"),
              bullet("Direct negotiation → Mediation → Arbitration → Court"),
              bullet("Jurisdiction: Rajasthan High Court at Jodhpur"),

              sectionTitle("8. Changes to Terms and Conditions"),
              bullet("We may change terms without prior notice."),
              bullet("Changes are effective immediately upon website posting."),
              bullet(
                  "Users must regularly check and accept the latest Terms and Conditions."),

              sectionTitle("9. Contact Us"),
              const Text(
                "If you have any questions, contact us at matpitindia@gmail.com",
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 20),
              const Text(
                "By using our website, you acknowledge that you have read, understood, and agree to be bound by these Terms and Conditions.",
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoadedTermsCondition extends StatelessWidget {
  const LoadedTermsCondition({super.key, required this.termsConditionText});
  final String termsConditionText;

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
          Html(
            data: termsConditionText,
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
