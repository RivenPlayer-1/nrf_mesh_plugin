import java.io.File
import java.util.Properties
import groovy.json.JsonSlurper

pluginManagement {
    val flutterSdkPath = run {
        val properties = java.util.Properties()
        file("local.properties").inputStream().use { properties.load(it) }
        val flutterSdkPath = properties.getProperty("flutter.sdk")
        require(flutterSdkPath != null) { "flutter.sdk not set in local.properties" }
        flutterSdkPath
    }

    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

plugins {
    id("dev.flutter.flutter-plugin-loader") version "1.0.0"
    id("com.android.application") version "8.7.3" apply false
    id("org.jetbrains.kotlin.android") version "2.1.0" apply false
}

rootProject.name = "nordic_nrf_mesh_faradine"
// 1. Include main app module
include(":app")

// 2. Load local.properties
val localPropertiesFile = File(rootProject.projectDir, "local.properties")
require(localPropertiesFile.exists()) { "local.properties file not found" }

val properties = Properties().apply {
    localPropertiesFile.reader(Charsets.UTF_8).use { reader ->
        load(reader)
    }
}

// 3. Configure Flutter SDK
val flutterSdkPath = properties.getProperty("flutter.sdk")
    ?: error("flutter.sdk not set in local.properties")
//apply(from = "$flutterSdkPath/packages/flutter_tools/gradle/app_plugin_loader.gradle")

// 4. Dynamically include Nordic Mesh library
val flutterProjectRoot = rootProject.projectDir.parentFile
val pluginsFile = File(flutterProjectRoot, ".flutter-plugins-dependencies")

if (!pluginsFile.exists()) {
    logger.warn("Flutter plugins file not found: ${pluginsFile.absolutePath}")
} else {
    try {
        val json = JsonSlurper().parse(pluginsFile) as? Map<*, *>
            ?: error("Root JSON is not an object")

        val plugins = json["plugins"] as? Map<*, *>
            ?: error("'plugins' field is not an object")

        val androidPlugins = plugins["android"] as? List<*>
            ?: error("'plugins.android' is not an array")

        androidPlugins.forEach { plugin ->
            val androidPlugin = plugin as? Map<*, *>
                ?: error("Plugin entry is not an object")

            val name = androidPlugin["name"] as? String
                ?: error("Plugin name must be String")
            val path = androidPlugin["path"] as? String
                ?: error("Plugin path must be String")

            if (name == "nordic_nrf_mesh_faradine") {
                logger.lifecycle("Including forked Nordic's ADK v3")

                // Platform-agnostic path handling
                val meshLibPath = File(path.replace("android", ""))
                    .resolve("Android-nRF-Mesh-Library")
                    .resolve("mesh")
                    .canonicalFile

                logger.lifecycle("meshLibPath = ${meshLibPath.absolutePath}")

                include(":mesh")
                project(":mesh").projectDir = meshLibPath
            }
        }
    } catch (e: Exception) {
        throw GradleException("Failed to process Flutter plugins: ${e.message}", e)
    }
}
