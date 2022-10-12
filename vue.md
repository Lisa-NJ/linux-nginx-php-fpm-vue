camelCase (驼峰命名法)
kebab-case(短横线分隔命名)
PascalCase(首字母大写命名)

待补：

```bash
$ npm view webpack versions
$ npm view less-loader versions
```

vue-cli 生成一个项目，使用 bootstrap 后，不需要自己的样式，使用 bootstrap 的样式

html模板+template模板-->对象-->虚拟DOM，通过 render 调用

[Vue devtools] 
has two main tabs:cd

the Inspector to display debugging information in a structured way (for example inspecting a component),
the Timeline to track different kinds of data over time such as events.

【0】
Vue 的特点：
  1. 采用 组件化 模式，提高代码复用率、且让代码更好维护
  2. 声明式 编码，让编码人员无需直接操作 DOM，提高开发效率
  3. 使用 虚拟 DOM + 优秀的 Diff 算法，尽量复用 DOM 节点 
     虚拟 DOM 就是内存中的一个数据

学习 Vue 之前要掌握的 JavaScript 基础知识？
  ES6模块化 ES6语法 包管理 原型（链） 数组常用方法 axios promise

// 官网值得看的内容

学习 / 教程 + API

生态系统 / 工具 + 核心插件
	Vue3 Snippets by hollowtree
	

资源列表 / Awesome Vue

Vue.config - 一个对象，包含 Vue 的全局配置，可以在启动应用之前修改某些 property

```vue
Vue.config.productionTip = false;
```

数据代理 - 通过一个对象代理对另一个对象中属性的操作（读/写）

vm 拿到 data 后会保存在自身的 _data 中，并且升级后可以监测到数据的变化 -- 数据劫持 被用到

```vue
vm._data = options.data
```
1. Vue 中的数据代理：
	通过 vm 对象来代理 data 对象中属性的操作（读/写）
2. Vue 中数据代理的好处：
	更加方便地操作 data 中的数据
3. 基本原理：
	通过 Object.defineProperty() 把 data 对象中所有属性添加到 vm 上
	为每一个添加到 vm 上的属性，都指定一个 getter/setter
	在 getter/setter 内部去操作（读/写）data 中对应的属性



【1】

框架 - JS 的一个工具集合；

使用框架的原因：更好、更快 地开发 --> 可维护 + 可复用

组件化

//待补...：导航栏、侧边栏、轮播图 这些基本功能 的 实现

框架复杂度 vs 应用复杂度 需要进行平衡，不盲目使用框架 

JS 体现了前端的天花板

```bash
          by          on       最新      缺点
vue      尤雨溪
angular  Google      1/PC端    4，5     大、API总变化
react    Facebook                       
```

Augular：4，5开始用到 TS，依赖注入的思想，

Typescript：静态类型检测

react：引入 虚拟 dom，jsx 语法， HTML + CSS 都写到 JS 中去，对原生 HTML 进行了修改，

vue：借鉴了前两者的思想和优点，学习成本低，兼容TS；数据绑定、虚拟dom、组件化

用vue开发的一个范例：http://element.eleme.io - 饿了么组件库，**单页面应用**，第一次加载页面即从服务器请求到并且加载所有资源，第一次会慢，加载完会发现没有跳转；

vue - The progressive JS Framework

vue-router：单页面应用需要

Vuex 状态管理系统

学习建议：官网、英文版、生态系统看github、研究底层实现

https://github.com/vuejs vue-核心，推荐 awesome-vue（很多资源），论坛Forum可以提问，聊天室Chat

【2】{{}}

如果 data 中的属性在 {{}} 中没有使用，则 开发者工具 中 的属性值不更新即使某个属性的值已经改变了

```vue
<head>
  <!-- 下面一行会引入名为 Vue 的构造函数 -->
	<script src="https://unpkg.com/vue@2.5.13/dist/vue.js"></script>
</head>
<body>
  <div id="app">
    {{ getFullName()}}
  </div>
	<script>
    var vm = new Vue({
      el: "#app",
      data:{
        msg: "hello world!",
        age: 19,
        fullName: "Lisa Huang"
      },
      methods: {
        getFullName : function(){ 
          return this.fullName;
        }
      }
    })
  </script>
</body>
```

注意：methods 中不能使用 ()=>{}，因为 方法中需要使用到 this，可是箭头函数的 this 指向与普通函数的不同；

vue 指令语法：v-bind : href="url"

​						v-指令名 : 指令参数 = 指令表达式

```vue
<body>
  <div id="app">
    <a v-bind:href="url">baidu</a>
  </div>
	<script>
    new Vue({
      el: "#app",
      data:{
        url: "https://www.baidu.com"
      }
    })
  </script>
</body>
```

【3】事件使用及修饰符

// 事件修饰符

修饰符可以连续写 - 链式操作

.stop - 阻止冒泡

.prevent - 阻止默认事件 tells the v-on directive to call event.preventDefault() on the triggered event

