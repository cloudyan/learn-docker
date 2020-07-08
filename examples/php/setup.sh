#!/bin/sh

# 运行

docker run -it --rm -v "$PWD":/app -w /app php:alpine php your-script.php
