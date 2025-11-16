Received: from relay15.grserver.gr (relay15.grserver.gr [46.62.234.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C148F2DCF69
	for <linux-hwmon@vger.kernel.org>; Sun, 16 Nov 2025 16:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.62.234.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763310448; cv=none; b=eXcQ7LcEA0/GLMjL8FCIyKif8xK8VoQmgdu9phqTiF4dT0oEKqKkQjJIORQoeKD5vS71e1Wb2yTxvigS9XE3q+mOFTKNCr+7pkr5g8+m9DjVhUhYGeLhTbJg6i9QmOVU1P5fw2lN8ssuTAcdX/tGYpzk/5jdWUj0kmkEDng2uUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763310448; c=relaxed/simple;
	bh=IHGFwEp9Y/P161Ft0v5B6FtzpdqFqvQ3pQa5Tqhop+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XGOUPCTC1E4uLp4q5UkCmmKcClDQFd767RAfuA5yb0nhMe9rnNFvu5Lq0aGhT69jfB7LlO+rkVcI1daLwlanZB7FhShIt2mvurGy9wppN+oUNby2yRoZJvYiO4IOPkIfj2/5Ds6BNwo4h6TuGaEefWz3mZ6HecI3xgGftKX8VyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=hRkux2ZQ; arc=none smtp.client-ip=46.62.234.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="hRkux2ZQ"
Received: from relay15 (localhost [127.0.0.1])
	by relay15.grserver.gr (Proxmox) with ESMTP id 5F4F343E48
	for <linux-hwmon@vger.kernel.org>; Sun, 16 Nov 2025 16:19:28 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay15.grserver.gr (Proxmox) with ESMTPS id 8FC2D43E43
	for <linux-hwmon@vger.kernel.org>; Sun, 16 Nov 2025 16:19:26 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 88FD91FF3AC
	for <linux-hwmon@vger.kernel.org>; Sun, 16 Nov 2025 18:19:24 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763309966;
	bh=gXDZ9zl2F82pJQrJHpKyPIEMGNbs5Tvll+oAAd3+iGg=;
	h=Received:From:Subject:To;
	b=hRkux2ZQwomUfJY7fo8yRyogFveiRAnYobCXbZBGTt7FVKtfJyLjnd0MeWOMbJjXJ
	 MjBUDQ1tLFJVJIJBo1sOMSpLQDwml2sogOqzSIyf+RVbWru1g3DCAMrfUq1p2GT54u
	 GfgMKYfY140bSOP//JvcYhUzUgVGSaDHWING/FIZ55I1i9o0XGlfqqBi+x21lJ+55B
	 qS5a6wFI2SQAtf2dlJe6A0MbEz2EMlMg55riShMuoczJCKWB26VLYmDdUH2LBJ74zt
	 sp6SqkyHMPPil2WGW6c06L9AEHp3fNeDeUYpUR0JUcZBix1lZ6tk7SAoEQxDvMUz92
	 TovnNLY7R1FMw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.173) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f173.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-37a875e3418so25589371fa.1
        for <linux-hwmon@vger.kernel.org>;
 Sun, 16 Nov 2025 08:19:24 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX5K7iTn96GswwBZ7Jp6S9HlQp/GJp2NACUMA0He/4huYBZZ8s2Yonvh0QX9WJvVAy4rTwwow4fi7OqdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoNnlYAbupxsn/RGgGyr8DCcHtW8+TF4iE9HvDrJl+6WFyzw9U
	iSFogpLkKCmyrXZqjEFXXJ/JLG1H1sNFnWL/zEtXn5m3KBR6qAKG+Raq8+U6yePpjvinCMqxS5o
	cL17y03NvH7AiuYVYCMMjui8dlOlqwXc=
X-Google-Smtp-Source: 
 AGHT+IG4g34ueW0wXRmE3lb2ko4VC4WwlLnuogVuhLAWDhhzhwpsF4CgE2XUWJ7SF2l7myWq5lEhdFWr9/vJsW1+bvk=
X-Received: by 2002:a05:651c:4094:b0:37b:aaf7:f022 with SMTP id
 38308e7fff4ca-37babd7f7ffmr18049061fa.35.1763309963642; Sun, 16 Nov 2025
 08:19:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251113212221.456875-1-lkml@antheas.dev>
 <20251113212221.456875-7-lkml@antheas.dev>
 <c329d8c7-1dfd-4168-a267-cc7fcc66aeb7@gmx.de>
In-Reply-To: <c329d8c7-1dfd-4168-a267-cc7fcc66aeb7@gmx.de>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sun, 16 Nov 2025 17:19:12 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwExxbcrTQP5G6cc3sjayiW+crCXTfG4VHi85QrMqFtpBQ@mail.gmail.com>
X-Gm-Features: AWmQ_blfw8hRnMk7tlJTd_aPUJBzqQIcDoj5HB35ZWAQJMuMq4RGwo4g_qnlIKM
Message-ID: 
 <CAGwozwExxbcrTQP5G6cc3sjayiW+crCXTfG4VHi85QrMqFtpBQ@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] platform/x86: ayaneo-ec: Add suspend hook
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176330996563.478932.3343202450231614772@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sun, 16 Nov 2025 at 17:05, Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 13.11.25 um 22:22 schrieb Antheas Kapenekakis:
>
> > The Ayaneo EC resets after hibernation, losing the charge control state.
> > Add a small PM hook to restore this state on hibernation resume.
> >
> > The fan speed is also lost during hibernation, but since hibernation
> > failures are common with this class of devices, setting a low fan speed
> > when the userspace program controlling the fan will potentially not
> > take over could cause the device to overheat, so it is not restored.
> >
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >   drivers/platform/x86/ayaneo-ec.c | 84 +++++++++++++++++++++++++++++++-
> >   1 file changed, 83 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/platform/x86/ayaneo-ec.c b/drivers/platform/x86/ayaneo-ec.c
> > index 814f7f028710..3f40429acbd4 100644
> > --- a/drivers/platform/x86/ayaneo-ec.c
> > +++ b/drivers/platform/x86/ayaneo-ec.c
> > @@ -52,6 +52,11 @@ struct ayaneo_ec_platform_data {
> >       struct platform_device *pdev;
> >       struct ayaneo_ec_quirk *quirks;
> >       struct acpi_battery_hook battery_hook;
> > +
> > +     // Protects access to restore_pwm
> > +     struct mutex hwmon_lock;
> > +     bool restore_charge_limit;
> > +     bool restore_pwm;
> >   };
> >
> >   static const struct ayaneo_ec_quirk quirk_fan = {
> > @@ -208,10 +213,16 @@ static int ayaneo_ec_read(struct device *dev, enum hwmon_sensor_types type,
> >   static int ayaneo_ec_write(struct device *dev, enum hwmon_sensor_types type,
> >                          u32 attr, int channel, long val)
> >   {
> > +     struct ayaneo_ec_platform_data *data = dev_get_drvdata(dev);
> > +     int ret;
> > +
> > +     guard(mutex)(&data->hwmon_lock);
> > +
> >       switch (type) {
> >       case hwmon_pwm:
> >               switch (attr) {
> >               case hwmon_pwm_enable:
> > +                     data->restore_pwm = false;
> >                       switch (val) {
> >                       case 1:
> >                               return ec_write(AYANEO_PWM_ENABLE_REG,
> > @@ -225,6 +236,17 @@ static int ayaneo_ec_write(struct device *dev, enum hwmon_sensor_types type,
> >               case hwmon_pwm_input:
> >                       if (val < 0 || val > 255)
> >                               return -EINVAL;
> > +                     if (data->restore_pwm) {
> > +                             /*
> > +                              * Defer restoring PWM control to after
> > +                              * userspace resumes successfully
> > +                              */
> > +                             ret = ec_write(AYANEO_PWM_ENABLE_REG,
> > +                                            AYANEO_PWM_MODE_MANUAL);
> > +                             if (ret)
> > +                                     return ret;
> > +                             data->restore_pwm = false;
> > +                     }
> >                       return ec_write(AYANEO_PWM_REG, (val * 100) / 255);
> >               default:
> >                       break;
> > @@ -454,11 +476,14 @@ static int ayaneo_ec_probe(struct platform_device *pdev)
> >
> >       data->pdev = pdev;
> >       data->quirks = dmi_entry->driver_data;
> > +     ret = devm_mutex_init(&pdev->dev, &data->hwmon_lock);
> > +     if (ret)
> > +             return ret;
> >       platform_set_drvdata(pdev, data);
> >
> >       if (data->quirks->has_fan_control) {
> >               hwdev = devm_hwmon_device_register_with_info(&pdev->dev,
> > -                     "ayaneo_ec", NULL, &ayaneo_ec_chip_info, NULL);
> > +                     "ayaneo_ec", data, &ayaneo_ec_chip_info, NULL);
> >               if (IS_ERR(hwdev))
> >                       return PTR_ERR(hwdev);
> >       }
> > @@ -475,10 +500,67 @@ static int ayaneo_ec_probe(struct platform_device *pdev)
> >       return 0;
> >   }
> >
> > +static int ayaneo_freeze(struct device *dev)
> > +{
> > +     struct platform_device *pdev = to_platform_device(dev);
> > +     struct ayaneo_ec_platform_data *data = platform_get_drvdata(pdev);
> > +     int ret;
> > +     u8 tmp;
> > +
> > +     if (data->quirks->has_charge_control) {
> > +             ret = ec_read(AYANEO_CHARGE_REG, &tmp);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             data->restore_charge_limit = tmp == AYANEO_CHARGE_VAL_INHIBIT;
> > +     }
> > +
> > +     if (data->quirks->has_fan_control) {
> > +             ret = ec_read(AYANEO_PWM_ENABLE_REG, &tmp);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             data->restore_pwm = tmp == AYANEO_PWM_MODE_MANUAL;
> > +
> > +             /*
> > +              * Release the fan when entering hibernation to avoid
> > +              * overheating if hibernation fails and hangs.
> > +              */
> > +             if (data->restore_pwm) {
> > +                     ret = ec_write(AYANEO_PWM_ENABLE_REG, AYANEO_PWM_MODE_AUTO);
> > +                     if (ret)
> > +                             return ret;
> > +             }
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int ayaneo_restore(struct device *dev)
> > +{
> > +     struct platform_device *pdev = to_platform_device(dev);
> > +     struct ayaneo_ec_platform_data *data = platform_get_drvdata(pdev);
> > +     int ret;
> > +
> > +     if (data->quirks->has_charge_control && data->restore_charge_limit) {
> > +             ret = ec_write(AYANEO_CHARGE_REG, AYANEO_CHARGE_VAL_INHIBIT);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct dev_pm_ops ayaneo_pm_ops = {
> > +     .freeze = ayaneo_freeze,
> > +     .restore = ayaneo_restore,
> > +};
> > +
> >   static struct platform_driver ayaneo_platform_driver = {
> >       .driver = {
> >               .name = "ayaneo-ec",
> >               .dev_groups = ayaneo_ec_groups,
> > +             .pm = &ayaneo_pm_ops,
>
> Maybe you should use pm_sleep_ptr() here. With that being fixed:

True, i conflated that with using a sleep define so I skipped it.
Seems it is a ternary that checks CONFIG_PM_SLEEP

@Ilpo lmk if I should resend this before the merge window or it's
small enough to edit inplace

Antheas

> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>
> >       },
> >       .probe = ayaneo_ec_probe,
> >   };
>

