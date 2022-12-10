const express = require("express");
const { Configuration, OpenAIApi } = require("openai");

const app = express();
const PORT = 8001;

const DEFAULT_IMAGE =
  "https://i.pinimg.com/236x/cb/24/f1/cb24f1478772b27702ff45e5490b6b6f.jpg";

app.set("views", __dirname + "/views");
app.set("view engine", "ejs");

app.get("/", (req, res) => {
  res.render("index");
});

app.get("/test", (req, res) => {
  res.render("test");
});

app.get("/image", async (req, res) => {
  try {
    const prompt = req.query.text ?? "happy cute cat";

    const configuration = new Configuration({
      organization: "org-LElCgMp9DJlsFu381rOF0wBB",
      apiKey: "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",
    });

    const openai = new OpenAIApi(configuration);

    const openAiResponse = await openai.createImage({
      prompt,
      n: 1,
      size: "1024x1024",
    });

    const url = openAiResponse.data.data[0].url ?? DEFAULT_IMAGE;

    res.render("image", { url });
  } catch (err) {
    res.send(err);
  }
});

app.listen(PORT, () => {
  console.log(`server started on PORT ${PORT}`);
});
