Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2940330C624;
	Thu, 22 Jan 2026 14:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769092377; cv=none; b=AfK06OLOGyUUQD+q5H9zUCDWXXERNwo93V0gWxar3PTPqT+jfmc7z5xSLu3XY3chEQjZB6zw260c8xjVkYjG/oHD4vQMK641P1h9jjQHutjPve4dn9yxXpBPACsuvrSuDIESUuxZFn7rqQA6hrhwLCUJ+kGHS4RdnAhze2MAvXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769092377; c=relaxed/simple;
	bh=IW4Vd/yGyXoa2kmfaqL1HDtnLHvmWmznLQQcR8unXEo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WLV9Nix4EpwASVVt7rr/YJQuJlUJY8TtcxUZRr7pmvhLrgir1nzIzhESZZ3ZfNQLMMCNoBqKhNp6bwhkx5m4sCSPM3LqjRBfR113SAZAgdyxp7cq3Q0awYxyEXJfETHLsAuCA1aiN1RZ/H1VQ9LNQd1TmUSSnb+dvax62ENrlp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bidw/lb7; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bidw/lb7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769092375; x=1800628375;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=IW4Vd/yGyXoa2kmfaqL1HDtnLHvmWmznLQQcR8unXEo=;
  b=bidw/lb7ZUdWHqm0XYlqfMaUmtExGLEUQ5j/mzs2JjoRWUnbGCq4q+HC
   gD7QVMvfdvGBIlEB4915netqrylu+xDGs1PkhpeITQmk6y+bLMWiG/QFd
   IDiOAobkK0DH78IsF6jOf5bF/NAM0+tcx+0lXUo8nrm1ScCHelijUE87J
   DpB3bV9Vi+6wbboJ0cisz8dQIdK83cwQXOQu5fmwIIrUJX/IZsc7RK53E
   lcVOLkV3u40ceUj3lrmCGutNfqejal7EPJ0HXacCAFroEaUxhUhQigYaG
   w0Kg0aZgoKYOcneEMH1PzIDPh77itI0OhKHZaNKyVxpMEjycapU1ZKDRt
   Q==;
X-CSE-ConnectionGUID: LUel67+8RdmANm2081MYcQ==
X-CSE-MsgGUID: VBlBTzMbQOOEpNNtpkPr7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="74193718"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="74193718"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 06:32:54 -0800
X-CSE-ConnectionGUID: i+t146XSTAmVPGJ/XvmrIQ==
X-CSE-MsgGUID: V+jI/rfERJquFct723h1vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="206564972"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.15])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 06:32:50 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 22 Jan 2026 16:32:46 +0200 (EET)
To: Rong Zhang <i@rong.moe>
cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Derek J. Clark" <derekjohn.clark@gmail.com>, Armin Wolf <W_Armin@gmx.de>, 
    Hans de Goede <hansg@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
    Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v11 0/7] platform/x86: lenovo-wmi-{capdata,other}: Add
 HWMON for fan speed
In-Reply-To: <20260120182104.163424-1-i@rong.moe>
Message-ID: <eb8e0be1-bbff-4c78-797b-586f2201554f@linux.intel.com>
References: <20260120182104.163424-1-i@rong.moe>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-674063632-1769092366=:1059"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-674063632-1769092366=:1059
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 21 Jan 2026, Rong Zhang wrote:

