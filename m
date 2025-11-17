Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DBC1CD1E4
	for <linux-hwmon@vger.kernel.org>; Mon, 17 Nov 2025 13:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.248.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763386461; cv=none; b=ZuKssoivs4XTkuchQXFaPlwXN7jBlhI7q+eenJrtZOQymQehO+dOdHk+o5Rlwyg6Np5o2F3HHOxZ3pjtTU2YlGnJQXb1P/ex0sHgRuIzph2Pf2bW+N/tgxAJuZy8nZFm5mF2Mb4WeQYXrxiDDtd8C8yJ1tQPe1pbYDOleiQZFko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763386461; c=relaxed/simple;
	bh=1Vjn1a4D7VKA4NiJvBDV2/xLFm4Uve0euCkztkj5iIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kVtS+is/tG5NEJntjPh0eq2/kzPDVt4qPoGaNhojV1x3Az9o8pVQIgQ9oQMqnVygtmHz74tYw7H7w1j6zYXhOTXTqQM2c3pkJOT8jHY9tAZI17vsRkDRSpfx9UA6ZuCVTUhSB1BQ3puhMFM5XksnDxczoGEzlsGlTtKfFFpJy3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=nz2tGCHs; arc=none smtp.client-ip=37.27.248.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="nz2tGCHs"
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id 0C40F42050
	for <linux-hwmon@vger.kernel.org>; Mon, 17 Nov 2025 15:34:11 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id C902042001
	for <linux-hwmon@vger.kernel.org>; Mon, 17 Nov 2025 15:34:09 +0200 (EET)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 1A86620190D
	for <linux-hwmon@vger.kernel.org>; Mon, 17 Nov 2025 15:34:09 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763386449;
	bh=PgkQmVnGwRhbinWEfbalW9xEaoez/YXSywLyRgvCsG4=;
	h=Received:From:Subject:To;
	b=nz2tGCHsSKpXEBTOcgc6RIFjaMNRhkOaNHMyuI99HvAjHEZfIFhNaVmvo6gDEAv/5
	 E7vlEyjpTmulu/pxkbiTE6ObHpVHjaCgpOn+yMXElVB338fQobamUiR8fvUtlhfsku
	 nGlWHI5aXHcJxBCQe7tvQ6Btnx6cJRZp/ZXbJcWwl02/yDdrcIH6cjhirdEKeHWCxC
	 TehbbHLHsDD2SBTB6Fm9sDBpI05AasGxMbGIj/39sT63bo6FRmkZj+L5XX7tOXfDXH
	 WpQjv5zxHTRedMB9AsjlKkT5N46ivQRFcW5fSU5w/Y6C/s7Q8BbYZjHOV0VIUHsTli
	 k93V0oHQHL3Vw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.177) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f177.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-37a2dcc52aeso41312251fa.0
        for <linux-hwmon@vger.kernel.org>;
 Mon, 17 Nov 2025 05:34:09 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWtsqPJWJubKRgEHzU0TnySXue36Sdw8GPbFHPGUYZGvV9a251peuFsByCuOCwb5K7a+lv3NqksFjy2XQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCEps+5NLNj4PTFzavT/dyoVitp1bdXhqzM+hWykfmc3+LbPdw
	3rAS/ht1gYg2sMRhkdrjf8G/nlJl0T3dYxojvGWWkMKUJGzlpoc/xN25WYPIgZFCbEiBuiHlcIb
	Abq3GozVZuTaEcf+xXuGEdNNX2v7XRXI=
X-Google-Smtp-Source: 
 AGHT+IE5BHgUPXDDHFJMpYkQt3x+egxp7K3igPrrArNCO44yCQ5XSFkz/StliurHFlN8YoOooYSmCVW0riz72ZsW1wk=
