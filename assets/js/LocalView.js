"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
// utility to display what will be rendered on the web page
// tsc
// node .\js\LocalView.js
const WebDisplay_1 = require("./WebDisplay");
console.log(WebDisplay_1.Articles);
const text = (0, WebDisplay_1.renderArticleIndex)(WebDisplay_1.Articles);
console.log(text);
//# sourceMappingURL=LocalView.js.map