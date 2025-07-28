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
- Drop MongoDB twin db, if exists
- `poetry poe run-digital-data-etl`
- Import from local json, if etl problems: `poetry poe run-import-data-warehouse-from-json`
- ZenML: http://127.0.0.1:8237/pipelines/digital_data_etl
- MongoDB: https://cloud.mongodb.com/v2/6878f520458a0322900a02b4#/clusters/detail/Cluster0


## RAG Feature Pipeline

![alt text](/images/ai_llm_feature_pipeline.png)

Source: 
- Cleaned data for fine-tuning (json formatted): `data/artifacts/cleaned_documents.json`

Actions:
- Delete existing Qdrant collections, if exist
- `poetry poe run-feature-engineering-pipeline`
- Qdrant: https://cf1dcd5c-d0a7-44a1-a5d1-54cbdbbf0f2e.eu-central-1-0.aws.cloud.qdrant.io:6333/dashboard#/collections
   - GET collections
   - POST collections/embedded_articles/points/search
      {
         "vector": [],
         "limit": 4,
         "with_payload": true
      }
      
### Retrieval-Augmented Generation (RAG)
RAG refers to a hybrid architecture that:
1. **Retrieves** relevant documents or chunks from an external knowledge source (like a vector database or document store).
2. **Augments** the user’s query with that retrieved context.
3. **Generates** a final answer using a generative language model (e.g., OpenAI GPT, Google T5, Meta LLaMA).

RAG is usually used to augment LLMs with: 
- Capability to perform specific actions (e.g., summarize, reformulate, and extract the injected data),
- Specific (private) domain knowledge,
- New facts/data occured/created after the model was trained.

### Embeddings
Embeddings are dense vector representations of data (words, sentences, documents, etc.) that capture their semantic meaning in semantic space. In the context of LLMs, embeddings are central to how these models understand, compare, and relate text.


## Training Pipeline

![alt text](/images/ai_llm_training_pipeline.png)

Source: 
- Instruction dataset: `data/artifacts/instruct_datasets.json`
- Preference dataset:
   - json: `data/artifacts/preference_datasets.json`
   - Hugging Face: https://huggingface.co/datasets/mlabonne/llmtwin-dpo
- Fine-tuned LLM: https://huggingface.co/mlabonne/TwinLlama-3.1-8B-DPO

Actions:
- XXXXXXXX

### Fine-tuning
Fine-tuning (or Supervised Fine-Tuning, SFT) is the process of taking a pretrained model (like GPT, BERT, or LLaMA) and continuing its training on a specific dataset to adapt it to a particular task, domain, or tone. The fine-tuning steps include:
1. Start with a pretrained LLM (e.g., GPT-3.5, LLaMA-2, Mistral, Falcon, BERT).
2. Prepare a dataset (instruction-response for instruction-tuned models).
3. Train on your dataset (update pretrained LLM weights) using cloud-based services like Hugging Face Transformers, OpenAI Fine-tuning API, Google Vertex AI/PaLM or Amazon Bedrock.
4. Evaluate and deploy (check quality, hallucinations, and alignment with goals).

### Direct Preference Optimization
Direct Preference Optimization (DPO) is a training technique used to align large language models (LLMs) with human preferences, without the complexity of reinforcement learning (like RLHF, Reinforcement Learning from Human Feedback).

### LLM Evaluation
Evaluating Large Language Models (LLMs) is a crucial step in understanding how well they perform across various tasks such as text generation, question answering, summarisation, coding, or reasoning. There are multiple evaluation dimensions, depending on the goal:
- **Accuracy/Factuality**: Is the output correct and grounded in facts?
- **Relevance/Helpfulness**: Does the response address the user’s input?
- **Fluency/Grammar**: Is the language smooth, well-structured, and grammatically correct?
- **Coherence/Logic**: Are the ideas well connected and logically ordered?
- **Faithfulness**: Is the output consistent with the input context (especially in summarisation)?
- **Safety/Toxicity**: Is the response free of harmful or biased content?
- **Bias/Fairness**: Does the model show discriminatory patterns?
- **Efficiency/Latency**: How fast and resource-efficient is the model?
- **Generalisation**: Can it perform well on unseen or zero-shot tasks?

