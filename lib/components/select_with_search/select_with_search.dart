import 'package:flutter/material.dart';

class SelectWithSearch extends StatefulWidget {
  @override
  _SelectWithSearchState createState() => _SelectWithSearchState();
}

class _SelectWithSearchState extends State<SelectWithSearch> {
  List<String> options = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
    'Option 5',
    'Option 6',

  ];

  List<String> filteredOptions = [];
  String selectedOption = '';
  bool isDropdownOpen = false;

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredOptions = options;
  }

  void filterOptions(String searchTerm) {
    List<String> searchList = [];

    if (searchTerm.isNotEmpty) {
      for (String option in options) {
        if (option.toLowerCase().contains(searchTerm.toLowerCase())) {
          searchList.add(option);
        }
      }
    } else {
      searchList = List.from(options);
    }

    setState(() {
      filteredOptions = searchList;
    });
  }

  void selectOption(String option) {
    setState(() {
      selectedOption = option;
      isDropdownOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isDropdownOpen = !isDropdownOpen;
            });
          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF5D2483)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    selectedOption.isNotEmpty ? selectedOption : 'Select an option',
                    style: TextStyle(
                      color: Color(0xFF5D2483), // Replace with your desired color
                    ),
                  ),
                ),
                Icon(
                  isDropdownOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: Color(0xFF5D2483),
                ),
              ],
            ),
          ),
        ),
        if (isDropdownOpen) ...[
          SizedBox(height: 10),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Card(
              elevation: 2, // Adding a small shadow
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 10, 8, 8),
                    child: TextFormField(
                      controller: searchController,
                      onChanged: filterOptions,
                      decoration: InputDecoration(
                        labelText: 'Search',
                        prefixIcon: Icon(
                          Icons.search,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        // Use default icon color from the theme
                        labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 87, 86, 86),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 87, 86, 86),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 87, 86, 86),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: false,
                        // fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                        contentPadding:
                            const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 200,
                    child: ListView.builder(
                      itemCount: filteredOptions.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(filteredOptions[index]),
                          onTap: () {
                            selectOption(filteredOptions[index]);
                            // Do something with the selected option
                            print('Selected: ${filteredOptions[index]}');
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}
