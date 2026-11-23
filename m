Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795467932;
	b=HCdc+Ra2N3yCELtCfj6egssO2HOfV7g5JpYt+dnqj6yOR1gpQSMi3SoC21FmWppKXQiz
	 sj1CVwbQUk5Wp1X/afgunHk6ONNafAqngh4j5ZlW7CoWYCZuM3hK9YrUaiCrbryiMUQnA
	 8zOIcBgKBEHlwaFiHVTromwC4+pHm7NTa8zYb3M3eQ5VaiQ3o5GJZNTTNsLtiVx+M1ZI9
	 LtqJIWuaoAjSnKNTF2QkGyjc0xJrTzYPRK/a3lPJVU0pqgVo8Y7JiN0SUIeFiEJU+mzuy
	 eF5YlRqywq6vls0PQr3Sb65lxR25Hy5qqGx0g1kW/yOgnxraOOYxjbPLT2Xn0LXfy9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VtSta76K0DhmEm+a+Fx+3wCOoe6ARhPuKaUdQkwi8Y8=;
	b=R1NVstQ4mJDZ1pD3Z1KLDxLxpSaoqR4XfSmXconZvQYLernPJux2BxP2NpwmpDMdAC43
	 z2zbETdd6+qQshdVUakByzYr7qCiXnJH5Gp0ZbFksVVpVYgZMDockcmIoZxiSICgocKn2
	 OST8H822cPHo+ha/8n2V+tzzrzkqst5JxdZ16SkGf5hRmajS2njPwXfYr96TDcs183KWT
	 dHSmbGgKqI8bfCcxWeXX4ovzMDPWdQLrZWWfLXd0rp2dPYai7NZm558uT2RU21MnDslfF
	 hDRdTsc8Hw9lGWcWchT9GaXqRiC+Mm8q5aSXzlSScR9Ri3Jb55mtwu5zBp7N/3U0pJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zGGalddF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66268606A32A
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 21:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66268606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zGGalddF
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso1991537a91.2
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 13:05:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795467931; cv=none;
        d=google.com; s=arc-20260327;
        b=Y/P/xb0XtQEnUAjsbQYTWQTzaUeB86iEZY8Gzkdba2Ez81V+63pQlG7XAGTfE2/FLm
         rUwmj6O6COd+TGfv4IT+q97gzgRGHGJFmEK3l140hjFgquS3TkCsDWk/Yzc5r4v+2iJE
         pkbZKOK/r/k8D1PMUuLCJF/MV80MU0zbYtgJuQ9VoenGtPynKjrYKUkpu2i+dJ2b4PeJ
         P939AClgFngLa7wUumVIrO4I7/lpqxyCt4MS7O8jxraLhVY7mgqCP3JOa3FJa1Y5MlIV
         UeyR9vHRA2xja50tq1a9zBNVCjaLeKTr1h3cWVrcbbbV/uTib72WO8cASTdNEUVKk3Of
         Epjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VtSta76K0DhmEm+a+Fx+3wCOoe6ARhPuKaUdQkwi8Y8=;
        fh=87FSxxMM38dH4zwPaRcV/2g6JPqYY7DlKHGO28EQOGw=;
        b=EfZorL4K3bYh7BlyzXeBcRFjq9pjJUDFDeRPbKK+bn8oF+s2eFmYUa1o7qj+Gx6QdM
         54d5fdWeDyiHRysWQ/A0v7aAsCF+TYQ6LtFObOXX1ote+1FhonFpsZCxIsul3htEcyNA
         igBmi0/tJrS8XVJeIDuhNDhHw6DWt7w4zNxXGEmtteAfROavrQylAkN0RTX7ReKhY/Mq
         4ODvE/ynAAdKdMF3sFNzM/B8dS4HVoCENK33p5y9MzYgM91el+NQhaGdaqyAUisNy/qf
         QpjkiO3jExERDo++E9Rf2tktuWB8yYIY0MZsPYkg6V6CqTR6VtuMaUqW/phDJWVjXDyF
         Neiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795467931; x=1796072731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VtSta76K0DhmEm+a+Fx+3wCOoe6ARhPuKaUdQkwi8Y8=;
        b=zGGalddFvYP7BCevKmOSQIJR0BADVJZWfKfoCqHYdUCKUn7eO7sv/DcYTsqsAHNFt9
         oIM7jtIFQ4TutDk8AvY87WO5fMbo8nsnkNJZmnrxJrVPulsxru1XJ4h11yLAS4V1/SI7
         93YYrOiYE1uENsPTMYacIYdTeCQjy8hM5ntNhFjroGihGWvSDLoeVnJTaPligx8LxQam
         tkBL6PMk3tpnh9pRnIrAN78diJDZybSsCdlyCLoqcz9cukcJm3c4S8A5uBrceMe3nO6S
         RGZI4kvCf+ZHMxzE0azXEQOPZ1Ys7uri6rAtPHlM4GQb0+P8BhhK6cNLwYS5qvwlvqEi
         k2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467931; x=1796072731;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtSta76K0DhmEm+a+Fx+3wCOoe6ARhPuKaUdQkwi8Y8=;
        b=Bq9NYNDoW40FzaExS9Rx6LkzKjlTOT6WsRKW537PYm+kHH+MpVvO7bRRjoeT4+NT/X
         uF6/x0Rixh62ho7O/hzWI6KwOi+XahHxLjxaAJlb7b4jjnSjddTs/0WA9EgXSDd06zZo
         hRFlazlW38Fx0ULMpYbA6wRPm8eTaqTmZ9RTQQuAsKE5HU9ddcgOeRVHul7CrSqsNAqG
         vcYgjr6Oy+/+7uXqFnM7Hn7GaI6ctlJcoY4vd7PPJ8HWjdzG7a6MKNQ9EAC9gzWipqid
         xo0uHuTi7rMjJ3HvTRcqbkjlnkh4g28iax90n4IM+eDrLZq3wdVfeyV4KB5qWT1Tvo6+
         9ANQ==
