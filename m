Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FE442AA5
	for <linux-hwmon@vger.kernel.org>; Sun,  7 Sep 2025 23:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757286023; cv=none; b=DLrPfAe+ks6yBJKznKT55Cqw7NCJQpu3C3VTrdACS7QZeXKA89NBLRX47TGNxrdeh6SX+fmfe5oraZJcm6NWwJhQgmIs6qQMTCYsRu75fGdfGsZCm5iEl263cpsz0sNmONsNDvquNFWqh/ESvLsLf4zsT5okEHgfdhXtdrsGkac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757286023; c=relaxed/simple;
	bh=jIuAs4C+5vH0OyzHXAiNKNum3AggrKQR2ju7ykyCGO4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=vBFDd+aZtMzPZSf6jirXSKE6VOjhsJ2pzq+tGWi7I3WUqK5DvckcDcBsnyEOlao3LAugAT3Rvt1Y8sr5AfJjZICJrOg73Qcut1EuZwutXITNEID4TdvMtSeLjg9JZDIJTsyIp02n5nRwYbWtLkIhYrAoZ7q03XWU+2+m6Xg2XBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=i65mxZP/; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="i65mxZP/"
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 44F982C02FF;
	Mon,  8 Sep 2025 11:00:12 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1757286012;
	bh=jIuAs4C+5vH0OyzHXAiNKNum3AggrKQR2ju7ykyCGO4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=i65mxZP/rPKSlSnaSygalWPV7qYPBgWNQGBCDj/ka/l8qIle4MwhPLN4d7PqaPIRD
	 QoBEZc+ebM0Sq+nLQT2lm183PKvaZiR1wGX30aqUapvZ9B+DVwCHr2nbQsSmNmigJ7
	 AuX/kxQ9d4YlkrQx8rwIbWT1Nk2NP8tUzT0rsHya5b6RksuV3CO01pIbXMjthr8ojX
	 NzkF8sXzbiXMsW2Bo4gmmOyFt+G+CosV0eJXDMmK2MsPLFz4k1+PwzBpT/ueN+NNF/
	 2O89uqUWXTwh6OyCmvr05VI9ppJlmtumMR9c251JGPnKekrjOnH3r1K17fAT0kNX38
	 Lbpdu7Ipl74FQ==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B68be0e7c0001>; Mon, 08 Sep 2025 11:00:12 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.36; Mon, 8 Sep 2025 11:00:11 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1748.036; Mon, 8 Sep 2025 11:00:11 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Guenter Roeck <linux@roeck-us.net>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>
CC: Christian Kahr <christian.kahr@sie.at>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 00/17] hwmon: (ina238) Various improvements and added chip
 support
Thread-Topic: [PATCH 00/17] hwmon: (ina238) Various improvements and added
 chip support
Thread-Index: AQHcHqWL84nxUfXTuE6xKtMCClV5VLSHj96A
Date: Sun, 7 Sep 2025 23:00:11 +0000
Message-ID: <62ad677d-ecca-4819-904a-7052675300cb@alliedtelesis.co.nz>
References: <20250905204159.2618403-1-linux@roeck-us.net>
In-Reply-To: <20250905204159.2618403-1-linux@roeck-us.net>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <D36A7C0732D63A4A98FA8A221923ABEA@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Yo+sRJYX c=1 sm=1 tr=0 ts=68be0e7c a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=YMzaRx0akvIA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=2iaE-kZxjnJvbpx23GEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

