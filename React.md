# React JS

### Commands to create and run a react application
```
npx create-react-app my-app
cd my-app
npm start
```

### Install modules
```
npm install react-router-dom
npm install jquery
npm install crossfilter
npm install highcharts
npm install react-syntax-highlighter --save
npm install react-ace ace-builds
```

### Configure react app after fork from github
```
npm cache clean --force
npm rebuild
npm install
```

### Syntax highlighting
```javascript
import SyntaxHighlighter from 'react-syntax-highlighter';
import { docco } from 'react-syntax-highlighter/dist/esm/styles/hljs';
const Component = () => {
  const codeString = '(num) => num + 1';
  return (
    <SyntaxHighlighter language="javascript" style={docco}>
      {codeString}
    </SyntaxHighlighter>
  );
};
```

### Ace Editor
```javascript
                    <AceEditor
                        placeholder="Write your program here..."
                        mode="c_cpp"
                        theme="monokai"
                        name="editor"
                        onChange={fetchScriptFromEditor}
                        fontSize={18}
                        showPrintMargin={true}
                        showGutter={true}
                        highlightActiveLine={true}
                        value={`// Hello World Program
#include <iostream>
using namespace std;

int main() {
    cout << "Hello World";
    return 0;
}
                        `}
                        setOptions={{
                        enableBasicAutocompletion: false,
                        enableLiveAutocompletion: false,
                        enableSnippets: false,
                        showLineNumbers: true,
                        tabSize: 2,
                        }}/>
```
