# iOS基础代码

## 结构与架构
### 文件目录分类
        *以一个基础的电商项目来解释，4个tabbarItem对应着四大模块，首页、分类、购物车、个人中心，往下每个还可以细分为MVC+Session层
        *按项目架构来分: 最外层为Model、View、Controller、Session层,内部才是业务模块
### 第三方库管理
        *手动管理
        手动维护各种第三方库，适合于已经趋于稳定、极少Bug的三方库
        *CocoaPods
        *Carthage
        这里更推荐使用Carthage,因为它对项目的侵入性最小，而且是去中心化管理，不需要等待漫长的pod update / install过程.不过各有各的好处,使用CocoaPods简单粗暴,基本不需要额外设置什么,看自己需求吧
### 项目架构
        *MVC
        *MVVM
        *MVP
        *响应式编程框架(如 ReactiveCocoa或者RxSwift)
## 崩溃&性能调优
    1. 代码规范，定期code review了吗
    2. 复杂列表的滚动时FPS可以保持在60帧左右吗？
    3. 页面加载渲染的耗时能不能进一步减小？
    4. 网络缓存有做吗，UIWebView / WKWebView的常用静态资源做缓存了吗
    5. App的启动时间可以在保持最小业务逻辑的同时再减小一点吗
### UITest & UnitTest
当开发完新需求的时候，在提测之前我们最好编写下UITest和UnitTest,覆盖主业务流程即可，可以提高我们的提测质量，减小一些可见的Bug，再加上冒烟用例,最大程度上提高我们提测的质量(成为KPI之王)，而且上线之后这些单元测试和UITest组件的脚本可以配合自动化测试定期进行回归测试，提高App的质量，减少崩溃率
### NullSafe
@implementation NSMutableDictionary (NullSafe)
- (void)swizzleMethod:(SEL)origSelector withMethod:(SEL)newSelector
{
Class class = [self class];
Method originalMethod = class_getInstanceMethod(class, origSelector);
Method swizzledMethod = class_getInstanceMethod(class, newSelector);
BOOL didAddMethod = class_addMethod(class,
origSelector,
method_getImplementation(swizzledMethod),
method_getTypeEncoding(swizzledMethod));
if (didAddMethod) {
class_replaceMethod(class,
newSelector,
method_getImplementation(originalMethod),
method_getTypeEncoding(originalMethod));
} else {
method_exchangeImplementations(originalMethod, swizzledMethod);
}
}
+ (void)load {
static dispatch_once_t onceToken;
dispatch_once(&onceToken, ^{
id obj = [[self alloc] init];
[obj swizzleMethod:@selector(setObject:forKey:) withMethod:@selector(safe_setObject:forKey:)];
});
}
- (void)safe_setObject:(id)value forKey:(NSString *)key {
if (value) {
[self safe_setObject:value forKey:key];
}else {
NullSafeLogFormatter(@"[NSMutableDictionary setObject: forKey:], Object cannot be nil")
}
}
这种解决方法可以避免诸如数组取值越界、字典传空值、removeObjectAtIndex等错误
​​
​​### ​监控系统
​​目前大多数App都集成了第三方统计库，常见的比如腾讯的Bugly、友盟的U-App等等
​​■ CPU、内存、FPS记录及保存
​​`CPU`、`FPS`、`Memory占用`网上都有现成的方法获取到这三个参数,这三个属于性能监控，可以定时记录，比如10S记录一次到本地文件中，每次打开App上传昨天的日志。这就要自己制定日志上传的策略了
​​■ 卡顿日志收集
​​■ 从容崩溃，上传崩溃日志
​​■ 性能调优&App体验优化
​​● 懒加载的利与弊
​​懒加载适用于一些可能不会加载的页面，比如弹框、空数据页面之类的，使用得当可以避免内存暴涨，使用不好，比如在必定会弹出的页面中使用懒加载可能会在增加页面响应时间，所以使用懒加载一定要注意使用场景，避免产生副作用
​​● 避免使用重绘
​​重写 drawRect 或者 drawReact:inContext方法会默认创建一个图层上下文，图形上下文所需要的内存为图层宽 * 图层高 * 4字节，图层每次进行重绘时都需要抹掉内存重新分配，会产生巨大的性能开销
​​● App体验优化
​​○ UITableViewCell 使用不当造成滑动卡顿
​​○ 大量cornerRadius和maskToBounds一起使用造成的离屏渲染造成的性能问题
​​○ 网络请求操作没有任何状态展示，比如加载框、按钮置灰等
​​○ 网络请求没有进行缓存
​​● 网络请求优化
​​○ DNS映射
​​■ 降低DNS请求带来的延迟
​​客户端app的请求第一步都是DNS解析，但由于cache的存在使得大部分的解析请求并不会产生任何延迟。各品台都有自己的cache过期策略。像iOS系统一般是24小时之后会过期，还有进入飞行模式再切回来，开关机，重置网络设置等也会导致DNS cache的清除。所以一般情况下用户在第二天打开你的app都会经历一次完整的DNS解析请求，网络情况差的时候会明显增加应用请求的总耗时。如果能直接跳过DNS解析这一步，当然能提升网络性能了
​​■ 预防DNS劫持
​​DNS劫持指的是改变DNS请求的返回结果，将目的ip指向另一个地址。一般有两种方式，一是通过病毒的方式改变本机配置的DNS服务器地址，而是通过攻击正常DNS服务器而改变其行为。不管是哪种方式，都会影响app本身的业务请求。如果遇到恶意的攻击还会衍生出各种安全问题。客户端自己做DNS与ip地址的映射就跨过了解析，让劫持者无从下手
​​■ 服务器动态部署
​​DNS映射实际是模拟了DNS请求的解析行为。如果客户端将自己的位置信息诸如ip地址，国家码等加入映射文件的请求参数当中，服务器就可以根据客户端所处的位置不同，下发距离其物理位置最近的server ip地址，从而减小整体网络请求的延迟，实现一定程度的服务器动态部署
​​■ 如何设计自己的DNS映射机制
​​● 一个打包到app包里面的默认映射文件，这样可以避免第一次去服务器取配置文件带来的延迟
​​● 有一个定时器能每隔一段时间从服务器获取最新的映射，并覆盖本地
​​● 每次取到最新的映射文件之后，同时把上一次的映射文件保存起来作为替补，一旦出现线上配置失误不至于导致请求无法处理
​​● 如果映射文件不能处理域名，要能回滚使用默认的DNS解析服务
​​● 如果一个映射过后的ip持续导致请求失败，应该能从机制上保证这个ip地址不再使用。也就是需要一个无效映射淘汰机制
​​● 无效的ip地址能及时上报到服务器，及时发现问题更新映射文件
​​○ 请求压缩
​​DNS查询之后是TCP握手建立连接，并发送请求数据。对于TCP来说，单个IP包大小受限于MSS值，大部分用户所处网络环境下每个包的大小约在1.5KB，新建立的HTTP连接由于TCP的slow start特性，会导致本地的部分IP包本临时缓存，从而增加了整体request的延迟。所以我们应该尽可能尝试去压缩我们的网络请求业务数据，减少一个Request的IP包数量，或许可以让用户少经历一个RTT，降低请求延迟的用户感知
​​○ 请求合并
​​对于非关键性的业务数据，或者对实时性要求不高的请求来说，通过合并请求的方式可以减少和服务器交互的次数，一则降低服务器压力，二则合并之后再压缩能节约客户端的流量。这类请求一般见于打点SDK，crash日志收集等非业务型请求
​​○ 请求的安全性
​​■ base64加密
​​■ POST加密
​​■ Token值介绍
​​登录令牌,利用token值来判断用户的登录状态。用户登录成功之后.在服务端会根据用户信息生成一个唯一的值,这个值就是token值
​​■ MD5加密
​​用于数字签名、安全访问认证
​​■ 时间戳密码
​​动态密码
​​■ 钥匙串访问
​​纯C语言,使用AES256加密算法,第三方框架SSKeychain,只有苹果知道保存在哪,保证安全
​​■ 指纹识别
​​○ 合理的并发数
​​有些业务场景会出现多个Request集中产生的情况，此时我们需要设置一个合理的并发数。并发数如果太小，会导致“劣质”的请求block住“优质”的请求。如果并发数太大，带宽有限的场景下，会增加请求的整体延迟
​​○ 可靠性保障
​​■ 关键核心的业务数据，期望能100%送达服务器
​​■ 重要内容请求，需要较高的请求成功率
​​■ 一般性内容请求，对成功率无要求
​​○ 多通道
​​■ HTTP
​​■ TCP
​​■ UDP
​​○ 网络环境监控
​​■ 监控团队开发基于端到端的客户端监控平台, 通过基于命令字的、多维度、实时的监控工具，可以及时发现线上问题
​​○ 请求成功率监控
​​○ 网络请求缓存优化
​​适用场景：一些更新频率较低的场景：比如个人中心
​​关于网络请求缓存，App端的网络请求对面到后端更多的是增删改查，这个方面需要和后端配合，是否资源改变即后端是否需要重新检索或修改数据，这个时候我们就需要一个value比如时间戳Last-Modified或者标识ETag来告知服务器自己当前的资源标记，目前常用的策略为：
​​以时间戳Last-Modified为例
​​App端第一次请求接口，服务端返回成功，HTTP Status为200，并且在返回的Header中用Last-Modified表明服务器中该资源最后被修改的时间
​​App端第二次请求该接口，Header中传递本地缓存的Header中的Last-Modified,如果服务器端的资源并未发生变化，则会返回HTTP Status为304，我们直接可以使用本地的缓存，传输流量更少，相对而言，用户的等待时间会更短


