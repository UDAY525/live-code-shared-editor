FROM node:20-alpine AS frontend-code-share

COPY ./frontend /app
WORKDIR /app
RUN npm install
RUN npm run build

FROM node:20-alpine

COPY ./backend /app
WORKDIR /app
RUN npm install


COPY --from=frontend-code-share /app/dist/ /app/public



EXPOSE 3000
CMD ["node","server.js"]