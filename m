Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442561;
	b=Cv0bfnMEy3L8m+QxDWt53Co/l25MWxxkm6RQpM8YXaD3j9gUEVzXFxMUHZYR6XfNqwTj
	 wicUSWc/AvvKOE/ztOV093rT1vVMqEEvEJb2ABd+DUJpkSOgv/nP3ryn3tELlOGv3FI9u
	 ySoU2n9xshBfa3LZ4ByEbfArC6SAL8y1+/LYf6fXvCumf2N0H/Lzq8eLWt5BXgui8Ngpn
	 BNeefggtkaKNIr3/W4cCO/svY2xT5U5xkZTPgb7H98P/Y/VnQFb+I8BuSNyypZJkNprjG
	 bkKVI63ZpDX+E37HbWZB+tRcAa8TWsyW9mrvXuwy0sluiFYlZ7jphWlZgoLE134AwLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type;
	bh=3/3NnMftymq31jTNwytygShkMtc6etp5T9SffMvYwsc=;
	b=FzjJzUQ2H7qFKAW4O8Lps1S24qG+i5LcMsRZCJgYsLSlcFOtR+Na1rGUjZl1TwJFIYyu
	 Gre5VM1kjs0IV8FIdBAlj8rquS7QSvTvUX9RnQhHu6Ks+udJIvbr4XvCjynfz/IWnDq2B
	 j+Bf7YPP1SKzkGxAEm/wZa5IGkGNFybz0B+j5ERCNSPvlSC2xC49QEymZeMCjQ8vUdnQ4
	 guy0p/eGXCYUhbGT/qw6S2vrAa/VP7jvMkD5VnCJmpTAN1rlSiyN/ClaPBGClcd9aUVTt
	 UzsiK6KkwFIF586JNwMqbti1tRU1eXSQAUEz9hX8ygLBqLpyM6jhlgZ+z/RMvp574KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=fhAj3P3Z;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EAB606A6A6
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 14:02:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97EAB606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=fhAj3P3Z
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b587538a37so4879120a12.2
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 06:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795442558; x=1796047358; darn=vger.kernel.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3/3NnMftymq31jTNwytygShkMtc6etp5T9SffMvYwsc=;
        b=fhAj3P3Z8br2eyC8mzuf/0H9cWjIIu3LrYWWLhw0ewWbWbBHK+SHhmfMegmuizuaub
         GdJhaP41zEbEGijwMseRHoCEM3c9r5OxhNCNHPD3wk5zCieaO0J+eLwWuNTnimS0tFGM
         Qmo1kQ67VR53GZLUKdUP0qi7GMEGOaL/r3/BNvT046cjUVvDZp9uinRAOvLsf/PN1Xtv
         eiMaOvHD8BUfPskHcXK0i42FWdmEmfALU/NLY4Ck+0rYKj9e4Z//Xl4FIhSE7WmXGjbD
         ISD3EgdiRhNdBdkGkH7G7Z47vcfL+s7uxzqLgp3tWxr1TcfKkxqA66naGryNLKvJAx51
         qVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442558; x=1796047358;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3/3NnMftymq31jTNwytygShkMtc6etp5T9SffMvYwsc=;
        b=DNqKkjxO+8toPYXBZHKhV86rWse//Z5ZMSPyXCuja9E/1ZJjAOcHBAz0YHKlfb1wpB
         qAJFPoGJjnrszqO1SkyiOcJGoyuTVQtbBdpDve7eOqiuh56bXsoqZWqOHGZ0W8Q8LmI8
         /SvKtaazC8anV642tb7eFB61CPU36kezHqwA3sKqBg6abmmqNT/lXmNOlFuM0PvgqtC8
         fduXV/hgVHzmflHMeRH1jVZfT5Qj8e+im2Sc1lnEoTEYU2FVNi+JpseP2iHvy9TpkpBB
         60RQXKgE6gIJbJNgAOntD1rl6yj4Ic0QbYs97m0gfpFTBQV2K58w0/7vH/E8mIr5xgB2
         ghYw==
X-Gm-Message-State: APuU4Z/nMvTmHDN8igSyOQNvScjIwsfkX4FfarE7JYgtjAIT/+92/7Wc
	mg+nz/iBat6LVscvLUJK5Uco8rH7ms6ns6mRI4xyJWzX3+H/hCN7KDeVMuGUIn8Zs4E=
