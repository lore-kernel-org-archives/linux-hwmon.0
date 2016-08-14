Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:49764 "EHLO
	gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751681AbcHNX41 (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sun, 14 Aug 2016 19:56:27 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 652B88023A
	for <linux-hwmon@vger.kernel.org>; Mon, 15 Aug 2016 11:56:23 +1200 (NZST)
From: Joshua Scott <Joshua.Scott@alliedtelesis.co.nz>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: A question about masks in sysfs
Date: Sun, 14 Aug 2016 23:56:22 +0000
Message-ID: <57B10525.6030200@alliedtelesis.co.nz>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <16DD9492CE77F748A3DCBCD732D756D7@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

SGksDQoNCkkgYW0gd2FudGluZyB0byBhZGQgd3JpdGUgc3VwcG9ydCB0byB0aGUgYWxhcm1zIG1h
c2sgc3lzZnMgZW50cnkgZm9yIHRoZSANCmFkdDc0NzAgZHJpdmVyLg0KDQpCZWZvcmUgZ29pbmcg
Zm9yd2FyZCB3aXRoIHRoaXMsIEkgaGFkIGEgcXVlc3Rpb24gYWJvdXQgY29uc2lzdGVuY3kgaW4g
DQp0aGlzIGFyZWEuDQoNCkluIHRoZSBvdGhlciBkcml2ZXJzIEkgc2VlIHRoYXQgZXhwb3NlIG1h
c2tzLCBpdCBsb29rcyBsaWtlIHRoZXkgZG8gdGhpcyANCmFzIGRlY2ltYWwgbnVtYmVycyAoYWRt
MTAyNi5jLCB3ODM2MjdoZi5jLCB3ODM3ODFkLmMpLg0KDQpUaGUgYWR0NzQ3MCBkcml2ZXIgYWxy
ZWFkeSBleHBvc2VzIHRoZSBhbGFybSBtYXNrLCBidXQgaW5zdGVhZCBvZiANCmRlY2ltYWwgaXQg
dXNlcyBoZXguDQoNCldoYXQgd291bGQgYmUgdGhlIGNvcnJlY3Qgd2F5IG9mIGFkZGluZyB3cml0
ZSBzdXBwb3J0IHRvIHRoaXM/IFNob3VsZCBpdCANCmJlIGNvbnZlcnRlZCB0byBkZWNpbWFsIHRv
IGJlIGNvbnNpc3RlbnQgd2l0aCBvdGhlciBkcml2ZXJzLCBvciBzaG91bGQgDQppdCByZW1haW4g
aW4gaGV4IHRvIHByZXZlbnQgYnJlYWtpbmcgYW55IHVzZXJzcGFjZSBjb2RlIHRoYXQgbWF5IGJl
IA0KcmVseWluZyBvbiB0aGUgY3VycmVudCBiZWhhdmlvdXI/DQoNCg0KVGhhbmtzLA0KSm9zaHVh
IFNjb3R0
