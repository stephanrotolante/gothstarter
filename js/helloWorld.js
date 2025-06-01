console.log("Hello world!");

const { createApp, defineComponent } = Vue;

const currentScript = document.currentScript;

const MessageComponent = defineComponent({
    template: `
        <div>
            <h1>{{ title }}</h1>
            <p>{{ message }}</p>
            <button @click="changeMessage">Change Message</button>
        </div>
    `,
    data() {
        return {
            title: currentScript.getAttribute('data-some-field'),
            message: currentScript.getAttribute('data-some-data')
        };
    },
    methods: {
        changeMessage() {
            this.message = "You clicked the button!";
        }
    }
});

createApp({
    components: { MessageComponent }
}).mount('#app');

function homePageClickButton() {
    console.log("this is the button click!");
}