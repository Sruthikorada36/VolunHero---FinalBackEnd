DROP TABLE IF EXISTS line_items
CASCADE;
DROP TABLE IF EXISTS services
CASCADE;
DROP TABLE IF EXISTS categories
CASCADE;
DROP TABLE IF EXISTS users
CASCADE;

CREATE TABLE users
(
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  phone VARCHAR(255) NOT NULL,
  is_volunteer BOOLEAN DEFAULT FALSE,
  address VARCHAR(255) NOT NULL,
  city VARCHAR(255) NOT NULL,
  province VARCHAR(255) NOT NULL,
  country VARCHAR(255) NOT NULL,
  postalcode VARCHAR(255) NOT NULL,
  created_at TIMESTAMP NOT NULL
);



CREATE TABLE categories
(
  id SERIAL PRIMARY KEY NOT NULL,
  category VARCHAR(255) NOT NULL

);


CREATE TABLE services
(
  id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  category_id INTEGER REFERENCES categories(id) ON DELETE CASCADE,
  description TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  is_completed BOOLEAN DEFAULT FALSE,
  volunteer_user_id INTEGER REFERENCES users(id) ON DELETE CASCADE DEFAULT NULL

);

CREATE TABLE line_items
(
  id SERIAL PRIMARY KEY NOT NULL,
  service_id INTEGER REFERENCES services(id) ON DELETE CASCADE,
  text TEXT NOT NULL
);
