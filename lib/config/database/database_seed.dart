import 'dart:convert';

import 'package:injectable/injectable.dart';

import 'database_helper.dart';

@LazySingleton()
class DatabaseSeeder {
  static Future<void> seedDatabase() async {
    final db = await DatabaseHelper.instance.database;

    // delete existing data to avoid duplicates (optional)
    await db.delete('products');
    await db.delete('categories');
    await db.delete('plans');

    // --- categories ---
    final categories = [
      {'name': 'موضة رجالي', 'image': 'assets/images/man.png'},
      {'name': 'ساعات', 'image': 'assets/images/watch.png'},
      {'name': 'موبايلات', 'image': 'assets/images/phone.png'},
      {'name': 'منتجات تجميل', 'image': 'assets/images/accessories.png'},
    ];

    // insert categories
    for (final category in categories) {
      await db.insert('categories', {
        'name': category['name'],
        'image': category['image'],
      });
    }

    // get the IDs after insertion
    final List<Map<String, Object?>> insertedCategories = await db.query(
      'categories',
    );

    // --- products ---
    final products = List.generate(8, (index) {
      final categoryId = insertedCategories[0]['id'] as int;
      return {
        'image': 'assets/images/product${index + 1}.png',
        'name': 'جاكيت من الصوف مناسب',
        'price_before': 60000,
        'price_after': 32000,
        'sales_count': 3.3,
        'category_id': categoryId,
      };
    });

    for (final product in products) {
      await db.insert('products', product);
    }

    // --- plans ---
    final plans = [
      {
        'name': 'أساسية',
        'price': 3000.0,
        'views_multiplier': 1,
        'details': jsonEncode([
          {'text': 'صلاحية الإعلان 30 يوم', 'icon': 'assets/icons/acute.svg'},
        ]),
      },
      {
        'name': 'أكسترا',
        'price': 3000.0,
        'views_multiplier': 2,
        'details': jsonEncode([
          {'text': 'صلاحية الإعلان 30 يوم', 'icon': 'assets/icons/acute.svg'},
          {
            'text': 'رفع لأعلى القائمة كل 3 أيام',
            'icon': 'assets/icons/rocket.svg',
          },
          {
            'text': 'تثبيت فى مقاول صحى \n ( خلال ال48 ساعة القادمة )',
            'icon': 'assets/icons/keep.svg',
          },
        ]),
      },
      {
        'name': 'بلس',
        'offer_label': 'أفضل قيمة مقابل سعر',
        'price': 3000.0,
        'views_multiplier': 3,
        'details': jsonEncode([
          {'text': 'صلاحية الإعلان 30 يوم', 'icon': 'assets/icons/acute.svg'},
          {
            'text': 'رفع لأعلى القائمة كل 3 أيام',
            'icon': 'assets/icons/rocket.svg',
          },
          {
            'text': 'تثبيت فى مقاول صحى \n ( خلال ال48 ساعة القادمة )',
            'icon': 'assets/icons/keep.svg',
          },
          {'text': 'ظهور فى كل محافظات مصر', 'icon': 'assets/icons/globe.svg'},
          {'text': 'أعلان مميز', 'icon': 'assets/icons/workspace_premium.svg'},
          {
            'text': 'تثبيت فى مقاول صحى فى الجهراء',
            'icon': 'assets/icons/keep.svg',
          },
          {
            'text': 'تثبيت فى مقاول صحى \n ( خلال ال48 ساعة القادمة )',
            'icon': 'assets/icons/keep.svg',
          },
        ]),
      },
      {
        'name': 'سوبر',
        'offer_label': 'أعلى مشاهدات',
        'price': 3000.0,
        'views_multiplier': 4,
        'details': jsonEncode([
          {'text': 'صلاحية الإعلان 30 يوم', 'icon': 'assets/icons/acute.svg'},
          {
            'text': 'رفع لأعلى القائمة كل 3 أيام',
            'icon': 'assets/icons/rocket.svg',
          },
          {
            'text': 'تثبيت فى مقاول صحى \n ( خلال ال48 ساعة القادمة )',
            'icon': 'assets/icons/keep.svg',
          },
          {'text': 'ظهور فى كل محافظات مصر', 'icon': 'assets/icons/globe.svg'},
          {'text': 'أعلان مميز', 'icon': 'assets/icons/workspace_premium.svg'},
          {
            'text': 'تثبيت فى مقاول صحى فى الجهراء',
            'icon': 'assets/icons/keep.svg',
          },
          {
            'text': 'تثبيت فى مقاول صحى \n ( خلال ال48 ساعة القادمة )',
            'icon': 'assets/icons/keep.svg',
          },
        ]),
      },
    ];

    for (final plan in plans) {
      await db.insert('plans', plan);
    }

    print('✅ Database seeded successfully!');
  }
}
