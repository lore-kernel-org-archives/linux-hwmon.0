Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743321AAE28;
	Wed, 26 Nov 2025 08:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764144289; cv=none; b=Ah0zO2TavwYxQ4p+nBV3SC40nAxDel4biMn/ekbQYpBNxrWPnzMzKfCo2VjbZ8GpqjTZlsD9EPp7jZXhtqzyTXRpUqUvYXL4XxOCYeN8JYcFIB+DpXfcnuzhjkQFN9S91nIgKDfonywZrPtOzRZw21ZgBwRZLu/lLF7E8BfvejU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764144289; c=relaxed/simple;
	bh=JKXMkKMrFpEJvJR3mhKCbPVh0/3oKT9KOJzP0/Kl0Yg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=liUj6JBDyNwAOqDRbsuS/FHaeetfKH1+ImMM+lI89NQ9N/VOugWG/abE8FcmrWkQYhFmw7QfYzCbKRZMlPqKHMVgwywMHoLx7CuW9mxTc/8xS4hYQuYP+K+vXeNN4R3fGb9PU4X+3GBzULv3P0FlHwyMUs94vlgMs6bXS2xCLks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dz+Z9O5x; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dz+Z9O5x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764144288; x=1795680288;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=JKXMkKMrFpEJvJR3mhKCbPVh0/3oKT9KOJzP0/Kl0Yg=;
  b=dz+Z9O5x3scX8umXMW0MgKyogTVpfxeT1GQqqDCnI4cIc+cs8NRrh6pd
   KATivyPv+Hj3njllO+hJaHix4uaKAVGvLw0lfNi269IM2S6BNV8I0Z072
   hqaVRQK4PPJfYH80IV44ZnFY+joYMwCLCLH5v6L0W1YgNp4SXN+fTtLl/
   eV53tdf4WvwI77fNvJzljsDCiB/bZTumulcmL3qJHRkcmAy8OIoUUZaz+
   U100MoHliNZydltYYQzrAkhuEghHPRWRBmzJHAwrnpt3YeVradBqPAgt1
   QLAE7uc0nIzXMkpOFKHm98sMPdRpIDdwX/2NBQXIrQFuHP//+tc9QjH+O
   g==;
X-CSE-ConnectionGUID: FYuKQV4SQaiBrE/w/Iv7rA==
X-CSE-MsgGUID: VnnNId2/S8eMwABm2q+s1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="83783949"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="83783949"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 00:04:47 -0800
X-CSE-ConnectionGUID: GSgFWEtGSg2OYrFWDt3FIw==
X-CSE-MsgGUID: 0sBbcERbQ7WcDktsA5bveA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="193684323"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.97])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 00:04:43 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 26 Nov 2025 10:04:39 +0200 (EET)
To: Rong Zhang <i@rong.moe>
cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Derek J. Clark" <derekjohn.clark@gmail.com>, Armin Wolf <W_Armin@gmx.de>, 
    Hans de Goede <hansg@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v6 7/7] platform/x86: lenovo-wmi-other: Add HWMON for
 fan reporting/tuning
In-Reply-To: <121879331cae44a998ee1b18d661e3d65092e259.camel@rong.moe>
Message-ID: <6f732364-9839-7845-b408-fad6fd2464d8@linux.intel.com>
References: <20251122184522.18677-1-i@rong.moe>  <20251122184522.18677-8-i@rong.moe>  <2f77c928-b16e-1666-5e65-8f62a84c93fc@linux.intel.com> <121879331cae44a998ee1b18d661e3d65092e259.camel@rong.moe>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1962062935-1764144279=:968"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1962062935-1764144279=:968
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 25 Nov 2025, Rong Zhang wrote:

> Hi Ilpo,
>=20
> Thanks for your review.
>=20
> On Mon, 2025-11-24 at 18:58 +0200, Ilpo J=C3=A4rvinen wrote:
> > On Sun, 23 Nov 2025, Rong Zhang wrote:
> >=20
> > > Register an HWMON device for fan reporting/tuning according to
> > > Capability Data 00 (capdata00) and Fan Test Data (capdata_fan) provid=
ed
> > > by lenovo-wmi-capdata. The corresponding HWMON nodes are:
> > >=20
> > >  - fanX_enable: enable/disable the fan (tunable)
> > >  - fanX_input: current RPM
> > >  - fanX_max: maximum RPM
> > >  - fanX_min: minimum RPM
> > >  - fanX_target: target RPM (tunable)
> > >=20
> > > Information from capdata00 and capdata_fan are used to control the
> > > visibility and constraints of HWMON attributes. Fan info from capdata=
00
> > > is collected on bind, while fan info from capdata_fan is collected in=
 a
