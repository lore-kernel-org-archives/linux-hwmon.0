Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795525526;
	b=skjKDbcZfswDXEKHHrlkMLusdqFC6h8gs0AMubBDgHg16gj6sID3388ItJPLlKPmf1yi
	 VmMNfW3hF2oS5DcuWQuNxxnxoHm3NnRGxUb1rdNpNX/VfHD5SlUWFplyjpiSHlp4d4VRJ
	 HFhlDlvEEcKhPa1LazZlVMHDmadmjryXPmDgoqjZVcodguLXR3EFN9rlAWbQPzTSNDrXG
	 FYJDDkCvNp/n4i3155zbdb3rB7RMM55ahCxGyuOIJFbfAc5YX2wn6gxssf6Hl9gHjmDxC
	 32oX0d7K1jBXuiLvxtRnIjlzcteXMlKdzf/pbdb8bvBLAqAEf9W+1GzPSNTKdRxU1Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795525526;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type;
	bh=1fSkvm5OP0PEIuFbARo1EL9pn1CvUDlyi1JdnlX4EPM=;
	b=Aicb6QK1mqmRSCiFh83Y4fvCwDxHqtsI+SHZ4ceYvA2xCgCY4P7AdJtU3AVscfVwhSIy
	 x2vbiN/dhmwf2ZhG5i/DxvNHErBzAUgiCyCP3FPN7/1ki9t0+MSZ8b3iTjlARxYdLKil0
	 +Qhv3EveMJo9b1WaIKZ+orvoj0GaQuZj6tn5+9iCXwjr7+bUnxTR4a2rqmrVyQoOpDRrv
	 0u5XwCkckP15JT67IbRc9ZRSRsJPlaFfNq+lrrohbGon9JTy/uyA5kjEH1GFDv6OXZY9P
	 +33U2UIJSeuJosF1DoBu8kJQz4LVp8r8ZWSDCeMV3hxVZW0/VBz6CqPnIn/6++ZTlfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Q5I09lLB;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7220606A31E
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Nov 2026 13:05:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7220606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Q5I09lLB
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b88d143160so5461517a12.1
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Nov 2026 05:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795525524; x=1796130324; darn=vger.kernel.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1fSkvm5OP0PEIuFbARo1EL9pn1CvUDlyi1JdnlX4EPM=;
        b=Q5I09lLByp8GrAga+z61+5M+gvAlJ4pVvlpe2jvfzdMI2JQJMoATfFS5LS9ZPidGNG
         jvWAweA+jd8KhbSMzj8JNgWmrPoQ5lrScSGaamKRZp2hJQCxvHllSSzIfxwEsbWPVFXU
         lmdK2+4F6qqkNeLXGkpDfOmSbd4o5l5NC2wcTUepdRIAry9l+Jx1W7DtlRdDsFcSG20I
         pU/Q0/zdgU1SWjHx38yKkYYDu1dKBwlnJjXRgbPkOvFy9W13kzHN9N3zrAUpbCkJi0oX
         ivNHAKp2pnuBYc11PL+TcwnZiPE4MJ3KJxnnf11wUXRLGKg3/O7crwPnWEW6JTakoUTj
         1MTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795525524; x=1796130324;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1fSkvm5OP0PEIuFbARo1EL9pn1CvUDlyi1JdnlX4EPM=;
        b=MWFCEx4TalgQ0yV/Atebmb90ue+CysDS4YY4RPa3wUsZG7a6Zbq4RfKhxFJMTzzPIp
         8ILY78vf+EscFq2aD7V0JGMO+fTuFnuUqOMl7pDKHkCV8diCSwYuuR8NkS6eao1jk1zq
         d0mIrjjeHV7Ku7nPTJ5XdfYP7DXKii4tT4hKXWGnPapa0iT2XtKHt4+klQlmXbYiH3FM
         slTzWzQ2Cm++nMs5TDTPqI7x2ekeLvpMNK9fw9SKOczYHMzcEHfd3uEhwFXAhrYdl7rX
         fPPzmD8wcicepJcICn07hUbKfDZ320IHtMIr8ffLatUQJUJH0ZtM3e2UDWW45/FHua9A
         N/5g==
X-Forwarded-Encrypted: i=1; AL+hErE9q8dB0HJKLOHUaClDrHgTD3NnXsAnoSntoR0SlJYrq+wYzz8SNlC0gayWlycQMI7h8c/jGj29CpTrbg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+X1vMXHQf2l/ULi1h8jcyjN7M/M8lBwHkVrGvqq8Jx3Aa8/GHY
	4STBFIUdeEvoUoDvKF3XuLqCp66rp6WiAcTzWNtYwSIztkehpFuwKk7jnlWblFjZECk=
