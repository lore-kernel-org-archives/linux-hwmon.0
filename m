Received: from mail-10697.protonmail.ch (mail-10697.protonmail.ch [79.135.106.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B985D2119
	for <linux-hwmon@vger.kernel.org>; Wed,  1 Jan 2025 14:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735740935; cv=none; b=DSMQ5IjMLwVIJh4ZJykqj47cj0tKd7V9/GpFK0bFm2nKEEt4Ib3meYpH01g/d+B3Ger1X9l/4QWGGWa0iWDtqIDpGWcgLROBGbFu3SJLOoMsBEbE6FxqTrD+jaLZiDe6q2qlpXrxBfYjZ4rJyMc/HJMZikpHDQoKCEflZhf2TTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735740935; c=relaxed/simple;
	bh=PsDgxFIPHdjKywUN8Eh2lwfvOq/h4YiCNAtSYH8Qi8E=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UyTUoo6sxJS9k+PZqvSdwZ21t9C+QU142iuzC63JkWBNI2Ksdu046qXyJGtVKuwac7+tw6AXNtd/Zc8lNB9Gu09leJZAXOzo9oV/LgySAzPnCyGB41Q7p6yQ2lkOgZVPzISeLsjWPkYS+ljC7V1bbdSsW1DuCLvtPPFCkF8MYVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=AYjll68b; arc=none smtp.client-ip=79.135.106.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="AYjll68b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735740925; x=1736000125;
	bh=04A3A1uSeq8jy0tAdg6cI8DjLUZQeHn6+99GqE5ZNAs=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=AYjll68baNHTtTeyW6ejuuDGi4BHTYDdP0aw4VgBDcCayeQBeoCGOS2FjBp9hxpXn
	 s+2HDSF0dukZhAdI/PorRBM93xZMvtP+UvavloQlxbpSBciX1rXevo/WhW/ZeHslAs
	 EzYUKIHpH7weMNbvIyKLsFMzUD/Kez6OcbuwS2Ik/PXt+NgUMYvccSILvwH0Ke+Gjr
	 YSrGkyvfZRBSwPtOHCQTE9VJK45Ys8Wywy71lNXeBe18v4oEeCNph5MXHvq0fYT51c
	 orls5miLPvDhIz6gpp6YLPIGQ3pEdJp41qTTnu+8rvIFIS+iEnRaVU+/SBE8DdHGsT
	 WRzNzQGCgoqEw==
Date: Wed, 01 Jan 2025 14:15:20 +0000
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
From: John <therealgraysky@proton.me>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (nct6683) Add another customer ID for MSI
Message-ID: <RHgpMv2vm9aouIOCtyVI2mjH9atCSSL2Zo7fO9QqQwapyOv1ATQhPQGgITlRHcXcEGY_PcyxUPmbXmbPlqCGyFgaEjhuPeaCGvWY4UdB1uA=@proton.me>
Feedback-ID: 47473199:user:proton
X-Pm-Message-ID: 32d549a81d57f154fa2d8039180e3a509d30f989
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="b1=_s3iunyz6bDQ4HbjmPwoXb2eH2ldYM0vq6Im2Br7JsHE"

--b1=_s3iunyz6bDQ4HbjmPwoXb2eH2ldYM0vq6Im2Br7JsHE
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The attached is my attempt to add support for a new MSI motherboard with a =
NCT6687D on board. I do not know why one of the sensors it reads gets repor=
ted at -40.0 however. Calling sensors multiple times shows that -40.0 value=
 seems to bounce around from "Thermistor 0" and "Chipset B."

Feedback is appreciated.

For reference, I attached a sample output of sensors for the new chip with =
this patch applied:

nct6687-isa-0a20
Adapter: ISA adapter
VIN0:               1.01 V  (min =3D  +0.00 V, max =3D  +0.00 V)
VIN1:               1.01 V  (min =3D  +0.00 V, max =3D  +0.00 V)
VIN2:               1.30 V  (min =3D  +0.00 V, max =3D  +0.00 V)
VIN3:             672.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)
VIN4:               1.01 V  (min =3D  +0.00 V, max =3D  +0.00 V)
VIN5:               2.03 V  (min =3D  +0.00 V, max =3D  +0.00 V)
VIN6:             464.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)
VIN7:               1.52 V  (min =3D  +0.00 V, max =3D  +0.00 V)
VCC:                3.28 V  (min =3D  +0.00 V, max =3D  +0.00 V)
VSB:                3.33 V  (min =3D  +0.00 V, max =3D  +0.00 V)
AVSB:               3.33 V  (min =3D  +0.00 V, max =3D  +0.00 V)
VTT:                2.03 V  (min =3D  +0.00 V, max =3D  +0.00 V)
VBAT:               3.18 V  (min =3D  +0.00 V, max =3D  +0.00 V)
VREF:               1.79 V  (min =3D  +0.00 V, max =3D  +0.00 V)
fan1:              747 RPM  (min =3D    0 RPM)
fan2:              745 RPM  (min =3D    0 RPM)
fan3:                0 RPM  (min =3D    0 RPM)
fan4:                0 RPM  (min =3D    0 RPM)
fan12:               0 RPM  (min =3D    0 RPM)
fan13:               0 RPM  (min =3D    0 RPM)
fan14:               0 RPM  (min =3D    0 RPM)
fan15:               0 RPM  (min =3D    0 RPM)
fan16:               0 RPM  (min =3D    0 RPM)
AMD TSI Addr 98h:  +49.0=C2=B0C  (low  =3D  +0.0=C2=B0C)
                            (high =3D  +0.0=C2=B0C, hyst =3D  +0.0=C2=B0C)
                            (crit =3D  +0.0=C2=B0C)  sensor =3D AMD AMDSI
