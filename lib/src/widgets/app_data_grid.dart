// import 'package:flutter/material.dart';

// class AppDataGrid extends StatelessWidget {
//   final DataGridSource source;
//   final List<GridColumn> columns;
//   final int? frozenColumnsCount;

//   const AppDataGrid({
//     super.key,
//     required this.source,
//     required this.columns,
//     this.frozenColumnsCount,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final _rowsLength = source.rows.length;
//     return Column(
//       children: [
//         Expanded(
//           child: SfDataGridTheme(
//             data: SfDataGridThemeData(
//               headerHoverColor: Colors.transparent,
//               sortIconColor: Colors.white,
//               frozenPaneElevation: 0.0,
//               headerColor: context.secondaryColor,
//               frozenPaneLineColor: context.secondaryColor,
//             ),
//             child: SfDataGrid(
//               frozenColumnsCount: frozenColumnsCount ?? 0,
//               columnWidthMode: ColumnWidthMode.fill,
//               verticalScrollPhysics: isMobile
//                   ? const NeverScrollableScrollPhysics()
//                   : const AlwaysScrollableScrollPhysics(),
//               allowSorting: false,
//               allowMultiColumnSorting: false,
//               allowTriStateSorting: false,
//               headerRowHeight: isMobile ? 30.0 : 50.0,
//               rowHeight: isMobile ? 40.0 : 50.0,
//               headerGridLinesVisibility: GridLinesVisibility.both,
//               gridLinesVisibility: GridLinesVisibility.both,
//               highlightRowOnHover: false,
//               shrinkWrapRows: true,
//               source: source,
//               columns: columns,
//             ),
//           ),
//         ),
//         if (_rowsLength > kAppDataGridRowsCount) ...[
//           SfDataPagerTheme(
//             data: SfDataPagerThemeData(
//               selectedItemColor: context.primaryColor,
//               itemBorderWidth: 0.5,
//               itemBorderColor: context.secondaryColor,
//               itemBorderRadius: BorderRadius.circular(5),
//             ),
//             child: SfDataPager(
//               pageCount: (_rowsLength / kAppDataGridRowsCount).ceilToDouble(),
//               delegate: source,
//             ),
//           )
//         ]
//       ],
//     );
//   }
// }

// class ColumnTitle extends StatelessWidget {
//   final String title;

//   const ColumnTitle(this.title, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         title,
//         style: context.textTheme.bodyMedium!.copyWith(color: Colors.white),
//       ),
//     );
//   }
// }
