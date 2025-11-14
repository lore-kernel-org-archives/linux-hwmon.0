Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5ED2DC791
	for <linux-hwmon@vger.kernel.org>; Fri, 14 Nov 2025 18:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763145564; cv=none; b=iEnrYbL7u+44UCVb2SF4e27nNEFF+xcofFDIvwUBEz7QYE817G5id2cUuIciwHIf9ZlUZ6SAnmU39pE5Q8ZfzpG6cT7S6ZQyZiksy7l4EbMlmsv8NXRIn/H/4yKVxh9xuLUeMAhqs3flCgEdAH5Yi4Jzh3Txoju+NqJyRFwdd4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763145564; c=relaxed/simple;
	bh=sCM5CZHDJgyl2q1jrA6chqTv1b4sZr5EAHWs+3qHbg0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=iIdvOUUCE+8rlSuwu0Xe7ZLSeqM5zaTqQ0U7XZu/fH3mY1sW9M44CaVotv6SRPwPQ5uGvIkuK3kc3w4BpNgbgdLNI4XEKyuSe8p1qVuxKI3mD7e2IKdTyFSUCzE90mhqz5Cv5B2j3/Zj2MQTT002Ml3AtFP1eRHLn9BFHBqVl6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LLOvsTha; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LLOvsTha"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7b80fed1505so1981657b3a.3
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Nov 2025 10:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763145562; x=1763750362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NlxMrLXPrBCU+jO2UaTPbpl/IwecL0/VlFyK5yk0EgQ=;
        b=LLOvsThajzHRXzrnTogleokRg7gdT8jpYbQp212oKGuBDcADyTNTD6P5ZbKjjPPVEv
         vKz9nI3ikWgR9IPKq3IimV8hWyKMVGwniLgypWQ1eyhiKDWUIA0rUkC+15B8VmCA+TYF
         J07GHbVsvr4QztgZMGLAb+EpUGMY/NFXfnk5rVHuquwvwlLihAZthZJePvchZXTja8Zs
         RNFn1vCZkdXts3xtG3Q633AS6jIGv/fozGjiB+f1A+SbM0nQU5ebKDArPBL72pmyUpqX
         Hw2HHbbFuGg/haU1wN4FCKBYMSO+nu2+LbLopVshkfF/WKomRSDSlxzT8M4DhjML4Vgr
         nopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763145562; x=1763750362;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NlxMrLXPrBCU+jO2UaTPbpl/IwecL0/VlFyK5yk0EgQ=;
        b=NbwWe2+LEPDcezjRjGYljXLaMclyyBJ2mNsWFcvkuOhMA0uGtDJL/jAMfQ0E9+qECz
         qWv6Eu+m7PVzpTguvp9rrcZmvuXTYUDEnIk9dr6y/Ereex16IiiLM4XGIu6xCGuJnv7i
         PGQ+HeiwybcHaPMHwEJw8m383lbWsjPba0Kjozc+xyxANBtbypekle1c92gfY2CTDD7l
         gZWPRLhfvQkI6VaEX8n0kdwXYMb5zPU37Ru7pENWx1Hr9imiybxnMS1HkblUhRHjvLjk
         tLPUNJizcWIBmRoFdvl/vFTUUjz/9LlZxQU48etKCmL77fYDZGhxPHItMMsxRkwdN/C2
         6XbQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9J/kbmViPLrZvGhE3oiUC034BUV8Z5vdPbGn1Ue7ECtKBQd0jKlnHhweHCsRTbAUuDWE3UMCyginNyw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc0k/P3sVNG4gPiJ7bSBvq2EXan7KIeABKWtRv6pqoCwhctryG
	kJ6xkIA74MXBQjDOhcbTFlh3XHI+vrWuyLNfTcyDCCxAF49qwbB4Xnwt
X-Gm-Gg: ASbGnctC/axFN4Rv8qtMGnce7AOySkHC9Uzfa6IVPAGpFLAG8BmKX0lUcohz0gBIReF
	v+hLGZTbhlUdtdPN9yvhxirKeCXRnXA67rUWwPodZed6YCiu0tVCPHfXeAqS29BF506dnO0PFvD
	2tpUavVRAO8xBXIwTCopoaeDQ/k2njfoFK2Oj0cdmGt/FTsCU+PzXmHcSb/2Y+pTNoWNLHaPWsN
	uHsbDXTh4BPLj4xaxxk0FGtt43uGPO/SttEt7HPAiKTEzcaMg/j3S3X08qZe8ri5KuEGhGJ3a/L
	DouHMU0zsn671AgcShE4b15Sr3OK5FC1koUXg4Df4ksg8ebgt1LbaxCABOkDS6SeTGW7FciML4y
	Zd3gCWOSA/xFDKV9IkNq5iHVhUSZWBUh8miZj7k37lUZHh3vW8A4ZJVthW1BAOJ8mB7ztpt241F
	zleKxYZy7pHbITgT5LKWZ8/knQHBkosPf51F/kLNKiC8ejc85/RwFVKv30Rfa6rYlLBKj+4JfYR
	IvGu60KTQ==
