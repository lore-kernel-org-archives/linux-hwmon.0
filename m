Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3F02E370C
	for <linux-hwmon@vger.kernel.org>; Tue, 25 Nov 2025 21:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764107004; cv=none; b=rIR0dKOxBhCx91Y0qshym2tXK6w/QSx99iHJ3gByxNxn0PsofLIbqxKaNU2tcV5E6qyHHlC25fZcHVYaRIfXvvyWR1SSDwV6UczXNgRVKvbmPO8Ny+dlMdNHSk0l9GXBjmKDgXfs9cOC3VQkIcTLQhY5IsgcGcHkEnrKR/7qZEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764107004; c=relaxed/simple;
	bh=sciRDpXmUUZtWUokSg8Rh0hkoXNsTkk3tG3N5QviszA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IYjd4fhUqclot8qb3cSKqggK9BV6p3lVG2R8vfRR9kJ6T+ZAgP0bRs7tMEDjMJARpc9DgeVQaJKVjmToyA2pJp/ut8SUlN9Cj0IX88ie13KxeQzEMbQw8OJBnh/D9/41UB368VIKWDSpL8vpn0wfgZZ5Lu6Ad1o/2MCV2JS1SRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=esFB0EU+; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="esFB0EU+"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8738c6fdbe8so3511786d6.1
        for <linux-hwmon@vger.kernel.org>; Tue, 25 Nov 2025 13:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764107001; x=1764711801; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NyGmQD86D+80mIXQBGpiMaKQgG5Ylr9/mLSzUxyepqQ=;
        b=esFB0EU+O+9DKRBFwOzxyWC+S0Noa6/3yAxdV+kPOefUAVuj2ZBDuGfN88HmQXpCw5
         HUyNomJvKFIul/Q0hYn4s+t8V5t06Uz542qiRNooq1xiiG5uiITCdAedwpnNPRzYmnzb
         T/VMynSWAtaA5o0e6a0654OtoIeKrlDa3Kxqf8HTdc9PmOzcQVonAAUYu0AYsuwsJVLc
         8jvxRqqfKRhLJV3LDEaOMnXz8KsGOyCRo1Oq2LI5aNyM9br3pG7o+boKG4RzKaRqQpys
         hmcD89rlsJynJ7YaECAmtB/K0ymA76XxTWQPNjPkOyzd18sd559nJIMDZiS0ZRAWfJrp
         IrlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764107001; x=1764711801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NyGmQD86D+80mIXQBGpiMaKQgG5Ylr9/mLSzUxyepqQ=;
        b=u2FQoyh7pDS6L8AyhB6VJ6FPZXIM9eFqRt+IbBP8Fvoj8uR/GNdoRkgPSKFg3/nwRk
         J95JkTB2mPRCbjJ/mPrUCHk1s9JyAbm9xKYKiZFmlhw1fNPlHyicQJ3EagoQIxNstdqJ
         fGWngrAjLiqg4TBxvopokwJog87nhpRZXyEIgy09jcR7ZURim7aWpUe4JuJXtHCgfTUw
         hHC36zkkKwUjvdzUQPgeIMoI3WNfpvFwUHYAUFIJxASqJplrh+mrpezitZjcqRdQcTvG
         B1oia960V+IkUCaC4RihAjX4Krps5zXrlrEU48erYur74gL0uKROC/RQTQDiAzpYLGr7
         wZTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBJhoKzZ/Nkyf6fuPWcAzRXbVPhyyDtxHYYm9Z0NkWhJXEpDDiw9YnvAvYoj/TMD42v+cJ0mTp6o9feA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzC/Feek53xgPOLbqqdva0M+nl6QnhCxGpp6A7IdHrmjOrasfSI
	IbD/k6BMY/gjwYtLKfRTZW9mjHQeoeDbeCxuqVloFeL1W6slLITI6Jf6mljEqjTMCjdw+pLijfM
	5PqFQACIsZeUvvouIUQtoDxisSd52GMc=
