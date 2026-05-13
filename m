Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.175.55.52])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F118B239E75;
	Wed, 13 May 2026 07:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.175.55.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778655836; cv=none; b=mjpAW0nekR8n6pTyC1JKLzulhg0iH7dGnGiuZC7R6Is190gdtSzFADQsHqYaLxA3ecos42Umxgz1jC0Mlq0/1izn+m88FNA1fEJ9NZb9H0UMm4cXxFynFz+P/Zf57FDLHR9XRjRRCxfyZeYDx+HjcUaNgjmflbx26GIxfjif75g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778655836; c=relaxed/simple;
	bh=0FY7JyXpC5qFAoRGp8Q6IRw5utBLdqLGmJnoGzyWg08=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=T/U9uujY53YTtBF+PtvEzd8tYT8mbzINroh9+uNJczzAq74zFZDYaweVhwRiRWjjsCBw30lzpx/RYItckkN+eZl4r3Bdl3Vu6t63Fk0KB8i5oFelGXCP3ttYsSOKnrFs/FQGaPZ5SLRtngxmPMT9CS0yUEyq6a2mbfa0YvimK3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=52.175.55.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from hehuan1$eswincomputing.com ( [10.12.96.103] ) by
 ajax-webmail-app2 (Coremail) ; Wed, 13 May 2026 15:03:36 +0800 (GMT+08:00)
Date: Wed, 13 May 2026 15:03:36 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Huan He" <hehuan1@eswincomputing.com>
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
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
In-Reply-To: <c4082788-9e2f-4108-9d2f-13648bf4e5bf@roeck-us.net>
References: <20260430064107.1598-1-hehuan1@eswincomputing.com>
 <20260430064444.1615-1-hehuan1@eswincomputing.com>
 <20260503-brave-bullfinch-of-innovation-942914@quoll>
 <4339b90a.6169.19e1b798c90.Coremail.hehuan1@eswincomputing.com>
 <c4082788-9e2f-4108-9d2f-13648bf4e5bf@roeck-us.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <70426510.61e4.19e2025eac7.Coremail.hehuan1@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:TQJkCgDH3aBIIgRqPv0YAA--.5758W
X-CM-SenderInfo: 5khk3tzqr6v25zlqu0xpsx3x1qjou0bp/1tbiAgEGCmoDVpFTxgAA
	s0
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

