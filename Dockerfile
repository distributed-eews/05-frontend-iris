FROM node
ENV NEXT_PUBLIC_MAPBOX_TOKEN=pk.eyJ1IjoiemlkYW5raGFyaXNtYSIsImEiOiJjbG8zemN5cWswMnBpMmpudXEyYWZta2M3In0.SnGCAMJEYUBkaGMwZCQMpA
ENV NEXT_PUBLIC_BACKEND_URL="http://<ip-ws-rest>:<port-ws-rest>"
ENV NEXT_PUBLIC_WS_URL="ws://<ip-ws-rest>:<port-ws-rest>"
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build
RUN npm install -g next
EXPOSE 3000
CMD ["next", "start", "-p", "3000"]
