import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    id("dev.flutter.flutter-gradle-plugin")
}

// Load keystore properties
val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

android {
    namespace = "com.alapon.alapon"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    // Kotlin jvmTarget
    kotlin {
        jvmToolchain(17)
    }

    defaultConfig {
        applicationId = "com.alapon.alapon"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release") {
            val alias = keystoreProperties.getProperty("keyAlias")
            val keyPass = keystoreProperties.getProperty("keyPassword")
            val storePass = keystoreProperties.getProperty("storePassword")
            val storeFilePath = keystoreProperties.getProperty("storeFile")

            if (alias != null && keyPass != null && storePass != null && storeFilePath != null) {
                keyAlias = alias
                keyPassword = keyPass
                storePassword = storePass
                storeFile = file(storeFilePath)
            }
        }
    }

    buildTypes {
        release {
            isMinifyEnabled = false       // <-- keep code shrinking OFF
            isShrinkResources = false     // <-- also disable resource shrinking
            signingConfig = signingConfigs.getByName("release")
        }
    }
}

flutter {
    source = "../.."
}