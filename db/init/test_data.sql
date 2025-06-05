-- SQL скрипт с тестовыми INSERT-ами

-- Пользователи
INSERT INTO users_db.users (email, password_hash) VALUES
('alice@example.com', 'hash1'),
('bob@example.com', 'hash2'),
('carol@example.com', 'hash3');

-- Профили
INSERT INTO users_db.profiles (user_id, full_name, avatar_url) VALUES
(1, 'Alice A.', 'https://...'),
(2, 'Bob B.', 'https://...');

-- Роли
INSERT INTO users_db.roles (user_id, role_name) VALUES
(1, 'student'),
(2, 'instructor'),
(3, 'student');

-- Курсы
INSERT INTO education_db.courses (title, description, author_id) VALUES
('Intro to Java', 'Basic Java course', 2),
('SQL for Beginners', 'Learn SQL', 2);

-- Уроки
INSERT INTO education_db.lessons (course_id, title, content) VALUES
(1, 'Variables', '...'),
(1, 'Loops', '...'),
(2, 'SELECT queries', '...');

-- Прогресс
INSERT INTO education_db.progress_shard_1 (user_id, lesson_id, completed) VALUES
(2, 1, true),
(2, 2, false);

INSERT INTO education_db.progress_shard_2 (user_id, lesson_id, completed) VALUES
(1, 1, true),
(3, 3, true);

-- Комментарии
INSERT INTO activity_db.comments_shard_1 (user_id, course_id, content) VALUES
(2, 1, 'Great lesson!');

INSERT INTO activity_db.comments_shard_2 (user_id, course_id, content) VALUES
(1, 2, 'Thanks for the explanation');

-- Логи
INSERT INTO activity_db.logs_shard_1 (user_id, action) VALUES
(2, 'login');

INSERT INTO activity_db.logs_shard_2 (user_id, action) VALUES
(1, 'view_lesson');

-- Отзывы
INSERT INTO activity_db.feedback_shard_1 (user_id, course_id, rating, comment) VALUES
(2, 2, 5, 'Excellent');

INSERT INTO activity_db.feedback_shard_2 (user_id, course_id, rating, comment) VALUES
(1, 1, 4, 'Very good');
