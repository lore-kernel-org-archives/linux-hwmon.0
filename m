Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793607008;
	b=gjicfcaQ+uVMPDaZDSYwBQZxJ4Pt8OO6qojUHx2okYTVjY6n1I6RC7xrI1X23q1aH0Bn
	 lRlzEQjztCQu6f8EA6ixLxb/MizyMhEaWPkuTFKqXGxqxVYcd/rve//3eqktADImbs5dL
	 ZGMt7gizNE0+JI3GPFDY6nuuER28LlwIDBy2XPvCGQix3L/IrAof/yaud70BJjYgw8SWM
	 7GwBhoVOMsQWbgWCJCkRDsTpAbhwgyxJsNlVh+TSefNSTQwIJBGq+DPDVqozI59j6oiST
	 FhMxl4st6wjzpQfYJB6gPeqpV1PVasMj1ujcgLKHieHjfmJRWwuQOe+x/SPg/JZvdAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793607008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FcTfqBsaN6t2MebYu2re2wskSHTcVY4QbT4XDnFus+E=;
	b=UVNl+cjLR1f1YCew4wLh6H2r3bXUUYP8cbBfv3izfRLybVd66pj/8Rl/SXk0m28PGZGh
	 2BlW/qBZAgdfmHZkcu2JMSQOC7+HYS5U/lMfsdxxR2e7Lk8Yx3RJx+QVfVUh5FjZdqRcL
	 Kb0YLOYZaDAzw1SBtDKoQFh4wYgFWSym5aFw8uZgp/2fBMxzSquCgarXRWF1JnNd9FfGF
	 lEAJ5sp3j/KCrkuTi1VKYW7daNCl1lWx/NO7tWng5YEjuhzzG+EMlTI73Zdo5HJ1ePf8A
	 SzmAHFBLbWlE1noThDZGlm4XP1ukF+gBTg4l0tzXUofntdUgk0aXIyAVC7JJnMiQ+PA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p4FNOyBj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3B5606A326
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 08:10:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA3B5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p4FNOyBj
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a0673d9bd2so1559970b3a.3
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Nov 2026 00:10:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793607007; cv=none;
        d=google.com; s=arc-20260327;
        b=f2rO80XoAl9iSAr0Kwc+YE82IArzzg96hNSmmZLC5Ef4wlpsJgCMV2QlN40CfJ4gqV
         m9CYXGbAoyJ42Bm/JYKj+qdYz5AsnoiiE0RUJnxNezae/42gWZ8Mv9kZu8LMHloKveIj
         AuQI5iOwInzOgpQzHhrfK9BBOWo1iyDVW3cSylHYvfOz6ZBrV/PDCn7LTs0by/pP5AtG
         cIwX8CbfaM7hzpXf92LwwEZ+sixIwHlj+LYrW6bgWsoJw5HNDrftu5hsrwlfbR6XiAz5
         75UwNep2HF0yU6lA4nwPdAksrZyLQ0KVNNe2XpRK7ghPaZM/LTuTHDQ6wVGzoKCYi+l9
         wK2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FcTfqBsaN6t2MebYu2re2wskSHTcVY4QbT4XDnFus+E=;
        fh=F8H3IIom5PRil1GSGGhifGvtrSyLvOGvnm7J9FpCHUE=;
        b=LpTjzvDhc1b0uJNe3A9kJfmp6xAxcjcJnBp/ag31jFD7qxiItaETjPyRBCWx0kv375
         HdcmuB+WgY/IwbRCdFqg9DoxqoAGFg8f6HCMHcYLAVGWDDGAIRib9u6i9er1WzbuS4zQ
         L9AHtoT+4EJfhv2OGG7fNisB2rUd08tq+9ZrpPxoAwctb9IwLWZHQQ/ii9Asyjj/aojR
         PxN3dhrJOcIIOBftwHuQil8cgRWxyZ4Iy/w/Y/ULd0ORVqUJNHjAWrGij3vlrtLluW+7
         XNGB9ez+jU2x3iEdzS+NmqUjwLjinkiKRwovszMtPWotcRgw4kLQbBiROW5R473kPfVb
         C0aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793607007; x=1794211807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FcTfqBsaN6t2MebYu2re2wskSHTcVY4QbT4XDnFus+E=;
        b=p4FNOyBj0Xy+fJJyKxN2hKJlTS/NUFXSFZ9wWN6ytYMxlPH1R+O2WEfwU6DQCnCWFx
         /ltFh3DcdIFN6P9QHqqpTYh6AdCdWmYvViCN10+yAq6xARXy3v81g7FqPDdS9RoWVpLg
         9m6AsFhVHqjn7ZLa+Vjg5bjdeJwJhMHuT6y+R2DDHq8eHTSbCuvFVSXPoePYA+rSKNkI
         ewETrYs4YObtfVa3thIBt9Uen2vZlxd/wvwSWO3GT2TXxvxiM3pBC2myLptfgaS/vlrB
         vt6jva+92d8DfbZDcsL2Z97cUqo0gB2IvhPHtCx798C7C/U10+/+C9Q5abukyJMYpYGh
         DqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793607007; x=1794211807;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FcTfqBsaN6t2MebYu2re2wskSHTcVY4QbT4XDnFus+E=;
        b=QYjUySTUiAfOx7ZlM43G80yT/b0f0dV4prbUa0mqF5DmtfvlKPI+AAogMNm73w0vSe
         rJktxYEJPjjvA94+nb/8OknnB8mJYQVTtZUGSOI0YA+SDpeisryk0cCiqRimM718WLYM
         Jo1eHwkWuFtdhSjUTu84VoxrQjpU+MpWxEh62HLXGYVenadRTSpMtUNI91d9SK87CzfU
         85EhB+SaDHPdKsoVZ7tSMrrkyNQz6JApKjMvmybRikiP4AZcXmvoqnK6R9m59PVAspQk
         VQ39b9xON+mVHQ/XpcpqGnfXQGCOb1MvG+azn8gBqulALycIXhZNCZ9D/yKAIgczOW9W
         Gc6A==
