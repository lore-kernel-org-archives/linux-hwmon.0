Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577051FC0ED
	for <linux-hwmon@vger.kernel.org>; Wed, 12 Nov 2025 12:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762951090; cv=none; b=l4bR7JM6aLF7/odVTW566OhKBGrFTsrfL5oNg+9J2Pm04L1cnfJm9S4gnc+1rLp0BP/06SFOz2KaVmxLekDGlFiDpL0wTaAmJsX+/2xnIFOkA0KDxyvprfcmwE4c3kbVgwmZqxsycduQic4FUa2Yku6fSN7JAbM+ztPnCOgOAKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762951090; c=relaxed/simple;
	bh=itEIKdeU42gKYqxxaVxiLHU13b01iLG2EhsdvJ0UGeU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b6Hlg9VEOpA5cd5SsjlWJkPgAxaSJqHF1KN4Kbvq5lkcaIHr7zMOwWVoras/DTtevLo1n+B3/vFZCVTG3PhQ2D+KegNxcp+QQfNLuLXDyPE76l9SHHaGxZCbFfpcLxNmABA9HihnLlNLVnvQRbz6UeTjza5JNm98ElwUukCRyIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=iLy+bfpn; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="iLy+bfpn"
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id 0EE96C2A2E
	for <linux-hwmon@vger.kernel.org>; Wed, 12 Nov 2025 14:38:00 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id 14C60C2A3F
	for <linux-hwmon@vger.kernel.org>; Wed, 12 Nov 2025 14:37:59 +0200 (EET)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 684D6201C8E
	for <linux-hwmon@vger.kernel.org>; Wed, 12 Nov 2025 14:37:58 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1762951078;
	bh=0PKIbB1EeJHGle4VydmxK0P6DxJHE1X6O2UwFICkY9A=;
	h=Received:From:Subject:To;
	b=iLy+bfpnEZwENdHp8dLIdva0EtqwoxXc/Mv6gAkbEMNCsPuNUmzkJqfSiwQRdOXT/
	 Kz1UyRevXYcvxODXaNin+eyEmUE0nvObXEMD0JRKV/eQ4fNEnN9kMe99u5jcKCAJWo
	 wnoOnmc3cewwl1hZclx0cToLrmn/IBRwWuH3DYbM71Ynh6js65cg5kQgncIBYRn5TL
	 tuMP8x8HBVwrpzblMoNhMNYKrEGG0+DeFe28aeYNSDUU0YHnyjxGaVRkOMywJYgpNx
	 LSkmJOxjObuHAPSVD3iesEJAQ1Q4lITJWyCayWETFFraV9oTcnkDQJhFordEA+A3GA
	 njMRjH0q5Cbag==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.171) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f171.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-37a56a475e8so7455891fa.3
        for <linux-hwmon@vger.kernel.org>;
 Wed, 12 Nov 2025 04:37:58 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUyD5OdsWiU2113F4IsbWrJQAQlwUjD4aLIm/0+p541RJirjwcmt/hP9Lzv4qtmHCyV8T1e9+Cie2w/cQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWMsuHQvKtP7iZn1BDEVi9gqWK8ny3xO4nAaC+OGFiIGsbmsrW
	06cN6n1SXeMN1LYOhzRlVEOsH6C9Pip9Pi5OvxHydEKIwwHy9SOvUUslzoUws8z9nyCJKjbPNqJ
	5coI0seyiZPzl3cDZnmduv+XvYAu91s0=
X-Google-Smtp-Source: 
 AGHT+IFEJXIsKU4Yy10J85bfQ/0ArFHhiWY79Y70K4SjJu/opmDz2w+8my2BGJ9LLnF8HxglnJimYLtq3i4jwLGLA2c=
X-Received: by 2002:a2e:81d6:0:b0:37b:991a:543d with SMTP id
 38308e7fff4ca-37b991a55d5mr917351fa.47.1762951077627; Wed, 12 Nov 2025
 04:37:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110180846.1490726-1-lkml@antheas.dev>
 <20251110180846.1490726-5-lkml@antheas.dev>
 <888ff0d3-c613-b5a7-3b84-37ff3036e0a4@linux.intel.com>
 <CAGwozwE7rSw43tKoStmcmwR3mup5bS0Btk0R3hr0XTwSus4A-w@mail.gmail.com>
 <be9c6811-9960-b8ec-eddc-5b2d645d1c2b@linux.intel.com>
