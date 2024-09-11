import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationSelector extends StatefulWidget {
  @override
  _LocationSelectorState createState() => _LocationSelectorState();
}

class _LocationSelectorState extends State<LocationSelector> {
  String? _selectedDistrict;
  String? _selectedCity;
  LatLng? _selectedLatLng;
  String result = "";
  String lat = "";
  String lng = "";

  final Map<String, List<String>> _districtCityMap = {
    'Vizianagaram': ['Vizianagaram', 'Nellimarla', 'Rajam', 'Bobbili'],
    'Anakapalli': ['Narsipatnam', 'Yelamanchili'],
    'Parvathipuram Manyam': ['Parvathipuram', 'Salur', 'Palakonda'],
    'Srikakulam': [
      'Srikakulam',
      'Palasa kasibugga',
      'Ichapuram',
      'Amudalavalasa'
    ],
    'Visakhapatnam': [
      'Visakhapatnam GVMC',
    ],
    'Konaseema': [
      'Ramachandrapuram',
      'Mandapeta',
      'Mummidivaram',
      'Amalapuram'
    ],
    'East Godavari': ['Nidadavole', 'Rajamahendravaram', 'Kovvuru'],
    'Eluru': ['Nuzivid', 'Eluru', 'Jangareddygudem'],
    'Kakinada': [
      'Kakinada',
      'Tuni',
      'Yeleswaram',
      'Pithapuram',
      'Peddapuram',
      'Samalkot',
      'Gollaprolu'
    ],
    'Krishna': [
      'Pedana',
      'Gudivada',
      'Machilipatnam',
      'Vuyyuru',
    ],
    'NTR': [
      'Nandigama',
      'Vijayawada',
      'Jaggaiahpet',
      'Tiruvuru',
    ],
    'West Godavari': [
      'Tadepalligudem',
      'Narasapur',
      'Tanuku',
      'Bhimavaram',
      'Palakollu'
    ],
    'Guntur ': ['Tenali', 'Guntur', 'Ponnur', 'MTMC'],
    'Bapatla ': ['Repalle', 'Bapatla', 'Chirala', 'Addanki'],
    'Nellore ': ['Kavali', 'Gudur ', 'Kandukur', 'Atmakur (Nellore)'],
    'Palnadu ': [
      'Piduguralla',
      'Sattenapalle ',
      'Chilakaluripet ',
      'Narasaraopeta',
      'Vinukonda',
      'Macherla'
    ],
    'Prakasam': ['Ongole', 'Markapur', 'Giddalur', 'Chimakurthy', 'Kanigiri'],
    'SPSR Nellore': ['Nellore'],
    'Tirupathi': [
      'Sullurpet',
      'Venkatagiri ',
      'Naidupeta ',
      'Srikalahasthi ',
      'Puttur ',
      'Tirupathi ',
    ],
    'Anantapur ': [
      'Anantapur',
      'Rayadurg ',
      'Guntakal ',
      'Tadipatri',
      'Gooty',
      'Kalyandurgam'
    ],
    'Annamayya ': [
      'Rajampet',
      'Madanapalle ',
      'Rayachoty ',
    ],
    'Chittoor ': ['Nagari', 'Palamaner', 'Chittoor', 'Punganur'],
    'Kurnool ': ['Kurnool', 'Gudur', 'Adoni', 'Yemmiganur'],
    'Nandyala ': ['Allagadda', 'Atmakur ', 'Nandyala', 'Nandikotkur', 'Dhone'],
    'Sri Sathya Sai ': [
      'Madakasira',
      'Puttapathy ',
      'Hindupur',
      'Dharmavaram',
      'Kadiri'
    ],
    'YSR Kadapa ': [
      'Kadapa',
      'Jammalamadugu ',
      'Pulivendula',
      'Mydukur',
      'Yerraguntala',
      'Proddatur ',
      'Badvel'
    ],
  };

