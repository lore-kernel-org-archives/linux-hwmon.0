Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436232D0C78;
	Mon, 17 Nov 2025 09:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763373429; cv=none; b=uUH64eq46r0xchk4fMcfTtvrywQGUf5P7flVhWo/rVtG7gY/P6843p2RppiUQLUIw2Nv+Bc64KJLOLE0j9N0t49QzUWhBFnNhb4IMiuoXWRgzCgSw/319ALRQ40HaoxEGVCpCW4BIJuAWyDjC3Hz5A+2QifboIpIGi1u/a9dEVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763373429; c=relaxed/simple;
	bh=YaqcsskH+tRBfeJjRw55puH3L5Ts8m8nluy+6YRlLOg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZCtaPNRNEj7i7rMsD8kQEyG+dgWKrixMtcovDPQb0nD47oUx74mCoaDIQfojGO3nQGEy6lzWPDnAyxlZGkfxQuU7CJPN5/dMjrQkfC18V1tVE12Jw98TWzLeiFrDohBPhn2Fyg/EhXjGppNqyKDLTMSycT9x2Wl0XVDmVMYK5+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IiBm30a2; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IiBm30a2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763373425; x=1794909425;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=YaqcsskH+tRBfeJjRw55puH3L5Ts8m8nluy+6YRlLOg=;
  b=IiBm30a29vy2mVC1HGJ4WjVfgNQbPzQUBlhffNCE7HiXYvyQkpXybXMB
   tl6E8Npx68eH2e6k1yyDAkbr0s8dEFe4WoqSS+zObxvTzVpX4nVETMeQo
   JiqmyLKw7uFlh7yOSrbtDm4BT7UwC/ytNm/cLWWPpWOwM5h01KpFkcgOC
   +hH0IciE56dusLkDDvVP43+IdxCmhZvccBVORJbPLPCd5Qd9VJtZKk//+
   57n24IcQh4BD4ceTwL7P6nIs7ErQsCohMV2hiGlKXxZf/MjXxrPBnxJ2K
   QrhCY1iJWq78jRhFvvPd0BhvngCJg/VHOFFmscUM+fvyzYCSMx9Bspzn4
   g==;
X-CSE-ConnectionGUID: aV/7OljtQg2E14w+eB9CXg==
X-CSE-MsgGUID: 6jXMIXWORvS6tMU9Lausug==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="65301988"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="65301988"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 01:57:00 -0800
X-CSE-ConnectionGUID: nV9QVybLSPOQ5gqnnCt3Tg==
X-CSE-MsgGUID: GReuoz1BTvG4EsaBatyvYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="195548827"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.239])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 01:56:57 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 17 Nov 2025 11:56:52 +0200 (EET)
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, linux-hwmon@vger.kernel.org, 
    Hans de Goede <hansg@kernel.org>, 
    Derek John Clark <derekjohn.clark@gmail.com>, 
    =?ISO-8859-15?Q?Joaqu=EDn_Ignacio_Aramend=EDa?= <samsagax@gmail.com>, 
    Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v5 6/6] platform/x86: ayaneo-ec: Add suspend hook
In-Reply-To: <CAGwozwExxbcrTQP5G6cc3sjayiW+crCXTfG4VHi85QrMqFtpBQ@mail.gmail.com>
Message-ID: <054431ff-9bc9-c827-a81b-ee6741fec230@linux.intel.com>
References: <20251113212221.456875-1-lkml@antheas.dev> <20251113212221.456875-7-lkml@antheas.dev> <c329d8c7-1dfd-4168-a267-cc7fcc66aeb7@gmx.de> <CAGwozwExxbcrTQP5G6cc3sjayiW+crCXTfG4VHi85QrMqFtpBQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 16 Nov 2025, Antheas Kapenekakis wrote:

