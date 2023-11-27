Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ds/hQWOV"
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD802CE;
	Sun, 26 Nov 2023 23:53:30 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-54b532b261bso1127528a12.1;
        Sun, 26 Nov 2023 23:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701071609; x=1701676409; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pwz92+GCoP7IYtIAj34kO+/kqYdpJOwmZboVL10/2TY=;
        b=Ds/hQWOVEylpgo19LjbB2D0ehX8hGwso2Dq7M5TsJm6Mb22fgvd5Ijj82vF0xlR3kc
         34Vk47giGTGdMRDes++wbvFLbDw9p7zZKukJMKUY333s/5jTpaDJ74CeCLbFqiUTIjll
         dwuW72WgMtoeQU9zq9crWofvW/DEufFXcx7HpOq2NbU/tRd2TLUtnAefPjPEyZiI57YJ
         vZsVxj5Vqk5muWWsi3dJ4txlUYx1lWOdnOdWCvJ9gZh7uwMrjT3+0Teb1hnDmlubepyE
         5hTbdiMvepwDTYSDx+9BNrhQvHwpA6ZgtCLnb/YNv1Un02Z5VyLSDMhAMfMisrV1P5H8
         ul9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701071609; x=1701676409;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pwz92+GCoP7IYtIAj34kO+/kqYdpJOwmZboVL10/2TY=;
        b=LVC/2zupcY3SpA+VWbb3H1rQz0qpftohp2dN3RhxEg6sOFOYRp4XsiUvc8UnQs/ZwL
         k0Mqo6J7zUEncq/ZuPSSIFnWJ3VbujP1nZtTuTQOFl+oJjNGvEW5wnoyRH4Vq1Oeu2JL
         BuFk+eDHf7vsJvLsxSrieswHgic5oQx0ZyvIC90QliZbIheePW2sKH3wyqB14ZsY5UVP
         QfYu5zuKPFRnHuroxWkc1sSbclHU949budhQqvComj6nsky/rewcXRe+ySlLvZiC382d
         SIHwTzIT0F8Tcycw5l/KvgvcRmwIUuwoHdCCnxec/xFQd9HraAjDHxIE3OeQyJZy4JrK
         g1wg==
X-Gm-Message-State: AOJu0YxFxUeMpIKp/K3qQAV1i5hoK9ZJfYS9tFy+RpnUu0CovOOPKmNo
	Z/HXMxMkkcd4s1G2cfScChaCn9eSkc3HEpCb
X-Google-Smtp-Source: AGHT+IFTaov1AQrdzc6u35auEEen+Od0UW+CZQjZ8usDEx66PY98iv4uKdf0k6y+TEBSRmGZr4OWrQ==
X-Received: by 2002:a17:906:f0d1:b0:a11:4dc3:d0ce with SMTP id dk17-20020a170906f0d100b00a114dc3d0cemr229592ejb.63.1701071608873;
        Sun, 26 Nov 2023 23:53:28 -0800 (PST)
Received: from ?IPv6:2001:a61:3456:4e01:6ae:b55a:bd1d:57fc? ([2001:a61:3456:4e01:6ae:b55a:bd1d:57fc])
        by smtp.gmail.com with ESMTPSA id mm25-20020a170906cc5900b009fdaab907fbsm5395322ejb.188.2023.11.26.23.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 23:53:28 -0800 (PST)
Message-ID: <fb2aaa4c69c88738499dfbf46ef93e3b81ca93cb.camel@gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: kernel test robot <lkp@intel.com>, Nuno Sa via B4 Relay
	 <devnull+nuno.sa.analog.com@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jean Delvare <jdelvare@suse.com>, Guenter
 Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jonathan
 Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
 <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>
Date: Mon, 27 Nov 2023 08:53:27 +0100
In-Reply-To: <202311250548.lUn3bm1A-lkp@intel.com>
References: <20231124-ltc4282-support-v2-2-952bf926f83c@analog.com>
	 <202311250548.lUn3bm1A-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

