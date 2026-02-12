Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.75.44.102])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 958801DB125;
	Thu, 12 Feb 2026 04:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.75.44.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770870291; cv=none; b=SemDRmqKEbc76X+6z+Ouc7ThIncRRsyvaA3MktU7RmPr1yTInICGmMZGkwGwX7pvoFOUnhScLrgiytZCPl/sUvSabeoDp4+tVc0blQ5tj2pU/9+Kq6QakX88EmQe642B5hhSMKZu7iZWRDF+EwTQcvcRXpjUNekHMlSs+dYu6VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770870291; c=relaxed/simple;
	bh=CIbCCR+19o5I7FcWFDtQrWzYdZwSfwJMvii2NWqp6bQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=jQl2jxWiXpoWHHPAE99TdQRwLTiuYi39MoKIgJ3mHAQKUcQ2GQeqweVcwBeVxUFOtH89iVlBwd03e+kBHO88u51pY1/4zBOKrL0YUAOz4tHKUvvZ8svoAXkpasAKrfdzny/sPHp0/Wom93MVYDcS3U5m7QoqIfMBwthB0Qs/0fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=13.75.44.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from hehuan1$eswincomputing.com ( [10.12.96.103] ) by
 ajax-webmail-app2 (Coremail) ; Thu, 12 Feb 2026 12:24:29 +0800 (GMT+08:00)
Date: Thu, 12 Feb 2026 12:24:29 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Huan He" <hehuan1@eswincomputing.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, p.zabel@pengutronix.de,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com,
	luyulin@eswincomputing.com
Subject: Re: Re: [PATCH v2 0/2] Add driver support for ESWIN EIC7700 PVT
 controller
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <e648565e-59a9-4270-bbbd-7c53f5f65c6c@kernel.org>
References: <20260128101400.859-1-hehuan1@eswincomputing.com>
 <1a08e50a.362b.19c4c20db59.Coremail.hehuan1@eswincomputing.com>
 <e648565e-59a9-4270-bbbd-7c53f5f65c6c@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <2c43c2a.366b.19c5017e58a.Coremail.hehuan1@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:TQJkCgAnPqH9VY1pUQEAAA--.3W
X-CM-SenderInfo: 5khk3tzqr6v25zlqu0xpsx3x1qjou0bp/1tbiAQEQCmmMrw8NygAA
	sY
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

PiA+IEhpIEtyenlzenRvZiwgR3VlbnRlciwgYWxsLAo+ID4gCj4gPiBUaGUgdjEgcGF0Y2ggcmVj
ZWl2ZWQgcmV2aWV3cyBhbmQgY29tbWVudHMgZnJvbSBLcnp5c3p0b2YgYW5kIEd1ZW50ZXIuCj4g
PiBUaGUgdjIgcGF0Y2ggaW5jb3Jwb3JhdGVzIGNoYW5nZXMgYmFzZWQgb24gdGhvc2UgY29tbWVu
dHMgYW5kIGhhcyByZWNlaXZlZAo+ID4gZmVlZGJhY2sgZnJvbSBDb25vci4KPiA+IAo+ID4gSSdt
IG5vdCBzdXJlIGlmIHRoZXJlIGhhcyBiZWVuIHRpbWUgdG8gcmV2aWV3IHRoZSB1cGRhdGVkIHYy
IHlldC4gU2hvdWxkIEkKPiA+IHdhaXQgZm9yIGZ1cnRoZXIgZmVlZGJhY2ssIG9yIGlzIGFueSBh
Y3Rpb24gbmVlZGVkIGZyb20gbXkgc2lkZT8KPiAKPiAKPiBIdWg/IFlvdSByZWNlaXZlZCByZXZp
ZXcgb24gdjIgdGh1cyBzdWNoIHBpbmcgc3VnZ2VzdHMgdGhhdCB5b3UgZG9uJ3QKPiBjb25zaWRl
ciB0aGF0IGdpdmVuIHJldmlldyBhcyBhbiBpbXBvcnRhbnQgb25lLiBUaGF0IHdvdWxkIGJlIHZl
cnkgc2FkCj4gaW1wcmVzc2lvbiB0byBtYWtlLi4uCj4gCgpIaSBLcnp5c3p0b2YsIEd1ZW50ZXIs
IENvbm9yLAoKU29ycnkgZm9yIHRoZSBjb25mdXNpb24gLSBJIGRpZCBub3QgbWVhbiB0byBkaXNy
ZWdhcmQgdGhlIHJldmlldy4KCkluIHYxLCBJIHJlY2VpdmVkIGNvbW1lbnRzIG9uIGJvdGggdGhl
IFlBTUwgYmluZGluZyBhbmQgdGhlIGRyaXZlciBjb2RlCmZyb20geW91IGFuZCBHdWVudGVyLCBh
bmQgdXBkYXRlZCBib3RoIHBhcnRzIGluIHYyIGFjY29yZGluZ2x5LgoKRm9yIHYyLCBDb25vciBw
cm92aWRlZCBmdXJ0aGVyIGZlZWRiYWNrIG9uIHRoZSBiaW5kaW5nIHBhcnQsIHdoaWNoIEkgd2ls
bAphZGRyZXNzIGluIHYzLgoKTXkgcXVlc3Rpb24gd2FzIG1haW5seSBhYm91dCB0aGUgZHJpdmVy
IGNoYW5nZXMgaW4gdjIuIEkgaGF2ZSBub3QgcmVjZWl2ZWQKZnVydGhlciBjb21tZW50cyBvbiB0
aGF0IHBhcnQgc2luY2UgcG9zdGluZyB2Miwgc28gSSBqdXN0IHdhbnRlZCB0byBjaGVjawp3aGV0
aGVyIHRoZXJlIGFyZSBhbnkgcmVtYWluaW5nIGNvbmNlcm5zIHJlZ2FyZGluZyB0aGUgZHJpdmVy
IGNvZGUuCgpCZXN0IHJlZ2FyZHMsCkh1YW4gSGUK
