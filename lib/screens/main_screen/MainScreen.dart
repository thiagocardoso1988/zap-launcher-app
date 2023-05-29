import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zap_launcher_app/services/WhatsappService.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String selectedCountry = 'BR';
  TextEditingController areaCodeController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();

  List<String> countries = [
    'BR',
  ];

  WhatsappService whatsappService = WhatsappService();

  void openChat() {
    whatsappService.openWhatsAppChat(
        selectedCountry, areaCodeController.text, mobileNumberController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.4),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   'assets/images/icon2.png',
                  //   color: Colors.white,
                  // ),
                  AspectRatio(
                    aspectRatio: 1.3,
                    child: Image.asset(
                      'assets/images/icon2.png',
                      color: Colors.white,
                    ),
                  ),
                  // const Text(
                  //   'ZapLauncher',
                  //   style: TextStyle(
                  //     fontSize: 24,
                  //     fontWeight: FontWeight.bold,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  // const SizedBox(height: 16),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: TextField(
                            controller: areaCodeController,
                            decoration: InputDecoration(
                              // labelText: 'DDD',
                              hintText: 'DDD',
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.85),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        fit: FlexFit.tight,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextField(
                            controller: mobileNumberController,
                            decoration: InputDecoration(
                              // labelText: 'Telefone',
                              hintText: 'Telefone',
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.85),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: openChat,
                      icon: const Icon(Icons.send),
                      label: const Text('Iniciar conversa'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('ZapLauncher'),
  //     ),
  //     body: Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.stretch,
  //         children: [
  //           DropdownButtonFormField<String>(
  //             value: selectedCountry,
  //             items: countries.map((country) {
  //               return DropdownMenuItem<String>(
  //                 value: country,
  //                 child: Text(country),
  //               );
  //             }).toList(),
  //             onChanged: (value) {
  //               setState(() {
  //                 selectedCountry = value!;
  //               });
  //             },
  //             decoration: InputDecoration(
  //               labelText: 'Select Country',
  //             ),
  //           ),
  //           SizedBox(height: 16.0),
  //           TextField(
  //             controller: areaCodeController,
  //             keyboardType: TextInputType.number,
  //             decoration: InputDecoration(
  //               labelText: 'Area Code',
  //             ),
  //           ),
  //           SizedBox(height: 16.0),
  //           TextField(
  //             controller: mobileNumberController,
  //             keyboardType: TextInputType.phone,
  //             decoration: InputDecoration(
  //               labelText: 'Mobile Number',
  //             ),
  //           ),
  //           SizedBox(height: 24.0),
  //           ElevatedButton(
  //             onPressed: openChat,
  //             child: Text('Abrir chat'),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
