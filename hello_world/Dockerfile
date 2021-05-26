FROM public.ecr.aws/lambda/python:3.8

RUN mkdir hello_world
COPY __init__.py ./
COPY . ./hello_world/

RUN python3.8 -m pip install -r hello_world/requirements.txt -t .

# Command can be overwritten by providing a different command in the template directly.
CMD ["hello_world.app.lambda_handler"]
