import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '/logic/cubit/review/review_cubit.dart';
import '../../../data/model/about_us/about_us_model.dart';
import '../../../logic/bloc/login/login_bloc.dart';
import '../../../logic/cubit/about_us/about_us_cubit.dart';
import '../../utils/constraints.dart';
import '../../utils/k_images.dart';
import '../../widget/custom_rounded_app_bar.dart';
import '../../widget/custom_test_style.dart';
import '../../widget/loading_widget.dart';
import '../home/component/fun_fact_section.dart';
import 'component/customer_feedback.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  final space = const SizedBox(height: 20.0);

  Widget title(String text) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: Text(text,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
  );

  Widget paragraph(String text) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Text(text, style: const TextStyle(fontSize: 13, height: 1.5)),
  );

  @override
  Widget build(BuildContext context) {
    final aboutUsCubit = context.read<AboutUsCubit>();
    //aboutUsCubit.getAboutUs();
    final list = [
      KImages.aboutUsImage01,
      KImages.aboutUsImage02,
    ];
    return Scaffold(
      appBar:
          CustomRoundedAppBar(text: "About Us"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            title('About MatPit Consultancy'),
            paragraph(
                'MatPit Consultancy has been a trusted leader in real estate and '
                    'legal services in Jodhpur for over 18 years. With a strong track '
                    'record of successfully completing more than 14 major projects, we '
                    'have expanded our expertise to over 30 cities and helped over 5,000 '
                    'clients secure their dream properties—all with clear titles. Collaborating '
                    'with 100+ skilled real estate agents, we pride ourselves on transparency '
                    'and deep industry knowledge.'
            ),
            title('What We Do'),
            paragraph(
                'We understand our clients’ unique needs and efficiently resolve '
                    'all real estate-related challenges. Our comprehensive services include '
                    'RERA Registration, Airport & Fire NOCs, JDA & Nagar Nigam Approvals, '
                    'Property Registration, Deed & Agreement Drafting, Land Leases, and '
                    'Name Transfers.'
            ),
            paragraph(
                'We manage all legal complexities and paperwork to ensure your real '
                    'estate journey is smooth, secure, and stress-free. Our professional '
                    'team supports you at every step—before and after the transaction—'
                    'empowering you to make confident, well-informed decisions.'
            ),
            title('Why Choose Us'),
            paragraph(
                '✓ 18+ years of experience in Jodhpur and beyond\n'
                    '✓ Over 14 completed projects in 30+ cities\n'
                    '✓ 5,000+ satisfied clients\n'
                    '✓ Collaborating with 100+ authorized agents\n'
                    '✓ Full-service legal and documentation support'
            ),
            title('Our Service Offerings'),
            paragraph(
                '- Residential & Commercial Realty\n'
                    '- Villas, Flats, Hotels, Farmhouses, Plots\n'
                    '- Legal Support & RERA Registration\n'
                    '- Architect Services & Home Loans\n'
                    '- Social Media Marketing & MBA Pricing Guidance'
            ),
            title('Our Approach'),
            paragraph(
                '1. Contract: We begin with a clear agreement.\n'
                    '2. Location: We help choose the best property location.\n'
                    '3. Start Small: We scale the journey as you progress.\n'
                    '4. Hire Agent: We connect you with authorized agents.'
            ),
            title('Testimonials'),
            paragraph(
                '"With years of experience, we have provided our clients with excellent real estate services. Our clients are highly satisfied with our transparent approach and clear title properties."'
            ),
            title('Get in Touch'),
            paragraph(
                'Flat no 305, Jeet Apartment, Ratanada, Jodhpur 342001\n'
                    'Phone: 7665454548 / 8094962100\n'
                    'Email: matpit.jodhpur@gmail.com'
            ),
          ]),
        )
      )
    );
  }
}

class AboutUsLoadedWidget extends StatelessWidget {
  const AboutUsLoadedWidget({super.key, required this.aboutUs});

  final AboutUsModel aboutUs;

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 20.0);
    final reviewCubit = context.read<ReviewCubit>();
    final loginBloc = context.read<LoginBloc>();
    print('reviewsss ${reviewCubit.reviews.length}');
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              space,
              CustomTextStyle(
                text: aboutUs.aboutUs!.shortTitle,
                fontSize: 18.0,
                color: blackColor,
                fontWeight: FontWeight.w600,
              ),
              Text(
                aboutUs.aboutUs!.description1,
                textAlign: TextAlign.justify,
                style: GoogleFonts.dmSans(
                  fontSize: 14.0,
                  color: grayColor,
                  height: 1.8,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                aboutUs.aboutUs!.description2,
                textAlign: TextAlign.justify,
                style: GoogleFonts.dmSans(
                  fontSize: 14.0,
                  color: grayColor,
                  height: 1.8,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        FunFactSection(counter: aboutUs.counter!),
        space,
        if (loginBloc.userInfo != null &&
            loginBloc.userInfo!.accessToken.isNotEmpty) ...[
          Visibility(
              visible: reviewCubit.reviews.isNotEmpty,
              child: const CustomerFeedback()),
        ],
        const SizedBox(height: 40.0),
      ],
    );
  }
}
