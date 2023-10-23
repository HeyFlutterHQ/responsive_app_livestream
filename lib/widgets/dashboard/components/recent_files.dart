import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_app_livestream/model/recentfile.dart';

import '../../../constant/constants.dart';
import '../../../data/recent_files_data.dart';

class RecentFiles extends StatelessWidget {
  const RecentFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Files",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columnSpacing: defaultPadding,
              // minWidth: 600,
              columns: const [
                DataColumn(
                  label: Text("File Name"),
                ),
                DataColumn(
                  label: Text("Date"),
                ),
                DataColumn(
                  label: Text("Size"),
                ),
              ],
              rows: List.generate(
                demoRecentFiles.length,
                (index) {
                  final RecentFile fileInfo = demoRecentFiles[index];
                  return DataRow(
                    cells: [
                      DataCell(
                        Row(
                          children: [
                            SvgPicture.asset(
                              fileInfo.icon!,
                              height: 30,
                              width: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: defaultPadding),
                              child: Text(fileInfo.title!),
                            ),
                          ],
                        ),
                      ),
                      DataCell(Text(fileInfo.date!)),
                      DataCell(Text(fileInfo.size!)),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
