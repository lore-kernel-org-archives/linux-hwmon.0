Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EDB2D73A0
	for <linux-hwmon@vger.kernel.org>; Sat,  5 Sep 2026 05:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788584951; cv=none; b=UNe1+quBod+9wDxebYMj8HUkIeCBkU/5bzKcyUlqBudcBnvYrzSfPMiXXbpFuHVgXv1Cb0944ggJaNNvE/hctHzjt5IokOX3VyKrBGyuMTZyNkFWQKuYUSt1zlc1KRi2gvmA18HagT+6dky+eKx8ZoK3I4ks4lwntdIFJUGEUPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788584951; c=relaxed/simple;
	bh=6rWlbDJFag2xG3H5cPnaDgqlUQ6IGyzfSlpMt65jL4w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=B3hgRADypfXpoBmDWeXBVGlrn0gciZVxyBKPLOhBiAAmXgcFSXhDmBIkF+8E0NLChLMZzRrrwPuZ6BC0EZTf2GYPrmVaaneisDIWeSs5A+TRhSLzQmngg/X8z8UZT+S4AfMrTGjDmBCq59FWtVkztOiucbCk6Wxe/fWRZW+X2vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=W7FnTplK; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="W7FnTplK"
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 91DDB2C0362;
	Sat,  5 Sep 2026 17:09:00 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1788584940;
	bh=6rWlbDJFag2xG3H5cPnaDgqlUQ6IGyzfSlpMt65jL4w=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:Reply-To:From;
	b=W7FnTplKxwQjt/tjjT1quH7aknJVwLZLVJjJJU3NfqvusVavts5nTICH0802DIZWf
	 ylOMU75XDZ5NCkKVIXtPkto+OcroVa9JFnkDPPjaMinYPn13158VoyXIybXEPXNgs6
	 L5bF9ejqNG/TrzcRpL4b3g4t7mHSuovDk1Mg8gRBDW+Qcz+lWonT72S13pnhAzI6gC
	 I8WIPjOKyUor4/K5w5QRhkDM40oZKjjvlZsgXchguwTH9k0qM1M8RI1xx6B6SeAu3Y
	 rriXoyiELb41G4b31HDPoz/vD0v+Vqq1EzZXiVE0emSDlI/J7k/5jDgkF17xqvXsQw
	 QzMraJyeH54JA==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6a9ba3ec0001>; Sat, 05 Sep 2026 17:09:00 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.39; Sat, 5 Sep 2026 17:09:00 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1748.039; Sat, 5 Sep 2026 17:09:00 +1200
From: Aryan Srivastava <Aryan.Srivastava@alliedtelesis.co.nz>
To: Guenter Roeck <linux@roeck-us.net>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v0 1/2] hwmon: pmbus: Fix vout_mode parsing
Thread-Topic: [PATCH v0 1/2] hwmon: pmbus: Fix vout_mode parsing
Thread-Index: AQHdPAfdXeryQ3ldDEu0QhDXxTqLO7a9vCGAgADr9oA=
Date: Sat, 5 Sep 2026 05:09:00 +0000
Message-ID: <201ff34f-98b0-4f8a-a15b-0e6d82d1f19e@alliedtelesis.co.nz>
References: <20260904005351.2136374-1-aryan.srivastava@alliedtelesis.co.nz>
 <20260904005351.2136374-2-aryan.srivastava@alliedtelesis.co.nz>
 <f52af5ef-2cf3-480e-9e71-735b7514b9c9@roeck-us.net>
In-Reply-To: <f52af5ef-2cf3-480e-9e71-735b7514b9c9@roeck-us.net>
Reply-To: "f52af5ef-2cf3-480e-9e71-735b7514b9c9@roeck-us.net"
	<f52af5ef-2cf3-480e-9e71-735b7514b9c9@roeck-us.net>
Accept-Language: en-US, en-NZ
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <AD3642C51399C74FBC1D74C3A4F79FC6@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CKmJXgrD c=1 sm=1 tr=0 ts=6a9ba3ec a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=62ntRvTiAAAA:8 a=VwQbUJbxAAAA:8 a=pjqE3aksAAAA:8 a=vy6WobZbp4477RDcuxoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pToNdpNmrtiFLRE6bQ9Z:22 a=JJ78nBxWC37LRl2_MMt9:22
X-SEG-SpamProfiler-Score: 0

