import { Configuration, OpenAIApi } from "openai";

const configuration = new Configuration({
  organization: "org-LElCgMp9DJlsFu381rOF0wBB",
  apiKey: "sk - mvs0l43v1VWWpwVvhaJUT3BlbkFJ6WYuxYzFoW1hG5iLm5Si",
});

const openai = new OpenAIApi(configuration);

const response = await openai.createImage({
  prompt: "A cute baby sea otter",
  n: 1,
  size: "1024x1024",
});