In-Reply-To: <be9c6811-9960-b8ec-eddc-5b2d645d1c2b@linux.intel.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 12 Nov 2025 13:37:46 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwGF5x3wWkcz7sDpS=i+n0VPQpcuBr0r4ycH8b0YTLOJ5w@mail.gmail.com>
X-Gm-Features: AWmQ_bn42zz--1jteqMpqX6Sczvmh943YW6cflD_KHEACSU95F2PtFdnPD270SQ
Message-ID: 
 <CAGwozwGF5x3wWkcz7sDpS=i+n0VPQpcuBr0r4ycH8b0YTLOJ5w@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] platform/x86: ayaneo-ec: Add controller power and
 modules attributes
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	linux-hwmon@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
	Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Armin Wolf <W_Armin@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176295107871.1589543.10540867449715259828@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Wed, 12 Nov 2025 at 13:34, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Tue, 11 Nov 2025, Antheas Kapenekakis wrote:
>
> > On Tue, 11 Nov 2025 at 14:41, Ilpo J=C3=A4rvinen
> > <ilpo.jarvinen@linux.intel.com> wrote:
> > >
> > > On Mon, 10 Nov 2025, Antheas Kapenekakis wrote:
> > >
> > > > The Ayaneo 3 features hot-swappable controller modules. The ejectio=
n
> > > > and management is done through HID. However, after ejecting the mod=
ules,
> > > > the controller needs to be power cycled via the EC to re-initialize=
.
> > > >
> > > > For this, the EC provides a variable that holds whether the left or
> > > > right modules are connected, and a power control register to turn
> > > > the controller on or off. After ejecting the modules, the controlle=
r
> > > > should be turned off. Then, after both modules are reinserted,
> > > > the controller may be powered on again to re-initialize.
> > > >
> > > > This patch introduces two new sysfs attributes:
> > > >  - `controller_modules`: a read-only attribute that indicates wheth=
er
> > > >    the left and right modules are connected (none, left, right, bot=
h).
> > > >  - `controller_power`: a read-write attribute that allows the user
> > > >    to turn the controller on or off (with '1'/'0').
> > > >
> > > > Therefore, after ejection is complete, userspace can power off the
> > > > controller, then wait until both modules have been reinserted
> > > > (`controller_modules` will return 'both') to turn on the controller=
.
> > > >
> > > > Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> > > > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > > > ---
> > > >  .../ABI/testing/sysfs-platform-ayaneo-ec      |  19 ++++
> > > >  MAINTAINERS                                   |   1 +
> > > >  drivers/platform/x86/ayaneo-ec.c              | 106 ++++++++++++++=
++++
> > > >  3 files changed, 126 insertions(+)
> > > >  create mode 100644 Documentation/ABI/testing/sysfs-platform-ayaneo=
-ec
> > > >
> > > > diff --git a/Documentation/ABI/testing/sysfs-platform-ayaneo-ec b/D=
ocumentation/ABI/testing/sysfs-platform-ayaneo-ec
> > > > new file mode 100644
> > > > index 000000000000..4cffbf5fc7ca
> > > > --- /dev/null
> > > > +++ b/Documentation/ABI/testing/sysfs-platform-ayaneo-ec
> > > > @@ -0,0 +1,19 @@
> > > > +What:                /sys/devices/platform/ayaneo-ec/controller_po=
wer
> > > > +Date:                Nov 2025
> > > > +KernelVersion:       6.19
> > > > +Contact:     "Antheas Kapenekakis" <lkml@antheas.dev>
> > > > +Description:
> > > > +             Current controller power state. Allows turning on and=
 off
