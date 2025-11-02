Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AB934D3BA
	for <linux-hwmon@vger.kernel.org>; Sun,  2 Nov 2025 18:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762108676; cv=none; b=IjZiS9vyrtSbof22Dm1EOHMiXxHKJx1Mgh+wzAOfzYUS30wgZEIqa/ZRPPyIhK8ujrujSbR/SE2pAaYak8m/gG19Iv6Fisy4q3co6dq5GXgUx3jNFLecADP3NsBrw2oOfnEMQVW/uZGxTMM8wfPRUamz0Lo9PGlTLs6V7MnJZw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762108676; c=relaxed/simple;
	bh=c+kq0yVmpft5T1Lt+obd7V/CzMBghxFYFdG+Ys2XM+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G8lK0FJ/BWyTk7ykmuvgIPetLfhdhrsnTqI8wYXbEwRs/BB5PXuXdFf7jSwvWPG+S7+IqOCobFiPTX5hhSY/toqNR1blm/jfsRromHad4bMQ8dh+jXsEXz5CVnO6/1mYtuPO/IEtRlRWhmisROqci8wNqcP26/uRkGNs80rFEBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=LF6cfo1x; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="LF6cfo1x"
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id 93A7FBD9D9
	for <linux-hwmon@vger.kernel.org>; Sun,  2 Nov 2025 20:37:52 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id B30E3BDA5F
	for <linux-hwmon@vger.kernel.org>; Sun,  2 Nov 2025 20:37:51 +0200 (EET)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 34641201DD0
	for <linux-hwmon@vger.kernel.org>; Sun,  2 Nov 2025 20:37:51 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1762108671;
	bh=+5pMv4Z1I1tl7U0430f5AvD8qa95HrwvJiCVV8wad7M=;
	h=Received:From:Subject:To;
	b=LF6cfo1xoa6Ob7/DZe7j/Ytf0ofIntJCgsVXHvhpo7Qz6pdUDfCpvo+KagvRGOOX8
	 5wxq3wF5o20JRy8sA08CzuWY+HnrymDi51EOBGkBuo5Fzif+yiZHeapzUQzexRYRY9
	 Y1krjGlsVqT2V+34D8cNaPwmLKrAFueLYkNWfkgH1XnP+nES4KpqK0LWj1WejU/4Mr
	 4njJHHlrtFVuMEnYzdWxARktLymFZ2VhnepkCmD402Y+sWkIfErFgy0rdf0cmnPJ25
	 viK6AKDspsp8I/pB0EFXvfIXhmkEYdOhfNiThZKCkPPWC0C/HRRahBgUhetpid9a0o
	 zsDPWPtlunXAw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.173) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f173.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-36295d53a10so32254481fa.0
        for <linux-hwmon@vger.kernel.org>;
 Sun, 02 Nov 2025 10:37:51 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUj4KOyyB5quUgjtM8qLYiX9JQfQVgWZRY+KYB3zAYviVNCoz3rLdPVMVF1JJqTUzegnR4AxOCXrjymSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfhKut8qF8ZBkbBkH49TkcTwBz9M3jOiOr2H5Pw0ZKa7AMcJrf
	vcWLO/aV54elO70WXhO5tdIiRThxCioUhOkdwHptzyq0dx6wMfQjTN06vGU20/o1ZxyUG01rTaa
	W8jDw/p7ZXE6S2vs9YDvq51JvK3TIqTs=
X-Google-Smtp-Source: 
 AGHT+IFlOmj4U4ntIEU+5NWG51BlvZLpFyJw7oTDxSC8idvX2U5UeEUfWMbOpz1NsCsLabAWX453f92F9G0YW8LELiM=
X-Received: by 2002:a2e:be21:0:b0:37a:2dfa:c774 with SMTP id
 38308e7fff4ca-37a2dfacdd5mr12203511fa.31.1762108670644; Sun, 02 Nov 2025
 10:37:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251031163651.1465981-1-lkml@antheas.dev>
 <20251031163651.1465981-4-lkml@antheas.dev>
 <b075b605-4cdd-4fbf-aa1a-78f7f34a1c50@gmx.de>