> On Sun, 16 Nov 2025 at 17:05, Armin Wolf <W_Armin@gmx.de> wrote:
> >
> > Am 13.11.25 um 22:22 schrieb Antheas Kapenekakis:
> >
> > > The Ayaneo EC resets after hibernation, losing the charge control state.
> > > Add a small PM hook to restore this state on hibernation resume.
> > >
> > > The fan speed is also lost during hibernation, but since hibernation
> > > failures are common with this class of devices, setting a low fan speed
> > > when the userspace program controlling the fan will potentially not
> > > take over could cause the device to overheat, so it is not restored.
> > >
> > > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > > ---
> > >   drivers/platform/x86/ayaneo-ec.c | 84 +++++++++++++++++++++++++++++++-
> > >   1 file changed, 83 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/platform/x86/ayaneo-ec.c b/drivers/platform/x86/ayaneo-ec.c
> > > index 814f7f028710..3f40429acbd4 100644
> > > --- a/drivers/platform/x86/ayaneo-ec.c
> > > +++ b/drivers/platform/x86/ayaneo-ec.c
> > > @@ -52,6 +52,11 @@ struct ayaneo_ec_platform_data {
> > >       struct platform_device *pdev;
> > >       struct ayaneo_ec_quirk *quirks;
> > >       struct acpi_battery_hook battery_hook;
> > > +
> > > +     // Protects access to restore_pwm
> > > +     struct mutex hwmon_lock;
> > > +     bool restore_charge_limit;
> > > +     bool restore_pwm;
> > >   };
> > >
> > >   static const struct ayaneo_ec_quirk quirk_fan = {
> > > @@ -208,10 +213,16 @@ static int ayaneo_ec_read(struct device *dev, enum hwmon_sensor_types type,
> > >   static int ayaneo_ec_write(struct device *dev, enum hwmon_sensor_types type,
> > >                          u32 attr, int channel, long val)
> > >   {
> > > +     struct ayaneo_ec_platform_data *data = dev_get_drvdata(dev);
> > > +     int ret;
> > > +
> > > +     guard(mutex)(&data->hwmon_lock);
> > > +
> > >       switch (type) {
> > >       case hwmon_pwm:
> > >               switch (attr) {
> > >               case hwmon_pwm_enable:
> > > +                     data->restore_pwm = false;
> > >                       switch (val) {
> > >                       case 1:
> > >                               return ec_write(AYANEO_PWM_ENABLE_REG,
> > > @@ -225,6 +236,17 @@ static int ayaneo_ec_write(struct device *dev, enum hwmon_sensor_types type,
> > >               case hwmon_pwm_input:
> > >                       if (val < 0 || val > 255)
> > >                               return -EINVAL;
> > > +                     if (data->restore_pwm) {
> > > +                             /*
> > > +                              * Defer restoring PWM control to after
> > > +                              * userspace resumes successfully
> > > +                              */
> > > +                             ret = ec_write(AYANEO_PWM_ENABLE_REG,
> > > +                                            AYANEO_PWM_MODE_MANUAL);
> > > +                             if (ret)
> > > +                                     return ret;
> > > +                             data->restore_pwm = false;
> > > +                     }
> > >                       return ec_write(AYANEO_PWM_REG, (val * 100) / 255);
> > >               default:
> > >                       break;
> > > @@ -454,11 +476,14 @@ static int ayaneo_ec_probe(struct platform_device *pdev)
> > >
> > >       data->pdev = pdev;
> > >       data->quirks = dmi_entry->driver_data;
> > > +     ret = devm_mutex_init(&pdev->dev, &data->hwmon_lock);
> > > +     if (ret)
> > > +             return ret;
> > >       platform_set_drvdata(pdev, data);
> > >
> > >       if (data->quirks->has_fan_control) {
> > >               hwdev = devm_hwmon_device_register_with_info(&pdev->dev,
> > > -                     "ayaneo_ec", NULL, &ayaneo_ec_chip_info, NULL);
> > > +                     "ayaneo_ec", data, &ayaneo_ec_chip_info, NULL);
> > >               if (IS_ERR(hwdev))
> > >                       return PTR_ERR(hwdev);
> > >       }
> > > @@ -475,10 +500,67 @@ static int ayaneo_ec_probe(struct platform_device *pdev)
> > >       return 0;
> > >   }
> > >
> > > +static int ayaneo_freeze(struct device *dev)
> > > +{
> > > +     struct platform_device *pdev = to_platform_device(dev);
> > > +     struct ayaneo_ec_platform_data *data = platform_get_drvdata(pdev);
> > > +     int ret;
> > > +     u8 tmp;
> > > +
> > > +     if (data->quirks->has_charge_control) {
> > > +             ret = ec_read(AYANEO_CHARGE_REG, &tmp);
> > > +             if (ret)
> > > +                     return ret;
> > > +
> > > +             data->restore_charge_limit = tmp == AYANEO_CHARGE_VAL_INHIBIT;
> > > +     }
> > > +
> > > +     if (data->quirks->has_fan_control) {
> > > +             ret = ec_read(AYANEO_PWM_ENABLE_REG, &tmp);
> > > +             if (ret)
> > > +                     return ret;
> > > +
> > > +             data->restore_pwm = tmp == AYANEO_PWM_MODE_MANUAL;
> > > +
> > > +             /*
> > > +              * Release the fan when entering hibernation to avoid
> > > +              * overheating if hibernation fails and hangs.
> > > +              */
> > > +             if (data->restore_pwm) {
> > > +                     ret = ec_write(AYANEO_PWM_ENABLE_REG, AYANEO_PWM_MODE_AUTO);
> > > +                     if (ret)
> > > +                             return ret;
> > > +             }
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int ayaneo_restore(struct device *dev)
> > > +{
> > > +     struct platform_device *pdev = to_platform_device(dev);
> > > +     struct ayaneo_ec_platform_data *data = platform_get_drvdata(pdev);
> > > +     int ret;
> > > +
> > > +     if (data->quirks->has_charge_control && data->restore_charge_limit) {
> > > +             ret = ec_write(AYANEO_CHARGE_REG, AYANEO_CHARGE_VAL_INHIBIT);
> > > +             if (ret)
> > > +                     return ret;
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static const struct dev_pm_ops ayaneo_pm_ops = {
> > > +     .freeze = ayaneo_freeze,
> > > +     .restore = ayaneo_restore,
> > > +};
> > > +
> > >   static struct platform_driver ayaneo_platform_driver = {
> > >       .driver = {
> > >               .name = "ayaneo-ec",
> > >               .dev_groups = ayaneo_ec_groups,
> > > +             .pm = &ayaneo_pm_ops,
> >
> > Maybe you should use pm_sleep_ptr() here. With that being fixed:
> 
> True, i conflated that with using a sleep define so I skipped it.
> Seems it is a ternary that checks CONFIG_PM_SLEEP
> 
> @Ilpo lmk if I should resend this before the merge window or it's
> small enough to edit inplace

In general, I prefer new version over having to hand edit things myself.
I might do in-place editing of in patch format on my own volition when 
replying is more effort than editing itself; but if you ask, I'll have to 
reply anyway so it doesn't save even the time needed for writing the 
reply.

Also, this doesn't add any headers despite adding use for struct 
dev_pm_ops so you should likely add an include too.


-- 
 i.

