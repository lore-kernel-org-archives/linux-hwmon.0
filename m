Received: from zg8tmja5ljk3lje4mi4ymjia.icoremail.net (zg8tmja5ljk3lje4mi4ymjia.icoremail.net [209.97.182.222])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5688347B42E;
	Tue, 12 May 2026 09:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.97.182.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778577434; cv=none; b=Xzv3/ugrLEaP2rNi8yLg8nholhGEJibhBJthf6wjDn/1fTe3GugXvo6g5CU/q2CcE0CWc+HZrM0iTYH6DKPRaL7Wnmcm6hSEk2j2FbrNeQYHMMg4ODb7dwBF2dbSQomK0OSac4Y0N+ZXT/uYZmAG59HLYqgzYtNLS80YPbconYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778577434; c=relaxed/simple;
	bh=BYWsAfEDK/5Hk7BhOTet9K0jcni67MU7aVNqdiyVnp0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=A5X+Y73ecTwasrXAfluvK9q/1N16KZpDf5wb+V6seWCHn8Mg7Ey7ze/e9ji/6X3v4h0X6p/4TZ7OUWk8PYh/eIUILRgECRo4oYcjMFUux5DA9SDZPOMMsC1k/sHsSx1sd6kxWL7WPnzdOWlDBwzzvoxIzO4a+j/xJgNzk/QMTdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=209.97.182.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from hehuan1$eswincomputing.com ( [10.12.96.103] ) by
 ajax-webmail-app2 (Coremail) ; Tue, 12 May 2026 17:16:51 +0800 (GMT+08:00)
Date: Tue, 12 May 2026 17:16:51 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Huan He" <hehuan1@eswincomputing.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, p.zabel@pengutronix.de,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com,
	luyulin@eswincomputing.com
Subject: Re: Re: [PATCH v4 1/2] dt-bindings: hwmon: Add Eswin EIC7700 PVT
 sensor
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20260503-brave-bullfinch-of-innovation-942914@quoll>
References: <20260430064107.1598-1-hehuan1@eswincomputing.com>
 <20260430064444.1615-1-hehuan1@eswincomputing.com>
 <20260503-brave-bullfinch-of-innovation-942914@quoll>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <4339b90a.6169.19e1b798c90.Coremail.hehuan1@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:TQJkCgAnPJ8D8AJqe8QYAA--.3824W
X-CM-SenderInfo: 5khk3tzqr6v25zlqu0xpsx3x1qjou0bp/1tbiAgEFCmoCBREpMwAC
	so
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

