*** Variables ***

### Login page
${INPUT_EMAIL}      id:email 
${LOGIN_BUTTON}     xpath://button[contains(text(),'Entrar')]
${LOGIN_ALERT}      class:alert-dark

### Dashboard Page
${DIV_DASH}         class:dashboard
${BIKE_ITEM}        css:.bike-list li
${BIKE_LIST}        class:bike-list

### Ads Page
${INPUT_THUMB}      css:#thumbnail input 
${INPUT_NAME}       id:name
${INPUT_BRAND}      id:brand
${INPUT_PRICE}      css:input[placeholder*='cobrado por dia']
${AD_BUTTON}        class:btn-red
${AD_ALERT}         class:alert-error