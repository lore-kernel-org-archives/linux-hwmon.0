Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793575158;
	b=WmBSKAt0sv1l5/Yu+reHKh2CzIfvchkXsrpplL7r8nErJ/3kA6ORdxCr3WIhgi+cY684
	 XXdmhFjmP5TOM6Y7QCS7DvW4p1ztxj1kqJxjMWPLx5AYsRoY6CHkszCsgpmyjxqQHVXnI
	 9iMc33o4lmLpHj4tLCt8v4m5plo2YKrJ0DZedrprn1uW3lBcG71Blxx4yo4qJ8qi//Wh0
	 05TXG/+FTDIUA+MTEYUa5VkEdGkW4It0sAykXDkmfPuI7IyqC+uRTpCj7oOd5RYdtOdWW
	 8nzVvPylcwt43CGbRmX16ZBl0UdIvtz8sCii2sbKYUMexJRm0F2lPTcKhqrOottJU0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575158;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=OgokyJgZPmoFvmekackCrMWks/pVfhNUcYrltTftkwI=;
	b=AOTYaTNX8sMgZ5wfYi194Ze7UvBdaIwbT+p9+SLux8cWXABiUzOEX/Wp+fFuZ3wij5Hk
	 enJZE6RUVMyIkXmSE+a7Tm4IfUDSrXfHeMbtTY5JE2BublDmHkcQqMYBKKj5AH2otcZA1
	 PUjfB/0J//n62ee4lm/4UhthoFJ7Z8ivfAA3fOHc3Uf++jM07Yx9P/vjGjHPgdzgTmrfO
	 XjQYjuOM2u8pmp0+41SYnjDrc4bGJqteyIlHOTXj4AL3FWdT0PIPqMQa57G6ceC7jLAhK
	 dABPKs2akt/lBeY2dtyvWjcdKRyB1TxKAJd1NfhM79nZXOJJ7jl1oe+RR6sTuMc8nfw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="OXHyd/vG";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72CD606A324
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Nov 2026 23:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D72CD606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OXHyd/vG
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd623dfe420so1789311a12.0
        for <linux-hwmon@vger.kernel.org>; Sun, 01 Nov 2026 15:19:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793575157; cv=none;
        d=google.com; s=arc-20260327;
        b=GGL/GdWWwHTwLWxE6lWSzhX6tEEz2BacQVU5lAzDKCB0IVYYPkLhebukhXDt6UdCuA
         I5Ds0Jl6y9nGhPdTMdX9fSNx5cBADXxZHSyW3iEJ5OV2f/i7koxBUFPW8FRr/V1QBN2J
         Zw0B4jsuf4dae0UuCppUXoqiAdqKstt/ZYPPWUMUyEKfub7hf6pBmMFavkyPQuAvvLT3
         hAzHDqTI0DV9NMDKz6IW2BRlU1tzV0A86PwIQ7ZiTCC95FWwGomNdpSdGv1BxWKRaM/s
         TMekIZAWcWVbd2zFxsElM9KsxUYJdZ4KnNfnizAMyIsFu1OMM5H8LuzbIgRR4MW2dflQ
         WGIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OgokyJgZPmoFvmekackCrMWks/pVfhNUcYrltTftkwI=;
        fh=1TxlMDGQ2pTmQhHhXYNbkcySwtRdUtpr5cT0QIkERW8=;
        b=PCPmHktfP1Cl5i+jX/O5P6eQQ0WuLHIKc4d01Sqaf4V8VBybzCFA/dRaNyc7GKNlJs
         2jQarxkoTIJP4e1nIidBFizE0mR8c/hIwViT85ZWTDVICKDDE5OLkajzdilJPHHpnpPf
         o5Y6rATKLa8W5IsLvXo+wFZGyrkxQWmUDy+AhqGicPvrwi88+0ZrMz6v69jSCQAuXGtZ
         hYwgat2jej6JtBTwfrkd/mXDjCmejuKzwQtnRL/fo4dkPwEHTGtzGytOiiK5dRk5qEdl
         jXaRBwjtBJY8FC9QtN0W1tvdVXo3OnavbcgjTbemNqXonSPR1klhU7VZQtNkhDWoCHWG
         WTJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793575157; x=1794179957; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OgokyJgZPmoFvmekackCrMWks/pVfhNUcYrltTftkwI=;
        b=OXHyd/vGnIfgmvSFHADK+RlniQufcjFzY6YiuxpVoLBM2DWxg3RSSuWOfz6YMluEYK
         P8VZ4tD66yFJNlf11v6V9J2ZML+oVibTmqVntBCAWwOlHVEAvm7CcWv0n8T9FW7c3694
         mPdHQzwEe7gKj7aNcObAw/0fqGl7LASVaqhMxHYRUgVrDOcSTLLPFAERB4ErPSRr4EBA
         EBU1ynLk3xBNbm2IGvjOo0tNFdGI7wCypEZ2dSmDaFbf1lyqo1ujKSinTNPb8WLLdzEe
         72imA/TQiUApLWgGltel5+tAcGBpqhOuZOkHKAbylQWqZFJJ0uB4GzrUP0lXmf/PXTcS
         WANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793575157; x=1794179957;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OgokyJgZPmoFvmekackCrMWks/pVfhNUcYrltTftkwI=;
        b=wJ9F9px1B0S2bJYxNRkOlm9kHPhsD15/Jw5iSuUOWx8JXLit79+7pT1RFymJCNRj7K
         53SMzGwNflcTC53HiqL7gE6ZpQsfzxvsXJLqEqdQ+dEJLP7MepyJ4ViaIw3dDGlHXuH8
         /HhK9j8mH+/BfIEwNk8RCie1Nu3u+Q8SXv5v9wxtFMZufeCw8Ehw/GgBcP/+HYnkos/S
         PFfLNqW0Bkvz55Bx4nIBElA4Q+WjG8RFBFYhyIhxNhtX0XxHIn2clxOa/jjGje0ltj9Q
         T/U6T3i0L0hqTKCUe/86xTV1ITVumVHpQlFTS25/3ud79H+grjvO8SUqmk8xlzo/Hsi2
         PZWA==
