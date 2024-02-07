Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3673624B2F
	for <linux-hwmon@vger.kernel.org>; Wed,  7 Feb 2024 10:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707300948; cv=none; b=ujyZ1Ygw6ypKWtpvYtTbqw/QbzNXj9Ko4RswyWILr2jFTekR5jUVWuCb3YJkhpYlZkVJLOJzvKASFI0XqU0TaZsuEFBS5xu/NnNCCncyekiUFejRNFgiahD94PUvXv8IregdqO73GFDX85UpjTOma1OxRe2p4ZgzCnozDGz1w08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707300948; c=relaxed/simple;
	bh=Z8AItZAC/w5Ar3f1vL2vA/qbHfwYRbDgqRabO5NMWYU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t0xA4ZUGD1gCeWJW7NpAieK/jsByB8gBupKC8TtocFBtYqcSBWoP8DGjr9F5p3xzkBZoQnNI6v1QFv8z5x2Oq3AlHXYpOK5nWHsuVphnn82/per2aPYJ7rzXwxb71Nh+YQeNlSrU/brRk3JnQ0h6NoE/wv667tGJIUnaxSO6BkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q0bJjAYy; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q0bJjAYy"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a29c4bbb2f4so57763766b.1
        for <linux-hwmon@vger.kernel.org>; Wed, 07 Feb 2024 02:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707300945; x=1707905745; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Z8AItZAC/w5Ar3f1vL2vA/qbHfwYRbDgqRabO5NMWYU=;
        b=Q0bJjAYyknphb9SsueAI0X23j44InRT+6Me3VrNdTILB9OzlJnxAiVOjwMH64Qm4tM
         iu9KxkHKWZ1575nBT40F7SgON1qFW3tuh5GpWdNBq58FGxD0r331ykkCrYFcbn7OLMzl
         a9DSjxhygb/Pccv2mLVL3e3hlDXoM1An0f5qy9pnS8E6pit97tFNgsXmvtc9jywMCqpS
         cZBPWXi7tjs1cF4oM7d5R9Bc1hlaGPJ0JxjAdDefu1P2tlmZ6e6kkEbmh/Na6R6yyopR
         njp7iPaIUBOb1tphqmKzf+mGEX1FKsl4Q04duox+hDtPCU882r6FXtxkVOI1ubD4ORZ2
         C5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707300945; x=1707905745;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z8AItZAC/w5Ar3f1vL2vA/qbHfwYRbDgqRabO5NMWYU=;
        b=oI5CoPu4W8GLPiXQVK39xcm127GmAxFkwn4NPshldefxo+VvlimCV5Ot59joacCiye
         vo7s9z8rKFu3Ai4n1HGY+9DuK5ghvJ/BRy0iRIIxNhfJTbFbljD0md4CG8/e8vBK/9lC
         kWj5uoXj9VNaRF8IU4Va8+LCLiZw8RRpHj5e5bkhd4kO2fL+Wa5hWZ1iopCNTs1sUDG6
         q4L432LoUVI6YJKxb3uPxmt0FU9XkxxmWwzlwvthYWmx/AMmrOtbRbPyJZhVEqoefoDa
         ks8axlOgxqUU7/VtnAw5kc7CawD/VgfEjCfWolH4JbbNiB86x4bJXWcknrcZHJhtwY7K
         Tdug==
X-Gm-Message-State: AOJu0YzufAUhbsADc3OS0b+CVbwh9QjHRedg7s1mBXjPPToQm/aduP7x
	gKTVMX3KqiK6OgsR9hnKm8nO9Ga050QlDfBBxdbguGuZu/JLgXRl
X-Google-Smtp-Source: AGHT+IGflACBUUNRBp0T3arhuc2WB99D/DmDm8d7D3OanJ/+Zxc8PnN5p8JPv67JcP3df7hflFNUgg==
X-Received: by 2002:a17:906:1c89:b0:a30:8d46:4cac with SMTP id g9-20020a1709061c8900b00a308d464cacmr3685651ejh.67.1707300945014;
        Wed, 07 Feb 2024 02:15:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVK3L5xBC1MbVXDcED2xCrcCHQFNUOoMP9AKyhZdP8kLaA/2CTR7B6eCqWp9JIuEr42hyRcAvLv9VLBKx6IJXecr0o=