X-Gm-Gg: ASbGncvhL505Ts3W9GCFR+vXmsHDlNg3uglDt3O+dmm5s0m2tgNfMxrxUSSGKt11QIs
	TojJBw9I4H5ok4J1PJ3WsKwfc0+H3EzgXrNMBefY+SnRGlFqqtSvDKikAfAQB+6zGkjHs8EYCFz
	S8Z3LoSvtdoVKOTXOL5mof9O+X6NdXrLa7AZRGpLMz+64BecN4rzMQgpUeza0vlo0iJQw/Mlubh
	JCm7R5DYmtqxNqcEcYo1bQ8XBpV/Lwkri+xv6shySizd4k94Qlgf2z43ujTelSYdiUukQOz
X-Google-Smtp-Source: AGHT+IFi83VDLD4ujBJX61RJ5WQsTC7bwJ4eF/N+nrBrj/4nbA+cA8DfC3oCnCyxZ61mA1vioMQB4jani18+TtXdgT8=
X-Received: by 2002:ad4:5be2:0:b0:882:37aa:1451 with SMTP id
 6a1803df08f44-884700a8feamr297884926d6.8.1764107001203; Tue, 25 Nov 2025
 13:43:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125194959.157524-1-i@rong.moe>
In-Reply-To: <20251125194959.157524-1-i@rong.moe>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Tue, 25 Nov 2025 13:43:10 -0800
X-Gm-Features: AWmQ_bkGZsGAG4j26JEZj4RyiOxOK8vZpwxj8uProlqeUBTH2oXqJhVEYb9VU5c
Message-ID: <CAFqHKTkti-cA-9na0wx8bAyn-_ez2+mD_Mh8DGUa46ktkSjZsg@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] platform/x86: lenovo-wmi-{capdata,other}: Add
 HWMON for fan speed
