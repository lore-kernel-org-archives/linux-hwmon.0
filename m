Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-he1eur01on0052.outbound.protection.outlook.com ([104.47.0.52]:64524
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750794AbdKUPtm (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Nov 2017 10:49:42 -0500
From: Marco Franchi <marco.franchi@nxp.com>
To: "d@videhug.ch" <d@videhug.ch>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
        "arm@kernel.org" <arm@kernel.org>,
        "jic23@cam.ac.uk" <jic23@cam.ac.uk>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "jic23@kernel.org" <jic23@kernel.org>
Subject: Re: [PATCH v2] hwmon/sht15: Root out platform data
Date: Tue, 21 Nov 2017 15:49:39 +0000
Message-ID: <1511279379.29108.7.camel@nxp.com>
References: <20170910094446.3154-1-linus.walleij@linaro.org>
         <CAOMZO5D_m=4UKBBGb0-jurDib+g+v82ATMHbiRGhvTSsfz1P6w@mail.gmail.com>
         <CAM4PwSWtxU+87HxP7k3-4qgt4E_q3cS5EZoKjNP7_rh43XJJhg@mail.gmail.com>
         <HE1PR0402MB3562DEEDDCA16F6B8E04CA2FF6680@HE1PR0402MB3562.eurprd04.prod.outlook.com>
         <HE1PR0402MB35625D52800B1810FDFB8774F6680@HE1PR0402MB3562.eurprd04.prod.outlook.com>
         <20171121002849.776d585b9eb3f9f6b04387a0@videhug.ch>
In-Reply-To: <20171121002849.776d585b9eb3f9f6b04387a0@videhug.ch>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <D969C15D16EA3C4992D793B6BC9DEAB0@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

T24gVGVyLCAyMDE3LTExLTIxIGF0IDAwOjI4ICswMTAwLCBEYXZpZGUgSHVnIHdyb3RlOg0KPiBT
b3JyeSBmb3IgdGhlIGRlbGF5ZWQgcXVlc3Rpb24uDQo+IA0KPiBPbiBNb24sIDExIFNlcCAyMDE3
IDE3OjM1OjM1ICswMDAwDQo+IE1hcmNvIEZyYW5jaGkgPG1hcmNvLmZyYW5jaGlAbnhwLmNvbT4g
d3JvdGU6DQo+IA0KPiA+IA0KPiA+IEkgdGVzdGVkIGl0IHVzaW5nIHRoZSBpLk1YIDdEIFNBQlJF
LVNEIGFuZCBkZXZpY2UgdHJlZSBzdXBwb3J0IGFuZA0KPiA+IGl0IHdvcmtzIGdvb2QuDQo+IEl0
IHdvdWxkIGJlIGdyZWF0IGlmIHlvdSBjb3VsZCB0ZWxsIG1lIHdoYXQgR1BJTyBkcml2ZXIgdGhp
cyBwbGF0Zm9ybQ0KPiB1c2VzPw0KPiBJIHdvdWxkIGxpa2UgdG8gY2hlY2sgaWYgSSB1bmRlcnN0
YW5kIHdoZW4gdGhlIHNodDE1IGRyaXZlciBmYWlscyB0bw0KPiBsb2FkIGFuZA0KPiB3aGVuIGl0
IGxvYWRzLg0KSGkgRGF2aWRlLA0KDQpQbGVhc2UsIGNoZWNrIGlmIHRoaXMgZHRzIGZpbGUgY2Fu
IGhlbHAgeW91Og0KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW0NCml0Lz9oPXY0LjE0JmlkPWZkMWViNDZjMzgyYTY5
ZDBmYmFkODVkZWYzYTJmMzAwOGE3NmVmYzENCj4gDQo+IFRoYW5rcywNCj4gRGF2aWRlDQpSZWdh
cmRzLA0KTWFyY28=
