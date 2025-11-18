Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214F71ACEAF;
	Tue, 18 Nov 2025 12:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763469119; cv=none; b=aZUViQlEsKWRuBf7U/6V9p5wdpA0DRcbKF2I/4VGAHYBTINKFnUiyynYHM3Jw038M4Hk449kmM57siO/VoO65PMEodySFeDYyjWkpmLF1ugc2nZj/Zsnz6kOks7P1fKUYTHx5h3jQ6+/vJlFaKCCykDBJpWBPUQ5SZFr5dDo1YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763469119; c=relaxed/simple;
	bh=tmoqDJ+EvDWNOY8Fh54QGWUNZU2OcX0N+qP+X8ZGepY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=W9sZFmQEHiV2PZzrWmF3JQFsxrrqKLAC+pEqSzbQ2oiZ+qnSYWC69FfDub33XJYCHpXmjN/KdyN2fHGqEq5TjaEmY+4JtBvmsj8qAfueo2mda0VwALSPzTAbb/CiKfGMuEClz8w0p00TEPfSpqKExgelnW6ddaES9I1NQ7BfnHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PD935bjr; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PD935bjr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763469118; x=1795005118;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=tmoqDJ+EvDWNOY8Fh54QGWUNZU2OcX0N+qP+X8ZGepY=;
  b=PD935bjr7yzFsts4mFIxx+7MwONUuW72fI4HAGjRDpD8qyKR3SVME/H6
   gOY9eBRnplap1PO+wnaaLufbb7twa4JYnriM1U+LlowyTojhOPtnfB3Yq
   CBhPGRUFsCtc+JUfI+5MDaLqBFfxkirCEhQ828IC7HlLbpfE8Hq5Pgav0
   vbXnavVa74dDgo6JkO3pN/gsYfrHwMp26ti3jNuDYu/bFfHwY0PeBh3hx
   S+vT2mXOi4zqq6+BkpErdp8ZcbgXbbgfCe85OyF5dy3WxXB368JCd8BP8
   tePkR8oukoJ0/Ss8lH9OwI20B4brQYpULJMe2U+Ml8dPy6rVpk4PSY+WG
   A==;
X-CSE-ConnectionGUID: xbzeFDXqR/6Nid7OUCkACw==
X-CSE-MsgGUID: 3mgywGCZQ52cc7OAI+SN5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65647439"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="65647439"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 04:31:57 -0800
X-CSE-ConnectionGUID: y+ndHadmQHuKj/dDyNzhBw==
X-CSE-MsgGUID: nDNgpQ+PTm6/QMs6acAflQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="190547636"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.74])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 04:31:52 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 18 Nov 2025 14:31:49 +0200 (EET)
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux-hwmon@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
    Derek John Clark <derekjohn.clark@gmail.com>, 
    =?ISO-8859-15?Q?Joaqu=EDn_Ignacio_Aramend=EDa?= <samsagax@gmail.com>, 
    Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
    Armin Wolf <W_Armin@gmx.de>
Subject: Re: [PATCH v5 4/6] platform/x86: ayaneo-ec: Add controller power
 and modules attributes
In-Reply-To: <CAGwozwGq7RiZdpBsYhKxfrTMMfzGPGML2R6q8ayjpVn_W4j=uQ@mail.gmail.com>
Message-ID: <f66159f7-2811-c093-4871-5a7153398e79@linux.intel.com>
References: <20251113212221.456875-1-lkml@antheas.dev> <20251113212221.456875-5-lkml@antheas.dev> <77b944ff-2f84-3326-3901-5942739d3c43@linux.intel.com> <CAGwozwGq7RiZdpBsYhKxfrTMMfzGPGML2R6q8ayjpVn_W4j=uQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1642077977-1763468860=:1205"
Content-ID: <8c5383c7-8f6e-bef0-c8b5-18d975ac21e6@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1642077977-1763468860=:1205
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <06923a3f-21b3-387c-cc86-95777def1809@linux.intel.com>

