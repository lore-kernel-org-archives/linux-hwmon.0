Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KYel8iVK"
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93501101;
	Mon, 27 Nov 2023 00:44:33 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-543c3756521so5347039a12.2;
        Mon, 27 Nov 2023 00:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701074672; x=1701679472; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ryw139IsJD5rUs7/wQF0rwLMirP5Sgaw6bKRYfTe/yA=;
        b=KYel8iVKgK8YRXM433wKZBFlphd8wVcrzK3sot+K28ic9kun2/J+gcQ7NsBDF2F+MO
         bb9xu3C/3NVRiUihdGnJKavndcxSYoM7GbXINHuibtvl15ZBqipCryvIlS1a2nsHYTWt
         30j2PHm0eLkurU7ZhnGjsEf22YyKmpYU8v9LM4obpnRFD0/41xaFXeEXqOEt2GRhnsuM
         PtzFYsndpetzCKQrbrpH34Eo+T+zoHo8JOksFixGCT0kUm6MaUxSai7l6kZvY9hchNQe
         tIafDPrFQrA3U/E0msA1iucAzSAJ6nFOleToZvYb8V/p1h55RRGKxEBOtfI5mEfYeijr
         WBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701074672; x=1701679472;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ryw139IsJD5rUs7/wQF0rwLMirP5Sgaw6bKRYfTe/yA=;
        b=E9DlfhqDCMov6W0TOXjYqyw6QQ1PDu6zLs5M0FuBUriWrP4Iu+itVywAS+Wn4gShFD
         UD3eMQvixDNbfirwbEjMR9NMF9OA9gfXb0/NQITGmKGDuFu/+bp1hFIx3D0Nhgu/YgR7
         gVq/XlTRBwWF0VXt4z61zfgiLu5zoBqDpBN1xaB4RZ/S9Sib0cvOXxMlLdU0y+J75mdk
         k/FgpsWNmk7dLw7235KP4hHQIeshsIQ3ACishivwEDSVf7KpLwuaLcM7canaIwuLqHZK
         5EdnNM8qctbdvR0FIU184Y2OeYyyJjGYp/rMeWfsODhF6XkXB0Klhgp7klaeflTuzNxu
         44YQ==
X-Gm-Message-State: AOJu0Yx5taPUglOLYkTADTG1OJK+OlGgSsnt1wLiFwXhAbzbf1kgFywY
	fNlBdnr03+61HxvfX76AMQE=
X-Google-Smtp-Source: AGHT+IHuqXI8TOxYld9vChZZAP7YKaEcWuQ7ETmVLdKwxFJhUpEdnEpOE7+ThFBXFjy++pE5f+wPUw==
X-Received: by 2002:a17:906:2209:b0:a02:9891:29ba with SMTP id s9-20020a170906220900b00a02989129bamr7306878ejs.15.1701074671934;
        Mon, 27 Nov 2023 00:44:31 -0800 (PST)
Received: from ?IPv6:2001:a61:3456:4e01:6ae:b55a:bd1d:57fc? ([2001:a61:3456:4e01:6ae:b55a:bd1d:57fc])
        by smtp.gmail.com with ESMTPSA id g1-20020a170906348100b009de3641d538sm5429579ejb.134.2023.11.27.00.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 00:44:31 -0800 (PST)
Message-ID: <5a4182806724fa96eab92e7224d11aec7aa39e20.camel@gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, kernel test robot
 <lkp@intel.com>,  Nuno Sa via B4 Relay
 <devnull+nuno.sa.analog.com@kernel.org>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-doc@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jean Delvare <jdelvare@suse.com>, Guenter
 Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,  Jonathan Corbet <corbet@lwn.net>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, Andy
 Shevchenko <andy@kernel.org>
