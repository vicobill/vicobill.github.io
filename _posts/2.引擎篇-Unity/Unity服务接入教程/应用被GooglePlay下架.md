# Google Play应用下架解决办法

## 问题描述

如果您发布至Google Play的应用使用了Unity Ads，但未更新Privacy Policy说明其中使用了Advertising ID，您可能会收到Google的邮件提示您违反了相关条款，并导致应用被下架。

例如： `Violation of Usage of Android Advertising ID policy and section 4.8 of the Developer Distribution Agreement`

## 解决办法

如果您的应用已经提供了Privacy Policy，请在其正文中添加[Unity Privacy Policy](https://unity3d.com/legal/privacy-policy)的链接或内容。

如果您的应用未提供Privacy Policy，请直接在Google Play Console中添加[Unity Privacy Policy](https://unity3d.com/legal/privacy-policy)链接。或者使用[生成工具](https://app-privacy-policy-generator.firebaseapp.com/)制作一份，然后添加[Unity Privacy Policy](https://unity3d.com/legal/privacy-policy)的链接或内容。

### 更多信息

如果您拥有个人网站，可以直接将Privacy Policy以网页形式添加到个人网站，然后在您的应用中提供入口访问该Privacy Policy。

如果您没有个人网站，可以借助以下免费服务生成网页：

- https://www.wix.com/
- http://appreviewdesk.com/index.php?page=sample_websites

此外，您还需要在Google Play应用商店中提供相同的Privacy Policy。登陆Google Play Console后选择您的应用，依次点击Store presence -> Store listing，然后在最下方的Privacy Policy中填上对应的网页链接。

完成以上步骤后重新提交应用，等待审核即可。