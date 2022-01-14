# WebCam | JavaScript

## Source
```javascript
<script type="text/javascript" src="https://unpkg.com/webcam-easy/dist/webcam-easy.min.js"></script>
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
webcam.snap(); // returns dataURI
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

### Send snap for recognition
```javascript
const sendSnapForRecognition = () => {

    let picture = webcam.snap();
    let blob = dataURItoBlob(picture);
    let fileName = 'image' + (new Date()).getTime() + '.png';
    let file = new File([blob], fileName, {type:"image/png", lastModified:new Date()});
    var formData = new FormData(document.forms[0]);
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
