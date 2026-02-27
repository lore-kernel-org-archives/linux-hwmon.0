Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C3032ED2A
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Feb 2026 11:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772192014; cv=pass; b=gkTCF6tPli1V6R/bHJ7+z6x9iFeR6tD2lPTX7ZysePYVxvUfRg6EWHopSlbYr2b8iuGlDBkOhjrMmMZZjE7FXsbLtGrLqqaL8MieHz3kvP7RoshY72FcseQMOBRDDRtv/Qqd4DrXxuR5WLYjGdvJ9kv3IGxqH97LJniEs+POSkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772192014; c=relaxed/simple;
	bh=YkKkXGPtWq4Z1GRykpWFBU1hTW3OYyhGbXrHfP9/WiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DRKpSXb4CTTx0EerBrYDyhhrUbO+B3cYr7eTwwA0/s2ThPDPcizHvQHjOpctH2Ni80NJF6KuE1P6rMjqZvG81Jkz/b82rJ01bozt2mkzHJ4mw6aUA+6SGapm1WE4Sj4OsPRNLrVQbUWilBcCRWek1kkiyLQErpT3DPomaSLXX1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=EbRd0clv; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="EbRd0clv"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b9372552059so168152566b.1
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Feb 2026 03:33:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772192011; cv=none;
        d=google.com; s=arc-20240605;
        b=VSnewYh1ievdf3LDZj1vP5YViqr2QO7my/kWJQgBAE4X6buDFYgbMaLpJFfGVwGlG1
         gcPZiYlxfEOAZ9BdVsUjgYht/pp1IPtcyrosh4I0aFck9bU//ZnYqSxv5npfuIHp5RIF
         IksdilXMORHTIXvi8BN14rt4iW/SjsiwkZ+rtz1FsjGt/PqeexDUmD9PpG7SC7oiA8Gc
         ugdbN0iwXMXWbaNizhPTSvUKsmcKuGydo8xMHVYJPTdMDOOJIFUAaknlLEUeQRIKaoVp
         K1QLaFv99HtJ9tkeLkF373aSxzewDGV5plhgIP2dzWRrFaRoQG8JKYdJOOZDswoiXL4N
         E9+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EA0zkwSlxFAb7Xpw8/jdlv2hV6yk/85CXHmdOo5DpPw=;
        fh=0gv2Wm7J7nH0y3INPwpSSx4rbocwwOvsqkbvtVRR+9o=;
        b=Z/Vx9KOLanrrpJIQ4+yePlXv60hLs0nZI2AlLJtXJqyxGDXE197rk6AA04G2KjVMDY
         NGtM2XvexTnEmV0s+aI9oG5VQRnJ0GqshC9IBLfOFgghIuq4i8+wdWHIWb0b5adqXMVf
         KeRSx8Ycc/3mlLAJAEIIZ6AgiJIvShjqDtSvxrkOT/uKzJMj7ZBCt4cSfgh/S5pzWGX3
         2cBJ0BlaPg17S7DLDuzj3mxTAw9N6XtzZsA2a0qa07yvUhAnuG4LQq7fq8/6x2v+CI/c
         E+ol9Tn85q69sf5DmQLykMlv4SQF6PSkmZ9sYU0NMatNUZBWUrYUqNqvX9dENkjZ1uu4
         45YA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1772192011; x=1772796811; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EA0zkwSlxFAb7Xpw8/jdlv2hV6yk/85CXHmdOo5DpPw=;
        b=EbRd0clvRx9qGUQsT5J2lxegONfFLiRIv30vw4PmFMwCAioTYl2+cj2DNROEzEcEbU
         36Wa1b8Jbm8owDo0igCVBJjIB70bLY1eZc1b5zgb7OgprLog6LjMx1s7v8nf0hGrrJ3C
         3tGg2RGp8wwF8y2E3hH1yUKSIUOQXzoJd6295lqScnJeLpJ7z0DLfOCGgsV9VUYpH+Gp
         QmK1AvmXsjEj3H9KNrgiT/2XOCaM5Uz7/BVui39XfhUK9RARu2xEOGP5qH3r/on4KfxZ
         VzSDfBwpkCuiNhGCvmTLY+gQWLWTbsP/xttrQAAgbl1B/8+iaPUcuhSWHCKp0MFU3tir
         9S4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772192011; x=1772796811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EA0zkwSlxFAb7Xpw8/jdlv2hV6yk/85CXHmdOo5DpPw=;
        b=kY7/Gi4fOGaGIZniRTyEUBfHwy96Hg+JOChqancVBc2ylO05VPiCKJqzDPxvFWX60q
         iYR4IcnDmTgtMJXuPOUzF1th3ZVqO8aI9Hybf3UV0kO2dmMDIQLJ47cRgC+RQKuIiaZd
         mYNyM0jjWpf98CXd5ut8sijSxuciBgCNRS/dSrc00R3hF5gBmdFDQmjzuVxN0rgFeU+v
         favp5gd3kYR1yLyMXfZjx0JuOwhKXOBhXL5g3TysjGTMLiAR2sIitl6vR4ZpoOSqgeta
         P2KUy9J58OqPfGXg6ZwWmkEzW9Uxy99lvLj+7x2qZdzUzJd4UNDWr2dnMUGgJnTwNVxg
         t/3w==