On Mon, 17 Nov 2025, Antheas Kapenekakis wrote:
> On Mon, 17 Nov 2025 at 11:30, Ilpo J=E4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> >
> > On Thu, 13 Nov 2025, Antheas Kapenekakis wrote:
> >
> > > The Ayaneo 3 features hot-swappable controller modules. The ejection
> > > and management is done through HID. However, after ejecting the modul=
es,
> > > the controller needs to be power cycled via the EC to re-initialize.
> > >
> > > For this, the EC provides a variable that holds whether the left or
> > > right modules are connected, and a power control register to turn
> > > the controller on or off. After ejecting the modules, the controller
> > > should be turned off. Then, after both modules are reinserted,
> > > the controller may be powered on again to re-initialize.
> >
> > If wonder if the ejecting could/should be made to turn it off without n=
eed
> > for an explicit off command?
>=20
> Perhaps in the future, this driver leaves the possibility open for it.
> However, that'd require a secondary HID driver to handle the full
> ejection process, with a shared function hook for this driver.
>=20
> The eject sequence consists of sending a HID config command to start
> the ejection, followed by a secondary config command to turn off the
> ejection bits and then waiting for two ready bits to report that the
> ejection is finished. Then, the controller is turned off. Apart from
> turning off, all of this is done through HID (so HID ready races the
> controller_modules value).
>=20
> The module status of this driver is only used to check when the
> controller should be turned on again and to provide visual feedback
> about which modules are currently connected while unpowered. When
> powered, there is full status reporting over HID, including which
> specific modules are connected[1].
>=20
> The end-to-end sequence is currently in userspace[2]. However, the EC
> ports are shielded from userspace so these two specific accesses must
> happen through a kernel driver.

So can the other features be used without this part? I'd prefer to=20
postpone this power/modules thing and have the ejection done properly.

--
 i.

