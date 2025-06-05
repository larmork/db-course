-- SQL скрипт users_db

-- Создание схемы
CREATE SCHEMA IF NOT EXISTS users_db;

-- Таблица пользователей
CREATE TABLE users_db.users (
    user_id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Профили пользователей
CREATE TABLE users_db.profiles (
    profile_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users_db.users(user_id),
    full_name VARCHAR(255),
    avatar_url TEXT,
    bio TEXT
);

-- Роли (например: student, instructor, admin)
CREATE TABLE users_db.roles (
    role_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users_db.users(user_id),
    role_name VARCHAR(50) NOT NULL
);
