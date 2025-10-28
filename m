Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41552C159E
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Oct 2025 20:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.248.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761683671; cv=none; b=guVN3OeRvFZPCYxn1Rpu1oVjHEMlKBPsBlxz1oCm0sGDkrzTjzGwWCpm6uFAcEqMGbS4pLCPbolXHtn8COBcyH4Gfxpr82hH/i7Z7PfR6g+zGMEKFDeuW44I+0XbELLp7xpkUjJ3NiDAWqjvAsEHzafvgRFU9/uEeoNLX5MFCrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761683671; c=relaxed/simple;
	bh=lP1JMySSaOrkrxlvyks+CzqMnLTEHqPFTt7BN7Yq6U4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qH4+YmE/EZmTpLWB+MevblO4cIyqX2BPT1OFu0HFNyUTu3RQLoUOdvmbrCZ+DszYM63sEBieEe1Uw+C19S1X4Bf+M/XCVp0JdPXt2Rr7L6nSY2jV2JAoI5eE4kQFeLaYMJrN8BUVRhQXcScYhOemWXSS25T/C6KQ5WkJyQLoxxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=UhfG4kF8; arc=none smtp.client-ip=37.27.248.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="UhfG4kF8"
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id 6A1BB47A9D
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Oct 2025 22:34:25 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id ACBCC47A9A
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Oct 2025 22:34:24 +0200 (EET)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id B3B1C201B83
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Oct 2025 22:34:23 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1761683664;
	bh=1eZsNeIlqtHMe2jEh6Taq9J6j5GFhNsY11RVvPGrfOE=;
	h=Received:From:Subject:To;
	b=UhfG4kF8/5Wk7dAgb0l2ld1ZheO3/KIF7YQVARFySeb2vZuIFAPCPuGQe/qAK/l7a
	 wKPg7W5eNjFT+bvMEY1eeJOYYR2KDB/XeX8yHlGLglL6DDpjMuzRbVkJde3CZMVlBg
	 k90/xd6nN7aYnLVN3AAYymLxjkLSkIHAyjBWKUiQ4vzHAkyKfXnmrTsVZcIzSGFAL+
	 HGeRK0FQxkYmXcdo7MDT8CGTrxW21KAt0rBOS/mkwIXD30Xa/ris5z+cqEWI5xXpAs
	 oPACRwQgrd0RCOshd7lkPWMKQe6WbnsMNWQu4Vn0Yvj9PhP8ddHwrTVdG0KMKQ8uRy
	 gWMAIn44nC+Dw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.170) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f170.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-3717780ea70so83122551fa.1
        for <linux-hwmon@vger.kernel.org>;
 Tue, 28 Oct 2025 13:34:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVtB3GvXmbcCr7YX60fyCDDaWQ8CBKeJ/hYlm70g0JwSOsY/lX5vJljtlOfwjt9GTgF5K6GpivPTG/cPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLKYwz3L1oex8BRuh85SNhtbsJOakzMsgbkvzN2yx9O1pEHmC0
	UsvBMp13l7ReaotTLz61X2jtllBjzOXQZ7Nd0Zb/hIjfTMR5TlheOtM8XVcDoZ/0/qNk5n+Hssv
	HcYUdXrw9ajIe1YwaDJqr6mPQ0dFo4wQ=
X-Google-Smtp-Source: 
 AGHT+IF2yqF6mlPiN9SNEAipIfmFyqoL5vgIrrfJkbCFlR0oTOAkMDiFvUpDmt4Vysz1hqg9tdUCt2kwhANStr9M6VY=
X-Received: by 2002:a2e:a805:0:b0:36d:1f0e:1bda with SMTP id
 38308e7fff4ca-37a05332eb2mr2684141fa.31.1761683663052; Tue, 28 Oct 2025
 13:34:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015084414.1391595-1-lkml@antheas.dev>
 <20251015084414.1391595-7-lkml@antheas.dev>
 <38a49942-58d3-49cf-90d7-1af570918ae5@kernel.org>
