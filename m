Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62376F082
	for <linux-hwmon@vger.kernel.org>; Thu,  8 Feb 2024 15:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707405549; cv=none; b=dXDGH4cPf3vF8UQZtRNWAT+yp3nW/RqXXETeAyjZBOnyUhy4amJ9RY56jXb1vhG6FAXK28q4SY5njW+JGxC/pph3SV0p6725kmrhto42Meery3tsII6i/FOlo3iQ2GFLf7Ipzoi86bSZ+dHUo0hIk6MplQwefTvMvY8HHo330ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707405549; c=relaxed/simple;
	bh=CAEXknwGhkxyrhiDQr/janOqnbhjc11Se60GYTtkmAo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IlrfVsQs7jm2d3P+9R7D1Il3dYzSc5dK/iwMctlODwIkf9lGVNK8lBTJrJ0enwc96p+RPUmgNxoBdZUpi1pCLXQnt6rtEmDeJZN63a3/nzVQjJ3gXFjfpnUeKYOC6O6q4X/Y2kXgSsyo3ZcHU3OHSi8f6EHlmBxrRzrNoVHX88o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dhcZM7Hc; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dhcZM7Hc"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a2a17f3217aso247994266b.2
        for <linux-hwmon@vger.kernel.org>; Thu, 08 Feb 2024 07:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707405546; x=1708010346; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CAEXknwGhkxyrhiDQr/janOqnbhjc11Se60GYTtkmAo=;
        b=dhcZM7HcnROEoFINu261WTXNtwXa6hh8svfkxkSn8fv20M+jJEKEz9OEuiHh2NRp5P
         9OK0lQ/3fwqNGPLqUCQJJDZUjo0ewPedVlyGeyZ0FEdAxAdCup89tPd4YYq1UlXLLtIq
         pjVqrWW3hFIbin6AElwJzKxTvV1T1cYE/G+jKfK3BD3iID0bZznT1+xtw6iODBFj/PUU
         RaIOy5eiJsCZm4Ac8cWyzivRQQ+rDhAVBEh+AOdsUdAmyx0czQP7UpEBu7JkXih+XUs0
         TmGxw49NuECJGfGw3buIv+QyCWIEQaKRf1zNS3om3jXlTb88G503OMJI5Poo8vny/7d9
         BwtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707405546; x=1708010346;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CAEXknwGhkxyrhiDQr/janOqnbhjc11Se60GYTtkmAo=;
        b=V8sOj2P85raCeGhFX2opi9cdOTcJsOSBIwN616SrenAv4vcBaAxjc6aEJAAlZ0qVkv
         GBJ+ayRlP+9jm35IIvmoVT2ijuEDtMNwVOZpyAow37Umanzdx/6pEwWVTMhEu/6+g74q
         KwP8BvZ3+ZCSB3RNI08kXfMCTK/zctKzM6E1FYtzZXO/jBBNCd/oQCGXajpeNViwMB8A
         dGD9ysEdagSRRTBCN/WkxEwbQvF6JQ/IfDaB4Ar9s3y/L2WkIlmK+xd60n/2M3qIcCCz
         /g7qX6ttUpfMZaHCVbPjECU5pEhUIov7o4KMNS0TfVBmv9Qkq49AD3QoRu3+S4CZCTF+
         RYDA==
X-Gm-Message-State: AOJu0YxCvNcbbGJzg5D+T2e+NfpDBtfy0mRyoabQB28lEv3Mbxu8TkrP
	QO2KXst+VLznPpwzzhl2HVwJ/GxuKrZ0on5rNK93+7RpMVYdwfRg
X-Google-Smtp-Source: AGHT+IEEe6a6P6FBHbfRXhtUJZbmFKQuPMVWJyJWKew+yvdj6gCjyNdAqvZPU4IN6QHJ1UwUV/PC9w==
X-Received: by 2002:a17:907:78d9:b0:a38:2694:46f8 with SMTP id kv25-20020a17090778d900b00a38269446f8mr5739897ejc.12.1707405545629;
        Thu, 08 Feb 2024 07:19:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWyx5a48reLmeJyBHA0DhgzV5eeVe/v0nMIEj0fMybrBi2w9NWJEuaXB34ecgGMM8pNZxfXhF5eQ3ZkHh91/SL59SNUlgVs357qp0ptpObZi/2Nr07aUXItvtxuwg==
Received: from ?IPv6:2003:f6:ef1b:2000:944c:cbc7:1e1c:2c47? (p200300f6ef1b2000944ccbc71e1c2c47.dip0.t-ipconnect.de. [2003:f6:ef1b:2000:944c:cbc7:1e1c:2c47])
        by smtp.gmail.com with ESMTPSA id ti10-20020a170907c20a00b00a382a80b160sm152384ejc.24.2024.02.08.07.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 07:19:05 -0800 (PST)
Message-ID: <e62ba4336a09b50549e8d32623b61d4939ae63d9.camel@gmail.com>
Subject: Re: [bug report] hwmon: ltc4282: add support for the LTC4282 chip
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Dan Carpenter
 <dan.carpenter@linaro.org>,  nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org
Date: Thu, 08 Feb 2024 16:22:24 +0100
In-Reply-To: <4d4e37d8-3011-4d60-b805-adcdb31ae57f@roeck-us.net>
References: <b6fb236a-c3c1-4c5c-94bd-1f68b5aeac41@moroto.mountain>
	 <53e0e2c7bb9cafb4efa3748ecf3ec765c262db83.camel@gmail.com>
	 <c2c5b8b0-d3db-4212-8311-ee54119389c4@roeck-us.net>
	 <9151c5df901325aed61e87019a5a1cffc46cf579.camel@gmail.com>
	 <4d4e37d8-3011-4d60-b805-adcdb31ae57f@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.50.3 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

