Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1722E3A7D6E
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 22:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778712059; cv=none; b=mw8IAnBpXLOxy9Nn/7bFEpj2WGcdaIlFSdgXBHPDVoinysfkxeB2XFzZW52+J+HQBVRjO9aH0TspgfKxf9jqxMYvnkeFmDTwS9BDs/LoLcuU8ZqK04l1++m04pCpb0U4BK9grB5gUB83BDcYEVcYooCtj3JOVGnrH73Ivbti2/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778712059; c=relaxed/simple;
	bh=nEA8+v46FZkjjU2+T0JgFtj0KNdZTEWshMDn2pXtPiI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OEOfu/dpeK4z9vfGScXcxldGZS/3Hx7ndT6yqpGG0uajUxzAdV9Zypbvpn61t+WEGXVHsy4VJjYUm4Fd8q5QtKd4xOwhFASqgaPKxe8SW7EWKW27dOj+RAWFM/g9a62eYFgX4SJuTVHbxj90OaVDTX+jkWvLcgWLYM0T19gL1rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=vZN9BU/o; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="vZN9BU/o"
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 552072C046F;
	Thu, 14 May 2026 10:40:54 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1778712054;
	bh=nEA8+v46FZkjjU2+T0JgFtj0KNdZTEWshMDn2pXtPiI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=vZN9BU/o9ov6DI0eGo2+OH0o2yC/VYQZO71+KDxZmCbNjmTZ4HUS3pZ7cBFYfsC5c
	 LVmtooQiIevffBUsTnAXXmVz+FyHB9BnuWarAUlKLjymXQNq4kqX4g0YBHJU6a2Ly+
	 UspskHgbEd6yRv7Q6vRPf6h1fAKL0lUccJPJP/yocJ4TFCzSyCfZBtlb9Lwb6yBryY
	 3DE5YHBAnj/7DVvbLBlgmXhqd1rf0euypqOn93WOl7pXXs7bQmmstLThKLO4S4sA4X
	 K1vKSyITJhpInHH+6ULIeHrnYMAT4mX1DANEGqDDTm4WvgCO0njYxG0pLA5cQvWo0J
	 bHrc9gGiRoKfA==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6a04fdf60001>; Thu, 14 May 2026 10:40:54 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.39; Thu, 14 May 2026 10:40:53 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1748.039; Thu, 14 May 2026 10:40:53 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?=
	<u.kleine-koenig@baylibre.com>, Guenter Roeck <linux@roeck-us.net>
CC: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>, "Igor
 Reznichenko" <igor@reznichenko.net>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Markus Schneider-Pargmann <msp@baylibre.com>
Subject: Re: [PATCH v1 1/2] hwmon: Drop unused i2c driver_data
Thread-Topic: [PATCH v1 1/2] hwmon: Drop unused i2c driver_data
Thread-Index: AQHc4vfifEIOOCHngE2n4UDfHQ7ktbYLxAGA
Date: Wed, 13 May 2026 22:40:53 +0000
Message-ID: <414fa84c-bc90-4f1c-9443-7fe6d1ebdcab@alliedtelesis.co.nz>
References: <cover.1778688802.git.u.kleine-koenig@baylibre.com>
 <e8ceb3931975813545a8b478cc1a71b4ede9a6c0.1778688803.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <e8ceb3931975813545a8b478cc1a71b4ede9a6c0.1778688803.git.u.kleine-koenig@baylibre.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B09A4152BEB9D4CB6217B47DB1F11A7@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Es1xrjcA c=1 sm=1 tr=0 ts=6a04fdf6 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=drD7vYo3kbIA:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=IpJZQVW2AAAA:8 a=C6dRQXjCLI0NDTqhi3UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IawgGOuG5U0WyFbmm1f5:22
X-SEG-SpamProfiler-Score: 0

