import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treak/Data/data.dart';
import '../Models/section_model.dart';

final sectionProvider = Provider((ref) => user.section);
class SectionNotifier extends StateNotifier<List<SectionModel>>{
  SectionNotifier():super(user.section);
}