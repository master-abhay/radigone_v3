import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:radigone_v3/resources/components/custom_button.dart';
import 'package:radigone_v3/resources/components/custom_text_field.dart';
import 'package:radigone_v3/view_model/services/auth_services.dart';
import 'package:radigone_v3/view_model/services/media_services.dart';
import 'package:radigone_v3/view_model/services/navigation_services.dart';
import 'package:radigone_v3/view_model/user_view_model/side_menu_bar_view_models/create_ticket_viewModel.dart';

import '../../../resources/components/background_designs.dart';
import '../../../resources/components/custom_file_upload_container.dart';
import '../../../resources/components/custom_header.dart';
import '../../../view_model/services/alert_services.dart';

class CreateTicketView extends StatefulWidget {
  const CreateTicketView({super.key});

  @override
  State<CreateTicketView> createState() => _CreateTicketViewState();
}

class _CreateTicketViewState extends State<CreateTicketView> {
  late AuthService _authService;
  late MediaServices _mediaServices;
  late NavigationServices _navigationServices;
  late AlertServices _alertServices;

  late TextEditingController nameTextController;
  late TextEditingController emailTextController;
  late TextEditingController subjectTextController;
  late TextEditingController messageTextController;

  FocusNode nameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode subjectFocusNode = FocusNode();
  FocusNode messageFocusNode = FocusNode();

  String username = '';
  String email = '';

  Future<void> initialData() async {



    username = await _authService.getUserName() ?? '';
    email = await _authService.getUserEmail() ?? '';

    setState(() {
      nameTextController.text = username;
      emailTextController.text = email;
    });



  }

  @override
  void initState() {
    super.initState();
    final GetIt getIt = GetIt.instance;
    _authService = getIt.get<AuthService>();
    _mediaServices = getIt.get<MediaServices>();
    _navigationServices = getIt.get<NavigationServices>();
    _alertServices = getIt.get<AlertServices>();

    // Initialize the controllers synchronously
    nameTextController = TextEditingController();
    emailTextController = TextEditingController();
    subjectTextController = TextEditingController();
    messageTextController = TextEditingController();

    initialData();

    WidgetsBinding.instance.addPostFrameCallback((_){
      final provider = Provider.of<CreateTicketViewModel>(context, listen: false);
      provider.clearSelectedFiles();
    });
  }


  @override
  void dispose() {
    if (kDebugMode) {
      print("Dispose Called");
    }
    nameTextController.dispose();
    emailTextController.dispose();
    subjectTextController.dispose();
    messageTextController.dispose();
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    subjectFocusNode.dispose();
    messageFocusNode.dispose();
    // selectedFiles.clear();
    super.dispose();
  }

  // List<File> selectedFiles = [];

  Future<void> pickFile() async {
    File? file = await _mediaServices.getImageFromGallery();

    final provider = Provider.of<CreateTicketViewModel>(context, listen: false);
    if (file != null) {
      provider.setSelectedFiles(file);
    } else {
      if (kDebugMode) {
        print("Image Not selected..");
      }
    }
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
          title: "Create Support Ticket",
        ),
        Consumer<CreateTicketViewModel>(builder: (context, provider, _) {

        return  provider.isLoading ? const Center(child: CircularProgressIndicator(color: Colors.white,strokeWidth: 1.5,),)
          : Container(
            margin: const EdgeInsets.only(top: 130, bottom: 10),
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                      currentFocusNode: nameFocusNode,
                      nextFocusNode: emailFocusNode,
                      controller: nameTextController,
                      obscureText: false,
                      autofocus: false,
                      hintText: "Name",
                      isNumber: false,
                      onChanged: (value) {
                        nameTextController.text = value!;
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                      currentFocusNode: emailFocusNode,
                      nextFocusNode: subjectFocusNode,
                      controller: emailTextController,
                      obscureText: false,
                      autofocus: false,
                      hintText: "Email",
                      isNumber: false,
                      onChanged: (value) {
                        emailTextController.text = value!;
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                      currentFocusNode: subjectFocusNode,
                      nextFocusNode: messageFocusNode,
                      controller: subjectTextController,
                      obscureText: false,
                      autofocus: true,
                      hintText: "Subject",
                      isNumber: false,
                      onChanged: (value) {
                        subjectTextController.text = value!;
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                      currentFocusNode: messageFocusNode,
                      controller: messageTextController,
                      obscureText: false,
                      maxLines: 5,
                      hintText: "Message",
                      isNumber: false,
                      textCapitalization: true,
                      onChanged: (value) {
                        messageTextController.text = value!;
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: provider.selectedFiles
                        .map((file) => CustomFileUploadContainer(file: file!,onTap: (){
                          provider.removeFileFromList(file);
                    },))
                        .toList(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: pickFile,
                    child: const Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [Text("Attach File"), Icon(Icons.add)]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 150,
                          child: CustomButton(
                              buttonName: "Submit",
                              isLoading: false,
                              isGradient: true,
                              onTap: () async{
                                provider.setName(nameTextController.text);
                                provider.setEmail(emailTextController.text);
                                provider.setSubject(subjectTextController.text);
                                provider.setMessage(messageTextController.text);


                               bool result = await provider.createTicket(context);
                               debugPrint(result.toString());
                               if(result){

                                 setState(() {
                                   subjectTextController.clear();
                                   messageTextController.clear();
                                 });
                               }
                              })),
                      SizedBox(
                          width: 150,
                          child: CustomButton(
                              buttonName: "Cancel",
                              isLoading: false,
                              isGradient: false,
                              onTap: () {
                                provider.clearSelectedFiles();
                                subjectTextController.clear();
                                messageTextController.clear();
                                _navigationServices.goBack();
                              }))
                    ],
                  )
                ],
              ),
            ),
          );
        })
      ],
    );
  }
}

