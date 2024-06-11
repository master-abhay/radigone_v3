import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:radigone_v3/resources/components/background_designs.dart';
import 'package:radigone_v3/resources/components/custom_header.dart';
import 'package:radigone_v3/view/sponsor_view/side_menu_bar_view/sponsor_close_reply_ticket_view.dart';
import 'package:radigone_v3/view_model/sponsor_view_model/sponsor_sidebar_view_models/sponsor_myTickets_viewModel.dart';

import '../../../resources/components/custom_support_ticket_tile.dart';
import '../../../view_model/services/navigation_services.dart';

class SponsorMyTicketsView extends StatefulWidget {
  const SponsorMyTicketsView({super.key});

  @override
  State<SponsorMyTicketsView> createState() => _SponsorMyTicketsViewState();
}

class _SponsorMyTicketsViewState extends State<SponsorMyTicketsView> {
  late NavigationServices _navigationServices;

  @override
  void initState() {
    super.initState();
    final GetIt _getIt = GetIt.instance;
    _navigationServices = _getIt.get<NavigationServices>();

    WidgetsBinding.instance.addPostFrameCallback((callback) {
      final provider =
          Provider.of<SponsorMyTicketsViewModel>(context, listen: false);
      provider.fetchMyTickets(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    return Stack(
      children: [
        const LowerBackgroundDesign(),
        const UpperBackgroundDesign(),
        CustomHeaderWithBackButton(
          title: "My Tickets",
        ),
        Container(
          margin: const EdgeInsets.only(top: 120, bottom: 10),
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return CustomSupportTicketTile(
                          subject: "subject",
                          emailAddress: "emailAddress",
                          status: "status",
                          lastReply: "lastReply",
                          imageUrl: null,
                          edit: () {
                            _navigationServices.push(MaterialPageRoute(builder: (context)=>SponsorCloseReplyTicketView(ticket: "Ticket Id", supportTicketId: "supportTicketId", subject: "subject", status: "status")));
                          },
                          delete: () {});
                    })

                // Consumer<SponsorMyTicketsViewModel>(
                //     builder: (context, providerValue, _) {
                //       switch (providerValue.myTickets.status) {
                //         case Status.LOADING:
                //           return const Center(
                //             child: CircularProgressIndicator(
                //               color: Colors.white,
                //               strokeWidth: 1.5,
                //             ),
                //           );
                //
                //         case Status.ERROR:
                //           return const Center(
                //             child: Text("Something went Wrong"),
                //           );
                //
                //         case Status.COMPLETED:
                //           return ListView.builder(
                //               shrinkWrap: true,
                //               physics: const NeverScrollableScrollPhysics(),
                //               itemCount: providerValue.myTickets.data?.data?.length,
                //               itemBuilder: (context, index) {
                //                 var item =
                //                 providerValue.myTickets.data?.data?[index];
                //                 var ticket =
                //                     '[Ticket#${item?.ticket}]' ?? "Ticket Id";
                //                 var supportTicketId = providerValue
                //                     .myTickets.data?.data?[index].id
                //                     .toString() ??
                //                     'Support Ticket ID';
                //
                //                 var subject = item?.subject != null
                //                     ? item!.subject!.length < 15
                //                     ? item.subject.toString()
                //                     : '${item.subject!.substring(0, 15)}..'
                //                     : 'Subject';
                //                 var status = item?.status == 3 ? 'Closed' : item?.status == 2 ? 'Customer Reply' : item?.status == 1 ? 'Answered' : 'Open';
                //                 String? updatedAt;
                //                 if (item!.updatedAt!.length < 10) {
                //                   updatedAt = item.createdAt;
                //                 } else {
                //                   updatedAt = item.createdAt!.substring(0, 10);
                //                 }
                //                 return GestureDetector(
                //                     onTap: () {
                //                       _navigationServices.push(MaterialPageRoute(
                //                           builder: (context) =>
                //                               CloseReplyTicketView(
                //                                 ticket: ticket,
                //                                 supportTicketId: supportTicketId,
                //                                 subject: subject,
                //                                 status: status,)));
                //                     },
                //                     child: CustomListTile(
                //                       leading: Container(
                //                         height: 50,
                //                         width: 50,
                //                         alignment: Alignment.center,
                //                         decoration: BoxDecoration(
                //                           // color: Colors.green.withOpacity(0.7),
                //                             borderRadius:
                //                             BorderRadius.circular(180)),
                //                         child: SvgPicture.asset(
                //                           "images/images_user_sidebar/coupons.svg",
                //                           height: 22,
                //                           width: 22,
                //                         ),
                //                       ),
                //                       title: ticket,
                //                       remark: subject,
                //                       value: status,
                //                       time: updatedAt,
                //                     ));
                //               });
                //         case null:
                //           return const Center(
                //             child: Text("Something went Wrong"),
                //           );
                //       }
                //     })
              ],
            ),
          ),
        )
      ],
    );
  }
}
