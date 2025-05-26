// import 'dart:io';

// import 'package:car_glow_admin/application/attachment_upload_provider.dart';
// import 'package:car_glow_admin/core/app_imports.dart';
// import 'package:car_glow_admin/core/widgets/app_button.dart';
// import 'package:car_glow_admin/core/widgets/app_loading.dart';
// import 'package:car_glow_admin/entity/image_data_entity.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class AppSingleAttachmentUpload extends StatefulWidget {
//   final ValueChanged<String?> onSelect;
//   final ImageDataEntity? imageDate;

//   const AppSingleAttachmentUpload({
//     super.key,
//     required this.onSelect,
//     this.imageDate,
//   });

//   @override
//   State<AppSingleAttachmentUpload> createState() =>
//       _AppSingleAttachmentUploadState();
// }

// class _AppSingleAttachmentUploadState extends State<AppSingleAttachmentUpload> {
//   final textController = TextEditingController();
//   String signedId = "";

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       final uploadState = context.read<AttachmentUploadProvider>();
//       uploadState.initState();
//       if (widget.imageDate != null) {
//         uploadState.setFileUrl(url: widget.imageDate!.url);
//         setState(() {
//           signedId = widget.imageDate!.signedId;
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<AttachmentUploadProvider>(
//       builder: (context, uploadState, _) {
//         return DottedBorder(
//           dashPattern: [5, 3],
//           strokeWidth: 1.0,
//           color: Colors.black,
//           child: Padding(
//             padding: EdgeInsets.all(20.0),
//             child: uploadState.isLoading
//                 ? AppLoading()
//                 : Center(
//                     child: signedId.isEmpty
//                         ? Column(
//                             spacing: 10.0,
//                             children: [
//                               Icon(
//                                 Icons.cloud_upload,
//                                 size: 50.0,
//                               ),
//                               Text("Drag & Drop attachments here"),
//                               SizedBox(height: 5.0),
//                               AppButton(
//                                 elevation: 0.0,
//                                 fontColor: Colors.black,
//                                 border:
//                                     Border.all(color: context.secondaryColor),
//                                 color: Colors.transparent,
//                                 prefix: Icon(Icons.add_a_photo),
//                                 title: "Select & Upload",
//                                 onPressed: () async {
//                                   final _signedId = await await uploadState
//                                       .selectFile(type: FileType.image);
//                                   if (_signedId.isEmpty) {
//                                     widget.onSelect(null);
//                                   } else {
//                                     setState(() {
//                                       signedId = _signedId;
//                                     });
//                                     widget.onSelect(_signedId);
//                                   }
//                                 },
//                               ),
//                             ],
//                           )
//                         : uploadState.fileUrl.isEmpty
//                             ? Column(
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(uploadState.fileName),
//                                       AppButton.icon(
//                                         icon: Icon(Icons.close),
//                                         onPressed: () {
//                                           setState(() {
//                                             signedId = "";
//                                           });
//                                           uploadState.initState();
//                                         },
//                                       ),
//                                     ],
//                                   ),
//                                   kIsWeb
//                                       ? Image.memory(uploadState.fileBytes!)
//                                       : Image.file(
//                                           File(
//                                             uploadState.file!.path,
//                                           ),
//                                         ),
//                                 ],
//                               )
//                             : Column(
//                                 children: [
//                                   Align(
//                                     alignment: Alignment.centerRight,
//                                     child: AppButton.icon(
//                                       icon: Icon(Icons.close),
//                                       onPressed: () {
//                                         setState(() {
//                                           signedId = "";
//                                         });
//                                         uploadState.initState();
//                                       },
//                                     ),
//                                   ),
//                                   Image.network(uploadState.fileUrl),
//                                 ],
//                               ),
//                   ),
//           ),
//         );
//       },
//     );
//   }
// }
