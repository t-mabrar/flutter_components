// import 'package:flutter/material.dart';

// class AppDropDown extends StatefulWidget {
//   final List<DropdownOption> items;
//   final DropdownOption? initialValue;
//   final String? hintText;
//   final String? labelText;
//   final bool isRequired;
//   final Widget? prefix;
//   final Widget? suffix;
//   final ValueChanged<DropdownOption?>? onSelect;

//   const AppDropDown({
//     super.key,
//     required this.items,
//     this.initialValue,
//     this.hintText,
//     this.labelText,
//     this.isRequired = false,
//     this.prefix,
//     this.suffix,
//     this.onSelect,
//   });

//   @override
//   State<AppDropDown> createState() => _AppDropDownState();
// }

// class _AppDropDownState extends State<AppDropDown> {
//   OverlayEntry? dropdownOverlayEntry;
//   final dropdownLayerLink = LayerLink();
//   final textFieldController = TextEditingController();
//   final selectorKey = GlobalKey();

//   late List<DropdownOption> dropdownOptions;

//   @override
//   void initState() {
//     super.initState();
//     dropdownOptions = List.from(widget.items);
//     if (widget.initialValue != null) {
//       textFieldController.text = widget.initialValue!.title;
//     }
//   }

//   OverlayEntry optionsOverlayEntry() {
//     final RenderBox renderBox =
//         // ignore: cast_nullable_to_non_nullable
//         selectorKey.currentContext!.findRenderObject() as RenderBox;
//     final size = renderBox.size;
//     final offset = renderBox.localToGlobal(Offset.zero);
//     final positionHeight = context.height - offset.dy > 250
//         ? size.height + 3.0
//         : dropdownOptions.length * 20.0 < 240.0
//             ? -(dropdownOptions.length * 20.0 + size.height)
//             : -255.0;
//     final positionWidth = context.width - offset.dx < 250.0
//         ? -(250 - (context.width - offset.dx))
//         : 0.0;
//     final _optionsToShow = dropdownOptions.where(
//       (eachEntry) => !(textFieldController.text.toLowerCase() ==
//           eachEntry.title.toLowerCase()),
//     );
//     return OverlayEntry(
//       builder: (context) => Stack(
//         children: [
//           Positioned.fill(
//             child: GestureDetector(
//               onTap: () {
//                 dropdownOverlayEntry?.remove();
//                 dropdownOverlayEntry = null;
//               },
//             ),
//           ),
//           Positioned(
//             width: size.width,
//             child: CompositedTransformFollower(
//               link: dropdownLayerLink,
//               showWhenUnlinked: false,
//               offset: Offset(positionWidth, positionHeight),
//               child: ConstrainedBox(
//                 constraints: BoxConstraints(maxHeight: 250.0),
//                 child: StatefulBuilder(
//                   builder: (context, snapState) {
//                     return TextFieldTapRegion(
//                       child: Material(
//                         elevation: 5.0,
//                         color: Colors.white,
//                         child: _optionsToShow.isEmpty
//                             ? const AppNoOptions()
//                             : SingleChildScrollView(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     ..._optionsToShow.map((eachMapEntry) {
//                                       return Container(
//                                         width: double.infinity,
//                                         color: eachMapEntry.title.toString() ==
//                                                 textFieldController.text
//                                             ? Colors.grey.withAlpha(50)
//                                             : Colors.transparent,
//                                         child: InkWell(
//                                           child: Container(
//                                             padding: const EdgeInsets.symmetric(
//                                               horizontal: 10.0,
//                                               vertical: 7.0,
//                                             ),
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 Flexible(
//                                                   child: Text(
//                                                     eachMapEntry.title
//                                                         .toString(),
//                                                     style: context
//                                                         .textTheme.titleSmall,
//                                                   ),
//                                                 ),
//                                                 if (eachMapEntry.extraInfo !=
//                                                     null) ...[
//                                                   if (eachMapEntry.extraInfo![
//                                                           'second_title'] !=
//                                                       null) ...[
//                                                     if (eachMapEntry.extraInfo![
//                                                             'second_title']
//                                                         .toString()
//                                                         .isNotEmpty) ...[
//                                                       Text(
//                                                           eachMapEntry
//                                                               .extraInfo![
//                                                                   'second_title']
//                                                               .toString(),
//                                                           style: context
//                                                               .textTheme
//                                                               .bodyMedium!
//                                                               .copyWith(
//                                                             color: Colors.grey,
//                                                             fontStyle: FontStyle
//                                                                 .italic,
//                                                           ))
//                                                     ]
//                                                   ]
//                                                 ]
//                                               ],
//                                             ),
//                                           ),
//                                           onTap: () {
//                                             textFieldController.text =
//                                                 eachMapEntry.title;
//                                             dropdownOverlayEntry?.remove();
//                                             dropdownOverlayEntry = null;
//                                             if (widget.onSelect != null)
//                                               widget.onSelect!(
//                                                 eachMapEntry,
//                                               );
//                                           },
//                                         ),
//                                       );
//                                     }),
//                                   ],
//                                 ),
//                               ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CompositedTransformTarget(
//       key: selectorKey,
//       link: dropdownLayerLink,
//       child: AppTextField(
//         onChanged: (query) {
//           if (widget.onSelect != null) widget.onSelect!(null);
//           setState(() {
//             if (query.isNotEmpty) {
//               dropdownOptions = widget.items
//                   .where(
//                     (eachOption) => eachOption.title.toLowerCase().contains(
//                           query.toLowerCase(),
//                         ),
//                   )
//                   .toList();
//             } else {
//               dropdownOptions = List.from(widget.items);
//             }
//           });
//           if (dropdownOptions.length == 1 && widget.onSelect != null) {
//             if (query.toLowerCase() ==
//                 dropdownOptions.first.title.toLowerCase()) {
//               widget.onSelect!(
//                 DropdownOption(
//                   key: dropdownOptions.first.key,
//                   title: dropdownOptions.first.title,
//                   extraInfo: dropdownOptions.first.extraInfo,
//                 ),
//               );
//             }
//           }
//           dropdownOverlayEntry?.remove();
//           dropdownOverlayEntry = null;
//           dropdownOverlayEntry = optionsOverlayEntry();
//           Overlay.of(context).insert(dropdownOverlayEntry!);
//         },
//         controller: textFieldController,
//         onTap: () {
//           dropdownOverlayEntry?.remove();
//           dropdownOverlayEntry = null;
//           dropdownOverlayEntry = optionsOverlayEntry();
//           Overlay.of(context).insert(dropdownOverlayEntry!);
//         },
//         hintText: widget.hintText,
//         suffix: widget.suffix ?? Icon(Icons.arrow_drop_down),
//         prefix: widget.prefix,
//         validator: widget.isRequired ? AppValidations.requiredField : null,
//         labelText: widget.labelText,
//       ),
//     );
//   }
// }
