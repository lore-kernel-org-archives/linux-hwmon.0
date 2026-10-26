Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792980636;
	b=20TQC1o12rENeRkh8jpgLBQdipn9TBLRriYbLDe7UyGvI44F4qRHRcfRive5aB+JeGuz
	 NP8oVSGyYqezN9VQ7tGgUXvI6BmGIfxIVnnSAkJiAUUCfhcZmCCjne+Xit5WKGIQfgkj3
	 6PR8UUmbCq/oZgcyuodELxGsrWojs2ELLY7LI/WVCY7hsOBR6B0UPz1qpvLEtS8fq4K1C
	 TIovBIFsRMLeXoWSZNEUVwKhAM1y5FCX++CZo6H2zy5qMVd7nfF16g4SpHY3v+OvNWiIL
	 PORllLhcYM0YodzUDcZMvhJqjVekjjOymwSAiJ2CXnpSz8g8LBXYcsvuARt510pNH3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792980636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=PhozeamFwuWtPyIKg2kpa7YRAXXBYhqW3aJ0bO6CqHQ=;
	b=ig2pyLW0/Te/Lb1KeNIdbyNR4KnrBa3RmleUn6PDITql7/1rE+QNp4ia6gzxRXaF9O8w
	 Raj8ZZV2LfqSq1xycoVs1ruK2z0thdVIxrnB9LnuKYlSTZZlQ0vo4krqDZalyb00FFU+Z
	 4OSutNeQVbb544z8r5BVQWzxGG8c5s3Pxv9SCIfzPrvqMylVwVk+SOeEJz2pBfKCpurRO
	 HYJSU7C4H5FllIsotdDYviGAPJ5bfzy7ohAxniQj/5K3cTq86+UybUMY82k6R5aNne2nY
	 ribdslbzyTqoZw3Y3zO9NIxFz8wRhy+8LZgEc/9CAcI4xDe5uI3/nmQvbkgH8GSlY2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W4XtmIAj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FF4606A31A
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 02:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1FF4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W4XtmIAj
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a06ca6e8f4so1738292b3a.1
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 19:10:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792980635; cv=none;
        d=google.com; s=arc-20260327;
        b=sXnwe/048PsM1K1JPIbLAZkbl3zjna5vuIGDEnoaEK7u/3oG4ie86xr+LRh063NtwL
         MxT8lapUdmUuOKuO+F5bmBJxVZDeJQcpE0TGDHC4LoHBxrhmZrShTZyCLT4MHJqQanY/
         UNk8N9YQeF/NGo791i2OkXs5JPSCuy2Cn/gCekClTWnre2IMWz9qcCB1h7X3Ds4dJVvH
         dtjC41sFV6c5XhsGtYuCGA5ktdsNeSY7cJGiMVPWFghe2OK55P/y5QsrcWZlYe8aqTcs
         34krBrEIs5EGgnRo1HV2gk+JHtD6HDY0Lsw7MMbbt4KQjpcqyeD9puh6SMVXa8u5/lBp
         OVdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PhozeamFwuWtPyIKg2kpa7YRAXXBYhqW3aJ0bO6CqHQ=;
        fh=5iYfhhOzHQWYhMEjFDrcuaE5tJLWVyDMSfmgXPYvEJ0=;
        b=X2jpbue/YaCPY20PcCmrbq+bRfDtvJPoZii79O1pgLAowd0tg8ZbteB3K0jyApo/u/
         0ExlmIL5lwawMFRJ0eUtSYORoqZ0lB9U3dcfwfqzXWXTym2DaCdxRhydfIezwvy7ddaR
         p83F4cEA73zLTnATUkuPT/hyvUYo6MzK07mHuVQsPkwqBsPWsqvm2OUB95h96dHi0gvG
         dKLhZglkq3g0dT7HUKnUuftwJm3KOlZGRtJ7NeT6ZFa4Rd3N2OKSKo0HyMI3gszwSMny
         +xeqgt0pwg1ZCf5abekogYVoHYDEjUecd+j/BMVWQNgHM+8yFAl/+4d1Rkffs4EjCfII
         48Iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792980635; x=1793585435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PhozeamFwuWtPyIKg2kpa7YRAXXBYhqW3aJ0bO6CqHQ=;
        b=W4XtmIAjumYIcCZZ0mgykzUnRkrSmHlTc3KHWMsI2gjKKX2FAxgQECSnubT3j5+4qH
         LrM24EW2dkaftmYr28NOR56uex40BsbTLzDpTSxQeK7MviOsUEB3bXOOqnI7YzFBh2lH
         PNkG6SzqjHhRFwn61WYJMc7Y2lxGSW09KS+qdQ6z6G2n8J11Hd82RqBzKj8HkBr0odgw
         Xh1y6PG+2jfqfJtnUJaM3WkooOmOLVom9MXk4ooRjhpACOAsiqddu/EozyFX12GO/U5c
         RRrJZUO5uBfbBnfFX0mNW5E9fCnvN0YnaHpaZNlnH1gKed5MSvwZUeJAxwXh8LuqZw/u
         U5hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792980635; x=1793585435;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PhozeamFwuWtPyIKg2kpa7YRAXXBYhqW3aJ0bO6CqHQ=;
        b=QPaLa7Jz3sd5z+FUQv6e0QPBhfu9WF8Mo2E4mZ4oDZBoyzvwjJYOZIqapZAVC6TQQR
         7mNKeNkLit1cSVpgi1dcEB/kK+qa9N7oExuLZ/7dKhXm2eQoSi29V2NQj7ly1HcggfSH
         u/etamF5nBg8xwO5Zqw+SZX+ytL7AQWYGGK2R037ZeL3OInpc7/eqJSq7l2Vhk41Jy5d
         QN7Z3XcH1LM10FEX5JYOFVrbXaLEF4R92P4ZtBIUrRZmPvjZGSV2sjUa7uGG7iLzuKfz
         2iCfrynO0pf33ivUmTIUMygq6LcLp+YIIMZ1N3qpkSY62sPR72Lmq5U8t9Y4HBlAI0Pf
         0XrQ==
