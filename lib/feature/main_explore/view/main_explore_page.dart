import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:prueba_binance_isaac_sanchez/core/ui/design/templates/footers/footer.dart';
import 'package:prueba_binance_isaac_sanchez/core/ui/design/templates/headers/main_explore_header.dart';
import 'package:prueba_binance_isaac_sanchez/core/ui/utils/paths/images_utils.dart';
import 'package:prueba_binance_isaac_sanchez/feature/main_explore/controller/main_explore_controller.dart';
import 'package:prueba_binance_isaac_sanchez/feature/main_explore/widgets/main_explore_list.dart';

import '../../../../core/ui/utils/routes/routes.dart';
import '../../../../core/ui/utils/size/size_config.dart';
import '../../../core/ui/design/atoms/text_fields/custom_search_field.dart';
import '../../../core/ui/design/templates/loader/loader.dart';
import '../../../core/ui/design/templates/modals/middle_modal_template.dart';

class MainExplorePage extends StatefulWidget {
  const MainExplorePage({super.key});
  @override
  State<MainExplorePage> createState() => _MainExplorePage();
}

class _MainExplorePage extends State<MainExplorePage> {
  final _globalKey = GlobalKey<ScaffoldState>();
  final LocalAuthentication auth = LocalAuthentication();
  TextEditingController searchController = TextEditingController();
  dynamic listSymbols, filteredOrderSymbols;

  @override
  void initState() {
    super.initState();
    getData(context);
  }

  loading() async {
    middleModals.middleModal(context, const Loader(), Colors.transparent);
  }

  getData(context) async {
    await Future.delayed(Duration.zero);
    loading();
    dynamic symbols = await MainExploreController(context).getListSymbols();
    if (symbols != null) {
      setState(() {
        listSymbols = symbols;
      });
      searchController.addListener(_onSearchSymbolsChanged);
    } else {}
    Navigator.pop(context);
  }

  void _onSearchSymbolsChanged() {
    setState(() {
      String searchText = searchController.text.toLowerCase();
      List<Map<String, dynamic>> convertedList =
          List<Map<String, dynamic>>.from(listSymbols);
      listSymbols = convertedList
          .where((item) => item['symbol'].toLowerCase().contains(searchText))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        () => routes.onBoarding(context: context);
        return;
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          key: _globalKey,
          bottomNavigationBar: const Footer(page: 'criptos'),
          appBar: const MainExploreHeader(),
          body: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage(imagesUtils.panal), fit: BoxFit.cover)),
              child: SafeArea(
                  top: false,
                  bottom: true,
                  child: GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: SingleChildScrollView(
                      child: GestureDetector(
                          onTap: () => FocusScope.of(context).unfocus(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 3 * SizeConfig.heightMultiplier,
                              ),
                              Container(
                                color: Colors.transparent,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 5 * SizeConfig.widthMultiplier),
                                child: CustomSearchField(
                                    controller: searchController,
                                    inputType: TextInputType.text,
                                    enable: true,
                                    hintText: 'Buscar ..'),
                              ),
                              SizedBox(
                                height: 3 * SizeConfig.heightMultiplier,
                              ),
                              MainExploreList(
                                data: listSymbols,
                              )
                            ],
                          )),
                    ),
                  )))),
    );
  }
}