X-Forwarded-Encrypted: i=1; AL+hErF2QkjRp5IkT/8PZ8Y/SuayTrC3XrFf2OW8Q1KlUWMxPElq0c9P9l+sfSzLW0IF5KxbsTOZwWYiPesHAg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/iaNXkbdgs8gIrLt2DfnQvWMk/soAwARG61Rf53Bo1ybz4sfjE
	9MZHDh/yTbp19G5pHkULRV5N+smfZ37rH25jNbVPpa3W8p3NYOGGJcxYtDrLuig4+77CvMN2VuR
	DM+1uM4A0KUy3WOojmO4nz55iB4qjG7w=
X-Gm-Gg: AZFdTZc0GJcs1ERPn8tpUlqc6u5FhC57oAjipqvPSR9Sr/7rmyLdItOygQtPrvh4H5c
	t20CanlZXocCifUEim0PzCG8rFQz1fiTtyvvtoTvPxlgFGf54PwlqRPzRPihyJCqC9e4e5EwHO1
	dLj5OrFc0BNNU+TfOxX3pcmefchCWRCMieM+cZ8+TUls1TD8OSQ3shVfGp3FOZQ48NIUSwc7mby
	SAUo8dQL2Zs9PnWnJMrq6VJ7ryf5zUPnKP/mvH5Mjlx8vz0fvwXbn1Q97bSePunHA8XaUtUQBy8
	3bsiZRN+vC+qls8SCvFRJDLuuuMC4BL9nZmiW5VocfrKdWfkJNEiedSY35buQgqCwbrvmjWlxN3
	Y/kIZEh2qeOTZnSw2UMWXtkXXQuE9Rvz3LiHusKIrx+iQuINsuMom
X-Received: by 2002:a17:90b:2b50:b0:3b0:9a1b:b708 with SMTP id
 98e67ed59e1d1-3b41c98245cmr11402649a91.62.1795467930592; Mon, 23 Nov 2026
 13:05:30 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112205228.42630-1-pmazzini@gmail.com> <20261112205228.42630-2-pmazzini@gmail.com>
 <9bd10826-7684-462a-808b-91b72c9d5689@roeck-us.net> <awSmYnfbVnjnSwNB@lizhi-Precision-Tower-5810>
In-Reply-To: <awSmYnfbVnjnSwNB@lizhi-Precision-Tower-5810>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Mon, 23 Nov 2026 21:04:47 +0000
X-Gm-Features: Aa3M54rQKL8p1RMTDp94rq8cRMTWaP5id1ZTML445APcrBI-bARIJu24uS0qbcg
Message-ID: <CAAxh=juHWgAnDTBiu0oM7TEpGxMV7LoK9wnHqbfXPGPpJx0VKg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] hwmon: sy7636a: read the temperature only while
 the rails are on
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Alistair Francis <alistair@alistair23.me>, 
	Andreas Kemnade <andreas@kemnade.info>, Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 03:47:30PM -0500, Frank Li wrote:
> Do you meand depend on CONFIG_MFD_SY7636A=3Dy

Hi Frank,

