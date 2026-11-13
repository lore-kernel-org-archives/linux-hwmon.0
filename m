Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602287;
	b=fbJqscaDjR7CUqy3Q7hAx/d3R9ORTg61KqNa4ZAxmpub4Z85bwjJ7auFAW3nwhvIskyd
	 MxQyrASpIcfdgLndUy18zLTxcU33pixZbVpvfl9XNd47Ln2TgaKCsyrCTYNkUb8P8pBPM
	 OBzF3vOKXJ/SBavameycr8uc2Rj0TN5lIbqcgIJSnKib3tYK1sJtB4pFpTDj2IKyxEGB+
	 9/wGfX6TpQF5fzFN9rVBpQ+bpfy4Hipzqrmm7D73Vm+hqTk/ZCXZ76YsQsD+SCYSRZAqX
	 iqfeHA1fOAtSaDEkm+AHrxVEpWtcVvXgqMsdZEge6oBcpnKKU3HfCT/Eo3XLU/fBJuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602287;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=jyCL9+FomBG3tQlbfooq0PHly4TSqPbqtrE1XhZvT6I=;
	b=jtnMZJ2SL0UMgzj7d30KyOOZ+2OmhE1UgElGxDnU4LK40cw74Zr1Z35c1iaQ+KJ70JZq
	 +skixBQDU4zQi5dTA5zL1fZ/kEr5eY3aoL+xYK42DOZxfCHVoNggPGtAMoGPjiacnZtYy
	 8Fe7RaAOEkp9NzeTKsCEc9vRxm8fKUWfc9ZZ6dSYvcQDdsMr5KX35xQyEtxPkBUyZgONf
	 WfYIbHNv9l+h9crk2sy9cRnAh9lwELwLd8C/tm8Lvqmb1NYV8EcuMsa4fPa9VT/Mwbp49
	 LGm7aTRJt6paXU2/FU66G9AaW+XFXW5n8utBtXtPfYIHNCBbEtitAO6Wws2W3s5Ek3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=SDizEVv7;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E620C606A881
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Nov 2026 20:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E620C606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=SDizEVv7
DKIM2-Signature:  i=1; m=1; t=1794602282;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZz4=;
 d=gmx.de;
 s=s31663417:rsa-sha256:rlVJ0loazTpGV+66wfj9NzMcS6gE
   KgyHphSDbMrEoxMyo/k+ZVwZDztolNoaBENywVprxamBAvst68jesZYwDKvu0JlJg1IpKnTVFHB
   Pz1qGZqzTFoLdqrO8HNBEbzY3jkbGrN9sR5Gzf+EtMkLtXvWRCVStAGVjX/YTS2TLnHq4qnHv7t
   MI+usEVVPKXt37K0A/MhSFs4/5ujRfrrPubZXZsEWLyX/fZwdNzJVcQvJvwOEuH98HNMK2NoJft
   OHChZS77CIELhoz1Vvooknl7OjsC97waYQnOyp0TPqMh0S6WlMa6HznGDBJKZRF0EK8FU6SFMau
   uG//idfzgqqZXA==;
Message-Instance:  m=1;
 h=sha256:
   Q9V2GFU/nhmmH89IyAnd6M37B8q9ErHxML2ZgPq9TkM=:
   tj7WH+hDsFm4/5UdACGC+BaOrCVsti634igFe9JQsQQ=,
  sha512:
   kGRrGSDdjEqnzi4GBMhHgVwRqNqeyQV6pYqD05eqEPvKmoilnN3liwaXlmcKLy4QSL97CFc3srha9YqNiFfCng==:
   H3M9wpvlh2Qf3XomX2kkU7sagBK4fqEBcv7H/1n7fofRFAMQivgkSrKXCpL1dOoF5RkqRpWgSd+FKd4x6wwM+Q==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794602266; x=1795207066; i=w_armin@gmx.de;
	bh=jyCL9+FomBG3tQlbfooq0PHly4TSqPbqtrE1XhZvT6I=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=SDizEVv7Jn9xJsiHBJN8u+ZdPeh2nKfNtI0hf13NjcVzHT53OTHlsEDeR5cml1qU
	 bRGyF4fk/zJbyXz3QRpB2DmRIc5zKI7tToT4bisF8gLcNh2FkTgClzYOotnVZpLUl
	 6/N0408xE3tYb1OBVtCZ219ZaJRHEgpJqHsJ7ne0y2cj+7epH0HhbxhCmmA1A0vYd
	 iGLr2uxw5IZd7mypsF4cORpoY5HXz0+04ou3tfz22K0/knByRE7Uz3nMXASE0gBjs
	 48iXuITwuaeZCv4QrUzi5ih7PJu4CTSd1vsgcFrHZD6trkvE0QgTd4XY2DhQrT04S
	 iiFUpYvUkx/+20175A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MfpOT-1wqQHT2DlJ-00gtw8; Fri, 13
 Nov 2026 21:37:46 +0100
Message-ID: <739e089d-fab1-4ade-9373-fe4c5b3924ad@gmx.de>
Date: Fri, 13 Nov 2026 21:37:44 +0100
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
Subject: Re: [PATCH RFC 0/2] platform/x86: Add Emdoor Intel EWMI platform
 driver
To: xiazq123666@gmail.com, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org
References: <20261113-emdoor-intel-wmi-rfc-v1-0-d77ecf23693b@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20261113-emdoor-intel-wmi-rfc-v1-0-d77ecf23693b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PtakSIzW3cfp3Bz2gUdd74Rb9HzJeAURzkHvbIg05s2kacV3kxw
 366SShDVdFW7XTljoactUZSDOq24nzWgQBpwvie6KUwlLujPeQsI/V1EKMPn4jDVYnqEHuu
 gRfB8kOKqZzXzjzpzHBiUQiZEQgBm9/KSoHPn8DtblLQg8KIXCequuiAUEIa4223wY3jos3
 Jk/2B3orRh0tVhLnbQkVg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:A5583etGE5o=;NQx1pAH4eVVw0Su5pB0eJnwCX0y
 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
 A==

