Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail1.bemta23.messagelabs.com ([67.219.246.208]:37897 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725972AbeHUF62 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Aug 2018 01:58:28 -0400
From: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
To: Guenter Roeck <linux@roeck-us.net>,
        Dan Carpenter <dan.carpenter@oracle.com>
CC: Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH 2/2 v2] hwmon: (adt7475) Make adt7475_read_word() return
 errors
Date: Tue, 21 Aug 2018 02:40:14 +0000
Message-ID: <TY2PR01MB2169658C8FFC8150B7F8BBC5DC310@TY2PR01MB2169.jpnprd01.prod.outlook.com>
References: <TYAPR01MB2175C5AA4B777C61CB0AE04DDC380@TYAPR01MB2175.jpnprd01.prod.outlook.com>
 <20180814100747.oovzd66gxmm755nr@kili.mountain>
 <20180814134049.GA607@roeck-us.net>
 <TY2PR01MB216928C2DF3E2976F4E9BDADDC3F0@TY2PR01MB2169.jpnprd01.prod.outlook.com>
 <01f7b2a7-f1af-65d0-5e6e-9d2a484f3a48@roeck-us.net>
In-Reply-To: <01f7b2a7-f1af-65d0-5e6e-9d2a484f3a48@roeck-us.net>
Content-Language: ja-JP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

SGkgR3VlbnRlci1zYW4sDQoNClRoYW5rIHlvdSBzbyBtdWNoIGZvciB0aGUgbWFpbCBhbmQgbm90
ZWQgaXQuDQooQnV0IHNvcnJ5IGZvciB0b28gbGF0ZSB0byByZXBseSBzaW5jZSB0aGUgbWFpbCB3
YXMgYXV0b21hdGljYWxseSBtb3ZlZCBmcm9tIHRoZSBtYWlsIHJlY2VpdmluZyBmb2xkZXIuKQ0K
DQpSZWdhcmRzLA0KSWtlZ2FtaQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IGxpbnV4LWh3bW9uLW93bmVyQHZnZXIua2VybmVsLm9yZw0KPiBbbWFpbHRvOmxpbnV4LWh3
bW9uLW93bmVyQHZnZXIua2VybmVsLm9yZ10gT24gQmVoYWxmIE9mIEd1ZW50ZXIgUm9lY2sNCj4g
U2VudDogV2VkbmVzZGF5LCBBdWd1c3QgMTUsIDIwMTggOTozNyBQTQ0KPiBUbzogSUtFR0FNSSBU
b2t1bm9yaTsgRGFuIENhcnBlbnRlcg0KPiBDYzogSmVhbiBEZWx2YXJlOyBsaW51eC1od21vbkB2
Z2VyLmtlcm5lbC5vcmc7DQo+IGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmcNCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCAyLzIgdjJdIGh3bW9uOiAoYWR0NzQ3NSkgTWFrZSBhZHQ3NDc1X3Jl
YWRfd29yZCgpDQo+IHJldHVybiBlcnJvcnMNCj4gDQo+IE9uIDA4LzE0LzIwMTggMTE6MDIgUE0s
IElLRUdBTUkgVG9rdW5vcmkgd3JvdGU6DQo+ID4gSGkgR3VlbnRlci1zYW4sDQo+ID4NCj4gPiBD
b3VsZCB5b3UgcGxlYXNlIGxldCBtZSBrbm93IHRoZSBnaXQgcmVwb3NpdG9yeSB0aGF0IGFwcGxp
ZWQgdGhlIGZpeGVzDQo+IGJ5IERhbi1zYW4/DQo+ID4NCj4gDQo+IFNlcmllcyBub3cgdXBsb2Fk
ZWQuIEknbGwgc2VuZCBhIHB1bGwgcmVxdWVzdCB0byBMaW51cyBhZnRlciAtcmMxIGhhcw0KPiBi
ZWVuIHB1Ymxpc2hlZC4NCj4gDQo+IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9ncm9lY2svbGludXgtc3RhZ2luZy5nDQo+IGl0IGh3bW9uDQo+IA0KPiBHdWVu
dGVyDQo+IA0KPiA+IFJlZ2FyZHMsDQo+ID4gSWtlZ2FtaQ0KPiA+DQo+ID4+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEd1ZW50ZXIgUm9lY2sgW21haWx0bzpncm9lY2s3
QGdtYWlsLmNvbV0gT24gQmVoYWxmIE9mIEd1ZW50ZXINCj4gPj4gUm9lY2sNCj4gPj4gU2VudDog
VHVlc2RheSwgQXVndXN0IDE0LCAyMDE4IDEwOjQxIFBNDQo+ID4+IFRvOiBEYW4gQ2FycGVudGVy
DQo+ID4+IENjOiBKZWFuIERlbHZhcmU7IElLRUdBTUkgVG9rdW5vcmk7IGxpbnV4LWh3bW9uQHZn
ZXIua2VybmVsLm9yZzsNCj4gPj4ga2VybmVsLWphbml0b3JzQHZnZXIua2VybmVsLm9yZw0KPiA+
PiBTdWJqZWN0OiBSZTogW1BBVENIIDIvMiB2Ml0gaHdtb246IChhZHQ3NDc1KSBNYWtlIGFkdDc0
NzVfcmVhZF93b3JkKCkNCj4gPj4gcmV0dXJuIGVycm9ycw0KPiA+Pg0KPiA+PiBPbiBUdWUsIEF1
ZyAxNCwgMjAxOCBhdCAwMTowNzo0N1BNICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOg0KPiA+
Pj4gVGhlIGFkdDc0NzVfcmVhZF93b3JkKCkgZnVuY3Rpb24gd2FzIG1lYW50IHRvIHJldHVybiBu
ZWdhdGl2ZSBlcnJvcg0KPiA+Pj4gY29kZXMgb24gZmFpbHVyZS4NCj4gPj4+DQo+ID4+PiBTaWdu
ZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+DQo+ID4+
PiBSZXZpZXdlZC1ieTogVG9rdW5vcmkgSWtlZ2FtaSA8aWtlZ2FtaUBhbGxpZWQtdGVsZXNpcy5j
by5qcD4NCj4gPj4NCj4gPj4gQXBwbGllZC4NCj4gPj4NCj4gPj4gVGhhbmtzLA0KPiA+PiBHdWVu
dGVyDQo+ID4NCg0K