2/2 depends on 5f828ac25ef9 ("regulator: sy7636a: bind to the I2C
device directly") in Mark's regulator for-7.5, which removes
MFD_SY7636A.

Thanks,
Pablo

On Mon, Nov 23, 2026 at 8:47=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Sat, Nov 14, 2026 at 08:33:47AM -0800, Guenter Roeck wrote:
> > On Thu, Nov 12, 2026 at 08:52:27PM +0000, Pablo Mazzini wrote:
> > > The driver enables VCOM at probe, which keeps the panel's high voltag=
e
> > > rails on for good. Read the temperature only while the rails are on, =
when
> > > the chip samples it, and return -ENODATA otherwise. Read power good w=
ith
> > > it in one transfer, so the value can not be from before the first sam=
ple
> > > or after the rails went off.
> > >
> > > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> >
> > This patch depends on the rest of the patch series, so I can not apply =
it
> > to a hwmon branch. Assuming it will be applied to some other branch,
>
> Guenter:
>
> Do you meand depend on CONFIG_MFD_SY7636A=3Dy
> https://lore.kernel.org/all/20261112205228.42630-3-pmazzini@gmail.com/
>
> Frank
>
> >
> > Acked-by: Guenter Roeck <linux@roeck-us.net>
> >
> > Thanks,
> > Guenter
> >
> > > ---
> > >  drivers/hwmon/sy7636a-hwmon.c | 35 ++++++++++++++++++++++++---------=
--
> > >  1 file changed, 24 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/drivers/hwmon/sy7636a-hwmon.c b/drivers/hwmon/sy7636a-hw=
mon.c
> > > index a0d0b4119bb3..a8bfbf1716a1 100644
> > > --- a/drivers/hwmon/sy7636a-hwmon.c
> > > +++ b/drivers/hwmon/sy7636a-hwmon.c
> > > @@ -9,26 +9,43 @@
> > >   */
> > >
> > >  #include <linux/auxiliary_bus.h>
> > > +#include <linux/bits.h>
> > >  #include <linux/err.h>
> > >  #include <linux/hwmon.h>
> > >  #include <linux/module.h>
> > >  #include <linux/regmap.h>
> > > -#include <linux/regulator/machine.h>
> > >
> > > -#define SY7636A_REG_TERMISTOR_READOUT      0x08
> > > +#define SY7636A_REG_FAULT_FLAG             0x07
> > > +#define SY7636A_FAULT_FLAG_PG              BIT(0)
> > >
> > >  static int sy7636a_read(struct device *dev, enum hwmon_sensor_types =
type,
> > >                     u32 attr, int channel, long *temp)
> > >  {
> > >     struct regmap *regmap =3D dev_get_drvdata(dev);
> > > -   int ret, reg_val;
> > > -
> > > -   ret =3D regmap_read(regmap,
> > > -                     SY7636A_REG_TERMISTOR_READOUT, &reg_val);
> > > +   u8 buf[2];
> > > +   int ret;
> > > +
> > > +   /*
> > > +    * The thermistor is sampled while ON_OFF is set, but the first s=
ample
> > > +    * is only ready after the ADC sampling and conversion time (ADC_=
SPL +
> > > +    * ADC_DEL in the datasheet); until then it holds its reset value=
, 0.
> > > +    * PG is only set once all rails are up, after the first sample, =
so
> > > +    * read it in the same transfer and report the temperature only w=
hile
> > > +    * it is set.
> > > +    *
> > > +    * With ON_OFF set but PG low (rails still ramping up, or a fault=
), no
> > > +    * temperature is reported even if one may be available. That is
> > > +    * accepted: the display driver reads the temperature only while =
it
> > > +    * holds the rails on, after power good.
> > > +    */
> > > +   ret =3D regmap_bulk_read(regmap, SY7636A_REG_FAULT_FLAG, buf, siz=
eof(buf));
> > >     if (ret)
> > >             return ret;
> > >
> > > -   *temp =3D reg_val * 1000;
> > > +   if (!(buf[0] & SY7636A_FAULT_FLAG_PG))
> > > +           return -ENODATA;
> > > +
> > > +   *temp =3D (s8)buf[1] * 1000;
> > >
> > >     return 0;
> > >  }
> > > @@ -72,10 +89,6 @@ static int sy7636a_sensor_probe(struct auxiliary_d=
evice *adev,
> > >     if (!regmap)
> > >             return -ENODEV;
> > >
> > > -   err =3D devm_regulator_get_enable(&adev->dev, "vcom");
> > > -   if (err)
> > > -           return err;
> > > -
> > >     hwmon_dev =3D devm_hwmon_device_register_with_info(&adev->dev,
> > >                                                      "sy7636a_tempera=
ture", regmap,
> > >                                                      &sy7636a_chip_in=
fo, NULL);
