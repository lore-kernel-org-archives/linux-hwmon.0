Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from smtpbg202.qq.com ([184.105.206.29]:58200 "EHLO smtpbg202.qq.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728280AbeKOSSE (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 15 Nov 2018 13:18:04 -0500
From: "=?utf-8?B?6ZmI5Y2O5omN?=" <chenhc@lemote.com>
To: "=?utf-8?B?R3VlbnRlciBSb2Vjaw==?=" <linux@roeck-us.net>
Cc: "=?utf-8?B?SmVhbiBEZWx2YXJl?=" <jdelvare@suse.com>,
        "=?utf-8?B?bGludXgtaHdtb24=?=" <linux-hwmon@vger.kernel.org>,
        "=?utf-8?B?RnV4aW4gWmhhbmc=?=" <zhangfx@lemote.com>,
        "=?utf-8?B?WWFvIFdhbmc=?=" <wangyao@lemote.com>
Subject: Re: [PATCH] hwmon: (w83795) temp4_type has writable permission
Mime-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: base64
Date: Thu, 15 Nov 2018 16:11:10 +0800
Message-ID: <tencent_73462BD43F9BC4D94258BB95@qq.com>
References: <1542249898-20406-1-git-send-email-chenhc@lemote.com>
        <20181115052320.GA5535@roeck-us.net>
In-Reply-To: <20181115052320.GA5535@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Qm90aCBkYXRhc2hlZXQgYW5kIHRoZSBjb21tZW50cyBvZiBzdG9yZV90ZW1wX21vZGUoKSB0
ZWxsIHVzIHRoYXQgdGVtcDF+NCBpcyB3cml0YWJsZSwgc28gZml4IGl0Lg0KDQpIdWFjYWkN
CiANCi0tLS0tLS0tLS0tLS0tLS0tLSBPcmlnaW5hbCAtLS0tLS0tLS0tLS0tLS0tLS0NCkZy
b206ICAiR3VlbnRlciBSb2VjayI8bGludXhAcm9lY2stdXMubmV0PjsNCkRhdGU6ICBUaHUs
IE5vdiAxNSwgMjAxOCAwMToyMyBQTQ0KVG86ICAiSHVhY2FpIENoZW4iPGNoZW5oY0BsZW1v
dGUuY29tPjsNCkNjOiAgIkplYW4gRGVsdmFyZSI8amRlbHZhcmVAc3VzZS5jb20+OyAibGlu
dXgtaHdtb24iPGxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZz47ICJGdXhpbiBaaGFuZyI8
emhhbmdmeEBsZW1vdGUuY29tPjsgIllhbyBXYW5nIjx3YW5neWFvQGxlbW90ZS5jb20+Ow0K
U3ViamVjdDogIFJlOiBbUEFUQ0hdIGh3bW9uOiAodzgzNzk1KSB0ZW1wNF90eXBlIGhhcyB3
cml0YWJsZSBwZXJtaXNzaW9uDQogDQpPbiBUaHUsIE5vdiAxNSwgMjAxOCBhdCAxMDo0NDo1
N0FNICswODAwLCBIdWFjYWkgQ2hlbiB3cm90ZToNCj4gU2lnbmVkLW9mZi1ieTogWWFvIFdh
bmcgPHdhbmd5YW9AbGVtb3RlLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSHVhY2FpIENoZW4g
PGNoZW5oY0BsZW1vdGUuY29tPg0KDQpTb3JyeSwgdGhhdCByZWFsbHkgbGFja3MgY29udGV4
dC4gUGxlYXNlIGFkZCBzb21lIGRldGFpbHMuDQoNCkd1ZW50ZXINCg0KPiAtLS0NCj4gIGRy
aXZlcnMvaHdtb24vdzgzNzk1LmMgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2h3
bW9uL3c4Mzc5NS5jIGIvZHJpdmVycy9od21vbi93ODM3OTUuYw0KPiBpbmRleCA0OTI3NmJi
Li4xYmI4MGY5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2h3bW9uL3c4Mzc5NS5jDQo+ICsr
KyBiL2RyaXZlcnMvaHdtb24vdzgzNzk1LmMNCj4gQEAgLTE2OTEsNyArMTY5MSw3IEBAIHN0
b3JlX3NmX3NldHVwKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9hdHRyaWJ1
dGUgKmF0dHIsDQo+ICAgKiBzb21ld2hlcmUgZWxzZSBpbiB0aGUgY29kZQ0KPiAgICovDQo+
ICAjZGVmaW5lIFNFTlNPUl9BVFRSX1RFTVAoaW5kZXgpIHsJXA0KPiAtCVNFTlNPUl9BVFRS
XzIodGVtcCMjaW5kZXgjI190eXBlLCBTX0lSVUdPIHwgKGluZGV4IDwgNCA/IFNfSVdVU1Ig
OiAwKSwgXA0KPiArCVNFTlNPUl9BVFRSXzIodGVtcCMjaW5kZXgjI190eXBlLCBTX0lSVUdP
IHwgKGluZGV4IDwgNSA/IFNfSVdVU1IgOiAwKSwgXA0KPiAgc2hvd190ZW1wX21vZGUsIHN0
b3JlX3RlbXBfbW9kZSwgTk9UX1VTRUQsIGluZGV4IC0gMSksCVwNCj4gIFNFTlNPUl9BVFRS
XzIodGVtcCMjaW5kZXgjI19pbnB1dCwgU19JUlVHTywgc2hvd190ZW1wLAlcDQo+ICBOVUxM
LCBURU1QX1JFQUQsIGluZGV4IC0gMSksCVwNCj4gLS0gDQo+IDIuNy4wDQo+
