plugins {
    id("com.android.application")
    id("kotlin-android")
    
    // Flutter plugin must be last
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")   // Google Services plugin
}

android {
    namespace = "com.example.deen_quran"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.deen_quran"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}



flutter {
    source = "../.."
}

dependencies {
    // ----------------------------
    // ✅ Firebase Dependencies
    // ----------------------------
    implementation(platform("com.google.firebase:firebase-bom:34.6.0"))
    implementation("com.google.firebase:firebase-analytics")

    // (Optional) — If you use Google Sign-In for Android
    implementation("com.google.android.gms:play-services-auth:20.7.0")
}