```html
<form v-on:submit.prevent="onSubmit"> ... </form>
```
.once - 事件只触发一次

.capture - 使用事件的捕获模式
.self - 只有 event.target 是当前操作的元素时才触发事件
.passive - 事件的默认行为立即执行，无需等待事件回调执行完毕

// 按键修饰符

.enter - 鼠标按键响应 = .13 / 按键对应的数字

.space.esc.enter - 可以链式操作

// 键盘事件
1.  Vue 中常用的事件别名：
    回车 => enter
    删除 => delete（捕获“删除”和“退格”键）
    退出 => esc
    空格 => space
    换行 => tab（** 特殊，必须配合 keydown 去使用）
    上 => up
    下 => down
    左 => left 
    右 => right
2. Vue 未提供别名的按键，可以使用按键原始的 key 值去绑定，但注意要转为 kebab-case
```vue
  <input type="text" @keyup.caps-lock="showInfo" ></input>
```
3. 系统修饰键（用法特殊）：ctrl、alt、shift、meta
    (1). 配合 keyup 使用：按下修饰键的同时，再按下其他键，随后释放其他键，事件才被触发
```vue
  <input type="text" placeholder="Enter to show Info" @keyup.ctrl="showInfo" ></input>
  <input type="text" placeholder="Enter to show Info" @keydown.ctrl="showInfo" ></input>
```
  (2). 配合 keydown 使用：正常触发事件
4. 也可以使用 KeyCode 去指定具体的按键（不推荐 - 该特性已从 Web 标准中删除，另外不同键盘对键的编码不统一）13:Enter 
```vue
  <input type="text" placeholder="Enter to show Info" @keyup.13="showInfo" ></input>
```
5. Vue.config.KeyCode.自定义键名 = 键码，可以去定制按键别名


```vue
<body>
  <div id="app">
    <button v-on:click.stop="showsome(123, $event)">click me</button>
    <a v-bind:href="https://www.baidu.com" 
       v-on:click.prevent>baidu</a>
  </div>
	<script>
    new Vue({
      el: "#app",
      methods:{
        showsome(msg, event){
          console.log(msg)
          alert("show some")
        } 
      }
    })
  </script>
</body>
```

响应式数据绑定 - 当某变量的值改变后，UI 自动更新

```vue
<body>
  <div id="app">
    <input type="text" v-on:click="changeName">
    Output: {{name}}
    <!-- html 中 $event 可获取 事件对象 -->
    <input id="input2" type="text" v-on:keyup.space.enter="name2=$event.target.value">
    Output : {{ name2 }}
  </div>
	<script>
    new Vue({
      el: "#app",
      data: {
        name : "hello"  //⚠️必须赋值，否则UI会显示 “{{name}}”
      }
      methods:{
        changeName : function (event) {
          this.name = event.target.value
        }
      }
    })
  </script>
</body>
```
方法都应该写在 methods 对象中，最终会在 vm 上，methods 中配置的函数，都是被 Vue 管理的函数，this 的指向是 vm 或组件实例对象;

作为事件回调出现的 方法 被调用时，如果不传参数，()可加可不加，传参时()必须加

```vue
  <button @click="showInfo">No para 1</button>
  <button @click="showInfo()">No para 2</button>
  <button @click="showMoreInfo(66)">with para</button>
```
作为插值语法使用时，没有()表示函数体，有()表示函数调用的返回值

```vue
  <span>{{showInfo}}</span> 
  <span>{{showInfo()}}</span>
```

逻辑简单的事件处理函数体也可以直接写在 模板 中，如下:

```vue
  @click="isHot = !isHot"
```
但是，@click="function" 中，function 只能是 Vue 实例中自己定义的函数,因此 alert(...) 不能在此使用

data 中的任何数据发生变化后，Vue 的模板都会重新解析一遍 - Vue 会把模板拿过来，重新再阅读一遍;模板里面如果用插值语法{{}}调了方法，方法也会被重新调一次

data 配置项下面的数据会做数据代理

@scroll - 滚动条
	- 优先级： 滚动条滚动 > 消息响应函数执行
@wheel - 鼠标滚轮 
	- 鼠标滚轮滚动 --> 触发消息响应回调函数 --> 滚动条移动
@wheel.passive ==> 先处理滚动条、再执行回调函数 - 手机、平板用的比较多


【4】双向数据绑定、条件渲染

数据绑定的底层实现：obj.properties...+观察者模式

v-bind:  dom --> js 

v-on: dom <-- js ==> 两行结合 = 双向数据绑定 v-model.trim .number .lazy

{{}} 的默认行为：将内容当成字符串去渲染

​	防止 跨域脚本攻击 xss 15‘01“ 

​	防止 用户随意更改页面的 dom

Dynamic Argument

```html
<a v-bind:[attributeName]="url"> ... </a>
<a v-on:[eventName]="doSomething"> ... </a>
```
attributeName & eventName will be dynamically evaluated as a JavaScript expression, and their evaluated value will be used as the final value for the argument