SGkgS3J6eXN6dG9mLAoKVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgeW91ciBkZXRhaWxlZCByZXZp
ZXcuIFdlIGFwcHJlY2lhdGUgdGhlIGZlZWRiYWNrLgoKPiBPbiBUaHUsIEFwciAzMCwgMjAyNiBh
dCAwMjo0NDo0NFBNICswODAwLCBoZWh1YW4xQGVzd2luY29tcHV0aW5nLmNvbSB3cm90ZToKPiA+
ICsKPiA+ICsgIGxhYmVsOgo+ID4gKyAgICBlbnVtOgo+ID4gKyAgICAgIC0gcHZ0MAo+ID4gKyAg
ICAgIC0gcHZ0MQo+IAo+IE5vLCBsYWJlbCBpcyB1c2VyLXZpc2libGUgbmFtZS4gQ2FuIGJlIHdo
YXRldmVyIHVzZXIgZGVjaWRlcy4KPiAKPiBQbGVhc2UgcmVhZCB3cml0aW5nIGJpbmRpbmdzIC0g
aW5zdGFuY2UgSURzIGFyZSBub3QgYWxsb3dlZC4KClRoYW5rcyBmb3IgdGhlIGNsYXJpZmljYXRp
b24uCkkgYW0gcGxhbm5pbmcgdG8gdXBkYXRlIHRoZSBuZXh0IHJldmlzaW9uIGFzIGZvbGxvd3Mu
IFdvdWxkIHRoaXMgYmUKYWNjZXB0YWJsZT8KCllBTUw6Ci0gwqBsYWJlbDoKLSDCoCDCoGVudW06
Ci0gwqAgwqAgwqAtIHB2dDAKLSDCoCDCoCDCoC0gcHZ0MQorIMKgbGFiZWw6IHRydWUKCnJlcXVp
cmVkOgrCoCAtIGNvbXBhdGlibGUKwqAgLSByZWcKwqAgLSBjbG9ja3MKwqAgLSBpbnRlcnJ1cHRz
Ci0gLSBsYWJlbAoKRHJpdmVyOgrCoHN0YXRpYyBpbnQgZWljNzcwMF9wdnRfY3JlYXRlX2h3bW9u
KHN0cnVjdCBwdnRfaHdtb24gKnB2dCkKwqB7Ci0gwqAgc3RydWN0IGRldmljZSAqZGV2ID0gcHZ0
LT5kZXY7Ci0gwqAgc3RydWN0IGRldmljZV9ub2RlICpucCA9IGRldi0+b2Zfbm9kZTsKLSDCoCBj
b25zdCBjaGFyICpub2RlX2xhYmVsOwotIMKgIGludCB0eXBlOwotIMKgIGNvbnN0IGNoYXIgKm5h
bWVzWzJdID0geyJzb2NfcHZ0IiwgImRkcl9wdnQifTsKLQotIMKgIGlmIChvZl9wcm9wZXJ0eV9y
ZWFkX3N0cmluZyhucCwgImxhYmVsIiwgJm5vZGVfbGFiZWwpKSB7Ci0gwqAgwqAgwqAgZGV2X2Vy
cihkZXYsICJNaXNzaW5nICdsYWJlbCcgcHJvcGVydHkgaW4gRFRTIG5vZGVcbiIpOwotIMKgIMKg
IMKgIHJldHVybiAtRUlOVkFMOwotIMKgIH0KLQotIMKgIGlmIChzdHJjbXAobm9kZV9sYWJlbCwg
InB2dDAiKSA9PSAwKSB7Ci0gwqAgwqAgwqAgdHlwZSA9IDA7Ci0gwqAgfSBlbHNlIGlmIChzdHJj
bXAobm9kZV9sYWJlbCwgInB2dDEiKSA9PSAwKSB7Ci0gwqAgwqAgwqAgdHlwZSA9IDE7Ci0gwqAg
fSBlbHNlIHsKLSDCoCDCoCDCoCBkZXZfZXJyKHB2dC0+ZGV2LCAiVW5zdXBwb3J0ZWQgbGFiZWw6
ICVzXG4iLCBub2RlX2xhYmVsKTsKLSDCoCDCoCDCoCByZXR1cm4gLUVJTlZBTDsKLSDCoCB9Cisg
wqAgY29uc3QgY2hhciAqbmFtZSA9ICJwdnQiOworCisgwqAgb2ZfcHJvcGVydHlfcmVhZF9zdHJp
bmcocHZ0LT5kZXYtPm9mX25vZGUsICJsYWJlbCIsICZuYW1lKTsKwqAKLSDCoCBwdnQtPmh3bW9u
ID0gZGV2bV9od21vbl9kZXZpY2VfcmVnaXN0ZXJfd2l0aF9pbmZvKHB2dC0+ZGV2LCBuYW1lc1t0
eXBlXSwKKyDCoCBwdnQtPmh3bW9uID0gZGV2bV9od21vbl9kZXZpY2VfcmVnaXN0ZXJfd2l0aF9p
bmZvKHB2dC0+ZGV2LCBuYW1lLArCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBwdnQsICZwdnRfaHdtb25faW5mbywKwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgTlVMTCk7Cgo+IAo+ID4gKwo+ID4gKyAgcmVzZXRzOgo+ID4gKyAg
ICBtYXhJdGVtczogMQo+ID4gKwo+ID4gKyAgJyN0aGVybWFsLXNlbnNvci1jZWxscyc6Cj4gPiAr
ICAgIGNvbnN0OiAwCj4gPiArCj4gPiArcmVxdWlyZWQ6Cj4gPiArICAtIGNvbXBhdGlibGUKPiA+
ICsgIC0gcmVnCj4gPiArICAtIGNsb2Nrcwo+ID4gKyAgLSBpbnRlcnJ1cHRzCj4gPiArICAtIGxh
YmVsCj4gPiArICAtIHJlc2V0cwo+ID4gKwo+ID4gK3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFs
c2UKPiA+ICsKPiA+ICtleGFtcGxlczoKPiA+ICsgIC0gfAo+ID4gKyAgICBwdnRANTBiMDAwMDAg
ewo+IAo+IAo+IE5vZGUgbmFtZXMgc2hvdWxkIGJlIGdlbmVyaWMuIFNlZSBhbHNvIGFuIGV4cGxh
bmF0aW9uIGFuZCBsaXN0IG9mCj4gZXhhbXBsZXMgKG5vdCBleGhhdXN0aXZlKSBpbiBEVCBzcGVj
aWZpY2F0aW9uOgo+IGh0dHBzOi8vZGV2aWNldHJlZS1zcGVjaWZpY2F0aW9uLnJlYWR0aGVkb2Nz
LmlvL2VuL2xhdGVzdC9jaGFwdGVyMi1kZXZpY2V0cmVlLWJhc2ljcy5odG1sI2dlbmVyaWMtbmFt
ZXMtcmVjb21tZW5kYXRpb24KPiBJZiB5b3UgY2Fubm90IGZpbmQgYSBuYW1lIG1hdGNoaW5nIHlv
dXIgZGV2aWNlLCBwbGVhc2UgY2hlY2sgaW4ga2VybmVsCj4gc291cmNlcyBmb3Igc2ltaWxhciBj
YXNlcyBvciB5b3UgY2FuIGdyb3cgdGhlIHNwZWMgKHZpYSBwdWxsIHJlcXVlc3QgdG8KPiBEVCBz
cGVjIHJlcG8pLgoKSSB3aWxsIHVwZGF0ZSB0aGUgZXhhbXBsZSBub2RlIG5hbWUgZnJvbSAicHZ0
QC4uLiIgdG8gdGhlIGdlbmVyaWMKInNlbnNvckAuLi4iLiBJcyB0aGlzIGFjY2VwdGFibGU/CgpC
ZXN0IHJlZ2FyZHMsCkh1YW4gSGUK
