import pandas as pd
#import plotly as py
#import plotly.express as px

import os
#print(os.environ['HOME'])
#print(os.environ['ENV_NAME'])
#print(os.environ['PYTHON_VER'])
print(os.environ['CSV_PATH'])

print("Hello World!")

# Change the current working directory  
#os.chdir("/home/csv")

with open("/home/csv/test.txt") as f: # The with keyword automatically closes the file when you are done
    print(f.read())
    