  final Map<String, List<Map<String, dynamic>>> _cityAddressMap = {
    'Vizianagaram': [
      {
        'address': 'Prakasam park',
        'latitude': 18.1172168,
        'longitude': 83.4102041
      },
      {
        'address': 'RTC Complex',
        'latitude': 18.1081808,
        'longitude': 83.3991362
      },
      {
        'address': 'Ghosha Hospital',
        'latitude': 18.1168928,
        'longitude': 83.4165226
      },
    ],
    'Nellimarla': [
      {
        'address': 'Beside Byereddi Suryanarayana Kalyana mandapam, Main Road',
        'latitude': 18.1587106,
        'longitude': 83.4471288
      },
    ],
    'Rajam': [
      {
        'address': 'APSRTC Complex premises',
        'latitude': 18.4507379,
        'longitude': 83.6597435
      },
    ],
    'Bobbili': [
      {
        'address': 'R&B office Govt hospital road',
        'latitude': 18.57634,
        'longitude': 83.351293
      },
    ],
    'Narsipatnam': [
      {
        'address': 'Near Area Hospital, CBM Compound',
        'latitude': 17.6731041,
        'longitude': 82.6115562
      },
    ],
    'Yelamanchili': [
      {
        'address': 'Near RTC Complex',
        'latitude': 17.5470454,
        'longitude': 82.853967
      },
    ],
    'Parvathipuram': [
      {
        'address': 'Beside G.J.College',
        'latitude': 18.7694241,
        'longitude': 83.4220395
      },
    ],
    'Salur': [
      {
        'address': 'Salur Thasildar Office premises',
        'latitude': 18.5174309,
        'longitude': 83.2018523
      },
    ],
    'Palakonda': [
      {
        'address': 'Near Kota Durga Temple, CSP, Main Road',
        'latitude': 18.6023075,
        'longitude': 83.7537762
      },
    ],
    'Srikakulam': [
      {
        'address': 'Potti sri ramulu junction',
        'latitude': 18.291709,
        'longitude': 83.897729
      },
      {
        'address': '7 road junction',
        'latitude': 18.294766,
        'longitude': 23.893384
      },
    ],
    'Palasa kasibugga': [
      {
        'address': 'Near old bus stand, Kasi-Bugga',
        'latitude': 18.76093,
        'longitude': 84.418986
      },
    ],
    'Ichapuram': [
      {
        'address': 'Near Gandhi Park Bunglow Road',
        'latitude': 19.1111969,
        'longitude': 84.6833188
      },
    ],
    'Amudalavalasa': [
      {
        'address': 'Near RTC Complex',
        'latitude': 18.4061514,
        'longitude': 83.8985426
      },
    ],
    'Visakhapatnam GVMC': [
      {'address': 'Chiitvalasa', 'latitude': 17.932661, 'longitude': 83.427258},
      {
        'address': 'Marikavalasa RG Colony',
        'latitude': 17.838405,
        'longitude': 83.358988
      },
      {
        'address': 'Vambay Colony',
        'latitude': 17.81248504,
        'longitude': 83.36482886
      },
      {
        'address': 'Opp. VIMS, Sanjay Gandhi Colony Community Hall',
        'latitude': 17.757119,
        'longitude': 83.32729
      },
      {'address': 'Arilova', 'latitude': 17.769461, 'longitude': 83.307845},
      {
        'address': 'MVP RYTHUBAZAR',
        'latitude': 17.741966,
        'longitude': 83.334763
      },
      {
        'address': 'Chest Hospital(East Point Colony)',
        'latitude': 17.72756,
        'longitude': 83.334245
      },
      {
        'address': 'Regional Eye Hospital (Near Ramatalkies)',
        'latitude': 17.729581,
        'longitude': 83.311915
      },
      {
        'address': 'Fruit Market (Janatha Bazar)',
        'latitude': 17.707159,
        'longitude': 83.29353
      },
      {
        'address': 'Turner Choultry',
        'latitude': 17.708976,
        'longitude': 83.300974
      },
      {
        'address': 'KGH Opp. Gate',
        'latitude': 17.709834,
        'longitude': 83.304417
      },
      {
        'address': 'Marripalem Village (Siva Nagar)',
        'latitude': 17.746923,
        'longitude': 83.24786
      },
      {
        'address': 'YSR Colony (Thatichetlapalem)',
        'latitude': 17.737714,
        'longitude': 83.290609
      },
      {
        'address': 'Sriharipuram GVMC Hospital',
        'latitude': 17.686815,
        'longitude': 83.2184833
      },
      {
        'address': 'Mulagada pump house',
        'latitude': 17.689983,
        'longitude': 83.224347
      },
      {
        'address': 'Auto Nagar ILA',
        'latitude': 17.6980048,
        'longitude': 83.187967454
      },
      {
        'address': 'China gantyada',
        'latitude': 17.680451,
        'longitude': 83.206578
      },
      {'address': 'Nammidoodi', 'latitude': 17.590928, 'longitude': 83.1545},
      {
        'address': 'NTR Hospital',
        'latitude': 17.684923,
        'longitude': 83.006432
      },
      {
        'address': 'Near Railway Station',
        'latitude': 17.694191,
        'longitude': 83.008351
      },
      {
        'address': 'Gopalapatnam Baji Jn',
        'latitude': 17.745314,
        'longitude': 83.228366
      },
      {
        'address': 'Gopalapatnam Rythu Bazar',
        'latitude': 17.753578,
        'longitude': 83.217288
      },
      {
        'address': 'Vepagunta (Old Panchayat office)',
        'latitude': 17.777449,
        'longitude': 83.216436
      },
      {'address': 'Pendurthi', 'latitude': 18.2961, 'longitude': 83.8963},
      {
        'address': 'Bheemunipatnam',
        'latitude': 17.822757,
        'longitude': 83.205251
      },
    ],
    'Ramachandrapuram': [
      {
        'address': 'Beside Old Bustand',
        'latitude': 16.8328073,
        'longitude': 82.032322
      },
    ],
    'Mandapeta': [
      {
        'address': 'Junior college premises, Yeditha road',
        'latitude': 17.6673,
        'longitude': 82.6106
      },
    ],
    'Mummidivaram': [
      {
        'address': 'Beside R&B building',
        'latitude': 17.6673,
        'longitude': 82.6106
      },
    ],
    'Amalapuram': [
      {
        'address': 'Market road, beside sri sakthi bavan in 26th ward',
        'latitude': 17.6673,
        'longitude': 82.6106
      },
    ],
    'Nidadavole': [
      {
        'address': 'Pangidi Road 27th ward',
        'latitude': 16.9997854,
        'longitude': 81.6656712
      },
    ],
    'Rajamahendravaram': [
      {
        'address': 'Govt Hospital',
        'latitude': 17.019591,
        'longitude': 81.793229
      },
      {'address': 'Quarry Market', 'latitude': 17.0319, 'longitude': 81.789235},
      {
        'address': 'Annam kalakshetram gokavaram bus stand',
        'latitude': 17.009376,
        'longitude': 81.771236
      },
    ],
    'Kovvuru': [
      {
        'address': 'APSRTC Premises',
        'latitude': 17.017891,
        'longitude': 81.727741
      },
    ],
    'Nuzivid': [
      {
        'address': 'Rural police station',
        'latitude': 16.7911224,
        'longitude': 80.8410233
      },
    ],
    'Eluru': [
      {'address': 'At SBI', 'latitude': 17.6673, 'longitude': 82.6106},
      {'address': 'RR Peta', 'latitude': 16.7125511, 'longitude': 81.0983507},
      {
        'address': 'Tangellamudi',
        'latitude': 16.7229584,
        'longitude': 81.1046918
      },
      {
        'address': 'Rice millers association',
        'latitude': 16.7076163,
        'longitude': 81.1075106
      },
    ],
    'Jangareddygudem': [
      {
        'address': 'Srinivasapuram Road Municipal office backside',
        'latitude': 17.1250249,
        'longitude': 81.2972771
      },
    ],
    'Kakinada': [
      {'address': 'Dairy Market', 'latitude': 16.954743, 'longitude': 82.24907},
      {
        'address': 'Annamma Ghati Junction',
        'latitude': 16.935958,
        'longitude': 82.22938
      },
      {
        'address': 'Santa Cheruvu',
        'latitude': 16.950213,
        'longitude': 82.235242
      },
      {
        'address': 'Vivekananda Park',
        'latitude': 16.960081,
        'longitude': 82.23377
      },
      {
        'address': 'Sarpavaram Junction',
        'latitude': 16.994777,
        'longitude': 82.234524
      },
    ],
    'Tuni': [
      {
        'address': 'Prakasam road near sadhikana,rajapark',
        'latitude': 17.3560217,
        'longitude': 82.5427787
      },
    ],
    'Yeleswaram': [
      {
        'address': 'Santa Market site',
        'latitude': 17.28748,
        'longitude': 82.104334
      },
    ],
    'Pithapuram': [
      {
        'address': 'RTC Bustand Uppada Municipal guest house',
        'latitude': 17.1114293,
        'longitude': 82.2556422
      },
    ],
    'Peddapuram': [
      {
        'address': 'Opp. Municipal Office',
        'latitude': 17.074941,
        'longitude': 82.143777
      },
    ],
    'Samalkot': [
      {'address': 'RTC Complex', 'latitude': 17.047076, 'longitude': 82.168332},
    ],
    'Gollaprolu': [
      {
        'address': 'Old RTC Bus stand',
        'latitude': 17.1516803,
        'longitude': 82.2846309
      },
    ],
    'Pedana': [
      {
        'address': 'Near RTC Bus stand',
        'latitude': 16.8625411,
        'longitude': 81.9247534
      },
    ],
    'Gudivada': [
      {
        'address': 'Tummala RamaBrahmam Park Premises',
        'latitude': 16.431754,
        'longitude': 80.995501
      },
      {
        'address': 'Mahathma Gandhi Municipal Shopping Complex',
        'latitude': 16.432816,
        'longitude': 80.992158
      },
    ],
    'Machilipatnam': [
      {
        'address': 'Water Works Area',
        'latitude': 16.1826974,
        'longitude': 81.1341878
      },
    ],
    'Vuyyuru': [
      {
        'address': 'Sivalayam road old water tank area',
        'latitude': 16.3649,
        'longitude': 80.8426
      },
    ],
    'Nandigama': [
      {
        'address': 'Raithu Bazar',
        'latitude': 16.7698013,
        'longitude': 80.2841163
      },
    ],
    'Vijayawada': [
      {
        'address': 'Dharna Chowk',
        'latitude': 16.515782,
        'longitude': 80.628324
      },
      {
        'address': 'RTC Work Shop Road Vidyadarapuram',
        'latitude': 16.535997,
        'longitude': 80.601428
      },
      {
        'address': 'Bavaji Pet (Gulabi Thota) Near A.S Raju Bridge',
        'latitude': 16.520656,
        'longitude': 80.643946
      },
      {'address': 'Singh nagar', 'latitude': 16.54026, 'longitude': 80.637321},
      {
        'address': 'Gandhi mahila kalasala',
        'latitude': 16.5146649,
        'longitude': 80.613745
      },
      {
        'address': 'Housing Board colony',
        'latitude': 16.53884,
        'longitude': 80.6014228
      },
      {
        'address': 'Ayodyanagar budameru vagu',
        'latitude': 16.528422,
        'longitude': 80.636527
      },
      {
        'address': 'APSRM School',
        'latitude': 16.5014431,
        'longitude': 80.6268481
      },
      {
        'address': 'Ranigari Thota (CEMENT GODOWN)',
        'latitude': 16.4955114,
        'longitude': 80.6394825
      },
      {
        'address': 'Sai Baba Temple Near Netaji Bridge',
        'latitude': 16.5004,
        'longitude': 80.6348
      },
      {
        'address': 'Patamata High School',
        'latitude': 16.495895,
        'longitude': 80.66709
      },
    ],
    'Jaggaiahpet': [
      {
        'address': 'Seetharamapuram Mandal Parshid School',
        'latitude': 17.113154,
        'longitude': 80.101441
      },
    ],
    'Tiruvuru': [
      {
        'address': 'Opposite Masjid, Main Road, Tiruvuru',
        'latitude': 17.113154,
        'longitude': 80.608837
      },
    ],
    'Tadepalligudem': [
      {
        'address': 'BR market, 14th ward',
        'latitude': 16.8174648,
        'longitude': 81.521138
      },
      {
        'address': 'At M.R.O office, 8th ward',
        'latitude': 16.814637,
        'longitude': 81.526727
      },
      {
        'address': 'Auto stand center near the municipal office, 10th ward',
        'latitude': 16.8098142,
        'longitude': 81.5307896
      },
    ],
    'Narasapur': [
      {
        'address': 'Steamer road',
        'latitude': 16.4393862,
        'longitude': 81.7050399
      },
    ],
    'Tanuku': [
      {
        'address': 'OPP. Mee Seva',
        'latitude': 16.757325,
        'longitude': 81.681194
      },
    ],
    'Bhimavaram': [
      {
        'address': 'R&B DEPARTMENT',
        'latitude': 16.5400883,
        'longitude': 81.51793
      },
      {
        'address': 'At Bullock cart Stand',
        'latitude': 16.5441635,
        'longitude': 81.5210617
      },
      {
        'address': 'At RTC bus stand (Wednesday Market)',
        'latitude': 16.5441635,
        'longitude': 81.5210617
      },
    ],
    'Palakollu': [
      {
        'address': 'Beside bustand',
        'latitude': 16.5160112,
        'longitude': 81.7264398
      },
    ],
    'Tenali': [
      {
        'address': 'Near Vegetable Market, opp Municipal Office',
        'latitude': 16.237604,
        'longitude': 80.6447087
      },
      {'address': 'Market Yard', 'latitude': 16.24417, 'longitude': 80.63216},
      {
        'address': 'Near RTC complex ',
        'latitude': 16.018569,
        'longitude': 80.831816
      },
    ],
    'Guntur': [
      {
        'address': '90- Pedapalakaluru Road',
        'latitude': 16.322467,
        'longitude': 80.409877
      },
      {
        'address': '85- ID Hospital Amaravathi Road',
        'latitude': 16.332242,
        'longitude': 80.437905
      },
      {
        'address': '86- Infront of DTC office Premises ',
        'latitude': 16.336933,
        'longitude': 80.420857
      },
      {
        'address': '87- Mirchi Yard',
        'latitude': 16.286815,
        'longitude': 80.411557
      },
      {
        'address': '88- Nalla Cheruvu Road near Water tanks',
        'latitude': 16.287438,
        'longitude': 80.441171
      },
      {
        'address': '89- Pallanadu Bus Stand ',
        'latitude': 16.291381,
        'longitude': 80.443199
      },
      {
        'address': '91- Raitu Bazar near RTC Bus stand',
        'latitude': 16.2936193,
        'longitude': 80.4545431
      },
      {
        'address': '84- Agriculture Office',
        'latitude': 16.2913912,
        'longitude': 80.421761
      },
    ],
    'Ponnur': [
      {
        'address': 'Subbaraya Satram',
        'latitude': 16.066791,
        'longitude': 80.551385
      },
    ],
    'MTMC': [
      {
        'address': 'Near RTC Old Bus stand',
        'latitude': 16.2959037,
        'longitude': 80.4549838
      },
      {'address': 'Nulakapeta', 'latitude': 16.4683372, 'longitude': 80.585428},
      {'address': 'Undavalli', 'latitude': 16.4322703, 'longitude': 80.562723},
    ],
    'Repalle': [
      {
        'address': 'Ambedhkar park',
        'latitude': 16.018569,
        'longitude': 80.831816
      },
    ],
    'Bapatla': [
      {
        'address': 'Municipal School - Mee Seva back side',
        'latitude': 15.901094,
        'longitude': 80.469015
      },
    ],
    'Chirala': [
      {
        'address': 'Opp Vasavi cloth market',
        'latitude': 15.826206,
        'longitude': 80.351693
      },
    ],
    'Addanki': [
      {
        'address': 'NSP Office Premises',
        'latitude': 15.48181,
        'longitude': 79.58355
      },
    ],
    'Kavali': [
      {
        'address': 'MRO Office Premises ',
        'latitude': 14.61853,
        'longitude': 79.625203
      },
    ],
    'Gudur ': [
      {'address': 'MPDO Office', 'latitude': 14.146196, 'longitude': 79.846573},
    ],
    'Kandukur': [
      {
        'address': 'Old Fish Market',
        'latitude': 15.2152023,
        'longitude': 79.906253
      },
    ],
    'Atmakur (Nellore)': [
      {
        'address': 'Opp. Bus Stand ',
        'latitude': 14.61856,
        'longitude': 79.625301
      },
    ],
    'Piduguralla': [
      {
        'address': 'Macherla-Guntur Main road near Goverment Hospital ',
        'latitude': 16.4813342,
        'longitude': 79.8818404
      },
    ],
    'Sattenapalle ': [
      {
        'address': 'At MRO Office ',
        'latitude': 16.394702,
        'longitude': 80.149846
      },
    ],
    'Chilakaluripet ': [
      {
        'address': 'Clock tower center ',
        'latitude': 16.086174,
        'longitude': 80.167763
      },
      {'address': 'NRT Center ', 'latitude': 16.095912, 'longitude': 80.164782},
      {
        'address': 'Veterinary hospital ',
        'latitude': 16.085987,
        'longitude': 80.159635
      },
    ],
    'Narasaraopeta': [
      {
        'address': 'PALNADU Bus Stand  ',
        'latitude': 16.237695,
        'longitude': 80.044839
      },
      {
        'address': 'At Vegetable Market  ',
        'latitude': 16.233016,
        'longitude': 80.05313
      },
      {'address': 'Stadium ', 'latitude': 16.247155, 'longitude': 80.056527},
    ],
    'Vinukonda': [
      {
        'address': 'Near RTC Bus Stand - Opp: Thalli Pillala Hospital  ',
        'latitude': 16.05437,
        'longitude': 79.74055
      },
    ],
    'Macherla': [
      {
        'address': 'Main Road R&B Guest House',
        'latitude': 16.4753333,
        'longitude': 79.4348695
      },
    ],
    'Ongole': [
      {'address': 'Old RIMS ', 'latitude': 15.4979194, 'longitude': 80.0489348},
      {
        'address': 'Rytu Bazaar ',
        'latitude': 15.5138777,
        'longitude': 80.0389213
      },
      {
        'address': 'AP transco office',
        'latitude': 15.513885,
        'longitude': 80.036105
      },
      {
        'address': 'Vegetable Market',
        'latitude': 15.509025,
        'longitude': 80.0433704
      },
    ],
    'Markapur': [
      {
        'address': 'Near RTC Bus stand ',
        'latitude': 15.7335134,
        'longitude': 79.26816
      },
    ],
    'Giddalur': [
      {
        'address': 'MRO Office Premises ',
        'latitude': 15.3786117,
        'longitude': 78.926633
      },
    ],
    'Chimakurthy': [
      {
        'address': 'Back side of MRO office',
        'latitude': 15.5803646,
        'longitude': 79.86918
      },
    ],
    'Kanigiri': [
      {
        'address': 'Near MRO Office, Tigalagondi, Kanigiri ',
        'latitude': 15.4044819,
        'longitude': 79.5054197
      },
    ],
    'Nellore': [
      {
        'address': 'At Fish Market',
        'latitude': 14.4481884,
        'longitude': 79.9787385
      },
      {
        'address': 'Jawahar Bala Bhavan',
        'latitude': 14.4581386,
        'longitude': 79.99514556
      },
      {
        'address': 'At Pwd office',
        'latitude': 14.442618,
        'longitude': 79.986279
      },
      {
        'address': 'Old Municipal office',
        'latitude': 14.457469,
        'longitude': 79.975283
      },
      {
        'address': 'Indira Bhavan',
        'latitude': 14.45307,
        'longitude': 79.986041
      },
      {'address': 'Ac Market', 'latitude': 17.6673, 'longitude': 82.6106},
      {
        'address': 'Seri Culture Office',
        'latitude': 14.414963,
        'longitude': 79.948135
      },
    ],
    'Sullurpet': [
      {
        'address': 'Near kalakestram ',
        'latitude': 13.704817,
        'longitude': 80.016022
      },
    ],
    'Venkatagiri ': [
      {
        'address': 'Near MPDO Office  ',
        'latitude': 13.95454183,
        'longitude': 79.5811196
      },
    ],
    'Naidupeta ': [
      {
        'address': 'Near Auto Stand  ',
        'latitude': 13.906593,
        'longitude': 13.906593
      },
    ],
    'Srikalahasthi ': [
      {
        'address': 'Govt Hospital road  ',
        'latitude': 17.6673,
        'longitude': 82.6106
      },
      {
        'address': 'New Ramasethu Bridge  ',
        'latitude': 17.6673,
        'longitude': 82.6106
      },
    ],
    'Puttur ': [
      {
        'address': 'K.N.Road, beside Sub-Register Office  ',
        'latitude': 13.437814,
        'longitude': 79.5505783
      },
    ],
    'Tirupathi ': [
      {'address': 'M R Palli ', 'latitude': 13.617534, 'longitude': 79.409127},
      {
        'address': 'New Balaji colony ',
        'latitude': 13.622924,
        'longitude': 79.412926
      },
      {
        'address': 'ESI Hospital ',
        'latitude': 13.617863,
        'longitude': 79.417218
      },
      {
        'address': 'Nehru municipal ground ',
        'latitude': 13.63926,
        'longitude': 79.410408
      },
    ],
    'Anantapur': [
      {'address': 'Bellary cross roads', 'latitude': 14.68, 'longitude': 77.58},
      {
        'address': 'Vencoba School Gooty road',
        'latitude': 14.604,
        'longitude': 77.642
      },
      {'address': 'Junior College ', 'latitude': 14.68, 'longitude': 77.59},
    ],
    'Rayadurg ': [
      {
        'address': 'Old Bus stand, Rani chatram ',
        'latitude': 14.6980574,
        'longitude': 76.8500729
      },
    ],
    'Guntakal ': [
      {
        'address': 'Municipal Office premises  ',
        'latitude': 15.162752,
        'longitude': 77.37802
      },
    ],
    'Tadipatri': [
      {
        'address': 'Gandhi Nagar -01 ',
        'latitude': 14.911143,
        'longitude': 78.000832
      },
    ],
    'Gooty': [
      {
        'address': 'R&B Bunglow  ',
        'latitude': 14.6751241,
        'longitude': 77.5986817
      },
    ],
    'Kalyandurgam': [
      {
        'address': 'R&B Guest House ',
        'latitude': 14.55903623,
        'longitude': 77.1112738
      },
    ],
    'Rajampet': [
      {'address': 'R&B Bunglaw', 'latitude': 14.198499, 'longitude': 79.158003},
    ],
    'Madanapalle ': [
      {
        'address': 'Agricultural Market yard ',
        'latitude': 13.570924,
        'longitude': 78.499953
      },
      {
        'address': 'Weekly Market ',
        'latitude': 12.917371,
        'longitude': 79.132456
      },
    ],
    'Rayachoty ': [
      {
        'address': 'Government Hospital ',
        'latitude': 14.05822221,
        'longitude': 78.74822645
      },
      {
        'address': 'Agriculture Market Yard ',
        'latitude': 14.0688365,
        'longitude': 78.754484
      },
    ],
    'Nagari': [
      {
        'address': 'Vegitable Market',
        'latitude': 13.319508,
        'longitude': 79.585398
      },
    ],
    'Palamaner': [
      {
        'address': 'Beside anna canteen',
        'latitude': 13.201042,
        'longitude': 78.744755
      },
    ],
    'Chittoor': [
      {'address': 'Near ITI', 'latitude': 13.219821, 'longitude': 79.121109},
    ],
    'Punganur': [
      {
        'address': 'Panchayat Raj Office',
        'latitude': 13.371156,
        'longitude': 78.570058
      },
    ],
    'Kurnool': [
      {
        'address': 'Collector Office Premises',
        'latitude': 15.81779,
        'longitude': 78.041
      },
      {
        'address': 'Near Bellary Chowk',
        'latitude': 15.82449259,
        'longitude': 78.01188836
      },
      {
        'address': 'Setkur Office',
        'latitude': 15.80916396,
        'longitude': 78.02433936
      },
      {
        'address': 'Konda reddy burj old bus stand',
        'latitude': 15.8338118,
        'longitude': 78.0480994
      },
      {
        'address': 'Government General Hospital Compound',
        'latitude': 15.8190964,
        'longitude': 78.0401432
      },
    ],
    'Gudur': [
      {
        'address': 'Near Vegitable Market',
        'latitude': 15.8074,
        'longitude': 77.83385
      },
    ],
    'Adoni': [
      {
        'address': 'RMO Quarters opposite axis bank ',
        'latitude': 15.62273065,
        'longitude': 77.27715171
      },
      {
        'address': ' Srinivasa Bhavan ',
        'latitude': 15.62241,
        'longitude': 77.2725
      },
      {
        'address': 'Old Library head Post Office ',
        'latitude': 15.62090023,
        'longitude': 77.27118722
      },
    ],
    'Yemmiganur': [
      {
        'address': 'MRO Office Premises',
        'latitude': 15.7673,
        'longitude': 77.4814
      },
      {
        'address': 'Opp. Srinivasa theatre',
        'latitude': 15.7718,
        'longitude': 77.4789
      },
    ],
    'Allagadda': [
      {
        'address': 'TB Road Pathur Street',
        'latitude': 15.1344117,
        'longitude': 78.505282
      },
    ],
    'Atmakur ': [
      {
        'address': 'Old Bus Stand',
        'latitude': 15.8803,
        'longitude': 78.5816251
      },
    ],
    'Nandyala': [
      {'address': 'RTC Bus stand ', 'latitude': 15.4878, 'longitude': 78.4858},
      {
        'address': 'GOVT Hospital ',
        'latitude': 15.4691323,
        'longitude': 15.4691323
      },
    ],
    'Nandikotkur': [
      {
        'address': 'Opp Jaikisan park',
        'latitude': 15.8567505,
        'longitude': 78.266238
      },
    ],
    'Dhone': [
      {
        'address': 'Behind LIC office',
        'latitude': 15.4006147,
        'longitude': 77.87660202
      },
    ],
    'Madakasira': [
      {
        'address': 'Amarapuram Road',
        'latitude': 14.012944,
        'longitude': 77.10084
      },
    ],
    'Puttapathy ': [
      {
        'address': 'Yenumulapalli, Near Hanuman Temple',
        'latitude': 14.14854,
        'longitude': 77.813492
      },
    ],
    'Hindupur': [
      {
        'address': 'Govt Hospital ',
        'latitude': 13.83225,
        'longitude': 77.493027
      },
      {
        'address': 'Chinna Market ',
        'latitude': 13.826037,
        'longitude': 77.489508
      },
    ],
    'Dharmavaram': [
      {
        'address': 'Opp Jaikisan park',
        'latitude': 15.8567505,
        'longitude': 78.266238
      },
    ],
    'Kadiri': [
      {
        'address': 'Near R&R bunglow, College Cirlce, Kadiri',
        'latitude': 14.118858,
        'longitude': 78.156376
      },
    ],
    'Kadapa': [
      {
        'address': 'Old Municipal office premises',
        'latitude': 14.46553,
        'longitude': 78.824557
      },
      {'address': 'ZP Office', 'latitude': 14.464674, 'longitude': 78.822985},
      {
        'address': 'Old Bus stand',
        'latitude': 14.475738,
        'longitude': 78.821854
      },
    ],
    'Jammalamadugu ': [
      {
        'address': 'Opp.MRO Office ',
        'latitude': 14.846031,
        'longitude': 78.382727
      },
    ],
    'Pulivendula': [
      {
        'address': 'Old Junior College ',
        'latitude': 14.422516,
        'longitude': 78.227144
      },
    ],
    'Mydukur': [
      {
        'address': 'Proddatur Road, Mydukur',
        'latitude': 14.7968315,
        'longitude': 78.60391
      },
    ],
    'Yerraguntala': [
      {
        'address': 'Near APSRTC Bus Stand, Vempalli Road',
        'latitude': 14.3709216,
        'longitude': 78.4589378
      },
    ],
    'Proddatur ': [
      {
        'address': 'Dooradarshan Center',
        'latitude': 14.755587,
        'longitude': 78.549994
      },
    ],
    'Badvel': [
      {
        'address': 'R&B Guest House at Mydukur Road',
        'latitude': 15.3747792,
        'longitude': 78.918136
      },
    ],
  };