X-Gm-Message-State: APuU4Z818auCkjfLheYQA4smvLlLag5i8/1eRz5FPSzpIQDFxTekKASY
	aF6KpkWeXs/+Ofm6P3K4gCXCT7ZbNqh3LsXPhlA9XTtxluVi05qjvgN+zOCV2Yv7N3Jo6H+rehp
	k5+piiR/0PP6bwoFnLb0WLHbXyrqkL21SWL5W8U9hDQe/
X-Gm-Gg: AYBFou0fVjkCBX+Du2Gh4SDwgueQhkT/PJCL4sEGYrQv0pmzgSfiK9gALWVDJ8c7oEK
	Xudcju0vFBHHCZhmOBN7+UeA+Gsc5XWbYVZFeWjiZOFveCwWvd/deAmREhrYFO8Dik6FNyMt9Mi
	D+aZ7dl6ZGawuJiNeWqFP7kPwZRM+i8GQQDAbazOIgDTx7fk9JcyqkEU5uvfXfJKDaP18PZlPnX
	tIEiI+eSiYtvPrFwqaTqlnvjWCLSjjIXB1WuduQjN9ofspuhwaAtcXufPs2pNi4VbrUu/NBzbo7
	LId1VTFW8C7XvwBMKcxugS609qFbh3vglZtLLDyBv0nzSq/AWne20JH/9Rv0KCKG0UTlGL64D4m
	HnoyiAqsphIEoPfpD4f2tLtOJq+qeKKx6kbf/jPGhCtjwolAEFA4d
X-Received: by 2002:a17:90b:180d:b0:3ac:a204:aa27 with SMTP id
 98e67ed59e1d1-3ae8985edbfmr7252728a91.66.1793575157168; Sun, 01 Nov 2026
 15:19:17 -0800 (PST)
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
 <sashiko-outbox-192738@kernel.org>
In-Reply-To: <sashiko-outbox-192738@kernel.org>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Sun, 1 Nov 2026 23:19:02 +0000
X-Gm-Features: AclHuK9xi2Gx2yZNeMpyMDXsD4VBMsSeY1I24W_gI-TNXeinEzyyjVyZpY76rRE
Message-ID: <CAAxh=jt4UV3iUkXYq9bnB7k8uayD1t4+BPdO4q+dAQM8tdeh_w@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] hwmon: sy7636a: read the temperature only while
 the rails are on
