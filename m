Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA3B374F5;
	Tue,  9 Jan 2024 12:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cAx2pI4C"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40e4f1f519aso5827275e9.0;
        Tue, 09 Jan 2024 04:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704802593; x=1705407393; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I0YoySMN2ddgzU4bfPWUZ9d7o9ULw8yEktxw8E2vUg4=;
        b=cAx2pI4CYkSnD+s+MoBsXQ8PC3MogVjtJKO+/HegjSJSdJW9QlNDF3pSlD7EAycgmD
         N01r2SSB6bnfaEF8yPFMLs+JjZZo8x00/MyaTN5L8YOzcRW/NIaCEX4BEoB5CPy3BzCw
         LBxLHkafQeC9qRBEAW/kTAvaNCAbo+s3OF2xTzkZihTjDV+vTv59h5Eo1zIHeltzEwey
         p3/UQnOO5PYBcBnkkeeesUTMF/wjP2UjKAEQw0JeX0xTPV6oQpne0z9grOhU8FYy6n8t
         zwcCk+FUrI/t7C2dlLOPrUBP0X5rySicP3GbuJhYcc04WsKkjdyjJl/h3QXfvYlSdz3E
         K1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704802593; x=1705407393;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I0YoySMN2ddgzU4bfPWUZ9d7o9ULw8yEktxw8E2vUg4=;
        b=CK8lru7rFBv3vQmFb8fSIP3XUg7JfCgFbA+vk7Uqhzo7Vn2rhKZhoP5kk0DQGtpIMD
         Hwux4EAgywG5Gx1vPsvmaXRYpHK3lkpDwh6FCK1aCeDgLZXL1kc5APJhnoASu3nKybDg
         JbTrs8RT0R07QTRn7K5/1zXWkJ0qmIQq0We5+ibpwfgGX55FQJBu7jtjjSN9q/vaonpI
         iFCFuHETU5G0Xb4TQIqsZ4bLmsKKYNBDgehIdAZ/Fd8JrcTIKSQWCLxyLxdCOf9DmpTG
         qY82RwoTVQjr+0KihX5X5MWMleYCK2Cig+iHINT8GLIqhEPmgG5jklZ4Y6CcyxP/12Ho
         8RfA==
X-Gm-Message-State: AOJu0Yy6KyGR4PvasIxAqR7UoNI10WmI4eLLUEhUisdanporf/xS4Mmf
	1btIhXT09IlzVGrHacmjxBU=
X-Google-Smtp-Source: AGHT+IHlXql1ES4o4BfbaWQ8+1k8qBMQrUb4Rua8vrSUJjI0m8V/0oVH4ffI8zmuUjCWa4qNgFPjsg==
X-Received: by 2002:a7b:cd89:0:b0:40e:45c0:b59c with SMTP id y9-20020a7bcd89000000b0040e45c0b59cmr1928816wmj.159.1704802592727;
        Tue, 09 Jan 2024 04:16:32 -0800 (PST)
Received: from ?IPv6:2003:f6:ef1b:2000:944c:cbc7:1e1c:2c47? (p200300f6ef1b2000944ccbc71e1c2c47.dip0.t-ipconnect.de. [2003:f6:ef1b:2000:944c:cbc7:1e1c:2c47])
        by smtp.gmail.com with ESMTPSA id fl21-20020a05600c0b9500b0040e48e4bf8asm3421923wmb.10.2024.01.09.04.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 04:16:32 -0800 (PST)
Message-ID: <09d0ecb0460aafb3f45d3d17b1b40605d7d28b2a.camel@gmail.com>
Subject: Re: [PATCH v4 0/3] Add support for LTC4282
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Nuno Sa <nuno.sa@analog.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Date: Tue, 09 Jan 2024 13:19:43 +0100
In-Reply-To: <20231218-b4-ltc4282-support-v4-0-4fc51f7d04f0@analog.com>
References: <20231218-b4-ltc4282-support-v4-0-4fc51f7d04f0@analog.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.50.3 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

