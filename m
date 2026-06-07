Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8001E7C12
	for <linux-hwmon@vger.kernel.org>; Sun,  7 Jun 2026 06:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780813911; cv=none; b=q0svRTp83fnF4Y0BccTbalr1nieLhJMSaoZCN6VkWxvirXzjlMIKjTzF1ixm/RC+pyl1W0ko4xRPW91OC7N77ojmd8ttgo+mWr3gleO3aWURPcDCkEE9EoOqLU8NB1A/0X/3HToW3AFuBYFIHztDMcZaC0db0EivO2TVlvphfr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780813911; c=relaxed/simple;
	bh=Y3lTeycYnpFSVQO6j27H2Wr7lg/Cvf4Y39aMLWlIGTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lqcZ2req2MujGEJAMXXqPYVJjNONMnZy9NQsivsVSF8uGQ5+GYAW1JYyw++oGEW59SeuQhIw11g5Qw9EInBZOAfAIfnXlCRsQQWvXrDkeN5fxEVo4sDbRS5egcc8cvqrcR+OWFtFOo8jUEt12W3hdj0LxPace7cUWmCxndykeEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LAOecVin; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LAOecVin"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-68d232ed3f9so5190050a12.0
        for <linux-hwmon@vger.kernel.org>; Sat, 06 Jun 2026 23:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780813908; x=1781418708; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y3lTeycYnpFSVQO6j27H2Wr7lg/Cvf4Y39aMLWlIGTQ=;
        b=LAOecVin3vT56RUG/QELrg2gEOFHppqYTtSLgkVmv5qfK3zUr5W22Sn6YztScKPfnU
         v7Qb4RSHvMp0zSuytbh8FdA5vksxzfpUMwiXoqZw673jkjafMehfW2A+lk5QNcyFLmgo
         goUZzLx3KzZp26o74EAiRAwRn+tQKzws8W94PKpQE13ibO/dbJhseuSB/rphBtC7m7HR
         lTDBblH5mFwNgBdLHNrau5FRHNbQv6Wn1IxBy1kUB/RjunnLg2U9plTA3oR7JbY55/vP
         2nntXEzHIQkvyinhYH9c2zCvIEm4GvSYZchgbcSnOpyU2P6NcmhB1+A/nmSMuzbpDUvK
         Vpnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780813908; x=1781418708;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3lTeycYnpFSVQO6j27H2Wr7lg/Cvf4Y39aMLWlIGTQ=;
        b=JNtdRwlZ/w3spBap9PEBp1JjC+a5dwB8G+skpDCMbLsNxb0YHpB01idk5sfYJkcFpf
         pPuyjAGHvYL/G1dEw9T7STU8vwt0at2PSYOU6QMLyrZ0YkUAQc9A9to0OdPvRdcTNWQB
         uYumNd9t7LmUKUrItQwzFHyCOWPClZoeiM3nq2j1CEhkv8a3iEazGE7xgaqUpJnYujYB
         +Xyq72WNPNEWUrikcE5ghg8sDb3xF0UyQNI0V5k9Dbyf0jMjkJGIQeAc5dqYsxhoyW2S
         vJeiygEj1ZvIAYJMHIWPFNGiM0DJuUFHv/uzPSi8ZQ8Fi3KJ7WTnrKjpJYEmWffoXFoD
         pciQ==
X-Forwarded-Encrypted: i=1; AFNElJ9pVnr7JEVvTeX4dV1X5EQryP6vRVFtUN0rol2Zk2HXlBExllHKnnuCLxbbN61R6gcyBXgygc5I+53DBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLJult4u+jruBuDeoHNHmfkwTDH8hkiJO+Aj02zNPowAY1xxPM
	x0/KKDllzMVMeIJvn2o0M4NKFK1cO1a909sgLvTkd9TgmPfQQxtXTihho9q0wgi1QjfmXWk1eeG
	2KK/dvlw=
X-Gm-Gg: Acq92OFNa+bye3f+hHl6tL57JWJJUvfHl0y3hqaIq/tMupcMmSgrIp0Y1YsU/JDTyuh
	yfCk3M8zCHNb09Dpuz/c1Bi9a0TakavXWYvQ/M4ZXqeB2wTjw6HyelqsebK4DTspk3yo9TQqDBc
	NbGVYv7ISQBg0p6fOXdY0rxeqiGF1ozp77SxnIjgYtYdVX0fEHrZX+ayF6B3a+R5qSOk3bVlMDg
	fds3eoCUfCUq4IAS/FbHxcOnIQneZI6xq4fIzSg+nKqL6ixjsCmTqqjSJ6prrcLj+fn/wfszbXa
	6YjGoPraCzmtNu36wZ9BeJkugVNX2GcRcPrNsqLMz/DEuNmDggRWId4pGWbj0fEzJ/C9ZMV4zdQ
	XFPhAWbzFtvs1Wa1R0k3XDNWIVi7j+u6pt0nIobiAbT6mc7YgN70/Gjl9jkC3XjFKQh5+MKg0SP
	OWN3LEDml2qGXGnZz3ZOGpiAzwhCOy+0UKd57vc67eO49O9T/bl/71WaRg67dXkwA4ZY6O15Yv6
	vZQuieVGj9FvwcHs0BjV5nYV+bgSzfq6f/6UYcAwKLsv1HKkgmT5txFE3v5rxoC
