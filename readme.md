# Emotion Forms

1. upload file to your custom theme
2. Add this line of code to your custom JS file
```javascript
window.StateManager
    .removePlugin('.emotion--wrapper', 'swEmotionLoader')
    .addPlugin('.emotion--wrapper:not(.emotion--non-ajax)', 'swEmotionLoader')
    .addPlugin('.emotion--non-ajax *[data-emotion="true"]', 'swEmotion');
```
3. Enter the generate a ```showEmotion``` custom field for your forms where you enter the id of the emotion world you want to display