在 DOM 中使用模板时 (直接在一个 HTML 文件里撰写模板)，还需要避免使用大写字符来命名键名，因为浏览器会把 attribute 名全部强制转为小写

v-html 要慎用

v-once 只渲染一次初始化的值，后面更新后不进行渲染

v-if 不同条件下渲染不同的 dom 节点，显隐切换频率不高时使用

v-else-if

v-else  ==> 兄弟节点才可以使用,要求结构不能被“打断”，v-else 后面的条件判断会被忽略

使用 template 可解决 用 div 包裹时 结构被破坏的问题，template 展示在页面上时，会被拿掉，template 只能和 v-if 配合使用

```vue
<template v-if="n===1"> 
	<h2>Hello</h2>
	<h2>How are you</h2>
</tmplate>
```

不显示 dom 的两种方式：1-删除掉 dom，2-css / display - "none"

v-show ==> true/false 可以 显示/隐藏 一个元素，底层是通过 display:none 来实现隐藏，显隐切换频率高时使用

使用 v-if 时，元素可能无法获取到，而 v-show 一定可以获取到

【5】列表渲染

v-for = "(item, index) in movies" :key="yyy" 模版复用的思想

如果不写 key，Vue 会自动使用 index 作为 key 值 

可遍历：数组、对象、字符串、指定次数 

使用 index 作为 key 的话，带来的问题：
  1. 效率低 - 若对数据进行了(逆序添加、逆序删除等)破坏顺序的操作，会产生没有必要的真实DOM更新
  2. 如果结构中还包含输入类的DOM（ 为 li 添加 input 输入框时），会产生错误的DOM更新，界面会有错位的现象

key 值的使用，作用与原理
  1. key - 用来对节点进行标识，供 Vue 自身使用，不出现在真实的 DOM 节点中
  2. 虚拟 DOM 对比算法依赖 key

虚拟 DOM 中key的作用：
  key 是虚拟 DOM 对象的标识，当数据发生变化时，Vue 会根据“新数据”生成“新的虚拟DOM”，随后 Vue 进行“新虚拟DOM”与“旧虚拟DOM”的差异比较，规则如下：
    1. 若旧的DOM中没有找到与新虚拟DOM相同的key - 创建新的真实DOM，随后渲染到页面
    2. 旧虚拟DOM中找到了与新虚拟DOM相同的key - 若虚拟DOM中内容没变，直接使用之前的真实DOM;否则，生成新的真实DOM，并替换掉页面中之前的真实DOM

开发中选择 key：最好使用每条数据的唯一标识，比如 id、手机号、身份证号、学号等唯一值

Vue 重写的数组方法：reverse, push, shift, splice, push, pop, shift, unshift, sort, reverse, splice - 调用这几个函数后，Vue 能够监测到数组的变化，并更新页面；如果是通过索引值更新数组的某项，Vue 无法监测变化

Vue.set - 后添加的属性也可以具有响应式的特点

```vue
Vue.set(vm.student, 'sex', 'male')
vm.$set(vm.student, 'sex', 'male')
```

#### Vue.set 的使用
Vue.set 的使用 - 不能给 vm 添加，可以给 vm.student
	- 先 赋值 再 set 后，Vue 无法实现动态响应

文本框 绑定数据到  value，复选框的话 绑定到 check 上面去

? 爱好数组调用函数 splice 更新一个元素后，界面成功更新，但是 Vue 开发者工具没有，显示的还是老的数据

【Vue 监视数据的原理】
  1. Vue 会监视 data 中所有层次的数据
  2. u如何检测对象中的数据？
	通过 setter 实现监视，且要在 new Vue 时就传入要检测的数据
	（1）. 对象中后追加的属性，Vue默认不做响应式处理
	（2）. 如需给后添加的属性做响应式，请使用如下 API：
		Vue.set(target, porpertyName/index, value) 或
		vm.$set(target, porpertyName/index, value)
  3. 如何检测数组中的数据？

  	通过包裹数组更新元素的方法实现，本质就是做了两件事：
  	（1）. 调用原生对应的方法对数组进行更新
  	（2）. 重新解析模板，进而更新页面
  4. 在 Vue 修改数组中的某个元素一定要用如下方法：

  	（1）. 使用这些API：push,pop,shift,unshift,splice,sort,reverse
  	（2）. Vue.set() 或 vm.$set()
  	（3）. 使用非变更方法时，不会变更原始数组，而总是返回一个新数组，可以用新数组替换旧数组，如：filter, concat, slice
  特别注意：Vue.set() 和 vm.$set() 不能给 vm 或 vm 的根数据对象（vm._data） 添加对象！！！


```vue
// 过滤掉 smoking 这个爱好的方法
removeSmoke() {
   this.student.hobbies = this.student.hobbies.filter((h)=>{
   	return h !== 'smoking'
   })
}

```
  数据劫持：把传入的 data 加工（+get +set）后变成 _data 的过程，用到了 Object.defineProperty

