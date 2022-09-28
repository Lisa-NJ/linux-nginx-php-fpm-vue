camelCase (驼峰命名法)
kebab-case(短横线分隔命名)
PascalCase(首字母大写命名)

```

<p ref="p">This is to show how to use ref</p>

mounted() {
    this.$refs.p.innerHTML = "Has been mounted successfully";
  },
```
[Installation]
```
$ npm install -g @vue/cli
$ vue --version
@vue/cli 5.0.8
```

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

v-cloak 加载完 vue 库，{{}} 所在的 dom 被识别成 vue 认识的 html 模版后，v-cloak 会消失 

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

Vue 重写的数组方法：reverse, push, shift, splice, 

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

【9】Prop 类型
```
  // 字符串数组形式列出
  props: ['title', 'likes', 'isPublished', 'commentIds', 'author']

  // 对象形式列出
  props: {
    title: String,
    likes: Number,
    isPublished: Boolean,
    commentIds: Array,
    author: Object,
    callback: Function,
    contactsPromise: Promise // or any other constructor
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
webpack：前端自动化构建工具

组件可以接受任意的 attribute，这些 attribute 会被添加到这个组件的根元素上 -- 非 prop 的 attribute 

对于绝大多数 attribute 来说，从外部提供给组件的值会替换掉组件内部设置好的值; class 和 style attribute 会把两边的值合并起来

如果不希望组件的根元素继承 attribute，可以在组件的选项中设置 inheritAttrs: false, 但该选项不会影响 style 和 class 的绑定

【10】?

单文件组件使用 及 CSS 作用域

vue-cli 生成一个项目，使用 bootstrap 后，不需要自己的样式，使用 bootstrap 的样式

html模板+template模板-->对象-->虚拟DOM，通过 render 调用

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

【15】- v-model 收集表单数据


【16】
【17】

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

