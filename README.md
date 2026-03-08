# DateKeeper

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Build Status](https://github.com/Sashido01/datekeeper/actions/workflows/build.yml/badge.svg)](https://github.com/Sashido01/datekeeper/actions/workflows/build.yml)

**DateKeeper** — приватный офлайн-помощник для хранения и напоминания важных дат. Никакой телеметрии, всё локально.

## Статус разработки

✅ **Спринт 1 завершён** — инфраструктура (навигация, темы, локализация, DI, общие виджеты)  
🚧 **Спринт 2 в работе** — главный экран Timeline с реальными данными

## Уникальная ценность
- **Privacy-first**: данные только на вашем устройстве, открытый код (MIT).
- **Offline-first**: работает без интернета.
- **Подарочный фонд**: сохраняйте идеи подарков и получайте о них напоминания.
- **Кроссплатформенность**: Windows, Linux, Android, iOS (в разработке).

## Функции MVP
- Управление событиями (CRUD)
- Повторяющиеся события (ежегодно)
- Локальные уведомления с настройками
- Категории (семья, друзья, работа)
- Лента ближайших событий
- Экспорт/импорт JSON (AES-256)
- Импорт CSV (из Google Contacts)
- Системный трей Windows
- Настройки (язык, тема, время уведомлений)

## Технологии
- Flutter (Dart)
- Riverpod (state management)
- Drift (SQLite)
- go_router
- flutter_local_notifications, workmanager
- flutter_secure_storage, AES-256

## Сборка и запуск
1. Установите Flutter SDK (стабильная версия).
2. Склонируйте репозиторий:
   ```bash
   git clone https://github.com/Sashido01/datekeeper.git
   cd datekeeper