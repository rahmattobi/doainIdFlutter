import 'package:doain_id/theme.dart';
import 'package:doain_id/widget/doa_card.dart';
// import 'package:doain_id/widget/doa_card.dart';
import 'package:flutter/material.dart';
import 'package:doain_id/services/doa_service.dart';
import 'package:doain_id/models/doa.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Doa>? _doa;
  List<Doa>? _listDoa;
  bool? _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    DoaService.getDoas().then((doa) {
      setState(() {
        _doa = doa;
        _loading = false;
        _listDoa = doa;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double myheight = height * 0.65;

    void searchDoa(String query) {
      setState(() {
        _listDoa = _doa!.where((doa) {
          final doaTitle = doa.doa!.toLowerCase();
          final input = query.toLowerCase();

          return doaTitle.contains(input);
        }).toList();
      });
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Doain.id',
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Kumpulan doa anak - anak',
              style: subtitleTextStyle.copyWith(
                fontSize: 18,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: defaultMargin,
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 50,
                    color: subtitleColor.withOpacity(0.25),
                  ),
                ],
              ),
              child: Container(
                height: 60,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: subtitleColor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration.collapsed(
                          hintText: 'Cari Doa',
                          hintStyle: subtitleTextStyle.copyWith(
                            fontSize: 15,
                          ),
                        ),
                        onChanged: ((value) {
                          searchDoa(value);
                        }),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.only(
          right: defaultMargin - 10,
          left: defaultMargin - 10,
          top: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 10,
              ),
              child: Text(
                'List Doa',
                style: primaryTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
            ),
            Container(
              height: height,
              width: double.infinity,
              margin: const EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
              ),
              child: _loading!
                  ? Center(
                      child:
                          Container(child: const CircularProgressIndicator()),
                    )
                  : ListView.builder(
                      itemCount: null == _listDoa ? 0 : _listDoa!.length,
                      itemBuilder: (context, index) {
                        Doa doa = _listDoa![index];
                        return GestureDetector(
                          onTap: () {
                            showMaterialModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25.0),
                                ),
                              ),
                              builder: (context) => Container(
                                height: myheight,
                                margin: EdgeInsets.only(
                                  top: defaultMargin,
                                  left: defaultMargin,
                                  right: defaultMargin,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Container(
                                        width: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      doa.doa!,
                                      style: primaryTextStyle.copyWith(
                                        fontSize: 20,
                                        fontWeight: bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      doa.ayat!,
                                      style: subtitleTextStyle.copyWith(
                                          fontSize: 15,
                                          fontWeight: semiBold,
                                          color: const Color.fromARGB(
                                              255, 222, 13, 13)),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      doa.latin!,
                                      style: subtitleTextStyle.copyWith(
                                        fontSize: 15,
                                        fontWeight: medium,
                                        color: primaryColor.withOpacity(0.8),
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      doa.artinya!,
                                      style: subtitleTextStyle.copyWith(
                                        fontSize: 15,
                                        fontWeight: light,
                                        color: primaryColor.withOpacity(0.5),
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: DoaCard(
                            doa: doa.doa,
                            // ayat: doa.ayat,
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          header(),
          content(),
        ],
      ),
    );
  }
}
