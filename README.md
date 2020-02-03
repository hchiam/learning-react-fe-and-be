# Learning React FE and BE

Just one of the things I'm learning. <https://github.com/hchiam/learning>

Learning from an (old 2018) freeCodeCamp tutorial: <https://www.freecodecamp.org/news/create-a-react-frontend-a-node-express-backend-and-connect-them-together-c5798926047c/>

Tutorial's reference repo (old 2018): <https://github.com/Joao-Henrique/React_Express_App_Medium_Tutorial>

You can generate a [dependency graph](https://github.com/hchiam/learning-dependency-cruiser) with `bash show_dep_graph.sh`.

This file was first created using the Yeoman generator [`generator-hchiam-learning`](https://www.npmjs.com/package/generator-hchiam-learning).

## Setup

Inside the top-level folder of this project:

```bash
# make sure you have the up-to-date version of create-react-app:
npm install -g create-react-app
# ideally start inside of an empty folder:
mkdir my_awesome_project
cd my_awesome_project
```

Create frontend client:

```bash
npx create-react-app client
cd client
yarn start # localhost:3000 should open
# Ctrl+C to stop
```

Go back to the top-level folder:

```bash
cd ..
```

Create backend server/api:

```bash
npx express-generator api
cd api
yarn add cors --dev
yarn
yarn start
# Ctrl+C to stop
```

Change api/bin/www port to 9000 so client and api aren't using the same port.

Create api/routes/testAPI.js with this code to create a test API response:

```js
var express = require('express');
var router = express.Router();

router.get('/', function(req, res, next) {
  res.send('API is working properly');
});

module.exports = router;
```

Add a new route in api/app.js that uses the new test API response:

```js
var testAPIRouter = require("./routes/testAPI");
...
app.use("/testAPI", testAPIRouter);
```

Also add CORS to api/app.js so the frontend/backend ports can talk to each other:

```js
var cors = require("cors");
...
app.use(cors());
```

Inside the api folder:

```bash
yarn start
# this should work: http://localhost:9000/testAPI
```

Connect frontend React client to backend Express API:

Edit client/src/app.js:

```js
// import useState and useEffect from the latest React:
import React, {useState, useEffect} from 'react';

...

// put in the top part of the functional component:
const [apiResponse, setApiResponse] = useState('');

const callAPI = () => {
  fetch("http://localhost:9000/testAPI")
    .then(res => res.text())
    .then(res => setApiResponse(res));
};

useEffect(() => {
  callAPI();
}, []); // [] -> makes it run once, replicating componentWillMount(){...} behaviour:\

...

// put in the return:
<p>{apiResponse}</p>
```

Try (re)starting both the frontend and backend in separate Terminal CLIs:

```bash
# in client folder
yarn start
```

```bash
# in api folder
yarn start
```

Frontend Client should look like this:

<img src="https://github.com/hchiam/learning-react-fe-and-be/blob/master/client.png" height="200" alt="frontend client"/>

Backend API should look like this:

<img src="https://github.com/hchiam/learning-react-fe-and-be/blob/master/api.png" height="100" alt="backend API"/>

## Aside

You can get up to speed on `yarn` here: <https://github.com/hchiam/learning-yarn>