X-Forwarded-Encrypted: i=1; AJvYcCUM27oa9XN3EvUjQQ6BG7iwvk0CwfyL6X+1CVfgg9MuDP3s/WlO1tl006ggkOcj5U1golBBtnEO795JCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmxESXD34gLyUXXzSytffs/IR4iITTr0FnTZSeMASuRxRHe23j
	alh/7RjDFbxlcX5zyPTk9EFb0WKQR5A9M+OdLLjKmYjWuW/UAJ2w+LO8zz/TFAMJGbM1nbg80UD
	stKZDs7N1XN1SGzoXAl7RveeF52eAOWJLKnByVROMXA==
X-Gm-Gg: ATEYQzzi3plEcxHOdFQK8tpcuUOAVGTXfFvztPJGU2KjKBZn+GmL4X3M6NgBRrakjeM
	ewjfaQ+FGgNHveCGtkysEAjnwCOLqj9td7lpY5HpJJpH9gJWwk9PiOKOvNiBn7DnWNYLsO1Se/s
	Hl2duMt0iZNIuQIs6GBf2ovhcYM7lqABT4jjSRSo95KcBXJhzue+B6X7RlnPGKBR8qn6NAx+a+N
	ZR7VeYAUuqnHFBsr14tY1luk912qLdOGlpwdS36feKTSCbmv2TQDl7KnXgqVMwvHKh4gyo7ev6r
	mJh9Ag==
X-Received: by 2002:a17:907:9807:b0:b88:6e10:62c8 with SMTP id
 a640c23a62f3a-b9376366e46mr138172766b.2.1772192011202; Fri, 27 Feb 2026
 03:33:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225-ina4230-v1-0-92b1de981d46@flipper.net>
 <20260225-ina4230-v1-2-92b1de981d46@flipper.net> <20260227-victorious-parakeet-of-control-bef3ea@quoll>
In-Reply-To: <20260227-victorious-parakeet-of-control-bef3ea@quoll>
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 27 Feb 2026 15:33:18 +0400
X-Gm-Features: AaiRm52Uhbk0_fR90_NpcwfxQk5HImLHPnkYTEwhZQvIHf5sUKaUrVdD-tZT79s
Message-ID: <CAKTNdwEUZWLgLtN7w==S69c1rOoRBWYAR3yXpR58uzipV3fx=A@mail.gmail.com>
Subject: Re: [PATCH 2/2] hwmon: Add support for TI INA4230 power monitor
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 1:49=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, Feb 25, 2026 at 01:29:12PM +0400, Alexey Charkov wrote:
> > Add a driver for the TI INA4230, a 4-channel power monitor with I2C
> > interface.
> >
> > The driver supports voltage, current, power and energy measurements, bu=
t
> > skips the alert functionality in this initial implementation.
> >
> > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> > ---
> >  MAINTAINERS             |   6 +
> >  drivers/hwmon/Kconfig   |  11 +
> >  drivers/hwmon/Makefile  |   1 +
> >  drivers/hwmon/ina4230.c | 997 ++++++++++++++++++++++++++++++++++++++++=
++++++++
> >  4 files changed, 1015 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 4d879f6a7b51..77f7a416e682 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -12511,6 +12511,12 @@ S:   Maintained
> >  F:   Documentation/hwmon/ina233.rst
> >  F:   drivers/hwmon/pmbus/ina233.c
> >
> > +INA4230 HWMON DRIVER
> > +M:   Alexey Charkov <alchark@flipper.net>
> > +L:   linux-hwmon@vger.kernel.org
> > +S:   Maintained
> > +F:   drivers/hwmon/ina4230.c
>
> List here binding as well, please.

Will do. It does confuse me a bit that we duplicate the maintainers
info both inside the binding files and in here.