T24gVGh1LCAyMDI0LTAyLTA4IGF0IDA2OjE5IC0wODAwLCBHdWVudGVyIFJvZWNrIHdyb3RlOgo+
IE9uIDIvOC8yNCAwMDoxMiwgTnVubyBTw6Egd3JvdGU6Cj4gPiBPbiBXZWQsIDIwMjQtMDItMDcg
YXQgMDg6NDkgLTA4MDAsIEd1ZW50ZXIgUm9lY2sgd3JvdGU6Cj4gPiA+IE9uIDIvNy8yNCAwMjox
OSwgTnVubyBTw6Egd3JvdGU6Cj4gPiA+ID4gSGkgRGFuLAo+ID4gPiA+IAo+ID4gPiA+IE9uIFdl
ZCwgMjAyNC0wMi0wNyBhdCAxMjo1MSArMDMwMCwgRGFuIENhcnBlbnRlciB3cm90ZToKPiA+ID4g
PiA+IEhlbGxvIE51bm8gU2EsCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFRoZSBwYXRjaCA4NDhhNTAx
OWRlZDU6ICJod21vbjogbHRjNDI4MjogYWRkIHN1cHBvcnQgZm9yIHRoZSBMVEM0MjgyCj4gPiA+
ID4gPiBjaGlwIiBmcm9tIEphbiAyOSwgMjAyNCAobGludXgtbmV4dCksIGxlYWRzIHRvIHRoZSBm
b2xsb3dpbmcgU21hdGNoCj4gPiA+ID4gPiBzdGF0aWMgY2hlY2tlciB3YXJuaW5nOgo+ID4gPiA+
ID4gCj4gPiA+ID4gPiAJZHJpdmVycy9od21vbi9sdGM0MjgyLmM6NzMyCj4gPiA+ID4gPiBsdGM0
MjgyX3dyaXRlX3ZvbHRhZ2VfYnl0ZV9jYWNoZWQoKQo+ID4gPiA+ID4gCXdhcm46IG5vIGxvd2Vy
IGJvdW5kIG9uICd2YWwnIHJsPSdzNjRtaW4tNDI5NDk2NzI5NCcKPiA+ID4gPiA+IAo+ID4gPiA+
ID4gZHJpdmVycy9od21vbi9sdGM0MjgyLmMKPiA+ID4gPiA+IMKgwqDCoMKgwqAgNzIzIHN0YXRp
YyBpbnQgbHRjNDI4Ml93cml0ZV92b2x0YWdlX2J5dGVfY2FjaGVkKGNvbnN0IHN0cnVjdAo+ID4g
PiA+ID4gbHRjNDI4Ml9zdGF0ZSAqc3QsCj4gPiA+ID4gPiDCoMKgwqDCoMKgIDcyNMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1MzIgcmVnLCB1MzIKPiA+ID4gPiA+IGZzLAo+ID4g
PiA+ID4gbG9uZwo+ID4gPiA+ID4gdmFsLAo+ID4gPiA+ID4gwqDCoMKgwqDCoCA3MjXCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdTMyICpjYWNoZV9yYXcpCj4gPiA+ID4gPiDCoMKg
wqDCoMKgIDcyNiB7Cj4gPiA+ID4gPiDCoMKgwqDCoMKgIDcyN8KgwqDCoMKgwqDCoMKgwqAgdTMy
IGluOwo+ID4gPiA+ID4gwqDCoMKgwqDCoCA3MjgKPiA+ID4gPiA+IMKgwqDCoMKgwqAgNzI5wqDC
oMKgwqDCoMKgwqDCoCBpZiAodmFsID49IGZzKQo+ID4gPiA+ID4gwqDCoMKgwqDCoCA3MzDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbiA9IFU4X01BWDsKPiA+ID4gPiA+IMKgwqDC
oMKgwqAgNzMxwqDCoMKgwqDCoMKgwqDCoCBlbHNlCj4gPiA+ID4gPiAtLT4gNzMywqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW4gPSBESVZfUk9VTkRfQ0xPU0VTVCh2YWwgKiBVOF9N
QVgsIGZzKTsKPiA+ID4gPiAKPiA+ID4gPiBZZWFoLCBJIGd1ZXNzIHdlIHNob3VsZCBsaWtlbHkg
Y2xhbXAgaXQgYmV0d2VlbiAwIGFuZCBmcwo+ID4gPiA+IAo+ID4gPiAKPiA+ID4gCXZhbCA9IGNs
YW1wX3ZhbCh2YWwsIDAsIGZzKTsKPiA+ID4gCWluID0gRElWX1JPVU5EX0NMT1NFU1QodmFsICog
VThfTUFYLCBmcyk7Cj4gPiA+IAo+ID4gPiBtYXliZS4KPiA+ID4gCj4gPiA+IFNob3VsZCBJIGZp
eCB0aGF0IGlubGluZSBvciBkbyB5b3Ugd2FudCB0byBzZW5kIGEgZm9sbG93LXVwIHBhdGNoID8K
PiA+ID4gCj4gPiA+IEd1ZW50ZXIKPiA+ID4gCj4gPiA+IAo+ID4gCj4gPiBXaGF0ZXZlciBtYWtl
cyB5b3VyIGxpZmUgZWFzaWVyLi4uIEkgY2FuIHNlbmQgYSBwYXRjaCBpZiB0aGF0IGlzIHlvdXIK
PiA+IHByZWZlcmVuY2UuCj4gPiAKPiAKPiBJIHVwZGF0ZWQgdGhlIG9yaWdpbmFsIHBhdGNoLgo+
IAo+IFRoYW5rcywKPiBHdWVudGVyCj4gCgpUaGFua3MhCi0gTnVubyBTw6EK

