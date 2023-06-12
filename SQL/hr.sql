--dummy table
--실행시 cntl + enter

select 1, 'aaA' from dual;
select * from tabs;
select last_name, salary from employees;

select * from employees;
select first_name || ' ' || last_name as "full name"
from employees;


-- hr 연습문제

-- 1. 연봉이 12000 이상되는 직원들의 LAST_NAME 및 연봉을 조회한다.

select last_name, salary from employees
where salary >= 12000;

-- 2. 사원번호가 176 인 사람의 LAST_NAME 과 부서 번호를 조회한다.

select employee_id, last_name from employees where employee_id = 176;

-- 3. 연봉이 5000 에서 12000의 범위 이내인 사람들의 LAST_NAME 및 연봉을 조회힌다.

select last_name, salary from employees where salary >= 5000 and salary <= 12000;

-- 4. 2002/02/20 일부터 2005/05/01 사이에 고용된 사원들의 LAST_NAME 사번, 고용일자를 조회한다.
-- (고용일자 순으로 정렬한다.)

select * from employees;
select employee_id, last_name, hire_date from employees
where hire_date >= '2002/02/20' and hire_date <= '2005/05/01';

-- 5. 20 번 및 50 번 부서에서 근무하는 모든 사원들의 LAST_NAME 및 부서 번호를 알파벳순으로 조회한다.

select * from employees;
select last_name, department_id from employees
where department_id in (20, 50)
order by last_name asc;

-- 6. 20 번 및 50 번 부서에 근무하며, 연봉이 5000 ~ 12,000 사이인 사원들의 LAST_NAME 및 연봉을 조회한다.

select last_name, salary from employees
where department_id in (20,50)
and salary >= 5000 and salary <= 12000;

-- 7. 2002년도에 고용된 모든 사람들의 LAST_NAME 및 고용일을 조회한다.

select last_name, hire_date from employees
where hire_date like '02%';

-- 8. 매니저가 없는 사람들 (Manager id가 null인 사람) 의 LAST_NAME 및 JOB_ID 를 조회한다.

select * from employees;
select last_name, job_id from employees
where manager_id is null;

select * from employees;
select last_name, job_id from employees
where manager_id is not null;

select * from employees;
select last_name, job_id from employees
where manager_id = null;        -- 안된다.

-- 9. 커미션을 버는 모든 사원들의 LAST_ANME, 연봉 및 커미션을 조회한다.
-- (연봉 역순, 커미션 역순차로 정렬한다.)

select last_name, salary, commission_pct from employees
where commission_pct is not null
order by salary desc, commission_pct desc;


-- 10. LAST_NAME 의 네번째 글자가 a 인 사원들의 LAST_NAME 을 조회한다.

select last_name from employees
where last_name like '___a%';


-- select 함수, 대문자 변환 함수

select upper('hello') from dual;
select upper(last_name) from employees;

-- 소문자 변환 함수

select lower('HELLO') from dual;
select lower(last_name) from employees;

-- 첫글자를 대문자로 만들어주고, 나머지는 소문자로 변환해주는 initcap(문자열)

select initcap('heLLo WoRld') from dual;

-- 문자열 추출 함수

select substr('worldcup' ,1, 5) from dual;

-- 특정문자 위치를 찾는 함수(문자열, 검색할 문자열, 검색 시작 위치), 공백 포함

select instr('HelloOracle', 'l', 3, 3) from dual;

-- 문자열 길이를 구하는 함수 length (문자열)

select length('hello'), upper ('hello') from dual;

-- 문자열 붙이기 함수

select concat(initcap('hello'), initcap(' world')) from dual;

-- 문자열 치환함수 (문자열, 찾을 문자, 치환할 문자)

select replace('where we are', 'we', 'are') from dual;

-- 특정 문자를 지우는 함수 (삭제 옵션, 삭제할 문자열, 문자열)

select trim(' - oracle - ') from dual;
select ltrim(' - oracle - ') from dual;
select rtrim(' - oracle - ') from dual;

-- 데이터의 빈공간을 특정 문자 (문자열, 줄 공간, 채울 문자) 로 채우는 함수