Diode 0 (curr):    +56.0=C2=B0C  (low  =3D  +0.0=C2=B0C)
                            (high =3D  +0.0=C2=B0C, hyst =3D  +0.0=C2=B0C)
                            (crit =3D  +0.0=C2=B0C)  sensor =3D thermal dio=
de
Thermistor 15:     +52.0=C2=B0C  (low  =3D  +0.0=C2=B0C)
                            (high =3D +124.0=C2=B0C, hyst =3D +34.0=C2=
=B0C)
                            (crit =3D  +0.0=C2=B0C)  sensor =3D thermistor
SMBus 0:           +56.0=C2=B0C  (low  =3D  +0.0=C2=B0C)
                            (high =3D  +0.0=C2=B0C, hyst =3D  +0.0=C2=B0C)
                            (crit =3D  +0.0=C2=B0C)
SMBus 1:           +56.0=C2=B0C  (low  =3D  +0.0=C2=B0C)
                            (high =3D  +0.0=C2=B0C, hyst =3D  +0.0=C2=B0C)
                            (crit =3D  +0.0=C2=B0C)
Thermistor 0:      -40.0=C2=B0C  (low  =3D  +0.0=C2=B0C)
                            (high =3D  +0.0=C2=B0C, hyst =3D  +0.0=C2=B0C)
                            (crit =3D  +0.0=C2=B0C)  sensor =3D thermistor
Thermistor 15:     +52.0=C2=B0C  (low  =3D  +0.0=C2=B0C)
                            (high =3D +124.0=C2=B0C, hyst =3D +34.0=C2=
=B0C)
                            (crit =3D  +0.0=C2=B0C)  sensor =3D thermistor
intrusion0:       ALARM
beep_enable:      disabled
--b1=_s3iunyz6bDQ4HbjmPwoXb2eH2ldYM0vq6Im2Br7JsHE
Content-Type: text/x-patch; name=hwmon-nct6683-Add-another-customer-ID-for-MSI.patch
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=hwmon-nct6683-Add-another-customer-ID-for-MSI.patch

