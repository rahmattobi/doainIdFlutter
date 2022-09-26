import 'package:doain_id/models/doa.dart';
import 'package:http/http.dart' as http;

class DoaService {
  static const String url = 'https://doa-doa-api-ahmadramadhan.fly.dev/api';

  static Future<List<Doa>?> getDoas() async {
    List<Doa> doa = [];
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<Doa> doas = doaFromJson(response.body);
        print(response.body);
        return doas;
      } else {
        print('data tidak di temukan');
        return doa;
      }
    } catch (e) {
      return doa;
    }
  }
}