To: andreas@kemnade.info
Cc: linux-hwmon@vger.kernel.org, linux@roeck-us.net, alistair@alistair23.me, 
	sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Right. On the reMarkable 2 nothing in mainline turns the rails on.
Keeping the rails on is out, so I would drop the epd-thermal zone from
imx7d-remarkable2.dts in v3.

Andreas, is that OK with you, or would you prefer something else?

On Sun, Nov 1, 2026 at 10:51=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] hwmon: sy7636a: returning -ENODATA when rails are off disables t=
hermal zone
> --
>
> commit 72fc8d76dc4f0fe2ee1ec4e02805a6f20803ef65
> Author: Pablo Mazzini <pmazzini@gmail.com>
>
> hwmon: sy7636a: read the temperature only while the rails are on
>
> This commit stops enabling the VCOM regulator at probe, registers the hwm=
on
> device under the chip name "sy7636a", and reads the fault flag alongside =
the
> thermistor in a single bulk transfer, returning -ENODATA when power good =
is
> not set.
>
> > diff --git a/drivers/hwmon/sy7636a-hwmon.c b/drivers/hwmon/sy7636a-hwmo=
n.c
> > index f01f368d68e5f..475aff997c2d2 100644
> > --- a/drivers/hwmon/sy7636a-hwmon.c
> > +++ b/drivers/hwmon/sy7636a-hwmon.c
> > @@ -14,7 +14,6 @@
> >  #include <linux/module.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/regmap.h>
> > -#include <linux/regulator/machine.h>
> >
> >  #include <linux/mfd/sy7636a.h>
> >
> > @@ -22,14 +21,22 @@ static int sy7636a_read(struct device *dev, enum hw=
mon_sensor_types type,
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
>
> [Severity: High]
> Will returning -ENODATA in sy7636a_read() when SY7636A_FAULT_FLAG_PG is
> cleared cause the thermal core to permanently disable the attached therma=
l
> zone when the rails remain off?
>
> In drivers/hwmon/sy7636a-hwmon.c, sy7636a_info sets HWMON_C_REGISTER_TZ:
>
> static const struct hwmon_channel_info * const sy7636a_info[] =3D {
>         HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
>         HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
>         NULL
> };
>
> In arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts, the epd-thermal zone
> binds to &sy7636a with a 30-second polling delay while the vcom regulator=
 only
> specifies regulator-boot-on:
>
>         thermal-zones {
>                 epd-thermal {
>                         thermal-sensors =3D <&sy7636a>;
>                         polling-delay-passive =3D <30000>;
>                         polling-delay =3D <30000>;
>
> When the thermal zone is polled while the EPD rails are off, the call cha=
in
> __thermal_zone_device_update() -> __thermal_zone_get_temp() ->
> hwmon_thermal_get_temp() -> sy7636a_read() passes -ENODATA to
> thermal_zone_recheck() in drivers/thermal/thermal_core.c:
>
> static void thermal_zone_recheck(struct thermal_zone_device *tz, int erro=
r)
> {
>         if (error =3D=3D -EAGAIN) {
>                 thermal_zone_device_set_polling(tz, THERMAL_RECHECK_DELAY=
);
>                 return;
>         }
>
>         if (tz->recheck_delay_jiffies =3D=3D THERMAL_RECHECK_DELAY)
>                 dev_info(&tz->device, "Temperature check failed (%d)\n", =
error);
>
>         thermal_zone_device_set_polling(tz, tz->recheck_delay_jiffies);
>
>         tz->recheck_delay_jiffies +=3D max(tz->recheck_delay_jiffies >> 1=
, 1ULL);
>         if (tz->recheck_delay_jiffies > THERMAL_MAX_RECHECK_DELAY) {
>                 thermal_zone_broken_disable(tz);
>
> Because thermal_zone_recheck() only treats -EAGAIN as a non-fatal retry a=
nd
> treats -ENODATA as a sensor failure, it logs an error, switches to
> exponential backoff polling starting at 250 ms, and after roughly 5.5 min=
utes
> with the rails off calls thermal_zone_broken_disable(), which sets the th=
ermal
> zone mode to THERMAL_DEVICE_DISABLED so thermal monitoring remains disabl=
ed
> even after the rails are turned back on.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101223125.30=
2001-1-pmazzini@gmail.com?part=3D5
