-- 직업이 ad_pres 인 사람은 A 등급을, st_man 인 사람은 b 등급은 it_prog인 사람은 c등급을,
-- sa_rep인 사람은 d등급을, st_clerk 인 사람은 e 등급을 기타는 0을 부여하여 조회한다.
-- 조회할 컬럼, first_name, last_name, job_grade

select * from employees;
select first_name, last_name, decode
(job_id, 'AD_PRES', 'A', 'ST_MAN', 'B', 'IT_PROG', 'C', 'SA_REP', 'D', 'ST_CLERK', 'E', '0') job_grade
from employees;


-- 회사 전체의 최대 연봉, 최소 연봉, 연봉 총 합 및 평균 연봉을 자연수로 포맷(반올림)하여 조회

SELECT
MAX(SALARY), MIN(SALARY), SUM(SALARY), ROUND(AVG(SALARY)) from employees;


-- 매니저로 근무하는 사원들의 총 수를 조회한다.

select count (distinct manager_id) from employees;


-- 사내의 최대 연봉 및 최소 연봉의 차이를 조회한다.

select max(salary) - min(salary) from employees;

-- 핸드폰 번호가 515로 시작하는 사원들의 사번, full_name, 핸드폰 번호를 이름 순(알파벳)으로 조회한다.

select employee_id, first_name, last_name, phone_number
from employees where phone_number like '515%' order by first_name asc;














