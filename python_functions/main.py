import base64
import functions_framework
from google.cloud import vision

@functions_framework.http
def ocr_prescription(request):
    content = request.get_json()
    image_data = base64.b64decode(content['image_base64'])

    client = vision.ImageAnnotatorClient()
    image = vision.Image(content=image_data)
    response = client.text_detection(image=image)
    text = response.text_annotations[0].description if response.text_annotations else ""
    return {"text": text}