# ZipperDown漏洞

盘古实验室在针对不同客户的iOS应用安全审计过程中，发现了一类通用的安全漏洞。该漏洞被发布在了[1]。经过盘古的分析，确认微博、陌陌、网易云音乐、QQ音乐、快手等流行应用受影响，另外还有大约10%的iOS应用应用可能受此漏洞的影响。

根据漏洞名称大概可以猜测出与zip文件有关，查询iOS上与解压相关资料可以看到，iOS并没有提供官方的unzip API函数，基本上现有的iOS app都是使用的SSZipArchive或ziparchive这两个第三方库来实现解压的功能。随后根据盘古在SSZipArchive项目的issue中提交的漏洞报告[2]可以大概确定漏洞原理是：使用第三方zip库在解压zip文件过程中没有考虑文件名中带有”../../”这样的情况，从而产生了目录穿越漏洞。因此，如果一个iOS 应用下载了恶意的zip文件，并且使用ziparchive库解压，利用漏洞可以做到app container目录下的任意文件覆盖，如果覆盖了应用重要的文件会造成应用崩溃（DOS），如果覆盖了app的hotpatch文件则会造成代码执行。

0x01 构造恶意的ZIP文件（POC）

## 防御方案
最完整的解决方案是对SSZipArchive库进行修补，在解压函数：

+ (BOOL)unzipFileAtPath:(NSString *)path toDestination:(NSString *)destination preserveAttributes:(BOOL)preserveAttributes overwrite:(BOOL)overwrite nestedZipLevel:(NSInteger)nestedZipLevel password:(nullable NSString *)password error:(NSError **)error delegate:(nullable id<SSZipArchiveDelegate>)delegate progressHandler:(void (^_Nullable)(NSString *entry, unz_file_info zipInfo, long entryNumber, long total))progressHandler completionHandler:(void (^_Nullable)(NSString *path, BOOL succeeded, NSError * _Nullable error))completionHandler

中对最终解压的strPath进行检测，如果出现可能造成目录穿越的”../”字符串时进行拦截。

另外，Hotpatch包除了传输过程中要加密外，在本地也需要加密保存，并且运行前做完整性校验。虽然漏洞覆盖某些重要的文件可能会造成拒绝服务攻击，但至少不会造成代码执行。

## 总结

正如JSPatch的作者bang所讲的：“攻击条件：1.APP用了ZipArchive 2.原APP下发的某个zip包传输过程没加密，zip包也没加密 3.原APP使用了JSPatch或其他执行引擎，且本地脚本没有加密，只要把脚本放指定目录即可执行 4.用户连上第三方wifi遭受攻击。恰好视频中的微博满足这些苛刻条件。危害很小，能被攻击的APP也很少。”

因此，能够造成代码执行的应用可能没有想象中那么多，但黑客依然有可能利用任意文件覆盖的漏洞能力对应用进行攻击，造成意想不到的效果。