SGkgR3VlbnRlciwNCg0KT24gMDYvMDkvMjAyNSAwODo0MSwgR3VlbnRlciBSb2VjayB3cm90ZToN
Cj4gQWRkIHN1cHBvcnQgZm9yIElOQTcwMCBhbmQgSU5BNzgwIHRvIHRoZSBpbmEyMzggZHJpdmVy
Lg0KPg0KPiBUbyBwcmVwYXJlIGZvciB0aGlzLCBpbXBsZW1lbnQgdmFyaW91cyBpbXByb3ZlbWVu
dHMuDQo+DQo+IC0gVXBkYXRlIGRvY3VtZW50aW9uIGFuZCBLY29uZmlnIGVudHJ5IHRvIGxpc3Qg
YWxsIHN1cHBvcnRlZCBjaGlwcy4NCj4NCj4gLSBEcm9wIHBsYXRmb3JtIGRhdGEgc3VwcG9ydC4g
VGhlIGRyaXZlciBzdXBwb3J0cyBkZXZpY2UgcHJvcGVydGllcywNCj4gICAgYW5kIHRoZXJlIGFy
ZSBubyBpbi10cmVlIHBsYXRmb3JtIGRhdGEgdXNlcnMuDQo+DQo+IC0gU3RvcCBjaGVja2luZyB0
aGUgYXR0cmlidXRlIHZhbHVlIHdoZW4gd3JpdGluZyB0aGUgcG93ZXJfbWF4IGF0dHJpYnV0ZQ0K
PiAgICBhcyB1bm5lY2Vzc2FyeS4NCj4NCj4gLSBTaW1wbGlmeSB0ZW1wZXJhdHVyZSBjYWxjdWxh
dGlvbnMuIEluc3RlYWQgb2Ygc2hpZnQgYW5kIGxzYiwgb25seQ0KPiAgICByZXF1aXJlIHRoZSBy
ZXN1bHV0aW9uIGFuZCB1c2UgaXQgdG8gY2FsY3VsYXRlIHRlbXBlcmF0dXJlcy4NCj4NCj4gLSBQ
cmUtY2FsY3VsYXRlIHZvbHRhZ2UsIGN1cnJlbnQsIHBvd2VyIGFuZCBlbmVyZ3kgTFNCLiBUaGUg
dmFsdWVzIGRvbid0DQo+ICAgIGNoYW5nZSBkdXJpbmcgcnVudGltZSBhbmQgY2FuIHRoZXJlZm9y
ZSBiZSBwcmUtY2FsY3VsYXRlZC4gQWxzbyB1c2UgdGhlDQo+ICAgIGVxdWF0aW9ucyBwcm92aWRl
ZCBpbiB0aGUgZGF0YWFzaGVldHMgdG8gY2FsY3VsYXRlIHBvd2VyIGFuZCBlbmVyZ3kNCj4gICAg
TFNCIGZyb20gdGhlIGN1cnJlbnQgTFNCIGluc3RlYWQgb2YgY2FsY3VsYXRpbmcgaXQgZnJvbSBz
Y3JhdGNoLg0KPg0KPiAtIFVzZSBST1VORF9DTE9TRVNUIG9wZXJhdGlvbnMgaW5zdGVhZCBvZiBk
aXZpZGUgb3BlcmF0aW9ucyB0byByZWR1Y2UNCj4gICAgcm91bmRpbmcgZXJyb3JzLg0KPg0KPiAt
IEltcHJvdmUgY3VycmVudCBkeW5hbWljIHJhbmdlIGJ5IG1hdGNoaW5nIHNodW50IHZvbHRhZ2Ug
YW5kIGN1cnJlbnQNCj4gICAgcmVnaXN0ZXIgdmFsdWVzLiBXaXRoIHRoYXQsIHRoZSBkeW5hbWlj
IHJhbmdlIGlzIGFsd2F5cyB0aGUgZnVsbCAxNiBiaXQNCj4gICAgcHJvdmlkZWQgYnkgdGhlIEFE
Qy4NCj4NCj4gLSBTdG9wIHVzaW5nIHRoZSBzaHVudCB2b2x0YWdlIHJlZ2lzdGVyLiBXaXRoIHNo
dW50IGFuZCBjdXJyZW50IHJlZ2lzdGVyDQo+ICAgIHZhbHVlcyBub3cgYWx3YXlzIG1hdGNoaW5n
LCBpdCBpcyB1bm5lY2Vzc2FyeSB0byByZWFkIGJvdGguDQo+DQo+IC0gUHJvdmlkZSBjdXJyZW50
IGxpbWl0cyBmcm9tIHNodW50IHZvbHRhZ2UgbGltaXQgcmVnaXN0ZXJzLiBBZnRlciBhbGwsDQo+
ICAgIHRoZXJlIGlzIG5vIGRpZmZlcmVuY2UgZm9yIHRoZSBBREMsIHNvIHRoZSBzaHVudCB2b2x0
YWdlIGxpbWl0cyB0cmFuc2xhdGUNCj4gICAgaW50byBjdXJyZW50IGxpbWl0cy4NCj4NCj4gLSBP
cmRlciBjaGlwIGluZm9ybWF0aW9uIGFscGhhYmV0aWNhbGx5LiBObyBmdW5jdGlvbmFsIGNoYW5n
ZSwgaXQganVzdA0KPiAgICBzaW1wbGlmaWVzIGFkZGluZyBzdXBwb3J0IGZvciBuZXcgY2hpcHMu
DQo+DQo+IC0gQWRkIDY0LWJpdCBlbmVyZ3kgYXR0cmlidXRlIHN1cHBvcnQgdG8gdGhlIGh3bW9u
IGNvcmUuDQo+DQo+IC0gVXNlIHRoZSBod21vbiBjb3JlIHRvIHJlcG9ydCA2NC1iaXQgZW5lcmd5
IHZhbHVlcy4NCj4NCj4gLSBBZGQgc3VwcG9ydCBmb3IgYWN0aXZlLWhpZ2ggYWxlcnQgcG9sYXJp
dHkNCj4NCj4gLSBMaW1pdCBzaHVudCBhbmQgY2FsaWJyYXRpb24gcmVnaXN0ZXIgd3JpdGVzIHRv
IGNoaXBzIHJlcXVpcmluZy9zdXBwb3J0aW5nDQo+ICAgIGl0Lg0KPg0KPiAtIEFkZCBzdXBwb3J0
IGZvciBJTkE3MDAgYW5kIElOQTc4MC4gQm90aCBjaGlwcyBoYXZlIGludGVybmFsIHNodW50DQo+
ICAgIHJlc2lzdG9ycyBhbmQgZG8gbm90IGV4cGxpY2l0bHkgcmVwb3J0IHRoZSBzaHVudCB2b2x0
YWdlLg0KPg0KPiBUaGlzIHBhdGNoIHNlcmllcyB3YXMgaW5zcGlyZWQgYnkgQ2hyaXMgUGFja2hh
bSdzIGluaXRpYWwgcGF0Y2ggc2V0IG9mIGENCj4gbmV3IElOQTc4MCBkcml2ZXIsIGJ5IGhpcyBz
dWJzZXF1ZW50IHBhdGNoIHNldCBhZGRpbmcgc3VwcG9ydCBmb3IgdGhhdCBjaGlwDQo+IHRvIHRo
ZSBpbmEyMzggZHJpdmVyLCBhbmQgYnkgQ2hyaXN0aWFuIEthaHIncyBzdWJtaXNzaW9uIG9mIGEg
bmV3IElOQTcwMA0KPiBkcml2ZXIuDQo+DQo+IFRoZSBzZXJpZXMgd2FzIHRlc3RlZCB3aXRoIElO
QTIyOCwgSU5BMjM3LCBJTkEyMzgsIGFuZCBJTkE3ODAgZXZhbHVhdGlvbg0KPiBib2FyZHMgYXMg
d2VsbCBhcyB3aXRoIHVuaXQgdGVzdCBjb2RlLg0KPg0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IEd1ZW50ZXIgUm9l
Y2sgKDE3KToNCj4gICAgICAgIGh3bW9uOiAoaW5hMjM4KSBEcm9wIHBsYXRmb3JtIGRhdGEgc3Vw
cG9ydA0KPiAgICAgICAgaHdtb246IChpbmEyMzgpIFVwZGF0ZSBkb2N1bWVudGF0aW9uIGFuZCBL
Y29uZmlnIGVudHJ5DQo+ICAgICAgICBod21vbjogKGluYTIzOCkgRHJvcCBwb2ludGxlc3MgcG93
ZXIgYXR0cmlidXRlIGNoZWNrIG9uIGF0dHJpYnV0ZSB3cml0ZXMNCj4gICAgICAgIGh3bW9uOiAo
aW5hMjM4KSBSZXdvcmsgYW5kIHNpbXBsaWZ5IHRlbXBlcmF0dXJlIGNhbGN1bGF0aW9ucw0KPiAg
ICAgICAgaHdtb246IChpbmEyMzgpIFByZS1jYWxjdWxhdGUgY3VycmVudCwgcG93ZXIsIGFuZCBl
bmVyZ3kgTFNCDQo+ICAgICAgICBod21vbjogKGluYTIzOCkgU2ltcGxpZnkgdm9sdGFnZSByZWdp
c3RlciBhY2Nlc3Nlcw0KPiAgICAgICAgaHdtb246IChpbmEyMzgpIEltcHJvdmUgY3VycmVudCBk
eW5hbWljIHJhbmdlDQo+ICAgICAgICBod21vbjogKGluYTIzOCkgU3RvcCB1c2luZyB0aGUgc2h1
bnQgdm9sdGFnZSByZWdpc3Rlcg0KPiAgICAgICAgaHdtb246IChpbmEyMzgpIEFkZCBzdXBwb3J0
IGZvciBjdXJyZW50IGxpbWl0cw0KPiAgICAgICAgaHdtb246IChpbmEyMzgpIE9yZGVyIGNoaXAg
aW5mb3JtYXRpb24gYWxwaGFiZXRpY2FsbHkNCj4gICAgICAgIGh3bW9uOiBJbnRyb2R1Y2UgNjQt
Yml0IGVuZXJneSBhdHRyaWJ1dGUgc3VwcG9ydA0KPiAgICAgICAgaHdtb246IChpbmEyMzgpIFVz
ZSB0aGUgZW5lcmd5NjQgYXR0cmlidXRlIHR5cGUgdG8gcmVwb3J0IHRoZSBlbmVyZ3kNCj4gICAg
ICAgIGh3bW9uOiAoaW5hMjM4KSBTdXBwb3J0IGFjdGl2ZS1oaWdoIGFsZXJ0IHBvbGFyaXR5DQo+
ICAgICAgICBod21vbjogKGluYTIzOCkgT25seSBjb25maWd1cmUgY2FsaWJyYXRpb24gYW5kIHNo
dW50IHJlZ2lzdGVycyBpZiBuZWVkZWQNCj4gICAgICAgIGh3bW9uOiAoaW5hMjM4KSBBZGQgc3Vw
cG9ydCBmb3IgSU5BNzgwDQo+ICAgICAgICBkdC1iaW5kaW5nczogaHdtb246IHRpLGluYTJ4eDog
QWRkIElOQTcwMA0KPiAgICAgICAgaHdtb246IChpbmEyMzgpIEFkZCBzdXBwb3J0IGZvciBJTkE3
MDANCj4NCj4gICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9od21vbi90aSxpbmEyeHgueWFtbCAg
ICAgICB8ICAgNCArDQo+ICAgRG9jdW1lbnRhdGlvbi9od21vbi9od21vbi1rZXJuZWwtYXBpLnJz
dCAgICAgICAgICAgfCAgIDMgKw0KPiAgIERvY3VtZW50YXRpb24vaHdtb24vaW5hMjM4LnJzdCAg
ICAgICAgICAgICAgICAgICAgIHwgIDY0ICsrLQ0KPiAgIGRyaXZlcnMvaHdtb24vS2NvbmZpZyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA5ICstDQo+ICAgZHJpdmVycy9od21vbi9o
d21vbi5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTYgKy0NCj4gICBkcml2ZXJz
L2h3bW9uL2luYTIzOC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDU4MyArKysrKysr
KysrKy0tLS0tLS0tLS0NCj4gICBpbmNsdWRlL2xpbnV4L2h3bW9uLmggICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgMSArDQo+ICAgaW5jbHVkZS90cmFjZS9ldmVudHMvaHdtb24uaCAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMTAgKy0NCj4gICA4IGZpbGVzIGNoYW5nZWQsIDM4MiBp
bnNlcnRpb25zKCspLCAzMDggZGVsZXRpb25zKC0pDQoNCkZvciB0aGUgc2VyaWVzDQoNClJldmll
d2VkLWJ5OiBDaHJpcyBQYWNraGFtIDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+
DQpUZXN0ZWQtYnk6IENocmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1AYWxsaWVkdGVsZXNpcy5j
by5uej4gIyBJTkE3ODANCg==
