## ifelse 예제 
## 4. 평균점수가 90 이상이면 A, 80 이상이면 B, 70 이상이면 C, 60 이상이면 D, 50 이상이면 E, 나머지는 F (ifelse(Average>=90,'A'))를 부여하는 Eval 함수 만들고 컬럼 추가하기
scores <- scores%>%
  dplyr::mutate(Eval=(ifelse(Average>=90,'A',ifelse(Average>=80,'B',ifelse(Average>=70,'c',ifelse(Average>=60,'D',ifelse(Average>=50,'E','F')))))))
head(scores)