X-Gm-Message-State: AFq9FYJ4V0US0IY6mI+Wb7KKSRDUo/vVwy7QzNKT9yurFU/3qUMj3fbo
	An9luRMEATW+rgJPMa5ySB62U1l9gypOedSV7SwM3mCtMJRR88f+7wwz+N7mHL3aR5/vgoxLwni
	1fLVtGotQ3Mt0lpMa20qFBVsG8IiIdzY=
X-Gm-Gg: AYBFou3WlTryhsjr0JUzB56IZUaeA/bX9dQv112d+XjHa7f5V5ABplZYfoorWuE5HDt
	7YXcm9JTfgG/LhAXFNGJvqam/1r1dZjNrVMYpvg567eqamdtWc5IX6C8mWTrLIYqDp8BhxRszZd
	P7QvbHJ9N10/roVrBw2rSpozcWdB9eRCOgFQDYR/wW+P3B5zTBmEvFiiqordD96x/3e/aBDfvlz
	w9lUEQi5VYSh+PlB8TmCQCaSaTWeC0FXBj1dpMTTX7hp4coK1sS7PoBQwxecJUrHrF7/x2xKZ1S
	DnNzf3fTl4GTwfAgFExsOlYx7G6cYD4HWL22VTJ5gGnyXzzz9JCKBe7yma7TE4Z73KjsiSZ0cOT
	zDpA6fowtCTWzwFEtEpOT8jlu8mKPVKHiMBq63JRP2tZwoHRoFajC
X-Received: by 2002:a05:6a21:3f92:b0:3e1:a769:9620 with SMTP id
 adf61e73a8af0-3e7cd688935mr3859739637.71.1792980635201; Sun, 25 Oct 2026
 19:10:35 -0700 (PDT)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026003918.155321-1-pmazzini@gmail.com> <20261026003918.155321-6-pmazzini@gmail.com>
 <sashiko-outbox-184583@kernel.org>
