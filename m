Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7134D1A5B9E
	for <linux-hwmon@vger.kernel.org>; Sun, 31 Aug 2025 21:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756674746; cv=none; b=mfzbcZc6xbxb1wCEABN0B4cg/OMr9q/2p4plSiplLItstG0VC8KbV0ZZUOLpNKfGLpWJAD9tVKiLKOP3sHoPN0RLCi09CVhgXhZsZckU1lckZ7e4cueZBPZINLpld/u3tH5X0sH+knzxt9GdXSBSVVfl+FEZvQDZKsdZGamU3HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756674746; c=relaxed/simple;
	bh=hsjeccQzs3yXInmCve4deeW50r08v75A9gdB2Qb6xOE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=td+1AsuPUkAcMtuvgL9v0cddudxFLo1cMvR3CPbqGQN1air2xT9jYyFRWW1XoK9P3kwvvcImYflhx6zHesLaKSoXDG/GUabEa1jpRA9I9Tq7dqW5s5yWnTap/SPmNzgpGayQRzaTkmtau/0ubm60xCAiz4PGpfOIrUSBfiBtG+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=w5NPsSo7; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="w5NPsSo7"
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id A55002C02CC;
	Mon,  1 Sep 2025 09:12:14 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1756674734;
	bh=hsjeccQzs3yXInmCve4deeW50r08v75A9gdB2Qb6xOE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=w5NPsSo7/fakftt3QV1Oh2roKBzoclSZrxOprLMYyOZ7LVM38p16rg9Gljn9Jqs6t
	 Lcj5JShDu6SnHdQQQMPA9bt0/tGN4xDShQV9pwlNb3jXTelu2etVRij2HcEz+ABtPQ
	 RxoNqI4BbJUnUn/ZUHLCLrToZf7W0EsUzdgzDe3Ct9uRhDICJUsX7Qea9Y00so5Cov
	 I+131Y8bM8RxrJDW/1hkeioo9oVbttnCvrS80dhOTWbgdKLtgeSkKQ23Pcv0AeODNr
	 KstreeUa2otmam1PnyN3uWt4C89Fuow/+jChS9nroV7W1/EENTobvpF1jr7RHtdeop
	 0drNoZmMbIh/g==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B68b4baae0001>; Mon, 01 Sep 2025 09:12:14 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 1 Sep 2025 09:12:14 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.014; Mon, 1 Sep 2025 09:12:14 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Guenter Roeck <linux@roeck-us.net>, "jdelvare@suse.com"
	<jdelvare@suse.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>,
	"wenliang202407@163.com" <wenliang202407@163.com>, "jre@pengutronix.de"
	<jre@pengutronix.de>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 2/4] hwmon: (ina238) Correctly clamp temperature
Thread-Topic: [PATCH v3 2/4] hwmon: (ina238) Correctly clamp temperature
Thread-Index: AQHcGJG+9pO9Tm0jk0iEWd5utSH5PrR4m64AgAPhzgA=
Date: Sun, 31 Aug 2025 21:12:14 +0000
Message-ID: <d5bace8a-003f-4fb5-b9b6-93f0aa7cda41@alliedtelesis.co.nz>
References: <20250829030512.1179998-1-chris.packham@alliedtelesis.co.nz>
 <20250829030512.1179998-3-chris.packham@alliedtelesis.co.nz>
 <ba2f563e-4eb3-42be-af05-c01bcef1d5e3@roeck-us.net>
In-Reply-To: <ba2f563e-4eb3-42be-af05-c01bcef1d5e3@roeck-us.net>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <8ADE375A9AC79641ACB05CC78F261258@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Yo+sRJYX c=1 sm=1 tr=0 ts=68b4baae a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=zPeDNGAr0pQFPY5Fct8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