> > > > +             the controller power (e.g. for power savings). Write =
1 to
> > > > +             turn on, 0 to turn off. File is readable and writable=
.
> > > > +
> > > > +What:                /sys/devices/platform/ayaneo-ec/controller_mo=
dules
> > > > +Date:                Nov 2025
> > > > +KernelVersion:       6.19
> > > > +Contact:     "Antheas Kapenekakis"  <lkml@antheas.dev>
> > > > +Description:
> > > > +             Shows which controller modules are currently connecte=
d to
> > > > +             the device. Possible values are "left", "right" and "=
both".
> > > > +             File is read-only. The Windows software for this devi=
ce
> > > > +             will only set controller power to 1 if both module si=
des
> > > > +             are connected (i.e. this file returns "both").
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index c5bf7207c45f..f8ab009b6224 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -4196,6 +4196,7 @@ AYANEO PLATFORM EC DRIVER
> > > >  M:   Antheas Kapenekakis <lkml@antheas.dev>
> > > >  L:   platform-driver-x86@vger.kernel.org
> > > >  S:   Maintained
> > > > +F:   Documentation/ABI/testing/sysfs-platform-ayaneo
> > > >  F:   drivers/platform/x86/ayaneo-ec.c
> > > >
> > > >  AZ6007 DVB DRIVER
> > > > diff --git a/drivers/platform/x86/ayaneo-ec.c b/drivers/platform/x8=
6/ayaneo-ec.c
> > > > index 697bb053a7d6..0652c044ad76 100644
> > > > --- a/drivers/platform/x86/ayaneo-ec.c
> > > > +++ b/drivers/platform/x86/ayaneo-ec.c
> > > > @@ -8,6 +8,7 @@
> > > >   */
> > > >
> > > >  #include <linux/acpi.h>
> > > > +#include <linux/bits.h>
> > > >  #include <linux/dmi.h>
> > > >  #include <linux/err.h>
> > > >  #include <linux/hwmon.h>
> > > > @@ -16,6 +17,7 @@
> > > >  #include <linux/module.h>
> > > >  #include <linux/platform_device.h>
> > > >  #include <linux/power_supply.h>
> > > > +#include <linux/sysfs.h>
> > > >  #include <acpi/battery.h>
> > > >
> > > >  #define AYANEO_PWM_ENABLE_REG         0x4A
> > > > @@ -32,9 +34,17 @@
> > > >  #define AYANEO_CHARGE_VAL_AUTO               0xaa
> > > >  #define AYANEO_CHARGE_VAL_INHIBIT    0x55
> > > >
> > > > +#define AYANEO_POWER_REG     0x2d
> > > > +#define AYANEO_POWER_OFF     0xfe
> > > > +#define AYANEO_POWER_ON              0xff
> > > > +#define AYANEO_MODULE_REG    0x2f
> > > > +#define AYANEO_MODULE_LEFT   BIT(0)
> > > > +#define AYANEO_MODULE_RIGHT  BIT(1)
> > > > +
> > > >  struct ayaneo_ec_quirk {
> > > >       bool has_fan_control;
> > > >       bool has_charge_control;
> > > > +     bool has_magic_modules;
> > > >  };
> > > >
> > > >  struct ayaneo_ec_platform_data {
> > > > @@ -46,6 +56,7 @@ struct ayaneo_ec_platform_data {
> > > >  static const struct ayaneo_ec_quirk quirk_ayaneo3 =3D {
> > > >       .has_fan_control =3D true,
> > > >       .has_charge_control =3D true,
> > > > +     .has_magic_modules =3D true,
> > > >  };
> > > >
> > > >  static const struct dmi_system_id dmi_table[] =3D {
> > > > @@ -266,6 +277,100 @@ static int ayaneo_remove_battery(struct power=
_supply *battery,
> > > >       return 0;
> > > >  }
> > > >
> > > > +static ssize_t controller_power_store(struct device *dev,
> > > > +                                   struct device_attribute *attr,
> > > > +                                   const char *buf,
> > > > +                                   size_t count)
> > > > +{
> > > > +     bool value;
> > > > +     int ret;
> > > > +
> > > > +     ret =3D kstrtobool(buf, &value);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     ret =3D ec_write(AYANEO_POWER_REG, value ? AYANEO_POWER_ON : =
AYANEO_POWER_OFF);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     return count;
> > > > +}
> > > > +
> > > > +static ssize_t controller_power_show(struct device *dev,
> > > > +                                  struct device_attribute *attr,
> > > > +                                  char *buf)
> > > > +{
> > > > +     int ret;
> > > > +     u8 val;
> > > > +
> > > > +     ret =3D ec_read(AYANEO_POWER_REG, &val);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     return sysfs_emit(buf, "%d\n", val =3D=3D AYANEO_POWER_ON);
> > > > +}
> > > > +
> > > > +static DEVICE_ATTR_RW(controller_power);
> > > > +
> > > > +static ssize_t controller_modules_show(struct device *dev,
> > > > +                                    struct device_attribute *attr,=
 char *buf)
> > > > +{
> > > > +     char *out;
> > > > +     int ret;
> > > > +     u8 val;
> > > > +
> > > > +     ret =3D ec_read(AYANEO_MODULE_REG, &val);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     switch (~val & (AYANEO_MODULE_LEFT | AYANEO_MODULE_RIGHT)) {
> > >
> > > This too is constructing mask still here which is ugly.
> >
> > I can bring back the bools :-)
> >
> > I agree but that's what I came up with to remove them
>
> Just Add a define for the mask instead as was requested. There's no need
> to make this any harder than that.

Should the mask be:

(AYANEO_MODULE_LEFT | AYANEO_MODULE_RIGHT)

or

GENMASK(2,0)ish

I find the latter a bit more error prone since it redefines. I can
move forward with the former one later today if there arent any other
comments

> --
>  i.
>
> > > > +     case AYANEO_MODULE_LEFT | AYANEO_MODULE_RIGHT:
> > > > +             out =3D "both";
> > > > +             break;
> > > > +     case AYANEO_MODULE_LEFT:
> > > > +             out =3D "left";
> > > > +             break;
> > > > +     case AYANEO_MODULE_RIGHT:
> > > > +             out =3D "right";
> > > > +             break;
> > > > +     default:
> > > > +             out =3D "none";
> > > > +             break;
> > > > +     }
> > > > +
> > > > +     return sysfs_emit(buf, "%s\n", out);
> > > > +}
> > > > +
> > > > +static DEVICE_ATTR_RO(controller_modules);
> > > > +
> > > > +static struct attribute *aya_mm_attrs[] =3D {
> > > > +     &dev_attr_controller_power.attr,
> > > > +     &dev_attr_controller_modules.attr,
> > > > +     NULL
> > > > +};
> > > > +
> > > > +static umode_t aya_mm_is_visible(struct kobject *kobj,
> > > > +                              struct attribute *attr, int n)
> > > > +{
> > > > +     struct device *dev =3D kobj_to_dev(kobj);
> > > > +     struct platform_device *pdev =3D to_platform_device(dev);
> > > > +     struct ayaneo_ec_platform_data *data =3D platform_get_drvdata=
(pdev);
> > > > +
> > > > +     if (data->quirks->has_magic_modules)
> > > > +             return attr->mode;
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static const struct attribute_group aya_mm_attribute_group =3D {
> > > > +     .is_visible =3D aya_mm_is_visible,
> > > > +     .attrs =3D aya_mm_attrs,
> > > > +};
> > > > +
> > > > +static const struct attribute_group *ayaneo_ec_groups[] =3D {
> > > > +     &aya_mm_attribute_group,
> > > > +     NULL
> > > > +};
> > > > +
> > > >  static int ayaneo_ec_probe(struct platform_device *pdev)
> > > >  {
> > > >       const struct dmi_system_id *dmi_entry;
> > > > @@ -307,6 +412,7 @@ static int ayaneo_ec_probe(struct platform_devi=
ce *pdev)
> > > >  static struct platform_driver ayaneo_platform_driver =3D {
> > > >       .driver =3D {
> > > >               .name =3D "ayaneo-ec",
> > > > +             .dev_groups =3D ayaneo_ec_groups,
> > > >       },
> > > >       .probe =3D ayaneo_ec_probe,
> > > >  };
> > > >
> > >
> > > --
> > >  i.
> > >
> > >
> >

