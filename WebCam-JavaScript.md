# WebCam | JavaScript

## Source
```javascript
<script type="text/javascript" src="https://unpkg.com/webcam-easy/dist/webcam-easy.min.js"></script>
```

### Create HTML elements
```html
<video id="webcam" autoplay playsinline width="640" height="480"></video>
<canvas id="canvas" class="d-none"></canvas>
<audio id="snapSound" src="audio/snap.wav" preload = "auto"></audio>
```

### Create webcam object
```javascript
const webcamElement = document.getElementById('webcam');
const canvasElement = document.getElementById('canvas');
const snapSoundElement = document.getElementById('snapSound');
const webcam = new Webcam(webcamElement, 'user', canvasElement, snapSoundElement);

```

### Properties
```
facingMode : 'user' or 'enviroment'
webcamList : all available camera device
webcamCount : number of available camera device
```

### Access webcam
```javascript
webcam.start()
.then(result => {
    showResponse('WebCam started');
})
.catch(err => {
    showResponse(err);
});
```

### Stop webcam
```javascript
webcam.stop();
```

### Take snap 
```javascript
var picture = webcam.snap(); // returns dataURI
```

### Convert DataURI to Blob
```javascript
function dataURItoBlob(dataURI) {
    // convert base64/URLEncoded data component to raw binary data held in a string
    var byteString;
    if (dataURI.split(',')[0].indexOf('base64') >= 0)
        byteString = atob(dataURI.split(',')[1]);
    else
        byteString = unescape(dataURI.split(',')[1]);

    // separate out the mime component
    var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];

    // write the bytes of the string to a typed array
    var ia = new Uint8Array(byteString.length);
    for (var i = 0; i < byteString.length; i++) {
        ia[i] = byteString.charCodeAt(i);
    }

    return new Blob([ia], {type:mimeString});
}
```

### Send snap for recognition using fetch API
```javascript
const sendSnapForRecognition = () => {

    let picture = webcam.snap();
    let blob = dataURItoBlob(picture);
    let fileName = 'image' + (new Date()).getTime() + '.png';
    let file = new File([blob], fileName, {type:"image/png", lastModified:new Date()});
    var formData = new FormData;
    formData.append("snap", file);
    var URL = 'upload.php';
    fetch(URL, {
        method: 'POST',
        body: formData
    })
    .then((res) => {return res.json();})
    .then((data) => {
        console.log(data);
    })
}
```