X-Google-Smtp-Source: AGHT+IF1cAptumORDftaftQhtRmfE70v3gTNtStBR9Wa3ZnIqnTjvq3Q6xjWxNHyknDfcBM12ABbKA==
X-Received: by 2002:a05:7022:7e06:b0:11a:2e9c:1119 with SMTP id a92af1059eb24-11b410f599cmr970592c88.19.1763145561798;
        Fri, 14 Nov 2025 10:39:21 -0800 (PST)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b06088604sm13030798c88.7.2025.11.14.10.39.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 10:39:21 -0800 (PST)
Date: Fri, 14 Nov 2025 10:39:19 -0800
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Rong Zhang <i@rong.moe>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Guenter Roeck <linux@roeck-us.net>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v5_0/7=5D_platform/x86=3A_lenovo-wm?=
 =?US-ASCII?Q?i-=7Bcapdata=2Cother=7D=3A_Add_HWMON_for_fan_speed?=
User-Agent: Thunderbird for Android
In-Reply-To: <20251114175927.52533-1-i@rong.moe>
References: <20251114175927.52533-1-i@rong.moe>
Message-ID: <9E2AB845-08A5-4579-9055-1C8B10244247@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On November 14, 2025 9:59:12 AM PST, Rong Zhang <i@rong=2Emoe> wrote:
>Lenovo WMI Other Mode interface also supports querying or setting fan
>speed RPM=2E This capability is decribed by LENOVO_CAPABILITY_DATA_00=2E
>Besides, LENOVO_FAN_TEST_DATA provides reference data for self-test of
>cooling fans, including minimum and maximum fan speed RPM=2E
>
>This patchset turns lenovo-wmi-capdata01 into a unified driver (now
>named lenovo-wmi-capdata) for LENOVO_CAPABILITY_DATA_{00,01} and
>LENOVO_FAN_TEST_DATA; then adds HWMON support for lenovo-wmi-other:
>
> - fanX_enable: enable/disable the fan (tunable)
> - fanX_input: current RPM
> - fanX_max: maximum RPM
> - fanX_min: minimum RPM
> - fanX_target: target RPM (tunable)
>
>LENOVO_CAPABILITY_DATA_{00,01} presents on all devices, so
>both binds to lenovo-wmi-other=2E However, some device does not have
>LENOVO_FAN_TEST_DATA and its presence is described by
>LENOVO_CAPABILITY_DATA_00; hence, the former binds to the latter and a
>callback is used to pass the data to lenovo-wmi-other=2E
>
>The implementation does not rely on a specific binding sequence=2E This
>has been fuzz-tested using:
>
>	#!/bin/bash
>
>	DRV_DIR=3D/sys/bus/wmi/drivers/lenovo_wmi_cd
>	CAPDATA_GUIDS=3D(
>		$(find "$DRV_DIR"/ -name '*-*-*-*-*-*' -printf "%f ")
>	)
>
>	b() { sudo tee "$DRV_DIR"/bind <<<"$1"; }
>	u() { sudo tee "$DRV_DIR"/unbind <<<"$1"; }
>
>	for guid in "${CAPDATA_GUIDS[@]}"; do
>		u "$guid"
>	done
>
>	while read -rsa perm; do
>		for guid in "${perm[@]}"; do
>			b "$guid"
>		done
>		sensors | grep -A3 lenovo_wmi_other || true
>		for guid in "${perm[@]}"; do
>			u "$guid"
>		done
>	done < <(python3 -c "
>	from itertools import permutations
>	ps =3D permutations('${CAPDATA_GUIDS[*]}'=2Esplit())
>	for p in ps: print(' '=2Ejoin(p))")
>
>	for guid in "${CAPDATA_GUIDS[@]}"; do
>		b "$guid"
>	done
>
>Tested on ThinkBook 14 G7+ ASP=2E
>
>Changes in v5:
>- Do not cast pointer to non-pointer or vice versa (thanks kernel test
>  robot)
>- Fix missing include (ditto)
>- Link to v4: https://lore=2Ekernel=2Eorg/r/20251113191152=2E96076-1-i@ro=
ng=2Emoe/
>
>Changes in v4:
>- Get rid of wmi_has_guid() (thanks Armin Wolf's inspiration)
>  - Add [PATCH v4 6/7], please review & test
>  - Rework HWMON registration
>    - Collect fan into from capdata00 and capdata_fan separately
>    - Use a callback to collect fan info from capdata_fan
>    - Trigger HWMON registration only if all fan info is collected
>    - Do not check 0x04050000=2Esupported, implied by the presense of
>      capdata_fan
>- Drop Reviewed-by & Tested-by from [PATCH v4 7/7] due to the changes,
>  please review & test
>- Link to v3: https://lore=2Ekernel=2Eorg/r/20251031155349=2E24693-1-i@ro=
ng=2Emoe/
>
>Changes in v3:
>- Fix grammar (thanks Derek J=2E Clark)
>- Link to v2: https://lore=2Ekernel=2Eorg/r/20251030193955=2E107148-1-i@r=
ong=2Emoe/
>
>Changes in v2:
>- Add a workaround for ACPI methods that return a 4B buffer for u32
>  (thanks Armin Wolf)
>- Fix function documentation (thanks kernel test bot)
>- Reword documentation (thanks Derek J=2E Clark)
>- Squash min/max reporting patch into the initial HWMON one (ditto)
>- Query 0x04050000 for interface availability (ditto)
>  - New parameter "expose_all_fans" to skip this check
>- Enforce min/max RPM constraint on set (ditto)
>  - New parameter "relax_fan_constraint" to disable this behavior
>  - Drop parameter "ignore_fan_cap", superseded by the next one
>  - New parameter "expose_all_fans" to expose fans w/o such data
>- Assume auto mode on probe (ditto)
>- Do not register HWMON device if no fan can be exposed
>- fanX_target: Return -EBUSY instead of raw target value when fan stops
>- Link to v1: https://lore=2Ekernel=2Eorg/r/20251019210450=2E88830-1-i@ro=
ng=2Emoe/
>
>Rong Zhang (7):
>  platform/x86: lenovo-wmi-helpers: Convert returned buffer into u32
>  platform/x86: Rename lenovo-wmi-capdata01 to lenovo-wmi-capdata
>  platform/x86: lenovo-wmi-{capdata,other}: Support multiple Capability
>    Data
>  platform/x86: lenovo-wmi-capdata: Add support for Capability Data 00
>  platform/x86: lenovo-wmi-capdata: Add support for Fan Test Data
>  platform/x86: lenovo-wmi-capdata: Wire up Fan Test Data
>  platform/x86: lenovo-wmi-other: Add HWMON for fan reporting/tuning
>
> =2E=2E=2E/wmi/devices/lenovo-wmi-other=2Erst          |  43 +-
> drivers/platform/x86/lenovo/Kconfig           |   5 +-
> drivers/platform/x86/lenovo/Makefile          |   2 +-
> drivers/platform/x86/lenovo/wmi-capdata=2Ec     | 808 ++++++++++++++++++
> drivers/platform/x86/lenovo/wmi-capdata=2Eh     |  65 ++
> drivers/platform/x86/lenovo/wmi-capdata01=2Ec   | 302 -------
> drivers/platform/x86/lenovo/wmi-capdata01=2Eh   |  25 -
> drivers/platform/x86/lenovo/wmi-helpers=2Ec     |  22 +-
> drivers/platform/x86/lenovo/wmi-other=2Ec       | 511 ++++++++++-
> 9 files changed, 1426 insertions(+), 357 deletions(-)
> create mode 100644 drivers/platform/x86/lenovo/wmi-capdata=2Ec
> create mode 100644 drivers/platform/x86/lenovo/wmi-capdata=2Eh
> delete mode 100644 drivers/platform/x86/lenovo/wmi-capdata01=2Ec
> delete mode 100644 drivers/platform/x86/lenovo/wmi-capdata01=2Eh
>
>
>base-commit: 6da43bbeb6918164f7287269881a5f861ae09d7e

Rong,

I'm out of town for the weekend, but I'll bring a Lenovo device with me=2E=
 If I get some time I'll test the changes while I'm gone, otherwise it will=
 need to wait until Monday=2E

Thanks,
Derek
