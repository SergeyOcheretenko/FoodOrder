let { Telegraf } = require('telegraf');
TOKEN = '1648769627:AAFOMcg5QUYy_Jcqn39vX2XeSoH8FdXBd94';
const bot = new Telegraf(TOKEN);

bot.start(msg => msg.reply('Welcome'));

bot.hears('s', (msg) => msg.reply('Ju'));

bot.on('message', (ctx) => ctx.reply(`Hello`))

bot.on('edited_message', ctx => {
    ctx.reply('Вы успешно изменили сообщение')
})

bot.hears('хочу есть', ctx => {
    ctx.reply('Так передохни и покушай')
})
bot.command('hipster', Telegraf.reply('λ'))


bot.launch();