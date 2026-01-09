Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226752FC86C;
	Fri,  9 Jan 2026 09:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767952261; cv=none; b=uuLHzD4olhSNwmhNqKp0uHJLvpQRG+Q/vCAL6Idjz/YtD4Ii+3SVwDjYNsf94N49VM50UWLnliiRjXWqE0eEnzUhjeLJcrKTiPU9CM//4Pmv3QqU5ZWzrwgHT5g8o3I9C0WoUM4JWMOYvDKkzxms3v/ozW6cOZwv7k6JubzkpEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767952261; c=relaxed/simple;
	bh=DuaGDR+p7HoP5wVDbqVD0tah2uji/s3YCPqZ+i4tgwA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XVDEOgg+ugvVsjXvF4oVe5KVYL2uYon/WC/ZLgWd1j5Pqk/XorFPcRn+XL+smBk96tC1qf0o7v81hi3O8xS4itnGjZ5hjnOMCF5YLPr1pwLJsxtK8yZ3r9BT7xuaXaZHzETAO5kW28nIjlRJ3jilZEDyiP7y7hvldH8GWlJ4+CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hh79OwEc; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hh79OwEc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767952260; x=1799488260;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=DuaGDR+p7HoP5wVDbqVD0tah2uji/s3YCPqZ+i4tgwA=;
  b=hh79OwEcU19bYABshzYczmd6bxWJeCFzazqiaquGXOcBfMiYELrfX34I
   QxO0dEFDdZloPWaSVgtg0QgXAhABB2Y3B4ejec47Ut7Lj1kCfcwVPvdT4
   k9d0NXsgDlhTrN9Lvju91DXSx7D9Wtz00dAgKjcVQoyWEoTDKo0owwSrI
   4zgRzPCjm1qXAh4xh5JA6eqGwv1H9521N3aux2tBS6ujW8Q421c42uWqX
   klW8fwaUpbmnK6hRG60t5aYM38FIMhd3dIkjoyJ7FyfNJry+SvY/aqq+w
   s4Bc7e53rdXXs89Jck9ueYOsSwpHTVa5uGYhom3n4KkLaS1IaTRR6rMxk
   w==;
X-CSE-ConnectionGUID: VFfdUGq6QS2p4s328M4NPg==
X-CSE-MsgGUID: RCRIEmxdRZ2ECbnbxLKLsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="68530196"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="68530196"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 01:50:59 -0800
X-CSE-ConnectionGUID: RmzYRyanQoOmp216OPLl9w==
X-CSE-MsgGUID: 6iT0DApqQjCV902JEESJYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="234618596"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.124.223.57])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 01:50:56 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 9 Jan 2026 11:50:54 +0200 (EET)
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, Armin Wolf <W_Armin@gmx.de>
cc: Rong Zhang <i@rong.moe>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
    Hans de Goede <hansg@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v7 0/7] platform/x86: lenovo-wmi-{capdata,other}: Add
 HWMON for fan speed
In-Reply-To: <4469595B-2116-4A97-98BB-8727C9F3D134@gmail.com>
Message-ID: <bd88ef1f-2695-4cc2-fa78-f3e62d436edb@linux.intel.com>
References: <20251125194959.157524-1-i@rong.moe> <4469595B-2116-4A97-98BB-8727C9F3D134@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1376723253-1767952254=:1008"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1376723253-1767952254=:1008
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 9 Jan 2026, Derek J. Clark wrote:

