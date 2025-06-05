# Платформа онлайн-курсов (Итоговый проект)

## 📌 Описание
Система, демонстрирующая масштабируемость, шардирование и мониторинг PostgreSQL-базы на примере платформы онлайн-курсов. Подключение реализовано через JDBC-приложение на Java.

## 🚀 Как запустить
```bash
docker compose up -d
```

## 📦 Компоненты
- PostgreSQL (3 БД: users, education, activity)
- Prometheus, Node Exporter, Postgres Exporter
- Grafana (порт 3000)
- Java-приложение с JDBC

## 📊 Дашборды
`docker/grafana/dashboards/business_dashboard_grafana.json` 

## 📂 Структура
- `docker/` — конфигурации Docker и Prometheus
- `db/init/` — SQL-структура и тестовые данные
- `app/jdbc-example/` — JDBC-пример
- `report/` — отчёт и скриншоты
- `README.md` — этот файл