【6】计算属性 及 watch 侦听

**计算属性**的特点：

要用的数据不存在，要通过已有属性计算得来; 在 computed 对象中定义计算属性; 在页面中使用 {{方法名}} 来显示计算的结果

计算属性最终会出现在 vm 上，直接读取使用即可

1 只有依赖的属性更新后，才会执行

2 执行完后有缓存功能，下一次使用时直接走缓存，不会再执行代码 - methods 不同，没有缓存

原理：底层借助了 Object.defineProperty 方法提供的 getter 和 setter

get set 的用法

​	如果初始被读取 或 所依赖的属性变化时，get 被调用

​	如果给computed的属性赋值，必须通过 set 函数去响应修改，且 set 中要引起计算时依赖的数据发生变化

计算属性的完整写法：

```vue
computed: {
        fullName: {
          get() {
            return this.lastName + " " + this.firstName
          },
          set(newValue) {
            strArr = newValue.split(" ")
            this.lastName = strArr[0]
            this.firstName = strArr[1]
          }
        }
      },
```

如果不需要 set，可以简写为：

```vue
computed: {
	// 此处的 函数 就跟完整写法的 get 一样去用
        fullName() {
            return this.lastName + " " + this.firstName
          }
        }
```

**watch** 属性

需求：input 框中的输入值改变触发的一些逻辑操作

没有return值的使用 watch 属性，并且可以使用异步操作

当被侦听的属性改变时，回调函数自动调用，进行相关操作

侦听的属性必须存在，才能进行监视

data 中的属性可以被监视，computed 下面的计算属性也可以

watch  配置项方式 + vm.$watch api调用 两种写法 均可

深度侦听

Vue 中的 watch 默认不侦听对象内部值的改变（一层）

配置 deep:true 可以侦听对象内部值改变（多层）

Vue 自身可以侦听对象内部值的改变，但 Vue 提供的 watch 默认不可以

使用 watch 时根据数据的具体结构，决定是否使用深度侦听

侦听多级结构中某个属性的变化 

```vue
watch: {
	isHot : {...}
	'numbers.a' : {
    handler() {
      console.log('a changed')
    }
  }
}
```

watch 侦听多级结构中所有属性的变化  - deep: true

```vue
watch: {
	isHot : {...}
	numbers : {
		deep: true,
    handler() {
      console.log('a or b changed')
    }
  }
}
```

 在不需要 immediate, deep 的时候，可以进行简写，只保留处理函数的实现

```vue
watch: {
	numbers(newV, oldV) : {
		console.log('changed')
  }
}
// 或者
vm.$watch('numbers', function(newV, oldV){
	console.log('changed')
})
// 注意 - vm.$watch 第二个参数不能使用箭头函数，与 this 指向有关
```
// 如果需要过1s钟才更新 fullName

watch 可以通过 setTimeout() 开启异步任务，但 computed 中不能


定时器中开启的回调函数是不受 Vue 控制的，而是 浏览器 定时器管理模块 控制，定时器到点了由 JS 引擎调用

小抄之：computed 和 watch 之间的区别：
 1. computed 能完成的任务，watch 都可以完成
 2. watch 能完成的功能，computed 不一定能完成，例如: watch 可以进行异步操作
两个重要的小原则：
 1. 所有被 Vue 管理的函数，最好写成普通函数，这样 this 的指向才是 vm 或 组件实例对象
 2. 所有不被 Vue 管理的函数（定时器的回调函数、ajax 的回调函数、Promise de回调函数等），最好写成箭头函数，这样 this 的指向才是 vm 或组件实例对象 

Vue 监测对象的原理：依赖 Setter


【7】filter 过滤器及样式变换 ?

upperCase 的使用举例 {{msg | upperCase}}，写在 filters 里面的函数

多个 style 可以同时使用，style 和 v-bind:style 会进行融合，同时起作用

通过改变类 来 改变样式，第一种方式：显示/隐藏；第二种：改变类名

过滤器：

对要显示的数据进行特定格式化后再显示（适用于一些简单逻辑的处理）

语法：

1. 注册过滤器：Vue.filter(name, callback) 或 new Vue(filters:{})

2. 使用过滤器：{{ xxx | 过滤器 }} 或 v-bind:属性 = "xxx | 过滤器名"

备注：

1. 过滤器也可以接收额外参数、多个过滤器也可以串联
2. 并没有改变原本的数据，是产生新的对应的数据

【7-1】内置指令

v-bind, v-model, v-for, v-on, v-if, v-else, v-show 

v-text：

1. 向其所在的节点中渲染文本内容
2. 与插值语法的区别：v-text 会替换掉节点中的内容，{{xx}}不会

```vue
<div>你好，{{name}}</div>
// name 属性的值会替换掉 "你好，"
<div v-text="name">你好，</div>
```

v-html:

1. 向指定节点中渲染包含 html 结构的内容

2. 与插值语法的区别：

   （1）v-html 会替换掉节点中所有的内容，{{xx}}则不会

   （2）v-html 可以识别 html 结构

