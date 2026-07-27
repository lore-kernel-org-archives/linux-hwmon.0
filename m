Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1BE2FF15B
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 05:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785128598; cv=pass; b=J7c/b1XiOAjq8izXzHQHiKa2HjfadjbBdXj3R3gyo6JVJ8g8Bhc+j8Lo57XEJOgynVQeDPPuZ8sQL67OJ1TffPMXhD6+KyV4mnRU1ih03P8JZWH99dXHE0U861Nxrcx/ZACJIgRX78KOlEIg/ekuWgJc8cnp4FCQC3siFfet7GM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785128598; c=relaxed/simple;
	bh=Pk/FtZDZl0PQfrLIsdI+VKyZ+R7vH46HV2PrUSu/YjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QMJcYrXOa9121Kd6qkZBSSwcRbgUTCZoSmMoT7/BLiotSXgXIEmEY7XZYqiilSOyphiJRjH/6IRZfLTdoccDB+OWWvqBoOAlJMQdoUaJZEQ93vICnjAbWdawPiDO+/um+uZiFWyTCdiKTQIKyR66MZJY9m2c7IHo2RQ8E7NeK7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fomSsFIA; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fomSsFIA"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c1c50c1e29bso336851366b.3
        for <linux-hwmon@vger.kernel.org>; Sun, 26 Jul 2026 22:03:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785128595; cv=none;
        d=google.com; s=arc-20260327;
        b=Aluq4otCVeBdiWfKP4pnayJYjQOD3DPpJv24tY53YYCjs9UcUZlvSv9objFLBVdh84
         U9qqmQiBQcHILhiAucSr9e8PiNO/jBx7cj5Bxzo4bMMUaYIiAF14vGcJOppFM7aE+rBy
         uu1NpW5MufAnwXz63YIKf/LTBI2gdepSRySoRGncmiQuP9bgjrGF30atzTH+hkCSHp/Y
         BHOODdn5RLW5/++qYKo1mEZsf3Q4K001kjZltcsLvafZLpUSqXYBSfBTZg7dAhuOiFdz
         X5mkzZQf8bYbPSC/V1124rSIOiENdGMY5jNU1arJAQuIp3OogaS8Y+olJvQPXAs2r1kt
         p0zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lHItxVHx/YdftcT7BamSTgJdXuSOFb2Tw3ZgxEEjhpI=;
        fh=0hdvEPJRino8wRvGrrw1gATkOs6ExpSix2L2F38xNVA=;
        b=LNHp/83fLO4X/HfStSgEjzWPG8lV5AsZAxAmhTge6FRfRovig89XKvSf25+fwvbKnk
         U/XR2AxJco2hsJSyky8qyAVwa7CAGl3AaPy5ogQ8YKRD5miXDutn2pNdGWRWyUmNDCqc
         kpRMt1KJfaCB0pheSyNCqVHRxB0HaHnVThhl/QJH6QsdfsoKMKA0DXwb1PAKkVr5ZK0C
         xIcUiw8HtVKd+sALLZ76C0VyZeu0Opuf8PKRbEBkQVQEG0qRVPzH3EfwcUioFVBvtWFr
         P0c/D17mdjjkz6MldIG6t9I/CD+ezZdeGpjgYw4SpMg7TVpz6vsiz2xEouZh+1XwNpwS
         21FQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785128595; x=1785733395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lHItxVHx/YdftcT7BamSTgJdXuSOFb2Tw3ZgxEEjhpI=;
        b=fomSsFIAMKJG4SrCbHlOTTzYR3k1J8b/fY3XQT517Bb0mAARs/Bhj/1IISmrRLnbi2
         XdNBgQJJ/0dyhEWa2AZ03W75s+kglREVlKdK77lkqQjx2e6kivI/IEtzirtYlcVi/SGX
         gYfTK7LEf0NFgY0Imrb4qmnZZbqHFFtSMIUdy/xqCZgz6Q5z7mGfBeYwP5UnKy4rTQe3
         HT2ilR5o7z8YXHge1HYM5HBZlXGzZ5mHQaXrdIOJ03VtDLeM0Cg6CZpOi0KoUFWCLrhw
         80p/An5F3fRlqELe3YTKTJ/mrfCupmG+ZYy7t5XS5TRwrfpMUSeBPCDZSaisEPRb5QJs
         Khjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785128595; x=1785733395;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lHItxVHx/YdftcT7BamSTgJdXuSOFb2Tw3ZgxEEjhpI=;
        b=QDM94UrBR5uhjQjdqPuTTSINgAtomLQSi6nIFLr6kWw9E1rHe0njXe/Oi7Te/GmRpt
         bA4fK1Ty/kdQ0AOVKNHHGyQ1ZXJLJSdFsISXeI58GRmNSAhQ86CHdbspwI19nIe97Ysh
         NI9Ql8lfEd/vBx1GAkwjo4eoWe63Iu5IeZpWyjmKmSQWDHRsGO84qHcc3XJ64m2jbMFH
         naMmQZeks1EhfAU5V1H9UBaW5iAFkxF6nZ9ZIRWVrAwtWj2TXXXlV9uDVkSEf5v4HaUD
         Aim8Hf7+sitRNyF9nRY4wnHhydQ6sc99M0Ap1y7G5Q2zgqZblxN6dFgYtzMkpIR9kVus
         f+5Q==
