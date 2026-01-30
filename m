Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net (zg8tmja2lje4os4yms4ymjma.icoremail.net [206.189.21.223])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E8171494DB;
	Fri, 30 Jan 2026 02:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.21.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769738437; cv=none; b=iToU5TR3o2n9YvHoA2nd5xPiySA1KrGpugBVXjqghYsspe1I+CYeC6xEtgp+u74vxqoApUfCltPWCfiHu71IcjdS7fry5W6tN2fsXrokL+5UzmLsRKqDch3M7V16s6F65RUq2MjEcqer1mNJnnflly/dPH5SxhdnuMHqS6ABFWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769738437; c=relaxed/simple;
	bh=9uXwRmGkNxOZ7z+KgpE/r2VSohESmH3LfI4emmRNIeU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=V+FSDz7P3POaJCP9W4TuEUCMSYWWadhlSZaV5gA9zR8Uzky2jvA42IF+ko5Vz7HgpxOGWVYb04hTqZj1O1J/57Xg7rcqkF5jnjpVsbflydCWN/qpyXWS/OtRUP5aSVssHizGnRaDt0i6E40YYNPr0XHlzvW3KuWhJ2PdCb9o0vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=206.189.21.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from hehuan1$eswincomputing.com ( [10.12.96.103] ) by
 ajax-webmail-app2 (Coremail) ; Fri, 30 Jan 2026 10:00:15 +0800 (GMT+08:00)
Date: Fri, 30 Jan 2026 10:00:15 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Huan He" <hehuan1@eswincomputing.com>
To: "Conor Dooley" <conor@kernel.org>
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, p.zabel@pengutronix.de,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com,
	luyulin@eswincomputing.com
Subject: Re: Re: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add Eswin EIC7700
 PVT sensor
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20260129-unpainted-educated-3017ed90c817@spud>
References: <20260128101400.859-1-hehuan1@eswincomputing.com>
 <20260128101636.914-1-hehuan1@eswincomputing.com>
 <20260128-amperage-handstand-36fa4b3ec447@spud>
 <372016a8.2e10.19c07b74792.Coremail.hehuan1@eswincomputing.com>
 <20260129-unpainted-educated-3017ed90c817@spud>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <1a01417e.2e9c.19c0ca12dc5.Coremail.hehuan1@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:TQJkCgBXoa2vEHxp2gcBAA--.486W
X-CM-SenderInfo: 5khk3tzqr6v25zlqu0xpsx3x1qjou0bp/1tbiAQEDCml7i40JogAB
	s3
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

