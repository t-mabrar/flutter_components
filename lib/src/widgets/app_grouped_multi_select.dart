// import 'dart:async';

// import 'package:car_glow_admin/core/app_imports.dart';
// import 'package:car_glow_admin/core/widgets/app_button.dart';
// import 'package:car_glow_admin/core/widgets/app_no_options.dart';
// import 'package:car_glow_admin/core/widgets/app_text_field.dart';
// import 'package:car_glow_admin/entity/core/grouped_dropdown_option_entity.dart';
// import 'package:flutter/material.dart';

// class AppGroupedMultiSelect extends StatefulWidget {
//   final List<GroupedDropdownOption> items;
//   final List<GroupedDropdownOption>? initialValue;
//   final String? hintText;
//   final String? labelText;
//   final Widget? prefix;
//   final Widget? suffix;
//   final ValueChanged<List<GroupedDropdownOption>> onSelect;
//   final AppValidations? validator;

//   const AppGroupedMultiSelect({
//     super.key,
//     required this.items,
//     this.initialValue,
//     this.hintText,
//     this.labelText,
//     this.prefix,
//     this.suffix,
//     required this.onSelect,
//     this.validator,
//   });

//   @override
//   State<AppGroupedMultiSelect> createState() => _AppGroupedMultiSelectState();
// }

// class _AppGroupedMultiSelectState extends State<AppGroupedMultiSelect> {
//   OverlayEntry? dropdownOverlayEntry;
//   final dropdownLayerLink = LayerLink();

//   // final textFieldController = TextEditingController();
//   final selectorKey = GlobalKey();
//   List<GroupedDropdownOption> _selectedItems = [];
//   late List<GroupedDropdownOption> dropdownOptions;

//   GlobalKey<FormFieldState<List<GroupedDropdownOption>>>? fieldState;

//   @override
//   void initState() {
//     super.initState();
//     if (widget.initialValue != null) {
//       _selectedItems = widget.initialValue ?? [];
//     }
//     dropdownOptions = List.from(widget.items);
//   }

//   void addItem(GroupedDropdownOption option) {
//     final contains = _selectedItems
//         .where((eachValue) => eachValue.key == option.key)
//         .toList()
//         .isEmpty;
//     if (contains) {
//       setState(() {
//         _selectedItems.add(option);
//       });
//       widget.onSelect(_selectedItems);
//     }
//     dropdownOverlayEntry?.remove();
//     dropdownOverlayEntry = null;
//     Timer(Duration(milliseconds: 5), () {
//       dropdownOverlayEntry = optionsOverlayEntry();
//       Overlay.of(context).insert(dropdownOverlayEntry!);
//     });
//     fieldState?.currentState?.didChange(_selectedItems);
//   }

//   void removeItem(GroupedDropdownOption option) {
//     if (_selectedItems.contains(option)) {
//       setState(() {
//         _selectedItems.remove(option);
//       });
//       widget.onSelect(_selectedItems);
//     }
//     fieldState?.currentState?.didChange(_selectedItems);
//   }

//   OverlayEntry optionsOverlayEntry() {
//     final RenderBox renderBox =
//         // ignore: cast_nullable_to_non_nullable
//         selectorKey.currentContext!.findRenderObject() as RenderBox;
//     final size = renderBox.size;
//     final offset = renderBox.localToGlobal(Offset.zero);
//     int _length = 0;
//     _length += dropdownOptions.length;
//     dropdownOptions.forEach((eachOption) {
//       _length += eachOption.subItems == null || eachOption.subItems!.isEmpty
//           ? 1
//           : eachOption.subItems!.length;
//     });
//     final positionHeight = context.height - offset.dy > 250
//         ? size.height + 3.0
//         : _length * 25.0 < 240.0
//             ? -(_length * 25.0 + size.height)
//             : -255.0;
//     final positionWidth = context.width - offset.dx < 250.0
//         ? -(250 - (context.width - offset.dx))
//         : 0.0;

