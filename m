Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515E6358D2F
	for <linux-hwmon@vger.kernel.org>; Fri,  9 Jan 2026 09:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767950012; cv=none; b=CKRU6AkDXjr/k+XkjEJrcpVxoJN31W9q4u+Q/jPwJMtbNHxH4rFBSECwhBlrXWukQbeX+yW7HSajsQtEXcxWfxhe16ZzP30az86kQHDClVdwKsDZriJQGHpiTVXjiY6lxJ75/2OzlkMcscD6hQoMexXN389pZ92SdUU8Zl55BNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767950012; c=relaxed/simple;
	bh=lrFkLVDGaGuyNoUNVz/0TGVPfCtMYPOF7uB0iBggo28=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=EIJ02+IdRynd/rDIvdcCto6ldagcgzo2POgekbS1KmjdOTWatoJKycafniwrDwJAPpEyJwGvcn1e0uLqryRAxziRns/gqbQB3u+CixbfrBF3fMNLLquEO1ZN2UmllqhpDfSH2Ev4c1i99EVif9qv1KKyPY/nRPvREayIYaOEPoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f8j2YoAk; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f8j2YoAk"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-121a0bcd376so934722c88.0
        for <linux-hwmon@vger.kernel.org>; Fri, 09 Jan 2026 01:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767950009; x=1768554809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PPTRZ0F0DSfI0drFYwDBEO4rgX5T4GVm7weugvC6dlk=;
        b=f8j2YoAkTR1+BRvpchs+038aNBahK+jw4UWxCRggs5ImPC2ymriY5Z0BREDkG7hwmB
         GKNnlxTydayroODLsxZHyY107c1r6ihOe9Hr5nGbfeF8Adb9tq8MpEU8dsbRCNXC9nJf
         2GmuBiJ5r3i5Az3Qj2JmbtrDyHsUDA0vMMO0TCBMqCUXGXhswcpGvsC0aUXFUmPNb7pW
         1/8QbUXcfJkzIYy7ybbbwg8MYZ241pf0u0tcOhqzPl5YUb97X6G+9qcNXItrYVrj/yM3
         xbKV9n3IceXwhO1djYTW/GtxSNbtL+UkpdUkDHzM95uqSnxTxWUwOVaD1u3Gc7v47+5Q
         lj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767950009; x=1768554809;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PPTRZ0F0DSfI0drFYwDBEO4rgX5T4GVm7weugvC6dlk=;
        b=AH04D0+qc/Ai2oME7g71Z1ZTaEo4cMCoeCynAQiVI1UW93cRoqGE7IwnxYCeq0OLUQ
         HjvT5nc8ERkjupMmmHnZjZpYyB5mive4hY/PQ3yuiwTeVcBOgGFoGjqH+6q38Qox9ouO
         FNzp22x60yqmoiWQn1aOzuTveE3zYFML2SvSLWJGhVHMwok/UgCqKUPU0to/PIrzM2Eo
         zD4sqg0FdIrCKnS7SppeUzv8oS9CdezCBq556uGyXscJ9pzkFzz88zVTSpPIw9pMeQS8
         F1iYaoJUXcd7DcmU+f1oWEotijP4BINUPnxbkZ/V6HgeCwdukvqgNvxmH9EFrVf6BXKD
         M00Q==
X-Forwarded-Encrypted: i=1; AJvYcCW1IZQe9tnqDWi33GmMpiCLIf7g+TzQRI6/jE22kVyMy2tVbcbNM48sZiAqvpKJwE8wkdsVB+jIUjINXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBa0r+Sc3UbLpB8KcRVbXtfgEyso1Sr1093bsssYy6k5qZVl2Q
	kla7tlB8lEGRlL98tJOXdrBotIvL+nSaeNFIRYSBxPs88YW4GQj0/xY6
X-Gm-Gg: AY/fxX7lz+Ipg4ccyXXk003EPOzxevqb3HL+CUelBjL697xsea2oPmJzYXVFHa4PbaD
	OxW8/b/bUdxb3/nL5ABvM37oMwNpRC1YdOtRpyc1RkemdCxwewHO/PjVeCi3cUfQegmoJxKLooo
	qd2EOrj5tXf9enP3+u5k2Musus9xwcHJC6ojK1zkpD+oP2/udSlinkgfCfp+WRqxwMdcCWLcDRY
	O/4dzG39QDS6fL3brM3hc3WTITtTMyrY3Z6wvzIQgOVTI4Pps0IbDp2F8h7bDOmQxg9lNS0nPlB
	lUT0RvIepwf99sUIV3rDJwNrBVkNpP9z4O9Y9IxyPL08HrX463WD46VID+FDEX2vn9v5NbBKdgE
	HXB1fuQ+ppepW5a6UFOkLwQXs9ZtIGkPTTvhgBFRirjsVXkzPFP0AX/2mT853UuSCnJ6PTLqm0j
	PJrQyl5BF+w5eSD7ogLq1cNBxX8qzNydf6K/GmM2AlrV4ahGszGv9NOIxOLRuJVmW8sALN+Quex
	DEoHX0gYQ==