Date: Mon, 27 Nov 2023 09:44:31 +0100
In-Reply-To: <ac950d01-d9aa-4fb7-810d-b21335e4cc94@kernel.org>
References: <20231124-ltc4282-support-v2-2-952bf926f83c@analog.com>
	 <202311250548.lUn3bm1A-lkp@intel.com>
	 <fb2aaa4c69c88738499dfbf46ef93e3b81ca93cb.camel@gmail.com>
	 <76957975-56e7-489e-9c79-086b6c1ffe89@kernel.org>
	 <ac950d01-d9aa-4fb7-810d-b21335e4cc94@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

T24gTW9uLCAyMDIzLTExLTI3IGF0IDA5OjEyICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOgo+IE9uIDI3LzExLzIwMjMgMDk6MTAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4g
PiBPbiAyNy8xMS8yMDIzIDA4OjUzLCBOdW5vIFPDoSB3cm90ZToKPiA+ID4gPiDCoMKgIDM1NcKg
wqAKPiA+ID4gPiDCoD4gMzU2wqDCoHVuc2lnbmVkIGxvbmcgbHRjNDI4Ml9yZWNhbGNfcmF0ZShz
dHJ1Y3QgY2xrX2h3ICpodywgdW5zaWduZWQgbG9uZwo+ID4gPiA+IHBhcmVudCkKPiA+ID4gPiDC
oMKgIDM1N8KgwqB7Cj4gPiA+ID4gwqDCoCAzNTjCoMKgwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBs
dGM0MjgyX3N0YXRlICpzdCA9IGNvbnRhaW5lcl9vZihodywgc3RydWN0Cj4gPiA+ID4gbHRjNDI4
Ml9zdGF0ZSwKPiA+ID4gPiDCoMKgIDM1OcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBjbGtfaHcpOwo+ID4gPiA+IMKgwqAgMzYwwqDCoMKgwqDCoMKgwqDCoMKgwqB1
MzIgY2xrZGl2Owo+ID4gPiA+IMKgwqAgMzYxwqDCoMKgwqDCoMKgwqDCoMKgwqBpbnQgcmV0Owo+
ID4gPiA+IMKgwqAgMzYywqDCoAo+ID4gPiA+IMKgwqAgMzYzwqDCoMKgwqDCoMKgwqDCoMKgwqBy
ZXQgPSByZWdtYXBfcmVhZChzdC0+bWFwLCBMVEM0MjgyX0NMS19ESVYsICZjbGtkaXYpOwo+ID4g
PiA+IMKgwqAgMzY0wqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAocmV0KQo+ID4gPiA+IMKgwqAgMzY1
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7Cj4gPiA+ID4gwqDC
oCAzNjbCoMKgCj4gPiA+ID4gwqDCoCAzNjfCoMKgwqDCoMKgwqDCoMKgwqDCoGNsa2RpdiA9IEZJ
RUxEX0dFVChMVEM0MjgyX0NMS09VVF9NQVNLLCBjbGtkaXYpOwo+ID4gPiA+IMKgwqAgMzY4wqDC
oMKgwqDCoMKgwqDCoMKgwqBpZiAoIWNsa2RpdikKPiA+ID4gPiDCoMKgIDM2OcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAwOwo+ID4gPiA+IMKgwqAgMzcwwqDCoMKg
wqDCoMKgwqDCoMKgwqBpZiAoY2xrZGl2ID09IExUQzQyODJfQ0xLT1VUX0lOVCkKPiA+ID4gPiDC
oMKgIDM3McKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBMVEM0Mjgy
X0NMS09VVF9TWVNURU07Cj4gPiA+ID4gwqDCoCAzNzLCoMKgCj4gPiA+ID4gwqDCoCAzNzPCoMKg
wqDCoMKgwqDCoMKgwqDCoHJldHVybiBMVEM0MjgyX0NMS09VVF9DTlY7Cj4gPiA+ID4gwqDCoCAz
NzTCoMKgfQo+ID4gPiA+IMKgwqAgMzc1wqDCoAo+ID4gPiA+IAo+ID4gPiAKPiA+ID4gQXJnaGgs
IEkgZG8gbmVlZCB0byBzZWUgaWYgSSBjYW4gYWRkIHNvbWUgdGVzdCBicmFuY2ggb2YgbXkgb3du
IHRvIHRoZSB0ZXN0Cj4gPiA+IHJvYm90IDovLgo+ID4gPiBBbnl3YXlzLCB3aWxsIHdhaXQgZm9y
IHNvbWUgbW9yZSByZXZpZXdpbmcgYmVmb3JlIHNlbmRpbmcgdjMgdG8gYWRkcmVzcyB0aGlzLgo+
ID4gCj4gPiBJdCdzIGVhc3kgdG8gdGVzdCB5b3VyIHBhdGNoZXMgb24geW91ciBvd24gbWFjaGlu
ZXMuLi7CoCBKdXN0IGJ1aWxkIGZldwo+ID4gZGlmZmVyZW50IGNvbmZpZ3MuCj4gPiAKPiAKPiBX
YWl0LCB0aGlzIHdhcyBub3QgZXZlbiB1bnVzdWFsIHRlc3QsIGp1c3Qgc3RhbmRhcmQgY29tcGls
ZSwgd2hpY2ggbWVhbnMKPiB5b3UgZGlkIG5vdCBkbyBiYXNpYyB0ZXN0cyBvbiB5b3VyIGVuZC4g
WW91IG11c3QgYnVpbGQgeW91ciBuZXcgZHJpdmVyCj4gd2l0aCBXPTEsIHNtYXRjaCwgc3BhcnNl
IGFuZCBjb2NjaW5lbGxlIGJlZm9yZSBzZW5kaW5nIHVwc3RyZWFtLgo+IAo+IEJlc3QgcmVnYXJk
cywKPiBLcnp5c3p0b2YKPiAKCldlbGwsIEkgZG8gYWdyZWUgdGhhdCBhIHNwYXJzZSBidWlsZCB3
b3VsZCBlYXNpbHkgY2F1Z2h0IHRoaXMgYW5kIEknbSBtYWQgd2l0aCBteXNlbGYKYmVjYXVzZSB0
aGF0IG11Y2ggKHRvZ2V0aGVyIHdpdGggY2hlY2twYXRjaCkgSSB1c3VhbGx5IHJ1biAoSSBjb25m
ZXNzIHRoYXQgY29jY2luZWxsZQphbmQgc21hdGNoIGlzIHNvbWV0aGluZyB0aGF0IEkgZG9uJ3Qg
dXN1YWxseSBkby4gCgoieW91IGRpZCBub3QgZG8gYmFzaWMgdGVzdHMgb24geW91ciBlbmQiCgpI
b3dldmVyIEkgZG8gdGhpbmsgdGhpcyBpcyBhIGJpdCB1bmZhaXIuIEkgZGlkIGdvdCBhIGxvdCBv
ZiB0aGluZ3MgdG8gZG8gaW4gdjIgd2l0aAptYWpvciByZWZhY3RvcnMgb24gc29tZSBvZiB0aGUg
ZmVhdHVyZXMuIFNvICJiYXNpYyB0ZXN0IiB0byBtZSBpcyBhY3R1YWxseSBtYWtpbmcKc3VyZSB0
aGF0IGFsbCBvZiB0aGVzZSBjaGFuZ2VzIGRvbid0IGJyZWFrIHRoZSBkcml2ZXIgYW5kIHRoZSBk
ZXZpY2Ugc3RpbGwgd29ya3MgYXMKZXhwZWN0ZWQuCgpBbnl3YXlzLCBJIGRvbid0IHdhbnQgdG8g
ZmluZCBhbnkgZXhlY3VzZXMgYW5kIHN0YXJ0IGFuIGFyZ3VtZW50LiBXaWxsIHRyeSB0byBkbwpi
ZXR0ZXIgaW4gbmV4dCBpdGVyYXRpb25zLgoKLSBOdW5vIFPDoQo=

