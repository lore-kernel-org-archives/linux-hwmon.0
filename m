Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794152443;
	b=NZUwwZMfg5zRrQAYrmmrOPL/0KDOfRciipL1s+i3W/oQ2dzgpFvTo4yQs9sBYbDSvKM3
	 UC2TlWCw59nzddp32w960vTon5p/l9camqgeCrWGUER0U5NT2dJYIRQ/unmw14NwG4ylW
	 T4EjwsQiY3IY6Z7qi9hnP0bFwXOMNtmETXH9wnkdwTifkMPEZUqvycwwEYibCxpqC/rAp
	 xWFi+BL4CrCZgJdlELlTh30XhDdq7HiTNuorsmM/yv/hMo/XbdmNCXJ9LuO8lJjbxooxm
	 RrzNyTm5SZs9nhdiWnXwiMXCNSPpWpx4T1X8N9/3MLFJws1AKzp328Y02X3nyZbq1ug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794152443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=v1EATUFgAK+e+fvvHz4fQmgc+IG10FBEDWMJovtpAtE=;
	b=kAKrbGp9qUTzMZ7wJgXlL7n0XvCP5QhXU4+aeJGD/tdXYkdPBfbyWzTW56OjRYifzkDt
	 etfmumQcnKS/3PCAahyXMrRPm2kUUn14SU+2QXU5Kav/l4chD3U427NHeSFGtQEOk8TkJ
	 WZQe3o1vwQve+2kkSCn4vc2LXy97FPc8zo6JNzaoHAbxFYpcWElpxvu9QlOdL3UXJ0xTE
	 Ah4olhkl7hPTsaL+vc45zvgYYLQzJKMBYEY+qEEp3phSOdDwWWc00Yz8LCXEc3H59Q/1N
	 n8L/scPnBAlRoLfx0VbLzkoTSlPEy0RfliE5Xe2KWNYD2DNvocptOKaFQqx164X2vEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f4d8fCRx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C55606A31C
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Nov 2026 15:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40C55606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f4d8fCRx
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso46096a91.0
        for <linux-hwmon@vger.kernel.org>; Sun, 08 Nov 2026 07:40:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794152442; cv=none;
        d=google.com; s=arc-20260327;
        b=IfcYmq5qacMgSuw8mAVu3DNjzJazGipvRYOzRMxw5XbMttKq5xhZ1imNEAV8Fn5K1P
         04BfAj2tkt1QcXZyKkr82jqf2BzTgWcgmPysZ9/3LL+eh5uBM5cHKy7sjW1tUWlXhZFm
         95dyyEfh+5kzFCg6ZKolVKkLBt1f8fIZ2AGBb1NBvzfDwkjFUw3YVaqd8ctC85v/zYYK
         HNtXqBdlRUsV54nVGP9U4H5e8YEM/0rNSeI1GfW+UeS8MGwk5YHFX35YdoLnuLZia5Kv
         716szVDt90JgXklquQ0AzeA+Xpb5AzcmpQNbRFwjlQxnbDWOL/RXtvT44pBtaKd9WVcT
         W51A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v1EATUFgAK+e+fvvHz4fQmgc+IG10FBEDWMJovtpAtE=;
        fh=dqzAJQSdTPY4zZdUpZ6xUoPNUK7lrjhnnlSrVz1xD0g=;
        b=FdIlh3FGE8n4/uyocB8yD6FjvU4990vsg3FCE27dcgOzPa4uvjSjVuIqAPhzP5sMeJ
         kE38yPIfdbn2rKBLkQMjyicrgXxNnlCFTloam1FmcF0BFNnf2dtfutJRhKZFOSHnxSYJ
         LUg6aVCC5HseObnFZ6eaSxLtVkdYBV4TNDBakl5RLr1tek4PiL+xIdXE4y7MIu5+xsNR
         KCy+nxN/IKszY/GeaJDnc4wPBNcZcE5XcSea1sUtQfgAk8rFc1n1XccmNhCwTZJPLLBr
         pi2Paza4GjNUubHWmptyhTPj0drrHS4ML+h8pAWtGtPHUQ2qiO/GOdqxQF8nIFcuedQN
         mCLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794152442; x=1794757242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v1EATUFgAK+e+fvvHz4fQmgc+IG10FBEDWMJovtpAtE=;
        b=f4d8fCRxpi6cwES9Gk/2Yb03pjXq2a6QLoF1T/37ngm4ROP168ZaGekdIzUXnEuwiv
         Rs3V0Wux2NOT2kvC/KMM/AFDhbh2G5j0iQDjrABS3HCBcp5iIdMbq4RAJhBNYfuj8UGR
         Df0JiMbOjPg562McP+adCEkbymb94Akrt0sJTuY6hFT/kp6WJfp/p0156zeDgOVU8W4c
         3aqHRunNkNNh7HkDSmaQoElLXoHd9w7lYTgnx8oKIW+sMwax80IcGqoI8Gag69i+FPyn
         lL0ktoMuKh+RBdH6D3Lgq86Ys0JpMiiD1rahWKDigCs+W+j329KxQBvdUMUxffc30/6l
         lBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794152442; x=1794757242;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v1EATUFgAK+e+fvvHz4fQmgc+IG10FBEDWMJovtpAtE=;
        b=0rlQe77sgR8sBxp2PW9n+7kIGoIyzwSlHtF8yGSgxiSWawJoiPVjakHmVvpxjYRPb7
         Ry2GlTWKQpfG6TWK+v1SOdZRAY1YcuZZTN0c2V/yrl3J/8djR/GtZpd+cY2eBAg+Z5Jv
         hnfxqymniaEO3toLiQZ4KuXIcaVEES+Ivxddl4BTA4FGPUwpyeZFw/ksUinbjhkC0bS/
         ueD7VazdfYS2xPNUnMwl6Jp8aXAzxBBrDM6LdKkRGZyDYSfi858X8GCJO9Bq4q7344Sq
         v07JAiIi68vT0qWEMJTmj1CsJXrPqlTXBJyw7Rv6FdEX67gi3enPduHdepT0p/F3wp+C
         SpNw==
