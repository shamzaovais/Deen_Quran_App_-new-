import 'dart:async';
import 'package:flutter/cupertino.dart';

class AppProvider extends ChangeNotifier {
  // Navigation Logic
  int _currentIndex = 0;
  String _currentRoute = '/';
  final List<String> _navigationHistory = [];

  // Prayer Times Logic
  DateTime _currentTime = DateTime.now();
  Timer? _timer;
  String _location = 'Lahore, Pakistan';
  bool _is24HourFormat = false;
  int _notificationMinutes = 15;
  bool _notificationsEnabled = true;
  String _nextPrayerName = 'Fajar';
  int _remainingMinutes = 53;
  int _remainingSeconds = 30;

  // 🔹 Add this prayer status list for tracking active cards
  List<bool> prayerStatus = [];

  final List<Map<String, dynamic>> _prayerTimes = [
    {'name': 'Fajr', 'time': '05:30', 'icon': '🌅', 'timeInMinutes': 336, 'isPrayed': false},
    {'name': 'Dhuhr', 'time': '13:25', 'icon': '☀️', 'timeInMinutes': 805, 'isPrayed': false},
    {'name': 'Asr', 'time': '16:32', 'icon': '🌤️', 'timeInMinutes': 992, 'isPrayed': false},
    {'name': 'Maghrib', 'time': '18:36', 'icon': '🌆', 'timeInMinutes': 1116, 'isPrayed': false},
    {'name': 'Isha', 'time': '19:36', 'icon': '🌙', 'timeInMinutes': 1176, 'isPrayed': false},
  ];

  // Quran Reading Logic
  int _currentSurah = 1;
  int _currentAyah = 1;
  int _totalSurahs = 114;
  double _readingProgress = 0.0;
  final List<String> _bookmarkedAyahs = [];

  // Reminder Logic
  final List<Map<String, dynamic>> _reminders = [];
  bool _fajrReminderEnabled = true;
  bool _dhuhrReminderEnabled = true;
  bool _asrReminderEnabled = true;
  bool _maghribReminderEnabled = true;

  // Donation Logic
  double _totalDonated = 0.0;
  final List<Map<String, dynamic>> _donationHistory = [];

  AppProvider() {
    _startTimer();
    _calculateNextPrayer();

    // ✅ Initialize prayerStatus with the same length as prayerTimes
    prayerStatus = List.generate(_prayerTimes.length, (_) => false);
  }

  // ==================== GETTERS ====================
  int get currentIndex => _currentIndex;
  String get currentRoute => _currentRoute;
  List<String> get navigationHistory => List.unmodifiable(_navigationHistory);

  List<Map<String, dynamic>> get prayerTimes => List.unmodifiable(_prayerTimes);
  DateTime get currentTime => _currentTime;
  String get location => _location;
  bool get is24HourFormat => _is24HourFormat;
  int get notificationMinutes => _notificationMinutes;
  bool get notificationsEnabled => _notificationsEnabled;
  String get nextPrayerName => _nextPrayerName;
  String get nextPrayerTime => '${_remainingMinutes.toString().padLeft(2, '0')}:${_remainingSeconds.toString().padLeft(2, '0')}';
  String get currentDate => '19 October, 2025';
  String get formattedTime => _is24HourFormat
      ? '${_currentTime.hour.toString().padLeft(2, '0')}:${_currentTime.minute.toString().padLeft(2, '0')}'
      : '${(_currentTime.hour % 12 == 0 ? 12 : _currentTime.hour % 12).toString().padLeft(2, '0')}:${_currentTime.minute.toString().padLeft(2, '0')}';

  int get currentSurah => _currentSurah;
  int get currentAyah => _currentAyah;
  int get totalSurahs => _totalSurahs;
  double get readingProgress => _readingProgress;
  List<String> get bookmarkedAyahs => List.unmodifiable(_bookmarkedAyahs);

  List<Map<String, dynamic>> get reminders => List.unmodifiable(_reminders);
  bool get fajrReminderEnabled => _fajrReminderEnabled;
  bool get dhuhrReminderEnabled => _dhuhrReminderEnabled;
  bool get asrReminderEnabled => _asrReminderEnabled;
  bool get maghribReminderEnabled => _maghribReminderEnabled;

  double get totalDonated => _totalDonated;
  List<Map<String, dynamic>> get donationHistory => List.unmodifiable(_donationHistory);

  // ==================== NAVIGATION ====================
  void setIndex(int index) {
    _currentIndex = index;
    _addToHistory('index_$index');
    notifyListeners();
  }

  void setRoute(String route) {
    _currentRoute = route;
    _addToHistory(route);
    notifyListeners();
  }

  void _addToHistory(String item) {
    _navigationHistory.add(item);
    if (_navigationHistory.length > 50) {
      _navigationHistory.removeAt(0);
    }
  }

  bool canGoBack() => _navigationHistory.length > 1;

