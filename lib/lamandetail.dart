import 'package:flutter/material.dart';
import 'disease_data.dart';
import 'package:url_launcher/url_launcher.dart';

class LamanDetail extends StatefulWidget {
  const LamanDetail({Key? key, required this.diseases}) : super(key: key);
  final Diseases diseases;

  @override
  State<LamanDetail> createState() => _LamanDetailState();
}

class _LamanDetailState extends State<LamanDetail> {
  bool favorite = false;
  void toggleWishlist() {
    setState(() {
      favorite = !favorite;
    });

    final snackBar = SnackBar(
      content:
          Text(favorite ? 'Ditambahkan ke wishlist' : 'Dihapus dari wishlist'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> _launchInWebViewOrVC(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.diseases.name),
        actions: [
          IconButton(
            icon: Icon(
              favorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.white,
            ),
            onPressed: toggleWishlist,
          ),
          IconButton(
            icon: const Icon(
              Icons.link,
              color: Colors.white,
            ),
            onPressed: () async {
              final url = widget
                  .diseases.imgUrls; // ganti dengan link yang ingin di-launch
              await _launchInWebViewOrVC(Uri.parse(url));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                widget.diseases.imgUrls,
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16.0),
              Text(
                'Tanaman: ${widget.diseases.plantName}',
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Gejala: ${widget.diseases.symptom}',
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Ciri-ciri: ',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.diseases.nutshell
                    .map((ciri) => Text('- $ciri'))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
