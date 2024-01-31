import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../../../../models/models.dart';
import '../../../../widgets/widgets.dart';
import '../../../../data/europe.dart';

import 'state_dropdown_field.dart';

class UabilityQ30 extends StatefulWidget {
  const UabilityQ30({Key? key}) : super(key: key);

  @override
  State<UabilityQ30> createState() => _UsabilityQ30State();
}

class _UsabilityQ30State extends State<UabilityQ30> {
  // EU member checkbox value
  bool _euMember = false;

  // List containing values for Country dropdown field.
  List<String> _countries = Europe().euMembership.keys.toList();

  // Text controllers for form fields
  final TextEditingController _state = TextEditingController();

  @override
  void dispose() {
    _state.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Consumer<StateManager>(builder: (context, stateManager, child) {
      return Scaffold(
        body: CustomSliverAppBar(
          container: SingleChildScrollView(
            child: Container(
              alignment: Alignment.topLeft,
              child: SingleChildScrollView(
                child: screenWidth < 700
                    ? smallScreenLayout()
                    : screenWidth < 1200
                        ? mediumScreenLayout()
                        : largeScreenLayout(),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget smallScreenLayout() {
    double textSize = 12;

    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(14, 5, 14, 10),
            child: Text(
              'Users dislike typing, simplify input tasks',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 5, 14, 10),
            child: Text(
              _getInfo(),
              style: TextStyle(fontSize: textSize),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 5, 14, 10),
            child: Text(
              _getStart(),
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: textSize),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey),
                  margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                  padding: const EdgeInsets.all(7),
                  child: const Text('30'),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                    child: Text.rich(
                      TextSpan(
                        text: _getQuestion30(),
                        style: TextStyle(fontSize: textSize),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 5, 14, 10),
            child: Text(
              _getIntro(),
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: textSize),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 7, 15, 7),
            child: CheckboxListTile(
                key: const ValueKey('EU_member'),
                title: Text(
                  'Is the country of origin a member of European Union?',
                  style: TextStyle(fontSize: textSize),
                ),
                value: _euMember,
                onChanged: (bool? value) {
                  setState(() {
                    _euMember = value!;
                    _state.text = '';
                    _updateCountries(value);
                  });
                }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 5, 14, 10),
            child: Text(
              _getDescription(),
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: textSize),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
            child: StateDropdownField(
              key: const ValueKey('country'),
              controller: _state,
              txtLabel: 'Country',
              listValues: _countries,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 5, 14, 10),
            child: Text(
              _getSummary(),
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: textSize),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 5, 14, 10),
            child: Text(
              'References:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: textSize,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 5, 14, 10),
            child: Text(
              _getReferences(),
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: textSize),
            ),
          ),
          const CustomBottomBar(),
        ],
      ),
    );
  }

  Widget mediumScreenLayout() {
    double textSize = 14;

    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 8, 20.w, 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(14, 5, 14, 10),
                  child: Text(
                    'Users dislike typing, simplify input tasks',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 5, 14, 10),
                  child: Text(
                    _getInfo(),
                    style: TextStyle(fontSize: textSize),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 5, 14, 10),
                  child: Text(
                    _getStart(),
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: textSize),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                        margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                        padding: const EdgeInsets.all(7),
                        child: const Text('30'),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                          child: Text.rich(
                            TextSpan(
                              text: _getQuestion30(),
                              style: TextStyle(fontSize: textSize),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 5, 14, 10),
                  child: Text(
                    _getIntro(),
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: textSize),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 7, 15, 7),
                  child: CheckboxListTile(
                      key: const ValueKey('EU_member'),
                      title: const Text(
                          'Is the country of origin a member of European Union?'),
                      value: _euMember,
                      onChanged: (bool? value) {
                        setState(() {
                          _euMember = value!;
                          _state.text = '';
                          _updateCountries(value);
                        });
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 5, 14, 10),
                  child: Text(
                    _getDescription(),
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: textSize),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
                  child: StateDropdownField(
                    key: const ValueKey('country'),
                    controller: _state,
                    txtLabel: 'Country',
                    listValues: _countries,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 5, 14, 10),
                  child: Text(
                    _getSummary(),
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: textSize),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 5, 14, 10),
                  child: Text(
                    'References:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: textSize,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 5, 14, 10),
                  child: Text(
                    _getReferences(),
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: textSize),
                  ),
                ),
              ],
            ),
          ),
          const CustomBottomBar(),
        ],
      ),
    );
  }

  Widget largeScreenLayout() {
    double textSize = 14;

    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 8, 20.w, 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(14, 5, 14, 10),
                  child: Text(
                    'Users dislike typing, simplify input tasks',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 5, 14, 10),
                  child: Text(
                    _getInfo(),
                    style: TextStyle(fontSize: textSize),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 5, 14, 10),
                  child: Text(
                    _getStart(),
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: textSize),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                        margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                        padding: const EdgeInsets.all(7),
                        child: const Text('30'),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                          child: Text.rich(
                            TextSpan(
                              text: _getQuestion30(),
                              style: TextStyle(fontSize: textSize),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 5, 14, 10),
                  child: Text(
                    _getIntro(),
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: textSize),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 7, 15, 7),
                  child: CheckboxListTile(
                      key: const ValueKey('EU_member'),
                      title: const Text(
                          'Is the country of origin a member of European Union?'),
                      value: _euMember,
                      onChanged: (bool? value) {
                        setState(() {
                          _euMember = value!;
                          _state.text = '';
                          _updateCountries(value);
                        });
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 5, 14, 10),
                  child: Text(
                    _getDescription(),
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: textSize),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
                  child: StateDropdownField(
                    key: const ValueKey('country'),
                    controller: _state,
                    txtLabel: 'Country',
                    listValues: _countries,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 5, 14, 10),
                  child: Text(
                    _getSummary(),
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: textSize),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 5, 14, 10),
                  child: Text(
                    'References:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: textSize,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 5, 14, 10),
                  child: Text(
                    _getReferences(),
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: textSize),
                  ),
                ),
              ],
            ),
          ),
          const CustomBottomBar(),
        ],
      ),
    );
  }

  String _getStart() {
    String start =
        'Forms are everywhere. Whether you want to send a package to your '
        'family or apply for a bank account, the usual required chore is '
        'filling in a form to input required information. Software development '
        'is based on data collecting and its management. Application logic '
        'is the foundation on which business goals stand, but the uptake by '
        'the users is based on that tentative link between the outward facing '
        'logic in the shape of user interface and users’ ability to comprehend '
        'it. The following design yeas and nays are based on the work of '
        'Mugisha et al. (2019). The paper contains a list of usability '
        'validation questions developers believe should be strongly enforced. '
        'The question 30 is: ';

    return start;
  }

  String _getInfo() {
    String info = '2024-01-31\n\n300 words';

    return info;
  }

  String _getQuestion30() {
    String question =
        'Users dislike typing, is information computed for the users where '
        'applicable?';

    return question;
  }

  String _getIntro() {
    String introduction =
        'According to Lacey (2018), users are less likely to fill in forms where '
        'their effort is needed to search for information before inputting it. '
        'This applies even more strongly to information, which is publicly '
        'available. As an example to counter such patterns, to following '
        'form stub asks European users to confirm their origin is within '
        'the European Union (EU).';

    return introduction;
  }

  String _getDescription() {
    String description =
        'Based on this information, follow up queries should compute available '
        'information based on information provided by users, giving either all '
        'European countries or only countries of the EU.';

    return description;
  }

  String _getSummary() {
    String description =
        'As can be seen, computing information based on user input makes it easier '
        'to fill in forms, speeds up information input and lowers the probability '
        'of user entering erroneous data. One drawback, however, is that the '
        'computing logic has to be based on latest and valid information. Keeping '
        'software up to date is of paramount importance, and this responsibility '
        "is on developers' shoulders, not users'!";

    return description;
  }

  String _getReferences() {
    String references =
        'EU country profiles | European Union (no date). Available at: '
        'https://european-union.europa.eu/principles-countries-history/country'
        '-profiles_en (Accessed: 4 January 2024).\n\n'
        'Facts and figures, EU set-up | European Union (no date). Available at: '
        'https://european-union.europa.eu/principles-countries-history/key'
        '-facts-and-figures/structure_en (Accessed: 4 January 2024).\n\n'
        'Lacey, M. (2018) Usability matters: mobile-first UX for developers and '
        'other accidental designers. Shelter Island: Manning.\n\n'
        "Mugisha, A. et al. (2019) 'A usability design checklist for "
        "Mobile electronic data capturing forms: the validation process', "
        'BMC medical informatics and decision making, 19(1), pp. 4-4. '
        'Available at: https://doi.org/10.1186/s12911-018-0718-3.';

    return references;
  }

  void _updateCountries(bool selected) {
    Map<String, bool> euCountries;
    Map<String, bool> europeanCountries = Europe().europeCountries;

    if (selected) {
      euCountries = Map.from(europeanCountries)
        ..removeWhere((key, isMember) => !isMember);
      _countries = euCountries.keys.toList();
    } else {
      _countries = europeanCountries.keys.toList();
    }
  }
}
