# set base image (host OS) as builder
FROM python:3.8-alpine as builder

# set the working directory in the container

WORKDIR /code

# copy the dependencies file to the working directory
COPY requirements.txt .

# install dependencies
RUN pip install -r requirements.txt

# copy the content of the local src directory to the working directory
COPY . .

FROM nginx
EXPOSE 5000
COPY --from=builder /code /use/share/nginx/html

# command to run on container start
CMD [ "python", "src/app.py" ]