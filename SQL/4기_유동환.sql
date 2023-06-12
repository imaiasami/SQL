-- 1. DML 4가지를 기술하시오 --
select, insert, update, delete

-- 2. 오라클 데이터베이스에 저장하는 문자열, 숫자, 날짜에 해달하는 자료형을 기술하시오. --

varchar2, number, date

-- 3. 20번 및 50번 부서에 근무하며, 연봉이 5000~12,000 사이인 사원들의 last_name 및 연봉을 조회한다.
-- (employee테이블 참조 --

select last_name, salary from employees
where department_id in (20, 50) and salary >= 12000 and salary >= 5000;

-- 4.king 을 매니저로 두고있는 모든 사원들의 last_name 과 연봉을 조회한다. (employee 테이블) --

select last_name, salary from employees
where manager_id like '100';

---- 5. 2007년에 입사(HIRE_DATE)한 직원들의 사번(EMPLOYEE_ID),
--이름(FIRST_NAME), 성(LAST_NAME), 부서명(DEPARTMENT_NAME)을
--사번(EMPLOYEE_ID)의 오름차순으로 조회한다.
--이때, 부서에 배치되지 않은 직원의 경우, ‘<NOT ASSIGNED>’로 출력하시오. (10점)
--( 참조 테이블: EMPLOYEES, DEPARTMENT_ID ) --

select * from employees;
select employee_id, first_name, last_name, department_id from employees
where hire_date like '07%' order by employee_id asc;


--6. 각 JOB_ID 별, 최대 연봉, 최소 연봉, 연봉 총 합 및 평균 연봉을 자연수로 포맷하여 JOB_ID의
--오름차순으로 조회한다. (10점)
--( 참조 테이블 : EMPLOYEES )

select job_id, max(salary) max, min(salary) min, sum(salary), round(avg(salary)) from employees group by job_id
order by job_id asc;


--7. 매니저(상급자)가 같은 사원들 중 최소 연봉을 받는 사원의 연봉을 조회한다. (10점)
--- 매니저가 없는 사람들은 제외한다.
--- 최소 연봉이 6000 미만인 경우는 제외한다.
--- 연봉 기준 내림차순으로 조회한다.
--( 참조 테이블 : EMPLOYEES )

select min(salary) from employees where salary > 6000 and manager_id is not null 
group by manager_id order by min(salary) desc;



-- 8. 다음은 어느 커뮤니티 사이트의 게시판 관련 테이블이다. 주어진 조건의 테이블과 시퀀스를 생성하시오.
--(테이블을 생성하면서 제약조건을 부여할 것.)
--8. 테이블명: MEMBER (회원) (10점)

create table member (
    id varchar2(50) primary key,
    pw varchar2(100) not null,
    address varchar2(100) not null,
    address_detail varchar2(100),
    phone varchar2(30) not null,
    reg_date date default sysdate,
    enabled int default '1'
    );

select * from member;


-- 9. 테이블명 : board (게시글) 10점 --

create table board (
    board_id int primary key,
    writer varchar2(50) REFERENCES member(id),
    title varchar2(50) not null,
    content varchar2(1000) not null,
    reg_date date default sysdate,
    update_date date,
    delete_date date
    );
    
    
--10. 시퀀스 객체

create sequence board_no_seq;

--11. 테이블명 reply 댓글 10점 --

create table reply (
    reply_no int primary key,
    board_no int REFERENCES board(board_id),
    writer varchar2(50) not null,
    content varchar2(500) not null,
    reg_date date default sysdate
    );

-- 12. 시퀀스 

create sequence reply_no_seq;





