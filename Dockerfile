FROM python:3.6-stretch

ENV PYTHONPATH /webapp
EXPOSE 8080

ADD requirements.txt /
RUN pip install --upgrade --no-cache-dir -r /requirements.txt && \
    rm requirements.txt && \
    pip install gunicorn gevent

ADD webapp /webapp
VOLUME /log

CMD ["gunicorn", "--access-logfile", "/log/access.log", "-b", "0.0.0.0:8080", "-k", "gevent", "webapp.app:app"]