  void goBack() {
    if (canGoBack()) {
      _navigationHistory.removeLast();
      notifyListeners();
    }
  }

  // ==================== PRAYER TIMES ====================
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _currentTime = DateTime.now();
      _calculateNextPrayer();
      _updateRemainingTime();
      notifyListeners();
    });
  }

  void _calculateNextPrayer() {
    final currentMinutes = _currentTime.hour * 60 + _currentTime.minute;

    for (var prayer in _prayerTimes) {
      final timeInMinutes = prayer['timeInMinutes'] as int;
      if (currentMinutes < timeInMinutes) {
        _nextPrayerName = prayer['name'];
        _remainingMinutes = timeInMinutes - currentMinutes;
        return;
      }
    }

    // handle next day's fajr
    final nextDayTime = _prayerTimes[0]['timeInMinutes'] as int;
    _nextPrayerName = _prayerTimes[0]['name'];
    _remainingMinutes = (1440 - currentMinutes) + nextDayTime;
  }

  void _updateRemainingTime() {
    if (_remainingSeconds > 0) {
      _remainingSeconds--;
    } else {
      _remainingSeconds = 59;
      if (_remainingMinutes > 0) {
        _remainingMinutes--;
      }
    }
  }

  void togglePrayerStatus(int index) {
    if (index < 0 || index >= prayerStatus.length) return;
    prayerStatus[index] = !prayerStatus[index];
    notifyListeners();
  }

  void setLocation(String newLocation) {
    _location = newLocation;
    notifyListeners();
  }

  void toggleTimeFormat() {
    _is24HourFormat = !_is24HourFormat;
    notifyListeners();
  }

  void setNotificationMinutes(int minutes) {
    _notificationMinutes = minutes;
    notifyListeners();
  }

  void toggleNotifications() {
    _notificationsEnabled = !_notificationsEnabled;
    notifyListeners();
  }

  // ==================== QURAN ====================
  void goToSurah(int surahNumber) {
    if (surahNumber >= 1 && surahNumber <= _totalSurahs) {
      _currentSurah = surahNumber;
      _currentAyah = 1;
      _updateReadingProgress();
      notifyListeners();
    }
  }

  void nextAyah() {
    _currentAyah++;
    _updateReadingProgress();
    notifyListeners();
  }

  void previousAyah() {
    if (_currentAyah > 1) {
      _currentAyah--;
      _updateReadingProgress();
      notifyListeners();
    }
  }

  void bookmarkAyah() {
    String bookmark = 'Surah $_currentSurah:$_currentAyah';
    if (!_bookmarkedAyahs.contains(bookmark)) {
      _bookmarkedAyahs.add(bookmark);
      notifyListeners();
    }
  }

  void removeBookmark(String bookmark) {
    _bookmarkedAyahs.remove(bookmark);
    notifyListeners();
  }

  void _updateReadingProgress() {
    _readingProgress = (_currentSurah / _totalSurahs) * 100;
  }

  // ==================== REMINDERS ====================
  void addReminder(String title, String time, bool isRecurring) {
    _reminders.add({
      'id': DateTime.now().millisecondsSinceEpoch.toString(),
      'title': title,
      'time': time,
      'isRecurring': isRecurring,
      'isEnabled': true,
      'createdAt': DateTime.now(),
    });
    notifyListeners();
  }

  void removeReminder(String id) {
    _reminders.removeWhere((r) => r['id'] == id);
    notifyListeners();
  }

  void toggleReminder(String id) {
    final index = _reminders.indexWhere((r) => r['id'] == id);
    if (index != -1) {
      _reminders[index]['isEnabled'] = !_reminders[index]['isEnabled'];
      notifyListeners();
    }
  }

  void togglePrayerReminder(String prayerName) {
    switch (prayerName.toLowerCase()) {
      case 'fajr':
        _fajrReminderEnabled = !_fajrReminderEnabled;
        break;
      case 'dhuhr':
        _dhuhrReminderEnabled = !_dhuhrReminderEnabled;
        break;
      case 'asr':
        _asrReminderEnabled = !_asrReminderEnabled;
        break;
      case 'maghrib':
        _maghribReminderEnabled = !_maghribReminderEnabled;
        break;
    }
    notifyListeners();
  }

  // ==================== DONATION ====================
  void addDonation(double amount, String cause, String method) {
    _totalDonated += amount;
    _donationHistory.add({
      'id': DateTime.now().millisecondsSinceEpoch.toString(),
      'amount': amount,
      'cause': cause,
      'method': method,
      'date': DateTime.now(),
    });
    notifyListeners();
  }

  String getMonthlyDonationTotal() {
    final now = DateTime.now();
    double monthlyTotal = 0.0;

    for (var donation in _donationHistory) {
      DateTime date = donation['date'];
      if (date.year == now.year && date.month == now.month) {
        monthlyTotal += donation['amount'];
      }
    }

    return monthlyTotal.toStringAsFixed(2);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
