Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2076A01A
	for <linux-hwmon@vger.kernel.org>; Thu,  8 Feb 2024 08:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707379784; cv=none; b=IbNzhITH87dfkEYvBLMPYwim0wLutvFo1uCXorC11gAGyuLxwYaZgovN1XyJosNzc1CAcvJl2WCUzOx6JkQ03C1QGIhYw3m1IMlQUpKCIs8JS3JW1i7lPIy3J/yz2Tvj7ZwEBwAwH3sw1BN6d0nqUXXnOMsJaDuvrWFbEGLFnZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707379784; c=relaxed/simple;
	bh=Jfw9rBHovERaZpsJFUP/gJUEkm3OCMeB+HZ2b+xlIsY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FGI3pIRsxNVwaWIdXKxw17ds+P9/LHkYfhNv/iT/KW/r/CyTrUz6Ui088IuuJO+XETn3D0+OKNqdD95PxjrAawqa3yyTn6ck4r9piLvBuwW6DT4ZlAuOtHwwmTL5B+UV0j5oUblprTwyz87hvoH9tb1o8p9XU9RKjB1CzCUBuoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KINsFmx+; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KINsFmx+"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a370e63835cso186931466b.1
        for <linux-hwmon@vger.kernel.org>; Thu, 08 Feb 2024 00:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707379781; x=1707984581; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Jfw9rBHovERaZpsJFUP/gJUEkm3OCMeB+HZ2b+xlIsY=;
        b=KINsFmx+0fJd9HhyPQFUaHfTFmKFXX4LW1U+70TIyBGSux22lC+1/KmFaq1CfO1J8i
         bVrOwMsuPn7Sgymtnh3BEdu10M/KJ+2OD6u+JZnN+xvt5h2F/bh0Sg4YeP/pmtVWSBmU
         pkPd4CTtYmyr8PO7nZqFz+I0Kf/549XJPB6usi4+d0LnGC6sxyON+cDki+aYk+An3pNZ
         iLhcnZXeVL8R3s0jucFozzKUIzavGDZ/Dk23DNSjyx7ln+qM1V3LB9q9gPnW32yDDATJ
         bLh4s+H5fpPQfeyG12/yPCqE4+Rx++aZ8WcEjIUxvr5VBGJt9q9zcDk2UmJnZ6HImQSp
         D2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707379781; x=1707984581;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jfw9rBHovERaZpsJFUP/gJUEkm3OCMeB+HZ2b+xlIsY=;
        b=dvzRw+BpfNhpuVKo5FGj3GnmAWj8IGME4GQpM66e4DjDLFpzYWN7nWD4E+R/pPSKLg
         fuS2Rm4WqYE1HTxuJ1C1aUZ+Cddi6y4kMAZqbkqlhgGX1qCj8pE7z0k2+DxnAnibK5HM
         agBymGBSBxfvSlSZsWKzvPO4L1DyaJYlm+uubBLLkz9dDSgx4sSe7SU/RTryEjxxSAOs
         3XujMw0PUOeHeFhQnp04MFjSMFAh8GUNmZVTMdcd3cTIdPyJnHZbj+9ezqd0+3VPmeoY
         xTnK9YJe7asrISIycNpftxHaRerVhC02PBUvxYP00HNosE9xSTP5y8QJkKJEf5/naHQ4
         7GJQ==
X-Gm-Message-State: AOJu0YzKM3kvgt4D9ssu25fagf/UM5ak/QLpikcnWqwqoxiPFuxNp8tt
	31EgtNFdQfGiKmRy9U4k9zbDgiClw6Er0REB5/KjxJU9RBfOnHet
X-Google-Smtp-Source: AGHT+IEbyX181yiqIljLujestJL9VhSdIWnlBkIO5U9cdWl1QJXkO45nAi0VfQg9Y80Jppeh881fSg==
X-Received: by 2002:a17:907:7657:b0:a39:d261:9e21 with SMTP id kj23-20020a170907765700b00a39d2619e21mr1064940ejc.58.1707379780694;
        Thu, 08 Feb 2024 00:09:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXGMxTZYFvFlGe71VvsQ/E6OabKp3sSUKw+hnhAl/4mGlvLrRkzsfgZV/juwbhtumzVvWxDNqxS5KLmfaFywfrA1tyhbcC2+EoVFPZBrZGGZcEitQoX6Etaxcwmsg==
Received: from ?IPv6:2003:f6:ef1b:2000:15d4:fc17:481e:8afe? (p200300f6ef1b200015d4fc17481e8afe.dip0.t-ipconnect.de. [2003:f6:ef1b:2000:15d4:fc17:481e:8afe])
        by smtp.gmail.com with ESMTPSA id ti14-20020a170907c20e00b00a36f0610088sm1645887ejc.96.2024.02.08.00.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 00:09:40 -0800 (PST)
Message-ID: <9151c5df901325aed61e87019a5a1cffc46cf579.camel@gmail.com>
Subject: Re: [bug report] hwmon: ltc4282: add support for the LTC4282 chip
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Dan Carpenter
 <dan.carpenter@linaro.org>,  nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org
