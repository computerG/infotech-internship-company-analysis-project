-
-- Database "company" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2024-04-30 10:38:27

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4819 (class 1262 OID 36012)
-- Name: company; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE company WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE company OWNER TO postgres;

\connect company

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 36090)
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    dept_no character varying(4) NOT NULL,
    dept_name character varying(40)
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 36095)
-- Name: dept_emp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dept_emp (
    emp_no integer NOT NULL,
    dept_no character varying(4),
    from_date date,
    to_date date
);


ALTER TABLE public.dept_emp OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 36110)
-- Name: dept_manager; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dept_manager (
    dept_no character varying(4) NOT NULL,
    emp_no integer,
    from_date date,
    to_date date
);


ALTER TABLE public.dept_manager OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 36069)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    emp_no integer NOT NULL,
    birth_date date,
    first_name character varying(14),
    last_name character varying(16),
    gender character varying(1),
    hire_date date
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 36082)
-- Name: salaries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salaries (
    emp_no integer,
    salary integer,
    from_date date,
    to_date date
);


ALTER TABLE public.salaries OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 36074)
-- Name: titles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.titles (
    emp_no integer,
    title character varying(50),
    from_date date,
    to_date date
);


ALTER TABLE public.titles OWNER TO postgres;

--
-- TOC entry 4811 (class 0 OID 36090)
-- Dependencies: 218
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.departments (dept_no, dept_name) VALUES ('d001', 'HR');
INSERT INTO public.departments (dept_no, dept_name) VALUES ('d002', 'Finance');
INSERT INTO public.departments (dept_no, dept_name) VALUES ('d003', 'Marketing');
INSERT INTO public.departments (dept_no, dept_name) VALUES ('d004', 'Engineering');
INSERT INTO public.departments (dept_no, dept_name) VALUES ('d005', 'Sales');
INSERT INTO public.departments (dept_no, dept_name) VALUES ('d006', 'IT');
INSERT INTO public.departments (dept_no, dept_name) VALUES ('d007', 'Operations');
INSERT INTO public.departments (dept_no, dept_name) VALUES ('d008', 'Research');
INSERT INTO public.departments (dept_no, dept_name) VALUES ('d009', 'Quality Assurance');
INSERT INTO public.departments (dept_no, dept_name) VALUES ('d010', 'Customer Service');


--
-- TOC entry 4812 (class 0 OID 36095)
-- Dependencies: 219
-- Data for Name: dept_emp; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dept_emp (emp_no, dept_no, from_date, to_date) VALUES (10002, 'd002', '2005-02-28', '9999-01-01');
INSERT INTO public.dept_emp (emp_no, dept_no, from_date, to_date) VALUES (10003, 'd003', '2003-11-10', '2010-12-31');
INSERT INTO public.dept_emp (emp_no, dept_no, from_date, to_date) VALUES (10004, 'd004', '2007-09-15', '9999-01-01');
INSERT INTO public.dept_emp (emp_no, dept_no, from_date, to_date) VALUES (10005, 'd005', '2002-04-20', '9999-01-01');
INSERT INTO public.dept_emp (emp_no, dept_no, from_date, to_date) VALUES (10006, 'd001', '2004-03-18', '9999-01-01');
INSERT INTO public.dept_emp (emp_no, dept_no, from_date, to_date) VALUES (10007, 'd002', '2006-08-22', '9999-01-01');
INSERT INTO public.dept_emp (emp_no, dept_no, from_date, to_date) VALUES (10008, 'd003', '2008-11-30', '9999-01-01');
INSERT INTO public.dept_emp (emp_no, dept_no, from_date, to_date) VALUES (10009, 'd004', '2010-05-14', '9999-01-01');
INSERT INTO public.dept_emp (emp_no, dept_no, from_date, to_date) VALUES (10010, 'd005', '2009-03-26', '9999-01-01');
INSERT INTO public.dept_emp (emp_no, dept_no, from_date, to_date) VALUES (10001, 'd002', '2001-07-15', '9999-01-01');


