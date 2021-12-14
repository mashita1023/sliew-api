FROM dart:stable

WORKDIR /app
COPY pubspec.* ./
RUN dart pub get

COPY . .
