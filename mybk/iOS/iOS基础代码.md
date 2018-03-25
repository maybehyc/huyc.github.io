# iOS基础代码

防止block循环引用
__weak __typeof(self) weakSelf  = self;
self.block = ^{
__strong __typeof(self) strongSelf = weakSelf;
[strongSelf doSomeThing];
[strongSelf doOtherThing];
};