> Lenovo WMI Other Mode interface also supports querying or setting fan
> speed RPM. This capability is described by LENOVO_CAPABILITY_DATA_00.
> Besides, LENOVO_FAN_TEST_DATA provides reference data for self-test of
> cooling fans, including minimum and maximum fan speed RPM.
>=20
> This patchset turns lenovo-wmi-capdata01 into a unified driver (now
> named lenovo-wmi-capdata) for LENOVO_CAPABILITY_DATA_{00,01} and
> LENOVO_FAN_TEST_DATA; then adds HWMON support for lenovo-wmi-other:
>=20
>  - fanX_div: internal RPM divisor
>  - fanX_input: current RPM
>  - fanX_max: maximum RPM
>  - fanX_min: minimum RPM
>  - fanX_target: target RPM (tunable, 0=3Dauto)
>=20
> LENOVO_CAPABILITY_DATA_{00,01} presents on all devices, so
> both binds to lenovo-wmi-other. However, some device does not have
> LENOVO_FAN_TEST_DATA and its presence is described by
> LENOVO_CAPABILITY_DATA_00; hence, the former binds to the latter and a
> callback is used to pass the data to lenovo-wmi-other.
>=20
> Summarizing this scheme:
>=20
>         lenovo-wmi-other <-> capdata00 <-> capdata_fan
>         |- master            |- component
>                              |- sub-master |- sub-component
>=20
> The callback will be called once both the master and the sub-component
> are bound to the sub-master (component).
>=20
> This scheme is essential to solve these issues:
> - The component framework only supports one aggregation per master
> - A binding is only established until all components are found
> - The Fan Test Data interface may be missing on some devices
> - To get rid of queries for the presence of WMI GUIDs
> - The notifier framework cannot cleanly connect capdata_fan to
>   lenovo-wmi-other without introducing assumptions on probing sequence
>=20
> capdata00 is registered as a component and a sub-master on probe,
> instead of chaining the registrations in one's bind callback. This is
> because calling (un)registration methods of the component framework
> causes deadlock in (un)bind callbacks, i.e., it's impossible to register
> capdata00 as a sub-master/component in its component/sub-master bind
> callback, and vice versa.
>=20
> The implementation does not rely on a specific binding sequence. This
> has been fuzz-tested using:
>=20
> =09#!/bin/bash
>=20
> =09DRV_DIR=3D/sys/bus/wmi/drivers/lenovo_wmi_cd
> =09CAPDATA_GUIDS=3D(
> =09=09$(find "$DRV_DIR"/ -name '*-*-*-*-*-*' -printf "%f ")
> =09)
>=20
> =09b() {
> =09=09echo -n 'B: '
> =09=09sudo tee "$DRV_DIR"/bind <<<"$1"
> =09}
> =09u() {
> =09=09echo -n 'U: '
> =09=09sudo tee "$DRV_DIR"/unbind <<<"$1"
> =09}
>=20
> =09while read -rsa perm; do
> =09=09for guid in "${perm[@]}"; do
> =09=09=09u "$guid"
> =09=09done
> =09=09for guid in "${perm[@]}"; do
> =09=09=09b "$guid"
> =09=09done
> =09=09sensors | grep -A3 lenovo_wmi_other
> =09=09echo '=3D=3D=3D=3D=3D=3D=3D=3D'
> =09done < <(python3 -c "
> =09from itertools import permutations
> =09guids =3D '${CAPDATA_GUIDS[*]}'.split()
> =09for r in range(1, len(guids) + 1):
> =09=09ps =3D permutations(guids, r)
> =09=09for p in ps:
> =09=09=09print(' '.join(p))
> =09")
>=20
> Tested on ThinkBook 14 G7+ ASP.
>=20
> Changes in v11:
> - Adopt a unified name (lenovo_wmi_capdata) for kmod, Kconfig, export
>   namespace and driver (thanks Ilpo J=C3=A4rvinen)
> - Link to v10: https://lore.kernel.org/r/20260117210051.108988-1-i@rong.m=
oe/
>=20
> Changes in v10:
> - Remove fanX_enable due to semantic mismatch with HWMON ABI (thanks
>   Kurt Borja)
>   - By removing it, its functionality (stopping the fan) is hidden
>     behind the module parameter "relax_fan_constraint", so that users
>     won't accidentally stop the fan while in a default setup (ditto)
> - Mention fanX_target=3D0 means auto in documentation (ditto)
> - Also accept retval=3D0 while setting the fan (ditto)
> - Add fanX_div (thanks Derek J. Clark)
> - Round down the written value of fanX_target to the nearest multiple of
>   fanX_div, so that the stored value matches the effective value
> - Fix HWMON missing when capdata01 is reprobed
> - Link to v9: https://lore.kernel.org/r/20260114122745.986699-1-i@rong.mo=
e/
>=20
> Changes in v9:
> - Make kernel-doc.py happy (thanks Ilpo J=C3=A4rvinen, kernel test robot)
> - Link to v8: https://lore.kernel.org/r/20260113172817.393856-1-i@rong.mo=
e/
>=20
> Changes in v8:
> - Refactor some statements to improve readability (thanks Ilpo J=C3=A4rvi=
nen)
> - Use more commonly used errno (ditto)
> - Fix missing #include (ditto)
> - Link to v7: https://lore.kernel.org/r/20251125194959.157524-1-i@rong.mo=
e/
>=20
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
>=20
> Changes in v6:
> - Fix mistaken error paths
> - Link to v5: https://lore.kernel.org/r/20251114175927.52533-1-i@rong.moe=
/
>=20
> Changes in v5:
> - Do not cast pointer to non-pointer or vice versa (thanks kernel test
>   robot)
> - Fix missing include (ditto)
> - Link to v4: https://lore.kernel.org/r/20251113191152.96076-1-i@rong.moe=
/
>=20
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
>=20
> Changes in v3:
> - Fix grammar (thanks Derek J. Clark)
> - Link to v2: https://lore.kernel.org/r/20251030193955.107148-1-i@rong.mo=
e/
>=20
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
>=20
> Rong Zhang (7):
>   platform/x86: lenovo-wmi-helpers: Convert returned buffer into u32
>   platform/x86: Rename lenovo-wmi-capdata01 to lenovo-wmi-capdata
>   platform/x86: lenovo-wmi-{capdata,other}: Support multiple Capability
>     Data
>   platform/x86: lenovo-wmi-capdata: Add support for Capability Data 00
>   platform/x86: lenovo-wmi-capdata: Add support for Fan Test Data
>   platform/x86: lenovo-wmi-capdata: Wire up Fan Test Data
>   platform/x86: lenovo-wmi-other: Add HWMON for fan reporting/tuning
>=20
>  .../wmi/devices/lenovo-wmi-other.rst          |  46 +-
>  drivers/platform/x86/lenovo/Kconfig           |   5 +-
>  drivers/platform/x86/lenovo/Makefile          |   2 +-
>  drivers/platform/x86/lenovo/wmi-capdata.c     | 829 ++++++++++++++++++
>  drivers/platform/x86/lenovo/wmi-capdata.h     |  65 ++
>  drivers/platform/x86/lenovo/wmi-capdata01.c   | 302 -------
>  drivers/platform/x86/lenovo/wmi-capdata01.h   |  25 -
>  drivers/platform/x86/lenovo/wmi-helpers.c     |  21 +-
>  drivers/platform/x86/lenovo/wmi-other.c       | 528 ++++++++++-
>  9 files changed, 1466 insertions(+), 357 deletions(-)
>  create mode 100644 drivers/platform/x86/lenovo/wmi-capdata.c
>  create mode 100644 drivers/platform/x86/lenovo/wmi-capdata.h
>  delete mode 100644 drivers/platform/x86/lenovo/wmi-capdata01.c
>  delete mode 100644 drivers/platform/x86/lenovo/wmi-capdata01.h
>=20
>=20
> base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7

Thanks, I've replace v10 with this.

--=20
 i.

--8323328-674063632-1769092366=:1059--