select lpad('oracle', 10, '#') from dual;
select rpad('oracle', 10, '#') from dual;

-- SELECT 숫자 함수

-- 절댓값을 구하는 함수 (숫자)

select abs(365), abs(-365) from dual;

-- 반올림 함수 (숫자, 반올림 자릿수)

select round(3.14), round(3.65) from dual;
select round(3.14, 2), round(3.65, 2) from dual;

-- 버림 함수 (숫자, 버릴 자릿수)

select trunc(3.14, 1), trunc(3.65, 1) from dual;

-- 나머지를 구하는 함수, 나머지를 출력

select mod(100, 3) from dual;

-- 지정한 숫자와 가까운 정수 (ceil 올림, floor 버림) 를 찾는 함수

select ceil(3.15), floor(3.14) from dual;

-- 제곱 (power), 제곱근(sqrt) 함수

select power (5, 2), sqrt(25) from dual;

-- 날짜 함수, -- 현재 시간을 얻는 함수

select sysdate, systimestamp from dual;

-- 몇 개월 이후 날짜를 구하는 함수

select sysdate, add_months(sysdate, 3) from dual;

-- 두 날짜의 개월 수 차이를 구하는 함수

select sysdate, floor(months_between('2023-11-11', sysdate)) from dual;

-- 돌아오는 요일을 구하는 함수, (날짜 요일 문자)

select next_day(sysdate, '월요일') from dual;

-- 달의 마지막 날짜를 구하는 함수, last_day (날짜)

select last_day(sysdate) from dual;

-- 변환 함수

-- 형 변환함수
-- 숫자를 문자열로 바꿔주는 함수 to_char (숫자, 포맷형식)

select to_char(1005000, 'L999,999,999.00') from dual;

-- 날짜를 문자열로 변환하는 함수 to_char (날짜)

select to_char (sysdate, 'yyyy/mm/dd HH24:MI:SS') from dual;

-- 문자 데이터를 숫자 데이터로 변환하는 함수 to number

select to_number('1234') from dual;

-- 문자 데이터를 날짜 데이터로 변환하는 함수 to date

select to_date ('2020-10-31') from dual;

-- NULL 관련 함수

-- 밚환 값이 null 인 경우에 대해 값을 제공하는 함수 NVL

select * from employees;
select nvl(null, '대체값'), nvl('aaa', '대체값') from dual;
select nvl(commission_pct, 0) from employees;

-- 반환 값에 따라 데이터를 정하는 함수 NVL2

select nvl2('ABC', 'O', 'X'), nvl2(null, 'O', 'X') from dual;

-- 조건에 따라 데이터를 정하는 함수 DECODE (기준값, 비교값1, 출력값1, 비교값이 아닌 값)

select decode('ABC', 'ABC', '0', 'X'), decode('ABC', 'DEF', '0', 'X') from dual;

-- SCOTT에 있음


-- select 문 작성 순서, select, from, where, group by, having, order by (반드시 순서대로 작성)

-- select 문 실행 순서, from, where, group by, having, select, order by (실행되는 순서)



-- 다중 행 함수, 집계 함수, count, sum, max, min, avg ...

-- sum 함수

select * from employees;

select count(*) from employees;

select sum(salary) from employees;

select concat(to_char ( floor(avg(salary)), 'L999,999,999'), '원' )from employees;

-- DML - SELECT 순위 함수
-- rownum