> On November 25, 2025 11:49:21 AM PST, Rong Zhang <i@rong.moe> wrote:
> >Lenovo WMI Other Mode interface also supports querying or setting fan
> >speed RPM. This capability is described by LENOVO_CAPABILITY_DATA_00.
> >Besides, LENOVO_FAN_TEST_DATA provides reference data for self-test of
> >cooling fans, including minimum and maximum fan speed RPM.
> >
> >This patchset turns lenovo-wmi-capdata01 into a unified driver (now
> >named lenovo-wmi-capdata) for LENOVO_CAPABILITY_DATA_{00,01} and
> >LENOVO_FAN_TEST_DATA; then adds HWMON support for lenovo-wmi-other:
> >
> > - fanX_enable: enable/disable the fan (tunable)
> > - fanX_input: current RPM
> > - fanX_max: maximum RPM
> > - fanX_min: minimum RPM
> > - fanX_target: target RPM (tunable)
> >
> >LENOVO_CAPABILITY_DATA_{00,01} presents on all devices, so
> >both binds to lenovo-wmi-other. However, some device does not have
> >LENOVO_FAN_TEST_DATA and its presence is described by
> >LENOVO_CAPABILITY_DATA_00; hence, the former binds to the latter and a
> >callback is used to pass the data to lenovo-wmi-other.
> >
> >Summarizing this scheme:
> >
> >        lenovo-wmi-other <-> capdata00 <-> capdata_fan
> >        |- master            |- component
> >                             |- sub-master
> >                                           |- sub-component
> >
> >The callback will be called once both the master and the sub-component
> >are bound to the sub-master (component).
> >
> >This scheme is essential to solve these issues:
> >- The component framework only supports one aggregation per master
> >- A binding is only established until all components are found
> >- The Fan Test Data interface may be missing on some devices
> >- To get rid of queries for the presence of WMI GUIDs
> >- The notifier framework cannot cleanly connect capdata_fan to
> >  lenovo-wmi-other without introducing assumptions on probing sequence
> >
> >capdata00 is registered as a component and a sub-master on probe,
> >instead of chaining the registrations in one's bind callback. This is
> >because calling (un)registration methods of the component framework
> >causes deadlock in (un)bind callbacks, i.e., it's impossible to register
> >capdata00 as a sub-master/component in its component/sub-master bind
> >callback, and vice versa.
> >
> >The implementation does not rely on a specific binding sequence. This
> >has been fuzz-tested using:
> >
> >=09#!/bin/bash
> >
> >=09DRV_DIR=3D/sys/bus/wmi/drivers/lenovo_wmi_cd
> >=09CAPDATA_GUIDS=3D(
> >=09=09$(find "$DRV_DIR"/ -name '*-*-*-*-*-*' -printf "%f ")
> >=09)
> >
> >=09b() { sudo tee "$DRV_DIR"/bind <<<"$1"; }
> >=09u() { sudo tee "$DRV_DIR"/unbind <<<"$1"; }
> >
> >=09for guid in "${CAPDATA_GUIDS[@]}"; do
> >=09=09u "$guid"
> >=09done
> >
> >=09while read -rsa perm; do
> >=09=09for guid in "${perm[@]}"; do
> >=09=09=09b "$guid"
> >=09=09done
> >=09=09sensors | grep -A3 lenovo_wmi_other || true
> >=09=09for guid in "${perm[@]}"; do
> >=09=09=09u "$guid"
> >=09=09done
> >=09done < <(python3 -c "
> >=09from itertools import permutations
> >=09ps =3D permutations('${CAPDATA_GUIDS[*]}'.split())
> >=09for p in ps: print(' '.join(p))")
> >
> >=09for guid in "${CAPDATA_GUIDS[@]}"; do
> >=09=09b "$guid"
> >=09done
> >
> >Tested on ThinkBook 14 G7+ ASP.
> >
> >Changes in v7:
> >- Fix missing #include (thanks Ilpo J=C3=A4rvinen)
> >- Fix formatting issues (ditto)
> >- dev_dbg() instead of dev_info() on probe success (ditto)
> >- Rearrange to drop some gotos (ditto)
> >- Move the declarations of __free()-managed variables to where they are
> >  assigned (ditto)
> >- Improve the readability of struct definition and error paths (ditto)
> >- Prevent back-and-forth changes (ditto)
> >- Fix mistakenly inverted boundary check
> >- Emit unaligned access to Fan Test Data's WMI block
> >- Properly calculate array index when we truncate Fan Test Data
> >- Fix typo
> >- Link to v6: https://lore.kernel.org/r/20251122184522.18677-1-i@rong.mo=
e/
> >
> >Changes in v6:
> >- Fix mistaken error paths
> >- Link to v5: https://lore.kernel.org/r/20251114175927.52533-1-i@rong.mo=
e/
> >
> >Changes in v5:
> >- Do not cast pointer to non-pointer or vice versa (thanks kernel test
> >  robot)
> >- Fix missing include (ditto)
> >- Link to v4: https://lore.kernel.org/r/20251113191152.96076-1-i@rong.mo=
e/
> >
> >Changes in v4:
> >- Get rid of wmi_has_guid() (thanks Armin Wolf's inspiration)
> >  - Add [PATCH v4 6/7], please review & test
> >    - Check 0x04050000.supported and bind capdata_fan to capdata00
> >  - Rework HWMON registration
> >    - Collect fan info from capdata00 and capdata_fan separately
> >    - Use a callback to collect fan info from capdata_fan
> >    - Trigger HWMON registration only if all fan info is collected
> >    - Do not check 0x04050000.supported, implied by the presence of
> >      capdata_fan
> >- Drop Reviewed-by & Tested-by from [PATCH v4 7/7] due to the changes,
> >  please review & test
> >- Link to v3: https://lore.kernel.org/r/20251031155349.24693-1-i@rong.mo=
e/
> >
> >Changes in v3:
> >- Fix grammar (thanks Derek J. Clark)
> >- Link to v2: https://lore.kernel.org/r/20251030193955.107148-1-i@rong.m=
oe/
> >
> >Changes in v2:
> >- Add a workaround for ACPI methods that return a 4B buffer for u32
> >  (thanks Armin Wolf)
> >- Fix function documentation (thanks kernel test bot)
> >- Reword documentation (thanks Derek J. Clark)
> >- Squash min/max reporting patch into the initial HWMON one (ditto)
> >- Query 0x04050000 for interface availability (ditto)
> >  - New parameter "expose_all_fans" to skip this check
> >- Enforce min/max RPM constraint on set (ditto)
> >  - New parameter "relax_fan_constraint" to disable this behavior
> >  - Drop parameter "ignore_fan_cap", superseded by the next one
> >  - New parameter "expose_all_fans" to expose fans w/o such data
> >- Assume auto mode on probe (ditto)
> >- Do not register HWMON device if no fan can be exposed
> >- fanX_target: Return -EBUSY instead of raw target value when fan stops
> >- Link to v1: https://lore.kernel.org/r/20251019210450.88830-1-i@rong.mo=
e/
> >
> >Rong Zhang (7):
> >  platform/x86: lenovo-wmi-helpers: Convert returned buffer into u32
> >  platform/x86: Rename lenovo-wmi-capdata01 to lenovo-wmi-capdata
> >  platform/x86: lenovo-wmi-{capdata,other}: Support multiple Capability
> >    Data
> >  platform/x86: lenovo-wmi-capdata: Add support for Capability Data 00
> >  platform/x86: lenovo-wmi-capdata: Add support for Fan Test Data
> >  platform/x86: lenovo-wmi-capdata: Wire up Fan Test Data
> >  platform/x86: lenovo-wmi-other: Add HWMON for fan reporting/tuning
> >
> > .../wmi/devices/lenovo-wmi-other.rst          |  43 +-
> > drivers/platform/x86/lenovo/Kconfig           |   5 +-
> > drivers/platform/x86/lenovo/Makefile          |   2 +-
> > drivers/platform/x86/lenovo/wmi-capdata.c     | 812 ++++++++++++++++++
> > drivers/platform/x86/lenovo/wmi-capdata.h     |  65 ++
> > drivers/platform/x86/lenovo/wmi-capdata01.c   | 302 -------
> > drivers/platform/x86/lenovo/wmi-capdata01.h   |  25 -
> > drivers/platform/x86/lenovo/wmi-helpers.c     |  21 +-
> > drivers/platform/x86/lenovo/wmi-other.c       | 515 ++++++++++-
> > 9 files changed, 1433 insertions(+), 357 deletions(-)
> > create mode 100644 drivers/platform/x86/lenovo/wmi-capdata.c
> > create mode 100644 drivers/platform/x86/lenovo/wmi-capdata.h
> > delete mode 100644 drivers/platform/x86/lenovo/wmi-capdata01.c
> > delete mode 100644 drivers/platform/x86/lenovo/wmi-capdata01.h
> >
> >
> >base-commit: ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
>=20
> Ilpo,
>=20
> Is there any particular reason this appears to be stalled? I'd like to=20
> start work on some features that rely on the capdata00 interface but I'm=
=20
> waiting on this to be applied as there has been frequent back and forth=
=20
> on exactly how to add the different components.

Hi,

I was thinking Armin might still take a look at it but perhaps his latest=
=20
message was effectively saying "the current approach is fine"?

(And it has been holiday period too.)

--=20
 i.

--8323328-1376723253-1767952254=:1008--
