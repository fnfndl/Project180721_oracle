
## filter 예제
## 1. 1학년 학생들만 보기 (Numeric)
scores%>%dplyr::filter(grade==1)%>%
  slice(1:3)

## 2. 1학년 남학생만 보기 (and 조건 / Character'')
scores%>%dplyr::filter(grade==1 & gender=='M')%>%
  slice(1:3)
## 3. 1, 2학년 학생들만 보기 (or 조건)
scores%>%dplyr::filter(grade==1 | grade==2)%>%
  tail

## 4. 1학년이 아닌 학생들만 보기 (not 조건)
scores%>%dplyr::filter(!grade==1)%>%
  tail

## 5. 수학점수가 80이상인 학생들만 보기
scores%>%dplyr::filter(Math>=80)%>%
  tail

## 6. 수학점수가 80 이상이면서 영어점수가 70이상이 학생들만 보기
scores%>%dplyr::filter(Math>=80 & English>=70)%>%
  tail

## 7. 학번이 10101 부터 10120인 학생들중에서 여학생이면서 영어가 80점 이상인학생만 보기
scores%>%dplyr::filter(Stu_ID>=10101 & Stu_ID<10121 & gender=='F' & English>=80)%>%
  tail

## 8. 학번이 홀수인 학생들 중 남자이면서 수학과 과학이 모두 90점 이상인 학생들만 보기
scores%>%dplyr::filter(Stu_ID%%2==1 & gender=='M' & Math==90 & Science==90 )%>%
  tail

## 9. 학생들 중 한 과목이라도 100점이 있는 학생만 보기
scores%>%dplyr::filter(Math==100 | English==100 | Science==100 | Marketing==100 | Writing==100)%>%
  tail

## 10. 학생들 중 한 과목이라도 0점이 있는 학생만 보기
scores%>%dplyr::filter(Math==0 | English==0 | Science==0 | Marketing==0 | Writing==0)%>%
  tail


