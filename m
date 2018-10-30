Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-dm3nam03on0118.outbound.protection.outlook.com ([104.47.41.118]:18210
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725765AbeJaE3C (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 31 Oct 2018 00:29:02 -0400
From: Trent Piepho <tpiepho@impinj.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>,
        "m.felsch@pengutronix.de" <m.felsch@pengutronix.de>
CC: "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] hwmon: add generic GPIO brownout support
Date: Tue, 30 Oct 2018 19:34:11 +0000
Message-ID: <1540928050.30311.94.camel@impinj.com>
References: <20181029143521.22122-1-m.felsch@pengutronix.de>
         <20181029143521.22122-3-m.felsch@pengutronix.de>
         <20181029195238.GA24689@roeck-us.net>
         <1540847798.30311.47.camel@impinj.com>
         <8841d944-4fab-7d43-4edc-20f9a95ac009@roeck-us.net>
         <20181030104706.dbuld7tymwcpayzd@pengutronix.de>
         <783b26c9-2654-4aff-5e77-e35a17973e63@roeck-us.net>
         <20181030170026.licamhckbznuvcse@pengutronix.de>
In-Reply-To: <20181030170026.licamhckbznuvcse@pengutronix.de>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <40014ED874EBEF44B534CE2A6241F31C@namprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

T24gVHVlLCAyMDE4LTEwLTMwIGF0IDE4OjAwICswMTAwLCBNYXJjbyBGZWxzY2ggd3JvdGU6DQo+
IE9uIDE4LTEwLTMwIDA2OjEzLCBHdWVudGVyIFJvZWNrIHdyb3RlOg0KPiA+IE9uIDEwLzMwLzE4
IDM6NDcgQU0sIE1hcmNvIEZlbHNjaCB3cm90ZToNCj4gPiA+IA0KPiBod21vbi1ncGlvLXNpbXBs
ZSBzb3VuZHMgb2sgZm9yIG1lLg0KPiANCj4gPiBUaGUgbW9zdCBkaWZmaWN1bHQgcGFydCBvZiBz
dWNoIGEgZHJpdmVyIHdvdWxkIHByb2JhYmx5IGJlIHRvIGRlZmluZSBhY2NlcHRhYmxlDQo+ID4g
ZGV2aWNldHJlZSBwcm9wZXJ0aWVzLg0KPiANCj4gVGhhdCdzIHRydWUhIE9uZSBwb3NzaWJsZSBz
b2x1dGlvbiBjb3VsZCBiZToNCj4gDQo+IGh3bW9uX2RldiB7DQo+IAljb21wYXRpYmxlID0gImh3
bW9uLWdwaW8tc2ltcGxlIjsNCj4gCW5hbWUgPSAiZ3Bpby1nZW5lcmljLWh3bW9uIjsNCj4gCXVw
ZGF0ZS1pbnRlcnZhbC1tcyA9IDEwMDsNCj4gDQo+IAlod21vbi1ncGlvLXNpbXBsZSxkZXZAMCB7
DQo+IAkJcmVnID0gPDA+Ow0KPiAJCWdwaW8gPSA8Z3BpbzMgMTUgR1BJT19BQ1RJVkVfTE9XPjsN
Cj4gCQlod21vbi1ncGlvLXNpbXBsZSx0eXBlID0gImluIjsNCj4gCQlod21vbi1ncGlvLXNpbXBs
ZSxyZXBvcnQgPSAiY3JpdF9hbGFybSI7DQo+IAl9Ow0KPiANCj4gCWh3bW9uLWdwaW8tc2ltcGxl
LGRldkAxIHsNCj4gCQlyZWcgPSA8MT47DQo+IAkJZ3BpbyA9IDxncGlvMyAxOSBHUElPX0FDVElW
RV9MT1c+Ow0KPiAJCWh3bW9uLWdwaW8tc2ltcGxlLHR5cGUgPSAidGVtcCI7DQo+IAkJaHdtb24t
Z3Bpby1zaW1wbGUscmVwb3J0ID0gImFsYXJtIjsNCj4gCX07DQo+IH07DQoNCkhlcmUncyBzb21l
IG9wdGlvbnM6DQoNCmh3bW9uX2RldiB7DQoJLyogT3J0aG9nb25hbCB0byBleGlzdGluZyAiZ3Bp
by1mYW4iIGJpbmRpbmcuICovDQoJY29tcGF0aWJsZSA9ICJncGlvLWFsYXJtIjsNCgkvKiBTdGFu
ZGFyZCBEVCBwcm9wZXJ0eSBmb3IgR1BJTyB1c2VycyBpcyBbPG5hbWU+LV1ncGlvcyAqLw0KCWFs
YXJtLWdwaW9zID0gPCZncGlvMyAxNSBHUElPX0FDVElWRV9MT1c+LA0KCSAgICAgICAgICAgICAg
PCZncGlvMyAxOSBHUElPX0FDVElWRV9MT1c+Ow0KCS8qIEEgPHByb3A+LW5hbWVzIHByb3BlcnR5
IGlzIGFsc28gYSBEVCBzdGFuZGFyZCAqLw0KICAgICAgICBhbGFybS1ncGlvcy1uYW1lcyA9ICJp
bjAiLCAidGVtcDAiOw0KfTsNCg0KVGhlIGRyaXZlciBjYW4gY3JlYXRlIGh3bW9uIGFsYXJtIGF0
dHJpYnV0ZShzKSBiYXNlZCBvbiB0aGUgbmFtZShzKS4gIEkNCnVzZWQgImFsYXJtIiBhcyBpdCBz
ZWVtZWQgdG8gZml0IHRoZSBwYXR0ZXJuIGVzdGFibGlzaGVkIGJ5IHRoZSAiZmFuIg0KZHJpdmVy
LiAgQm90aCB0aGUgZ3Bpby1mYW4gYW5kIGdwaW8tYWxhcm0gZHJpdmVyIHVzZSBncGlvcywgYnV0
IEkgdGhpbmsNCmNvbnNpZGVyaW5nIHRoZW0gb25lIGRyaXZlciBmb3IgdGhhdCByZWFzb24gZG9l
cyBub3QgbWFrZSBzZW5zZS4NCg0KVGhlIG5hbWVzIGFyZSB2ZXJ5IExpbnV4eSwgc29tZXRoaW5n
IHRoYXQgaXMgbm90IGxpa2VkIGluIERUIGJpbmRpbmdzLiANCkl0IGFsc28gZG9lc24ndCBleHRl
bmQgd2VsbCBpZiB5b3UgbmVlZCB0byBhZGQgbW9yZSBhdHRyaWJ1dGVzIHRvIGVhY2gNCmFsYXJt
LiAgSGVyZSdzIHNvbWV0aGluZyB0aGF0J3MgbW9yZSBsaWtlIHdoYXQgSSBkaWQgZm9yIHRoZSBn
cGlvLWxlZHMNCmJpbmRpbmcuDQoNCmh3bW9uX2RldiB7DQoJY29tcGF0aWJsZSA9ICJncGlvLWFs
YXJtIjsNCgl2b2x0YWdlQDAgew0KCQlsYWJlbCA9ICJCYXR0ZXJ5IFZvbHRhZ2UgTG93IjsNCgkJ
dHlwZSA9ICJ2b2x0YWdlIjsNCgkJYWxhcm0tZ3Bpb3MgPSA8JmdwaW8zIDE1IEdQSU9fQUNUSVZF
X0xPVz47DQoJfTsNCgljcHV0ZW1wQDAgew0KCQlsYWJlbCA9ICJDUFUgVGVtcGVyYXR1cmUgQ3Jp
dGljYWwiOw0KCQl0eXBlID0gInRlbXBlcmF0dXJlIjsNCgkJaW50ZXJydXB0LXBhcmVudCA9IDwm
Z3BpbzM+Ow0KCQlpbnRlcnJ1cHRzID0gPDE5IElSUV9UWVBFX0xFVkVMX0xPVz47DQoJfTsNCn07
DQoNClN1cHBvcnRpbmcgaW50ZXJydXB0cyBpbnN0ZWFkIG9mIGp1c3QgYSBncGlvIHdvdWxkIGFs
bG93IGZvciBlZGdlDQp0cmlnZ2VyaW5nLiAgICAgIA0KDQpJIGNhbiBhbHNvIHNlZSB0aGF0IHNv
bWVvbmUgbWlnaHQgd2FudCB0byBjcmVhdGUgc29tZSBraW5kIG9mIHRpbWUNCmJhc2VkIGh5c3Rl
cmVzaXMgZm9yIGNpcmN1aXRzIHRoYXQgZG9uJ3QgaGF2ZSB0aGF0LiAgV2hpbGUgaXQgd291bGQg
YmUNCnZlcnkgZWFzeSB0byBhZGQgYSAibGludXgsZGVib3VuY2UgPSA8MTAwMD47IiBwcm9wZXJ0
eSwgSSBpbWFnaW5lIHRoYXQNCndvdWxkIGJlIHJlamVjdGVkIGFzIGNvbmZpZ3VyYXRpb24gaW4g
dGhlIERUIGJpbmRpbmcuDQo=
