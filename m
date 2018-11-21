Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-eopbgr70134.outbound.protection.outlook.com ([40.107.7.134]:55008
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726195AbeKUQju (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Nov 2018 11:39:50 -0500
From: Peter Rosin <peda@axentia.se>
To: Guenter Roeck <linux@roeck-us.net>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/2] hwmon: (ntc_thermistor): add support for B57891S0103
 from Epcos
Date: Wed, 21 Nov 2018 06:06:41 +0000
Message-ID: <f15d3e1c-1b53-f390-78e2-6a88c77aed05@axentia.se>
References: <20181117121248.32143-1-peda@axentia.se>
 <20181117121248.32143-2-peda@axentia.se>
 <20181119170732.GA27435@roeck-us.net>
 <f1235661-f8f2-9885-1e7f-491f5c234078@axentia.se>
 <20181119212806.GC5795@roeck-us.net>
In-Reply-To: <20181119212806.GC5795@roeck-us.net>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <A4B519E5F340654C947F9DC427B2B62A@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

T24gMjAxOC0xMS0xOSAyMjoyOCwgR3VlbnRlciBSb2VjayB3cm90ZToNCj4gT24gTW9uLCBOb3Yg
MTksIDIwMTggYXQgMDk6MTY6MTJQTSArMDAwMCwgUGV0ZXIgUm9zaW4gd3JvdGU6DQo+Pj4NCj4+
PiBHdWVzcyBJIGRlc2VydmUgdGhlIG5vbi1hbHBoYWJldGljIG9yZGVyIGFzIHBlbmFsdHkgZm9y
IG5vdCBlbmZvcmNpbmcgaXQgDQo+Pj4gZWFybGllci4gSSdsbCBhY2NlcHQgdGhlIHBhdGNoIGFm
dGVyIERUIGFwcHJvdmFsIGFuZCBzdWJtaXQgYW5vdGhlciBvbmUNCj4+PiBteXNlbGYgYWZ0ZXJ3
YXJkcyB0byByZXN0b3JlIGFscGhhYmV0aWMgb3JkZXIuDQo+Pg0KPj4gUmlnaHQsIEknbSB0aGlu
a2luZyBhbm90aGVyIGdvb2QgY2hhbmdlIHdvdWxkIGJlIHRvIGludHJvZHVjZSBhbiBlbnVtDQo+
PiBpbnRvIHRoZSBudGNfdGhlcm1pc3Rvcl9pZCBhcnJheSwgYmVjYXVzZSB0aGUgaGFyZC1jb2Rl
ZCBudW1iZXJpbmcgaW4NCj4gDQo+IFllcywgc291bmRzIGxpa2UgYSBnb29kIGlkZWEuDQo+IA0K
Pj4gdGhlIG50Y19tYXRjaCB2YXJpYWJsZSBpcyBhIGJpdCBmcmFnaWxlIGluIG15IHRhc3RlLCBh
bmQgdGhhdCBsaXN0IHdvdWxkDQo+PiBhbHNvIGJlbmVmaXQgZnJvbSBiZWluZyBhbHBoYWJldGlj
LiBDdXJyZW50bHkgdGhlcmUncyBzaW1wbHkgbm8gd2F5IHRvDQo+PiBhZGQgdGhpbmdzIGluIHRo
ZSBtaWRkbGUgd2l0aG91dCBjYXVzaW5nIG1heWhlbS4gSSB0aG91Z2h0IGFib3V0IGRvaW5nDQo+
PiB0aGF0LCBidXQgZGlkbid0IHdhbnQgdG8gd2FzdGUgZW5lcmd5IGRvaW5nIGl0IHVwIGZyb250
IHdpdGhvdXQga25vd2luZw0KPj4gaWYgaXQgd291bGQgYmUgd2VsbCByZWNlaXZlZCAodGhlIGRy
aXZlciBtaWdodCBoYXZlIGJlZW4gc3VwZXJzZWRlZCBvcg0KPiANCj4gSXQgd291bGQuDQoNClJp
Z2h0LCBzbyBJIGhhdmUgc29tZSBwYXRjaGVzIHNvcnRpbmcgdGhpbmdzIG91dC4uLiBIb3dldmVy
LCBvbmUgcXVlc3Rpb24NCmJlZm9yZSBJIHNlbmQgdGhlbTogSXMgaXQgb2sgdG8gc29ydCB0aGUg
ZW51bSBudGNfdGhlcm1pc3Rvcl90eXBlIGluIHRoZQ0KaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9k
YXRhL250Y190aGVybWlzdG9yLmggaGVhZGVyIG9yIHdpbGwgdGhhdCBicmVhaw0Kc3R1ZmY/DQoN
CkNoZWVycywNClBldGVyDQoNCj4gR3VlbnRlcg0KPiANCj4+IHNvbWV0aGluZykuIEknbSBnbGFk
IHRoYXQgeW91IGhhdmUgdm9sdW50ZWVyZWQgdG8gY2xlYW4gdGhpbmdzIHVwLg0KPj4gSGEhIDot
KQ0KPj4NCj4+IENoZWVycywNCj4+IFBldGVyDQo+Pg0KPj4+IEd1ZW50ZXINCj4+Pg0KPj4+PiAg
fTsNCj4+Pj4gIA0KPj4+PiAgc3RydWN0IG50Y190aGVybWlzdG9yX3BsYXRmb3JtX2RhdGEgew0K
Pj4+PiAtLSANCj4+Pj4gMi4xMS4wDQo+Pj4+DQo+Pg0KDQo=
