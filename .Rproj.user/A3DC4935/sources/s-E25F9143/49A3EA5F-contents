#정형 데이터 분석 파일의 종류
# Database (Oracle, MySQL, MariaDB)
# Exel (xls)
# CSV (Comma Separated Vector)
#외부 라이브러리(패키지)는 타 개발자가 만들어놓은 함수의 집합
#라이브러리 중 텍스트 분석에서는 dplyr 가 최고
getwd()
install.packages("dplyr")
library(dplyr)
scores <-data.frame(read.csv("class_scores.csv"))

head(scores)
tail(scores)
summary(scores)
View(scores)
dim(scores)
select(scores)
head(scores)
head(select(scores,"Math"))
# NA(Not Available) : 결측값 (값이 있기는 한데, 정확히 몇 인지는 모르는 상태)
# Null : 값이 없는 상태 (0과는 다른 개념)함



## Stu_ID scores class gender
## Math English Science Marketing Writing

## select 예제
## 1 국어, 영어, 수학 도메인기(=컬럼)만 가져오기
scores %>% 
  dplyr::select(Math,English,Science) %>% 
  head

## 2 상위 10개 보기
scores%>%dplyr::select(Math,English,Science) %>%
  slice(1:10)

## 3 성별 제외한 컬럼 보기
scores %>% dplyr::select(-gender) %>%
  slice(1:10)

## 4 수학부터 작문까지 컬럼 보기
scores %>% dplyr::select(Math:Writing) %>%
  slice(1:10)

## 5 모든 컬럼 조회 everything()
scores%>%dplyr::select(everything()) %>%
  slice(1:10)

## 6 E 로 시작하는 컬럼만 보기 starts_with('E')
scores%>%dplyr::select(starts_with('E')) %>%
  slice(1:10)

## 7 e 로 끝나는 컬럼만 보기 ends_with('e')
scores%>%dplyr::select(ends_with('E')) %>%
  slice(1:10)

## 8 e 가 들어가는 컬럼 다 가져오기 contains('e')
scores%>%dplyr::select(contains('E')) %>%
  slice(1:10)

## 9.  1, 3, 5번째 컬럼만 가져오기 