X-Received: by 2002:a17:907:a43:b0:bf1:1d19:cf98 with SMTP id a640c23a62f3a-bf371956a23mr443738066b.15.1780813908245;
        Sat, 06 Jun 2026 23:31:48 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112? (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de. [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e03716sm676423966b.34.2026.06.06.23.31.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jun 2026 23:31:47 -0700 (PDT)
Message-ID: <2db3e888-a675-474a-9d1a-bb9d9bb162bd@suse.com>
Date: Sun, 7 Jun 2026 08:31:46 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/10] x86/msr: Switch rdmsr_safe_on_cpu() users to
 rdmsrq_safe_on_cpu()
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-hwmon@vger.kernel.org, linux-pm@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, Guenter Roeck
 <linux@roeck-us.net>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>
References: <20260605144314.3031049-1-jgross@suse.com>
 <20260605144314.3031049-8-jgross@suse.com> <aiPtnrkdHDHc0Iqz@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <aiPtnrkdHDHc0Iqz@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------W1OH0W2F02yBvE4L4YcB6M8D"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------W1OH0W2F02yBvE4L4YcB6M8D
Content-Type: multipart/mixed; boundary="------------3YVM48O1DvkkMSf4l0JtVCAF";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-hwmon@vger.kernel.org, linux-pm@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, Guenter Roeck
 <linux@roeck-us.net>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <2db3e888-a675-474a-9d1a-bb9d9bb162bd@suse.com>
Subject: Re: [PATCH v2 07/10] x86/msr: Switch rdmsr_safe_on_cpu() users to
 rdmsrq_safe_on_cpu()
References: <20260605144314.3031049-1-jgross@suse.com>
 <20260605144314.3031049-8-jgross@suse.com> <aiPtnrkdHDHc0Iqz@gmail.com>
In-Reply-To: <aiPtnrkdHDHc0Iqz@gmail.com>

--------------3YVM48O1DvkkMSf4l0JtVCAF
Content-Type: multipart/mixed; boundary="------------j0eUdLvZs8ru0zyaukHPr2UG"

--------------j0eUdLvZs8ru0zyaukHPr2UG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMDYuMjYgMTE6NTEsIEluZ28gTW9sbmFyIHdyb3RlOg0KPiANCj4gKiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4+IEluIG9yZGVyIHRvIHBy
ZXBhcmUgcmV0aXJpbmcgcmRtc3Jfc2FmZV9vbl9jcHUoKSBzd2l0Y2gNCj4+IHJkbXNyX3Nh
ZmVfb25fY3B1KCkgdXNlcnMgdG8gcmRtc3JxX3NhZmVfb25fY3B1KCkuDQo+IA0KPj4gLS0t
IGEvYXJjaC94ODYvbGliL21zci1zbXAuYw0KPj4gKysrIGIvYXJjaC94ODYvbGliL21zci1z
bXAuYw0KPj4gQEAgLTE5MCwxMSArMTkwLDIyIEBAIEVYUE9SVF9TWU1CT0wod3Jtc3JxX3Nh
ZmVfb25fY3B1KTsNCj4+ICAgDQo+PiAgIGludCByZG1zcnFfc2FmZV9vbl9jcHUodW5zaWdu
ZWQgaW50IGNwdSwgdTMyIG1zcl9ubywgdTY0ICpxKQ0KPj4gICB7DQo+PiAtCXUzMiBsb3cs
IGhpZ2g7DQo+PiArCXN0cnVjdCBtc3JfaW5mb19jb21wbGV0aW9uIHJ2Ow0KPj4gKwljYWxs
X3NpbmdsZV9kYXRhX3QgY3NkOw0KPj4gICAJaW50IGVycjsNCj4+ICAgDQo+PiAtCWVyciA9
IHJkbXNyX3NhZmVfb25fY3B1KGNwdSwgbXNyX25vLCAmbG93LCAmaGlnaCk7DQo+PiAtCSpx
ID0gKHU2NCloaWdoIDw8IDMyIHwgbG93Ow0KPj4gKwlJTklUX0NTRCgmY3NkLCBfX3JkbXNy
X3NhZmVfb25fY3B1LCAmcnYpOw0KPj4gKw0KPj4gKwltZW1zZXQoJnJ2LCAwLCBzaXplb2Yo
cnYpKTsNCj4+ICsJaW5pdF9jb21wbGV0aW9uKCZydi5kb25lKTsNCj4+ICsJcnYubXNyLm1z
cl9ubyA9IG1zcl9ubzsNCj4+ICsNCj4+ICsJZXJyID0gc21wX2NhbGxfZnVuY3Rpb25fc2lu
Z2xlX2FzeW5jKGNwdSwgJmNzZCk7DQo+PiArCWlmICghZXJyKSB7DQo+PiArCQl3YWl0X2Zv
cl9jb21wbGV0aW9uKCZydi5kb25lKTsNCj4+ICsJCWVyciA9IHJ2Lm1zci5lcnI7DQo+PiAr
CX0NCj4+ICsJKnEgPSBydi5tc3IucmVnLnE7DQo+IA0KPiBXaGlsZSB0ZWNobmljYWxseSB0
aGlzIGlzIGFub3RoZXIgQVBJIHVzZXIgY29udmVyc2lvbiwNCj4gSSdkIHNwbGl0IHRoaXMg
b3V0IGludG8gYW5vdGhlciBwcmVwYXJhdG9yeSBwYXRjaCwNCj4gYmVjYXVzZSB0aGlzIGNo
YW5nZXMgdGhlIEFQSSBpdHNlbGYuDQoNCk9rYXksIGZpbmUgd2l0aCBtZS4NCg0KSSdsbCBz
ZW5kIFYzIGFmdGVyIHJjMSBvZiA3LjIgYXMgRGF2ZSBzdWdnZXN0ZWQuDQoNCk9uZSBmaW5h
bCBxdWVzdGlvbiAobm90IGRpcmVjdGx5IGZvciB0aGlzIHNlcmllcywgYnV0IGZvciBhIGZ1
dHVyZSBvbmUpOg0KDQpJJ2QgbGlrZSB0byBzd2l0Y2ggcmRtc3JxKCkgZnJvbSBhIG1hY3Jv
IHRvIGFuIGlubGluZSBmdW5jdGlvbiwgYXMgYSBtYWNybw0KdXNpbmcgb25lIG9mIGl0cyBw
YXJhbWV0ZXJzIGFzIHRoZSBkZXN0aW5hdGlvbiBmb3IgYW4gYXNzaWdubWVudCBpc24ndA0K
bmljZS4gQWRkaXRpb25hbGx5IEknZCBsaWtlIHRvIHJlcGxhY2UgcmRtc3IqKCkgdXNlIGNh
c2VzIHdpdGggcmRtc3JxKigpDQphbmQgd3Jtc3IqKCkgd2l0aCB3cm1zcnEqKCkgKHNpbWls
YXIgdG8gdGhlIHJlcGxhY2VtZW50cyBkb25lIGlzIHRoaXMNCnNlcmllcykuDQoNClRoZSBy
ZG1zcnEoKSB0cmFuc2Zvcm1hdGlvbiBpbnRvIGEgZnVuY3Rpb24gY2FuIGVhc2lseSBiZSBk
b25lIHZpYSBhDQpjb2NjaW5lbGxlIHNjcmlwdC4gV2hhdCB3b3VsZCBiZSB5b3VyIGNob2lj
ZSByZWdhcmRpbmcgdGhlIHNlcXVlbmNlIGRvaW5nDQp0aGlzPw0KDQphKSBTdGFydCB3aXRo
IHJkbXNycSgpIHRyYW5zZm9ybWF0aW9uIGludG8gYSBmdW5jdGlvbi4NCmIpIEZpcnN0IGRv
IHRoZSByZG1zci93cm1zciAtPiByZG1zcnEvd3Jtc3JxIHJlcGxhY2VtZW50cywgdGhlbiBk
byB0aGUNCiAgICByZG1zcnEoKSB0cmFuc2Zvcm1hdGlvbiBpbnRvIGEgZnVuY3Rpb24gKHRo
aXMgd2lsbCB0b3VjaCBtb3JlIGNvZGUsIGFzDQogICAgdGhlIGluaXRpYWwgcmRtc3IoKSB1
c2UgY2FzZXMgd2lsbCBiZSBhZmZlY3RlZCwgdG9vKS4NCmMpIExlYXZlIHJkbXNycSgpIGFz
IGEgbWFjcm8uDQoNCg0KSnVlcmdlbg0K
--------------j0eUdLvZs8ru0zyaukHPr2UG
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------j0eUdLvZs8ru0zyaukHPr2UG--

--------------3YVM48O1DvkkMSf4l0JtVCAF--

--------------W1OH0W2F02yBvE4L4YcB6M8D
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmolEFMFAwAAAAAACgkQsN6d1ii/Ey8w
/ggAiIcrzdV0mBemdszUwTrKIhfZfIAws9g+efLcEhm9GWgpM9jIbkFpzMUIMWTEkVaObytytkKY
BkATM+qlxXv6/Y0HNyteD6xa1B7s98WNlfz2s5L1Df9fpgtCxGdy7OcL9oxE8/j31UJvrIRYnZrM
0qmQPZw3nEe+0R0XNaWs58xcrnQBdYzgVSzzk2g5cyAM9ZjdrEgxGbMTrKcOGkknNGhwBo7kQRUz
85tWhujmYjkqAA8Isx7+BLZ3B9F/VOBk/+NHc2oqeeh/Bs2RLvyzfVzddR5lg633wmGqG5jczQeO
w+TnMxwHenNgR6dZOeiw5H7tPN+lfjYsqvI88lN3mw==
=wFWI
-----END PGP SIGNATURE-----

--------------W1OH0W2F02yBvE4L4YcB6M8D--