--
-- TOC entry 4813 (class 0 OID 36110)
-- Dependencies: 220
-- Data for Name: dept_manager; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dept_manager (dept_no, emp_no, from_date, to_date) VALUES ('d001', 10001, '2001-07-15', '2005-02-28');
INSERT INTO public.dept_manager (dept_no, emp_no, from_date, to_date) VALUES ('d002', 10002, '2005-02-28', '2007-09-15');
INSERT INTO public.dept_manager (dept_no, emp_no, from_date, to_date) VALUES ('d003', 10003, '2003-11-10', '9999-01-01');
INSERT INTO public.dept_manager (dept_no, emp_no, from_date, to_date) VALUES ('d004', 10004, '2007-09-15', '2010-12-31');
INSERT INTO public.dept_manager (dept_no, emp_no, from_date, to_date) VALUES ('d005', 10005, '2002-04-20', '9999-01-01');
INSERT INTO public.dept_manager (dept_no, emp_no, from_date, to_date) VALUES ('d001', 10006, '2004-03-18', '9999-01-01');
INSERT INTO public.dept_manager (dept_no, emp_no, from_date, to_date) VALUES ('d002', 10007, '2006-08-22', '9999-01-01');
INSERT INTO public.dept_manager (dept_no, emp_no, from_date, to_date) VALUES ('d003', 10008, '2008-11-30', '9999-01-01');
INSERT INTO public.dept_manager (dept_no, emp_no, from_date, to_date) VALUES ('d004', 10009, '2010-05-14', '9999-01-01');
INSERT INTO public.dept_manager (dept_no, emp_no, from_date, to_date) VALUES ('d005', 10010, '2009-03-26', '9999-01-01');


--
-- TOC entry 4808 (class 0 OID 36069)
-- Dependencies: 215
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.employees (emp_no, birth_date, first_name, last_name, gender, hire_date) VALUES (10001, '1980-01-15', 'John', 'Smith', 'M', '2001-07-15');
INSERT INTO public.employees (emp_no, birth_date, first_name, last_name, gender, hire_date) VALUES (10002, '1982-03-25', 'Emily', 'Johnson', 'F', '2005-02-28');
INSERT INTO public.employees (emp_no, birth_date, first_name, last_name, gender, hire_date) VALUES (10003, '1975-12-10', 'Michael', 'Williams', 'M', '2003-11-10');
INSERT INTO public.employees (emp_no, birth_date, first_name, last_name, gender, hire_date) VALUES (10004, '1988-05-20', 'Jessica', 'Brown', 'F', '2007-09-15');
INSERT INTO public.employees (emp_no, birth_date, first_name, last_name, gender, hire_date) VALUES (10005, '1984-08-30', 'David', 'Jones', 'M', '2002-04-20');
INSERT INTO public.employees (emp_no, birth_date, first_name, last_name, gender, hire_date) VALUES (10006, '1981-06-12', 'Sarah', 'Anderson', 'F', '2004-03-18');
INSERT INTO public.employees (emp_no, birth_date, first_name, last_name, gender, hire_date) VALUES (10007, '1979-10-05', 'Christopher', 'Davis', 'M', '2006-08-22');
INSERT INTO public.employees (emp_no, birth_date, first_name, last_name, gender, hire_date) VALUES (10008, '1983-09-17', 'Anna', 'Miller', 'F', '2008-11-30');
INSERT INTO public.employees (emp_no, birth_date, first_name, last_name, gender, hire_date) VALUES (10009, '1986-02-28', 'Ryan', 'Moore', 'M', '2010-05-14');
INSERT INTO public.employees (emp_no, birth_date, first_name, last_name, gender, hire_date) VALUES (10010, '1989-07-19', 'Amanda', 'Wilson', 'F', '2009-03-26');


--
-- TOC entry 4810 (class 0 OID 36082)
-- Dependencies: 217
-- Data for Name: salaries; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.salaries (emp_no, salary, from_date, to_date) VALUES (10001, 60000, '2001-07-15', '2003-01-01');
INSERT INTO public.salaries (emp_no, salary, from_date, to_date) VALUES (10001, 65000, '2003-01-01', '2005-02-28');
INSERT INTO public.salaries (emp_no, salary, from_date, to_date) VALUES (10001, 70000, '2005-02-28', '9999-01-01');
INSERT INTO public.salaries (emp_no, salary, from_date, to_date) VALUES (10002, 55000, '2005-02-28', '2007-01-01');
INSERT INTO public.salaries (emp_no, salary, from_date, to_date) VALUES (10002, 60000, '2007-01-01', '9999-01-01');
INSERT INTO public.salaries (emp_no, salary, from_date, to_date) VALUES (10003, 62000, '2003-11-10', '2006-01-01');
INSERT INTO public.salaries (emp_no, salary, from_date, to_date) VALUES (10003, 65000, '2006-01-01', '2010-12-31');
INSERT INTO public.salaries (emp_no, salary, from_date, to_date) VALUES (10004, 70000, '2007-09-15', '9999-01-01');
INSERT INTO public.salaries (emp_no, salary, from_date, to_date) VALUES (10005, 58000, '2002-04-20', '2004-01-01');
INSERT INTO public.salaries (emp_no, salary, from_date, to_date) VALUES (10005, 62000, '2004-01-01', '9999-01-01');
INSERT INTO public.salaries (emp_no, salary, from_date, to_date) VALUES (10006, 63000, '2004-03-18', '9999-01-01');
INSERT INTO public.salaries (emp_no, salary, from_date, to_date) VALUES (10007, 60000, '2006-08-22', '9999-01-01');
INSERT INTO public.salaries (emp_no, salary, from_date, to_date) VALUES (10008, 64000, '2008-11-30', '9999-01-01');
INSERT INTO public.salaries (emp_no, salary, from_date, to_date) VALUES (10009, 67000, '2010-05-14', '9999-01-01');
INSERT INTO public.salaries (emp_no, salary, from_date, to_date) VALUES (10010, 59000, '2009-03-26', '9999-01-01');