> > +
> > +static int ina4230_probe_child_from_dt(struct device *dev,
> > +                                    struct device_node *child,
> > +                                    struct ina4230_data *ina)
> > +{
> > +     struct ina4230_input *input;
> > +     u32 val;
> > +     int ret;
> > +
> > +     ret =3D of_property_read_u32(child, "reg", &val);
> > +     if (ret) {
> > +             dev_err(dev, "missing reg property of %pOFn\n", child);
> > +             return ret;
> > +     } else if (val > INA4230_CHANNEL4) {
> > +             dev_err(dev, "invalid reg %d of %pOFn\n", val, child);
>
> All these are probe, so return dev_err_probe

Good point, thanks. Will adjust in v2.

> > +             return -EINVAL;
> > +     }
> > +
>
> ...
>
> > +     ina->regmap =3D devm_regmap_init_i2c(client, &ina4230_regmap_conf=
ig);
> > +     if (IS_ERR(ina->regmap)) {
> > +             dev_err(dev, "Unable to allocate register map\n");
> > +             return PTR_ERR(ina->regmap);
> > +     }
> > +
> > +     for (i =3D 0; i < F_MAX_FIELDS; i++) {
> > +             ina->fields[i] =3D devm_regmap_field_alloc(dev,
> > +                                                      ina->regmap,
> > +                                                      ina4230_reg_fiel=
ds[i]);
> > +             if (IS_ERR(ina->fields[i])) {
> > +                     dev_err(dev, "Unable to allocate regmap fields\n"=
);
> > +                     return PTR_ERR(ina->fields[i]);
>
> Syntax is return dev_err_probe, but allocations should not have printks.
> It is not possible to get there any other error code.

Alright, will drop the error message and return the errno directly,
thanks. -ENOMEM should be pretty self-explanatory.

It probably also makes sense to replace the open-coded loop with a
call to devm_regmap_field_bulk_alloc while we're here.

> > +             }
> > +     }
> > +
> > +     for (i =3D 0; i < INA4230_NUM_CHANNELS; i++) {
> > +             ina->inputs[i].shunt_resistor =3D INA4230_RSHUNT_DEFAULT;
> > +             /* Default for 1mA LSB current measurements */
> > +             ina->inputs[i].max_expected_current =3D 32768000;
> > +     }
> > +
> > +     ret =3D ina4230_probe_from_dt(dev, ina);
> > +     if (ret) {
> > +             dev_err(dev, "Unable to probe from device tree\n");
> > +             return ret;
>
> return dev_err_probe

Ack

> > +     }
> > +
> > +     /* The driver will be reset, so use reset value */
> > +     ina->reg_config1 =3D INA4230_CONFIG_DEFAULT;
> > +     ina->reg_config2 =3D 0;
> > +
> > +     if (ina->single_shot)
> > +             FIELD_MODIFY(INA4230_CONFIG1_MODE_MASK, &ina->reg_config1=
,
> > +                          INA4230_MODE_BUS_SHUNT_SINGLE);
> > +
> > +     /* Disable channels if their inputs are disconnected */
> > +     for (i =3D 0; i < INA4230_NUM_CHANNELS; i++) {
> > +             if (ina->inputs[i].disconnected)
> > +                     ina->reg_config1 &=3D ~INA4230_CONFIG_CHx_EN(i);
> > +     }
> > +
> > +     /* Set calibration values */
> > +     for (i =3D 0; i < INA4230_NUM_CHANNELS; i++) {
> > +             if (!ina->inputs[i].disconnected)
> > +                     ina4230_set_calibration(ina, i);
> > +     }
> > +
> > +     ina->pm_dev =3D dev;
> > +     dev_set_drvdata(dev, ina);
> > +
> > +     /* Enable PM runtime -- status is suspended by default */
> > +     pm_runtime_enable(ina->pm_dev);
> > +
> > +     /* Initialize (resume) the device */
> > +     for (i =3D 0; i < INA4230_NUM_CHANNELS; i++) {
> > +             if (ina->inputs[i].disconnected)
> > +                     continue;
> > +             /* Match the refcount with number of enabled channels */
> > +             ret =3D pm_runtime_get_sync(ina->pm_dev);
> > +             if (ret < 0)
> > +                     goto fail;
> > +     }
> > +
> > +     hwmon_dev =3D devm_hwmon_device_register_with_info(dev, client->n=
ame, ina,
> > +                                                      &ina4230_chip_in=
fo,
> > +                                                      ina4230_groups);
> > +     if (IS_ERR(hwmon_dev)) {
> > +             dev_err(dev, "Unable to register hwmon device\n");
> > +             ret =3D PTR_ERR(hwmon_dev);
>
> just ret =3D dev_err_probe

Ack

Thanks for your review Krzysztof!

Best regards,
Alexey
