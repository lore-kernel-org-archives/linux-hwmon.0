Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-cys01nam02on0083.outbound.protection.outlook.com ([104.47.37.83]:7653
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753582AbeD3PjE (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 30 Apr 2018 11:39:04 -0400
From: "Ghannam, Yazen" <Yazen.Ghannam@amd.com>
To: Guenter Roeck <linux@roeck-us.net>, Borislav Petkov <bp@suse.de>
CC: Thomas Gleixner <tglx@linutronix.de>,
        Clemens Ladisch <clemens@ladisch.de>,
        "x86@kernel.org" <x86@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Woods, Brian" <Brian.Woods@amd.com>
Subject: RE: [PATCH 1/2] x86/amd_nb: Add support for Raven Ridge CPUs
Date: Mon, 30 Apr 2018 15:38:59 +0000
Message-ID: <MWHPR12MB1566866B2ACF36EAD7E4856AF8820@MWHPR12MB1566.namprd12.prod.outlook.com>
References: <1524966879-9424-1-git-send-email-linux@roeck-us.net>
 <20180429175305.GB19814@pd.tnic>
 <a4b1d937-c5b8-67d0-b5f0-312145fefc09@roeck-us.net>
In-Reply-To: <a4b1d937-c5b8-67d0-b5f0-312145fefc09@roeck-us.net>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHdWVudGVyIFJvZWNrIDxncm9l
Y2s3QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIEd1ZW50ZXIgUm9lY2sNCj4gU2VudDogU3VuZGF5
LCBBcHJpbCAyOSwgMjAxOCAyOjI0IFBNDQo+IFRvOiBCb3Jpc2xhdiBQZXRrb3YgPGJwQHN1c2Uu
ZGU+OyBHaGFubmFtLCBZYXplbg0KPiA8WWF6ZW4uR2hhbm5hbUBhbWQuY29tPg0KPiBDYzogVGhv
bWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+OyBDbGVtZW5zIExhZGlzY2gNCj4gPGNs
ZW1lbnNAbGFkaXNjaC5kZT47IHg4NkBrZXJuZWwub3JnOyBKZWFuIERlbHZhcmUgPGpkZWx2YXJl
QHN1c2UuY29tPjsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtaHdtb25A
dmdlci5rZXJuZWwub3JnOyBXb29kcywgQnJpYW4NCj4gPEJyaWFuLldvb2RzQGFtZC5jb20+DQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8yXSB4ODYvYW1kX25iOiBBZGQgc3VwcG9ydCBmb3IgUmF2
ZW4gUmlkZ2UgQ1BVcw0KPiANCj4gT24gMDQvMjkvMjAxOCAxMDo1MyBBTSwgQm9yaXNsYXYgUGV0
a292IHdyb3RlOg0KPiA+IE9uIFNhdCwgQXByIDI4LCAyMDE4IGF0IDA2OjU0OjM4UE0gLTA3MDAs
IEd1ZW50ZXIgUm9lY2sgd3JvdGU6DQo+ID4+IEFkZCBSYXZlbiBSaWRnZSByb290IGJyaWRnZSBh
bmQgZGF0YSBmYWJyaWMgUENJIElEcy4NCj4gPj4gVGhpcyBpcyByZXF1aXJlZCBmb3IgYW1kX3Bj
aV9kZXZfdG9fbm9kZV9pZCgpIGFuZCBhbWRfc21uX3JlYWQoKS4NCj4gPj4NCj4gPj4gU2lnbmVk
LW9mZi1ieTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0Pg0KPiA+PiAtLS0NCj4g
Pj4gVGhpcyBwYXRjaCBpcyBhIHByZXJlcXVpc2l0ZSBmb3IgdGhlIHNlY29uZCBwYXRjaCBpbiB0
aGUgc2VyaWVzLg0KPiA+PiBJJ2xsIGJlIGhhcHB5IHRvIGFwcGx5IGJvdGggcGF0Y2hlcyB0aHJv
dWdoIGh3bW9uIGlmIHRoYXQgaXMgYWNjZXB0YWJsZQ0KPiA+PiAoYW5kIENjOiBzdGFibGUgZm9y
IDQuMTYrKS4gSWYgbm90LCBJJ2xsIGJlIGhhcHB5IHRvIHdhaXQgZm9yIHRoaXMgcGF0Y2gNCj4g
Pj4gdG8gYmUgYXZhaWxhYmxlIHVwc3RyZWFtLg0KPiA+Pg0KPiA+PiBTaW5jZSB0aGF0IHRoZXJl
IGlzIG5vIHB1YmxpYyBkb2N1bWVudGF0aW9uIGF2YWlsYWJsZSBmb3IgUmF2ZW4gUmlkZ2UsDQo+
ID4+IFBDSSBJRHMgYXJlIGRlcml2ZWQgZnJvbSBvdXRwdXQgb2YgbHNwY2kuDQo+ID4+DQo+ID4+
ICAgYXJjaC94ODYva2VybmVsL2FtZF9uYi5jIHwgNiArKysrKysNCj4gPj4gICAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspDQo+ID4+DQo+ID4+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9r
ZXJuZWwvYW1kX25iLmMgYi9hcmNoL3g4Ni9rZXJuZWwvYW1kX25iLmMNCj4gPj4gaW5kZXggYzg4
ZTBiMTI3ODEwLi5iZDMzNjEzZWNiN2MgMTAwNjQ0DQo+ID4+IC0tLSBhL2FyY2gveDg2L2tlcm5l
bC9hbWRfbmIuYw0KPiA+PiArKysgYi9hcmNoL3g4Ni9rZXJuZWwvYW1kX25iLmMNCj4gPj4gQEAg
LTE0LDggKzE0LDExIEBADQo+ID4+ICAgI2luY2x1ZGUgPGFzbS9hbWRfbmIuaD4NCj4gPj4NCj4g
Pj4gICAjZGVmaW5lIFBDSV9ERVZJQ0VfSURfQU1EXzE3SF9ST09UCTB4MTQ1MA0KPiA+PiArI2Rl
ZmluZSBQQ0lfREVWSUNFX0lEX0FNRF8xN0hfUlJfUk9PVAkweDE1ZDANCj4gPg0KPiA+IEkgdGhp
bmsgdGhlIG5vbWVuY2xhdHVyZSB3ZSBkZWNpZGVkIHVwb24gYXQgdGhlIHRpbWUgd2FzDQo+ID4N
Cj4gPiAuLi5BTURfPGZhbWlseT5IX008bW9kZWw+SC4uLg0KPiA+DQo+ID4gUENJX0RFVklDRV9J
RF9BTURfMTVIX00xMEhfRjMsIGZvciBleGFtcGxlLg0KPiA+DQo+ID4gQW5kIGluIHRoaXMgY2Fz
ZSwgaXQgc2hvdWxkIGJlDQo+ID4NCj4gPiBQQ0lfREVWSUNFX0lEX0FNRF8xN0hfTTx3aGljaCBt
b2RlbCBpcyBSVj5IX0Y8UENJIGZ1bmN0aW9uDQo+IG51bWJlcj4NCj4gPg0KPiANCj4gTWFrZXMg
c2Vuc2UuDQo+IA0KPiA+IFlhemVuLCB3aGljaCBpcyB0aGUgZmlyc3QgbW9kZWwgb2YgUmF2ZW4g
UmlkZ2U/DQo+ID4NCj4gDQo+IDI0MDBHIGlzIG1vZGVsIDE3ICgweDExKS4gSSB3YXMgdW5hYmxl
IHRvIGZpbmQgaW5mb3JtYXRpb24gaWYgdGhlcmUgYXJlDQo+IG90aGVyIGNoaXBzL21vZGVscyB1
c2luZyB0aGUgc2FtZSBzZXQgb2YgUENJIElEcy4NCj4gDQo+IEknbGwgd2FpdCBmb3IgYWRkaXRp
b25hbCBmZWVkYmFjayBiZWZvcmUgcmVzZW5kaW5nLg0KDQpUaGVyZSBhcmUgb3RoZXIgbW9kZWxz
IHVzaW5nIHRoZSBzYW1lIHNldCBvZiBJRHMsIGJ1dCB0aGUgZmlyc3QgaXMgMTBoLg0KDQpBbHNv
LCB0aGUgRjMgSURzIGZvciBGYW0xN2ggYW5kIEZhbTE3aE1vZDEwaCBhcmUgdXNlZCBpbiBib3Ro
IGFtZF9uYi5jDQphbmQgazEwdGVtcC5jLiBDYW4geW91IHBsZWFzZSBkZWxldGUgdGhlIEYzIElE
cyBmcm9tIHRoZXNlIGZpbGVzIGFuZCBhZGQNCnRoZW0gdG8gImluY2x1ZGUvbGludXgvcGNpX2lk
cy5oIj8NCg0KVGhhbmtzIQ0KDQotWWF6ZW4NCg==
