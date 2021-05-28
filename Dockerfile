FROM public.ecr.aws/lambda/python:3.8

# install the common modules and dependencies (formely lambda layers code)
COPY src/common ${LAMBDA_TASK_ROOT}/src/common
# @todo find a better solution that 2 requirements.txt installs
RUN pip install -r ${LAMBDA_TASK_ROOT}/src/common/requirements.txt -t .

# declare build time arg so the function name can be passed in
ARG FUNCTION_NAME

# copy the targeted function code into the task root directory
COPY src/${FUNCTION_NAME}/ ${LAMBDA_TASK_ROOT}/

# install any function dependencies
RUN pip install -r ${LAMBDA_TASK_ROOT}/requirements.txt -t .

CMD ["app.lambda_handler"]