DQpPbiAyOS8wOC8yNSAyMTo1NSwgR3VlbnRlciBSb2VjayB3cm90ZToNCj4gT24gOC8yOC8yNSAy
MDowNSwgQ2hyaXMgUGFja2hhbSB3cm90ZToNCj4+IGluYTIzOF93cml0ZV90ZW1wKCkgd2FzIGF0
dGVtcHRpbmcgdG8gY2xhbXAgdGhlIHVzZXIgaW5wdXQgYnV0IHdhcw0KPj4gdGhyb3dpbmcgYXdh
eSB0aGUgcmVzdWx0LiBFbnN1cmUgdGhhdCB3ZSBjbGFtcCB0aGUgdmFsdWUgdG8gdGhlDQo+PiBh
cHByb3ByaWF0ZSByYW5nZSBiZWZvcmUgaXQgaXMgY29udmVydGVkIGludG8gYSByZWdpc3RlciB2
YWx1ZS4NCj4+DQo+PiBGaXhlczogMGQ5ZjU5NmIxZmUzICgiaHdtb246IChpbmEyMzgpIE1vZGlm
eSB0aGUgY2FsY3VsYXRpb24gZm9ybXVsYSANCj4+IHRvIGFkYXB0IHRvIGRpZmZlcmVudCBjaGlw
cyIpDQo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBQYWNraGFtIDxjaHJpcy5wYWNraGFtQGFsbGll
ZHRlbGVzaXMuY28ubno+DQo+PiAtLS0NCj4+DQo+PiBOb3RlczoNCj4+IMKgwqDCoMKgIENoYW5n
ZXMgaW4gdjM6DQo+PiDCoMKgwqDCoCAtIE5ldy4gU3BsaXQgb2ZmIGJ1Z2ZpeCBmcm9tIG1haW4g
cGF0Y2gNCj4+DQo+PiDCoCBkcml2ZXJzL2h3bW9uL2luYTIzOC5jIHwgMiArLQ0KPj4gwqAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvaHdtb24vaW5hMjM4LmMgYi9kcml2ZXJzL2h3bW9uL2luYTIzOC5jDQo+
PiBpbmRleCA1YTM5NGVlZmY2NzYuLjRkM2RjMDE4ZWFkOSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZl
cnMvaHdtb24vaW5hMjM4LmMNCj4+ICsrKyBiL2RyaXZlcnMvaHdtb24vaW5hMjM4LmMNCj4+IEBA
IC01NzIsNyArNTcyLDcgQEAgc3RhdGljIGludCBpbmEyMzhfd3JpdGVfdGVtcChzdHJ1Y3QgZGV2
aWNlICpkZXYsIA0KPj4gdTMyIGF0dHIsIGxvbmcgdmFsKQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKg
IHJldHVybiAtRU9QTk9UU1VQUDsNCj4+IMKgIMKgwqDCoMKgwqAgLyogU2lnbmVkICovDQo+PiAt
wqDCoMKgIHJlZ3ZhbCA9IGNsYW1wX3ZhbCh2YWwsIC00MDAwMCwgMTI1MDAwKTsNCj4+ICvCoMKg
wqAgdmFsID0gY2xhbXBfdmFsKHZhbCwgLTQwMDAwLCAxMjUwMDApOw0KPg0KPiBUaGF0IG5lZWRz
IGFub3RoZXIgY29ycmVjdGlvbjogQXMgaXQgdHVybnMgb3V0LCB0aGUgZGVmYXVsdCByZWdpc3Rl
ciANCj4gdmFsdWUNCj4gaXMgMHg3ZmYwLCBvciAyNTU4NzUuIFRoYXQgbWVhbnMgd2UgbmVlZCB0
byBhY2NlcHQgdGhhdCByYW5nZS4gVGhlIA0KPiBzYW1lIGlzDQo+IHByb2JhYmx5IHRydWUgZm9y
IG5lZ2F0aXZlIHRlbXBlcmF0dXJlcywgYnV0IEknbGwgbmVlZCB0byBzZWUgdGhlIHJlYWwgDQo+
IGNoaXANCj4gdG8gYmUgc3VyZS4NCj4NCj4gWWVzLCB0aGUgY2hpcHMgb25seSBzdXBwb3J0IGEg
bGltaXRlZCB0ZW1wZXJhdHVyZSByYW5nZSwgYnV0IHRoYXQgaXMgdGhlDQo+IGxpbWl0IHJlZ2lz
dGVyLCBub3QgdGhlIHN1cHBvcnRlZCByYW5nZS4gT3RoZXIgY2hpcHMgaGF2ZSBhIHNpbWlsYXIg
DQo+IHByb2JsZW0uDQo+IEl0IGlzIG9rIHRvIGxpbWl0IHRoZSBpbnB1dCByYW5nZSBpZiB0aGUg
Y2hpcCBoYXMgYSByZWFzb25hYmxlIGRlZmF1bHQgDQo+IHNldCwNCj4gYnV0IGlmIHRoZSBhY3R1
YWwgY2hpcCBkZWZhdWx0IGlzIDB4N2ZmMCBvciAyNTUuODc1IGRlZ3JlZXMgQyB3ZSBuZWVkIHRv
DQo+IHN1cHBvcnQgd3JpdGluZyB0aGF0IHZhbHVlLg0KSSdtIGd1ZXNzaW5nIHRoYXQgbWlnaHQg
Y2hhbmdlIG15IGludHJvZHVjdGlvbiBvZiB0ZW1wX21heCBpbiB0aGUgbmV4dCANCnBhdGNoLiBJ
J2xsIHJlLW9yZGVyIG15IHNlcmllcyB0byBwdXQgdGhlIGJ1Z2ZpeCBmaXJzdCB3aXRoIHRoZSBj
aGFuZ2VzIA0KbWVudGlvbmVkLg0KPg0KPiBHdWVudGVyDQo+
