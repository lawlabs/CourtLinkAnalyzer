# CourtLinkAnalyzer

![mac-128 (2)](https://github.com/user-attachments/assets/443de922-3b72-4614-9b21-a94fc2931524)


Приложение на SwiftUI для анализа ссылок судебных сайтов. Пользователь вводит список ссылок, а приложение автоматически определяет информацию о судах (мировые судьи, районные суды, кассационные суды и др.) и отображает результаты анализа. Поддерживается сохранение введённых ссылок для восстановления после перезапуска.

# Судебный Парсер Ссылок

Приложение на **SwiftUI** для анализа и извлечения информации из ссылок судебных сайтов. Подходит для работы с доменами российских судебных сайтов, таких как `mos-sud.ru`, `mos-gorsud.ru`, `sudrf.ru` и других.

## Описание

Приложение позволяет пользователю вводить список ссылок, анализировать их, и извлекать полезную информацию, такую как:
- Номера судебных участков мировых судей.
- Названия районных судов Москвы или Мосгорсуда.
- Обозначения мировых судей.
- Номера кассационных судов с отображением их полного названия (например, "Второй кассационный суд общей юрисдикции").
- Обозначения судов по России из ссылок с доменом `sudrf.ru`.

Введённые ссылки автоматически сохраняются и восстанавливаются при повторном запуске приложения.

## Основные возможности

- **Мгновенный анализ ссылок:** обработка списка ссылок и извлечение данных из них.
- **Сохранение данных:** ссылки сохраняются между сеансами через `UserDefaults`.
- **Поддержка популярных доменов:** приложение работает с судебными доменами:
  - `mos-sud.ru`
  - `mos-gorsud.ru`
  - `msudrf.ru`
  - `mirsud.spb.ru`
  - `sudrf.ru` (включая поддомен `kas.sudrf.ru`).
- **Простой и удобный интерфейс:** ввод ссылок в текстовом поле и просмотр результатов анализа.

## Как использовать

1. Введите ссылки в текстовое поле. Каждая ссылка должна быть на новой строке.
2. Нажмите кнопку **"Разобрать ссылки"**.
3. Результаты анализа отобразятся в отдельном текстовом блоке ниже.

## Технологии

- **Язык программирования:** Swift
- **Фреймворк:** SwiftUI
- **Хранение данных:** UserDefaults

## Установка

1. Скачайте проект или клонируйте репозиторий:
   ```bash
   git clone https://github.com/username/link-parser.git
2. Откройте проект в Xcode.
3. Соберите и запустите проект на симуляторе или устройстве.

## Требования

Xcode 14.0 или выше
iOS 16.0 или выше
macOS 13.0 или выше (опционально)

## Лицензия

Этот проект распространяется под лицензией MIT. Подробнее см. в файле LICENSE.

