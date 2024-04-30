# # 베이스 이미지 
# FROM node:latest

# # 클라우드환경에서의 디렉토리를 의미 
# WORKDIR /front-vue

# # 현재디렉토리에 있는 모든 파일을 WORKDIR 이동  
# COPY package.json . 
# COPY . . 

# # 필요한 의존관계 라이브러리를 설치 명령어 
# RUN npm install 
# RUN npm i axios 
# RUN npm i lodash 
# RUN npm install vuex@next --save


# # 포트번호 노출 
# EXPOSE 8080

# # 스크립트 실행 명령어 
# CMD ["npm", "run", "serve"]



# build
FROM node:latest AS build
WORKDIR /frontapp
COPY . . 
RUN npm install
RUN npm run build


# production
FROM node:latest-alpine AS production
WORKDIR /frontapp
COPY --from=build /frontapp /frontapp
CMD ["npm", "run", "serve"]