X-Gm-Gg: AZFdTZdQRVQSwpiWyGdQ8b90IaZyrxIZWWJ1N8Ic2MQLPeOeAzI2j/7tbx77Oyg2Sd2
	+639btm+GBQnff7xcUlXxtJEsbZ8ysf5P2qlMQF3f9cLbRZpo0wtMHwtMB/behs/gjL/WCxxN1P
	iBk6d6eVL80qGFy5rqeVqCWI+gNjb89vHktzmE3zk2r4ukLmN3MkvdxYkUUAl2dFuj9AMy3IsLn
	pThL4Li/v2mzWVFaxjnrx55DCmXFceqfe7cxB5OMnjf+jI9bOveRm9H12VzjwDZFIPgNYYJ4f+g
	eZHwpsI8aHauauB/uFwstU96IahO5fCb9ZAU57Ax0kU2Y9NE451UTBXpdrpQJP+ZA/LDGO+v6bR
	5CFoKkPKbYm1kQ314pfqaHPodophtZDk+6cWNqA3nJEcdjFPljJY34p3ggsiROfulX0prLah7ZX
	m0rtUVl7Rq+HTHTwefE4CSa07YpVlhmvJOHq8a3nWakU7XwOgQ2Wuy+IW3i/fmsJBGgmjp4Ic/j
	oshTEBDYEv2E1qyzHjViOrZl8vO8JIQ/mElJ/L9vClYLuizlISqPqKz3jdiF02abTUaUSyresYl
	cJBsEot1/JAMb5srXwLI68GWcOGkaxf8GPWu0kSmWnqxh3B0HHrl8FK/4tHNfYT/CgZNVt2aCk8
	xRPtWGgqZHliQ7PXBeZ2nP8xlmLvx8ZUQUIFMpostAL7tIj/71U8=
X-Received: by 2002:a05:6402:3645:b0:6ba:c85e:c0e0 with SMTP id 4fb4d7f45d1cf-6bac85ec268mr3910962a12.28.1795525524131;
        Tue, 24 Nov 2026 05:05:24 -0800 (PST)