X-Received: by 2002:a2e:8a87:0:b0:360:c716:2666 with SMTP id
 38308e7fff4ca-37babd563f4mr29291611fa.30.1763386448519; Mon, 17 Nov 2025
 05:34:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251113212221.456875-1-lkml@antheas.dev>
 <20251113212221.456875-5-lkml@antheas.dev>
 <77b944ff-2f84-3326-3901-5942739d3c43@linux.intel.com>
In-Reply-To: <77b944ff-2f84-3326-3901-5942739d3c43@linux.intel.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 17 Nov 2025 14:33:56 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwGq7RiZdpBsYhKxfrTMMfzGPGML2R6q8ayjpVn_W4j=uQ@mail.gmail.com>
X-Gm-Features: AWmQ_bm8S2k6MmN4QsAZlRBfhT1xaGS5Jzle-QcsWSiLVqf4TPM1KAIq9GA-QBU
Message-ID: 
 <CAGwozwGq7RiZdpBsYhKxfrTMMfzGPGML2R6q8ayjpVn_W4j=uQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] platform/x86: ayaneo-ec: Add controller power and
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
 <176338644935.1678898.865844165497727008@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Mon, 17 Nov 2025 at 11:30, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Thu, 13 Nov 2025, Antheas Kapenekakis wrote:
>
> > The Ayaneo 3 features hot-swappable controller modules. The ejection
> > and management is done through HID. However, after ejecting the modules=
,
> > the controller needs to be power cycled via the EC to re-initialize.
> >
> > For this, the EC provides a variable that holds whether the left or
> > right modules are connected, and a power control register to turn
> > the controller on or off. After ejecting the modules, the controller
> > should be turned off. Then, after both modules are reinserted,
> > the controller may be powered on again to re-initialize.
>
> If wonder if the ejecting could/should be made to turn it off without nee=
d
> for an explicit off command?

Perhaps in the future, this driver leaves the possibility open for it.
However, that'd require a secondary HID driver to handle the full
ejection process, with a shared function hook for this driver.

The eject sequence consists of sending a HID config command to start
the ejection, followed by a secondary config command to turn off the
ejection bits and then waiting for two ready bits to report that the
ejection is finished. Then, the controller is turned off. Apart from
turning off, all of this is done through HID (so HID ready races the
controller_modules value).

The module status of this driver is only used to check when the
controller should be turned on again and to provide visual feedback
about which modules are currently connected while unpowered. When
powered, there is full status reporting over HID, including which
specific modules are connected[1].

The end-to-end sequence is currently in userspace[2]. However, the EC
ports are shielded from userspace so these two specific accesses must
happen through a kernel driver.

Antheas

[1] https://github.com/hhd-dev/hhd/blob/8d842e547441600b8adc806bfb10ded5718=
e4fe3/src/hhd/device/ayaneo/base.py#L90-L117
[2] https://github.com/hhd-dev/hhd/blob/8d842e547441600b8adc806bfb10ded5718=
e4fe3/src/hhd/device/ayaneo/base.py