X-Forwarded-Encrypted: i=1; AL+hErHUN8LtmTa++UyrcGszxq3fryk9dArcVRRZQHsr5UfZa2Slq59pUPKmyEo36zKKAOOHQkT/lJNgd+sO9A==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Qn/omYlOJhXfD3sdNfdNjYxg/blNYaiihK0oDRcJaEpTaa1EK
	nnfC1EJ7prTdcce85cviABIJREUFB34enfUjade0M90pHMX+LCZ7kr8I2ztbj58/Bb8Ol+FhENS
	EMNk4Yxd8fMYac8EmddYe8ECsovsxbdM+Z5rq/qalCaQI
X-Gm-Gg: AYBFou1fv9HICW8hmEMrG6irFE8QsS5qyEvLmPdza5Cfn1RuoiqEZalaw7qy4jVZhII
	MdnGK39vYKepL89ahXY9anr13lHreucPETvUb9rNffmVUWE5HRTFANkN1vmlFxBxtLH0udmidTU
	tgdL1U5mg3xDmXN/utLZhwplpkPrYMZrjvUQRp92ZFOVMyOKyiRvEVIT8GF8xPTV+B+sDJ9iYQK
	1NepHmwDs9EQVaZU5apitxehzf17ZRzXAzoCCUjMzPJR/V3V1Wp2JILyax0XIP5TYFN5wl5Hm30
	dowxruK5yah+VlT3W6E5eWwxHdlTSnlHsa9wyy6pqqS/ZZPjex+UjZJpgcJY7wZUMkxVCiqkNQR
	80Izn7xp2dEVPOl7k/M+0klN4+vY3WEx7R30iIXMe01zyobn+YEVE
X-Received: by 2002:a17:90b:4b12:b0:3a0:d82b:237b with SMTP id
 98e67ed59e1d1-3b12d4ddfbamr1063419a91.25.1794152442391; Sun, 08 Nov 2026
 07:40:42 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108093602.329554-1-pmazzini@gmail.com> <20261108093602.329554-5-pmazzini@gmail.com>
 <d9035966-07f3-4758-9074-7fb94375c40b@roeck-us.net>