In-Reply-To: <sashiko-outbox-184583@kernel.org>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Mon, 26 Oct 2026 02:10:24 +0000
X-Gm-Features: AclHuK8r-7Bfel_EEhpHI86UjS9b9Nqlm9UoSS8x6HzK6eJI57dyjtwPozP_C4g
Message-ID: <CAAxh=jvoB5c94U+y3ZQ8ijjPH=kB2DuL_+r1EXXKrSZQq7ojCQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] regulator: sy7636a: report the temperature
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This follows the TPS65185 and FP9931 drivers, which register their
temperature sensor in the same way.

On Mon, Oct 26, 2026 at 1:35=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] regulator: sy7636a: registering hwmon device outside drivers/h=
wmon/
> --
>
> commit 3011502577fb90233215473b5182522faa4b0058
> Author: Pablo Mazzini <pmazzini@gmail.com>
>
> regulator: sy7636a: report the temperature
>
> This commit removes the dedicated sy7636a hardware monitoring driver and
> moves temperature reporting into the sy7636a regulator driver, reading th=
e
> thermistor register only when the rails are enabled.
>
> > diff --git a/drivers/regulator/sy7636a-regulator.c b/drivers/regulator/=
sy7636a-regulator.c
> > index 5705599d1b55e..816df7716c0e0 100644
> > --- a/drivers/regulator/sy7636a-regulator.c
> > +++ b/drivers/regulator/sy7636a-regulator.c
>
> [ ... ]
>
> > @@ -147,6 +148,52 @@ static const struct regulator_desc desc =3D {
> >       .of_match =3D of_match_ptr("vcom"),
> >  };
> >
> > +static int sy7636a_hwmon_read(struct device *dev, enum hwmon_sensor_ty=
pes type,
> > +                           u32 attr, int channel, long *temp)
> > +{
> > +     struct sy7636a_data *data =3D dev_get_drvdata(dev);
> > +     unsigned int mode, val;
> > +     int ret;
> > +
> > +     ret =3D regmap_read(data->regmap, SY7636A_REG_OPERATION_MODE_CRL,=
 &mode);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* the thermistor is only sampled while the rails are on */
> > +     if (!(mode & SY7636A_OPERATION_MODE_CRL_ONOFF))
> > +             return -ENODATA;
> > +
> > +     ret =3D regmap_read(data->regmap, SY7636A_REG_TERMISTOR_READOUT, =
&val);
> > +     if (ret)
> > +             return ret;
> > +
> > +     *temp =3D (s8)val * 1000;
> > +
> > +     return 0;
> > +}
>
> [ ... ]
>
> > @@ -235,6 +282,15 @@ static int sy7636a_regulator_probe(struct platform=
_device *pdev)
> >               return PTR_ERR(rdev);
> >       }
> >
> > +     if (IS_REACHABLE(CONFIG_HWMON)) {
> > +             struct device *hwmon_dev;
> > +
> > +             hwmon_dev =3D devm_hwmon_device_register_with_info(&pdev-=
>dev, "sy7636a", data,
> > +                                                              &sy7636a=
_hwmon_chip_info, NULL);
> > +             if (IS_ERR(hwmon_dev))
> > +                     dev_notice(&pdev->dev, "failed to register hwmon\=
n");
> > +     }
>
> [Severity: Medium]
> Should the hardware monitoring driver remain in drivers/hwmon/ rather tha=
n
> calling devm_hwmon_device_register_with_info() directly from
> sy7636a_regulator_probe() in drivers/regulator/sy7636a-regulator.c?
>
> Hardware monitoring drivers are expected to reside in drivers/hwmon/, and
> when a chip's primary functionality is in another subsystem, its hardware
> monitoring support should be implemented as an auxiliary or subdevice dri=
ver
> in drivers/hwmon/ rather than registering a hwmon device directly from
> outside drivers/hwmon/.
>
> While the follow-up commit ("regulator: sy7636a: bind to the i2c device
> directly") removes the mfd cell table in drivers/mfd/simple-mfd-i2c.c,
> sy7636a_hwmon_read() only accesses the shared regmap via regmap_read() an=
d
> does not depend on internal regulator driver state. Could the temperature
> reading check be kept in drivers/hwmon/sy7636a-hwmon.c (for instance via =
an
> auxiliary device registered by the regulator driver)?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026003918.15=
5321-1-pmazzini@gmail.com?part=3D5