> > This patch introduces two new sysfs attributes:
> >  - `controller_modules`: a read-only attribute that indicates whether
> >    the left and right modules are connected (none, left, right, both).
> >  - `controller_power`: a read-write attribute that allows the user
> >    to turn the controller on or off (with '1'/'0').
> >
> > Therefore, after ejection is complete, userspace can power off the
> > controller, then wait until both modules have been reinserted
> > (`controller_modules` will return 'both') to turn on the controller.
> >
> > Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >  .../ABI/testing/sysfs-platform-ayaneo-ec      |  19 ++++
> >  MAINTAINERS                                   |   1 +
> >  drivers/platform/x86/ayaneo-ec.c              | 107 ++++++++++++++++++
> >  3 files changed, 127 insertions(+)
> >  create mode 100644 Documentation/ABI/testing/sysfs-platform-ayaneo-ec
> >
> > diff --git a/Documentation/ABI/testing/sysfs-platform-ayaneo-ec b/Docum=
entation/ABI/testing/sysfs-platform-ayaneo-ec
> > new file mode 100644
> > index 000000000000..4cffbf5fc7ca
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-platform-ayaneo-ec
> > @@ -0,0 +1,19 @@
> > +What:                /sys/devices/platform/ayaneo-ec/controller_power
> > +Date:                Nov 2025
> > +KernelVersion:       6.19
> > +Contact:     "Antheas Kapenekakis" <lkml@antheas.dev>
> > +Description:
> > +             Current controller power state. Allows turning on and off
> > +             the controller power (e.g. for power savings). Write 1 to
> > +             turn on, 0 to turn off. File is readable and writable.
> > +
> > +What:                /sys/devices/platform/ayaneo-ec/controller_module=
s
> > +Date:                Nov 2025
> > +KernelVersion:       6.19
> > +Contact:     "Antheas Kapenekakis"  <lkml@antheas.dev>
> > +Description:
> > +             Shows which controller modules are currently connected to
> > +             the device. Possible values are "left", "right" and "both=
".
> > +             File is read-only. The Windows software for this device
> > +             will only set controller power to 1 if both module sides
> > +             are connected (i.e. this file returns "both").
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index c5bf7207c45f..f8ab009b6224 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -4196,6 +4196,7 @@ AYANEO PLATFORM EC DRIVER
> >  M:   Antheas Kapenekakis <lkml@antheas.dev>
> >  L:   platform-driver-x86@vger.kernel.org
> >  S:   Maintained
> > +F:   Documentation/ABI/testing/sysfs-platform-ayaneo
> >  F:   drivers/platform/x86/ayaneo-ec.c
> >
> >  AZ6007 DVB DRIVER
> > diff --git a/drivers/platform/x86/ayaneo-ec.c b/drivers/platform/x86/ay=
aneo-ec.c
> > index 697bb053a7d6..a0747e7ee43a 100644
> > --- a/drivers/platform/x86/ayaneo-ec.c
> > +++ b/drivers/platform/x86/ayaneo-ec.c
> > @@ -8,6 +8,7 @@
> >   */
> >
> >  #include <linux/acpi.h>
> > +#include <linux/bits.h>
> >  #include <linux/dmi.h>
> >  #include <linux/err.h>
> >  #include <linux/hwmon.h>
> > @@ -16,6 +17,7 @@
> >  #include <linux/module.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/power_supply.h>
> > +#include <linux/sysfs.h>
> >  #include <acpi/battery.h>
> >
> >  #define AYANEO_PWM_ENABLE_REG         0x4A
> > @@ -32,9 +34,18 @@
> >  #define AYANEO_CHARGE_VAL_AUTO               0xaa
> >  #define AYANEO_CHARGE_VAL_INHIBIT    0x55
> >
> > +#define AYANEO_POWER_REG     0x2d
> > +#define AYANEO_POWER_OFF     0xfe
> > +#define AYANEO_POWER_ON              0xff
> > +#define AYANEO_MODULE_REG    0x2f
> > +#define AYANEO_MODULE_LEFT   BIT(0)
> > +#define AYANEO_MODULE_RIGHT  BIT(1)
> > +#define AYANEO_MODULE_MASK   (AYANEO_MODULE_LEFT | AYANEO_MODULE_RIGHT=
)
> > +
> >  struct ayaneo_ec_quirk {
> >       bool has_fan_control;
> >       bool has_charge_control;
> > +     bool has_magic_modules;
> >  };
> >
> >  struct ayaneo_ec_platform_data {
> > @@ -46,6 +57,7 @@ struct ayaneo_ec_platform_data {
> >  static const struct ayaneo_ec_quirk quirk_ayaneo3 =3D {
> >       .has_fan_control =3D true,
> >       .has_charge_control =3D true,
> > +     .has_magic_modules =3D true,
> >  };
> >
> >  static const struct dmi_system_id dmi_table[] =3D {
> > @@ -266,6 +278,100 @@ static int ayaneo_remove_battery(struct power_sup=
ply *battery,
> >       return 0;
> >  }
> >
> > +static ssize_t controller_power_store(struct device *dev,
> > +                                   struct device_attribute *attr,
> > +                                   const char *buf,
> > +                                   size_t count)
> > +{
> > +     bool value;
> > +     int ret;
> > +
> > +     ret =3D kstrtobool(buf, &value);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D ec_write(AYANEO_POWER_REG, value ? AYANEO_POWER_ON : AYAN=
EO_POWER_OFF);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return count;
> > +}
> > +
> > +static ssize_t controller_power_show(struct device *dev,
> > +                                  struct device_attribute *attr,
> > +                                  char *buf)
> > +{
> > +     int ret;
> > +     u8 val;
> > +
> > +     ret =3D ec_read(AYANEO_POWER_REG, &val);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return sysfs_emit(buf, "%d\n", val =3D=3D AYANEO_POWER_ON);
> > +}
> > +
> > +static DEVICE_ATTR_RW(controller_power);
> > +
> > +static ssize_t controller_modules_show(struct device *dev,
> > +                                    struct device_attribute *attr, cha=
r *buf)
> > +{
> > +     char *out;
> > +     int ret;
> > +     u8 val;
> > +
> > +     ret =3D ec_read(AYANEO_MODULE_REG, &val);
> > +     if (ret)
> > +             return ret;
> > +
> > +     switch (~val & AYANEO_MODULE_MASK) {
>
> Thanks for adding the mask.
>
> Now when reading this again, I also suggest changing variable name from
> "val" to e.g. "unconnected_modules" as that would make the reason for
> inversion more obvious.
>
> > +     case AYANEO_MODULE_LEFT | AYANEO_MODULE_RIGHT:
> > +             out =3D "both";
> > +             break;
> > +     case AYANEO_MODULE_LEFT:
> > +             out =3D "left";
> > +             break;
> > +     case AYANEO_MODULE_RIGHT:
> > +             out =3D "right";
> > +             break;
> > +     default:
> > +             out =3D "none";
> > +             break;
> > +     }
> > +
> > +     return sysfs_emit(buf, "%s\n", out);
> > +}
> > +
> > +static DEVICE_ATTR_RO(controller_modules);
> > +
> > +static struct attribute *aya_mm_attrs[] =3D {
> > +     &dev_attr_controller_power.attr,
> > +     &dev_attr_controller_modules.attr,
> > +     NULL
> > +};
> > +
> > +static umode_t aya_mm_is_visible(struct kobject *kobj,
> > +                              struct attribute *attr, int n)
> > +{
> > +     struct device *dev =3D kobj_to_dev(kobj);
> > +     struct platform_device *pdev =3D to_platform_device(dev);
> > +     struct ayaneo_ec_platform_data *data =3D platform_get_drvdata(pde=
v);
> > +
> > +     if (data->quirks->has_magic_modules)
> > +             return attr->mode;
> > +     return 0;
> > +}
> > +
> > +static const struct attribute_group aya_mm_attribute_group =3D {
> > +     .is_visible =3D aya_mm_is_visible,
> > +     .attrs =3D aya_mm_attrs,
> > +};
> > +
> > +static const struct attribute_group *ayaneo_ec_groups[] =3D {
> > +     &aya_mm_attribute_group,
> > +     NULL
> > +};
> > +
> >  static int ayaneo_ec_probe(struct platform_device *pdev)
> >  {
> >       const struct dmi_system_id *dmi_entry;
> > @@ -307,6 +413,7 @@ static int ayaneo_ec_probe(struct platform_device *=
pdev)
> >  static struct platform_driver ayaneo_platform_driver =3D {
> >       .driver =3D {
> >               .name =3D "ayaneo-ec",
> > +             .dev_groups =3D ayaneo_ec_groups,
> >       },
> >       .probe =3D ayaneo_ec_probe,
> >  };
> >
>
> --
>  i.
>
>

