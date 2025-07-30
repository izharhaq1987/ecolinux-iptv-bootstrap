#!/bin/bash

# Activate the virtual environment and run the FastAPI app using Uvicorn

echo "Starting FastAPI development server..."

# Check if virtual environment exists
if [ ! -d "testenv" ]
then
{
    echo "Virtual environment 'testenv' not found."
    echo "Please run: python3 -m venv testenv && source testenv/bin/activate"
    exit 1
}
fi

# Activate the environment
source testenv/bin/activate

# Ensure uvicorn is available
if ! command -v uvicorn &> /dev/null
then
{
    echo " 'uvicorn' is not installed in the environment."
    echo "Run: pip install -r requirements.txt"
    exit 1
}
fi

# Launch the app with auto-reload
uvicorn app.main:app --reload

echo " FastAPI server stopped."