In-Reply-To: <d9035966-07f3-4758-9074-7fb94375c40b@roeck-us.net>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Sun, 8 Nov 2026 15:40:17 +0000
X-Gm-Features: AclHuK9879PTA1ZVJ5Sp0ZQ9MGLxSUczATyJyfWPud5R8IRCfsuM4ujwWYibCJU
Message-ID: <CAAxh=juaE3=oiUS0W4vMTrNW9S-hJ+Z=LxH6aKUktBK32Racbw@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] hwmon: sy7636a: read the temperature only while
 the rails are on
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alistair Francis <alistair@alistair23.me>, Andreas Kemnade <andreas@kemnade.info>, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 2:50 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >     hwmon_dev =3D devm_hwmon_device_register_with_info(&adev->dev,
> > -                                                    "sy7636a_temperatu=
re", regmap,
> > +                                                    "sy7636a", regmap,
>
> This change is neither related to this patch nor necessary. Other drivers=
 (unnecessarily)
> doing the same is not an argument.

Right, I'll drop it in v4.

On Sun, Nov 8, 2026 at 2:50=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On Sun, Nov 08, 2026 at 09:36:01AM +0000, Pablo Mazzini wrote:
> > The driver enables VCOM at probe, which keeps the panel's high voltage
> > rails on for good. Read the temperature only while the rails are on, wh=
en
> > the chip samples it, and return -ENODATA otherwise. Read power good wit=
h
> > it in one transfer, so the value can not be from before the first sampl=
e
> > or after the rails went off. Register it under the chip name, as the
> > TPS65185 and FP9931 drivers do.
> >
> > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> > ---
> >  drivers/hwmon/sy7636a-hwmon.c | 37 +++++++++++++++++++++++------------
> >  1 file changed, 25 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/hwmon/sy7636a-hwmon.c b/drivers/hwmon/sy7636a-hwmo=
n.c
> > index a6b47452e29e..0c0601d47b87 100644
> > --- a/drivers/hwmon/sy7636a-hwmon.c
> > +++ b/drivers/hwmon/sy7636a-hwmon.c
> > @@ -9,26 +9,43 @@
> >   */
> >
> >  #include <linux/auxiliary_bus.h>
> > +#include <linux/bits.h>
> >  #include <linux/err.h>
> >  #include <linux/hwmon.h>
> >  #include <linux/module.h>
> >  #include <linux/regmap.h>
> > -#include <linux/regulator/machine.h>
> >
> > -#define SY7636A_REG_TERMISTOR_READOUT        0x08
> > +#define SY7636A_REG_FAULT_FLAG               0x07
> > +#define SY7636A_FAULT_FLAG_PG                BIT(0)
> >
> >  static int sy7636a_read(struct device *dev, enum hwmon_sensor_types ty=
pe,
> >                       u32 attr, int channel, long *temp)
> >  {
> >       struct regmap *regmap =3D dev_get_drvdata(dev);
> > -     int ret, reg_val;
> > -
> > -     ret =3D regmap_read(regmap,
> > -                       SY7636A_REG_TERMISTOR_READOUT, &reg_val);
> > +     u8 buf[2];
> > +     int ret;
> > +
> > +     /*
> > +      * The thermistor is sampled while ON_OFF is set, but the first s=
ample
> > +      * is only ready after the ADC sampling and conversion time (ADC_=
SPL +
> > +      * ADC_DEL in the datasheet); until then it holds its reset value=
, 0.
> > +      * PG is only set once all rails are up, after the first sample, =
so
> > +      * read it in the same transfer and report the temperature only w=
hile
> > +      * it is set.
> > +      *
> > +      * With ON_OFF set but PG low (rails still ramping up, or a fault=
), no
> > +      * temperature is reported even if one may be available. That is
> > +      * accepted: the display driver reads the temperature only while =
it
> > +      * holds the rails on, after power good.
> > +      */
> > +     ret =3D regmap_bulk_read(regmap, SY7636A_REG_FAULT_FLAG, buf, siz=
eof(buf));
> >       if (ret)
> >               return ret;
> >
> > -     *temp =3D (s8)reg_val * 1000;
> > +     if (!(buf[0] & SY7636A_FAULT_FLAG_PG))
> > +             return -ENODATA;
> > +
> > +     *temp =3D (s8)buf[1] * 1000;
> >
> >       return 0;
> >  }
> > @@ -72,12 +89,8 @@ static int sy7636a_sensor_probe(struct auxiliary_dev=
ice *adev,
> >       if (!regmap)
> >               return -ENODEV;
> >
> > -     err =3D devm_regulator_get_enable(&adev->dev, "vcom");
> > -     if (err)
> > -             return err;
> > -
> >       hwmon_dev =3D devm_hwmon_device_register_with_info(&adev->dev,
> > -                                                      "sy7636a_tempera=
ture", regmap,
> > +                                                      "sy7636a", regma=
p,
>
> This change is neither related to this patch nor necessary. Other drivers=
 (unnecessarily)
> doing the same is not an argument.
>
> Guenter
>
> >                                                        &sy7636a_chip_in=
fo, NULL);
> >
> >       if (IS_ERR(hwmon_dev)) {