Am 13.11.26 um 19:01 schrieb Ziqiang Xia via B4 Relay:
> This RFC patch series adds initial Linux support for the Intel EWMI
> (\_SB.EWMI) WMI interface found on Emdoor-based Intel laptops, initially
> matched strictly by DMI and BIOS version to the MECHREVO Wujie 14 2026
> (WUJIE Series-Lark4-LNL, Intel Core Ultra 5 226V Lunar Lake, BIOS
> EM_LNL326_V1.0.19).
>=20
> Note on naming and scope:
> - Community out-of-tree projects such as fewtarius/emdoor-wmi target AMD
>    Emdoor platforms using different WMI GUIDs (8600ACCE-...) and AMD SMU
>    ports. This Intel EWMI implementation (0B30FD67-1B62-4FCA-B10B-50DC7A=
DE6A39,
>    0B30FD67-1B62-4FCA-B10B-50DC7ADE6DDD, C75665A3-4382-4646-ADC8-C81AE14=
6E455)
>    is unrelated in protocol and EC register layout, so the driver is nam=
ed
>    emdoor-intel-wmi.
> - Legacy WMAA-WMCA WMI methods on this DSDT trigger AE_AML_BUFFER_LIMIT =
due
>    to an out-of-bounds CreateField() and are deliberately unused. The dr=
iver
>    only uses the clean WMCD, _WED(0xD0), and WMCC interfaces through mod=
ern
>    wmi_driver / wmidev_invoke_method().

Interesting.

IMHO using direct EC addresses will eventually turn into a=20
maintainability nightmare. I am aware of the issue with CreateField(),=20
AFAIK you can workaround this issue by simply submitting an oversized=20
buffer to wmidev_invoke_method().

Can you share the output of acpidump please?

Thanks,
Armin Wolf

>=20
> Hardware quirks handled and verified on real hardware:
> 1. Shared EC5D mailbox lag and hotkey collision:
>     AML methods GWLS (0x03/01) and GFLS (0x03/03) time out after 20 ms o=
n
>     this BIOS and return the previous mailbox byte on the call itself. A=
fter
>     invoking WMCD and waiting 100 ms, the driver reads the settled mailb=
ox
>     register directly and retries up to 3 times if concurrent _QF6/_QF9
>     hotkey events overwrite EC5D in flight.
> 2. SPFM stale-EC5F drop race:
>     AML method SPFM (0x03/0a) arms ZZTT/TIZZ before Notify(IETM, 0x88) a=
nd
>     before writing EC5F, so an EC scan during the notify can consume a s=
tale
>     EC5F and return RTNC=3D0 without updating PPMD (or return RTNC=3D1).=
 The
>     driver verifies 03/09 readback and reissues the absolute mode up to =
3 times.
>=20
> Validation summary on Linux 7.3.4 (MECHREVO WUJIE Series-Lark4-LNL,
> EM_LNL326_V1.0.19):
> - 1500 readonly attribute/hwmon stress reads (battery & AC online): 0 er=
rors
> - 20 platform_profile switches + 40 idempotent writes: 0 errors
> - Fn-lock, Win-lock, and auto_power_on write/readback cycles: pass
> - High-frequency Fn+Esc / F8 hotkey concurrency stress & s2idle: pass
>=20
> Specific RFC questions for reviewers:
> 1. Should fn_lock, win_lock, and auto_power_on stay as WMI device sysfs
>     attributes (documented in Patch 1), or would pdx86 maintainers prefe=
r a
>     firmware-attributes class interface or moving any of them?
> 2. Event codes 0xA1 (F7 mic-mute hotkey, _QF8) and 0xA2 (Fn+R refresh ra=
te,
>     _QF5) are conservatively mapped to KEY_PROG2 / KEY_PROG3 for now whi=
le
>     verifying whether i8042 also emits scancodes on some desktops/DEs. I=
s
>     KEY_MICMUTE / KEY_REFRESH_RATE_TOGGLE preferred once verified, or
>     separate input mapping?
> 3. Exact DMI_BIOS_VERSION matching is used because board EC offsets (0x5=
d,
>     0xf5, temp_regs {0x70, 0x73, 0x72, 0x62}) are board/BIOS-specific. I=
s
>     this strict match appropriate for initial upstreaming?
>=20
> Signed-off-by: Ziqiang Xia <xiazq123666@gmail.com>
> ---
> Ziqiang Xia (2):
>        Documentation: ABI: testing: Add emdoor-intel-wmi sysfs ABI
>        platform/x86: Add Emdoor Intel EWMI platform driver
>=20
>   .../ABI/testing/sysfs-bus-wmi-devices-emdoor-ewmi  |  28 +
>   MAINTAINERS                                        |   7 +
>   drivers/platform/x86/Kconfig                       |  18 +
>   drivers/platform/x86/Makefile                      |   1 +
>   drivers/platform/x86/emdoor-intel-wmi.c            | 873 +++++++++++++=
++++++++
>   5 files changed, 927 insertions(+)
> ---
> base-commit: 5680519168f65666d2c03cc6ed8fe2b7052aee12
> change-id: 20261113-emdoor-intel-wmi-rfc-2173530b3df6
>=20
> Best regards,
> --
> Ziqiang Xia <xiazq123666@gmail.com>
>=20
>=20

