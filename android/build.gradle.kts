plugins {
    id("com.android.application") apply false
    id("org.jetbrains.kotlin.android") apply false
    id("com.google.gms.google-services") version "4.4.1" apply false
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Redirección de directorios de compilación para la CLI de Flutter
val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

subprojects {
    project.evaluationDependsOn(":app")
}

// Parche Maestro de Namespace y compileSdk para Isar / Firebase / Plugins heredados
subprojects {
    plugins.withId("com.android.library") {
        val android = extensions.getByType(com.android.build.gradle.LibraryExtension::class.java)
        if (android.namespace == null) {
            android.namespace = project.group.toString().ifEmpty { "dev.isar.isar_flutter_libs" }
        }
        android.compileSdk = 36
    }
    
    plugins.withId("com.android.application") {
        val android = extensions.getByType(com.android.build.gradle.AppExtension::class.java)
        if (android.namespace == null) {
            android.namespace = project.group.toString().ifEmpty { "com.example.chat_isar_firebase" }
        }
    }
}

// Saneamiento del Compilador de Kotlin a JVM 17
tasks.withType<org.jetbrains.kotlin.gradle.tasks.KotlinCompile>().configureEach {
    compilerOptions {
        jvmTarget.set(org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17)
    }
}

val clean by tasks.registering(Delete::class) {
    delete(rootProject.buildDir)
}