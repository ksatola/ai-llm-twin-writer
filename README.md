# ai-llm-twin-writer

## Objective
Build an LLM Twin Writer (TW), an AI character that learns to write like a particular
person by incorporating its style, voice, and personality into an LLM.

## Approach

### Solution ideation (iterative process)
 
#### What
    1. Business need or problem to be solved definition/understanding in business terms
    2. MVP first iteration of features scope (functional and non-functional requirements)

TW will be used to write content (posts, articles) to be posted in social media portals, like LinkedIn, Medium or X. It will help automate the content creation process.

TW MVP features:
- Collect data from LinkedIn, Medium, Substack, and GitHub profiles
- Fine-tune an open-source LLM using the collected data
- Populate a vector database using our digital data for RAG
- Create LinkedIn posts leveraging the following:
    - User prompts
    - RAG to reuse and reference old content
    - New posts, articles, or papers as additional knowledge to the LLM
- Have a simple web interface to interact with the TW and be able to do the following:
    - Configure your social media links and trigger the collection step
    - Send prompts or links to external resources


#### Why
    Feasibility study (alignment to business objectives, data/skills availability, cost/timeline, ROI and value definition, data and methods legal/requirements/ethics compliance, solution explainability)

TW will help to create my brand, automate the writing process, help brainstorm new creative ideas. We will control TW (comparing to any other general-purpose tool, like ChatGPT or Gemini) by controlling what data we collect, how we preprocess the data, how we feed the data into the LLM, how we chain multiple prompts for the desired results, and how we evaluate the generated content.


#### How
    1. Problem translation from business to AI domain
    2. Alignment with the enterprise architecture or existing solutions for reausability, consistency and compliance with the entire AI portfolio of solutions (build vs. buy vs. reuse) and other supporting solutions (like identity and access management)
    3. Data (origin, rights to use, bias/ethics, ownership)
    4. Cost of the solution estimation (potential need to return to the feasibility study)

TW architecture will be based on FTI pattern with the scope of:
- Ingesting, cleaning, and validating fresh data
- Training and inference setups
- Compute and serve features in the right environment
- Serve the model in a cost-effective way
- Version, track, be able to reproduce, and share the datasets and models
- Monitor your infrastructure and models
- Deploy the model on a scalable infrastructure
- Automate the deployments and training

Following the [FTI pattern](https://medium.com/decodingml/building-ml-systems-the-right-way-using-the-fti-architecture-d9cc0cd29abf), any ML system can be divided into 3 pipelines:
- Feature training 
- Model training
- Inference (model serving)

![alt text](/images/image.png)


### Data
2. Data preparation
   1. Data collection
   

### XXXXX
3. Solution deployment
4. Monitoring and alerting



## Vocabulary
- **AI** - Artificial Intelligence
- **FTI** - Feature-Training-Inference (Architecture)
- **LLM** - Large Language Model
- **MVP** - Minimum Viable Product
- **RAG** - Retrieval-Augmented Generation
- **ROI** - Return of investment
