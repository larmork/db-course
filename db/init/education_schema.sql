-- SQL скрипт education_db

-- Создание схемы
CREATE SCHEMA IF NOT EXISTS education_db;

-- Курсы
CREATE TABLE education_db.courses (
    course_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    author_id INT REFERENCES users_db.users(user_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Уроки
CREATE TABLE education_db.lessons (
    lesson_id SERIAL PRIMARY KEY,
    course_id INT REFERENCES education_db.courses(course_id),
    title VARCHAR(255) NOT NULL,
    content TEXT
);

-- Прогресс: шард 1 (user_id % 2 = 0)
CREATE TABLE education_db.progress_shard_1 (
    progress_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    lesson_id INT REFERENCES education_db.lessons(lesson_id),
    completed BOOLEAN DEFAULT FALSE,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CHECK (user_id % 2 = 0)
);

-- Прогресс: шард 2 (user_id % 2 = 1)
CREATE TABLE education_db.progress_shard_2 (
    progress_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    lesson_id INT REFERENCES education_db.lessons(lesson_id),
    completed BOOLEAN DEFAULT FALSE,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CHECK (user_id % 2 = 1)
);
