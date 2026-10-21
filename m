Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578219;
	b=2owKVH3oBaSHNzs7Wp+F3VtUtQh0VMyhoFua1+xNAnsrCG96tEUcWScxG7gKofiw2Wy2
	 NdpiMUf+8XNB4D1eesi6v0wDDeqCy4wSFZdwzGzdocI97B8pCgkH6EaHKMjWijsRaKW3U
	 AbWCgLRNz8kXhfB9o0yD2i/2rjraa0DUrncX7FJgXDHw/a9lWIrI0SzoLBHPt5b/LthvE
	 g5a1hDyFBUP2XxFzHWelwxTvqwpbRT6VabDZq/pns8CCJg2JTNE38bc7IHnPyhjhUAioA
	 yqCUx1Hgch6zPKQUuNABtnag+nmq/UTH/zdggzK2jVnYIws2Hf26Acad0xHb5pqNWzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578219;
	h=DMARC-Filter:DKIM-Signature:Mime-Version:X-Lms-Return-Path:
	 Content-Transfer-Encoding:X-Original-From:To:From:Subject:X-Mailer:Cc:
	 Date:Content-Type:Message-Id:Received;
	bh=EA7V6/8MwVsxIvRuVDLlyWtHuMFasL4clcDxUWfxa7Y=;
	b=fojFxStGOPaR1+yDrVteQFIrKzLPAvH+oIsrBmeUKQ7/rsKLFDfRCndkXQ0T+YSt2Fmp
	 Ds0SdnfY7DX+HanPBLS2ZL4xprQtwScMmiX+tCt4RTMQSobNeliJxJo5z1i+wNJdLmRa/
	 FhfIB1SGWXAb5byzxU0nU8iQALOv22nddi1tgyF1gbeu6fz0QRwHwJxytZIoEK3uhRsGw
	 f2kJ7Jbks0zEft2aetErIPdOLEBI47+TUc2sqT5NizV75rel5oppmvL/e32TL03sht3VM
	 o7NKTpF+DAnkNHu2lN6UnAXhUVwY77De83UNyU1tBpSr8H1vwR1X1vDmfeQ3TB+ELqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=spacemit.com;
	spf=pass smtp.mailfrom=spacemit.com;
	dkim=pass header.d=spacemit.com header.i=@spacemit.com header.a=rsa-sha256 header.s=feishu2303021642 header.b=V+hqI6+o;
	arc=none smtp.remote-ip=209.127.231.47