T24gU2F0LCAyMDIzLTExLTI1IGF0IDA3OjM5ICswODAwLCBrZXJuZWwgdGVzdCByb2JvdCB3cm90
ZToKPiBIaSBOdW5vLAo+IAo+IGtlcm5lbCB0ZXN0IHJvYm90IG5vdGljZWQgdGhlIGZvbGxvd2lu
ZyBidWlsZCB3YXJuaW5nczoKPiAKPiBbYXV0byBidWlsZCB0ZXN0IFdBUk5JTkcgb24gZ3JvZWNr
LXN0YWdpbmcvaHdtb24tbmV4dF0KPiBbYWxzbyBidWlsZCB0ZXN0IFdBUk5JTkcgb24gbGludXMv
bWFzdGVyIHY2LjctcmMyIG5leHQtMjAyMzExMjRdCj4gW0lmIHlvdXIgcGF0Y2ggaXMgYXBwbGll
ZCB0byB0aGUgd3JvbmcgZ2l0IHRyZWUsIGtpbmRseSBkcm9wIHVzIGEgbm90ZS4KPiBBbmQgd2hl
biBzdWJtaXR0aW5nIHBhdGNoLCB3ZSBzdWdnZXN0IHRvIHVzZSAnLS1iYXNlJyBhcyBkb2N1bWVu
dGVkIGluCj4gaHR0cHM6Ly9naXQtc2NtLmNvbS9kb2NzL2dpdC1mb3JtYXQtcGF0Y2gjX2Jhc2Vf
dHJlZV9pbmZvcm1hdGlvbl0KPiAKPiB1cmw6wqDCoMKgCj4gaHR0cHM6Ly9naXRodWIuY29tL2lu
dGVsLWxhYi1sa3AvbGludXgvY29tbWl0cy9OdW5vLVNhLXZpYS1CNC1SZWxheS9od21vbi1sdGM0
MjgyLWFkZC1zdXBwb3J0LWZvci10aGUtTFRDNDI4Mi1jaGlwLzIwMjMxMTI0LTIzMTg0Mgo+IGJh
c2U6wqDCoAo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L2dyb2Vjay9saW51eC1zdGFnaW5nLmdpdMKgaHdtb24tbmV4dAo+IHBhdGNoIGxpbms6wqDCoMKg
Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIzMTEyNC1sdGM0MjgyLXN1cHBvcnQtdjIt
Mi05NTJiZjkyNmY4M2MlNDBhbmFsb2cuY29tCj4gcGF0Y2ggc3ViamVjdDogW1BBVENIIHYyIDIv
Ml0gaHdtb246IGx0YzQyODI6IGFkZCBzdXBwb3J0IGZvciB0aGUgTFRDNDI4MiBjaGlwCj4gY29u
ZmlnOiB4ODZfNjQtcmFuZGNvbmZpZy0xNjEtMjAyMzExMjUKPiAoaHR0cHM6Ly9kb3dubG9hZC4w
MS5vcmcvMGRheS1jaS9hcmNoaXZlLzIwMjMxMTI1LzIwMjMxMTI1MDU0OC5sVW4zYm0xQS1sa3BA
aW50ZWwuYwo+IG9tL2NvbmZpZykKPiBjb21waWxlcjogZ2NjLTEyIChEZWJpYW4gMTIuMi4wLTE0
KSAxMi4yLjAKPiByZXByb2R1Y2UgKHRoaXMgaXMgYSBXPTEgYnVpbGQpOgo+IChodHRwczovL2Rv
d25sb2FkLjAxLm9yZy8wZGF5LWNpL2FyY2hpdmUvMjAyMzExMjUvMjAyMzExMjUwNTQ4LmxVbjNi
bTFBLWxrcEBpbnRlbC5jCj4gb20vcmVwcm9kdWNlKQo+IAo+IElmIHlvdSBmaXggdGhlIGlzc3Vl
IGluIGEgc2VwYXJhdGUgcGF0Y2gvY29tbWl0IChpLmUuIG5vdCBqdXN0IGEgbmV3IHZlcnNpb24g
b2YKPiB0aGUgc2FtZSBwYXRjaC9jb21taXQpLCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWdzCj4g
PiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gPiBDbG9z
ZXM6Cj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjMxMTI1MDU0
OC5sVW4zYm0xQS1sa3BAaW50ZWwuY29tLwo+IAo+IEFsbCB3YXJuaW5ncyAobmV3IG9uZXMgcHJl
Zml4ZWQgYnkgPj4pOgo+IAo+ID4gPiBkcml2ZXJzL2h3bW9uL2x0YzQyODIuYzozNDc6Njogd2Fy
bmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvcgo+ID4gPiAnbHRjNDI4Ml9yb3VuZF9yYXRl
JyBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4gwqDCoMKgwqAgMzQ3IHwgbG9uZyBsdGM0MjgyX3Jv
dW5kX3JhdGUoc3RydWN0IGNsa19odyAqaHcsIHVuc2lnbmVkIGxvbmcgcmF0ZSwKPiDCoMKgwqDC
oMKgwqDCoMKgIHzCoMKgwqDCoMKgIF5+fn5+fn5+fn5+fn5+fn5+fgo+ID4gPiBkcml2ZXJzL2h3
bW9uL2x0YzQyODIuYzozNTY6MTU6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3IK
PiA+ID4gJ2x0YzQyODJfcmVjYWxjX3JhdGUnIFstV21pc3NpbmctcHJvdG90eXBlc10KPiDCoMKg
wqDCoCAzNTYgfCB1bnNpZ25lZCBsb25nIGx0YzQyODJfcmVjYWxjX3JhdGUoc3RydWN0IGNsa19o
dyAqaHcsIHVuc2lnbmVkIGxvbmcKPiBwYXJlbnQpCj4gwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBefn5+fn5+fn5+fn5+fn5+fn5+Cj4gCj4gCj4gdmltICsv
bHRjNDI4Ml9yb3VuZF9yYXRlICszNDcgZHJpdmVycy9od21vbi9sdGM0MjgyLmMKPiAKPiDCoMKg
IDM0NsKgwqAKPiDCoD4gMzQ3wqDCoGxvbmcgbHRjNDI4Ml9yb3VuZF9yYXRlKHN0cnVjdCBjbGtf
aHcgKmh3LCB1bnNpZ25lZCBsb25nIHJhdGUsCj4gwqDCoCAzNDjCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdW5zaWduZWQgbG9uZyAqcGFyZW50X3Jh
dGUpCj4gwqDCoCAzNDnCoMKgewo+IMKgwqAgMzUwwqDCoMKgwqDCoMKgwqDCoMKgwqBpbnQgaWR4
ID0gZmluZF9jbG9zZXN0KHJhdGUsIGx0YzQyODJfb3V0X3JhdGVzLAo+IMKgwqAgMzUxwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBBUlJBWV9TSVpFKGx0YzQyODJfb3V0X3JhdGVzKSk7Cj4gwqDCoCAzNTLCoMKgCj4gwqDCoCAz
NTPCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBsdGM0MjgyX291dF9yYXRlc1tpZHhdOwo+IMKg
wqAgMzU0wqDCoH0KPiDCoMKgIDM1NcKgwqAKPiDCoD4gMzU2wqDCoHVuc2lnbmVkIGxvbmcgbHRj
NDI4Ml9yZWNhbGNfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywgdW5zaWduZWQgbG9uZyBwYXJlbnQp
Cj4gwqDCoCAzNTfCoMKgewo+IMKgwqAgMzU4wqDCoMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgbHRj
NDI4Ml9zdGF0ZSAqc3QgPSBjb250YWluZXJfb2YoaHcsIHN0cnVjdCBsdGM0MjgyX3N0YXRlLAo+
IMKgwqAgMzU5wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNsa19o
dyk7Cj4gwqDCoCAzNjDCoMKgwqDCoMKgwqDCoMKgwqDCoHUzMiBjbGtkaXY7Cj4gwqDCoCAzNjHC
oMKgwqDCoMKgwqDCoMKgwqDCoGludCByZXQ7Cj4gwqDCoCAzNjLCoMKgCj4gwqDCoCAzNjPCoMKg
wqDCoMKgwqDCoMKgwqDCoHJldCA9IHJlZ21hcF9yZWFkKHN0LT5tYXAsIExUQzQyODJfQ0xLX0RJ
ViwgJmNsa2Rpdik7Cj4gwqDCoCAzNjTCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChyZXQpCj4gwqDC
oCAzNjXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsKPiDCoMKg
IDM2NsKgwqAKPiDCoMKgIDM2N8KgwqDCoMKgwqDCoMKgwqDCoMKgY2xrZGl2ID0gRklFTERfR0VU
KExUQzQyODJfQ0xLT1VUX01BU0ssIGNsa2Rpdik7Cj4gwqDCoCAzNjjCoMKgwqDCoMKgwqDCoMKg
wqDCoGlmICghY2xrZGl2KQo+IMKgwqAgMzY5wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgcmV0dXJuIDA7Cj4gwqDCoCAzNzDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChjbGtkaXYg
PT0gTFRDNDI4Ml9DTEtPVVRfSU5UKQo+IMKgwqAgMzcxwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgcmV0dXJuIExUQzQyODJfQ0xLT1VUX1NZU1RFTTsKPiDCoMKgIDM3MsKgwqAK
PiDCoMKgIDM3M8KgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIExUQzQyODJfQ0xLT1VUX0NOVjsK
PiDCoMKgIDM3NMKgwqB9Cj4gwqDCoCAzNzXCoMKgCj4gCgpBcmdoaCwgSSBkbyBuZWVkIHRvIHNl
ZSBpZiBJIGNhbiBhZGQgc29tZSB0ZXN0IGJyYW5jaCBvZiBteSBvd24gdG8gdGhlIHRlc3Qgcm9i
b3QgOi8uCkFueXdheXMsIHdpbGwgd2FpdCBmb3Igc29tZSBtb3JlIHJldmlld2luZyBiZWZvcmUg
c2VuZGluZyB2MyB0byBhZGRyZXNzIHRoaXMuCgotIE51bm8gU8OhCg==