> > > callback. Once all fan info is collected, register the HWMON device.
> > >=20
> > > Signed-off-by: Rong Zhang <i@rong.moe>
> > > ---
> > > Changes in v4:
> > > - Rework HWMON registration due to the introduction of [PATCH v4 6/7]
> > >   - Collect fan info from capdata00 and capdata_fan separately
> > >   - Use a callback to collect fan info from capdata_fan
> > >   - Trigger HWMON registration only if all fan info is collected
> > >   - Do not check 0x04050000.supported, implied by the presense of
> > >     capdata_fan
> > > - Drop Reviewed-by & Tested-by due to the changes, please review & te=
st
> > >=20
> > > Changes in v3:
> > > - Reword documentation (thanks Derek J. Clark)
> > >=20
> > > Changes in v2:
> > > - Define 4 fan channels instead of 2 (thanks Derek J. Clark)
> > > - Squash min/max reporting patch into this one (ditto)
> > > - Query 0x04050000 for interface availability (ditto)
> > >   - New parameter "expose_all_fans" to skip this check
> > > - Enforce min/max RPM constraint on set (ditto)
> > >   - New parameter "relax_fan_constraint" to disable this behavior
> > >   - Drop parameter "ignore_fan_cap", superseded by the next one
> > >   - New parameter "expose_all_fans" to expose fans w/o such data
> > > - Assume auto mode on probe (ditto)
> > > - Reword documentation (ditto)
> > > - Do not register HWMON device if no fan can be exposed
> > > - fanX_target: Return -EBUSY instead of raw target value when fan sto=
ps
> > > ---
> > >  .../wmi/devices/lenovo-wmi-other.rst          |  11 +
> > >  drivers/platform/x86/lenovo/Kconfig           |   1 +
> > >  drivers/platform/x86/lenovo/wmi-other.c       | 485 ++++++++++++++++=
+-
> > >  3 files changed, 487 insertions(+), 10 deletions(-)
> > >=20
> > > diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documen=
tation/wmi/devices/lenovo-wmi-other.rst
> > > index 821282e07d93..bd1d733ff286 100644
> > > --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> > > +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> > > @@ -31,6 +31,8 @@ under the following path:
> > > =20
> > >    /sys/class/firmware-attributes/lenovo-wmi-other/attributes/<attrib=
ute>/
> > > =20
> > > +Additionally, this driver also exports attributes to HWMON.
> > > +
> > >  LENOVO_CAPABILITY_DATA_00
> > >  -------------------------
> > > =20
> > > @@ -39,6 +41,11 @@ WMI GUID ``362A3AFE-3D96-4665-8530-96DAD5BB300E``
> > >  The LENOVO_CAPABILITY_DATA_00 interface provides various information=
 that
