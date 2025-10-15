Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18248316183
	for <linux-hwmon@vger.kernel.org>; Wed, 15 Oct 2025 09:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760519834; cv=none; b=HaG2n5/0SN1zYce3cwGHgHE7XzdZOZj1rh3UqYkShjQlaaV/bnj0mfMwo6UfIW7A9eGxvEChVQfCpFIYpiMOSW0++vKB96KKTCETioBtIxXYixW7QoqMpxtVpt1flPfsJsJh4shW4WoNUPHB3SUVkdnz7ud7hC1hTwKaHB9dt/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760519834; c=relaxed/simple;
	bh=BbgK//hwlyr8zf1tpJICvPbrydkFnJrCzjJqBw0CBhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NtxxIFY5FfRdt8A2vsHPDUrFtHnPEBxIoE/ijHMIEmdYpwCgk0oIREfRrMvgzD8UE8d6ZpOKNuN4AAhQM1LLyqSAOjmLm5FP6ith3Tyq/IzrmW84QauzyXcFkyKrGqwPaJcCZe2Ky5gKViKE2GWp2n2VuFqSfuto4G35MOmujuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=kfH0VBA7; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="kfH0VBA7"
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id 85093C7049
	for <linux-hwmon@vger.kernel.org>; Wed, 15 Oct 2025 12:17:08 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id C9814C7038
	for <linux-hwmon@vger.kernel.org>; Wed, 15 Oct 2025 12:17:07 +0300 (EEST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 182B3200B9D
	for <linux-hwmon@vger.kernel.org>; Wed, 15 Oct 2025 12:17:07 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1760519827;
	bh=C0F8O8OZo2bWBfgr1SJOmX/dH9/bfIl26RPPqESx0EY=;
	h=Received:From:Subject:To;
	b=kfH0VBA7O9/mEg04Sv+zyraS0hxSAOpetfKaBlPOEQgwxTVApdLotx5RXqkDBZQdk
	 onD26dQ0xf7+hjd5WJux2eLcBxLXnC5n2+geZKisDTd2JbCzjVVXWERsnD19zgyabp
	 E2FLEmzCYw5k0FIX/IytFDhSlKUGCOpqV/8vbbJwKm/UnKKVMWvEqtlFeFWJVjtt8I
	 7Tqc9SpLhj4c90Fgu18L2mYWaL8nqW8RqtVNOk+y6fj6nwvHIW1tKVkFBPvwdrvKgH
	 MjuClFZ2JD3oyQRButX2JNEd0sNG0G+c2qqtI+5ZbSBDkZgiJRsDddaYt8B61zk15l
	 uQFiOpHtEvSJw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.171) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f171.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-36527ac0750so52995261fa.3
        for <linux-hwmon@vger.kernel.org>;
 Wed, 15 Oct 2025 02:17:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVGVWOZa+sWeVDAT8sx7BzNyX8DDgaCTpYBuCg/eYvPGmwA55xoqkyJIW5Ry/xMJktsxwQlQaem4SpdQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0WmGvvFlfqpEes0it9ZSJUkrMUCSyrxqaF64BQ0j9JygNvxW0
	z3Sd86x5dNvFgJ55gWU37pCywAMw/wsRPapIFgPsHUSgYvoHEJkcD1C+rkCb659VP4aV5a02/Xq
	GQwH5XI6IQUTFyvUSghf3/IfN6UwQJxY=
X-Google-Smtp-Source: 
 AGHT+IGl3UWVJ+CA/0GtuT6iRgW30haNCjgI/9v0CtcqqMSu1p+I2OodAmJFPkdTjJOLIuOaPpsRutFjsSa1yNSJfy8=
X-Received: by 2002:a05:651c:438c:20b0:376:455c:17f9 with SMTP id
 38308e7fff4ca-376455c1baamr35791021fa.48.1760519826563; Wed, 15 Oct 2025
 02:17:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015084414.1391595-1-lkml@antheas.dev>
 <20251015084414.1391595-7-lkml@antheas.dev>
 <de1f9cd3-183e-7b01-72aa-23fa4d30334e@linux.intel.com>