Received: from va-2-47.ptr.blmpb.com (va-2-47.ptr.blmpb.com [209.127.231.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57528606A319
	for <linux-hwmon@vger.kernel.org>; Wed, 21 Oct 2026 10:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57528606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=spacemit.com header.i=@spacemit.com header.a=rsa-sha256 header.s=feishu2303021642 header.b=V+hqI6+o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303021642; d=spacemit.com; t=1792578213; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=EA7V6/8MwVsxIvRuVDLlyWtHuMFasL4clcDxUWfxa7Y=;
 b=V+hqI6+ocf/ZOoHmf4QLLbBlSNLb9W01X0JNYnu8raZiZ7EmGvcmT5+GzCcNX1w6qETm0f
 haLB2YdYioOPwgVL6UFt3+rgmi638DdIcalBb0ytbwGgjirsljup8Ln0GyVsv+QIsojFIF
 dl+mqiUtvVeMY0UHsQHDCTq2qbleIxKvRhLsAmgnKMeMkN+K9XBzGCmktX68iZ8oZudyLp
 Onnu1K5QW3J3ucj+32fKBrCEthS3bC1c8op3TT573J6w2l7oCB+OvwP3BsPsyze7riypVe
 TWINtB/HAUB6DYF8tcLATvgLdqBXsHnJ0G7YWiUwtKAzu5XhiLo14oI13mdrsg==
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26ad892a3+eb89d0+vger.kernel.org+liwen.wu@spacemit.com>
Content-Transfer-Encoding: base64
X-Original-From: wuliwen <liwen.wu@spacemit.com>
To: <jdelvare@suse.com>, <linux@roeck-us.net>
From: "wuliwen" <liwen.wu@spacemit.com>
Subject: [PATCH] hwmon: (mr75203) Fix maximum clock divider
X-Mailer: git-send-email 2.34.1
Cc: <linux-hwmon@vger.kernel.org>, "wuliwen" <liwen.wu@spacemit.com>
Date: Wed, 21 Oct 2026 18:23:27 +0800
Content-Type: text/plain; charset=UTF-8
Message-Id: <20261021102327.2619070-1-liwen.wu@spacemit.com>
Received: from snode5.. ([120.237.158.181]) by smtp.feishu.cn with ESMTPS; Wed, 21 Oct 2026 18:23:30 +0800

VGhlIE1SNzUyMDMgaGFyZHdhcmUgZG9jdW1lbnRhdGlvbiBzcGVjaWZpZXMgdGhhdCB0aGUgY2xr
X3N5cyB0bw0KY2xrX2lwIGZyZXF1ZW5jeSByYXRpbyBtdXN0IGJlIGJldHdlZW4gMjoxIGFuZCA1
MTI6MS4gVGhpcyBsaW1pdA0KaXMgYWxzbyBleHBsaWNpdGx5IGRvY3VtZW50ZWQgaW4gdGhlIGV4
aXN0aW5nIHB2dF9pbml0KCkgY29tbWVudCwNCmJ1dCBDTEtfU1lTX0NZQ0xFU19NQVggaXMgaW5j
b3JyZWN0bHkgZGVmaW5lZCBhcyA1MTQuDQoNCkFzIGEgcmVzdWx0LCBib3RoIHRoZSBkaXZpZGVy
IHNlbGVjdGlvbiBjaGVjayBhbmQgdGhlIGZpbmFsIGNsYW1wDQphbGxvdyB2YWx1ZXMgYmV5b25k
IHRoZSBzdXBwb3J0ZWQgcmFuZ2UuIEF0IGEgZGl2aWRlciBvZiA1MTQsDQpzdWJ0cmFjdGluZyAy
IHlpZWxkcyBhIGtleSBvZiA1MTIsIGNhdXNpbmcgdGhlIDgtYml0IENMS19TWU5USA0KTE8sIEhJ
LCBhbmQgSE9MRCBmaWVsZHMgdG8gb3ZlcmZsb3cgaW50byBhZGphY2VudCBiaXRzLg0KDQpDb3Jy
ZWN0IENMS19TWVNfQ1lDTEVTX01BWCB0byA1MTIgdG8gZW5mb3JjZSB0aGUgZG9jdW1lbnRlZCBs
aW1pdA0KYW5kIHByZXZlbnQgaW52YWxpZCBjbG9jayBzeW50aGVzaXplciBjb25maWd1cmF0aW9u
cy4NCg0KRml4ZXM6IDlkODIzMzUxYTMzNyAoImh3bW9uOiBBZGQgaGFyZHdhcmUgbW9uaXRvcmlu
ZyBkcml2ZXIgZm9yIE1vb3J0ZWMgTVI3NTIwMyBQVlQgY29udHJvbGxlciIpDQpTaWduZWQtb2Zm
LWJ5OiB3dWxpd2VuIDxsaXdlbi53dUBzcGFjZW1pdC5jb20+DQotLS0NCiBkcml2ZXJzL2h3bW9u
L21yNzUyMDMuYyB8IDIgKy0NCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvaHdtb24vbXI3NTIwMy5jIGIvZHJpdmVy
cy9od21vbi9tcjc1MjAzLmMNCmluZGV4IDc4NDgxOThmODk5Ni4uOGFmYzRmNmVmMGFhIDEwMDY0
NA0KLS0tIGEvZHJpdmVycy9od21vbi9tcjc1MjAzLmMNCisrKyBiL2RyaXZlcnMvaHdtb24vbXI3
NTIwMy5jDQpAQCAtNDEsNyArNDEsNyBAQA0KICNkZWZpbmUgQ0xLX1NZTlRIX0hJX1NGVAk4DQog
I2RlZmluZSBDTEtfU1lOVEhfSE9MRF9TRlQJMTYNCiAjZGVmaW5lIENMS19TWU5USF9FTgkJQklU
KDI0KQ0KLSNkZWZpbmUgQ0xLX1NZU19DWUNMRVNfTUFYCTUxNA0KKyNkZWZpbmUgQ0xLX1NZU19D
WUNMRVNfTUFYCTUxMg0KICNkZWZpbmUgQ0xLX1NZU19DWUNMRVNfTUlOCTINCiANCiAjZGVmaW5l
IFNESUZfRElTQUJMRQkweDA0DQotLSANCjIuMzQuMQ0KClRoaXMgbWVzc2FnZSBhbmQgYW55IGF0
dGFjaG1lbnQgYXJlIGNvbmZpZGVudGlhbCBhbmQgbWF5IGJlIHByaXZpbGVnZWQgb3Igb3RoZXJ3
aXNlIHByb3RlY3RlZCBmcm9tIGRpc2Nsb3N1cmUuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVk
IHJlY2lwaWVudCBvZiB0aGlzIG1lc3NhZ2UsIHBsZWFzZSBkZWxldGUgaXQgYW5kIGFueSBhdHRh
Y2htZW50IGZyb20geW91ciBzeXN0ZW0gYW5kIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5
IGJ5IHJlcGx5IGUtbWFpbC4gVW5pbnRlbmRlZCByZWNpcGllbnRzIHNob3VsZCBub3QgdXNlLCBj
b3B5LCBkaXNjbG9zZSBvciB0YWtlIGFueSBhY3Rpb24gYmFzZWQgb24gdGhpcyBtZXNzYWdlIG9y
IGFueSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBtZXNzYWdlLiBFbWFpbHMgY2Fubm90
IGJlIGd1YXJhbnRlZWQgdG8gYmUgc2VjdXJlIG9yIGVycm9yIGZyZWUgYXMgdGhleSBjYW4gYmUg
aW50ZXJjZXB0ZWQsIGFtZW5kZWQsIGxvc3Qgb3IgZGVzdHJveWVkLCBhbmQgeW91IHNob3VsZCB0
YWtlIGZ1bGwgcmVzcG9uc2liaWxpdHkgZm9yIHNlY3VyaXR5IGNoZWNraW5nLiAKIArmnKzpgq7k
u7blj4rlhbbku7vkvZXpmYTku7blhbfmnInkv53lr4bmgKfotKjvvIzlubblj6/og73lj5flhbbk
u5bkv53miqTmiJbkuI3lhYHorrjooqvmiqvpnLLnu5nnrKzkuInmlrnjgILlpoLpmIHkuIvor6/m
lLbliLDmnKzpgq7ku7bvvIzmlazor7fnq4vljbPku6Xlm57lpI3nlLXlrZDpgq7ku7bnmoTmlrnl
vI/pgJrnn6Xlj5Hku7bkurrvvIzlubblsIbmnKzpgq7ku7blj4rlhbbku7vkvZXpmYTku7bku47p
mIHkuIvns7vnu5/kuK3kuojku6XliKDpmaTjgILlpoLpmIHkuIvlubbpnZ7mnKzpgq7ku7blhpnm
mI7kuYvmlLbku7bkurrvvIzmlazor7fliIfli7/kvb/nlKjjgIHlpI3liLbjgIHmiqvpnLLmnKzp
gq7ku7bmiJblhbbku7vkvZXlhoXlrrnvvIzkuqbor7fliIfli7/kvp3mnKzpgq7ku7bmiJblhbbk
u7vkvZXlhoXlrrnogIzph4flj5bku7vkvZXooYzliqjjgILnlLXlrZDpgq7ku7bml6Dms5Xkv53o
r4HmmK/kuIDnp43lronlhajlkozkuI3kvJrlh7rnjrDku7vkvZXlt67plJnnmoTpgJrkv6Hmlrnl
vI/vvIzlj6/og73kvJrooqvmi6bmiKrjgIHkv67mlLnjgIHkuKLlpLHmiJbmjZ/lnY/vvIzmlLbk
u7bkurrpnIDoh6rooYzotJ/otKPlgZrlpb3lronlhajmo4Dmn6XjgII=