X-Gm-Message-State: AOJu0Yyu1BhU2lCilrIPNmqsWTK5n/tqbfr6LS5EBbXFEs1a45IAdGBo
	PoQzBeAUrITua2QVeFMu+n0ShbVmx1D1mZTApbz1pvHZDSydk19dQh7pue2krWMvGvaNjtKRySz
	FFM5K2hGALM7q6tx++JygPdqBCG54pQM=
X-Gm-Gg: AR+sD13/Pkx3Z59GacFWqyUnbLo9CSTtXe1vfJdT02YrMtVmwL6dBldYsdn/qtUhQD8
	sEGzSgSepL6CoagnfEOHjwIdcWjiJ0Vvxq/DDd+xCR9pA70aub6XuXBCHfC0mYLcCONs/+tOSgy
	FoWQCf7oTNI0dqXzExuC5STqxo0MA3j+TXlKBlcpK5Q8ilckBs/eNsdXbzs5/GZUOgnJLEpJD/8
	GGcHNbmNH5ghwcNVLh7JG3vcWLjVEBh+0RYn+FlfNU2kjpAzRR4adCyTphZzqCYonzMhEpx8H7R
	cNiT+rlO7Uuo/cMOFxzTQwJ8pS6mfg==
X-Received: by 2002:a17:907:9728:b0:c19:611c:fa92 with SMTP id
 a640c23a62f3a-c1f1ea885aamr289639966b.21.1785128595368; Sun, 26 Jul 2026
 22:03:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-adt7470_thermalzone-v3-0-21424d550c3d@gmail.com>
 <20260727-adt7470_thermalzone-v3-2-21424d550c3d@gmail.com> <20260727035020.1CF6F1F000E9@smtp.kernel.org>
In-Reply-To: <20260727035020.1CF6F1F000E9@smtp.kernel.org>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 27 Jul 2026 02:03:02 -0300
X-Gm-Features: AUfX_my4wYNWjWAHJBqAVaBRnB1Kk79Kz2VxtKVUqoU4ID_uDlSup2YNwyNCFV4
Message-ID: <CAJq09z43s=gTMZ5zHpvTE1rbe0SYB=bR-C2cCip3iK219vLi3w@mail.gmail.com>
Subject: Re: [hwmon PATCH v3 2/6] hwmon: (adt7470) Fix cache updated before
 hardware write on I2C error
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 27 de jul. de 2026 =C3=A0s 00:50, <sashiko-bot@kernel.org> escreve=
u:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] The PWM enable mask logic swaps the bitmasks for channels 2 and =
3 (PWM3 and PWM4).
> --
>
> --- Patch [2]: [hwmon PATCH v3 2/6] hwmon: (adt7470) Fix cache updated be=
fore hardware write on I2C error ---
> commit 6776a671fbb0d95bfa3d1f5ca2bae943732d5533
> Author: Luiz Angelo Daros de Luca <luizluca@gmail.com>
>
> hwmon: (adt7470) Fix cache updated before hardware write on I2C error
>
> This commit ensures the driver's cached values are only updated after a
> successful regmap_write. By checking the return value, the cache accurate=
ly
> reflects the actual hardware state even if an I2C transaction fails.
>
> > diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> > index 481d51617f4be..62ec68ea0a406 100644
> > --- a/drivers/hwmon/adt7470.c
> > +++ b/drivers/hwmon/adt7470.c
>
> [ ... ]
>
> > @@ -847,10 +850,11 @@ static int adt7470_pwm_write(struct device *dev, =
u32 attr, int channel, long val
> >               val--;
> >
> >               mutex_lock(&data->lock);
> > -             data->pwm_automatic[channel] =3D val;
> >               err =3D regmap_update_bits(data->regmap, ADT7470_REG_PWM_=
CFG(channel),
> >                                        pwm_auto_reg_mask,
>
> [Severity: High]
> This is a pre-existing issue, but does this modulo logic for the PWM enab=
le
> mask swap the bitmasks for channels 2 and 3 (PWM3 and PWM4)?
>
> Earlier in adt7470_pwm_write(), the mask is assigned using modulo arithme=
tic:
>
>     case hwmon_pwm_enable:
>         if (channel % 2)
>             pwm_auto_reg_mask =3D ADT7470_PWM2_AUTO_MASK;
>         else
>             pwm_auto_reg_mask =3D ADT7470_PWM1_AUTO_MASK;
>
> This assigns the mask for PWM4 (0x80) to channel 2 (PWM3) and the mask fo=
r
> PWM3 (0x40) to channel 3 (PWM4) during sysfs write. As a result, operatio=
ns
> intended for PWM3 modify the hardware state of PWM4, and vice versa.
>
> The same pattern is used during the periodic sensor state update in
> adt7470_update_sensors():
>
>     if (i % 2)
>         mask =3D ADT7470_PWM2_AUTO_MASK;
>     else
>         mask =3D ADT7470_PWM1_AUTO_MASK;
>
> Could this cause fans to fail to enter the commanded automatic or manual =
mode,
> potentially leading to improper cooling?
>
> >                                        val ? pwm_auto_reg_mask : 0);
> > +             if (!err)
> > +                     data->pwm_automatic[channel] =3D val;
> >               mutex_unlock(&data->lock);
> >               break;

The modulo logic isn't the issue here; rather, ADT7470_PWM3_AUTO_MASK
and ADT7470_PWM4_AUTO_MASK are incorrectly defined.

This is already addressed later in this series in patch 4/6. While
fixing the definitions is mostly cosmetic, it will prevent Sashiko-bot
from repeatedly flagging this false positive in the future.

Regards,

Luiz
