Received: from sender3-op-o15.zoho.com (sender3-op-o15.zoho.com [136.143.184.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D242741DF;
	Wed, 26 Nov 2025 13:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764165604; cv=pass; b=GHbEeZaELy6Opplm0KlD4YjLj3f/SXyQ8izo8/ueBSNJh/D9opad9bgbgJMic8Oe0MNJAh6njspnALLV8PTmuMW4KxApBAnT8MibWQ/iY0l6WI5jgmxF2dPcBOMMZy1FKdnMEfmVqxyWb9IstBXgORaDJ1TGpc9vjsITHsi2DPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764165604; c=relaxed/simple;
	bh=Y/1j8cOJkRDBCIKzyKU1ZJCBVTByH/eOLNb7ZFI+x3c=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=s6V26fCmgoxNrj4xY+JnP99Dgl98/WzNB01T1b+wWZvkWpr8hWRg9eQm4JL7YzAYkUBslHd+BeL2H+yvALi/Iw3KeFW2XYOQ7XuM1tLmy8K7GFtcDt+9Lb8x4FnamRleAuhgeXTZJtHOr9UeAEywOGPgHi2r4T5ghRBfENh6iSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b=ZWFqHdhR; arc=pass smtp.client-ip=136.143.184.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b="ZWFqHdhR"
ARC-Seal: i=1; a=rsa-sha256; t=1764165575; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Fzazok2Bvc3nG6ZZE5p/FnJUgp3OG84rkXFtHwZ4HKKzO2A3i4RoVwws+DGFqhaKRTlENe2QkfMAJskjrBS7BJ6Aq/2XchJ+6XFu+NbjBknlvzaV0T4ygcCBfcGAfEo14sBFzqsOXznezKbBcCkkYnoOMolqdHCeU9k1PJ9EhH0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764165575; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/s5pnvQ0weJgqId2JmKNlPpF3RNF9eZlVfvJTE1FmWQ=; 
	b=iGStLGNdQMvCY5K6khYxcVH0znd7OskTt0/jOCWC8dN3jfqpZ75ZAP03zyfU7WPViKHtE9/mUU5CeXiPV5Tc8LBSkY9+vaqsCN6B0FYxRBHauxJkJEWcMWbg2Y58FLVpPi4TPY34x4cCQ1QvwrZZQ+rcL4XwQAD/IpckPsPx5UY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764165575;
	s=zmail; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=/s5pnvQ0weJgqId2JmKNlPpF3RNF9eZlVfvJTE1FmWQ=;
	b=ZWFqHdhR/2xeyJ+KufZv5v0fmPDIQUStz8VzDNoEoGH9Cz5ViW3o8vtFgnq+5vIn
	trDrPrT8hF1wPLnjqQ/aqa9qW72ZkJwY/Yvjg7/3X1VbYnqLuGc3HVphZj3bVN1fn6u
	evvrJWOjWbvf+KuO9Dd3RbHfqatDmtZ7o4wzJRC0=
Received: by mx.zohomail.com with SMTPS id 1764165572918469.0477301743206;
	Wed, 26 Nov 2025 05:59:32 -0800 (PST)
Message-ID: <2f58cca71f7ac3f3f13c6be6055f6357338785a2.camel@rong.moe>
Subject: Re: [PATCH v7 0/7] platform/x86: lenovo-wmi-{capdata,other}: Add
 HWMON for fan speed
From: Rong Zhang <i@rong.moe>
To: Derek John Clark <derekjohn.clark@gmail.com>
Cc: Rong Zhang <i@rong.moe>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?=	 <ilpo.jarvinen@linux.intel.com>, Guenter Roeck
 <linux@roeck-us.net>, 	platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-hwmon@vger.kernel.org
In-Reply-To: <CAFqHKTkti-cA-9na0wx8bAyn-_ez2+mD_Mh8DGUa46ktkSjZsg@mail.gmail.com>
References: <20251125194959.157524-1-i@rong.moe>
	 <CAFqHKTkti-cA-9na0wx8bAyn-_ez2+mD_Mh8DGUa46ktkSjZsg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Nov 2025 21:54:22 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-7 
X-ZohoMailClient: External

Hi Derek,

On Tue, 2025-11-25 at 13:43 -0800, Derek John Clark wrote:
> On Tue, Nov 25, 2025 at 11:50=E2=80=AFAM Rong Zhang <i@rong.moe> wrote:
> >=20
> > Lenovo WMI Other Mode interface also supports querying or setting fan
> > speed RPM. This capability is described by LENOVO_CAPABILITY_DATA_00.
> > Besides, LENOVO_FAN_TEST_DATA provides reference data for self-test of
> > cooling fans, including minimum and maximum fan speed RPM.
> >=20
> > This patchset turns lenovo-wmi-capdata01 into a unified driver (now
> > named lenovo-wmi-capdata) for LENOVO_CAPABILITY_DATA_{00,01} and
> > LENOVO_FAN_TEST_DATA; then adds HWMON support for lenovo-wmi-other:
> >=20
> >  - fanX_enable: enable/disable the fan (tunable)
> >  - fanX_input: current RPM
> >  - fanX_max: maximum RPM
> >  - fanX_min: minimum RPM
> >  - fanX_target: target RPM (tunable)
> >=20
> > LENOVO_CAPABILITY_DATA_{00,01} presents on all devices, so
> > both binds to lenovo-wmi-other. However, some device does not have
> > LENOVO_FAN_TEST_DATA and its presence is described by
> > LENOVO_CAPABILITY_DATA_00; hence, the former binds to the latter and a
> > callback is used to pass the data to lenovo-wmi-other.
> >=20
> > Summarizing this scheme:
> >=20
> >         lenovo-wmi-other <-> capdata00 <-> capdata_fan
> >         |- master            |- component
> >                              |- sub-master
> >                                            |- sub-component
> >=20
> > The callback will be called once both the master and the sub-component
> > are bound to the sub-master (component).
> >=20
> > This scheme is essential to solve these issues:
> > - The component framework only supports one aggregation per master
> > - A binding is only established until all components are found
> > - The Fan Test Data interface may be missing on some devices
> > - To get rid of queries for the presence of WMI GUIDs
> > - The notifier framework cannot cleanly connect capdata_fan to
> >   lenovo-wmi-other without introducing assumptions on probing sequence
> >=20
> > capdata00 is registered as a component and a sub-master on probe,
> > instead of chaining the registrations in one's bind callback. This is
> > because calling (un)registration methods of the component framework
> > causes deadlock in (un)bind callbacks, i.e., it's impossible to registe=
r
> > capdata00 as a sub-master/component in its component/sub-master bind
> > callback, and vice versa.
> >=20
> > The implementation does not rely on a specific binding sequence. This
> > has been fuzz-tested using:
> >=20
> >         #!/bin/bash
> >=20
> >         DRV_DIR=3D/sys/bus/wmi/drivers/lenovo_wmi_cd
> >         CAPDATA_GUIDS=3D(
> >                 $(find "$DRV_DIR"/ -name '*-*-*-*-*-*' -printf "%f ")
> >         )
> >=20
> >         b() { sudo tee "$DRV_DIR"/bind <<<"$1"; }
> >         u() { sudo tee "$DRV_DIR"/unbind <<<"$1"; }
> >=20
> >         for guid in "${CAPDATA_GUIDS[@]}"; do
> >                 u "$guid"
> >         done
> >=20
> >         while read -rsa perm; do
> >                 for guid in "${perm[@]}"; do
> >                         b "$guid"
> >                 done
> >                 sensors | grep -A3 lenovo_wmi_other || true
> >                 for guid in "${perm[@]}"; do
> >                         u "$guid"
> >                 done
> >         done < <(python3 -c "
> >         from itertools import permutations
> >         ps =3D permutations('${CAPDATA_GUIDS[*]}'.split())
> >         for p in ps: print(' '.join(p))")
> >=20
> >         for guid in "${CAPDATA_GUIDS[@]}"; do
> >                 b "$guid"
> >         done
> >=20
> > Tested on ThinkBook 14 G7+ ASP.
> >=20
> > Changes in v7:
> > - Fix missing #include (thanks Ilpo J=C3=A4rvinen)
> > - Fix formatting issues (ditto)
> > - dev_dbg() instead of dev_info() on probe success (ditto)
> > - Rearrange to drop some gotos (ditto)
> > - Move the declarations of __free()-managed variables to where they are
> >   assigned (ditto)
> > - Improve the readability of struct definition and error paths (ditto)
> > - Prevent back-and-forth changes (ditto)
> > - Fix mistakenly inverted boundary check
> > - Emit unaligned access to Fan Test Data's WMI block
> > - Properly calculate array index when we truncate Fan Test Data
> > - Fix typo
> > - Link to v6: https://lore.kernel.org/r/20251122184522.18677-1-i@rong.m=
oe/
> >=20
> > Changes in v6:
> > - Fix mistaken error paths
> > - Link to v5: https://lore.kernel.org/r/20251114175927.52533-1-i@rong.m=
oe/
> >=20
> > Changes in v5:
> > - Do not cast pointer to non-pointer or vice versa (thanks kernel test
> >   robot)
> > - Fix missing include (ditto)
> > - Link to v4: https://lore.kernel.org/r/20251113191152.96076-1-i@rong.m=
oe/
> >=20
> > Changes in v4:
> > - Get rid of wmi_has_guid() (thanks Armin Wolf's inspiration)
> >   - Add [PATCH v4 6/7], please review & test
> >     - Check 0x04050000.supported and bind capdata_fan to capdata00
> >   - Rework HWMON registration
> >     - Collect fan info from capdata00 and capdata_fan separately
> >     - Use a callback to collect fan info from capdata_fan
> >     - Trigger HWMON registration only if all fan info is collected
> >     - Do not check 0x04050000.supported, implied by the presence of
> >       capdata_fan
> > - Drop Reviewed-by & Tested-by from [PATCH v4 7/7] due to the changes,
> >   please review & test
> > - Link to v3: https://lore.kernel.org/r/20251031155349.24693-1-i@rong.m=
oe/
> >=20
> > Changes in v3:
> > - Fix grammar (thanks Derek J. Clark)
> > - Link to v2: https://lore.kernel.org/r/20251030193955.107148-1-i@rong.=
moe/
> >=20
> > Changes in v2:
> > - Add a workaround for ACPI methods that return a 4B buffer for u32
> >   (thanks Armin Wolf)
> > - Fix function documentation (thanks kernel test bot)
> > - Reword documentation (thanks Derek J. Clark)
> > - Squash min/max reporting patch into the initial HWMON one (ditto)
> > - Query 0x04050000 for interface availability (ditto)
> >   - New parameter "expose_all_fans" to skip this check
> > - Enforce min/max RPM constraint on set (ditto)
> >   - New parameter "relax_fan_constraint" to disable this behavior
> >   - Drop parameter "ignore_fan_cap", superseded by the next one
> >   - New parameter "expose_all_fans" to expose fans w/o such data
> > - Assume auto mode on probe (ditto)
> > - Do not register HWMON device if no fan can be exposed
> > - fanX_target: Return -EBUSY instead of raw target value when fan stops
> > - Link to v1: https://lore.kernel.org/r/20251019210450.88830-1-i@rong.m=
oe/
> >=20
> > Rong Zhang (7):
> >   platform/x86: lenovo-wmi-helpers: Convert returned buffer into u32
> >   platform/x86: Rename lenovo-wmi-capdata01 to lenovo-wmi-capdata
> >   platform/x86: lenovo-wmi-{capdata,other}: Support multiple Capability
> >     Data
> >   platform/x86: lenovo-wmi-capdata: Add support for Capability Data 00
> >   platform/x86: lenovo-wmi-capdata: Add support for Fan Test Data
> >   platform/x86: lenovo-wmi-capdata: Wire up Fan Test Data
> >   platform/x86: lenovo-wmi-other: Add HWMON for fan reporting/tuning
> >=20
> >  .../wmi/devices/lenovo-wmi-other.rst          |  43 +-
> >  drivers/platform/x86/lenovo/Kconfig           |   5 +-
> >  drivers/platform/x86/lenovo/Makefile          |   2 +-
> >  drivers/platform/x86/lenovo/wmi-capdata.c     | 812 ++++++++++++++++++
> >  drivers/platform/x86/lenovo/wmi-capdata.h     |  65 ++
> >  drivers/platform/x86/lenovo/wmi-capdata01.c   | 302 -------
> >  drivers/platform/x86/lenovo/wmi-capdata01.h   |  25 -
> >  drivers/platform/x86/lenovo/wmi-helpers.c     |  21 +-
> >  drivers/platform/x86/lenovo/wmi-other.c       | 515 ++++++++++-
> >  9 files changed, 1433 insertions(+), 357 deletions(-)
> >  create mode 100644 drivers/platform/x86/lenovo/wmi-capdata.c
> >  create mode 100644 drivers/platform/x86/lenovo/wmi-capdata.h
> >  delete mode 100644 drivers/platform/x86/lenovo/wmi-capdata01.c
> >  delete mode 100644 drivers/platform/x86/lenovo/wmi-capdata01.h
> >=20
> >=20
> > base-commit: ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
> > --
> > 2.51.0
> >=20
>=20
> Rong,
>=20
> Everything seems to be working as expected on unsupported devices.
>=20
> [    4.398189] lenovo_wmi_other
> DC2A8805-3A8C-41BA-A6F7-092E0089CD3B-3: bound
> 362A3AFE-3D96-4665-8530-96DAD5BB300E-13 (ops lwmi_cd_component_ops
> [lenovo_wmi_capdata])
> [    4.398203] lenovo_wmi_other
> DC2A8805-3A8C-41BA-A6F7-092E0089CD3B-3: bound
> 7A8F5407-CB67-4D6E-B547-39B3BE018154-9 (ops lwmi_cd_component_ops
> [lenovo_wmi_capdata])
> [    4.398208] lenovo_wmi_other
> DC2A8805-3A8C-41BA-A6F7-092E0089CD3B-3: fan reporting/tuning is
> unsupported on this device
>=20
> Obviously I can only test so far, but for where it makes sense on the
> series (through to 6/7) where it is missing you can add my tag
> Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>
>=20
> And for the entire series where it is missing:
> Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com

Thanks for your review and testing.

> As an aside, I'll likely need you to test a future patch series I'm
> working on for regressions after this is accepted as I will touch the
> hwmon interface a lot when adding fan curve auto points from the
> cd01/om interfaces.

Sure. Feel free to get in touch with me onlist or offlist when needed
;-)

> Thanks,
> - Derek

Thanks,
Rong
