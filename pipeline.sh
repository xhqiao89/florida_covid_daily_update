#!/bin/bash

setup_env(){
	cd /home/frecovid/florida_covid_daily_update
	source /home/frecovid/miniconda3/bin/activate covid
}

convert_notebooks(){
        echo "Converting notebooks"
	jupyter nbconvert --to python --output-dir='.' 1_COVID_Daily_Cases_Process.ipynb
	jupyter nbconvert --to python --output-dir='.' 2_Download_COVID_Hospitalizations_County.ipynb
	jupyter nbconvert --to python --output-dir='.' 3_Download_Hospital_Beds_County.ipynb
	jupyter nbconvert --to python --output-dir='.' 4_Download_ICU_Beds_County.ipynb
	jupyter nbconvert --to python --output-dir='.' 5_COVID_Hospital_ICU_Process.ipynb
	jupyter nbconvert --to python --output-dir='.' 6_COVID_14day_Metrics_Process.ipynb
	jupyter nbconvert --to python --output-dir='.' 7_Update_COVID_ArcGIS_Online_Layers.ipynb
}

run_scripts(){
        echo "Run scripts"
        python 1_COVID_Daily_Cases_Process.py
        python 2_Download_COVID_Hospitalizations_County.py
        python 3_Download_Hospital_Beds_County.py
        python 4_Download_ICU_Beds_County.py
        python 5_COVID_Hospital_ICU_Process.py
        python 6_COVID_14day_Metrics_Process.py
}


setup_env
convert_notebooks
run_scripts
