Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792452797;
	b=S8nWhVn8ThtnCBtQ6YmOmsS2LZ4Od3Wfk8pT0ww+YonME6FA7JJ1xhE80kOSjSA6anvJ
	 oioKJhFPMaPgNZdr0NDlIaZCNMMMWb1caAf4/9CwPqTITc0St2SFmE/+jRQjlQOU1+cCL
	 RVB9fnkBiOO5ICkPfF/N9PIfQeeOh3M347pd09f3DmS4JWyiYj2ZLz5yKvSptqxGBAlht
	 wvdsuyNFEDYXAYPKxTbOXMnOyQG4No3eLSNSSuvs50qekgOAUK0Nz8ek+U/Ctnb1afmwv
	 P02L98eTSfqsGB1xEVTSB+q5NJbAEO8pkKD13by1jGFIIjU+3604aU7XTJhhGF6i8rw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792452797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=paK+OUo9iJsVsNln4mfvklUIDtP3YZCTZFLlIDNQgB4=;
	b=EIkedUw76qMdUOwPmF6IS98l8Mva1wNaCjNsWwEyi2vTLrAXnWfvg+GKLDeTQ8JU0Dce
	 jbBySxM/sJgh9lCoa4U/WSVZZBafHytBOVQsMUfmeQ1a6JJwKJ/HtX47RKqoBVy/WBXyT
	 L26mcVKlR49RTWa1XL0PkU4BInvzKNFcWlPRSnVYNgo0cZpW8L92GWj6Ja3DRSfkTzXGz
	 wNrBaMBuIS5xOsOUsSKk3U1CQvAh+FWAyu+ev0nqYNB80mAFLIju2aZebIWCCtp/FHjqe
	 KBpIP3zflQngPwGI3ha+7biac/H5th9sQVDNEaHERGSRl4l/fFiwEFwBS0PIaXm3q6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Minqm/hR";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FB1606A319
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 23:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4FB1606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Minqm/hR
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e977109392so11943275ad.0
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 16:33:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792452796; cv=none;
        d=google.com; s=arc-20260327;
        b=f2cgeUsvco046xBYTEKT75Q/M5zOVavLgILeiMkAq3742ISPnNBVk2HC9fw7Q107L5
         H4IW9siKjui88X8BPFuxL3pP3c4yTJI8IWualzyf1kWDqa7s1RZPlOn/WZpXTvDksMr4
         9cLH2T6wDXQvUFN6bc9WCXYOr4Enz+TjXZSMPE+C4PqEHjW+B8x5PeVreFG/+d5RDn1k
         UFptCvMZmxg2JKRBl+z2ksP4YQBTpSLRzU6IVnG/dFLJVRnqLqx76ljm8BSPG6O1Tm2K
         CS+N5u7xkiannfoe0LckoiCvS9LDBR+LTfp1r9g4KHnjK/D+gp/aixMFY7257aCEjUhs
         muag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=paK+OUo9iJsVsNln4mfvklUIDtP3YZCTZFLlIDNQgB4=;
        fh=WV73kIzIiGI40XmxDNJD7p9IVX4Y5FWUgEwEC0jRq40=;
        b=jqbji2YZvl8B2h9/2YeRgyqWtVf7bWH937QNHlgOQADYeFlefRebq+c4PnimrvcN5d
         cUluXAaPLZ16DkWtOMUw6VA+razLwy6Xv4rMh1QJzuN0uJn6b9D+mDM7kaOIYL006gf7
         FhvejenmGME4z2/EigWZK1aCb7fUi8h99WNpmlqmvvCzjnTDhL7fKpJsMd9eQ8gztqwX
         nbcObbnUSUy3A8p3oRfOwqTlyuuE5GZTOzcMGuZT1eNaJL7/cP8VRzQgIWTYfQwO/hhB
         tQGAI8ZFGK56Uqd3FUzuHkXVkEI3gE8CvTlVzV4c3rmOSjqS57cZvwLhuBEzsWO/I8no
         2PyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792452796; x=1793057596; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=paK+OUo9iJsVsNln4mfvklUIDtP3YZCTZFLlIDNQgB4=;
        b=Minqm/hRw8YMsj0Lyx0nJK9pwlVoK/tK2J1zdqZO5g8gQMO8DtfLyVm5Zl/H2/OI4F
         W1nintkiBBPh0B37IburnYfXUfz7kClcFw2N6XtIL8KjtvtfMPwIIKrs8DOxp07KeBK7
         C9BaylMHJNiym3n0qQfacmyFKKIw9VGQsx5AYb8dJ3JGL2I0SeLdP6bOKI+9cDVf+UXf
         fWkRv0ok3TZqolijQLOTfjj9tgCy156FqwwmADEfU+/q5pIaHzze4mKls8F0SwPnwCP+
         VZyR92P/s+MUFi4i/HsJRrZmj52aZZV3rbXUTL2So8y/w2BTtntGIW6oITIwmNY8MfwA
         gTOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792452796; x=1793057596;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=paK+OUo9iJsVsNln4mfvklUIDtP3YZCTZFLlIDNQgB4=;
        b=dLsMTzJk3gILpDqV3uLw+AgOMR9ErAkXbWjyUFC8DbW62bB/zqAXW0cSnRp7FcMa48
         0yF+8ZoYCD8IhsrLm+d8l7/5TMCC6tAZ0IG+axEtuXpybu6BzlmKs2+KT3ZdtBzs4dtB
         dKJTZo9YRtMoKxeh5zUtDvVAECmtOnckavIyzXXfrZhgWPAhhDE9vt/eROHj2R2foIrE
         MMq7F1wfr6vS8I6r+ewRl5vzhRSi9rCL2P5FpI2ZCV89YC5eolUpNeLRyy3d4wvpKegG
         8AdF/gNPwutuT6CPiSHrOGtOOar3/qZkecJWVS7XSWYOVWZ24wvLNveO3R6B7atiko8n
         IBYQ==
