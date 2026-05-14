Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7C917BA6
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 00:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778717580; cv=none; b=Xq7S/3ryw92Bd7FcnVDAM70mwkeO0MSY4755C9ax28gOJvK6B41MFHDnY4nn2GE0Gi+nV77Fu77MyBKjLEt/L5c5db4EeWeJzk4ijF5Kq0G1uN43xXk2CHB1He9RFk4gw4YKaILNhFuXWZlOBerlkcYJFRAwd9rBCPW6F2GuJhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778717580; c=relaxed/simple;
	bh=xWVQlDmPEEZLYXUB4OBGXf/FAtxUuZeHD75SyOLZxP0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=H3KmK3Lu5mP/syRuj7a6wdRyqOqrRY2LAtij+fcHrCqCJc4Hqd88YNu+xmKqDq34uQIzhh1lAhO6dMrBCtZC7FXbswKNrFM0ogc6wpneDX5blTqlPXVuI6b/OoFVwxCCyaHL2quNsKCwSRmRqbev34fL5pGeZI4XdktvHXBAOc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=mhZrJu0n; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="mhZrJu0n"
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 18D832C0666
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 12:12:56 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1778717576;
	bh=xWVQlDmPEEZLYXUB4OBGXf/FAtxUuZeHD75SyOLZxP0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=mhZrJu0nsQaYzOUXFgTf2DcCbAC13CH5gSXBTFeqSrYjirmzaOAjsKWTKyQXbk616
	 RQ7e5PmkO8l4mAbgPx5eDf9YYnUQYwp20fT7wa2Ck3Gp9wZ8nbf9E785gSjbt3dVDP
	 ET2iAft6cmGzTr/6Py9v2jZ5UjdXFJh7kvmiSoqFi1GgmoORwQ0564rPhzlLm7DRE5
	 hBI1NWxrKXbbK18xUMAdbP/WOmnFCSykY2LO/aynpaFf7KEqx/zhpjIbFcZUMAAP4Y
	 gc+Kzo0ZD5k8hK7CS4W7BenVeKj2fiCytLnx1mAArSldPqkMp0Ale8GERbNHiYjJx4
	 dxnzzOMmcn4HA==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6a0513870001>; Thu, 14 May 2026 12:12:55 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.39; Thu, 14 May 2026 12:12:55 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1748.039; Thu, 14 May 2026 12:12:55 +1200
From: Ronan Dalton <Ronan.Dalton@alliedtelesis.co.nz>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (nct7802) Add time step attributes for tweaking
 responsiveness
Thread-Topic: [PATCH] hwmon: (nct7802) Add time step attributes for tweaking
 responsiveness
Thread-Index: AQHc4cZiaE4OCjqlhkGHW6C6Br5+8rYL1JwAgAALf4A=
Date: Thu, 14 May 2026 00:12:55 +0000
Message-ID: <2877d0e2d89b557db209590065cea1a03936578f.camel@alliedtelesis.co.nz>
References: <20260512041607.988078-2-ronan.dalton@alliedtelesis.co.nz>
	 <20260513233146.CBAC5C2BCB3@smtp.kernel.org>
In-Reply-To: <20260513233146.CBAC5C2BCB3@smtp.kernel.org>
Accept-Language: en-US, en-NZ
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <D11846ECEAF4814C8ED0E72FE6E82D10@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Es1xrjcA c=1 sm=1 tr=0 ts=6a051387 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=BhaoXNk7gXQA:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VwQbUJbxAAAA:8 a=K1GenvgPQaRwt0p8u14A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