T24gMDUvMDkvMjAyNiAzOjA0IEFNLCBHdWVudGVyIFJvZWNrIHdyb3RlOg0KPiBPbiA5LzMvMjYg
MTc6NTMsIEFyeWFuIFNyaXZhc3RhdmEgd3JvdGU6DQo+PiBDdXJyZW50bHkgdGhpcyBwYXJzaW5n
IGFzc3VtZXMgdGhlIHRvcC1tb3N0IGJpdCBvZiB0aGUgcmVnaXN0ZXIgaXMNCj4+IHVuc2V0LCBh
bGxvd2luZyBpdCB0byBtYXRjaCBhZ2FpbnN0IGFsbCAyYml0IG51bWJlcnMuIEluIHRoZSBjYXNl
IHdoZXJlDQo+PiB0aGUgdG9wIGJpdCBpcyBzZXQsIHRoZSBwYXJzaW5nIGZhaWxzIGFzIHRoZSBl
eHRyYWN0ZWQgdmFsdWUgaXMgYWx3YXlzIGENCj4+IDMgYml0IG51bWJlci4NCj4+DQo+PiBBTkQg
dGhlIHJlYWQgdmFsdWUgYWZ0ZXIgdGhlIGJpdCBzaGlmdCB0byBlbnN1cmUgb25seSAyIGJpdHMg
YXJlIGJlaW5nDQo+PiBwYXJzZWQgb3V0Lg0KPj4NCj4gDQo+IFRoaXMgaXNuJ3QgdGhhdCBlYXN5
LiBCaXQgNyBpcyBmb3IgInJlbGF0aXZlIG1vZGUiIHN0YXJ0aW5nIHdpdGgNCj4gUE1CdXMgdjEu
My4gUmVsYXRpdmUgbW9kZSBpcyBub3QgY3VycmVudGx5IHN1cHBvcnRlZCBieSB0aGUgZHJpdmVy
LA0KPiBhbmQgaWdub3JpbmcgdGhlIGJpdCBjb3VsZCBwb3RlbnRpYWxseSBiZSBmYXRhbC4NCj4g
DQo+IEEgcGF0Y2ggYWRkaW5nIHN1cHBvcnQgZm9yIGl0IHdhcyBzdWJtaXR0ZWQgYSB3aGlsZSBh
Z28uDQo+IGh0dHBzOi8vc2Nhbm1haWwudHJ1c3R3YXZlLmNvbS8/Yz0yMDk4OCZkPWg5NmE2dGI3
R3RNMmFGYThSOXRBZnZGM2l0Rk1ZSFF6Y0tMQjhaSzRrQSZ1PWh0dHBzJTNhJTJmJTJmcGF0Y2h3
b3JrJTJla2VybmVsJTJlb3JnJTJmcHJvamVjdCUyZmxpbnV4LWh3bW9uJTJmcGF0Y2glMmYyMDI0
MDMxNTE1MTg1NSUyZTM3NzYyNy0yLWxhcnMlMmVwZXR0ZXIlMmVtb3N0YWQlNDBhcHBlYXIlMmVu
ZXQlMmYNCj4gVW5mb3J0dW5hdGVseSBJIG5ldmVyIGdvdCB0byB0ZXN0IGl0LiBUaGlzIG9yIHNv
bWV0aGluZyBzaW1pbGFyIHdpbGwNCj4gYmUgbmVlZGVkLiBBZ2Fpbiwgd2UgY2FuIG5vdCBqdXN0
IGlnbm9yZSB0aGUgInJlbGF0aXZlIG1vZGUiIGJpdC4NCj4gDQo+IFRoYW5rcywNCj4gR3VlbnRl
cg0KDQpIaSBHdWVudGVyLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuIEkgYWdyZWUgc2lt
cGx5IGlnbm9yaW5nIHRoZSB0b3AgYml0IGlzIG5vdCBhbiBvcHRpb24uDQpNeSBpbml0aWFsIHBh
dGNoIHdhcyBzaG9ydC1zaWdodGVkLg0KDQpJIHdpbGwgdGVzdCB0aGUgYWJvdmUgcGF0Y2ggb24g
bXkgSFcuIEkgYWxzbyBsb29rZWQgaW50byB0aGUgZHJpdmVyIGZvciB0aGUgDQp0cHM1NDZkMjQs
IGJ1dCBvbiB0aGUgdHBzNTQ2ZTI1IChteSBIVykgdGhlIHJlbGF0aXZlIG1vZGUgYml0IGlzIHJl
YWQgb25seS4NCg0KVGhhbmtzLA0KQXJ5YW4uDQo+PiBTaWduZWQtb2ZmLWJ5OiBBcnlhbiBTcml2
YXN0YXZhIDxhcnlhbi5zcml2YXN0YXZhQGFsbGllZHRlbGVzaXMuY28ubno+DQo+PiAtLS0NCj4+
IMKgIGRyaXZlcnMvaHdtb24vcG1idXMvcG1idXMuY8KgwqDCoMKgwqAgfCAyICstDQo+PiDCoCBk
cml2ZXJzL2h3bW9uL3BtYnVzL3BtYnVzX2NvcmUuYyB8IDIgKy0NCj4+IMKgIDIgZmlsZXMgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2h3bW9uL3BtYnVzL3BtYnVzLmMgYi9kcml2ZXJzL2h3bW9uL3BtYnVzL3BtYnVz
LmMNCj4+IGluZGV4IDdhN2VhYzkwZDYyZS4uYjYyOWFjYmZmYmZiIDEwMDY0NA0KPj4gLS0tIGEv
ZHJpdmVycy9od21vbi9wbWJ1cy9wbWJ1cy5jDQo+PiArKysgYi9kcml2ZXJzL2h3bW9uL3BtYnVz
L3BtYnVzLmMNCj4+IEBAIC0xMjEsNyArMTIxLDcgQEAgc3RhdGljIGludCBwbWJ1c19pZGVudGlm
eShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LA0KPj4gwqAgwqDCoMKgwqDCoMKgwqDCoMKgIHZv
dXRfbW9kZSA9IHBtYnVzX3JlYWRfYnl0ZV9kYXRhKGNsaWVudCwgMCwgUE1CVVNfVk9VVF9NT0RF
KTsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAodm91dF9tb2RlID49IDAgJiYgdm91dF9tb2Rl
ICE9IDB4ZmYpIHsNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN3aXRjaCAodm91dF9tb2Rl
ID4+IDUpIHsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN3aXRjaCAoKHZvdXRfbW9kZSA+
PiA1KSAmIDB4Mykgew0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2FzZSAwOg0KPj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsNCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGNhc2UgMToNCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2h3bW9uL3Bt
YnVzL3BtYnVzX2NvcmUuYyBiL2RyaXZlcnMvaHdtb24vcG1idXMvcG1idXNfY29yZS5jDQo+PiBp
bmRleCA1ZjY5YzE0MjBiNGUuLjU1MzkxZGI1YjQxNCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMv
aHdtb24vcG1idXMvcG1idXNfY29yZS5jDQo+PiArKysgYi9kcml2ZXJzL2h3bW9uL3BtYnVzL3Bt
YnVzX2NvcmUuYw0KPj4gQEAgLTI3NTMsNyArMjc1Myw3IEBAIHN0YXRpYyBpbnQgcG1idXNfaWRl
bnRpZnlfY29tbW9uKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsDQo+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAqIE5vdCBhbGwgY2hpcHMgc3VwcG9ydCB0aGUgVk9VVF9NT0RFIGNvbW1hbmQsDQo+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIHNvIGEgZmFpbHVyZSB0byByZWFkIGl0IGlzIG5vdCBh
biBlcnJvci4NCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgICovDQo+PiAtwqDCoMKgwqDCoMKgwqAg
c3dpdGNoICh2b3V0X21vZGUgPj4gNSkgew0KPj4gK8KgwqDCoMKgwqDCoMKgIHN3aXRjaCAoKHZv
dXRfbW9kZSA+PiA1KSAmIDB4Mykgew0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNhc2UgMDrCoMKg
wqAgLyogbGluZWFyIG1vZGXCoMKgwqDCoMKgICovDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBpZiAoZGF0YS0+aW5mby0+Zm9ybWF0W1BTQ19WT0xUQUdFX09VVF0gIT0gbGluZWFyKQ0K
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT0RFVjsNCj4g
DQo=