In-Reply-To: <b075b605-4cdd-4fbf-aa1a-78f7f34a1c50@gmx.de>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sun, 2 Nov 2025 19:37:38 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwHfaeOnMmLbAK03gzG2JCsZ=TDAv3EMyDoBZRtG=ix5ng@mail.gmail.com>
X-Gm-Features: AWmQ_bmpsxGxPX4nvKtL_LYS6hn8pSdfaKaN9GfyfbtJjkl9a5c-vJyAfszIwXY
Message-ID: 
 <CAGwozwHfaeOnMmLbAK03gzG2JCsZ=TDAv3EMyDoBZRtG=ix5ng@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] platform/x86: ayaneo-ec: Add charge control
 support
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176210867144.1938604.16759872255292675966@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sun, 2 Nov 2025 at 19:26, Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 31.10.25 um 17:36 schrieb Antheas Kapenekakis:
>
> > Ayaneo devices support charge inhibition via the EC. This inhibition
> > only works while the device is powered on, and resets between restarts.
> > However, it is maintained across suspend/resume cycles.
> >
> > The EC does not support charge threshold control. Instead, userspace
> > software on Windows manually toggles charge inhibition depending on
> > battery level.
> >
> > Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >   drivers/platform/x86/Kconfig     |   1 +
> >   drivers/platform/x86/ayaneo-ec.c | 112 +++++++++++++++++++++++++++++++
> >   2 files changed, 113 insertions(+)
> >
> > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> > index b3beaff4b03a..a45449ae83f8 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -319,6 +319,7 @@ config ASUS_TF103C_DOCK
> >   config AYANEO_EC
> >       tristate "Ayaneo EC platform control"
> >       depends on ACPI_EC
> > +     depends on ACPI_BATTERY
> >       depends on HWMON
> >       help
> >         Enables support for the platform EC of Ayaneo devices. This
> > diff --git a/drivers/platform/x86/ayaneo-ec.c b/drivers/platform/x86/ayaneo-ec.c
> > index 108a23458a4f..697bb053a7d6 100644
> > --- a/drivers/platform/x86/ayaneo-ec.c
> > +++ b/drivers/platform/x86/ayaneo-ec.c
> > @@ -15,6 +15,8 @@
> >   #include <linux/kernel.h>
> >   #include <linux/module.h>
> >   #include <linux/platform_device.h>
> > +#include <linux/power_supply.h>
> > +#include <acpi/battery.h>
> >
> >   #define AYANEO_PWM_ENABLE_REG        0x4A
> >   #define AYANEO_PWM_REG               0x4B
> > @@ -23,17 +25,27 @@
> >
> >   #define AYANEO_FAN_REG               0x76
> >
> > +#define EC_CHARGE_CONTROL_BEHAVIOURS                         \
> > +     (BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO) |           \
> > +      BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE))
>
> I think POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE_AWAKE would be more suitable here.

Charge inhibition works during sleep.

