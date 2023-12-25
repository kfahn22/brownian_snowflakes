# Synthetic Data Creation

This repo demonstrates how to create a synthetic data set of Brownian snowflakes in [Processing](https://processing.org) and push the dataset to the [Hugging Face Hub](https://huggingface.co).

The snowflake code is adapted from from Daniel Shiffman's [Brownian Snowflake](https://thecodingtrain.com/challenges/127-brownian-tree-snowflake) coding challenge

## Pushing a Dataset to the Hugging Face Hub

- Create a Hugging Face account, if you do not already have one.
- Go to Settings -> Access Tokens -> New Token and generate a WRITE token.

First, we install the huggingface hub and datasets:

`!pip install huggingface_hub datasets`

Next, we log into the Hugging Face hub using our "WRITE" access token:

`from huggingface_hub import notebook_login

notebook_login()`

`from datasets import load_dataset
dataset = load_dataset("imagefolder", data_dir="snowflakes")`

Now, let's push the dataset to the hub:

`dataset.push_to_hub("kfahn/snowflakes")`
