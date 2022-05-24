####### R을 이용한 데이터 랭글링 - 이현열(메타코드M) #######   

###### 데이터 타입별 다루기 ######

##### 1. Nubers ##### 
# R에서 숫자 형태는 크게 integer와 double로 나눌 수 있다. 
# 이 중 integer는 정수를 double은 부동소수점 실수를 의미.


#### 1.1 integer와 double의 vector 만들기 ####

# 먼저 double 형태의 vector를 만든다.
dbl_var = c(1, 2.5, 4.5)
dbl_var

# 숫자 뒤에 L을 붙이면 integer(정수) 형태로 입력된다.
int_var = c(1L, 6L, 10L)
int_var

int_var_1 = c(1,6,10)
int_var_1


### 1.1.1 둘 간의 형태 바꾸기 ###

# as.*() 함수를 이용해 각 데이터의 형태(Type)을 바꿀 수 있다.
as.double(int_var) # as.numeric(int_var)

# as.double() 함수를 통해 integer 형태를 double 형태로 바꿀 수 있다.
# as.numeric() 함수는 as.double()과 동일한 역할을 한다.
as.integer(dbl_var) 

# as.integer() 함수를 통해 double 형태를 integer 형태로 바쑬 수 있다.
# 소수점이 사라지고 정수형태로 바뀜.
as.character(dbl_var) # 글자형태로 바뀜


#### 1.2 비임의(Non - random) 숫자 생성하기 ####

# 콜론(:)과 c() 함수를 통해 순서가 있는 숫자 벡터를 생성 할 수 있다.
1:10 # 콜론을 통해 1에서 10까지 숫자가 생성

c(1,5,10) # c() 함수 내부에 입력한 숫자로 벡터가 생성

### 1.2.1 seq() 함수 이용 ###

# seq() 함수를 이용할 경우 더욱 다양하게 숫자 벡터를 생성할 수 있다.

# from에는 시작 숫자, to에는 종료 숫자, by에는 간격을 입력
seq(from = 1, to = 21, by = 2) # 1에서 21까지 2단위로 숫자가 생성

# 인자에 length.out을 쓸 경우 from에서 to까지 동일한 증가폭으로 15개의 숫자를 생성
seq(0, 21, length.out = 15)

# rep()함수 역시 seq() 함수와 비슷한 역할을 한다.
rep(1:4, times =2)

# each 인자를 추가할 경우, 각 숫자를 n번 반복하여 벡터가 생성
rep(1:4, each = 2) 

#### 1.3 임의(Random) 숫자 생성하기 ####

### 1.3.1 Uniform Numbers ###

# 균등 분포(Uniform Numbers - 연속확률 분포) 에서 임의의 숫자를 생성하기 위해서는 runif() 함수를 사용한다.

# 기본적으로 runif() 함수는 0과 1사이에서 임의의 숫자를 생성하며, 괄호 안에 입력된 숫자만큼의 갯수의 난수를 생성
runif(5)

runif(100)

hist(runif(100000000)) # hist를 사용하여 균등하게 뽑히는지 확인

# min과 max인자를 추가하여 해당 값 사이에서의 난수를 생성
runif(5, min = 0, max = 25)

# sample() 함수를 사용하여 Uniform Number를 생성할 수 있다.
# 0에서 25까지 숫자중에서 10개의 숫자를 선택하며, 
# replace = TRUE로 할 경우 복원추출, FALSE로 할 경우 비복원추출을 시행한다.
sample(0:25, 10, replace = TRUE)

sample(0:25, 10, replace = F)

### 1.3.2 Non - Uniform Numbers ###

# 비균등 확률 분포에서 난수를 생성하기 위해서는 크게 4가지 함수가 있다.

# 난수 생성: r*
# 밀도(Density)혹은 확률 질량 함수(Probability mass function): d*
# 누적 분포(Cumulative distribution): p*
# 분위수(Quantile): q*

## 1.3.2.1 정규 분포(Normal Distribution) ##

# R에서 정규 분포 관련 함수는 *norm() 이다.

# rnorm() 함수를 이용하여 평균이0, 표준편차가 1인 정규분포 함수에서 난수 10개를 생성한다.
rnorm(10, mean = 0, sd = 1)

# d = 0인 지점의 밀도를 계산한다.
dnorm(0, mean = 0, sd = 1)

# d = 0인 지점의 누적 분포를 구한다.
pnorm(0, mean = 0, sd = 1)

# 누적 분포가 0.5인 지점의 분위수를 구한다.
qnorm(0.5, mean = 0, sd = 1)

## 1.3.2.2 기타 분포

# 정규 분포 외에도 여러 분포에서 난수를 생성할 수 있다.
# 각 함수별 인자는 help()를 통해 확인할 수 있다.

# 이항 분포: rbinom, dbinom, pbinom, qbinom
# 포아송 분포: rpois, dpois, ppois, qpois
# 지수 분포: rexp, dexp, pexp, qexp
# 감마 분포: rgamma, dgamma, pgamma, qgamma

#### 1.4 반올림 ####

# 숫자의 올림, 내림, 반올림 등을 실행한다.

x = c(1, 1.35, 1.7, 2.05, 2.4, 2.75, 3.1, 3.45, 3.8, 4.15,
      4.5, 4.85, 5.2, 5.55, 5.9)
x

round(x) # 가장 가까운 정수로 반올림을 한다.

round(x, digits = 2) # 해당 자리수 만큼 반올림을 한다.

ceiling(x) # 올림을 한다.

floor(x) # 내림을 한다.