SGkuDQoNCk9uIFdlZCwgMjAyNi0wNS0xMyBhdCAyMzozMSArMDAwMCwgc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyB3cm90ZToNCj4gVGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlr
byBBSSByZXZpZXcgZm91bmQgMSBwb3RlbnRpYWwNCj4gaXNzdWUocykgdG8gY29uc2lkZXI6DQo+
IC0gW0xvd10ga3N0cnRvdWwgaXMgY2FsbGVkIHdpdGggYmFzZSAwIGZvciBhIHRpbWUgaW50ZXJ2
YWwsIGFsbG93aW5nDQo+IHVuaW50ZW5kZWQgb2N0YWwgcGFyc2luZy4NCj4gWyAuLi4gXQ0KPiA+
ICtzdGF0aWMgc3NpemVfdCBzdGVwX3RpbWVfc3RvcmUoc3RydWN0IGRldmljZSAqZGV2LA0KPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLCBjb25zdA0KPiA+IGNoYXIgKmJ1ZiwN
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBzaXplX3QgY291bnQsIGJvb2wgc3RlcF91cCkNCj4gPiArew0KPiA+ICvCoMKgwqDC
oMKgwqDCoHN0cnVjdCBuY3Q3ODAyX2RhdGEgKmRhdGEgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsN
Cj4gPiArwqDCoMKgwqDCoMKgwqB1bnNpZ25lZCBsb25nIHZhbDsNCj4gPiArwqDCoMKgwqDCoMKg
wqB1bnNpZ25lZCBpbnQgcmVnOw0KPiA+ICvCoMKgwqDCoMKgwqDCoGludCByZXQ7DQo+ID4gKw0K
PiA+ICvCoMKgwqDCoMKgwqDCoHJldCA9IGtzdHJ0b3VsKGJ1ZiwgMCwgJnZhbCk7DQo+IA0KPiBE
b2VzIHRoaXMgYWxsb3cgdW5pbnRlbmRlZCBvY3RhbCBwYXJzaW5nPw0KPiANCj4gVXNpbmcgYmFz
ZSAwIG1lYW5zIHRoYXQgYSB6ZXJvLXBhZGRlZCBzdHJpbmcgd3JpdHRlbiBmcm9tIGEgdXNlcnNw
YWNlDQo+IHNjcmlwdA0KPiAoZS5nLiwgZWNobyAwMTUwID4gc3RlcF91cF90aW1lKSB3aWxsIGJl
IHBhcnNlZCBhcyBhbiBvY3RhbCBudW1iZXINCj4gcmF0aGVyDQo+IHRoYW4gZGVjaW1hbC4NCj4g
DQo+IFNob3VsZCB0aGlzIHVzZSBiYXNlIDEwIGluc3RlYWQgdG8gcHJldmVudCBzdXJwcmlzaW5n
IGJlaGF2aW9yIGFuZA0KPiBtYXRjaA0KPiBvdGhlciBzdGFuZGFyZCBzeXNmcyBhdHRyaWJ1dGUg
cGFyc2VycyBpbiB0aGlzIGRyaXZlcj8NCj4gDQpDdXJyZW50bHkgaW4gdGhpcyBkcml2ZXIgdGhl
IGZvbGxvd2luZyBmdW5jdGlvbnMgYWNjZXB0IGFueSBudW1iZXINCmZvcm1hdCAoYmFzZSAwKSB3
aGVuIHBhcnNpbmcgYW4gaW5wdXQgbnVtYmVyOg0KDQotIHRlbXBfdHlwZV9zdG9yZQ0KLSBwd21f
c3RvcmUNCi0gcHdtX2VuYWJsZV9zdG9yZQ0KDQpUaGUgZm9sbG93aW5nIGZ1bmN0aW9ucyBpbnRl
cnByZXQgaW5wdXQgbnVtYmVycyBhcyBiYXNlIDEwOg0KDQotIGluX3N0b3JlDQotIHRlbXBfc3Rv
cmUNCi0gZmFuX21pbl9zdG9yZQ0KLSBiZWVwX3N0b3JlDQoNClNvIHRoZSBkcml2ZXIgaXNuJ3Qg
Y3VycmVudGx5IGNvbnNpc3RlbnQgaW4gdGhpcyByZWdhcmQuDQoNCkxvb2tpbmcgYXQgdGhlIG90
aGVyIHVzYWdlcyBvZiB0aGUgKnN0cnRvKiBmdW5jdGlvbnMgaW4gZHJpdmVycy9od21vbg0KZG9l
cyBzaG93IGEgc3Ryb25nIHByZWZlcmVuY2UgZm9yIGVuZm9yY2luZyBiYXNlIDEwLCBhbmQgdGhl
IGV4YW1wbGUgaW4NCmh3bW9uL3N5c2ZzLWludGVyZmFjZS5yc3QgZG9lcyB0aGUgc2FtZS4NCg0K
QXMgc3VjaCwgSSB3aWxsIGNoYW5nZSB0aGUgbGluZSB0byB0aGUgZm9sbG93aW5nOg0KDQpyZXQg
PSBrc3RydG91bChidWYsIDEwLCAmdmFsKTsNCg0KUmVnYXJkcywNClJvbmFuLg0K