X-Google-Smtp-Source: AGHT+IEeIL0WL5X143SR95Ut9/E2RufOc8nkCU7SPedNi+WVrC4kw6tE54Ar15Ej9c1Rohs2N/4BBA==
X-Received: by 2002:a05:7300:fb86:b0:2b0:4e86:814c with SMTP id 5a478bee46e88-2b17d207b17mr8619975eec.13.1767950009137;
        Fri, 09 Jan 2026 01:13:29 -0800 (PST)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707b16e4sm10674981eec.26.2026.01.09.01.13.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 01:13:28 -0800 (PST)
Date: Fri, 09 Jan 2026 01:13:27 -0800
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Rong Zhang <i@rong.moe>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Guenter Roeck <linux@roeck-us.net>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v7_0/7=5D_platform/x86=3A_lenovo-wm?=
 =?US-ASCII?Q?i-=7Bcapdata=2Cother=7D=3A_Add_HWMON_for_fan_speed?=
User-Agent: Thunderbird for Android
In-Reply-To: <20251125194959.157524-1-i@rong.moe>
References: <20251125194959.157524-1-i@rong.moe>
Message-ID: <4469595B-2116-4A97-98BB-8727C9F3D134@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On November 25, 2025 11:49:21 AM PST, Rong Zhang <i@rong=2Emoe> wrote:
>Lenovo WMI Other Mode interface also supports querying or setting fan
>speed RPM=2E This capability is described by LENOVO_CAPABILITY_DATA_00=2E
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
>Summarizing this scheme:
>
>        lenovo-wmi-other <-> capdata00 <-> capdata_fan
>        |- master            |- component
>                             |- sub-master
>                                           |- sub-component
>
>The callback will be called once both the master and the sub-component
>are bound to the sub-master (component)=2E
>
>This scheme is essential to solve these issues:
>- The component framework only supports one aggregation per master
>- A binding is only established until all components are found
>- The Fan Test Data interface may be missing on some devices
>- To get rid of queries for the presence of WMI GUIDs
>- The notifier framework cannot cleanly connect capdata_fan to
>  lenovo-wmi-other without introducing assumptions on probing sequence
>
>capdata00 is registered as a component and a sub-master on probe,
>instead of chaining the registrations in one's bind callback=2E This is
>because calling (un)registration methods of the component framework
>causes deadlock in (un)bind callbacks, i=2Ee=2E, it's impossible to regis=
ter
>capdata00 as a sub-master/component in its component/sub-master bind
>callback, and vice versa=2E
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
>Changes in v7:
>- Fix missing #include (thanks Ilpo J=C3=A4rvinen)
>- Fix formatting issues (ditto)
>- dev_dbg() instead of dev_info() on probe success (ditto)
>- Rearrange to drop some gotos (ditto)
>- Move the declarations of __free()-managed variables to where they are
>  assigned (ditto)
>- Improve the readability of struct definition and error paths (ditto)
>- Prevent back-and-forth changes (ditto)
>- Fix mistakenly inverted boundary check
>- Emit unaligned access to Fan Test Data's WMI block
>- Properly calculate array index when we truncate Fan Test Data
>- Fix typo
>- Link to v6: https://lore=2Ekernel=2Eorg/r/20251122184522=2E18677-1-i@ro=
ng=2Emoe/
>
>Changes in v6:
>- Fix mistaken error paths
>- Link to v5: https://lore=2Ekernel=2Eorg/r/20251114175927=2E52533-1-i@ro=
ng=2Emoe/
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
>    - Check 0x04050000=2Esupported and bind capdata_fan to capdata00
>  - Rework HWMON registration
>    - Collect fan info from capdata00 and capdata_fan separately
>    - Use a callback to collect fan info from capdata_fan
>    - Trigger HWMON registration only if all fan info is collected
>    - Do not check 0x04050000=2Esupported, implied by the presence of
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
> drivers/platform/x86/lenovo/wmi-capdata=2Ec     | 812 ++++++++++++++++++
> drivers/platform/x86/lenovo/wmi-capdata=2Eh     |  65 ++
> drivers/platform/x86/lenovo/wmi-capdata01=2Ec   | 302 -------
> drivers/platform/x86/lenovo/wmi-capdata01=2Eh   |  25 -
> drivers/platform/x86/lenovo/wmi-helpers=2Ec     |  21 +-
> drivers/platform/x86/lenovo/wmi-other=2Ec       | 515 ++++++++++-
> 9 files changed, 1433 insertions(+), 357 deletions(-)
> create mode 100644 drivers/platform/x86/lenovo/wmi-capdata=2Ec
> create mode 100644 drivers/platform/x86/lenovo/wmi-capdata=2Eh
> delete mode 100644 drivers/platform/x86/lenovo/wmi-capdata01=2Ec
> delete mode 100644 drivers/platform/x86/lenovo/wmi-capdata01=2Eh
>
>
>base-commit: ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d

Ilpo,

Is there any particular reason this appears to be stalled? I'd like to sta=
rt work on some features that rely on the capdata00 interface but I'm waiti=
ng on this to be applied as there has been frequent back and forth on exact=
ly how to add the different components=2E

Thanks,=20
Derek