In-Reply-To: <de1f9cd3-183e-7b01-72aa-23fa4d30334e@linux.intel.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 15 Oct 2025 11:16:53 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwHsMErRA+eDSCH+3XU6Q4Up7qTSqJ5y29-SdP0aMErUTg@mail.gmail.com>
X-Gm-Features: AS18NWDQYQFa2ndXF6O_xFGQCI8NwCpzxBFp9glkhl6kR4sG8KXPxg4L4HsN1VE
Message-ID: 
 <CAGwozwHsMErRA+eDSCH+3XU6Q4Up7qTSqJ5y29-SdP0aMErUTg@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] platform/x86: ayaneo-ec: Add suspend hook
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	linux-hwmon@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
	Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176051982738.1073724.2136797207058618835@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Wed, 15 Oct 2025 at 11:11, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Wed, 15 Oct 2025, Antheas Kapenekakis wrote:
>
> > The Ayaneo EC resets after hibernation, losing the charge control state=
.
> > Add a small PM hook to restore this state on hibernation resume.
> >
> > The fan speed is also lost during hibernation, but since hibernation
> > failures are common with this class of devices, setting a low fan speed
> > when the userspace program controlling the fan will potentially not
> > take over could cause the device to overheat, so it is not restored.
> >
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >  drivers/platform/x86/ayaneo-ec.c | 42 ++++++++++++++++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> >
> > diff --git a/drivers/platform/x86/ayaneo-ec.c b/drivers/platform/x86/ay=
aneo-ec.c
> > index 73e9dd39c703..8529f6f8dc69 100644
> > --- a/drivers/platform/x86/ayaneo-ec.c
> > +++ b/drivers/platform/x86/ayaneo-ec.c
> > @@ -37,6 +37,8 @@
> >  #define AYANEO_MODULE_LEFT   BIT(0)
> >  #define AYANEO_MODULE_RIGHT  BIT(1)
> >
> > +#define AYANEO_CACHE_LEN     1
> > +
> >  struct ayaneo_ec_quirk {
> >       bool has_fan_control;
> >       bool has_charge_control;
> > @@ -47,6 +49,8 @@ struct ayaneo_ec_platform_data {
> >       struct platform_device *pdev;
> >       struct ayaneo_ec_quirk *quirks;
> >       struct acpi_battery_hook battery_hook;
> > +
> > +     u8 cache[AYANEO_CACHE_LEN];
> >  };
> >
> >  static const struct ayaneo_ec_quirk quirk_fan =3D {
> > @@ -464,10 +468,48 @@ static int ayaneo_ec_probe(struct platform_device=
 *pdev)
> >       return 0;
> >  }
> >
> > +static int ayaneo_freeze(struct device *dev)
> > +{
> > +     struct platform_device *pdev =3D to_platform_device(dev);
> > +     struct ayaneo_ec_platform_data *data =3D platform_get_drvdata(pde=
v);
> > +     int ret, i =3D 0;
> > +
> > +     if (data->quirks->has_charge_control) {
> > +             ret =3D ec_read(AYANEO_CHARGE_REG, &data->cache[i]);
> > +             if (ret)
> > +                     return ret;
> > +             i++;
>
> What is this for?

Adding additional registers to restore. Currently, there is only one
so it looks out of place.

> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int ayaneo_thaw(struct device *dev)
> > +{
> > +     struct platform_device *pdev =3D to_platform_device(dev);
> > +     struct ayaneo_ec_platform_data *data =3D platform_get_drvdata(pde=
v);
> > +     int ret, i =3D 0;
> > +
> > +     if (data->quirks->has_charge_control) {
> > +             ret =3D ec_write(AYANEO_CHARGE_REG, data->cache[i]);
> > +             if (ret)
> > +                     return ret;
> > +             i++;
>
> Same question here.
>
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct dev_pm_ops ayaneo_pm_ops =3D {
> > +     .freeze =3D ayaneo_freeze,
> > +     .thaw =3D ayaneo_thaw,
> > +};
> > +
> >  static struct platform_driver ayaneo_platform_driver =3D {
> >       .driver =3D {
> >               .name =3D "ayaneo-ec",
> >               .dev_groups =3D ayaneo_ec_groups,
> > +             .pm =3D &ayaneo_pm_ops,
> >       },
> >       .probe =3D ayaneo_ec_probe,
> >  };
> >
>
> --
>  i.
>
>

