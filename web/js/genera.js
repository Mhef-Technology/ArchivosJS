const CHATGPT_KEY = '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';
async function callToChatGpt(prompt){
    const bodyRequest = {
        model: 'gpt-3.5-turbo', 
        max_tokens: 500,
        messages: [
            { "role": "user", "content": prompt }
        ]
    };
    const request={
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer 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`
        },
        body: JSON.stringify(bodyRequest)
    };
    const response = await fetch('https://api.openai.com/v1/chat/completions')
}