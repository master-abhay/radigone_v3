import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:radigone_v3/resources/colors.dart';
import 'package:radigone_v3/resources/components/background_designs.dart';
import 'package:radigone_v3/resources/components/custom_file_upload_container.dart';
import 'package:radigone_v3/resources/components/custom_header.dart';
import 'package:radigone_v3/resources/components/custom_textIcon_button.dart';
import 'package:radigone_v3/resources/components/custom_text_field.dart';
import 'package:radigone_v3/view_model/services/alert_services.dart';
import 'package:radigone_v3/view_model/services/media_services.dart';
import 'package:radigone_v3/view_model/user_view_model/side_menu_bar_view_models/close_reply_ticket_viewModel.dart';

import '../../../view_model/services/navigation_services.dart';

class CloseReplyTicketView extends StatefulWidget {
  final String ticket, supportTicketId, subject, status;

  const CloseReplyTicketView(
      {super.key,
      required this.ticket,
      required this.supportTicketId,
      required this.subject,
      required this.status});

  @override
  State<CloseReplyTicketView> createState() => _CloseReplyTicketViewState();
}

class _CloseReplyTicketViewState extends State<CloseReplyTicketView> {
  late NavigationServices _navigationServices;
  late AlertServices _alertServices;
  late MediaServices _mediaServices;

  late TextEditingController replyController;

  FocusNode replyFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    final GetIt _getIt = GetIt.instance;
    _navigationServices = _getIt.get<NavigationServices>();
    _alertServices = _getIt.get<AlertServices>();
    _mediaServices = _getIt.get<MediaServices>();

    initializeValues();
  }

  Future<void> initializeValues() async {
    replyController = TextEditingController();
  }

  Future<void> pickFile() async {
    File? file = await _mediaServices.getSingleFileFromPicker();
    final provider =
        Provider.of<CloseReplyTicketViewmodel>(context, listen: false);
    if (file != null) {
      provider.addFileToList(file);
    } else {
      if (kDebugMode) {
        print('No file Selected');
      }
    }
  }

  @override
  void dispose() {
    replyController.dispose();
    super.dispose();
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
        CustomHeader(
          title: widget.ticket,
        ),
        Consumer<CloseReplyTicketViewmodel>(builder: (context, provider, _) {
          return provider.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 1.5,
                  ),
                )
              : Container(
                  margin: const EdgeInsets.only(top: 120, bottom: 10),
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.zero,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                            currentFocusNode: replyFocusNode,
                            controller: replyController,
                            obscureText: false,
                            hintText: "Reply",
                            maxLines: 7,
                            textCapitalization: true,
                            onChanged: (value) {
                              replyController.text = value!;
                            }),
                        Column(
                          children: provider.selectedFileList
                              .map((file) => CustomFileUploadContainer(
                                    file: file,
                                    onTap: () {
                                      provider.removeFileFromList(file);
                                    },
                                  ))
                              .toList(),
                        ),
                        attachFile(),
                        const SizedBox(
                          height: 20,
                        ),
                        submitButtons()
                      ],
                    ),
                  ));
        })
      ],
    );
  }

  Widget attachFile() {
    return TextButton(
      onPressed: () {
        pickFile();
      },
      child: const Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [Text("Attach File"), Icon(Icons.attach_file)],
      ),
    );
  }

  Widget submitButtons() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomTextIconButton(
          elevation: 1,
          gradient: MyColorScheme.defaultButtonGradient,
          text: 'Close Ticket',
          textColor: Colors.white,
          icon: const Icon(
            Icons.cut,
            color: Colors.white,
          ),
          onTap: () async {
            final provider =
                Provider.of<CloseReplyTicketViewmodel>(context, listen: false);
         bool result = await  provider.closeTicket(
                ticketId: widget.supportTicketId, context: context);

         if(result){
           provider.clearAllFiles();
           replyController.clear();
         }


          },
        ),
        CustomTextIconButton(
          elevation: 1,
          gradient: MyColorScheme.yellowLinearGradient,
          text: "Reply",
          textColor: MyColorScheme.lightGrey3,
          icon: const Icon(Icons.send),
          onTap: () async {
            //last Step
          },
        )
      ],
    );
  }
}
