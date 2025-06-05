-- SQL скрипт activity_db

-- Создание схемы
CREATE SCHEMA IF NOT EXISTS activity_db;

-- Комментарии: шард 1 (user_id % 2 = 0)
CREATE TABLE activity_db.comments_shard_1 (
    comment_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    course_id INT REFERENCES education_db.courses(course_id),
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CHECK (user_id % 2 = 0)
);

-- Комментарии: шард 2 (user_id % 2 = 1)
CREATE TABLE activity_db.comments_shard_2 (
    comment_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    course_id INT REFERENCES education_db.courses(course_id),
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CHECK (user_id % 2 = 1)
);

-- Логи действий: шард 1
CREATE TABLE activity_db.logs_shard_1 (
    log_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    action TEXT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CHECK (user_id % 2 = 0)
);

-- Логи действий: шард 2
CREATE TABLE activity_db.logs_shard_2 (
    log_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    action TEXT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CHECK (user_id % 2 = 1)
);

-- Отзывы: шардинг по course_id
CREATE TABLE activity_db.feedback_shard_1 (
    feedback_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    course_id INT NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    CHECK (course_id % 2 = 0)
);

CREATE TABLE activity_db.feedback_shard_2 (
    feedback_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    course_id INT NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    CHECK (course_id % 2 = 1)
);