Date: Thu, 08 Feb 2024 09:12:59 +0100
In-Reply-To: <c2c5b8b0-d3db-4212-8311-ee54119389c4@roeck-us.net>
References: <b6fb236a-c3c1-4c5c-94bd-1f68b5aeac41@moroto.mountain>
	 <53e0e2c7bb9cafb4efa3748ecf3ec765c262db83.camel@gmail.com>
	 <c2c5b8b0-d3db-4212-8311-ee54119389c4@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.50.3 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

T24gV2VkLCAyMDI0LTAyLTA3IGF0IDA4OjQ5IC0wODAwLCBHdWVudGVyIFJvZWNrIHdyb3RlOgo+
IE9uIDIvNy8yNCAwMjoxOSwgTnVubyBTw6Egd3JvdGU6Cj4gPiBIaSBEYW4sCj4gPiAKPiA+IE9u
IFdlZCwgMjAyNC0wMi0wNyBhdCAxMjo1MSArMDMwMCwgRGFuIENhcnBlbnRlciB3cm90ZToKPiA+
ID4gSGVsbG8gTnVubyBTYSwKPiA+ID4gCj4gPiA+IFRoZSBwYXRjaCA4NDhhNTAxOWRlZDU6ICJo
d21vbjogbHRjNDI4MjogYWRkIHN1cHBvcnQgZm9yIHRoZSBMVEM0MjgyCj4gPiA+IGNoaXAiIGZy
b20gSmFuIDI5LCAyMDI0IChsaW51eC1uZXh0KSwgbGVhZHMgdG8gdGhlIGZvbGxvd2luZyBTbWF0
Y2gKPiA+ID4gc3RhdGljIGNoZWNrZXIgd2FybmluZzoKPiA+ID4gCj4gPiA+IAlkcml2ZXJzL2h3
bW9uL2x0YzQyODIuYzo3MzIgbHRjNDI4Ml93cml0ZV92b2x0YWdlX2J5dGVfY2FjaGVkKCkKPiA+
ID4gCXdhcm46IG5vIGxvd2VyIGJvdW5kIG9uICd2YWwnIHJsPSdzNjRtaW4tNDI5NDk2NzI5NCcK
PiA+ID4gCj4gPiA+IGRyaXZlcnMvaHdtb24vbHRjNDI4Mi5jCj4gPiA+IMKgwqDCoMKgIDcyMyBz
dGF0aWMgaW50IGx0YzQyODJfd3JpdGVfdm9sdGFnZV9ieXRlX2NhY2hlZChjb25zdCBzdHJ1Y3QK
PiA+ID4gbHRjNDI4Ml9zdGF0ZSAqc3QsCj4gPiA+IMKgwqDCoMKgIDcyNMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB1MzIgcmVnLCB1MzIgZnMsCj4gPiA+IGxvbmcKPiA+ID4gdmFs
LAo+ID4gPiDCoMKgwqDCoCA3MjXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdTMy
ICpjYWNoZV9yYXcpCj4gPiA+IMKgwqDCoMKgIDcyNiB7Cj4gPiA+IMKgwqDCoMKgIDcyN8KgwqDC
oMKgwqDCoMKgwqAgdTMyIGluOwo+ID4gPiDCoMKgwqDCoCA3MjgKPiA+ID4gwqDCoMKgwqAgNzI5
wqDCoMKgwqDCoMKgwqDCoCBpZiAodmFsID49IGZzKQo+ID4gPiDCoMKgwqDCoCA3MzDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbiA9IFU4X01BWDsKPiA+ID4gwqDCoMKgwqAgNzMx
wqDCoMKgwqDCoMKgwqDCoCBlbHNlCj4gPiA+IC0tPiA3MzLCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpbiA9IERJVl9ST1VORF9DTE9TRVNUKHZhbCAqIFU4X01BWCwgZnMpOwo+ID4g
Cj4gPiBZZWFoLCBJIGd1ZXNzIHdlIHNob3VsZCBsaWtlbHkgY2xhbXAgaXQgYmV0d2VlbiAwIGFu
ZCBmcwo+ID4gCj4gCj4gCXZhbCA9IGNsYW1wX3ZhbCh2YWwsIDAsIGZzKTsKPiAJaW4gPSBESVZf
Uk9VTkRfQ0xPU0VTVCh2YWwgKiBVOF9NQVgsIGZzKTsKPiAKPiBtYXliZS4KPiAKPiBTaG91bGQg
SSBmaXggdGhhdCBpbmxpbmUgb3IgZG8geW91IHdhbnQgdG8gc2VuZCBhIGZvbGxvdy11cCBwYXRj
aCA/Cj4gCj4gR3VlbnRlcgo+IAo+IAoKV2hhdGV2ZXIgbWFrZXMgeW91ciBsaWZlIGVhc2llci4u
LiBJIGNhbiBzZW5kIGEgcGF0Y2ggaWYgdGhhdCBpcyB5b3VyCnByZWZlcmVuY2UuCgotIE51bm8g
U8OhCg==