  GoogleMapController? _mapController;

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Anna Canteens Locations',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
        ),
        backgroundColor: const Color(0xffE20736),
      ),
      backgroundColor: const Color(0xffFFF8DC),
      body: Column(
        children: [
          const SizedBox(
            height: 19,
          ),
          Text(
            'Select your Location',
            style: TextStyle(
                fontSize: 20,
                color: Color(0xffa90f2b),
                fontWeight: FontWeight.w900),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 60, top: 10),
            child: Divider(
              thickness: 1,
              color: Color(0xffd06d62),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Select District',
                        labelStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Colors.orange.shade800),
                        border: OutlineInputBorder(),
                      ),
                      value: _selectedDistrict,
                      items: _districtCityMap.keys.map((String district) {
                        return DropdownMenuItem<String>(
                          value: district,
                          child: Text(district),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedDistrict = newValue;
                          _selectedCity =
                              null; // Reset city when district changes
                          _selectedLatLng = null;
                        });
                      },
                    ),
                    const SizedBox(height: 16.0),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Select City',
                        labelStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Color(0xffb34020)),
                        border: OutlineInputBorder(),
                      ),
                      value: _selectedCity,
                      items: _selectedDistrict == null
                          ? []
                          : _districtCityMap[_selectedDistrict]!
                              .map((String city) {
                              return DropdownMenuItem<String>(
                                value: city,
                                child: Text(city),
                              );
                            }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedCity = newValue;
                          if (_selectedCity != null) {
                            final location = _cityAddressMap[_selectedCity]![0];
                            _selectedLatLng = LatLng(
                                location['latitude'], location['longitude']);
                            _mapController?.animateCamera(
                              CameraUpdate.newLatLngZoom(
                                  _selectedLatLng!, 14.0),
                            );
                          }
                        });
                      },
                    ),
                    const SizedBox(height: 32.0),
                    if (_selectedCity != null &&
                        _cityAddressMap[_selectedCity] != null)
                      ..._cityAddressMap[_selectedCity]!.map(
                        (location) => Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _selectedCity!,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red.shade700,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      location['address'],
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xffffd700)),
                                child: TextButton(
                                  onPressed: () {
                                    gotoMap(location['latitude'],
                                        location['longitude']);
                                  },
                                  child: Text(
                                    'View',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color.fromARGB(255, 141, 52, 42),
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getLocationButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(fixedSize: const Size(300, 50)),
        onPressed: () {
          getUserLocation();
        },
        child: const Text(
          "Get Location",
          style: TextStyle(fontSize: 20),
        ));
  }

  Future<bool> checkPermission() async {
    bool isEnable = false;
    LocationPermission permission;

    //check if location is enable
    isEnable = await Geolocator.isLocationServiceEnabled();
    if (!isEnable) {
      return false;
    }

    //check if use allow location permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // if permission is denied then request user to allow permission again
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // if permission denied again
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    return true;
  }

  getUserLocation() async {
    var isEnable = await checkPermission();
    if (isEnable) {
      Position location = await Geolocator.getCurrentPosition();
      setState(() {
        result = "";
        lat = location.latitude.toString();
        lng = location.latitude.toString();
      });
    } else {
      setState(() {
        result = "Permissoin is not allow";
      });
    }
  }

  Widget displayLocation() {
    return Column(
      children: [
        Text(
          result,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          lat,
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
        Text(
          lng,
          style: const TextStyle(fontSize: 30),
        ),
      ],
    );
  }

  gotoMap(double local, double nonlocal) {
    print("latitudebro $local ,logitudebro $nonlocal");
    try {
      var url =
          "https://www.google.com/maps/dir/?api=1&destination=$local,$nonlocal";
      print("the uri is this :$url");
      final Uri _url = Uri.parse(url);
      launchUrl(_url);
    } catch (_) {
      print("Error launch Map");
    }
  }
}