X-Forwarded-Encrypted: i=1; AKwUvBw30pRnvfOj8Dk3TRg2FdNszi0+dUF+rzGkrtE/ORrw7ckR7FViZdfLzpYmzqCcdEEVAMBd2WbzL5Rjmw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLqTG8hA/zi0xyK8BsEiOf4jIB0pe3iSJkGLsdUHUsLf5FK0OOm
	9jP/AcE4w7qnfRt8bb+AA1w0qZZ8Xd2kBOICHF6JqYRNVEtN5UDK7GF0NIokOJo89aPzcvYJLmP
	fJcoQwLNvZW4dXPtardMG1X+lg19mZ9e8yuprUUcejhW9
X-Gm-Gg: AYBFou0ZwoWv5pkOfBhU8J+5opKbpWE3wjYr0arMYfoeHBnU9vxAIwY7RkGyvq1GTNX
	oLume8sUHB3usyurHG8u7gqeP1n7DA0G2IDH7Okrlk58OwbImx6Lpcue/KmNXpZVf5somweeArs
	Z5cifPftNZelf/U72hinaepDPeyrIXYLEZ+AF9e6yV5mSQTxD1QlprmNzLlRwkVYCmH2VoAqU+G
	HfoNIKQy+X4A9+LsTC2AWEEzXh60KUm3wZErMlW87/GBmpZF7zrODz7CVxhxCZ9nHGeXTGj6hq8
	mZyI68aoqVlqNN5NHADahPwEf7vopPdqdEs909c8YcgEUZYvkNcCL5ObFk4kxyZH/GuQd81JKk/
	wfJ8p2vUeG4DUWz1e+CscrDXajzbQKhtfz9sJDm1/9DcAxnBxFXkk6Tm5akXW2CI3qexCG8rinA
	==
X-Received: by 2002:a05:6a21:151b:b0:3e2:95fb:8cff with SMTP id
 adf61e73a8af0-3e928a29f19mr6964889637.55.1793607007124; Mon, 02 Nov 2026
 00:10:07 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101223125.302001-1-pmazzini@gmail.com> <20261101223125.302001-6-pmazzini@gmail.com>
 <2c48d47a-85f5-48e8-a675-239b033eb0ce@roeck-us.net>
