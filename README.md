# web_admin
Приложение состоит из 2 модулей: карта, и инструментарий для работы с ней. Это 2 независимых модуля, которые общаются через `iframe.postMessage` => 
они обособлены друг от друга и могут быть использованы по отдельности.

### Структура проекта
_весь код находится в папке lib_
*здесь отмечены только основные файлы*
lib \
-- components - папка где хранятся все компоненты \
--- map.dart - место подключения ts модуля карты к флаттеру \
-- screens - папка где находятся все экраны (в нашем случае используется один экран - `MapScreen` \
assets \
-- map \
--- index.ts - точка входа для работы с картой

### Как работать с модулем карты 
добавьте такоей событие в клиентский код:
```js
document.addEventListener("message", (e) => {
  console.log(e); 
})
```
чтобы отослать на карту список точек напишите:
```js
document.getElementById("map_widget").contentWindow.postMessage(dots)


```

формат переменной dots:

```js
{
    "id": String,
    "cords": Float[],
    "type": int, //(500, 1000, 3000, 5000)
    "amount": int
    "area": number,
};

```

Карта в чистом виде находится здесь - https://parallel-gold.surge.sh/ (чтобы ее включить вставьте ее на своем сайте в iframe)