select rank() over(order by salary desc;


-- 조회 사원 번호, 연봉, 전체 평균 연봉, 전체 연봉의 합

select employee_id, salary, avg(salary), sum(salary) from employees;
select employee_id, salary from employees;
select employee_id, salary, (select avg(salary) from employees), (select sum(salary) from employees) from employees;

select employee_id, salary
    , round(avg(salary) over()), sum(salary) over()
from employees;


select distinct depno from emp;
select deptno from emp;
select distinct job, deptno from emp;

select * from emp;
select ename "동환" from emp;

-- order by (정렬)
select empno, ename, sal
from emp order by 3 desc;

-- where 절
select * from emp where deptno = 30;
select * from emp;
select * from emp where deptno = 30 or deptno = 10;

select * from emp
where job = 'MANAGER' or job = 'SALESMAN' or job = 'CLERK';

select * from emp
where sal between 200 and 3000;

select * from emp
where ename like '%AM%';

select * from emp
where ename like '%AM__';

select * from emp
where ename like '김__';

select * from emp where comm = null;
select * from emp where comm is null;

select * from emp where mgr is not null;
select * from emp where mgr is null;

-- 집합 연산자
select empno, ename, sal, deptno from emp where deptno = 10
union
select empno, ename, sal, deptno from emp where deptno = 20;

select empno, ename, sal, deptno from emp where deptno = 10
union all
select empno, ename, sal, deptno from emp where deptno = 20;

-- 연습

select
    empno, ename, hiredate
    , add_months(hiredate, 120) as work10year
from emp;

alter session set nls_date_format = 'yyyy-mm-dd';

-- DECODE 문장

select empno, ename, job, 
sal, decode(job, 'manager', 
sal * 1.1, 'salesman',
sal * 1.05, 'analyst', 
sal, sal * 1.03) as upsa 
from emp;

-- select 그룹화

select deptno, sum(sal) from emp
group by deptno
select * from emp;

--

select depno, job, avg(sal) from emp
group by deptno, job
having avg(sal) >= 2000
order by deptno, job;




-- roll up 함수

select nvl(to_char (deptno), '총계') deptno, nvl(job, '소계'), sum(sal)
from emp
group by rollup(deptno, job);

--listagg

select deptno, listagg(ename, ', ') within group(order by sal desc) as ename from emp group by deptno;


-- 그룹화 문제

-- 1. 각 job_id 별, 최대 연봉, 최소 연봉, 연봉 총 합 및 평균 연봉을 자연수로 포맷하여 조회한다.
-- job_id 오름차순으로 정렬

select job_id, max(salary) max, min(salary) min, sum(salary), round(avg(salary)) from employees group by job_id;



-- 2. 동일한 직업을 가진 사원들의 총 수를 조회한다.

select job_id, count(employee_id) from employees;

-- 3. 부서번호가 있는 사원들 중 부서별 연봉의 총 합계를 조회한다.
-- 부서별 연봉의 합계는 10000 이상이며 부서번호의 오름차순으로 정렬

select department_id, sum(salary) from employees
where department_id is not null
group by department_id
having sum(salary) >= 10000
order by department_id;


-- DML - SELECT 조인

-- 내부조인 표기방식 : 등가, 비등가, 자체, 등가조인은 =, 비등가 조인은 <=

-- 외부조인 : 왼쪽, 오른쪽, 전체

-- 하나 이상의 컬럼이 공유된 두 개 이상의 테이블을 서로 연계하여 데이터를 검색할 때
-- 사용하는 방법으로 두 개의 테이블을 마치 하나의 테이블인 것처럼 보여주는 것.

-- 인너 조인, 라이트, 레프트, 풀 아우터 조인...

-- 등가 조인 = 내부조인

-- select (조회할 칼럼1,2...) from (테이블A), (테이블B)
-- where (A, 일치 칼럼) = (B, 일치 칼럼)
-- select (조회할 칼럼1,2...) from (테이블A) (inner) join (테이블B)
-- on (A, 일치 칼럼) = (B, 일치 칼럼)
-- select (조회할 칼럼, 1,2) from (테이블A) (inner) join (테이블B)
-- using (일치 칼럼), 테이블 A와 테이블 B의 공통 칼럼

-- 비등가 조인

select * from salarygrade;

create table salarygrade (
    grade   varchar2(10),
    losalary    number,
    hisalary    number
);

-- 비등가조인

select e1.employee_id, first_name, e1.salary, sg.grade
from employees e1, salarygrade sg
where salary between losalary and hisalary;
select * from salarygrade;

select * from employees;

-- 자체 조인 ( 셀프 조인)
-- 같은 테이블을 두 번 사용

select e1.employee_id, e1.last_name, e1.manager_id
    , e2.employee_id as mgr, e2.last_name as mgr_nname
from employees e1, employees e2
where e1.manager_id = e2.employee_id;

--복습 문제

--사원번호(employee_id), 이름, 부서번호, 급여, 직급(job_id)을 급여별로 내림차순 조회
        

select * from employees;
select employee_id, first_name, department_id, salary, job_id
from employees
order by salary desc;


--급여가 10000 이상인 사람의 이름, 급여, 부서번호 조회

select * from employees;
select first_name, salary, department_id
from employees
where salary >= 10000;

--부서에 소속되지 않은 사람의 이름, 입사일, 급여, 부서번호를 조히

select * from employees;
select first_name, hire_date, salary, department_id
from employees
where department_id is null;


--employees 테이블에서 부서 인원이 4명 보다 많은 부서의 부서번호, 인원수, 급여의 합을 구하여 출력

select * from employees;
select department_id, count(*), sum(salary)
from employees
group by department_id
having count(*) > 4;

--employees 테이블에서 급여가 최대 10000 이상인 부서에 대해서 부서번호, 평균 급여, 급여의 합을 구하여 출력

select * from employees;
select department_id, avg(salary), sum(salary), max(salary)
from employees
group by department_id
having max(salary) > 10000;


-- 서브 쿼리

select * from employees;
select hire_date from employees where last_name like 'Lee';

select last_name, hire_date 
from employees
where hire_date <   -- '08/02/23'
                    (select hire_date
                    from employees
                    where last_name
                    like 'Lee');
                    

--join 문제

-- 문제1. 사원들의 이름, 부서명, 근무하는 도시이름을 출력하라

select * from employees;
select * from departments;
select * from locations;

select
e.last_name, d.department_name, l.city
from employees e left join departments d
on e.department_id = d.department_id
left join locations l
on d.location_id = l.location_id
order dy e.last_name;

-- 문제2. 30번 부서의 사원들의 이름, 직업, 부서명을 출력하라

select * from employees;
select 
e.first_name, e.job_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id
and e.department_id = 30;


-- 문제3. 커미션이 있는 사원의 이름, 직업, 부서번호, 부서명을 출력하라

select * from employees;

select
    e.last_name, e.job_id, d.department_id, d.department_name
from
    employees e join departments d
    on e.department_id = d.department_id
    and e.commission_pct is not null;

-- 문제4. 지역번호 2500 에서 근무하는 사원의 이름, 직업, 부서번호, 부서명을 출력하라

select * from employees;
select e.last_name, e.job_id, d.department_id, d.department_name
from employees e join departments d
on e.department_id = d.department_id
and d.location_id = 2500;

-- 문제5. 이름에 A가 들어가는 사원들의 이름과 부서이름을 

select
    e.last_name, d.department_name
from employees e join departments d
    on e.department_id = d.department_id
    and e.last_name like '%A%';

-- 문제6. 사원 이름과 그 사원의 관리자 이름을 출력하라

select
    e.last_name, e2.last_name
from employees e, employees e2
where e.manager_id = e2.employee_id;

-- 문제7. 사원 이름과 부서명과 월급을 출력하는데 월급이 3000 이상인 사원을 출력하라

select
     e.last_name, d.department_name, e.salary
from employees e, departments d
where e.department_id = d.department_id
and e.salary >= 3000;

-- 문제8. 급여가 3000에서 5000 사이인 사원의 이름과 소속부서명을 출력하라

select
     e.last_name, d.department_name, e.salary
from employees e, departments d
where e.department_id = d.department_id
    and e.salary between 3000 and 5000;


-- 문제9. accounting 부서 소속 사원의 이름과 입사일을 출력하라

select
     e.last_name, d.department_name, e.hire_date
from employees e join departments d
on e.department_id = d.department_id
and d.department_name = 'Accounting';

-- 문제10. 급여가 3000 이하인 사원의 이름과 급여, 근무지를 출력하라

select
     e.last_name, e.salary, d.location_id, l.city
from employees e left join departments d
    on e.department_id = d.department_id
    left join locations l
    on d.location_id = l.location_id
    and e.salary <= 3000;
    
    
    
select * from employees;

select * from tab;

select * from employees;

select * from departments;

insert into employees (
        employee_id,
        first_name,
        last_name,
        email,
        hire_date,
        job_id,
        department_id)
values (207, '길동', '홍', 'abc@naver.com', sysdate, 'AC_ACCOUNT', 20);



    
    