X-Gm-Message-State: AFq9FYLwY4FJjE4ugMvRr3A/W8h7kctEjlazpWhowM9HfweoUcEfMrQ1
	MNwxS8asMS9gzuuDAcisnk0XK8Vzq0A+8eqaYITg22Q7MB9e5qs0ZwWA5QQh5VNwiZm+xrdyorS
	61BJBuXEdzLPeH/KH4IpQEiYchJoHxe4X5zRjrQ==
X-Gm-Gg: AYBFou3uBXNzY2i+TLOj8kZ0KL8758p5G6aI4i7LAG/OP6Twn63X5+uvQyXSNTZSDbf
	jDSpBzToBm/gykqrQPlvATbYE/BjdIyIFrNSmfvMKjJ9WMTFnyT9Roh2LILMP32ti7y82pSx3fo
	zfEvCQhdx8FZQqFGOSnGanioqIklPCoOENaW/sqajy1HAYQrlh3Qg3uquDQ5OVUcdbqWHmVSfVu
	d5DDROUSbSF4G4zqaF1jk3DFVfYQbmLa9Jw9Rjsmu3Wv6FIWFMq0oZmNCQb02kG7h0JvcFPzPyX
	BuLaozv4XoB/FNFyTst746qXV7OI2Ay7Qu9S+eIRZQPltxkL/ssU3CedyeyNSA0sNPgaFJKaIR/
	jwXVlvXEYjPn4xN6KAYsdkLuIRV+nGCydTLf9Q8k5NqW9TCZFyLDUs3F3371y4kR4rccQ
X-Received: by 2002:a17:902:f546:b0:2e9:84f2:3738 with SMTP id
 d9443c01a7336-2e9a6834a2emr79859875ad.6.1792452795935; Mon, 19 Oct 2026
 16:33:15 -0700 (PDT)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016030749.3689266-1-mhun512@gmail.com> <cb5f15d3-5a03-4f67-b7f4-36f5b74610fb@roeck-us.net>
In-Reply-To: <cb5f15d3-5a03-4f67-b7f4-36f5b74610fb@roeck-us.net>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Mon, 19 Oct 2026 19:33:01 -0400
X-Gm-Features: AclHuK_IbLOCcDvjz5ABrJnrXeVOgZB1X-J2gGnBU3GtVhfrrBWPb8Wo6dOytRU
Message-ID: <CAGEsz8ELcC8afKxnFa34uL8+TyzR6-nn3HtEx=Vx2sNtSHWdEA@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (sht15) Stop deferred work before releasing its resources
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

You're right. I've switched to request_irq()/free_irq() in v2, with
read_work disabled and drained before freeing the IRQ.