3. 注意：v-html 有安全性问题!!!

   （1）在网站上动态渲染任意 HTML 是非常危险的，容易导致 XSS 攻击

   （2）一定要在可信的内容上使用 v-html，永不要在用户提交的内容上！

待补：Node / cookie 的工作原理 --> 41/168

v-cloak 指令（没有值）:

1. 本质是一个特殊属性，Vue 实例创建完毕并接管容器后，会删除 v-cloak 属性
2. 使用 css 配合 v-cloak 可以解决网速慢时页面展示出 {{xxx}} 的问题

v-once 指令：

1. 所在节点在初次动态渲染后，就视为静态内容了
2. 以后数据的改变不会引起 v-once 所在结构的更新，可以用于优化性能

v-pre 指令：

1. 跳过其所在节点的编译过程
2. 可利用它跳过：没有使用指令语法、没有使用插值语法的节点，会加快编译

【7-2】自定义指令

一、定义语法：

（1）局部指令

​		new Vue({

​		  directives:{指令名：配置对象}

​		})

​		或

​		new Vue({

​			directives:{指令名：回调函数}

​		})

（2）全局指令

​		Vue.directive(指令名, 配置对象)

​		或：Vue.directive(指令名, 回调函数)

二、配置对象中常用的回调：

（1）bind - 指令与元素成功绑定时调用

（2）inserted - 指令所在元素被插入页面时调用

（3）update - 指令所在模板结构被重新解析时调用

三、备注：

1. 指令定义时不加 v-，但使用时要加 v-
2. 指令名如果是多个单词，要使用 kebab-case 命名方式，不要用 camelCase 命名

待补：console.dir()

console.log(a instanceof HTMLElement)

element.focus()

【7-3】生命周期

待补：< h2 :style="{opacity:opacity}">Welcome< /h2>

又名：生命周期回调函数、生命周期函数、生命周期钩子

是 Vue 在关键时刻帮我们调用的一些特殊名称的函数

函数名字不可更改，但函数的具体内容是程序员根据需求编写的

生命周期函数中的 this 指向是 vm 或 组件实例对象

待补：debugger

常用的生命周期钩子：

1. mounted：发送ajax请求、启动定时器、绑定自定义事件、订阅消息等【初始化操作】
2. beforeDestroy：清除定时器、解绑自定义事件、取消订阅消息等【收尾工作】

关于销毁 Vue 实例：

1. 销毁后借助 Vue 开发者工具看不到任何信息
2. 销毁后自定义事件会失效，但原生 DOM 事件依然有效
3. 一般不会在 beforeDestroy 中操作数据，因为即使操作数据，也不会再触发更新流程了

【8】组件化开发

可以协作开发，代码复用

组件 - 自定义标签

饿了么组件库：element.eleme.io

template 模版 - 会覆盖掉 html 模版 / 主要用在组件里面

```vue
new Vue({
  el: "#app", 告诉下面的模版要覆盖到哪里去
  template: '<div>Lisa</div>'
})
```

8.1 注册一个局部组件，定义好的组件只能在该实例中使用

```html
	<div id="app">
	    <runoob></runoob>
	</div>
	 
	<script>
	var Child = {
	  template: '<h1>Self-defined component</h1>'
	}
	 
	new Vue({
	  el: '#app',
	  components: {
	    // <runoob> can only be used in parent's template
	    'runoob': Child
	  }
	})
</script>
```

html模版：在 html 中写 js

```vue
<div id="wrap">
    <p>Your name is:{{list.name}}</p>
</div>
<script>
    var list = {
        name:"donna",
        age:20
    }
    var vm = new Vue({
        el:"#wrap",
        data:{list}
    });
</script>
```

字符串模板 template：在 js 中写 dom
```vue
<div id="wrap">

</div>
<script type="x-template" id="app">
    <div>
        <p>你的名字是{{list.name}}</p>
    </div>
</script>
<script>
    var list = {
        name:"donna",
        age:20
    }
    var vm = new Vue({
        el:"#wrap",
        data:{list},
        template:"#app"
    });
</script>
```


常规方法想要将一组class替换成 template，没有办法做到

如何实现可以多次渲染某 dom 节点？ -- 组件化开发 的思想

Vue 定义的组件必须在 vue的实例里面使用

8.2 注册一个全局组件语法: Vue.component(tagName, options)
全局注册的行为必须在根 Vue 实例 (通过 new Vue) 创建之前发生

```vue
<body>
  <div id="app">
    <my-component></my-component>
    <my-component></my-component>
    <my-component></my-component>
  </div>
  <script>
    Vue.component("my-component",
      {
        template: // custom component has one root node
          `<div>
          <h1>Contact Info</h1>
          <p>12345345</p>
        </div>`
      }
    )
    new Vue({
      el: "#app"
    })
  </script>
</body>
```

component 里面也可以有 methods