To: Rong Zhang <i@rong.moe>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Guenter Roeck <linux@roeck-us.net>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 11:50=E2=80=AFAM Rong Zhang <i@rong.moe> wrote:
>
> Lenovo WMI Other Mode interface also supports querying or setting fan
> speed RPM. This capability is described by LENOVO_CAPABILITY_DATA_00.
> Besides, LENOVO_FAN_TEST_DATA provides reference data for self-test of
> cooling fans, including minimum and maximum fan speed RPM.
>
> This patchset turns lenovo-wmi-capdata01 into a unified driver (now
> named lenovo-wmi-capdata) for LENOVO_CAPABILITY_DATA_{00,01} and
> LENOVO_FAN_TEST_DATA; then adds HWMON support for lenovo-wmi-other:
>
>  - fanX_enable: enable/disable the fan (tunable)
>  - fanX_input: current RPM
>  - fanX_max: maximum RPM
>  - fanX_min: minimum RPM
>  - fanX_target: target RPM (tunable)
>
> LENOVO_CAPABILITY_DATA_{00,01} presents on all devices, so
> both binds to lenovo-wmi-other. However, some device does not have
> LENOVO_FAN_TEST_DATA and its presence is described by
> LENOVO_CAPABILITY_DATA_00; hence, the former binds to the latter and a
> callback is used to pass the data to lenovo-wmi-other.
>
> Summarizing this scheme:
>
>         lenovo-wmi-other <-> capdata00 <-> capdata_fan
>         |- master            |- component
>                              |- sub-master
>                                            |- sub-component
>
> The callback will be called once both the master and the sub-component
> are bound to the sub-master (component).
>
> This scheme is essential to solve these issues:
> - The component framework only supports one aggregation per master
> - A binding is only established until all components are found
> - The Fan Test Data interface may be missing on some devices
> - To get rid of queries for the presence of WMI GUIDs
> - The notifier framework cannot cleanly connect capdata_fan to
>   lenovo-wmi-other without introducing assumptions on probing sequence
>
> capdata00 is registered as a component and a sub-master on probe,
> instead of chaining the registrations in one's bind callback. This is
> because calling (un)registration methods of the component framework
> causes deadlock in (un)bind callbacks, i.e., it's impossible to register
> capdata00 as a sub-master/component in its component/sub-master bind
> callback, and vice versa.
>
> The implementation does not rely on a specific binding sequence. This
> has been fuzz-tested using:
>
>         #!/bin/bash
>
>         DRV_DIR=3D/sys/bus/wmi/drivers/lenovo_wmi_cd
>         CAPDATA_GUIDS=3D(
>                 $(find "$DRV_DIR"/ -name '*-*-*-*-*-*' -printf "%f ")
>         )
>
>         b() { sudo tee "$DRV_DIR"/bind <<<"$1"; }
>         u() { sudo tee "$DRV_DIR"/unbind <<<"$1"; }
>
>         for guid in "${CAPDATA_GUIDS[@]}"; do
>                 u "$guid"
>         done
>
>         while read -rsa perm; do
>                 for guid in "${perm[@]}"; do
>                         b "$guid"
>                 done
>                 sensors | grep -A3 lenovo_wmi_other || true
>                 for guid in "${perm[@]}"; do
>                         u "$guid"
>                 done
>         done < <(python3 -c "
>         from itertools import permutations
>         ps =3D permutations('${CAPDATA_GUIDS[*]}'.split())
>         for p in ps: print(' '.join(p))")
>
>         for guid in "${CAPDATA_GUIDS[@]}"; do
>                 b "$guid"
>         done
>
> Tested on ThinkBook 14 G7+ ASP.
>
> Changes in v7:
> - Fix missing #include (thanks Ilpo J=C3=A4rvinen)
> - Fix formatting issues (ditto)
> - dev_dbg() instead of dev_info() on probe success (ditto)
> - Rearrange to drop some gotos (ditto)
> - Move the declarations of __free()-managed variables to where they are
>   assigned (ditto)
> - Improve the readability of struct definition and error paths (ditto)
> - Prevent back-and-forth changes (ditto)
> - Fix mistakenly inverted boundary check
> - Emit unaligned access to Fan Test Data's WMI block
> - Properly calculate array index when we truncate Fan Test Data
> - Fix typo
> - Link to v6: https://lore.kernel.org/r/20251122184522.18677-1-i@rong.moe=
/
>
> Changes in v6:
> - Fix mistaken error paths
> - Link to v5: https://lore.kernel.org/r/20251114175927.52533-1-i@rong.moe=
/
>
> Changes in v5:
> - Do not cast pointer to non-pointer or vice versa (thanks kernel test
>   robot)
> - Fix missing include (ditto)
> - Link to v4: https://lore.kernel.org/r/20251113191152.96076-1-i@rong.moe=
/
>
> Changes in v4:
> - Get rid of wmi_has_guid() (thanks Armin Wolf's inspiration)
>   - Add [PATCH v4 6/7], please review & test
>     - Check 0x04050000.supported and bind capdata_fan to capdata00
>   - Rework HWMON registration
>     - Collect fan info from capdata00 and capdata_fan separately
>     - Use a callback to collect fan info from capdata_fan
>     - Trigger HWMON registration only if all fan info is collected
>     - Do not check 0x04050000.supported, implied by the presence of
>       capdata_fan
> - Drop Reviewed-by & Tested-by from [PATCH v4 7/7] due to the changes,
>   please review & test
> - Link to v3: https://lore.kernel.org/r/20251031155349.24693-1-i@rong.moe=
/
>
> Changes in v3:
> - Fix grammar (thanks Derek J. Clark)
> - Link to v2: https://lore.kernel.org/r/20251030193955.107148-1-i@rong.mo=
e/
>
> Changes in v2:
> - Add a workaround for ACPI methods that return a 4B buffer for u32
>   (thanks Armin Wolf)
> - Fix function documentation (thanks kernel test bot)
> - Reword documentation (thanks Derek J. Clark)
> - Squash min/max reporting patch into the initial HWMON one (ditto)
> - Query 0x04050000 for interface availability (ditto)
>   - New parameter "expose_all_fans" to skip this check
> - Enforce min/max RPM constraint on set (ditto)
>   - New parameter "relax_fan_constraint" to disable this behavior
>   - Drop parameter "ignore_fan_cap", superseded by the next one
>   - New parameter "expose_all_fans" to expose fans w/o such data
> - Assume auto mode on probe (ditto)
> - Do not register HWMON device if no fan can be exposed
> - fanX_target: Return -EBUSY instead of raw target value when fan stops
> - Link to v1: https://lore.kernel.org/r/20251019210450.88830-1-i@rong.moe=
/
>
> Rong Zhang (7):
>   platform/x86: lenovo-wmi-helpers: Convert returned buffer into u32
>   platform/x86: Rename lenovo-wmi-capdata01 to lenovo-wmi-capdata
>   platform/x86: lenovo-wmi-{capdata,other}: Support multiple Capability
>     Data
>   platform/x86: lenovo-wmi-capdata: Add support for Capability Data 00
>   platform/x86: lenovo-wmi-capdata: Add support for Fan Test Data
>   platform/x86: lenovo-wmi-capdata: Wire up Fan Test Data
>   platform/x86: lenovo-wmi-other: Add HWMON for fan reporting/tuning
>
>  .../wmi/devices/lenovo-wmi-other.rst          |  43 +-
>  drivers/platform/x86/lenovo/Kconfig           |   5 +-
>  drivers/platform/x86/lenovo/Makefile          |   2 +-
>  drivers/platform/x86/lenovo/wmi-capdata.c     | 812 ++++++++++++++++++
>  drivers/platform/x86/lenovo/wmi-capdata.h     |  65 ++
>  drivers/platform/x86/lenovo/wmi-capdata01.c   | 302 -------
>  drivers/platform/x86/lenovo/wmi-capdata01.h   |  25 -
>  drivers/platform/x86/lenovo/wmi-helpers.c     |  21 +-
>  drivers/platform/x86/lenovo/wmi-other.c       | 515 ++++++++++-
>  9 files changed, 1433 insertions(+), 357 deletions(-)
>  create mode 100644 drivers/platform/x86/lenovo/wmi-capdata.c
>  create mode 100644 drivers/platform/x86/lenovo/wmi-capdata.h
>  delete mode 100644 drivers/platform/x86/lenovo/wmi-capdata01.c
>  delete mode 100644 drivers/platform/x86/lenovo/wmi-capdata01.h
>
>
> base-commit: ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
> --
> 2.51.0
>

Rong,

Everything seems to be working as expected on unsupported devices.

[    4.398189] lenovo_wmi_other
DC2A8805-3A8C-41BA-A6F7-092E0089CD3B-3: bound
362A3AFE-3D96-4665-8530-96DAD5BB300E-13 (ops lwmi_cd_component_ops
[lenovo_wmi_capdata])
[    4.398203] lenovo_wmi_other
DC2A8805-3A8C-41BA-A6F7-092E0089CD3B-3: bound
7A8F5407-CB67-4D6E-B547-39B3BE018154-9 (ops lwmi_cd_component_ops
[lenovo_wmi_capdata])
[    4.398208] lenovo_wmi_other
DC2A8805-3A8C-41BA-A6F7-092E0089CD3B-3: fan reporting/tuning is
unsupported on this device

Obviously I can only test so far, but for where it makes sense on the
series (through to 6/7) where it is missing you can add my tag
Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>

And for the entire series where it is missing:
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com

As an aside, I'll likely need you to test a future patch series I'm
working on for regressions after this is accepted as I will touch the
hwmon interface a lot when adding fan curve auto points from the
cd01/om interfaces.

Thanks,
- Derek
