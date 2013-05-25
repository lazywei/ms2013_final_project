

談到網頁的開發技術，許多人的印象中不外乎便是PHP、Java或是.Net等等，而比較新興的技術則可能是Ruby或是Python，在本系列文章中，我將介紹在近日中熱門的網路技術，讓各位讀者能夠掌握最新趨勢。
Node.js

Node.js絕對是這一年最火熱的名詞了，若是你像Insiders一樣關注Hacker News等國外媒體的話，你一定會看到Node.js的相關討論。
Node.js顧名思義便是使用JavaScript語言作為基礎的框架，特別的是，相對於jQuery或是YUI等在瀏覽器中運行使用的JavaScript框架，Node.js是作為網站程式的後端框架，就如同PHP或是Java一般開發網站。
換句話說，JavaScript不只可以跑在瀏覽器中，還可以當做網站的伺服器！這個想法是非常的新鮮有趣，主要的原因是在於隨著Gmail等AJAX網站以及技術的興起，許多的程式開發者紛紛投入心力鑽研JavaScript，並且有許多開發心得、優化技巧陸續被發掘，加上瀏覽器之間的競爭越來越激烈，JavaScript的執行效能持續性的突破，因此最終便誕生了Node.js。
簡單的範例
Node.js在官網上便提供了一個簡單的Helo World範例，如下：
var http = require('http');

http.createServer(function (request, response) {
    response.writeHead(200, {'Content-Type': 'text/plain'});
    response.end('Hello World\n');
}).listen(8000);

console.log('Server running at http://127.0.0.1:8000/');
或許各位有注意到了，其整支網站程式架構便是在一個簡單的JavaScript當中，並且提供了很好的自定彈性。
除了作為HTTP Server之外，Node.js也可以提供作為一般TCP Server使用。
實際的應用
雖然仍然是相對較新的技術，但截至目前為止，Node.js已經有一些實際的應用範例可以參考了。
在Inside前幾天與Plurk亞太區總監的對談中，便提到了Plurk使用了Comet技術來讓訊息的更新可以達到近乎即時的效果，其背後的技術便是透過Node.js（不過後來似乎又換回Java？）。
在他們開發者Amir的部落格中，便有Node.js和Comet server的技術經驗分享投影片、以及簡單的程式碼範例可以下載，而其在台北的TOSSUG聚會中的演講影片也可以在YouTube上觀看。
另外值得一提的是，HP的平板電腦和智慧型手機作業系統WebOS，也內建了Node.js作為開發的環境之一。
在GitHub上的專案Wiki頁面中也有相關開放原始碼專案和使用Node.js的公司列表，有興趣的讀者可以參考。
具體的優點
整體而言，Node.js具有幾個相當有吸引力的特點：
JavaScript
無論你先前曾經是PHP、Ruby或是Python的開發者，多少對於JavaScript都會具有一些基本的概念。因此要上手Node.js可以算是相對的迅速很多。
優秀的效能表現
Node.js是建築在Google Chrome所開放原始碼的V8 JavaScript引擎上，是目前最快速的JavaScript處理引擎之一，以non-blocking的概念作為基礎（與Nginx雷同），提供相對於一般網頁伺服器（像是Apache）更快速的request處理效能。
強大的社群支援
更吸引人的一點，則不外乎其強大的社群支援了！如同先前提到的，目前國外最炙手可熱的技術便是Node.js，上網搜尋隨時都可以找到許多文章，而在問答網站像是StackOverflow上也有許多熱心的網友願意替大家解決相關問題。
而其套件管理系統npm中也擁有了上千個套件可以提供開發者們使用，且這個數字正在持續的快速增加中！
學習的資源
對Node.js產生興趣了嘛？下面是一些不錯的學習資源可以提供參考：
How To Node -- NodeJS
Learning Server-Side JavaScript with Node.js | Nettuts+
NodeJS Screencasts
YUI Theater — Ryan Dahl: “Introduction to NodeJS” (58 min.) » Yahoo! User Interface Blog (YUIBlog)
結論
Node.js在國外的hackers中可謂炙手可熱，而國內也逐漸有愈來月多的開發者持續關注當中。雖然實際應用鮮少有機會可以全部透過Node.js來開發，但針對一些需要即時性的，像是聊天室或者是news feeds等便可以考慮透過Node.js作為解決方案。
你有關於Node.js的相關經驗可以與我們分享嘛？歡迎留言或者是來信！





 Tagged with: nodejs 