X-Gm-Gg: AZFdTZc300JCMsP16DRjFx5Gbomt5BxuqMJz5JRXr5uVV0l0GEqXOzLxDJD5cayPPCx
	AxrB+jadAmIZypzq+3r1A/kLiAWnnwJaiLBvE+SlfFLH3OEZC6rY0P6gLYuz7eKmSmHQFEXSOv1
	ReKTcMLeD8P2uzty+T5JV82nH765Zs57Vc6HbZT7jq/CwP5DFAajo1DZ4za4wNoGy5YotmLTtsE
	YL10+7ikwPRX36UdvzjyLjvrRSzt0ea/Wcm2U8MuldVYtuEkPMH7XHHZBjJ/C6vv4ryi9VljY2l
	znW9gh5HJHTlsFjrnTfPL5k838Cmurf2cQ68tIBTTF9mj6/EJAH6lavn1a9/o2+B9lVFTI8a7xp
	TUqfPlRBo5qLV9coR555X6itXY62YWSLm7UsFq8hOa4DmL5CTi8oIsn1dkhboo87qbH5vVF4AXV
	4pJ5t4W6eNpdce88CJ8iqEOK9aX0s/8t773UaoVvKGWKfAtVCSUu4U30TiUV4vEwLS25FcYWX2z
	ieLwgmYf3UIBPOejm7HnG+r2MNIrDmzyZz/BMKHX0bkTp7JqhEB7OZ67nTFv+iTTTnBtxrhlCi8
	vuSuuACcjq+4o/CO1JEcTVCtTThRvE5ggP/5fOMiqbH+T/kQso13aFnsPqIiUoLCNKQuMFGK69U
	c9LVroihpeiJZiraF513C2k/CWCcrHIvj1xv/KTltt4uq2goBYms=
X-Received: by 2002:a17:907:3cb:b0:c51:40e:847c with SMTP id a640c23a62f3a-c513a84ab4emr576437666b.23.1795442557948;
        Mon, 23 Nov 2026 06:02:37 -0800 (PST)
Received: from ?IPV6:2a00:12d0:afa3:c01:92cc:e257:77ba:97a1? (2a00-12d0-afa3-c01-92cc-e257-77ba-97a1.ip.tng.de. [2a00:12d0:afa3:c01:92cc:e257:77ba:97a1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad026a4sm420786766b.2.2026.11.23.06.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:02:37 -0800 (PST)
Message-ID: <dfe51a0b-e5b6-4887-b5d8-195d8ef0ca93@suse.com>
Date: Mon, 23 Nov 2026 15:02:36 +0100
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] msr: replace rdmsr()/wrmsr() in comments
To: =?UTF-8?Q?Asaf_Nuri_Bertizlio=C4=9Flu?= <asafbertizlioglu@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 x86@kernel.org, linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux@roeck-us.net, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 peterz@infradead.org, acme@kernel.org, namhyung@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 irogers@google.com, adrian.hunter@intel.com, james.clark@linaro.org,
 tony.luck@intel.com, ashok.raj.linux@gmail.com, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
References: <20261123080822.3426355-1-jgross@suse.com>
 <20261123133338.39023-1-asafbertizlioglu@gmail.com>
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
In-Reply-To: <20261123133338.39023-1-asafbertizlioglu@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zH1KUH40miOPx8xJHy05aI0t"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------zH1KUH40miOPx8xJHy05aI0t
Content-Type: multipart/mixed; boundary="------------PY1alFJmAlhg5Ibj03MF0bME";
 protected-headers="v1"; hp="clear"
Message-ID: <dfe51a0b-e5b6-4887-b5d8-195d8ef0ca93@suse.com>
Date: Mon, 23 Nov 2026 15:02:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] msr: replace rdmsr()/wrmsr() in comments
To: =?UTF-8?Q?Asaf_Nuri_Bertizlio=C4=9Flu?= <asafbertizlioglu@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 x86@kernel.org, linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux@roeck-us.net, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 peterz@infradead.org, acme@kernel.org, namhyung@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 irogers@google.com, adrian.hunter@intel.com, james.clark@linaro.org,
 tony.luck@intel.com, ashok.raj.linux@gmail.com, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
References: <20261123080822.3426355-1-jgross@suse.com>
 <20261123133338.39023-1-asafbertizlioglu@gmail.com>
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
In-Reply-To: <20261123133338.39023-1-asafbertizlioglu@gmail.com>