--
-- TOC entry 4809 (class 0 OID 36074)
-- Dependencies: 216
-- Data for Name: titles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.titles (emp_no, title, from_date, to_date) VALUES (10001, 'Manager', '2001-07-15', '2005-02-28');
INSERT INTO public.titles (emp_no, title, from_date, to_date) VALUES (10001, 'Senior Manager', '2005-02-28', '9999-01-01');
INSERT INTO public.titles (emp_no, title, from_date, to_date) VALUES (10002, 'Analyst', '2005-02-28', '2007-01-01');
INSERT INTO public.titles (emp_no, title, from_date, to_date) VALUES (10002, 'Senior Analyst', '2007-01-01', '9999-01-01');
INSERT INTO public.titles (emp_no, title, from_date, to_date) VALUES (10003, 'Coordinator', '2003-11-10', '2006-01-01');
INSERT INTO public.titles (emp_no, title, from_date, to_date) VALUES (10003, 'Manager', '2006-01-01', '2010-12-31');
INSERT INTO public.titles (emp_no, title, from_date, to_date) VALUES (10004, 'Engineer', '2007-09-15', '9999-01-01');
INSERT INTO public.titles (emp_no, title, from_date, to_date) VALUES (10005, 'Sales Associate', '2002-04-20', '9999-01-01');
INSERT INTO public.titles (emp_no, title, from_date, to_date) VALUES (10006, 'Analyst', '2004-03-18', '9999-01-01');
INSERT INTO public.titles (emp_no, title, from_date, to_date) VALUES (10007, 'Manager', '2006-08-22', '9999-01-01');
INSERT INTO public.titles (emp_no, title, from_date, to_date) VALUES (10008, 'Coordinator', '2008-11-30', '9999-01-01');
INSERT INTO public.titles (emp_no, title, from_date, to_date) VALUES (10009, 'Engineer', '2010-05-14', '9999-01-01');
INSERT INTO public.titles (emp_no, title, from_date, to_date) VALUES (10010, 'Sales Associate', '2009-03-26', '9999-01-01');


--
-- TOC entry 4656 (class 2606 OID 36094)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (dept_no);


--
-- TOC entry 4658 (class 2606 OID 36099)
-- Name: dept_emp dept_emp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT dept_emp_pkey PRIMARY KEY (emp_no);


--
-- TOC entry 4654 (class 2606 OID 36073)
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (emp_no);


--
-- TOC entry 4661 (class 2606 OID 36105)
-- Name: dept_emp dept_emp_dept_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT dept_emp_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES public.departments(dept_no);


--
-- TOC entry 4662 (class 2606 OID 36100)
-- Name: dept_emp dept_emp_emp_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT dept_emp_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);


--
-- TOC entry 4663 (class 2606 OID 36120)
-- Name: dept_manager dept_manager_dept_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT dept_manager_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES public.departments(dept_no);


--
-- TOC entry 4664 (class 2606 OID 36115)
-- Name: dept_manager dept_manager_emp_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT dept_manager_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);


--
-- TOC entry 4660 (class 2606 OID 36085)
-- Name: salaries salaries_emp_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salaries
    ADD CONSTRAINT salaries_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);


--
-- TOC entry 4659 (class 2606 OID 36077)
-- Name: titles titles_emp_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titles
    ADD CONSTRAINT titles_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);