T24gTW9uLCAyMDIzLTEyLTE4IGF0IDE3OjI5ICswMTAwLCBOdW5vIFNhIHdyb3RlOgo+IHYxOgo+
IMKgKgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWh3bW9uLzIwMjMxMTEwMTUxOTA1
LjE2NTk4NzMtMS1udW5vLnNhQGFuYWxvZy5jb20vCj4gCj4gdjI6Cj4gwqAqCj4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtaHdtb24vMjAyMzExMjQtbHRjNDI4Mi1zdXBwb3J0LXYyLTAt
OTUyYmY5MjZmODNjQGFuYWxvZy5jb20KPiAKPiB2MzoKPiDCoCoKPiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9yLzIwMjMxMjA1LWx0YzQyODItc3VwcG9ydC12My0wLWUwODc3YjI4MWJjMkBhbmFs
b2cuY29tCj4gCj4gQ2hhbmdlcyBpbiB2NDoKPiAtIFBhdGNoIDE6Cj4gwqAqIE5ldyBwYXRjaC4g
U3VwcG9ydCBmYXVsdCBhdHRyaWJ1dGVzIGluIHZvbHRhZ2UgY2hhbm5lbHMuCj4gLSBQYXRjaCAy
Ogo+IMKgKiBBZGQgZGVmYXVsdCB2YWx1ZXMgZm9yIGdwaW9zIGFuZCBkaXZpZGVyIHByb3BlcnRp
ZXM7Cj4gwqAqIEFkZCBhZGksZ3BpbzMtbW9uaXRvci1lbmFibGUgcHJvcGVydHkuCj4gLSBQYXRj
aCAzOgo+IMKgLSBEb2NzOgo+IMKgICogRG9jdW1lbnQgdGhhdCBmYXVsdCBsb2dzIGFyZSBhbHNv
IGNsZWFyZWQgd2hlbiB3cml0aW5nIGluIHJlc2V0X2hpc3RvcnkKPiDCoMKgwqAgYXR0cmlidXRl
czsKPiDCoCAqIERvY3VtZW50IGRlYnVnZnMgZW50cmllczsKPiDCoCAqIEFkZCBuZXcgaW4wX2Zh
dWx0IGF0dHJpYnV0ZXMgYW5kIHJlbW92ZSBkcm9wcGVkIG9uZXMuCj4gwqAtIERyaXZlcjoKPiDC
oCAqIEFkZCBod21vbl9pbl9mYXVsdCBhdHRyaWJ1dGUgdG8gcmVwb3J0IEZFVCBmYWlsdXJlcyBp
biBWU09VUkNFOwo+IMKgICogQ2xlYXIgZmF1bHQgbG9ncyBpbiByZXNldF9oaXN0b3J5Owo+IMKg
ICogQ29uc3RpZnkgJ2x0YzQyODJfb3V0X3JhdGVzJzsKPiDCoCAqIEFkZCBtaXNzaW5nIGVycm9y
IGNoZWNrIGluIGx0YzQyODJfY2FjaGVfaGlzdG9yeSgpOwo+IMKgICogUmVtb3ZlZCB1bnVzZWQg
ZnVuY3Rpb25zOwo+IMKgICogUmVuYW1lZCBjbGsgcHJvdmlkZXIgbmFtZSBzbyBpdCdzIHVuaXF1
ZSBwZXIgZGV2aWNlOwo+IMKgICogU3VwcG9ydCBuZXcgYWRpLGdwaW8zLW1vbml0b3ItZW5hYmxl
IHByb3BlcnR5Owo+IMKgICogRHJvcHBlZCBwb3dlcjFfZ29vZCwgZmV0X2JhZF9mYXVsdCwgZmV0
X3Nob3J0X2ZhdWx0LCBmYXVsdF9sb2dzX3Jlc2V0Cj4gwqDCoMKgIGN1c3RvbSBhdHRyaWJ1dGVz
LiBOb3RlIHRoYXQgb25seSBwb3dlcjFfZ29vZCB3YXMgcmVhbGx5IGRyb3BwZWQuCj4gwqDCoMKg
IFRoZSBvdGhlciBvbmVzIGFyZSBzdXBwb3J0ZWQgaW4gc3RhbmRhcmQgQUJJLgo+IMKgICogUmVu
YW1lZCBkZWJ1Z2ZzIGRpcmVjdG9yeSBmb3IgbHRjNDI4Mi1od21vblg7Cj4gwqAgKiBBZGRlZCBp
bjAgcHJlZml4IHRvIEZFVCBmYXVsdCBsb2dzIHNvIGl0J3MgY2xlYXIgdGhleSBhZmZlY3QgVlNP
VVJDRTsKPiDCoCAqIEZpeCBpbl9yYW5nZSgpIGNvbmRpdGlvbiAoZmFsc2UgbWVhbnMgZXJyb3Ip
Owo+IMKgICogRml4IHJlc2V0X2hpc3RvcnkgYXR0cmlidXRlcy4gV2Ugc2hvdWxkIG5vdCB3cml0
ZSAwIGluIHRoZSBsb3dlc3QKPiDCoMKgwqAgdmFsdWUuIFdyaXRlIHRoZSB0aGVvcmV0aWNhbCBt
YXggdmFsdWUgaW4gdGhlcmUuIEZvciB2c291cmNlL3ZkZCwKPiDCoMKgwqAgYWxzbyBkbyBpdCBk
dXJpbmcgZGV2aWNlIHNldHVwIChvciB3ZSB3b3VsZCBlbmQgdXAgd2l0aCAwKS4KPiDCoCAqIERp
cmVjdGx5IHN0b3JlIHRoZSBjaGlwIHZkZCBpbnN0ZWFkIG9mIHZpbl9tb2RlIGluIG91ciBkZXZp
Y2UKPiDCoMKgwqAgc3RydWN0dXJlLiBFYXNpZXIgdG8gaGFuZGxlIHJlc2V0X2hpc3Rvcnk7Cj4g
wqAgKiBNb3ZlZCB0aGUgdmluX21vZGUgZW51bSB0byByZWR1Y2UgaXQncyBzY29wZS4KPiAKPiBB
cyBtZW50aW9uZWQgaW4gdjMgZGlzY3Vzc2lvbiwgY2xlYXJpbmcgdGhlIHBvd2VyIGJhZCBmYXVs
dCBsb2cgaGFzIG5vCj4gZWZmZWN0IGJ1dCBJJ20gc3RpbGwgZG9pbmcgaXQgZm9yIGNvbnNpc3Rl
bmN5IGFuZCBiZWNhdXNlIHdlIGFsc28gYWxsb3cKPiB0byByZWFkIGl0IGluIGRlYnVnZnMgKHNv
IGJldHRlciBhbGxvdyB0byBjbGVhciBpdCBhcyB3ZWxsKQo+IAo+IC0tLQo+IE51bm8gU2EgKDMp
Ogo+IMKgwqDCoMKgwqAgZHQtYmluZGluZ3M6IGh3bW9uOiBBZGQgTFRDNDI4MiBiaW5kaW5ncwo+
IMKgwqDCoMKgwqAgaHdtb246IGFkZCBmYXVsdCBhdHRyaWJ1dGUgZm9yIHZvbHRhZ2UgY2hhbm5l
bHMKPiDCoMKgwqDCoMKgIGh3bW9uOiBsdGM0MjgyOiBhZGQgc3VwcG9ydCBmb3IgdGhlIExUQzQy
ODIgY2hpcAo+IAo+IMKgRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1jbGFzcy1od21v
bsKgwqDCoMKgwqDCoMKgIHzCoMKgwqAgOSArCj4gwqAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9o
d21vbi9hZGksbHRjNDI4Mi55YW1swqDCoMKgwqAgfMKgIDE1OSArKwo+IMKgRG9jdW1lbnRhdGlv
bi9od21vbi9pbmRleC5yc3TCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgwqDCoCAxICsKPiDCoERvY3VtZW50YXRpb24vaHdtb24vbHRjNDI4Mi5yc3TCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMTMzICsrCj4gwqBNQUlOVEFJTkVS
U8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgIDggKwo+IMKgZHJpdmVycy9od21vbi9LY29u
ZmlnwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8wqDCoCAxMSArCj4gwqBkcml2ZXJzL2h3bW9uL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoCAxICsKPiDC
oGRyaXZlcnMvaHdtb24vaHdtb24uY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoCAxICsKPiDCoGRyaXZlcnMvaHdtb24vbHRj
NDI4Mi5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHwgMTc4NAo+ICsrKysrKysrKysrKysrKysrKysrCj4gwqBpbmNsdWRlL2xpbnV4L2h3bW9u
LmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoMKgwqAgMiArCj4gwqAxMCBmaWxlcyBjaGFuZ2VkLCAyMTA5IGluc2VydGlvbnMoKykK
PiAKPiBUaGFua3MhCj4gLSBOdW5vIFPDoQo+IAoKSGkgR3VlbnRlciwKCkp1c3QgcGluZ2luZyB0
aGlzIG9uZS4gTm90IHN1cmUgaWYgeW91IG1pc3NlZCB0aGlzIG9uZSBvciBqdXN0IGxvdyBwcmlv
cml0eSBpbgp5b3VyIHF1ZXVlIDopCgotIE51bm8gU8OhCg==

