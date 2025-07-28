# An AI LLM System Architecture Review
- [Diagrams source](https://app.diagrams.net/#G1Mrkctv8KoSAEdZxTLnnPQIDzfVgErK5X#%7B%22pageId%22%3A%228B9phikLyFSe8g4D6Oy4%22%7D)
- [Original repository](https://github.com/PacktPublishing/LLM-Engineers-Handbook)


## AI System Objective
Build an LLM Twin Writer (TW), an AI character that learns to write like a particular
person by incorporating its style, voice, and personality into an LLM.


## Project Feasibility Study
Before start building an AI/ML solution, there are a few questions to be answered related to alignment with business priorities, data, resources/budget and skills availability, development and runtime cost, development time and return of investment (ROI). These questions are gathered in the [Project Feasibility Study - XXXXXXXXXXX](XXXXXXX).


## Generic AI/ML/LLM System Architecture
The general system architecture is based on the [FTI (Feature-Training-Inference) pattern - XXXXXXXXX](XXXXXXXXXXX).


![alt text](/images/ai_llm_system.png)


## Data Collection Pipeline

![alt text](/images/ai_llm_data_collection.png)

Source: 
- Data input: `configs/end_to_end_data.yaml`
- Raw data in MongoDB (json formatted): `data/artifacts/raw_documents.json`
Actions:
- `poetry poe local-infrastructure-up`
- Drop MongoDB twin db if exists
- `poetry poe run-digital-data-etl`
- Import from local json, if etl problems: `poetry poe run-import-data-warehouse-from-json`
- ZenML: http://127.0.0.1:8237/pipelines/digital_data_etl
- MongoDB: https://cloud.mongodb.com/v2/6878f520458a0322900a02b4#/clusters/detail/Cluster0