//     return OverlayEntry(
//       builder: (context) {
//         return Stack(
//           children: [
//             Positioned.fill(
//               child: GestureDetector(
//                 onTap: () {
//                   dropdownOverlayEntry?.remove();
//                   dropdownOverlayEntry = null;
//                 },
//               ),
//             ),
//             Positioned(
//               width: size.width,
//               child: CompositedTransformFollower(
//                 link: dropdownLayerLink,
//                 showWhenUnlinked: false,
//                 offset: Offset(positionWidth, positionHeight),
//                 child: StatefulBuilder(
//                   builder: (context, snapState) {
//                     return TextFieldTapRegion(
//                       child: Material(
//                         elevation: 5.0,
//                         color: Colors.white,
//                         child: dropdownOptions.isEmpty
//                             ? const AppNoOptions()
//                             : ConstrainedBox(
//                                 constraints: BoxConstraints(maxHeight: 250.0),
//                                 child: SingleChildScrollView(
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(12.0),
//                                     child: Column(
//                                       mainAxisSize: MainAxisSize.min,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         ...dropdownOptions.map((
//                                           eachMainOption,
//                                         ) {
//                                           return Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             mainAxisSize: MainAxisSize.min,
//                                             children: [
//                                               Text(
//                                                 eachMainOption.title,
//                                                 style: context
//                                                     .textTheme.bodyMedium!
//                                                     .copyWith(
//                                                   color: Colors.grey,
//                                                 ),
//                                               ),
//                                               if ((eachMainOption.subItems ??
//                                                       [])
//                                                   .isEmpty) ...[
//                                                 Padding(
//                                                   padding:
//                                                       const EdgeInsets.only(
//                                                     left: 20.0,
//                                                     top: 10.0,
//                                                     bottom: 10.0,
//                                                   ),
//                                                   child: Text(
//                                                     "---No Results Found---",
//                                                   ),
//                                                 ),
//                                               ] else
//                                                 ...(eachMainOption.subItems ??
//                                                         [])
//                                                     .map((
//                                                   eachSubOption,
//                                                 ) {
//                                                   final _contains =
//                                                       _selectedItems
//                                                           .where((eachValue) =>
//                                                               eachValue.key ==
//                                                               eachSubOption.key)
//                                                           .toList()
//                                                           .isNotEmpty;
//                                                   return Container(
//                                                     width: double.infinity,
//                                                     color: _contains
//                                                         ? Colors.grey
//                                                             .withAlpha(50)
//                                                         : Colors.transparent,
//                                                     child: InkWell(
//                                                       child: Container(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                 .symmetric(
//                                                           horizontal: 10.0,
//                                                           vertical: 7.0,
//                                                         ),
//                                                         child: Text(
//                                                           eachSubOption.title
//                                                               .toString(),
//                                                           style: context
//                                                               .textTheme
//                                                               .titleSmall,
//                                                         ),
//                                                       ),
//                                                       onTap: _contains
//                                                           ? null
//                                                           : () {
//                                                               snapState(() {});
//                                                               final item =
//                                                                   GroupedDropdownOption(
//                                                                 extraInfo:
//                                                                     eachSubOption
//                                                                         .extraInfo,
//                                                                 key:
//                                                                     eachSubOption
//                                                                         .key,
//                                                                 title:
//                                                                     eachSubOption
//                                                                         .title,
//                                                                 parentKey:
//                                                                     eachMainOption
//                                                                         .key,
//                                                                 parentTitle:
//                                                                     eachMainOption
//                                                                         .title,
//                                                               );
//                                                               addItem(item);
//                                                             },
//                                                     ),
//                                                   );
//                                                 }).toList(),
//                                             ],
//                                           );
//                                         }),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _filterData(String query) {
//     widget.onSelect(_selectedItems);
//     if (query.isEmpty) {
//       setState(() {
//         dropdownOptions = List.from(widget.items);
//       });
//       return;
//     }