PiA+ID4gPiAKPiA+ID4gPiBBZGQgZGV2aWNlIHRyZWUgYmluZGluZyBkb2N1bWVudGF0aW9uIGZv
ciBFU1dJTiBFSUM3NzAwIFByb2Nlc3MsIFZvbHRhZ2UKPiA+ID4gPiBhbmQgVGVtcGVyYXR1cmUg
c2Vuc29yLgo+ID4gPiA+IAo+ID4gPiA+IFRoZSBFSUM3NzAwIFNvQyBpbnRlZ3JhdGVzIHR3byBQ
VlQgaW5zdGFuY2VzIGZvciBtb25pdG9yaW5nIFNvQyBhbmQgRERSCj4gPiA+ID4gcG93ZXIgZG9t
YWlucyByZXNwZWN0aXZlbHkuCj4gPiA+ID4gCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogWXVsaW4g
THUgPGx1eXVsaW5AZXN3aW5jb21wdXRpbmcuY29tPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEh1
YW4gSGUgPGhlaHVhbjFAZXN3aW5jb21wdXRpbmcuY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICAu
Li4vYmluZGluZ3MvaHdtb24vZXN3aW4sZWljNzcwMC1wdnQueWFtbCAgICAgfCA3MCArKysrKysr
KysrKysrKysrKysrCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3MCBpbnNlcnRpb25zKCspCj4g
PiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvaHdtb24vZXN3aW4sZWljNzcwMC1wdnQueWFtbAo+ID4gPiA+IAo+ID4gPiA+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaHdtb24vZXN3aW4sZWljNzcw
MC1wdnQueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9od21vbi9lc3dp
bixlaWM3NzAwLXB2dC55YW1sCj4gPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+ID4gPiBp
bmRleCAwMDAwMDAwMDAwMDAuLmY0YmEyMjg5MjRmZQo+ID4gPiA+IC0tLSAvZGV2L251bGwKPiA+
ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaHdtb24vZXN3aW4s
ZWljNzcwMC1wdnQueWFtbAo+ID4gPiA+IEBAIC0wLDAgKzEsNzAgQEAKPiA+ID4gPiArIyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4gPiA+
ID4gKyVZQU1MIDEuMgo+ID4gPiA+ICstLS0KPiA+ID4gPiArJGlkOiBodHRwOi8vZGV2aWNldHJl
ZS5vcmcvc2NoZW1hcy9od21vbi9lc3dpbixlaWM3NzAwLXB2dC55YW1sIwo+ID4gPiA+ICskc2No
ZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiA+ID4g
PiArCj4gPiA+ID4gK3RpdGxlOiBFU1dJTiBFSUM3NzAwIFBWVCBTZW5zb3IKPiA+ID4gPiArCj4g
PiA+ID4gK21haW50YWluZXJzOgo+ID4gPiA+ICsgIC0gWXVsaW4gTHUgPGx1eXVsaW5AZXN3aW5j
b21wdXRpbmcuY29tPgo+ID4gPiA+ICsgIC0gSHVhbiBIZSA8aGVodWFuMUBlc3dpbmNvbXB1dGlu
Zy5jb20+Cj4gPiA+ID4gKwo+ID4gPiA+ICtkZXNjcmlwdGlvbjoKPiA+ID4gPiArICBFU1dJTiBF
SUM3NzAwIFNvQyBpbnRlZ3JhdGVzIGVtYmVkZGVkIHByb2Nlc3MsIHZvbHRhZ2UgYW5kIHRlbXBl
cmF0dXJlCj4gPiA+ID4gKyAgc2Vuc29ycyB0byBtb25pdG9yIHRoZSBpbnRlcm5hbCBTb0MgZW52
aXJvbm1lbnQuIFRoZSBzeXN0ZW0gaW5jbHVkZXMgdHdvCj4gPiA+ID4gKyAgUFZUIHNlbnNvciBp
bnN0YW5jZXMuIFRoZSBQVlQwIG1vbml0b3JzIHRoZSBtYWluIFNvQyBwb3dlciBkb21haW4uIFRo
ZQo+ID4gPiA+ICsgIFBWVDEgc2Vuc29yIG1vbml0b3JzIHRoZSBERFIgY29yZSBwb3dlciBkb21h
aW4uCj4gPiA+ID4gKwo+ID4gPiA+ICthbGxPZjoKPiA+ID4gPiArICAtICRyZWY6IC9zY2hlbWFz
L2h3bW9uL2h3bW9uLWNvbW1vbi55YW1sIwo+ID4gPiAKPiA+ID4gRllJLCBpbmNsdWRpbmcgdGhp
cyBpcyBraW5kYSBwb2ludGxlc3MgYmVjYXVzZSB5b3UgaGF2ZSB0aGUgbGFiZWwKPiA+ID4gcHJv
cGVydHkgZGVmaW5lZCBiZWxvdyBhbmQgeW91ciAiYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNl
IiBibG9ja3MKPiA+ID4gc2h1bnQtcmVzaXN0b3ItbWljcm8tb2htcyBmcm9tIGJlaW5nIHVzZWQu
Cj4gPiAKPiA+IEkgcGxhbiB0byBrZWVwIHRoZSAkcmVmOiAvc2NoZW1hcy9od21vbi9od21vbi1j
b21tb24ueWFtbCBpbiB1c2UsIGNoYW5nZQo+ID4gdGhlIG9yaWdpbmFsIGFkZGl0aW9uYWxQcm9w
ZXJ0aWVzOiBmYWxzZSB0byB1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlLAo+ID4gYW5kIHJl
bW92ZSB0aGUgbGFiZWwgZGVmaW5pdGlvbiBmcm9tIG91ciBzY2hlbWEgc2luY2UgaXQgaXMgYWxy
ZWFkeQo+ID4gcHJvdmlkZWQgYnkgaHdtb24tY29tbW9uLnlhbWwuIENvdWxkIHlvdSBwbGVhc2Ug
Y29uZmlybSBpZiB0aGlzCj4gPiBtb2RpZmljYXRpb24gY29uZm9ybXMgdG8gdGhlIGNvbW11bml0
eSBzdGFuZGFyZHM/Cj4gCj4gVGhhdCdzIGZpbmUuIERvZXMgdGhlIHNodW50IHJlc2lzdG9yIHBy
b3BlcnR5IGFwcGx5IG9uIHlvdXIgcGxhdGZvcm0/CgpUaGUgc2h1bnQtcmVzaXN0b3ItbWljcm8t
b2htcyBwcm9wZXJ0eSBkb2VzIG5vdCBhcHBseSB0byBvdXIgcGxhdGZvcm0uIFdlCm9ubHkgdXNl
IHRoZSBsYWJlbCBwcm9wZXJ0eSBmcm9tIGh3bW9uLWNvbW1vbi55YW1sLgoKQmVzdCByZWdhcmRz
LApIdWFuIEhlCg==