In-Reply-To: <2c48d47a-85f5-48e8-a675-239b033eb0ce@roeck-us.net>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Mon, 2 Nov 2026 08:09:51 +0000
X-Gm-Features: AclHuK_uNhCSmj6Kes8kZnrjm3LQGfrE3mPbM2X3Be5nMZtPNFD9NVdZZEq_W6w
Message-ID: <CAAxh=jvHthWQb2zi-XKM9ggM3Qi7Ra=QSfCGsVTPk54HexQqHA@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] hwmon: sy7636a: read the temperature only while
 the rails are on
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alistair Francis <alistair@alistair23.me>, Andreas Kemnade <andreas@kemnade.info>, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for looking at it.

Reading the temperature races with the rails being switched on and
off, as Andreas pointed out on v1.

PG only goes high once all rails are up, after the first measurement.
It is also in register 0x07, next to the thermistor readout, so one
short transfer reads both.

Pablo

On Mon, Nov 2, 2026 at 3:35=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 11/1/26 14:31, Pablo Mazzini wrote:
> > The driver enables VCOM at probe, which keeps the panel's high voltage
> > rails on for good, and gets a dummy regulator if it probes before the
> > regulator exists. Read the temperature only while the rails are on, whe=
n
> > the chip samples it, and return -ENODATA otherwise. Read power good wit=
h
> > it in one transfer, so the value can not be from before the first sampl=
e
> > or after the rails went off. Register it under the chip name, as the
> > TPS65185 and FP9931 drivers do.
> >
> > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> > ---
> >   drivers/hwmon/sy7636a-hwmon.c | 25 ++++++++++++++-----------
> >   1 file changed, 14 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/hwmon/sy7636a-hwmon.c b/drivers/hwmon/sy7636a-hwmo=
n.c
> > index f01f368d68e5..475aff997c2d 100644
> > --- a/drivers/hwmon/sy7636a-hwmon.c
> > +++ b/drivers/hwmon/sy7636a-hwmon.c
> > @@ -14,7 +14,6 @@
> >   #include <linux/module.h>
> >   #include <linux/platform_device.h>
> >   #include <linux/regmap.h>
> > -#include <linux/regulator/machine.h>
> >
> >   #include <linux/mfd/sy7636a.h>
> >
> > @@ -22,14 +21,22 @@ static int sy7636a_read(struct device *dev, enum hw=
mon_sensor_types type,
> >                       u32 attr, int channel, long *temp)
> >   {
> >       struct regmap *regmap =3D dev_get_drvdata(dev);
> > -     int ret, reg_val;
> > -
> > -     ret =3D regmap_read(regmap,
> > -                       SY7636A_REG_TERMISTOR_READOUT, &reg_val);
> > +     u8 buf[2];
> > +     int ret;
> > +
> > +     /*
> > +      * Read power good and the thermistor in one transfer: the thermi=
stor is
> > +      * only sampled while the rails are on, and power good comes afte=
r the
> > +      * first sample
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
>
> I had a look at the datasheet. It does not say anything about the
> temperature not being measured when PG is not set.
>
> The datasheet does suggest that temperatures are only measured
> if bit 7 of the operation mode register is set, but that is
> different from the "power good" bit in the fault register.
>
> So why the association with the PG bit and not with the On/Off bit
> of the operation mode register ? That warrants some more explanation.
>
> Thanks,
> Guenter
>   > +   *temp =3D (s8)buf[1] * 1000;
> >
> >       return 0;
> >   }
> > @@ -72,12 +79,8 @@ static int sy7636a_sensor_probe(struct platform_devi=
ce *pdev)
> >       if (!regmap)
> >               return -EPROBE_DEFER;
> >
> > -     err =3D devm_regulator_get_enable(&pdev->dev, "vcom");
> > -     if (err)
> > -             return err;
> > -
> >       hwmon_dev =3D devm_hwmon_device_register_with_info(&pdev->dev,
> > -                                                      "sy7636a_tempera=
ture", regmap,
> > +                                                      "sy7636a", regma=
p,
> >                                                        &sy7636a_chip_in=
fo, NULL);
> >
> >       if (IS_ERR(hwmon_dev)) {
>
