CREATE TABLE area
(
  a_name VARCHAR(15) NOT NULL,
  a_id NUMERIC(5) NOT NULL,
  PRIMARY KEY (a_id)
);

CREATE TABLE my_group
(
  amount NUMERIC(5) NOT NULL,
  m_g_id NUMERIC(5) NOT NULL,
  PRIMARY KEY (m_g_id)
);

CREATE TABLE difficulty
(
  d_name VARCHAR(15) NOT NULL,
  d_id NUMERIC(5) NOT NULL,
  PRIMARY KEY (d_id)
);

CREATE TABLE kind
(
  k_name VARCHAR(15) NOT NULL,
  k_id NUMERIC(5) NOT NULL,
  PRIMARY KEY (k_id)
);

CREATE TABLE city
(
  c_id NUMERIC(5) NOT NULL,
  c_name VARCHAR(15) NOT NULL,
  a_id NUMERIC(5) NOT NULL,
  PRIMARY KEY (c_id),
  FOREIGN KEY (a_id) REFERENCES area(a_id)
);

CREATE TABLE my_path
(
  p_name VARCHAR(15) NOT NULL,
  p_time NUMERIC(5, 2) NOT NULL,
  p_length NUMERIC(5, 2) NOT NULL,
  p_id NUMERIC(5) NOT NULL,
  a_id NUMERIC(5) NOT NULL,
  d_id NUMERIC(5) NOT NULL,
  k_id NUMERIC(5) NOT NULL,
  PRIMARY KEY (p_id, a_id),
  FOREIGN KEY (a_id) REFERENCES area(a_id),
  FOREIGN KEY (d_id) REFERENCES difficulty(d_id),
  FOREIGN KEY (k_id) REFERENCES kind(k_id)
);

CREATE TABLE client
(
  c_tz NUMERIC(5) NOT NULL,
  c_name VARCHAR(15) NOT NULL,
  b_date DATE NOT NULL,
  c_id NUMERIC(5) NOT NULL,
  m_g_id NUMERIC(5) NOT NULL,
  PRIMARY KEY (c_tz),
  FOREIGN KEY (c_id) REFERENCES city(c_id),
  FOREIGN KEY (m_g_id) REFERENCES my_group(m_g_id)
);

CREATE TABLE employee
(
  e_id NUMERIC(5) NOT NULL,
  e_name VARCHAR(15) NOT NULL,
  hire_date DATE NOT NULL,
  c_id NUMERIC(5) NOT NULL,
  PRIMARY KEY (e_id),
  FOREIGN KEY (c_id) REFERENCES city(c_id)
);

CREATE TABLE guide
(
  g_id NUMERIC(5) NOT NULL,
  experience NUMERIC(5, 1) NOT NULL,
  e_id NUMERIC(5) NOT NULL,
  PRIMARY KEY (g_id),
  FOREIGN KEY (e_id) REFERENCES employee(e_id)
);

CREATE TABLE invitation
(
  price NUMERIC(5) NOT NULL,
  i_date DATE NOT NULL,
  i_id NUMERIC(5) NOT NULL,
  m_g_id NUMERIC(5) NOT NULL,
  g_id NUMERIC(5) NOT NULL,
  PRIMARY KEY (i_id),
  FOREIGN KEY (m_g_id) REFERENCES my_group(m_g_id),
  FOREIGN KEY (g_id) REFERENCES guide(g_id)
);

CREATE TABLE belongs_to
(
  i_id NUMERIC(5) NOT NULL,
  p_id NUMERIC(5) NOT NULL,
  a_id NUMERIC(5) NOT NULL,
  PRIMARY KEY (i_id, p_id, a_id),
  FOREIGN KEY (i_id) REFERENCES invitation(i_id),
  FOREIGN KEY (p_id, a_id) REFERENCES my_path(p_id, a_id)
);
