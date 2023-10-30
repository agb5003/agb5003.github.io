const form = document.getElementById('generateForm');
const qr = document.getElementById('qrcode');

const onGenerateSubmit = (e) => {
    e.preventDefault();

    clearUI();

    const url = document.getElementById('url').value;
    const urlBox = document.getElementById('url');
    const qrSize = document.getElementById('size').value;

    console.log(url,size);

    if (url === '') {
        urlBox.style.backgroundColor = "#fcc9ce";
        urlBox.placeholder = "URL field cannot be blank."
    } else {
        if (url.slice(0, 8) != "https://") {
            urlBox.value = "https://" + url;
        }

        showLoading();

        setTimeout(() => {
            hideLoading();

            generateQR(url, qrSize);

            setTimeout(() => {
                const saveUrl = qr.querySelector('img').src;
                createSaveLink(saveUrl);
            }, 50);
        }, 1000);
    }
};

const generateQR = (url, qrSize) => {
    const qrcode = new QRCode("qrcode", {
        text: url,
        width: qrSize,
        height: qrSize,
    });
};

const showLoading = () => {
    document.getElementById('loadCircle').style.display = 'block';
};

const hideLoading = () => {
    document.getElementById('loadCircle').style.display = 'none';
};

const clearUI = () => {
    qr.innerHTML = '';
    const saveButton = document.getElementById('saveLink');
    if (saveButton) saveButton.remove();
}

const createSaveLink = (saveUrl) => {
    const link = document.createElement('a');
    link.id = 'saveLink';
    link.classList = 'bg-neutral-700 hover:bg-neutral-500 text-white py-2 rounded w-1/3 m-auto my-5';
    link.href = saveUrl;
    link.download = 'qrcode';
    link.innerHTML = 'Save QR Code as .png'
    document.getElementById('generated').appendChild(link);
}

hideLoading();

form.addEventListener('submit', onGenerateSubmit);