```vue
<body>
  <div id="app1">
    <my-component></my-component>
  </div>
  <div id="app2">
    <!-- my-component wii not be rendered successfully in app2 -->
    <my-component></my-component>
  </div>
  <script>
    var component = {
      template:
        `<div>
          <button @click="clickMe">{{count}}</button>
        </div>`,
      data: function () {
        return {
          count: 0
        }
      },
      methods: {
        clickMe: function () {
          this.count++
        }
      }
    }
    // define a local component
    new Vue({
      el: "#app1",
      components: {
        "my-component": component
      }
    })
    new Vue({
      el: "#app2"
    })
  </script>
</body>
```

 vue.js:584 [Vue warn]: Unknown custom element: <my-component> - did you register the component correctly? For recursive components, make sure to provide the "name" option.

(found in <Root>)

当使用 kebab-case (短横线分隔命名) 定义一个组件时，你也必须在引用这个自定义元素时使用 kebab-case，例如 <my-component-name>;

当使用 PascalCase (首字母大写命名) 定义一个组件时，<my-component-name> 和 <MyComponentName> 均可，在 DOM (即非字符串的模板) 中使用时只能用前者; 



【9】Props
功能：让组件接收外部传进来的数据
（1）传递数据：
	< Demo name='xxx'/>
（2）接收数据：三种方式，如下代码

备注：
props是只读的，Vue底层会检测对props的修改，如果进行了修改，就会发出警告，若业务需求确实需要修改，那么请复制props的内容到data中一份，然后再去修改data中的数据
props 先处理，然后再准备 data
key，ref 不能使用作为 prop 的名称

```
  // 第一种：字符串数组形式列出
  props: ['title', 'likes', 'isPublished', 'commentIds', 'author']

  // 第二种：对象形式列出 接收的同时对数据进行类型限制 
  props: {
    title: String,
    likes: Number,
    isPublished: Boolean,
    commentIds: Array,
    author: Object,
    callback: Function,
    contactsPromise: Promise // or any other constructor
  }
  
  // 第三种：最完整的对象形式列出 接收的同时对数据进行:类型限制、默认值的指定、必要性的限制
  props: {
    title: {
      type: String, 
      required: true
    },
    likes: {
      type: Number,
      default: 10
    },
    ...
  }
   
  <!-- 传入数字 42，这是一个 JavaScript 表达式而不是一个字符串。-->
  <blog-post v-bind:likes="42"></blog-post>
  
  <!-- 传入数组，这是一个 JavaScript 表达式而不是一个字符串 -->
  <blog-post v-bind:comment-ids="[234, 266, 273]"></blog-post>
  
  <!-- 传入对象，这是一个 JavaScript 表达式而不是一个字符串。-->
  <blog-post
    v-bind:author="{
      name: 'Veronica',
      company: 'Veridian Dynamics'
    }" 
  ></blog-post>
  
  <!-- 用不带参数的 v-bind 将一个对象的所有 property 作为 prop 传入 -->
  post: {
    id: 1,
    title: 'My Journey with Vue'
  }
  <blog-post v-bind="post"></blog-post>
  等价于： 
  <blog-post
    v-bind:id="post.id"
    v-bind:title="post.title"
  ></blog-post>
```


组件可以接受任意的 attribute，这些 attribute 会被添加到这个组件的根元素上 -- 非 prop 的 attribute 

对于绝大多数 attribute 来说，从外部提供给组件的值会替换掉组件内部设置好的值; class 和 style attribute 会把两边的值合并起来

如果不希望组件的根元素继承 attribute，可以在组件的选项中设置 inheritAttrs: false, 但该选项不会影响 style 和 class 的绑定

【10】mixin
功能：可以把多个组件共用的配置提取成一个混入对象
使用方式：
  第一步定义混合，例如：
  ```
  export const xxx = {
    data(){...},
    methods:{...}
    ...
  }
  ```
  第二步使用混入，例如：
  （1）全局混入：Vue.mixin(xxx)
  （2）局部混入：mixins:[xxx]

复用配置

混合 和 data、methods 中出现的同名数据或方法，以data、methods中的为准

对于生命周期钩子来说，都有效，混合中的先调用，自己组件中的后调用

【11】-- $
```js
	var data = { a: 1 }
	var vm = new Vue({
	  el: '#example',
	  data: data
	})

	vm.$data === data // => true
	vm.$el === document.getElementById('example') // => true

	// $watch is a method
	vm.$watch('a', function (newValue, oldValue) {
	  // This will be called when `vm.a` changes
	})
```

【12】- $emit(eventName)

触发的事件名需要完全匹配监听这个事件所用的名称，推荐使用 kebab-case 的事件名

如果你想在某个组件的根元素上监听一个原生事件。可以使用 .native 修饰 v-on 。例如：

```vue
<my-component v-on:click.native="doTheThing"></my-component>
```
自定义组件上的 v-model 默认会利用名为 value 的 prop 和名为 input 的事件