Thanks for the review.

Best regards,
Myeonghun Pak

2026=EB=85=84 10=EC=9B=94 18=EC=9D=BC (=EC=9D=BC) =EC=98=A4=EC=A0=84 11:57,=
 Guenter Roeck <linux@roeck-us.net>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Thu, Oct 15, 2026 at 11:07:49PM -0400, Myeonghun Pak wrote:
> > A measurement can return while read_work still accesses GPIOs or
> > re-enables the IRQ. Regulator notifications can likewise leave
> > update_supply_work using the regulator after it is released.
> >
> > On removal and the applicable probe error paths, disable and drain
> > read_work before freeing the IRQ. Unregister the regulator notifier
> > before canceling update_supply_work.
> >
> > This issue was identified as part of our ongoing research while
> > reviewing kernel code.
> >
> > Fixes: 251eb40f5ccd ("hwmon: sht15 humidity sensor driver")
> > Assisted-by: LLM
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> > ---
> > Compile-tested with GCC, W=3D1 (x86_64). No runtime testing.
> >
> >  drivers/hwmon/sht15.c | 16 +++++++++++++---
> >  1 file changed, 13 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/hwmon/sht15.c b/drivers/hwmon/sht15.c
> > index 7bb2105..6c5b2a1 100644
> > --- a/drivers/hwmon/sht15.c
> > +++ b/drivers/hwmon/sht15.c
> > @@ -31,6 +31,7 @@
> >  #include <linux/bitrev.h>
> >  #include <linux/gpio/consumer.h>
> >  #include <linux/of.h>
> > +#include <linux/workqueue.h>
> >
> >  /* Commands */
> >  #define SHT15_MEASURE_TEMP           0x03
> > @@ -986,15 +987,15 @@ static int sht15_probe(struct platform_device *pd=
ev)
> >       disable_irq_nosync(gpiod_to_irq(data->data));
> >       ret =3D sht15_connection_reset(data);
> >       if (ret)
> > -             goto err_release_reg;
> > +             goto err_release_irq;
> >       ret =3D sht15_soft_reset(data);
> >       if (ret)
> > -             goto err_release_reg;
> > +             goto err_release_irq;
> >
> >       ret =3D sysfs_create_group(&pdev->dev.kobj, &sht15_attr_group);
> >       if (ret) {
> >               dev_err(&pdev->dev, "sysfs create failed\n");
> > -             goto err_release_reg;
> > +             goto err_release_irq;
> >       }
> >
> >       data->hwmon_dev =3D hwmon_device_register(data->dev);
> > @@ -1007,9 +1008,13 @@ static int sht15_probe(struct platform_device *p=
dev)
> >
> >  err_release_sysfs_group:
> >       sysfs_remove_group(&pdev->dev.kobj, &sht15_attr_group);
> > +err_release_irq:
> > +     disable_work_sync(&data->read_work);
> > +     devm_free_irq(&pdev->dev, gpiod_to_irq(data->data), data);
>
> With this here and in the remove function, what is the point of using
> devm_request_irq() ?
>
> Guenter
>
> >  err_release_reg:
> >       if (!IS_ERR(data->reg)) {
> >               regulator_unregister_notifier(data->reg, &data->nb);
> > +             cancel_work_sync(&data->update_supply_work);
> >               regulator_disable(data->reg);
> >       }
> >       return ret;
> > @@ -1023,12 +1028,17 @@ static void sht15_remove(struct platform_device=
 *pdev)
> >       hwmon_device_unregister(data->hwmon_dev);
> >       sysfs_remove_group(&pdev->dev.kobj, &sht15_attr_group);
> >
> > +     /* The read work can re-enable the IRQ, so stop it before freeing=
 IRQ. */
> > +     disable_work_sync(&data->read_work);
> > +     devm_free_irq(&pdev->dev, gpiod_to_irq(data->data), data);
> > +
> >       ret =3D sht15_soft_reset(data);
> >       if (ret)
> >               dev_err(&pdev->dev, "Failed to reset device (%pe)\n", ERR=
_PTR(ret));
> >
> >       if (!IS_ERR(data->reg)) {
> >               regulator_unregister_notifier(data->reg, &data->nb);
> > +             cancel_work_sync(&data->update_supply_work);
> >               regulator_disable(data->reg);
> >       }
> >  }
