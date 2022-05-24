####### R을 이용한 데이터 랭글링 - 이현열(메타코드M) #######   

###### 데이터 타입별 다루기 ######

##### 2. Character Strings #####

# 문자열은 R의 기본함수 및 stringr 패키지를 이용해 쉽게 다룰 수 있다.

#### 2.1 문자열 기본 ####

a = 'learning to create'
b = 'character strings'

# paste() 함수를 이용해 두 문자를 붙일 수 있다.
paste(a,b) 

pi # 숫자
typeof(pi) # 타입을 알 수 있다. 

# paste() 함수를 이용하여 문자열과 숫자를 붙일 수 있다.
paste('pi is:',pi) # 결과는 문자열로 나온다.

# sep 인자를 추가하여 각 단어를 구분하는 문자를 입력할 수 있다.
paste('I','LOVE','R',sep = '-')

# paste0() 함수는 구분 문자가 없이 결합된다.
paste0('I','LOVE','R')

paste('I','LOVE','R',sep = '') 


#### 2.2 문자열 출력 ####

# 문자를 출력하는데 다음과 같은 함수가 있다.

# print(): 기본적인 출력 함수
# noquote(): 쿼트("") 생략
# cat(): 문자열 결합 및 쿼트 생략

x = 'learning to print strings'
print(x)

print(x, quote = 'FALSE') # quote 인자를 FALSE로 지정하여 쿼트를 생략

noquote(x) # 쿼트가 출력되지 않는다.

# cat() 함수를 이용할 경우도 출력이 가능,
# 여러 문자를 결합한 뒤 출력하는 것 또한 가능하다.
cat(x) 

cat(x, 'in R')


#### 2.3 문자열 갯수 확인 ####

x = 'How many elements are in this string?'
x

# length() 함수의 경우 문장의 갯수를 세므로, 1이 출력된다.
length(x)

# nchar() 함수의 경우 문장 내 문자의 갯수를 셀수 있다.
nchar(x)

#### 2.4 stringr 패키지를 이용한 문자열 다루기 ####

# R의 기본함수를 이용하여도 문자열을 다룰 수 있지만,
# Stringr 패키지를 이용할 경우 더욱 작업을 수행할 수 있다.


### 2.4.1 기본 사용법 ### 

#install.packages('stringr')
library(stringr)

# str_c() 함수는 paste0()와 기능이 동일하다.
str_c('Learning', 'to', 'use', 'the', 'stringr', 'package')

# sep 인자를 통해 구분자를 추가, paste()와 동일하다.
str_c('Learning', 'to', 'use', 'the', 'stringr', 'package', sep = ' ')

# str_length() 함수는 문자의 갯수를 센다. 
text = c('Learning', 'to', NA, 'use', 'the', NA, 'stringr', 'package')
str_length(text)

# str_sub() 함수는 start부터 end까지의 문자를 출력한다.
x = 'Learning to use the stringr package'
x
str_sub(x, start = 1, end = 15)

# start 혹은 end에 음수를 입력하면, 문장의 맨 끝에서부터 start/end 지점이 계산된다.
str_sub(x, start = -7, end = -1)
str_sub(x, start = -2, end = -1)

# str_dup() 함수를 이용해 특정 문자를 반복되게 출력할 수 있다.
str_dup('beer', times = 3)


### 2.4.2 공백(Whitespace) 제거 ###

# 텍스트 데이터를 다룰때는 빈 공백이 따라오는 경우가 많으며,
# 데이터분석의 편의를 위해 이를 제거해야 한다.

text = c('Text ', ' with', ' whitespace ', ' on', 'both ', 'sides ')
print(text) # 각 단어의 좌/우 혹은 양쪽에 공백이 존재한다.
 
# str_trim() 함수를 통해 좌/우 혹은 양쪽의 공백을 제거할 수 있다.

str_trim(text, side = 'left') # 왼쪽 공백 제거
str_trim(text, side = 'right') # 오른쪽 공백 제거거
str_trim(text, side = 'both') # 양쪽 공백 제거

### 2.4.3 문자열 자리수 채우기 ###

# 원하는 자리수를 채우기 위해 문자열에 공백 혹은 특정 문자를 입력할 수 있다.

# 10자리를 맞추기 위해 좌측에 공백이 추가되었다.
str_pad('beer', width = 10, side = 'left')

# pad 인자를 추가할 경우, 공백이 아닌 해당 문자가 추가된다.
str_pad('beer', width = 10, side = 'right', pad = '!')
str_pad('beer', width = 10, side = 'left', pad = '!')
str_pad('beer', width = 10, side = 'both', pad = '!')