Received: from ?IPV6:2a00:12d0:afa3:c01:92cc:e257:77ba:97a1? (2a00-12d0-afa3-c01-92cc-e257-77ba-97a1.ip.tng.de. [2a00:12d0:afa3:c01:92cc:e257:77ba:97a1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cbb80sm6784029a12.9.2026.11.24.05.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 05:05:23 -0800 (PST)
Message-ID: <59d4ee28-0605-4e93-8ac1-19c8d0272bee@suse.com>
Date: Tue, 24 Nov 2026 14:05:22 +0100
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
Subject: Re: [PATCH v2] msr: replace rdmsr()/wrmsr() in comments
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-doc@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-hwmon@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, James Clark
 <james.clark@linaro.org>, Guenter Roeck <linux@roeck-us.net>,
 Tony Luck <tony.luck@intel.com>, Ashok Raj <ashok.raj.linux@gmail.com>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20261124064108.2440277-1-jgross@suse.com>
 <awWHd9ygPFipisb3@gmail.com>
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
In-Reply-To: <awWHd9ygPFipisb3@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fzIBNZKANk2e40IQjwqLyzcB"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fzIBNZKANk2e40IQjwqLyzcB
Content-Type: multipart/mixed; boundary="------------eO6WT9kL6g4GOfnRabTN4O78";
 protected-headers="v1"; hp="clear"
Message-ID: <59d4ee28-0605-4e93-8ac1-19c8d0272bee@suse.com>
Date: Tue, 24 Nov 2026 14:05:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] msr: replace rdmsr()/wrmsr() in comments
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-doc@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-hwmon@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, James Clark
 <james.clark@linaro.org>, Guenter Roeck <linux@roeck-us.net>,
 Tony Luck <tony.luck@intel.com>, Ashok Raj <ashok.raj.linux@gmail.com>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20261124064108.2440277-1-jgross@suse.com>
 <awWHd9ygPFipisb3@gmail.com>
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
In-Reply-To: <awWHd9ygPFipisb3@gmail.com>

--------------eO6WT9kL6g4GOfnRabTN4O78
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMTEuMjYgMTM6NDcsIEluZ28gTW9sbmFyIHdyb3RlOg0KPiANCj4gKiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4+IFJlcGxhY2UgYWxsIG1l
bnRpb25pbmcgb2YgcmRtc3IoKSBhbmQgd3Jtc3IoKSBpbiBjb21tZW50cyB3aXRoDQo+PiBy
ZG1zcnEoKSBhbmQgd3Jtc3JxKCksIGFzIHRoZSBmb3JtZXIgZnVuY3Rpb25zIGFyZSBubyBs
b25nZXINCj4+IGV4aXN0aW5nLg0KPj4NCj4+IEluIGRyaXZlcnMvaHdtb24vY29yZXRlbXAu
YyBkcm9wIG1lbnRpb25pbmcgcmRtc3Ivd3Jtc3IsIGFzIHRoZQ0KPj4gY29tbWVudCB3YXMg
aW5jb3JyZWN0IGluIHRoaXMgcmVnYXJkLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJn
ZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+IC0tLQ0KPj4gVG8gYmUgYXBwbGllZCBv
biB0b3Agb2YgY3VycmVudCBjb3JlL21zciBicmFuY2ggb2YgdGhlIHRpcCB0cmVlLg0KPj4g
VjI6DQo+PiAtIGRyb3AgY29tbWVudCBpbiBkcml2ZXJzL2h3bW9uL2NvcmV0ZW1wLmMgKEFz
YWYgTnVyaSBCZXJ0aXpsaW9nbHUpDQo+PiAtLS0NCj4+ICAgRG9jdW1lbnRhdGlvbi9hcmNo
L3g4Ni9taWNyb2NvZGUucnN0ICB8IDIgKy0NCj4+ICAgYXJjaC94ODYvZXZlbnRzL2FtZC9p
YnMuYyAgICAgICAgICAgICB8IDIgKy0NCj4+ICAgYXJjaC94ODYvZXZlbnRzL2ludGVsL2Nv
cmUuYyAgICAgICAgICB8IDIgKy0NCj4+ICAgYXJjaC94ODYvZXZlbnRzL2ludGVsL2xici5j
ICAgICAgICAgICB8IDYgKysrLS0tDQo+PiAgIGFyY2gveDg2L2luY2x1ZGUvYXNtL3NoYXJl
ZC9tc3IuaCAgICAgfCAyICstDQo+PiAgIGFyY2gveDg2L2tlcm5lbC9jcHUvZmVhdF9jdGwu
YyAgICAgICAgfCAyICstDQo+PiAgIGRyaXZlcnMvaHdtb24vY29yZXRlbXAuYyAgICAgICAg
ICAgICAgfCAzICstLQ0KPj4gICBkcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC9pZnMvbG9h
ZC5jIHwgNSArKystLQ0KPj4gICA4IGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyks
IDEyIGRlbGV0aW9ucygtKQ0KPiANCj4gWWVhaCwgc28gSSd2ZSBhbHJlYWR5IGFwcGxpZWQg
LXYxIHdpdGhvdXQgdGhlIGNvcmV0ZW1wLmMgYml0cywNCj4gaWUuIGp1c3QgdGhlIG1lY2hh
bmljYWwgcmVuYW1lcy4NCj4gDQo+IE1pbmQgc2VuZGluZyB0aGUgY29yZXRlbXAuYyBwYXJ0
IGFzIGEgc3RhbmRhbG9uZSBwYXRjaCwgd2l0aA0KPiBBc2FmIE51cmkgQmVydGl6bGlvxJ9s
dSdzIChwcmVzdW1lZCkgQWNrZWQtYnk/DQo+IA0KDQpJJ2xsIGp1c3QgZ28gd2l0aCBoaXMg
IlN1Z2dlc3RlZC1ieToiDQoNCg0KSnVlcmdlbg0KDQo=

--------------eO6WT9kL6g4GOfnRabTN4O78--

--------------fzIBNZKANk2e40IQjwqLyzcB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmsFi5MFAwAAAAAACgkQsN6d1ii/Ey/z
ZAgAisD+DZAdNXgjnVdM3s2bM/G2CpMIMc5aSo46KHC0SSFWxqgAn0uhLwg6oV0HfEM4WXejTWZ4
EPP6mOPAZTe1Y4she3H0RVq9qe7OAi2Rn3YM5XbKYmsxBf1dLD+xOmgZtSrVKA53/tvzcF6CriaX
w/KdLsxB0ASxzQIvaBez16RFmGVZ+veCA7XSqlfjCSvT7Ir6NTNPfbt/MixiHLfp+RMEBYG+gHzg
SSvjqAx7UG7fvGOt1cA1zW8ETewsqo+MpGIDVocuH5M5pF/kk0470EkP7An2N/FRvf296caLYPpy
LI550rDXjx1h/XL2gRPjKEKSJ4WJ4qz032FTkhwbDA==
=wTmJ
-----END PGP SIGNATURE-----

--------------fzIBNZKANk2e40IQjwqLyzcB--