> > >  does not rely on the gamezone thermal mode.
> > > =20
> > > +The following HWMON attributes are implemented:
> > > + - fanX_enable: enable/disable the fan (tunable)
> > > + - fanX_input: current RPM
> > > + - fanX_target: target RPM (tunable)
> > > +
> > >  LENOVO_CAPABILITY_DATA_01
> > >  -------------------------
> > > =20
> > > @@ -70,6 +77,10 @@ WMI GUID ``B642801B-3D21-45DE-90AE-6E86F164FB21``
> > >  The LENOVO_FAN_TEST_DATA interface provides reference data for self-=
test of
> > >  cooling fans.
> > > =20
> > > +The following HWMON attributes are implemented:
> > > + - fanX_max: maximum RPM
> > > + - fanX_min: minimum RPM
> > > +
> > >  WMI interface description
> > >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > > =20
> > > diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x=
86/lenovo/Kconfig
> > > index fb96a0f908f0..be9af0451146 100644
> > > --- a/drivers/platform/x86/lenovo/Kconfig
> > > +++ b/drivers/platform/x86/lenovo/Kconfig
> > > @@ -263,6 +263,7 @@ config LENOVO_WMI_GAMEZONE
> > >  config LENOVO_WMI_TUNING
> > >  =09tristate "Lenovo Other Mode WMI Driver"
> > >  =09depends on ACPI_WMI
> > > +=09select HWMON
> > >  =09select FW_ATTR_CLASS
> > >  =09select LENOVO_WMI_DATA
> > >  =09select LENOVO_WMI_EVENTS
> > > diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platfo=
rm/x86/lenovo/wmi-other.c
> > > index b3adcc2804fa..ce1ca13db4b5 100644
> > > --- a/drivers/platform/x86/lenovo/wmi-other.c
> > > +++ b/drivers/platform/x86/lenovo/wmi-other.c
> > > @@ -14,7 +14,16 @@
> > >   * These attributes typically don't fit anywhere else in the sysfs a=
nd are set
> > >   * in Windows using one of Lenovo's multiple user applications.
> > >   *
> > > + * Additionally, this driver also exports tunable fan speed RPM to H=
WMON.
> > > + * Min/max RPM are also provided for reference.
> > > + *
> > >   * Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> > > + *   - fw_attributes
> > > + *   - binding to Capability Data 01
> > > + *
> > > + * Copyright (C) 2025 Rong Zhang <i@rong.moe>
> > > + *   - HWMON
> > > + *   - binding to Capability Data 00 and Fan
> > >   */
> > > =20
> > >  #include <linux/acpi.h>
> > > @@ -25,6 +34,7 @@
> > >  #include <linux/device.h>
> > >  #include <linux/export.h>
> > >  #include <linux/gfp_types.h>
> > > +#include <linux/hwmon.h>
> > >  #include <linux/idr.h>
> > >  #include <linux/kdev_t.h>
> > >  #include <linux/kobject.h>
> > > @@ -49,12 +59,26 @@
> > >  #define LWMI_FEATURE_ID_CPU_SPL 0x02
> > >  #define LWMI_FEATURE_ID_CPU_FPPT 0x03
> > > =20
> > > +#define LWMI_FEATURE_ID_FAN_RPM 0x03
> > > +
> > >  #define LWMI_TYPE_ID_NONE 0x00
> > > =20
> > >  #define LWMI_FEATURE_VALUE_GET 17
> > >  #define LWMI_FEATURE_VALUE_SET 18
> > > =20
> > > +#define LWMI_FAN_ID_BASE 1
> > > +#define LWMI_FAN_NR 4
> > > +#define LWMI_FAN_ID(x) ((x) + LWMI_FAN_ID_BASE)
> > > +
> > > +#define LWMI_ATTR_ID_FAN_RPM(x)=09=09=09=09=09=09\
> > > +=09(FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, LWMI_DEVICE_ID_FAN) |=09\
> > > +=09 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, LWMI_FEATURE_ID_FAN_RPM) |=09=
\
> > > +=09 FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, LWMI_FAN_ID(x)))
> > > +
> > > +#define LWMI_FAN_STOP_RPM 1
> > > +
> > >  #define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
> > > +#define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
> > > =20
> > >  static BLOCKING_NOTIFIER_HEAD(om_chain_head);
> > >  static DEFINE_IDA(lwmi_om_ida);
> > > @@ -71,15 +95,439 @@ struct lwmi_om_priv {
> > >  =09struct component_master_ops *ops;
> > > =20
> > >  =09/* only valid after capdata bind */
> > > +=09struct cd_list *cd00_list;
> > >  =09struct cd_list *cd01_list;
> > > =20
> > > +=09struct device *hwmon_dev;
> > >  =09struct device *fw_attr_dev;
> > >  =09struct kset *fw_attr_kset;
> > >  =09struct notifier_block nb;
> > >  =09struct wmi_device *wdev;
> > >  =09int ida_id;
> > > +
> > > +=09struct fan_info {
> > > +=09=09u32 supported;
> > > +=09=09u32 last_target;
> > > +=09=09long min_rpm;
> > > +=09=09long max_rpm;
> > > +=09} fan_info[LWMI_FAN_NR];
> >=20
> > I personally don't like this style at all because it makes finding the=
=20
> > type of the variable harder with grep.
>=20
> Make sense. Will add a `lwmi_' prefix to the struct name. Thanks.

While having prefix is good too, I was more referring to naming it at the=
=20
closing brace line, I'd prefer to have it on a separate line (which shows=
=20
type, staticness easily with grep):

struct lwmi_fan_info fan_info[LWMI_FAN_NR];

I see you placed it into priv in v7 which is better anyway.

--=20
 i.

--8323328-1962062935-1764144279=:968--