> Other than that:
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>
> > +#define AYANEO_CHARGE_REG            0x1e
> > +#define AYANEO_CHARGE_VAL_AUTO               0xaa
> > +#define AYANEO_CHARGE_VAL_INHIBIT    0x55
> > +
> >   struct ayaneo_ec_quirk {
> >       bool has_fan_control;
> > +     bool has_charge_control;
> >   };
> >
> >   struct ayaneo_ec_platform_data {
> >       struct platform_device *pdev;
> >       struct ayaneo_ec_quirk *quirks;
> > +     struct acpi_battery_hook battery_hook;
> >   };
> >
> >   static const struct ayaneo_ec_quirk quirk_ayaneo3 = {
> >       .has_fan_control = true,
> > +     .has_charge_control = true,
> >   };
> >
> >   static const struct dmi_system_id dmi_table[] = {
> > @@ -164,11 +176,102 @@ static const struct hwmon_chip_info ayaneo_ec_chip_info = {
> >       .info = ayaneo_ec_sensors,
> >   };
> >
> > +static int ayaneo_psy_ext_get_prop(struct power_supply *psy,
> > +                                const struct power_supply_ext *ext,
> > +                                void *data,
> > +                                enum power_supply_property psp,
> > +                                union power_supply_propval *val)
> > +{
> > +     int ret;
> > +     u8 tmp;
> > +
> > +     switch (psp) {
> > +     case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
> > +             ret = ec_read(AYANEO_CHARGE_REG, &tmp);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             if (tmp == AYANEO_CHARGE_VAL_INHIBIT)
> > +                     val->intval = POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE;
> > +             else
> > +                     val->intval = POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO;
> > +             return 0;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +}
> > +
> > +static int ayaneo_psy_ext_set_prop(struct power_supply *psy,
> > +                                const struct power_supply_ext *ext,
> > +                                void *data,
> > +                                enum power_supply_property psp,
> > +                                const union power_supply_propval *val)
> > +{
> > +     u8 raw_val;
> > +
> > +     switch (psp) {
> > +     case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
> > +             switch (val->intval) {
> > +             case POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO:
> > +                     raw_val = AYANEO_CHARGE_VAL_AUTO;
> > +                     break;
> > +             case POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE:
> > +                     raw_val = AYANEO_CHARGE_VAL_INHIBIT;
> > +                     break;
> > +             default:
> > +                     return -EINVAL;
> > +             }
> > +             return ec_write(AYANEO_CHARGE_REG, raw_val);
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +}
> > +
> > +static int ayaneo_psy_prop_is_writeable(struct power_supply *psy,
> > +                                     const struct power_supply_ext *ext,
> > +                                     void *data,
> > +                                     enum power_supply_property psp)
> > +{
> > +     return true;
> > +}
> > +
> > +static const enum power_supply_property ayaneo_psy_ext_props[] = {
> > +     POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR,
> > +};
> > +
> > +static const struct power_supply_ext ayaneo_psy_ext = {
> > +     .name                   = "ayaneo-charge-control",
> > +     .properties             = ayaneo_psy_ext_props,
> > +     .num_properties         = ARRAY_SIZE(ayaneo_psy_ext_props),
> > +     .charge_behaviours      = EC_CHARGE_CONTROL_BEHAVIOURS,
> > +     .get_property           = ayaneo_psy_ext_get_prop,
> > +     .set_property           = ayaneo_psy_ext_set_prop,
> > +     .property_is_writeable  = ayaneo_psy_prop_is_writeable,
> > +};
> > +
> > +static int ayaneo_add_battery(struct power_supply *battery,
> > +                           struct acpi_battery_hook *hook)
> > +{
> > +     struct ayaneo_ec_platform_data *data =
> > +             container_of(hook, struct ayaneo_ec_platform_data, battery_hook);
> > +
> > +     return power_supply_register_extension(battery, &ayaneo_psy_ext,
> > +                                            &data->pdev->dev, NULL);
> > +}
> > +
> > +static int ayaneo_remove_battery(struct power_supply *battery,
> > +                              struct acpi_battery_hook *hook)
> > +{
> > +     power_supply_unregister_extension(battery, &ayaneo_psy_ext);
> > +     return 0;
> > +}
> > +
> >   static int ayaneo_ec_probe(struct platform_device *pdev)
> >   {
> >       const struct dmi_system_id *dmi_entry;
> >       struct ayaneo_ec_platform_data *data;
> >       struct device *hwdev;
> > +     int ret;
> >
> >       dmi_entry = dmi_first_match(dmi_table);
> >       if (!dmi_entry)
> > @@ -189,6 +292,15 @@ static int ayaneo_ec_probe(struct platform_device *pdev)
> >                       return PTR_ERR(hwdev);
> >       }
> >
> > +     if (data->quirks->has_charge_control) {
> > +             data->battery_hook.add_battery = ayaneo_add_battery;
> > +             data->battery_hook.remove_battery = ayaneo_remove_battery;
> > +             data->battery_hook.name = "Ayaneo Battery";
> > +             ret = devm_battery_hook_register(&pdev->dev, &data->battery_hook);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> >       return 0;
> >   }
> >
>