//     List<GroupedDropdownOption> tempFilteredData = [];
//     final List<GroupedDropdownOption> allData = List.from(widget.items);
//     for (var type in allData) {
//       bool typeMatches = type.title.toLowerCase().contains(query.toLowerCase());
//       List<GroupedDropdownOption> matchingProperties = [];
//       if (!typeMatches) {
//         if (type.subItems != null) {
//           matchingProperties = type.subItems!.where((property) {
//             return property.title.toLowerCase().contains(
//                   query.toLowerCase(),
//                 );
//           }).toList();
//         }
//       }
//       if (typeMatches || matchingProperties.isNotEmpty) {
//         tempFilteredData.add(
//           GroupedDropdownOption(
//             key: type.key,
//             title: type.title,
//             extraInfo: type.extraInfo,
//             subItems: typeMatches ? type.subItems : matchingProperties,
//           ),
//         );
//       }
//     }
//     if (tempFilteredData.length == 1) {
//       if (tempFilteredData.first.subItems != null) {
//         if (tempFilteredData.first.subItems!.length == 1) {
//           final _singleItem = tempFilteredData.first;
//           if (query.toLowerCase() ==
//               _singleItem.subItems!.first.title.toLowerCase()) {
//             addItem(
//               GroupedDropdownOption(
//                 extraInfo: _singleItem.subItems!.first.extraInfo,
//                 key: _singleItem.subItems!.first.key,
//                 title: _singleItem.subItems!.first.title,
//                 parentKey: _singleItem.key,
//                 parentTitle: _singleItem.title,
//               ),
//             );
//           }
//         }
//       }
//     }
//     setState(() {
//       dropdownOptions = List.from(tempFilteredData);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FormField<List<GroupedDropdownOption>>(
//       key: fieldState,
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return "Field can't be empty";
//         }
//         return null;
//       },
//       builder: (state) {
//         return CompositedTransformTarget(
//           key: selectorKey,
//           link: dropdownLayerLink,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               AppTextField(
//                 enabledBorder: state.hasError
//                     ? BorderSide(color: Colors.red, width: 2.0)
//                     : null,
//                 onChanged: (value) {
//                   state.didChange(_selectedItems);
//                   _filterData(value);
//                   dropdownOverlayEntry?.remove();
//                   dropdownOverlayEntry = null;
//                   dropdownOverlayEntry = optionsOverlayEntry();
//                   Overlay.of(context).insert(dropdownOverlayEntry!);
//                 },
//                 onTap: () {
//                   state.didChange(_selectedItems);
//                   dropdownOverlayEntry?.remove();
//                   dropdownOverlayEntry = null;
//                   dropdownOverlayEntry = optionsOverlayEntry();
//                   Overlay.of(context).insert(dropdownOverlayEntry!);
//                 },
//                 hintText: widget.hintText,
//                 suffix: widget.suffix ??
//                     SizedBox(
//                       width: 30.0,
//                       child: Icon(Icons.arrow_drop_down),
//                     ),
//                 prefix: widget.prefix,
//                 // validator: widget.validator,
//                 labelText: widget.labelText,
//               ),
//               if (state.hasError) ...[
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 13.0,
//                     vertical: 3.0,
//                   ),
//                   child: Text(
//                     state.errorText ?? '',
//                     style: context.textTheme.bodySmall!
//                         .copyWith(color: Colors.red),
//                   ),
//                 )
//               ],
//               if (_selectedItems.isNotEmpty) ...[
//                 SizedBox(height: 10.0),
//                 Wrap(
//                   spacing: 20.0,
//                   runSpacing: 20.0,
//                   children: [
//                     ..._selectedItems
//                         .map((eachItem) => DecoratedBox(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(5.0),
//                                 color: Colors.grey.withAlpha(50),
//                                 border: Border.all(color: Colors.black),
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 8.0, vertical: 4.0),
//                                 child: Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     Text(eachItem.title),
//                                     SizedBox(width: 5.0),
//                                     AppButton.icon(
//                                       icon: Icon(
//                                         Icons.close,
//                                         size: 16,
//                                       ),
//                                       onPressed: () {
//                                         removeItem(eachItem);
//                                       },
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ))
//                         .toList()
//                   ],
//                 ),
//                 SizedBox(height: 3.0),
//               ]
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