Received: from ?IPv6:2003:f6:ef1b:2000:15d4:fc17:481e:8afe? (p200300f6ef1b200015d4fc17481e8afe.dip0.t-ipconnect.de. [2003:f6:ef1b:2000:15d4:fc17:481e:8afe])
        by smtp.gmail.com with ESMTPSA id m8-20020a1709066d0800b00a3785efe1c4sm586848ejr.85.2024.02.07.02.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 02:15:44 -0800 (PST)
Message-ID: <53e0e2c7bb9cafb4efa3748ecf3ec765c262db83.camel@gmail.com>
Subject: Re: [bug report] hwmon: ltc4282: add support for the LTC4282 chip
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org
Date: Wed, 07 Feb 2024 11:19:04 +0100
In-Reply-To: <b6fb236a-c3c1-4c5c-94bd-1f68b5aeac41@moroto.mountain>
References: <b6fb236a-c3c1-4c5c-94bd-1f68b5aeac41@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.50.3 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGkgRGFuLAoKT24gV2VkLCAyMDI0LTAyLTA3IGF0IDEyOjUxICswMzAwLCBEYW4gQ2FycGVudGVy
IHdyb3RlOgo+IEhlbGxvIE51bm8gU2EsCj4gCj4gVGhlIHBhdGNoIDg0OGE1MDE5ZGVkNTogImh3
bW9uOiBsdGM0MjgyOiBhZGQgc3VwcG9ydCBmb3IgdGhlIExUQzQyODIKPiBjaGlwIiBmcm9tIEph
biAyOSwgMjAyNCAobGludXgtbmV4dCksIGxlYWRzIHRvIHRoZSBmb2xsb3dpbmcgU21hdGNoCj4g
c3RhdGljIGNoZWNrZXIgd2FybmluZzoKPiAKPiAJZHJpdmVycy9od21vbi9sdGM0MjgyLmM6NzMy
IGx0YzQyODJfd3JpdGVfdm9sdGFnZV9ieXRlX2NhY2hlZCgpCj4gCXdhcm46IG5vIGxvd2VyIGJv
dW5kIG9uICd2YWwnIHJsPSdzNjRtaW4tNDI5NDk2NzI5NCcKPiAKPiBkcml2ZXJzL2h3bW9uL2x0
YzQyODIuYwo+IMKgwqDCoCA3MjMgc3RhdGljIGludCBsdGM0MjgyX3dyaXRlX3ZvbHRhZ2VfYnl0
ZV9jYWNoZWQoY29uc3Qgc3RydWN0Cj4gbHRjNDI4Ml9zdGF0ZSAqc3QsCj4gwqDCoMKgIDcyNMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1MzIgcmVnLCB1MzIgZnMsIGxvbmcKPiB2
YWwsCj4gwqDCoMKgIDcyNcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1MzIgKmNh
Y2hlX3JhdykKPiDCoMKgwqAgNzI2IHsKPiDCoMKgwqAgNzI3wqDCoMKgwqDCoMKgwqDCoCB1MzIg
aW47Cj4gwqDCoMKgIDcyOCAKPiDCoMKgwqAgNzI5wqDCoMKgwqDCoMKgwqDCoCBpZiAodmFsID49
IGZzKQo+IMKgwqDCoCA3MzDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbiA9IFU4
X01BWDsKPiDCoMKgwqAgNzMxwqDCoMKgwqDCoMKgwqDCoCBlbHNlCj4gLS0+IDczMsKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGluID0gRElWX1JPVU5EX0NMT1NFU1QodmFsICogVThf
TUFYLCBmcyk7CgpZZWFoLCBJIGd1ZXNzIHdlIHNob3VsZCBsaWtlbHkgY2xhbXAgaXQgYmV0d2Vl
biAwIGFuZCBmcwoKLSBOdW5vIFPDoQoK

