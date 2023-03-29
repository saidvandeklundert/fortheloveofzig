"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
// Render what is ultimately used in the web page.
var ArticleBuild_1 = require("./ArticleBuild");
var text = (0, ArticleBuild_1.renderArticleIndex)(ArticleBuild_1.Articles);
document.getElementById("indextag").innerHTML = text;
//# sourceMappingURL=WebDisplay.js.map