SGkgR3VlbnRlciwKClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlvdXIgZGV0YWlsZWQgcmV2aWV3
LiBXZSBhcHByZWNpYXRlIHRoZSBmZWVkYmFjay4KCj4gCj4gT24gNS8xMi8yNiAwMjoxNiwgSHVh
biBIZSB3cm90ZToKPiA+IEhpIEtyenlzenRvZiwKPiA+IAo+ID4gVGhhbmsgeW91IHZlcnkgbXVj
aCBmb3IgeW91ciBkZXRhaWxlZCByZXZpZXcuIFdlIGFwcHJlY2lhdGUgdGhlIGZlZWRiYWNrLgo+
ID4gCj4gPj4gT24gVGh1LCBBcHIgMzAsIDIwMjYgYXQgMDI6NDQ6NDRQTSArMDgwMCwgaGVodWFu
MUBlc3dpbmNvbXB1dGluZy5jb20gd3JvdGU6Cj4gPj4+ICsKPiA+Pj4gKyAgbGFiZWw6Cj4gPj4+
ICsgICAgZW51bToKPiA+Pj4gKyAgICAgIC0gcHZ0MAo+ID4+PiArICAgICAgLSBwdnQxCj4gPj4K
PiA+PiBObywgbGFiZWwgaXMgdXNlci12aXNpYmxlIG5hbWUuIENhbiBiZSB3aGF0ZXZlciB1c2Vy
IGRlY2lkZXMuCj4gPj4KPiA+PiBQbGVhc2UgcmVhZCB3cml0aW5nIGJpbmRpbmdzIC0gaW5zdGFu
Y2UgSURzIGFyZSBub3QgYWxsb3dlZC4KPiA+IAo+ID4gVGhhbmtzIGZvciB0aGUgY2xhcmlmaWNh
dGlvbi4KPiA+IEkgYW0gcGxhbm5pbmcgdG8gdXBkYXRlIHRoZSBuZXh0IHJldmlzaW9uIGFzIGZv
bGxvd3MuIFdvdWxkIHRoaXMgYmUKPiA+IGFjY2VwdGFibGU/Cj4gPiAKPiA+IFlBTUw6Cj4gPiAt
IMKgbGFiZWw6Cj4gPiAtIMKgIMKgZW51bToKPiA+IC0gwqAgwqAgwqAtIHB2dDAKPiA+IC0gwqAg
wqAgwqAtIHB2dDEKPiA+ICsgwqBsYWJlbDogdHJ1ZQo+ID4gCj4gPiByZXF1aXJlZDoKPiA+ICDC
oCAtIGNvbXBhdGlibGUKPiA+ICDCoCAtIHJlZwo+ID4gIMKgIC0gY2xvY2tzCj4gPiAgwqAgLSBp
bnRlcnJ1cHRzCj4gPiAtIC0gbGFiZWwKPiA+IAo+ID4gRHJpdmVyOgo+ID4gIMKgc3RhdGljIGlu
dCBlaWM3NzAwX3B2dF9jcmVhdGVfaHdtb24oc3RydWN0IHB2dF9od21vbiAqcHZ0KQo+ID4gIMKg
ewo+ID4gLSDCoCBzdHJ1Y3QgZGV2aWNlICpkZXYgPSBwdnQtPmRldjsKPiA+IC0gwqAgc3RydWN0
IGRldmljZV9ub2RlICpucCA9IGRldi0+b2Zfbm9kZTsKPiA+IC0gwqAgY29uc3QgY2hhciAqbm9k
ZV9sYWJlbDsKPiA+IC0gwqAgaW50IHR5cGU7Cj4gPiAtIMKgIGNvbnN0IGNoYXIgKm5hbWVzWzJd
ID0geyJzb2NfcHZ0IiwgImRkcl9wdnQifTsKPiA+IC0KPiA+IC0gwqAgaWYgKG9mX3Byb3BlcnR5
X3JlYWRfc3RyaW5nKG5wLCAibGFiZWwiLCAmbm9kZV9sYWJlbCkpIHsKPiA+IC0gwqAgwqAgwqAg
ZGV2X2VycihkZXYsICJNaXNzaW5nICdsYWJlbCcgcHJvcGVydHkgaW4gRFRTIG5vZGVcbiIpOwo+
ID4gLSDCoCDCoCDCoCByZXR1cm4gLUVJTlZBTDsKPiA+IC0gwqAgfQo+ID4gLQo+ID4gLSDCoCBp
ZiAoc3RyY21wKG5vZGVfbGFiZWwsICJwdnQwIikgPT0gMCkgewo+ID4gLSDCoCDCoCDCoCB0eXBl
ID0gMDsKPiA+IC0gwqAgfSBlbHNlIGlmIChzdHJjbXAobm9kZV9sYWJlbCwgInB2dDEiKSA9PSAw
KSB7Cj4gPiAtIMKgIMKgIMKgIHR5cGUgPSAxOwo+ID4gLSDCoCB9IGVsc2Ugewo+ID4gLSDCoCDC
oCDCoCBkZXZfZXJyKHB2dC0+ZGV2LCAiVW5zdXBwb3J0ZWQgbGFiZWw6ICVzXG4iLCBub2RlX2xh
YmVsKTsKPiA+IC0gwqAgwqAgwqAgcmV0dXJuIC1FSU5WQUw7Cj4gPiAtIMKgIH0KPiA+ICsgwqAg
Y29uc3QgY2hhciAqbmFtZSA9ICJwdnQiOwo+ID4gKwo+ID4gKyDCoCBvZl9wcm9wZXJ0eV9yZWFk
X3N0cmluZyhwdnQtPmRldi0+b2Zfbm9kZSwgImxhYmVsIiwgJm5hbWUpOwo+ID4gICAKPiA+IC0g
wqAgcHZ0LT5od21vbiA9IGRldm1faHdtb25fZGV2aWNlX3JlZ2lzdGVyX3dpdGhfaW5mbyhwdnQt
PmRldiwgbmFtZXNbdHlwZV0sCj4gPiArIMKgIHB2dC0+aHdtb24gPSBkZXZtX2h3bW9uX2Rldmlj
ZV9yZWdpc3Rlcl93aXRoX2luZm8ocHZ0LT5kZXYsIG5hbWUsCj4gPiAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcHZ0LCAmcHZ0X2h3bW9uX2luZm8sCj4gPiAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgTlVMTCk7Cj4gPiAK
PiAKPiBUaGlzIHdvdWxkIHRyeSB0byByZWdpc3RlciBhIGZyZWUtdGV4dCBuYW1lIGZvciB0aGUg
aHdtb24gZGV2aWNlLAo+IHdoaWNoIHdvdWxkIGJlIHVuYWNjZXB0YWJsZS4KPiAKPiBUaGVyZSBh
cmUgbG90cyBvZiBtdWx0aS1jaGFubmVsIGRldmljZXMgb3V0IHRoZXJlLiBOb25lIG9mIHRoZW0K
PiBoYXZlIHRob3NlIHByb2JsZW1zLiBXaHkgZG8geW91IGluc2lzdCBpbiBmcmVlLXRleHQgbmFt
ZXMgaW5zdGVhZCBvZgo+IHVzaW5nLCBzYXksICJyZWciIHRvIGRpc3Rpbmd1aXNoIHRoZSBjaGFu
bmVscyA/CgpUaGFua3MgZm9yIHRoZSBjbGFyaWZpY2F0aW9uLgoKSW4gdGhlIG5leHQgcmV2aXNp
b24sIEkgd2lsbCByZWdpc3RlciB0aGUgaHdtb24gZGV2aWNlIHdpdGggdGhlIGZpeGVkIG5hbWUK
InB2dCIuCgpCZXN0IHJlZ2FyZHMsCkh1YW4gSGUKCg==