但是像单选框、复选框等类型的输入控件可能会将 value attribute 用于不同的目的。model 选项可以用来避免这样的冲突 ?

```vue
Vue.component('base-checkbox', {
  model: {
    prop: 'checked',
    event: 'change'
  },
  props: {
    checked: Boolean
  },
  template: `
    <input
      type="checkbox"
      v-bind:checked="checked"
      v-on:change="$emit('change', $event.target.checked)"
    >
  `
})

<base-checkbox v-model="lovingVue"></base-checkbox>

```
.sync ?

【13】- Vue Mastery-Vue Router Basics

It is a best practice to put components that get loaded by Vue Router in the Views directory.

```vue
<router-link to="/">Home< /router-link>
<router-link :to="{name: "home"}">Home< /router-link>
```

router-link : a compoent which creates a link to navigate to a router.

Named Routes

changing route from /about to /about-us

```vue
// method 1
routes:[
	{
		path: "/about-us",
    name: "about",
    component: About
	},
	{
    path: "/about",
    redirect: {name: "about"}
  }
]

// method 2
routes:[
	{
		path: "/about-us",
    name: "about",
    component: About,
		alias: "/about"
	}
}
```

【14】- class 与 style 绑定

在应用界面中，某个（些）元素的样式是变化的
class / style 绑定就是专门用来实现动态样式效果的技术

class样式
:class = 'xxx' 
  表达式是字符串：'classA' - 适用于样式的类名不确定，需要动态指定
  表达式是对象：{classA:isA, classB:isB} - 适用于要绑定的样式个数和名字都确定，但要动态决定用不用
  表达式是数组：['classA', 'classB']  - 适用于要绑定的样式个数不确定、名字也不确定

style样式
  :style="{fontSize: XXX}" 其中 XXX 是动态值
  :style="[a, b]" 其中 a,b 是样式对象, 样式对象中的 key 值有范围,得是存在的 css 属性，不能想写啥写啥

scoped 样式

  作用：让样式在局部生效，防止冲突

  写法：< style scoped>

【15】- v-model 收集表单数据

【16】模块与组件

模块：

1. 理解：向外提供特定功能的 js 程序，一般就是一个 js 文件
2. 为什么：js 文件很多很复杂
3. 作用：复用 js，简化 js 的编写，提高 js 运行效率

当应用中的 js 都以模块来编写的，那这个应用就是一个模块化的应用

组件： 

1. 理解：用来实现局部（特定）功能效果的代码集合（html/css/js/image...）
2. 为什么：一个界面的功能很复杂
3. 作用：复用编码，简化项目编码，提高运行效率

当应用中的功能都是多组件的方式来编写的，那这个应用就是一个组件化的应用

【16-2】非单文件组件

一个文件中包含有多个组件 *.html，弊病：样式不能跟着组件走

Vue 中使用组件的三大步骤：

​	一、定义组件（创建组件）

​	二、注册组件

​	三、使用组件（写组件标签）

一、如何定义一个组件？

​	使用 Vue.extend(options) 创建，其中 options 和 new Vue(options) 时传入的那个 options 几乎一样，但也有点区别：

	1. el 不要写，为什么？ --- 最终所有的组件都要经过一个 vm 的管理，由 vm 中的 el 决定服务哪个容器 
	1. data 必须写成函数，为什么？ --- 避免组件被复用时，数据存在引用关系

​	备注：使用 template 可以配置组件结构

二、如何注册组件？

1. 局部注册：new Vue 的时候传入 components 选项
2. 全局注册：Vue.component('组件名', 组件)

三、编写组件标签：

​	< school>< /school>

**组件命名**：

​	一个单词组成：

​		第一种写法（首字母小写）：school

​		第二种写法（首字母大写）：School

​	多个单词组成：

​		第一种写法（kebab-case）：my-school

​		第二种写法（CamelCase）：MySchool（需要 Vue 脚手架支持）

​	备注：

​	（1）组件名尽可能回避 HTML 中已有的元素名称，例如：h2、H2都不行

​	（2）可以使用 name 配置项指定组件在开发者工具中呈现的名字

**组件标签**：

​	第一种写法：< school>< /school>

​	第二种写法：< school/> 

​	备注：不使用脚手架时，< school/> 会导致后续组件不能渲染

**一个简写方式**：

​	const school = Vue.extend(options) 可简写为：const school = options

【16-3】VueComponent 构造函数

1. school 组件本质是一个名为 VueComponent 的构造函数，且不是程序员定义的，是 Vue.extend 生成的

2. 我们只需写 < school/> 或 < school>< /school>，Vue 解析时会帮我们创建 school 组件的实例对象

3. 特别注意：每次调用 Vue.extend，返回的都是一个全新的 VueComponent

4. 关于 this 指向

   （1）组件配置中：data 函数、methods 中的函数、watch 中的函数、computed 中的函数 它们的 this 均是 VueComponent 实例对象

   （2）new Vue(options)配置中：data 函数、methods 中的函数、watch 中的函数、computed 中的函数 它们的 this 均是 Vue 实例对象

