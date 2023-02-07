FROM python:3.8
MAINTAINER 13579246800 "meily.oeng@gmail.com" 
COPY app.py  /app/
WORKDIR /app
RUN pip install flask 
CMD ["python", "app.py"]
















