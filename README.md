# app_comanda

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Build Environment tutorial

<https://medium.com/@matt.goodson.business/separating-build-environment-configurations-in-flutter-with-firebase-doing-it-the-right-way-c72c3ad3621f>

## MobX

flutter packages pub run build_runner build --delete-conflicting-outputs
flutter packages pub run build_runner watch --delete-conflicting-outputs

# GERAR VERSÃO

-> flutter build apk --split-per-abi
-> flutter build appbundle lib/main_prod.dart
-> flutter build ios lib/main_prod.dart --release
-> flutter build apk --debug
-> flutter build apk lib/main_prod.dart
-> flutter build apk lib/main_prod.dart --release

## PROBLEMAS

flutter pub cache repair
flutter clean

flutter packages pub upgrade

## Run App

flutter run lib/main_dev.dart
flutter run lib/main_hml.dart
flutter run lib/main_prod.dart