-- scott 계정
-- distinct
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