In-Reply-To: <38a49942-58d3-49cf-90d7-1af570918ae5@kernel.org>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Tue, 28 Oct 2025 21:34:11 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwEmjms0H=GPbevuOjJfed6x69wmg8E9begBhUKbF8B2AQ@mail.gmail.com>
X-Gm-Features: AWmQ_bkKSM-eXKlhZABfTRgDRS-z1fX7nHyW3tb3O6j8dsJY6QXIm_ZRg0cmXRU
Message-ID: 
 <CAGwozwEmjms0H=GPbevuOjJfed6x69wmg8E9begBhUKbF8B2AQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] platform/x86: ayaneo-ec: Add suspend hook
To: Mario Limonciello <superm1@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176168366420.3799357.9156180315913036435@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Tue, 28 Oct 2025 at 21:26, Mario Limonciello <superm1@kernel.org> wrote:
>
> On 10/15/25 3:44 AM, Antheas Kapenekakis wrote:
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
> >   drivers/platform/x86/ayaneo-ec.c | 42 ++++++++++++++++++++++++++++++++
> >   1 file changed, 42 insertions(+)
> >
> > diff --git a/drivers/platform/x86/ayaneo-ec.c b/drivers/platform/x86/ayaneo-ec.c
> > index 73e9dd39c703..8529f6f8dc69 100644
> > --- a/drivers/platform/x86/ayaneo-ec.c
> > +++ b/drivers/platform/x86/ayaneo-ec.c
> > @@ -37,6 +37,8 @@
> >   #define AYANEO_MODULE_LEFT  BIT(0)
> >   #define AYANEO_MODULE_RIGHT BIT(1)
> >
> > +#define AYANEO_CACHE_LEN     1
> > +
> >   struct ayaneo_ec_quirk {
> >       bool has_fan_control;
> >       bool has_charge_control;
> > @@ -47,6 +49,8 @@ struct ayaneo_ec_platform_data {
> >       struct platform_device *pdev;
> >       struct ayaneo_ec_quirk *quirks;
> >       struct acpi_battery_hook battery_hook;
> > +
> > +     u8 cache[AYANEO_CACHE_LEN];
> >   };
> >
> >   static const struct ayaneo_ec_quirk quirk_fan = {
> > @@ -464,10 +468,48 @@ static int ayaneo_ec_probe(struct platform_device *pdev)
> >       return 0;
> >   }
> >
> > +static int ayaneo_freeze(struct device *dev)
> > +{
> > +     struct platform_device *pdev = to_platform_device(dev);
> > +     struct ayaneo_ec_platform_data *data = platform_get_drvdata(pdev);
> > +     int ret, i = 0;
> > +
> > +     if (data->quirks->has_charge_control) {
> > +             ret = ec_read(AYANEO_CHARGE_REG, &data->cache[i]);
> > +             if (ret)
> > +                     return ret;
> > +             i++;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int ayaneo_thaw(struct device *dev)
> > +{
> > +     struct platform_device *pdev = to_platform_device(dev);
> > +     struct ayaneo_ec_platform_data *data = platform_get_drvdata(pdev);
> > +     int ret, i = 0;
> > +
> > +     if (data->quirks->has_charge_control) {
> > +             ret = ec_write(AYANEO_CHARGE_REG, data->cache[i]);
> > +             if (ret)
> > +                     return ret;
> > +             i++;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct dev_pm_ops ayaneo_pm_ops = {
> > +     .freeze = ayaneo_freeze,
> > +     .thaw = ayaneo_thaw,
> > +};
>
> I think you're misinterpreting the PM callbacks purpose.
>
> If you look at include/linux/pm.h you can see that thaw() is only used
> on the way down (IE when creating the image or the case of errors).
>
> If you want to restore the registers to what they were before a
> hibernation you want to use the restore() or restore_early() callbacks.

Good catch, indeed restore is the correct resume hook. Thaw happens to
work because its part of the resume sequence.

> > +
> >   static struct platform_driver ayaneo_platform_driver = {
> >       .driver = {
> >               .name = "ayaneo-ec",
> >               .dev_groups = ayaneo_ec_groups,
> > +             .pm = &ayaneo_pm_ops,
> >       },
> >       .probe = ayaneo_ec_probe,
> >   };
>
>