>=20
> Antheas
>=20
> [1] https://github.com/hhd-dev/hhd/blob/8d842e547441600b8adc806bfb10ded57=
18e4fe3/src/hhd/device/ayaneo/base.py#L90-L117
> [2] https://github.com/hhd-dev/hhd/blob/8d842e547441600b8adc806bfb10ded57=
18e4fe3/src/hhd/device/ayaneo/base.py
>=20
> > > This patch introduces two new sysfs attributes:
> > >  - `controller_modules`: a read-only attribute that indicates whether
> > >    the left and right modules are connected (none, left, right, both)=
=2E
> > >  - `controller_power`: a read-write attribute that allows the user
> > >    to turn the controller on or off (with '1'/'0').
> > >
> > > Therefore, after ejection is complete, userspace can power off the
> > > controller, then wait until both modules have been reinserted
> > > (`controller_modules` will return 'both') to turn on the controller.
> > >
> > > Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> > > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > > ---
> > >  .../ABI/testing/sysfs-platform-ayaneo-ec      |  19 ++++
> > >  MAINTAINERS                                   |   1 +
> > >  drivers/platform/x86/ayaneo-ec.c              | 107 ++++++++++++++++=
++
> > >  3 files changed, 127 insertions(+)
> > >  create mode 100644 Documentation/ABI/testing/sysfs-platform-ayaneo-e=
c
> > >
> > > diff --git a/Documentation/ABI/testing/sysfs-platform-ayaneo-ec b/Doc=
umentation/ABI/testing/sysfs-platform-ayaneo-ec
> > > new file mode 100644
> > > index 000000000000..4cffbf5fc7ca
> > > --- /dev/null
> > > +++ b/Documentation/ABI/testing/sysfs-platform-ayaneo-ec
> > > @@ -0,0 +1,19 @@
> > > +What:                /sys/devices/platform/ayaneo-ec/controller_powe=
r
> > > +Date:                Nov 2025
> > > +KernelVersion:       6.19
> > > +Contact:     "Antheas Kapenekakis" <lkml@antheas.dev>
> > > +Description:
> > > +             Current controller power state. Allows turning on and o=
ff
> > > +             the controller power (e.g. for power savings). Write 1 =
to
> > > +             turn on, 0 to turn off. File is readable and writable.
> > > +
> > > +What:                /sys/devices/platform/ayaneo-ec/controller_modu=
les
> > > +Date:                Nov 2025
> > > +KernelVersion:       6.19
> > > +Contact:     "Antheas Kapenekakis"  <lkml@antheas.dev>
> > > +Description:
> > > +             Shows which controller modules are currently connected =
to
> > > +             the device. Possible values are "left", "right" and "bo=
th".
> > > +             File is read-only. The Windows software for this device
> > > +             will only set controller power to 1 if both module side=
s
> > > +             are connected (i.e. this file returns "both").
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index c5bf7207c45f..f8ab009b6224 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -4196,6 +4196,7 @@ AYANEO PLATFORM EC DRIVER
> > >  M:   Antheas Kapenekakis <lkml@antheas.dev>
> > >  L:   platform-driver-x86@vger.kernel.org
> > >  S:   Maintained
> > > +F:   Documentation/ABI/testing/sysfs-platform-ayaneo
> > >  F:   drivers/platform/x86/ayaneo-ec.c
> > >
> > >  AZ6007 DVB DRIVER
> > > diff --git a/drivers/platform/x86/ayaneo-ec.c b/drivers/platform/x86/=
ayaneo-ec.c
> > > index 697bb053a7d6..a0747e7ee43a 100644
> > > --- a/drivers/platform/x86/ayaneo-ec.c
> > > +++ b/drivers/platform/x86/ayaneo-ec.c
> > > @@ -8,6 +8,7 @@
> > >   */
> > >
> > >  #include <linux/acpi.h>
> > > +#include <linux/bits.h>
> > >  #include <linux/dmi.h>
> > >  #include <linux/err.h>
> > >  #include <linux/hwmon.h>
> > > @@ -16,6 +17,7 @@
> > >  #include <linux/module.h>
> > >  #include <linux/platform_device.h>
> > >  #include <linux/power_supply.h>
> > > +#include <linux/sysfs.h>
> > >  #include <acpi/battery.h>
> > >
> > >  #define AYANEO_PWM_ENABLE_REG         0x4A
> > > @@ -32,9 +34,18 @@
> > >  #define AYANEO_CHARGE_VAL_AUTO               0xaa
> > >  #define AYANEO_CHARGE_VAL_INHIBIT    0x55
> > >
> > > +#define AYANEO_POWER_REG     0x2d
> > > +#define AYANEO_POWER_OFF     0xfe
> > > +#define AYANEO_POWER_ON              0xff
> > > +#define AYANEO_MODULE_REG    0x2f
> > > +#define AYANEO_MODULE_LEFT   BIT(0)
> > > +#define AYANEO_MODULE_RIGHT  BIT(1)
> > > +#define AYANEO_MODULE_MASK   (AYANEO_MODULE_LEFT | AYANEO_MODULE_RIG=
HT)
> > > +
> > >  struct ayaneo_ec_quirk {
> > >       bool has_fan_control;
> > >       bool has_charge_control;
> > > +     bool has_magic_modules;
> > >  };
> > >
> > >  struct ayaneo_ec_platform_data {
> > > @@ -46,6 +57,7 @@ struct ayaneo_ec_platform_data {
> > >  static const struct ayaneo_ec_quirk quirk_ayaneo3 =3D {
> > >       .has_fan_control =3D true,
> > >       .has_charge_control =3D true,
> > > +     .has_magic_modules =3D true,
> > >  };
> > >
> > >  static const struct dmi_system_id dmi_table[] =3D {
> > > @@ -266,6 +278,100 @@ static int ayaneo_remove_battery(struct power_s=
upply *battery,
> > >       return 0;
> > >  }
> > >
> > > +static ssize_t controller_power_store(struct device *dev,
> > > +                                   struct device_attribute *attr,
> > > +                                   const char *buf,
> > > +                                   size_t count)
> > > +{
> > > +     bool value;
> > > +     int ret;
> > > +
> > > +     ret =3D kstrtobool(buf, &value);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     ret =3D ec_write(AYANEO_POWER_REG, value ? AYANEO_POWER_ON : AY=
ANEO_POWER_OFF);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     return count;
> > > +}
> > > +
> > > +static ssize_t controller_power_show(struct device *dev,
> > > +                                  struct device_attribute *attr,
> > > +                                  char *buf)
> > > +{
> > > +     int ret;
> > > +     u8 val;
> > > +
> > > +     ret =3D ec_read(AYANEO_POWER_REG, &val);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     return sysfs_emit(buf, "%d\n", val =3D=3D AYANEO_POWER_ON);
> > > +}
> > > +
> > > +static DEVICE_ATTR_RW(controller_power);
> > > +
> > > +static ssize_t controller_modules_show(struct device *dev,
> > > +                                    struct device_attribute *attr, c=
har *buf)
> > > +{
> > > +     char *out;
> > > +     int ret;
> > > +     u8 val;
> > > +
> > > +     ret =3D ec_read(AYANEO_MODULE_REG, &val);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     switch (~val & AYANEO_MODULE_MASK) {
> >
> > Thanks for adding the mask.
> >
> > Now when reading this again, I also suggest changing variable name from
> > "val" to e.g. "unconnected_modules" as that would make the reason for
> > inversion more obvious.
> >
> > > +     case AYANEO_MODULE_LEFT | AYANEO_MODULE_RIGHT:
> > > +             out =3D "both";
> > > +             break;
> > > +     case AYANEO_MODULE_LEFT:
> > > +             out =3D "left";
> > > +             break;
> > > +     case AYANEO_MODULE_RIGHT:
> > > +             out =3D "right";
> > > +             break;
> > > +     default:
> > > +             out =3D "none";
> > > +             break;
> > > +     }
> > > +
> > > +     return sysfs_emit(buf, "%s\n", out);
> > > +}
> > > +
> > > +static DEVICE_ATTR_RO(controller_modules);
> > > +
> > > +static struct attribute *aya_mm_attrs[] =3D {
> > > +     &dev_attr_controller_power.attr,
> > > +     &dev_attr_controller_modules.attr,
> > > +     NULL
> > > +};
> > > +
> > > +static umode_t aya_mm_is_visible(struct kobject *kobj,
> > > +                              struct attribute *attr, int n)
> > > +{
> > > +     struct device *dev =3D kobj_to_dev(kobj);
> > > +     struct platform_device *pdev =3D to_platform_device(dev);
> > > +     struct ayaneo_ec_platform_data *data =3D platform_get_drvdata(p=
dev);
> > > +
> > > +     if (data->quirks->has_magic_modules)
> > > +             return attr->mode;
> > > +     return 0;
> > > +}
> > > +
> > > +static const struct attribute_group aya_mm_attribute_group =3D {
> > > +     .is_visible =3D aya_mm_is_visible,
> > > +     .attrs =3D aya_mm_attrs,
> > > +};
> > > +
> > > +static const struct attribute_group *ayaneo_ec_groups[] =3D {
> > > +     &aya_mm_attribute_group,
> > > +     NULL
> > > +};
> > > +
> > >  static int ayaneo_ec_probe(struct platform_device *pdev)
> > >  {
> > >       const struct dmi_system_id *dmi_entry;
> > > @@ -307,6 +413,7 @@ static int ayaneo_ec_probe(struct platform_device=
 *pdev)
> > >  static struct platform_driver ayaneo_platform_driver =3D {
> > >       .driver =3D {
> > >               .name =3D "ayaneo-ec",
> > > +             .dev_groups =3D ayaneo_ec_groups,
> > >       },
> > >       .probe =3D ayaneo_ec_probe,
> > >  };
> > >
> >
> > --
> >  i.
> >
> >
>=20
--8323328-1642077977-1763468860=:1205--
