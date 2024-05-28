#!/bin/bash

name=${1}
project_path=/home/antoine/Documents/Alfred/

if [[ "$name" == "matching-ms-ai" ]]; then
	project_path=/home/antoine/Documents/Alfred/microservices-ai/matching-ms-ai/
elif [[ "$name" == "mv-ms-ai" ]]; then
	project_path=/home/antoine/Documents/Alfred/microservices-ai/mv-ms-ai/
elif [[ "$name" == "invoice-review-ms-ai" ]]; then
	project_path=/home/antoine/Documents/Alfred/microservices-ai/invoice-review-ms-ai/
else
	echo "Opening Alfred path"
fi

kitty -e nvim $project_path