5. VueComponent 的实例对象，以后简称 vc（组件实例对象），Vue 的实例对象，简称 vm

【16-4】一个重要的内置关系

1. VueComponent.prototype.__ proto__ === Vue.prototype
2. 为什么要有这个关系：让组件实例对象 (vc) 可以访问到 Vue原型上的属性、方法

【16-5】单文件组件

一个文件中只包含一个组件 *.vue

<+v -- 快速输入 vue / template + script + style

待复习：ES6 模块化

【17】CLI - Command Line Interface

第一步：（仅第一次执行）[Installation]

```
$ npm install -g @vue/cli
$ vue --version
@vue/cli 5.0.8
```

 第二步：切换到你要创建项目的目录，然后使用命令创建项目

```vue
$ vue create xxxx
```

第三步：启动项目

```vue
$ npm run serve
```

http://localhost:8080/ 开启了内置小服务器，端口在 8080

http://192.168.51.200:8080/ 给同局域网内的其他人使用



build：所有功能开发完，编译生成 .html .css .js文件，把整个工程变成浏览器认识的，最后的一次编译

lint：把所有 .js .vue 进行语法检查，平时开发不使用

package-lock.json: 包版本控制文件，后面安装时可以最快速度安装好需要的特定版本

chrome://settings/content/javascript -- 取消浏览器对 js 的支持

```vue
// main.js
import Vue from 'vue' -- 这种方式引入的是 node_modules / vue / package.json 第6行 "module":  "dist/vue.runtime.esm.js"

// The following code can cause some problems
new Vue({
  el: "#root",
  template: `<App/>`,
  components: { App }
})

```
You are using the runtime-only build of Vue where the template compiler is not available.
Either pre-compile the templates into render functions
Or use the compiler-included build

【17-1】  render 函数
Vue = Vue 核心 + 模板解析器 (1/3 体积)
运行时 Vue 都不包括 模板解析器
dist/vue.js - 完整版
dist/vue.runtime.esm.js - ES module 版 

.vue 中的 < template> 由 vue-template-compiler 解析
vm 中的 template 选项交给 render 去处理

关于不同版本的 Vue：
  1. vue.js 与 vue.runtime.js 的区别:

    （1）vue.js 是完整版的 Vue,包含 Vue 核心 + 模板解析器 (1/3 体积)
    （2）vue.runtime.xxx.js 是运行版的 Vue，只包含 Vue 核心，不包括 模板解析器
  2. 因为 vue.runtime.xxx.js 没有模板解析器，所以不能使用 template 配置项，需要使用 render 函数接收到的 createElement 函数去指定具体内容

【17-2】  默认配置修改
Vue 隐藏了重要的配置文件，查看具体的 webpack 配置，执行
```bash
vue inspect > output.js
ERROR  Failed to locate @vue/cli-service.
Note that `vue inspect` is an alias of `vue-cli-service inspect`
        and can only be used in a project where @vue/cli-service is locally installed.
        
$ nvm use 18
$ npm install
$ vue inspect > out.js 
  working !!! 
```
官网参考：cn.vuejs.org / 生态系统 / Vue CLI / 配置参考 -- 左侧目录里出现的都是可以修改的

vue.config.js --输送给--> webpack
                           |基于
                         NodeJS --use--> CommonJS

【18】ref 属性

被用来给元素或者子组件注册引用信息（id的替代者）

应用在 html 标签上获取的是真实 DOM 元素，应用在组件标签上得到的是组件实例对象（vc）

使用方式：打标识: ref='xxx' + 获取：this.$refs.xxx

```
<p ref='pref'>This is to show how to use ref</p>
mounted() {
    this.$refs.pref.innerHTML = "Has been mounted successfully";
  },
```

【19】插件

功能：用于增强 Vue

本质：包含 install 方法的一个对象，install 的第一个参数是 Vue，第二个以后的参数是插件使用者传递的数据

定义插件：

  对象.install = function (Vue, options) {

​    //1. 添加全局过滤器

​    Vue.filter(...)

​    //2. 添加全局指令

​    Vue.directive(...)

​    //3. 配置全局混入

​    Vue.mixin(...)

​    //4. 添加实例方法

​    Vue.prototype.$myMethod = function() {...}

​    Vue.prototype.$myProperty = xxx

  }

使用插件：Vue.use(对象)

[Vue devtools] 

[Bootstrap]

```
 |---+--- Vanilla.js  ------
 |	                    |--->Vue
 |---+---  jQuery     ------
 |                     
 |
 ----<------  Bootstrap    -----X
                  |             |
                  V             | 
	Bootstrap v4 + Vue.js   | 
	     |                  X
	     | based            |
	     V                  |
	  jQuery <--------------X
```
BootStrap     includes CSS files, 
BootStrapVue  includes components

### 风格指南
模板中简单的表达式 - 组件模板应该只包含简单的表达式，复杂的表达式应该重构为计算属性或方法