SGkgVXdlLA0KDQpPbiAxNC8wNS8yMDI2IDA0OjQ0LCBVd2UgS2xlaW5lLUvDtm5pZyAoVGhlIENh
cGFibGUgSHViKSB3cm90ZToNCj4gVGhlIGZvdXIgZHJpdmVycyBhbGwgZG9uJ3QgbWFrZSB1c2Ug
b2YgdGhlIHZhbHVlIHRoYXQgd2FzIGV4cGxpY2l0bHkNCj4gYXNzaWduZWQgdG8gdGhlIC5kcml2
ZXJfZGF0YSBtZW1iZXIuIERyb3AgdGhlIGFzc2lnbm1lbnQuDQo+DQo+IFdoaWxlIHRvdWNoaW5n
IHRoZXNlIGxpbmVzIGFsc28gbWFrZSB0aGUgYXNzaWdubWVudHMgdXNlIG5hbWVkDQo+IGluaXRp
YWxpemVycyBhbmQgZHJvcCBhIGNvbW1hIGFmdGVyIHRoZSBlbmQtb2YtbGlzdCBtYXJrZXIuDQo+
DQo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIChUaGUgQ2FwYWJsZSBIdWIpIDx1
LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29tPg0KUmV2aWV3ZWQtYnk6IENocmlzIFBhY2toYW0g
PGNocmlzLnBhY2toYW1AYWxsaWVkdGVsZXNpcy5jby5uej4gIyBGb3IgDQpBUFMtMzc5DQo+IC0t
LQ0KPiAgIGRyaXZlcnMvaHdtb24vbG04MC5jICAgICAgICAgIHwgNCArKy0tDQo+ICAgZHJpdmVy
cy9od21vbi9wbWJ1cy9hcHMtMzc5LmMgfCA0ICsrLS0NCj4gICBkcml2ZXJzL2h3bW9uL3BtYnVz
L2x0MzA3NC5jICB8IDQgKystLQ0KPiAgIGRyaXZlcnMvaHdtb24vdHNjMTY0MS5jICAgICAgIHwg
MiArLQ0KPiAgIDQgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygt
KQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9od21vbi9sbTgwLmMgYi9kcml2ZXJzL2h3bW9u
L2xtODAuYw0KPiBpbmRleCA2M2M3ODMxYmQzZTEuLjAwMmM2NjkxODJlMSAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9od21vbi9sbTgwLmMNCj4gKysrIGIvZHJpdmVycy9od21vbi9sbTgwLmMNCj4g
QEAgLTYyMiw4ICs2MjIsOCBAQCBzdGF0aWMgaW50IGxtODBfcHJvYmUoc3RydWN0IGkyY19jbGll
bnQgKmNsaWVudCkNCj4gICAgKi8NCj4gICANCj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IGkyY19k
ZXZpY2VfaWQgbG04MF9pZFtdID0gew0KPiAtCXsgImxtODAiLCAwIH0sDQo+IC0JeyAibG05NjA4
MCIsIDEgfSwNCj4gKwl7ICJsbTgwIiB9LA0KPiArCXsgImxtOTYwODAiIH0sDQo+ICAgCXsgfQ0K
PiAgIH07DQo+ICAgTU9EVUxFX0RFVklDRV9UQUJMRShpMmMsIGxtODBfaWQpOw0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9od21vbi9wbWJ1cy9hcHMtMzc5LmMgYi9kcml2ZXJzL2h3bW9uL3BtYnVz
L2Fwcy0zNzkuYw0KPiBpbmRleCA3ZDQ2Y2Q2NDdlMjAuLjNlYzA5NDBhZTU2NCAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9od21vbi9wbWJ1cy9hcHMtMzc5LmMNCj4gKysrIGIvZHJpdmVycy9od21v
bi9wbWJ1cy9hcHMtMzc5LmMNCj4gQEAgLTEwMCw4ICsxMDAsOCBAQCBzdGF0aWMgc3RydWN0IHBt
YnVzX2RyaXZlcl9pbmZvIGFwc18zNzlfaW5mbyA9IHsNCj4gICB9Ow0KPiAgIA0KPiAgIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgaTJjX2RldmljZV9pZCBhcHNfMzc5X2lkW10gPSB7DQo+IC0JeyAiYXBz
LTM3OSIsIDAgfSwNCj4gLQl7fSwNCj4gKwl7IC5uYW1lID0gImFwcy0zNzkiIH0sDQo+ICsJeyB9
DQo+ICAgfTsNCj4gICBNT0RVTEVfREVWSUNFX1RBQkxFKGkyYywgYXBzXzM3OV9pZCk7DQo+ICAg
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2h3bW9uL3BtYnVzL2x0MzA3NC5jIGIvZHJpdmVycy9o
d21vbi9wbWJ1cy9sdDMwNzQuYw0KPiBpbmRleCAzNzA0ZGJlN2I1NGEuLmVkOTMyZGRiNGY3NyAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9od21vbi9wbWJ1cy9sdDMwNzQuYw0KPiArKysgYi9kcml2
ZXJzL2h3bW9uL3BtYnVzL2x0MzA3NC5jDQo+IEBAIC05NSw4ICs5NSw4IEBAIHN0YXRpYyBpbnQg
bHQzMDc0X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpDQo+ICAgfQ0KPiAgIA0KPiAg
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgaTJjX2RldmljZV9pZCBsdDMwNzRfaWRbXSA9IHsNCj4gLQl7
ICJsdDMwNzQiLCAwIH0sDQo+IC0Je30NCj4gKwl7IC5uYW1lID0gImx0MzA3NCIgfSwNCj4gKwl7
IH0NCj4gICB9Ow0KPiAgIE1PRFVMRV9ERVZJQ0VfVEFCTEUoaTJjLCBsdDMwNzRfaWQpOw0KPiAg
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9od21vbi90c2MxNjQxLmMgYi9kcml2ZXJzL2h3bW9u
L3RzYzE2NDEuYw0KPiBpbmRleCAyYjVkMzRiYWIxNDYuLmZjNTNjZDViYjZlMCAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9od21vbi90c2MxNjQxLmMNCj4gKysrIGIvZHJpdmVycy9od21vbi90c2Mx
NjQxLmMNCj4gQEAgLTcyMSw3ICs3MjEsNyBAQCBzdGF0aWMgaW50IHRzYzE2NDFfcHJvYmUoc3Ry
dWN0IGkyY19jbGllbnQgKmNsaWVudCkNCj4gICB9DQo+ICAgDQo+ICAgc3RhdGljIGNvbnN0IHN0
cnVjdCBpMmNfZGV2aWNlX2lkIHRzYzE2NDFfaWRbXSA9IHsNCj4gLQl7ICJ0c2MxNjQxIiwgMCB9
LA0KPiArCXsgLm5hbWUgPSAidHNjMTY0MSIgfSwNCj4gICAJeyB9DQo+ICAgfTsNCj4gICBNT0RV
TEVfREVWSUNFX1RBQkxFKGkyYywgdHNjMTY0MV9pZCk7