RnJvbSA1NTIwNjI5ZTZkNjNhODNhNmY2NzcyYjk5YWVmNDA4YzExZjU4MDI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKb2huIEF1ZGlhIDx0aGVyZWFsZ3JheXNreUBwcm90b24ubWU+
CkRhdGU6IFdlZCwgMSBKYW4gMjAyNSAwODoyNzo1OSAtMDUwMApTdWJqZWN0OiBbUEFUQ0hdIGh3
bW9uOiAobmN0NjY4MykgQWRkIGFub3RoZXIgY3VzdG9tZXIgSUQgZm9yIE1TSQoKVGhpcyB2YWx1
ZSB3YXMgZm91bmQgb24gYW4gTVNJIE1QRyBYODcwRSBDQVJCT04gV0lGSSAoTVMtN0U0OSkKd2l0
aCBhbiBOQ1Q2Njg3RCBjaGlwLgoKU2lnbmVkLW9mZi1ieTogSm9obiBBdWRpYSA8dGhlcmVhbGdy
YXlza3lAcHJvdG9uLm1lPgotLS0KIERvY3VtZW50YXRpb24vaHdtb24vbmN0NjY4My5yc3QgfCAx
ICsKIGRyaXZlcnMvaHdtb24vbmN0NjY4My5jICAgICAgICAgfCAzICsrKwogMiBmaWxlcyBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2h3bW9uL25j
dDY2ODMucnN0IGIvRG9jdW1lbnRhdGlvbi9od21vbi9uY3Q2NjgzLnJzdAppbmRleCAyYTdhNzhl
YjFiNDYuLjIzMDJiMWFjOTViMSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9od21vbi9uY3Q2
NjgzLnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL2h3bW9uL25jdDY2ODMucnN0CkBAIC02NSw0ICs2
NSw1IEBAIEFTUm9jayBYNTcwCU5DVDY2ODNEIEVDIGZpcm13YXJlIHZlcnNpb24gMS4wIGJ1aWxk
IDA2LzI4LzE5CiBBU1JvY2sgWDY3MEUJTkNUNjY4NkQgRUMgZmlybXdhcmUgdmVyc2lvbiAxLjAg
YnVpbGQgMDUvMTkvMjIKIE1TSSBCNTUwCU5DVDY2ODdEIEVDIGZpcm13YXJlIHZlcnNpb24gMS4w
IGJ1aWxkIDA1LzA3LzIwCiBNU0kgWDY3MC1QCU5DVDY2ODdEIEVDIGZpcm13YXJlIHZlcnNpb24g
MC4wIGJ1aWxkIDA5LzI3LzIyCitNU0kgWDg3MEUJTkNUNjY4N0QgRUMgZmlybXdhcmUgdmVyc2lv
biAwLjAgYnVpbGQgMTEvMTMvMjQKID09PT09PT09PT09PT09PSA9PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9od21vbi9u
Y3Q2NjgzLmMgYi9kcml2ZXJzL2h3bW9uL25jdDY2ODMuYwppbmRleCBmNzE2MTVlMDZhOGYuLmUx
ZjI3MzZlZTNkMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9od21vbi9uY3Q2NjgzLmMKKysrIGIvZHJp
dmVycy9od21vbi9uY3Q2NjgzLmMKQEAgLTE3NSw2ICsxNzUsNyBAQCBzdXBlcmlvX2V4aXQoaW50
IGlvcmVnKQogI2RlZmluZSBOQ1Q2NjgzX0NVU1RPTUVSX0lEX01TSQkJMHgyMDEKICNkZWZpbmUg
TkNUNjY4M19DVVNUT01FUl9JRF9NU0kyCTB4MjAwCiAjZGVmaW5lIE5DVDY2ODNfQ1VTVE9NRVJf
SURfTVNJMwkweDIwNworI2RlZmluZSBOQ1Q2NjgzX0NVU1RPTUVSX0lEX01TSTQJMHgwMjBkCiAj
ZGVmaW5lIE5DVDY2ODNfQ1VTVE9NRVJfSURfQVNST0NLCQkweGUyYwogI2RlZmluZSBOQ1Q2Njgz
X0NVU1RPTUVSX0lEX0FTUk9DSzIJMHhlMWIKICNkZWZpbmUgTkNUNjY4M19DVVNUT01FUl9JRF9B
U1JPQ0szCTB4MTYzMQpAQCAtMTIyNyw2ICsxMjI4LDggQEAgc3RhdGljIGludCBuY3Q2NjgzX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCWJyZWFrOwogCWNhc2UgTkNUNjY4
M19DVVNUT01FUl9JRF9NU0kzOgogCQlicmVhazsKKwljYXNlIE5DVDY2ODNfQ1VTVE9NRVJfSURf
TVNJNDoKKwkJYnJlYWs7CiAJY2FzZSBOQ1Q2NjgzX0NVU1RPTUVSX0lEX0FTUk9DSzoKIAkJYnJl
YWs7CiAJY2FzZSBOQ1Q2NjgzX0NVU1RPTUVSX0lEX0FTUk9DSzI6Ci0tIAoyLjQ3LjEKCg==

--b1=_s3iunyz6bDQ4HbjmPwoXb2eH2ldYM0vq6Im2Br7JsHE--

