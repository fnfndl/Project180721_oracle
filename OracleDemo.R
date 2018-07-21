getwd()
install.packages("rJava")
install.packages("DBI")
install.packages("RJDBC")
install.packages("data.table")
install.packages("dplyr")

library(rJava)
library(DBI)
library(RJDBC)
library(data.table)
library(dplyr)

drv <- JDBC(
  "oracle.jdbc.driver.OracleDriver",
  "C:\\oraclexe\\app\\oracle\\product\\11.2.0\\server\\jdbc\\lib\\ojdbc6.jar"
)
conn <- dbConnect(drv,
                  "jdbc:oracle:thin:@localhost:1521:xe",
                  "hr",
                  "oracle")
tab <- dbGetQuery(conn, "SELECT * FROM TAB")
View(tab)

tname <- tab$TNAME
tname

# COUNTRIES -> cnt
# DEPARTMENTS -> dpt
# EMPLOYEES -> emp
# EMP_DETAILS_VIEW ->empd
# JOBS ->job
# JOB_HISTORY ->jobh
# LOCATIONS ->loc
# REGIONS -> reg

cnt <- data.frame(dbGetQuery(conn,
                             "SELECT*FROM COUNTRIES"))
View(cnt)

dpt <- data.frame(dbGetQuery(conn,
                             "SELECT*FROM DEPARTMENTS"))
View(dpt)

emp <- data.frame(dbGetQuery(conn,
                             "SELECT*FROM EMPLOYEES"))
View(emp)

empd <- data.frame(dbGetQuery(conn,
                             "SELECT*FROM EMP_DETAILS_VIEW"))
View(empd)

job <- data.frame(dbGetQuery(conn,
                              "SELECT*FROM JOBS"))
View(job)

jobh <- data.frame(dbGetQuery(conn,
                             "SELECT*FROM JOB_HISTORY"))
View(jobh)

loc <- data.frame(dbGetQuery(conn,
                              "SELECT*FROM LOCATIONS"))
View(loc)

reg <- data.frame(dbGetQuery(conn,
                             "SELECT*FROM REGIONS"))
View(reg)

## 예제 (한 가지 테이블에서의 작업)
emp %>%
  select(everything()) %>%
  slice(1:3)
#EMPLOYEE_ID  FIRST_NAME   LAST_NAME    EMAIL       PHONE_NUMBER           HIRE_DATE
# JOB_ID SALARY COMMISSION_PCT MANAGER_ID DEPARTMENT_ID SALARY/12 Month_SAL

# 1. 사원의 FIRST_NAME과 LAST_NAME을 붙여서 Name으로 된 칼럼을 추가하시오. 단, 이름 간격은 띄울 것 (e.g. James Dean)
emp <- emp%>%dplyr::mutate(Name=paste(FIRST_NAME,LAST_NAME)
emp%>%slice(1:10)

# 2. 직원 성(LAST_NAME)에서 "e"또는 "o"가 포함된 직원을 출력하시오. 
emp%>%dplyr::select(LAST_NAME)%>%
  select(contains('e'))%>%
     slice(1:10)

# 3. SALARY는 연봉(달러)를 의미함. 월 급여를 의미하는 MONTH_SAL이라는 칼럼을 추가하시오.
emp <- emp%>%dplyr::mutate(Month_SAL=SALARY/12)
emp%>%slice(1:10)

# 5. 급여가 20,000불 이상인 사원의 목록을 NAME, EMPLOYEE_ID, SALARY만 출력하시오.
emp%>%dplyr::select(EMPLOYEE_ID, SALARY)%>%
  filter(SALARY>=20000)

# 6.  급여가 7,000불 이하인 사원의 목록을 NAME, EMPLOYEE_ID, SALARY만 출력하시오
emp%>%dplyr::select(EMPLOYEE_ID, SALARY)%>%
  filter(SALARY<=7000)
  

# 7. 직원 중 연봉이 가장 높은 CEO의 이름을 구하시오
ceo_sal <- apply(emp%>%
                   select(SALARY),2,max)
ceo_sal