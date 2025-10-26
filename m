Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699C02F6911
	for <linux-hwmon@vger.kernel.org>; Sun, 26 Oct 2025 23:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761520657; cv=none; b=SJa5wz8OCwR63fQqCT2VAJ4NJwBwK18f2EdHGp+G+dIaarOqfNwwsyK47Ves0tTVcKw2srKGSabgrlA2qvh1smw7KCidH4frGE7GxaFIkEVxdMk6mzdYAH7pkudmm9Kjd9DV6Cig7xJakGHsvqi8q7bfmx2tvc4jltU4NOsJ80k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761520657; c=relaxed/simple;
	bh=0Eblrr0rQZHjmoM8FhZsrjb4gQPrP3t6Hlax/MDvvM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VIxT61HOG2jlj6hs2JqPz/vvcj1fcxafy8yfi1EuUZCgSyNN6cZBc2cW1COUxvooUxjsYUSlnsLaSpbUtYFht3JIS7GsCB7BOMw9hebcTAcp95Ok1mgxy9YNuEj1Ix7deDy2LfV/7iXRBhsPHFww8B4w3rgxQrrI9INqEhEgRMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=akD/fzrI; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="akD/fzrI"
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id 49CBE5E538
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Oct 2025 01:17:32 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 19A205E4FC
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Oct 2025 01:17:31 +0200 (EET)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 02F98201878
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Oct 2025 01:17:29 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1761520650;
	bh=NLLhv4W6vg+uqkKQKr1d0rnjNBVPg3Q90Yj6Z1QOohs=;
	h=Received:From:Subject:To;
	b=akD/fzrIwHx9kPNiT9hJy5xBR//ul2C4Iy9J6vYk4rdSgyZP0DwVueld9ehj75j4j
	 ZOYqDwrphAt7d0PtFg4Ln54EW8jBSLQVgxqTXnFH+WBlYUNZjG+TB54eDTG3C31p7+
	 QAG3md9MYPtWBKhV6PeGIkGT3wBYjyI9mR+hlWWDFRQTAFsfOkHtUyDRxt2UTN5bgF
	 o61b0IEx3LIRe/st4VxxWPolJEzb9p+22icVgYwlRdw/trlq16yBc86FsrQMqQeEgz
	 +ZteG9prbvzLI9GQCQEj5MKn+UAuUn8z8oKtzpVW1alCTGI5wIpDVWqcfyySwGQ19o
	 4I4xIpy5HO7aA==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.174) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f174.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-378cfbf83f2so44289571fa.1
        for <linux-hwmon@vger.kernel.org>;
 Sun, 26 Oct 2025 16:17:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUvYvA2atdrqM9vRaJpWSEKhpQeOqZTLWACmHGnqpXWrPoTwRi9UPNPuBIW4hPMcwr4MIAudq5K7y9QTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIUtrMpaRmoTyRQxQYwewzBIsoEtXRky4zvxksn6q8dMAMjmd5
	XrtXeQMY/efVG4RQLyLam6XMZ3MKsF1bRCtu7h3o8miNtBzKa3aSjRi8B2tLaqzDLBhJ4Lve+cF
	gi0WDS8i03KuiIiaZhzmXaLFsQMuXv4w=
X-Google-Smtp-Source: 
 AGHT+IF+hOy1JUlRDSLwAnFSRjjFUusa/46QRrgNSniA7IHw4k4MPNiKsp/8aOC45osMCehRlShRPvXlBfB66NWzQYw=
X-Received: by 2002:a05:651c:438d:20b0:378:d69f:af51 with SMTP id
 38308e7fff4ca-378d69fb29fmr30006271fa.23.1761520649446; Sun, 26 Oct 2025
 16:17:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015084414.1391595-1-lkml@antheas.dev>
 <20251015084414.1391595-7-lkml@antheas.dev>
 <63f0221d-4436-4d1e-a933-8b12f392cac6@gmx.de>
In-Reply-To: <63f0221d-4436-4d1e-a933-8b12f392cac6@gmx.de>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 27 Oct 2025 00:17:18 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwHsFEU1nZNe-7HEv86Oi8VTX=qHO-Tz76uRJVeFTUDv5g@mail.gmail.com>
X-Gm-Features: AWmQ_bkT1BFV1BoAROk7zo1d9f-a5mQkYakihyu3LLTsXKjAjtlTIYIhG0371kA
Message-ID: 
 <CAGwozwHsFEU1nZNe-7HEv86Oi8VTX=qHO-Tz76uRJVeFTUDv5g@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] platform/x86: ayaneo-ec: Add suspend hook
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176152065032.2014696.17020597072739432952@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sun, 26 Oct 2025 at 23:50, Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 15.10.25 um 10:44 schrieb Antheas Kapenekakis:
>
> > The Ayaneo EC resets after hibernation, losing the charge control state.
> > Add a small PM hook to restore this state on hibernation resume.
> >
> > The fan speed is also lost during hibernation, but since hibernation
> > failures are common with this class of devices, setting a low fan speed
> > when the userspace program controlling the fan will potentially not
> > take over could cause the device to overheat, so it is not restored.
>
> I am still not happy with potentially breaking fancontrol on this device.
> Most users expect fancontrol to continue working after hibernation, so not
> restoring the fan speed configuration seems risky to me. Would it be enough
> to warn users about his inside the documentation?

This device features two modes of operation: a factory fan curve
managed by the EC and a fixed speed set via override of the EC.

The factory curve is tuned by the manufacturer to result in safe
operation in all conditions by monitoring the CPU temperature and is
not adjustable.

The fixed speed, on its own when set manually, is not use-able,
because this device has a fluctuating temperature based on workload.
So to meet the varying conditions, its speed would either have to be
set too high, leading to excess noise, or too low, potentially
overheating. Therefore, users of this interface control it via a
userspace program, e.g., hhd, coolercontrol, which allows creating a
custom fan curve based on measurements of temperature sensors.

When entering hibernation, the userspace program that controls the fan
speed is frozen, so the fan remains at its previous speed regardless
of temperature readings and there are no safety checks.

When resuming from hibernation, the EC takes over and monitors the
temperature, so it is safe until the userspace program is thawed. If
we introduce a resume hook, we take over from the EC before the
program is ready, introducing a gap where the device can potentially
overheat. If anything, the freeze hook should remove the fan speed
override instead, because suspend-then-hibernate is more of a
liability for overheating if hibernation hangs.

Other devices feature adjustable EC fan curves (e.g., Lenovo, Asus,
AYN, MSI). Since the EC monitors the temperature there, it is fine to
restore the fan curve. Speaking of, I am having quite a few issues
with MSI Claws, so that series is a bit on the back burner, so I plan
to push these series first.

I will try to tend to this series in the next days. I wanted to push
the Asus stuff first though.


Antheas

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
> > +
> >   static struct platform_driver ayaneo_platform_driver = {
> >       .driver = {
> >               .name = "ayaneo-ec",
> >               .dev_groups = ayaneo_ec_groups,
> > +             .pm = &ayaneo_pm_ops,
>
> Please use pm_sleep_ptr() here.
>
> Thanks,
> Armin Wolf
>
> >       },
> >       .probe = ayaneo_ec_probe,
> >   };
>

