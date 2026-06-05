Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.75.44.102])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0217248F7C;
	Fri,  5 Jun 2026 05:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.75.44.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780639005; cv=none; b=mJccmVCfe3C1iAV79IXvRPcvx0Bb5ubpQAmskgtfKk88Q0zK7kNmv4L6lO76/QPZ45yqBZLNcKEydSvJzVHt4y/NvVMaF8DDiQN5omZxaQJZJ7wljiBOKRupXdWVynJtlAi9CJBwW2lp1FTxBGH7/zHbtjuc/8QFFhwYmwlmKdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780639005; c=relaxed/simple;
	bh=/fN376ZNt9a79pgv05JEdDMk0j0Xf0LIct2Pg2qiJbA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=NAooZbzAMl5pSEHMnLuf0jSt7+8f9/LtJfUXgxqydK/P3dtMlJp5CX7PmCx1341tAXjt9fKXTiDrdQ9TAUT9QWtAAVDuZufEhc9RxMIEC6fndaZjg7zigGIX3mBmpk7TquANZyxxMIbQFkkxBaF1fXb/AI0NLl9l7GwL5qWNPKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=13.75.44.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from hehuan1$eswincomputing.com ( [10.12.96.103] ) by
 ajax-webmail-app2 (Coremail) ; Fri, 5 Jun 2026 13:56:33 +0800 (GMT+08:00)
Date: Fri, 5 Jun 2026 13:56:33 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Huan He" <hehuan1@eswincomputing.com>
To: "Philipp Zabel" <p.zabel@pengutronix.de>
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, luyulin@eswincomputing.com
Subject: Re: Re: [PATCH v6 2/2] hwmon: Add Eswin EIC7700 PVT sensor driver
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <85e630579d97172e9bc64bce082b2d7b763a1263.camel@pengutronix.de>
References: <20260604080430.126-1-hehuan1@eswincomputing.com>
 <20260604080552.169-1-hehuan1@eswincomputing.com>
 <85e630579d97172e9bc64bce082b2d7b763a1263.camel@pengutronix.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <3cd3955b.6ff2.19e965acb49.Coremail.hehuan1@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:TQJkCgA3TJ8RZSJqPToiAA--.5281W
X-CM-SenderInfo: 5khk3tzqr6v25zlqu0xpsx3x1qjou0bp/1tbiAQEJCmohqKAFYQAD
	sn
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

SGkgUGhpbGlwcCwKClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlvdXIgZGV0YWlsZWQgcmV2aWV3
LiBXZSBhcHByZWNpYXRlIHRoZSBmZWVkYmFjay4KCj4gPiAKPiA+IEFkZCBzdXBwb3J0IGZvciBF
U1dJTiBFSUM3NzAwIFZvbHRhZ2UgYW5kIFRlbXBlcmF0dXJlIHNlbnNvci4gVGhlIGRyaXZlcgo+
ID4gc3VwcG9ydHMgdGVtcGVyYXR1cmUgYW5kIHZvbHRhZ2UgbW9uaXRvcmluZyB3aXRoIHBvbHlu
b21pYWwgY29udmVyc2lvbiwKPiA+IGFuZCBwcm92aWRlcyBzeXNmcyBpbnRlcmZhY2UgZm9yIHNl
bnNvciBkYXRhIGFjY2Vzcy4KPiA+IAo+ID4gVGhlIFBWVCBJUCBjb250YWlucyBvbmUgdGVtcGVy
YXR1cmUgc2Vuc29yIGFuZCBvbmUgdm9sdGFnZSBzZW5zb3IuCj4gPiAKPiA+IFNpZ25lZC1vZmYt
Ynk6IFl1bGluIEx1IDxsdXl1bGluQGVzd2luY29tcHV0aW5nLmNvbT4KPiA+IFNpZ25lZC1vZmYt
Ynk6IEh1YW4gSGUgPGhlaHVhbjFAZXN3aW5jb21wdXRpbmcuY29tPgo+ID4gLS0tCj4gPiAgZHJp
dmVycy9od21vbi9LY29uZmlnICAgICAgIHwgIDEyICsKPiA+ICBkcml2ZXJzL2h3bW9uL01ha2Vm
aWxlICAgICAgfCAgIDEgKwo+ID4gIGRyaXZlcnMvaHdtb24vZWljNzcwMC1wdnQuYyB8IDQ5NSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICBkcml2ZXJzL2h3bW9uL2Vp
Yzc3MDAtcHZ0LmggfCAgOTkgKysrKysrKysKPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDYwNyBpbnNl
cnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaHdtb24vZWljNzcwMC1w
dnQuYwo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2h3bW9uL2VpYzc3MDAtcHZ0LmgK
PiA+IAo+IFsuLi5dCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9od21vbi9laWM3NzAwLXB2dC5j
IGIvZHJpdmVycy9od21vbi9laWM3NzAwLXB2dC5jCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5lYTBmMTI5OWNkMjkKPiA+IC0tLSAvZGV2L251bGwKPiA+
ICsrKyBiL2RyaXZlcnMvaHdtb24vZWljNzcwMC1wdnQuYwo+ID4gQEAgLTAsMCArMSw0OTUgQEAK
PiBbLi4uXQo+ID4gK3N0YXRpYyBpbnQgZWljNzcwMF9wdnRfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKPiA+ICt7Cj4gPiArCXN0cnVjdCBwdnRfaHdtb24gKnB2dDsKPiA+ICsJ
aW50IHJldDsKPiA+ICsKPiA+ICsJcHZ0ID0gZWljNzcwMF9wdnRfY3JlYXRlX2RhdGEocGRldik7
Cj4gPiArCWlmIChJU19FUlIocHZ0KSkKPiA+ICsJCXJldHVybiBQVFJfRVJSKHB2dCk7Cj4gPiAr
Cj4gPiArCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIHB2dCk7Cj4gPiArCj4gPiArCXB2dC0+
cmVncyA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsKPiA+ICsJaWYg
KElTX0VSUihwdnQtPnJlZ3MpKQo+ID4gKwkJcmV0dXJuIFBUUl9FUlIocHZ0LT5yZWdzKTsKPiA+
ICsKPiA+ICsJcHZ0LT5jbGsgPSBkZXZtX2Nsa19nZXQoJnBkZXYtPmRldiwgTlVMTCk7Cj4gPiAr
CWlmIChJU19FUlIocHZ0LT5jbGspKQo+ID4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoJnBkZXYt
PmRldiwgUFRSX0VSUihwdnQtPmNsayksCj4gPiArCQkJCSAgICAgIkNvdWxkbid0IGdldCBjbG9j
a1xuIik7Cj4gPiArCj4gPiArCXB2dC0+cnN0ID0gZGV2bV9yZXNldF9jb250cm9sX2dldF9leGNs
dXNpdmVfZGVhc3NlcnRlZCgmcGRldi0+ZGV2LAo+ID4gKwkJCQkJCQkgICAgICAgTlVMTCk7Cj4g
Cj4gV2h5IHN0b3JlIHRoaXMgaW4gc3RydWN0IHB2dF9od21vbj8gSXQncyBub3QgdXNlZCBhbnl3
aGVyZSBlbHNlLgoKVGhlIHJlc2V0IGNvbnRyb2wgaXMgb25seSBuZWVkZWQgZHVyaW5nIHByb2Jl
IHRvIGRlYXNzZXJ0IHRoZSByZXNldCBsaW5lLAphbmQgaXQgaXMgbm90IHVzZWQgYWZ0ZXJ3YXJk
cy4KCkkgd2lsbCBjaGFuZ2UgaXQgdG8gYSBsb2NhbCB2YXJpYWJsZSBpbiBlaWM3NzAwX3B2dF9w
cm9iZSgpIGFuZCByZW1vdmUgdGhlCnJzdCBmaWVsZCBmcm9tIHN0cnVjdCBwdnRfaHdtb24uCgpU
aGUgY29kZSB3aWxsIGJlIGNoYW5nZWQgYWxvbmcgdGhlc2UgbGluZXM6CgrCoCDCoCBzdHJ1Y3Qg
cmVzZXRfY29udHJvbCAqcnN0OwoKwqAgwqAgcnN0ID0gZGV2bV9yZXNldF9jb250cm9sX2dldF9l
eGNsdXNpdmVfZGVhc3NlcnRlZCgmcGRldi0+ZGV2LCBOVUxMKTsKwqAgwqAgaWYgKElTX0VSUihy
c3QpKQrCoCDCoCDCoCDCoCByZXR1cm4gZGV2X2Vycl9wcm9iZShwdnQtPmRldiwgUFRSX0VSUihy
c3QpLArCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCJDb3VsZG4n
dCBnZXQgcmVzZXQgY29udHJvbFxuIik7CgpCZXN0IHJlZ2FyZHMsCkh1YW4gSGUK