--------------PY1alFJmAlhg5Ibj03MF0bME
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMTEuMjYgMTQ6MzMsIEFzYWYgTnVyaSBCZXJ0aXpsaW/En2x1IHdyb3RlOg0KPiBP
biBNb24sIE5vdiAyMywgMjAyNiBhdCAwOTowODoyMkFNICswMTAwLCBKdWVyZ2VuIEdyb3Nz
IHdyb3RlOg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaHdtb24vY29yZXRlbXAuYyBiL2Ry
aXZlcnMvaHdtb24vY29yZXRlbXAuYw0KPj4gLS0tIGEvZHJpdmVycy9od21vbi9jb3JldGVt
cC5jDQo+PiArKysgYi9kcml2ZXJzL2h3bW9uL2NvcmV0ZW1wLmMNCj4+IEBAIC02Nyw3ICs2
Nyw3IEBAIGVudW0gY29yZXRlbXBfYXR0cl9pbmRleCB7DQo+PiAgICAqIEBjcHVfY29yZV9p
ZDogVGhlIENQVSBDb3JlIGZyb20gd2hpY2ggdGVtcGVyYXR1cmUgdmFsdWVzIHNob3VsZCBi
ZSByZWFkDQo+PiAtICoJCVRoaXMgdmFsdWUgaXMgcGFzc2VkIGFzICJpZCIgZmllbGQgdG8g
cmRtc3Ivd3Jtc3IgZnVuY3Rpb25zLg0KPj4gKyAqCQlUaGlzIHZhbHVlIGlzIHBhc3NlZCBh
cyAiaWQiIGZpZWxkIHRvIHJkbXNycS93cm1zcnEgZnVuY3Rpb25zLg0KPiANCj4gVGhpcyBz
ZW50ZW5jZSBoYXMgYmVlbiBpbmFjY3VyYXRlIHNpbmNlIGl0IHdhcyBhZGRlZCBpbiB2My4w
Og0KPiBjcHVfY29yZV9pZCBpcyBuZXZlciBwYXNzZWQgdG8gYW4gTVNSIGFjY2Vzc29yLiBj
b3JldGVtcCByZWFkcyB0aGUNCj4gTVNScyB3aXRoIHJkbXNycV9vbl9jcHUoKS9yZG1zcnFf
c2FmZV9vbl9jcHUoKSBvbiB0aGUgbG9naWNhbCBDUFUNCj4gKHRkYXRhLT5jcHUpLCBhbmQg
Y3B1X2NvcmVfaWQgaXMgb25seSB1c2VkIGZvciB0aGUgIkNvcmUgTiIgbGFiZWwsDQo+IHRo
ZSBzeXNmcyBhdHRyaWJ1dGUgaW5kZXggYW5kIHNpYmxpbmcgbWF0Y2hpbmcuIFRoZSBjdXJy
ZW50IGRyaXZlcg0KPiBhbHNvIGRvZXMgbm90IHdyaXRlIGFueSBNU1IuDQo+IA0KPiBJIHRo
aW5rIHRoZSBzZW50ZW5jZSBzaG91bGQgYmUgZHJvcHBlZCByYXRoZXIgdGhhbiByZW5hbWVk
LiBJZiB5b3UNCj4gcHJlZmVyIHRvIGtlZXAgdGhpcyBwYXRjaCBtZWNoYW5pY2FsLCBJIGNh
biBzZW5kIGEgc2VwYXJhdGUgY29yZXRlbXANCj4gcGF0Y2ggZm9yIGl0Lg0KSSdtIGhhcHB5
IHRvIHNlbmQgYSBWMiB3aXRoIHRoZSBzZW50ZW5jZSBkcm9wcGVkLg0KDQoNCkp1ZXJnZW4N
Cg==

--------------PY1alFJmAlhg5Ibj03MF0bME--

--------------zH1KUH40miOPx8xJHy05aI0t
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmsER3wFAwAAAAAACgkQsN6d1ii/Ey8/
CAgAgt4TOdkpIzszPfXgnswTL7+egIO6JxCHi3n8zPafAnVpX+jSXV5DTq73HrDyLGSdZmwb0H+q
g/szYBHqy9PI4izvWLRbOANf13fv39U302/tewlzKbB+gylkqCOmrecPeYZJ8l4juFG7z1WXg8PP
sMe0T50VTgT5f4DAwH+Jg7EmYJgF6k1Nabp3TYKjG6AXMErFKSk29HebGI8juU/4BizcUtkiqIfF
9V4Oi8H8ITAm3HcDF7+B8XhmTu3icGnIfVQ+hJIaTMw3D6STxTNXiynep+zztOOtfH8qtS8qsmke
dGG6Y4kHOdCaQqX+y2CvD2YStrRwHkB3ax5fhB0eFQ==
=xaim
-----END PGP SIGNATURE-----

--------------zH1KUH40miOPx8xJHy05aI0t--
