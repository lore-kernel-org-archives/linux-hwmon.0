Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559501DF248
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Mar 2026 01:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774315057; cv=pass; b=onK9daLeH1emWDC3L8YWbm0UvuRFK7sRL1rygAY2R5sLsp7EYWjV8Pnef69C7hSkQyUMhZSgZD57P5TjWmgVg0jbGPtWpvOfmD6PHiosDe0hvU1H2w0twoyUW4AMcpc0xSYQ4XpSjiZIv2dcfvxykYa9Oxr7G0O/grs+wf68gJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774315057; c=relaxed/simple;
	bh=C11AH1kVww8sFK0ry6pxhuwgoBhS3WLX7gzIk3cVokw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O6d70uo9t0628H/tQL5V2rWeQ2QyTk6fA9Dzr1+FoO9sHFA/3POYMpscJmYbRfXOlhtLrqUzFvuc1SKV9k3nTYbVq5TEA+ojRIeHJ3NpBQWW7O5gVHmrmGFUGAFPKQnkLWxoYSlJlgOkNKkbz8QmynxoI/IuM8B92Ul1ujtmdzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Lv7XH5QG; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Lv7XH5QG"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38bf85e4810so5908641fa.2
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Mar 2026 18:17:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774315052; cv=none;
        d=google.com; s=arc-20240605;
        b=JxoF2tWIyjSqFtW7qQQa+PHva40lMXAWOmxaQhI8QKKjzGlfrzENVZRlFSS6rzDono
         UXdnTcmrWpmeucgU+V0b6b1rB4tvBKy6cibBLX2dIN9efPCoSgfmlFgqi2eip6DrRszc
         lCNmFxmAHzF2atU8l/EnylCkePJdA3JSfNXP5gztpVhkJWN+XXb0aSM46Q3OS2GrpiFM
         sjt6dPoQ97U7SsRv9Y597ScUB/KqmjzipLRZWb5mQaXkSJ4sPI0DiH2EZ77u2DzNV855
         /+44Psi4fXfu95DU57Aa+6oyXWtDs04wKNnj8ZRAG/TJu8Lnx/O/KoBqmPSsfNgWJEyV
         gziw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hfwM8KSN40LrO6gLEbXFjV/MW1Yh6JfamdSS45rUHbM=;
        fh=s+n1mMIejNazbvB2WNr08JyFIUW/R7f6zgzwF3k/xLs=;
        b=hmd6630ui1QH3g2aHw7CAG4eB2I8+ceURQxsD22ynzihfXdkWQ0PZOikaI16uUqkra
         9dx3Ch03ynaszX3BWjb233UxhKrfmBXDeuJcw3P/dQ1jupxPb6dUbyZxAL4bCBzVogrY
         drInwanG5wI+3WipBOKDPtvYxYu5EKPtFtyAuH7mS9H3XUDfxFeQ08AHkUjXjggL1TIm
         KbmAkK63+IuKIWST9AaFVzQgLOHqxa2UPtSfQHlPIJ62KzFln/g9lbKMUcD19slJtyP+
         9L8CLp/e5cIkQNeURP9Evto7SNUiBskXB0adYubQH3bTAqD4047zRY+s4hcIdSdfmuj8
         H54A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1774315052; x=1774919852; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hfwM8KSN40LrO6gLEbXFjV/MW1Yh6JfamdSS45rUHbM=;
        b=Lv7XH5QG6X1qvbBSakahrH8IGsrGtfsoJIAZLpWmFaCF16MA1XIRU07wudtZPKwSri
         JpybmGOowaw5jARTMRRr9GrQdgTKADjC+cymvGtf9LFW2mZz8ZX9/kMWf250Ia78GhMs
         bBKajRaK5SLvCYGRlbmecV8flv5EHXNJ0cY4wjlzuQDI/oX3tOFtrp3SmswSjPLctXvf
         OiBhHpy8U7XD6Pwsm5EiQ9TiWe9btf7liUnSLTFNK0KDUGPURWe1oajD7olBM7dpjyCB
         0QRIKazkSw8SCYfbpYoTsvm7DfwdNO7O00gm7aqipVlj9HLwRrMtzvC5cZsPtUNUMcav
         usFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774315052; x=1774919852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hfwM8KSN40LrO6gLEbXFjV/MW1Yh6JfamdSS45rUHbM=;
        b=AuyWI2/xoN/kOPK23jqmFx8s0yI+8j2SOxLrajavc7uBzrnqj7xW1YuZ+jBN9OUKek
         5s0ZmLhYfoVwhxKJ9ERBb6kyAzzx9EbYL1+/oQT8wljcdGtoF4U+2dP/WidlU0aIP94E
         LUrhJZ3/XxFgaxaUmt1v+tdAhjs1peotjA1uG+LKGADaKsdT+Exl+oCKh28/1yR5WRWX
         +b+dgs8b9siuUpl4t3e9SiEC3tWgHXzaWcC6dB1pqxuQtD/COnI0iDmiMjfPda+kC1IO
         oGtbJYRiwJSIDRXKlHy6kkEK9O1ZrtgWwgnKSEIIo+H1/vBUStekUt9iyCqSYGRLOh/d
         UL8A==
X-Forwarded-Encrypted: i=1; AJvYcCVeTxFtK8y0dtKuVx6wA8m7bls/THvP++0khoN9QM22DZZFlL6Q4Gg+K1vLVXaI+SpA533rO8NcgZZcdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIRYFF+8lyzbQU5iVZJeGTn3nxkg3QZ8S44NbVncp/Kt43zH2b
	k/CXvp1RD56GqQNJGNjHM7XLFOiYa0vtV6NY4SL0tWx35LmylTzTrZrgdBZFPgNr9krsxSvispD
	UCDJQB1rX1LhzSTXBvJksBVt8cd3KZ0MIxjoq566FZA==
X-Gm-Gg: ATEYQzwhLKQ8jkMgFiphuhb92Tb6tK7SWsAR1/6fG6MYFu2vevKzrcfGr9QdPvoxlVA
	n6W5RHEx7xwIqAonqH7M2i1qinDj7cEKQqL+l7ezHnEwZMDzImLm1DpYdxh3zlWOJNvWRlTo+G3
	ycJXGLzi/j0/OseCKelkCtNSycPUR73/rrJMDLf4eIooxRnuXweaFLvHzkI2vodRnkukF0SD9LC
	gIqdHxuRJjHWpGVZKbIhfN53r3o2dBi29tzmlk5uezW9TiVIc+jBpcrryk3TMIztCPKDX66M5IU
	lsMZOhcCARLwJzDSxnGkYAyCvZcHSjcx50ZVG98+xj6O3SJZ3YF0EsqznMQF5cbub88=
X-Received: by 2002:a2e:8a94:0:b0:38b:fbb9:42d4 with SMTP id
 38308e7fff4ca-38bfbb96a60mr42209251fa.15.1774315051920; Mon, 23 Mar 2026
 18:17:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260217081203.1792025-1-sbogdanov@baylibre.com>
 <20260217081203.1792025-2-sbogdanov@baylibre.com> <8f691afc-cac1-4583-9c64-68372644aa1d@roeck-us.net>
In-Reply-To: <8f691afc-cac1-4583-9c64-68372644aa1d@roeck-us.net>
From: Stoyan Bogdanov <sbogdanov@baylibre.com>
Date: Tue, 24 Mar 2026 03:17:21 +0200
X-Gm-Features: AaiRm52Q-LudHWUdkyfb4NRH3cblijITVGbekAmUdXhLCS0V6BXudIgrWN3tW9I
Message-ID: <CAJ83Ew7ggUBNsydZE3rPjdLDk5QCENeMkkw7_uTdKubBVHDWrg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] hwmon: (pmbus/tps25990): Rework TPS25990 non
 standatd direct conversion
To: Guenter Roeck <linux@roeck-us.net>
Cc: jbrunet@baylibre.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 8, 2026 at 7:27=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On Tue, Feb 17, 2026 at 10:12:01AM +0200, Stoyan Bogdanov wrote:
> > Rework existing implementation for calculation of direct
> > format conversion for TPS25990. With this implamentation
> > is leveraged code reusability for non standard parameters.
> >  - Add enum for parameter
> >  - Add m, b, R structure to hold value per device
> >  - Add data structure to hold for pmbus_driver_info and
> >    local_direct_values
> >  - Conversion functions are implemented according to formula from
> >    TPS25990 datasheet
> >  - Remove previously used defines replace with structure
> >
> > Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>
> > ---
> >  drivers/hwmon/pmbus/tps25990.c | 115 +++++++++++++++++++++++++--------
> >  1 file changed, 88 insertions(+), 27 deletions(-)
> >
> > diff --git a/drivers/hwmon/pmbus/tps25990.c b/drivers/hwmon/pmbus/tps25=
990.c
> > index c13edd7e1abf..33f6367f797c 100644
> > --- a/drivers/hwmon/pmbus/tps25990.c
> > +++ b/drivers/hwmon/pmbus/tps25990.c
> > @@ -36,17 +36,58 @@
> >  #define  TPS25990_UNLOCKED           BIT(7)
> >
> >  #define TPS25990_8B_SHIFT            2
> > -#define TPS25990_VIN_OVF_NUM         525100
> > -#define TPS25990_VIN_OVF_DIV         10163
> > -#define TPS25990_VIN_OVF_OFF         155
> > -#define TPS25990_IIN_OCF_NUM         953800
> > -#define TPS25990_IIN_OCF_DIV         129278
> > -#define TPS25990_IIN_OCF_OFF         157
> >
> >  #define PK_MIN_AVG_RST_MASK          (PK_MIN_AVG_RST_PEAK | \
> >                                        PK_MIN_AVG_RST_AVG  | \
> >                                        PK_MIN_AVG_RST_MIN)
> >
> > +enum tps25990_parameters {
> > +     TPS25990_VIN_OVF =3D 0, /* VIN over volatage fault */
> > +     TPS25990_IIN_OCF, /* IIN Over currect fault */
> > +     TPS25590_DIRECT_VALUES_MAX, /* Max value ensure there enough spac=
e */
> > +};
> > +
> > +struct local_direct_value {
> > +     int m[TPS25590_DIRECT_VALUES_MAX]; /* mantissa for direct data fo=
rmat */
> > +     int b[TPS25590_DIRECT_VALUES_MAX]; /* offset */
> > +     int R[TPS25590_DIRECT_VALUES_MAX]; /* exponent */
> > +};
> > +
> > +struct tps25990_data {
> > +     struct pmbus_driver_info *info;
> > +     struct local_direct_value *info_local;
> > +};
> > +
> > +static int tps25990_raw_to_value(struct i2c_client *client, int param,=
 int raw)
> > +{
> > +     struct tps25990_data *data =3D (struct tps25990_data *)of_device_=
get_match_data(&client->dev);
>
> This returns the global data structure (which is corrupted on
> multi-instance systems) instead of per-instance data.

Noted, will fix that in next revision.

> > +     struct local_direct_value *info_local =3D data->info_local;
> > +
> > +     /* Formula : X =3D (Y / 10^R - b) / m */
> > +     if (info_local->R[param] >=3D 0)
> > +             raw /=3D int_pow(10, info_local->R[param]);
> > +     else
> > +             raw *=3D int_pow(10, -info_local->R[param]);
>
> This will overflow if the exponent is -6 and raw is larger than ~2147.
> This may not happen with current parameters, but it is brittle.
>

I understand that the whole calculation is fragile
Another approach will be to break it in to phases, but it will lost precisi=
on

// make sure R is positive
u32 r_pos =3D info_local->R[param] >=3D 0 ? info_local->R[param] :
-info_local->R[param];

// if (r_pos < 9) will overflow 32bit
u32 r_pow =3D int_pow(10, r_pos);

if (info_local->R[param] >=3D 0) {
    val =3D DIV_ROUND_CLOSEST_ULL(raw , r_pow); // result should fit in 32b=
it
    val -=3D info_local->b[param]; // fit 32bit
    val =3D DIV_ROUND_CLOSEST(val , info_local->m[param]); // fit 32bit
} else { // info_local->R[param] < 0
    // val =3D raw * r_pos; // most likely will overflow 32 bit with big nu=
mbers
    // raw * r_pow / m
    // assume r_pow is bigger number
    val =3D DIV_ROUND_CLOSEST(r_pow , info_local->m[param]); // fit 32bit
    val =3D raw * val;
    b_div =3D DIV_ROUND_CLOSEST(info_local->b[param],
info_local->m[param]); // fit 32bit
    val -=3D b_div;
}

> > +
> > +     return DIV_ROUND_CLOSEST(raw - info_local->b[param], info_local->=
m[param]);
> > +}
> > +
> > +static unsigned int tps25990_value_to_raw(struct i2c_client *client, i=
nt param, int val)
> > +{
> > +     struct tps25990_data *data =3D (struct tps25990_data *)of_device_=
get_match_data(&client->dev);
> > +     struct local_direct_value *info_local =3D data->info_local;
> > +
> > +     /* Formula : Y =3D ( m * X + b) * 10^R */
> > +     val =3D (long)val * info_local->m[param] + info_local->b[param];
>
> This will overflow on 32-bit systems (where long is a 32-bit value).
>

Similar approach could be used as in tps25990_raw_to_value

> > +
> > +     if (info_local->R[param] >=3D 0)
> > +             val *=3D int_pow(10, info_local->R[param]);
> > +     else
> > +             val =3D DIV_ROUND_CLOSEST(val, int_pow(10, -info_local->R=
[param]));
> > +
> > +     return val;
> > +}
> > +
> >  /*
> >   * Arbitrary default Rimon value: 1kOhm
> >   * This correspond to an overcurrent limit of 55A, close to the specif=
ied limit
> > @@ -184,9 +225,7 @@ static int tps25990_read_word_data(struct i2c_clien=
t *client,
> >               ret =3D pmbus_read_word_data(client, page, phase, reg);
> >               if (ret < 0)
> >                       break;
> > -             ret =3D DIV_ROUND_CLOSEST(ret * TPS25990_VIN_OVF_NUM,
> > -                                     TPS25990_VIN_OVF_DIV);
> > -             ret +=3D TPS25990_VIN_OVF_OFF;
> > +             ret =3D tps25990_raw_to_value(client, TPS25990_VIN_OVF, r=
et);
> >               break;
> >
> >       case PMBUS_IIN_OC_FAULT_LIMIT:
> > @@ -198,9 +237,7 @@ static int tps25990_read_word_data(struct i2c_clien=
t *client,
> >               ret =3D pmbus_read_byte_data(client, page, TPS25990_VIREF=
);
> >               if (ret < 0)
> >                       break;
> > -             ret =3D DIV_ROUND_CLOSEST(ret * TPS25990_IIN_OCF_NUM,
> > -                                     TPS25990_IIN_OCF_DIV);
> > -             ret +=3D TPS25990_IIN_OCF_OFF;
> > +             ret =3D tps25990_raw_to_value(client, TPS25990_IIN_OCF, r=
et);
> >               break;
> >
> >       case PMBUS_VIRT_SAMPLES:
> > @@ -246,17 +283,13 @@ static int tps25990_write_word_data(struct i2c_cl=
ient *client,
> >               break;
> >
> >       case PMBUS_VIN_OV_FAULT_LIMIT:
> > -             value -=3D TPS25990_VIN_OVF_OFF;
> > -             value =3D DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25=
990_VIN_OVF_DIV,
> > -                                       TPS25990_VIN_OVF_NUM);
> > +             value =3D tps25990_value_to_raw(client, TPS25990_VIN_OVF,=
 value);
> >               value =3D clamp_val(value, 0, 0xf);
> >               ret =3D pmbus_write_word_data(client, page, reg, value);
> >               break;
> >
> >       case PMBUS_IIN_OC_FAULT_LIMIT:
> > -             value -=3D TPS25990_IIN_OCF_OFF;
> > -             value =3D DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25=
990_IIN_OCF_DIV,
> > -                                       TPS25990_IIN_OCF_NUM);
> > +             value =3D tps25990_value_to_raw(client, TPS25990_IIN_OCF,=
 value);
> >               value =3D clamp_val(value, 0, 0x3f);
> >               ret =3D pmbus_write_byte_data(client, page, TPS25990_VIRE=
F, value);
> >               break;
> > @@ -337,7 +370,16 @@ static const struct regulator_desc tps25990_reg_de=
sc[] =3D {
> >  };
> >  #endif
> >
> > -static const struct pmbus_driver_info tps25990_base_info =3D {
> > +struct local_direct_value tps25590_local_info =3D {
> > +     .m[TPS25990_VIN_OVF] =3D 10163,
> > +     .b[TPS25990_VIN_OVF] =3D -30081,
> > +     .R[TPS25990_VIN_OVF] =3D -4,
> > +     .m[TPS25990_IIN_OCF] =3D 9538,
> > +     .b[TPS25990_IIN_OCF] =3D 0,
> > +     .R[TPS25990_IIN_OCF] =3D -6,
> > +};
> > +
> > +static struct pmbus_driver_info tps25990_base_info =3D {
> >       .pages =3D 1,
> >       .format[PSC_VOLTAGE_IN] =3D direct,
> >       .m[PSC_VOLTAGE_IN] =3D 5251,
> > @@ -386,14 +428,19 @@ static const struct pmbus_driver_info tps25990_ba=
se_info =3D {
> >  #endif
> >  };
> >
> > +struct tps25990_data data_tps25990 =3D {
> > +     .info =3D &tps25990_base_info,
> > +     .info_local =3D &tps25590_local_info,
> > +};
> > +
> >  static const struct i2c_device_id tps25990_i2c_id[] =3D {
> > -     { "tps25990" },
> > +     { .name =3D "tps25990", .driver_data =3D (kernel_ulong_t)&data_tp=
s25990 },
> >       {}
> >  };
> >  MODULE_DEVICE_TABLE(i2c, tps25990_i2c_id);
> >
> >  static const struct of_device_id tps25990_of_match[] =3D {
> > -     { .compatible =3D "ti,tps25990" },
> > +     { .compatible =3D "ti,tps25990", .data =3D &data_tps25990 },
> >       {}
> >  };
> >  MODULE_DEVICE_TABLE(of, tps25990_of_match);
> > @@ -401,23 +448,37 @@ MODULE_DEVICE_TABLE(of, tps25990_of_match);
> >  static int tps25990_probe(struct i2c_client *client)
> >  {
> >       struct device *dev =3D &client->dev;
> > -     struct pmbus_driver_info *info;
> > +     struct tps25990_data *data;
> >       u32 rimon =3D TPS25990_DEFAULT_RIMON;
> > +     struct pmbus_driver_info *info_get;
> > +     struct local_direct_value *info_local_get;
> >       int ret;
> >
> >       ret =3D device_property_read_u32(dev, "ti,rimon-micro-ohms", &rim=
on);
> >       if (ret < 0 && ret !=3D -EINVAL)
> >               return dev_err_probe(dev, ret, "failed to get rimon\n");
> >
> > -     info =3D devm_kmemdup(dev, &tps25990_base_info, sizeof(*info), GF=
P_KERNEL);
> > -     if (!info)
> > +     data =3D (struct tps25990_data *)of_device_get_match_data(dev);
> > +     if (!data)
> > +             return -EOPNOTSUPP;
>
> By calling of_device_get_match_data() which returns NULL on non-devicetre=
e
> systems, this patch breaks support for such systems.
>

I understand , will fix that in next revision

> > +
> > +     info_get =3D data->info;
> > +     /* Make copy of pmbus_info and replace it to preserve original va=
lues */
> > +     data->info =3D devm_kmemdup(dev, info_get, sizeof(*info_get), GFP=
_KERNEL);
>
> This overwrites information in the global data structure returned by
> of_device_get_match_data(). When multiple instances of the device exist,
> each subsequent probe overwrites the global pointer. If any device is
> removed, the global pointer now points to freed memory, leading to a
> Use-After-Free when other instances access it via of_device_get_match_dat=
a
> or during their own removal/re-probe.
>
> This also completely breaks multi-instance support.
>

I understand , will fix that in next revision


> > +     if (!data->info)
> > +             return -ENOMEM;
> > +
> > +     info_local_get =3D data->info_local;
> > +     /* Make copy of pmbus_info and replace it to preserve original va=
lues */
> > +     data->info_local =3D devm_kmemdup(dev, info_local_get, sizeof(*in=
fo_local_get), GFP_KERNEL);
> > +     if (!data->info_local)
> >               return -ENOMEM;
> >
> >       /* Adapt the current and power scale for each instance */
> > -     tps25990_set_m(&info->m[PSC_CURRENT_IN], rimon);
> > -     tps25990_set_m(&info->m[PSC_POWER], rimon);
> > +     tps25990_set_m(&data->info->m[PSC_CURRENT_IN], rimon);
> > +     tps25990_set_m(&data->info->m[PSC_POWER], rimon);
> >
> > -     return pmbus_do_probe(client, info);
> > +     return pmbus_do_probe(client, data->info);
> >  }
> >
> >  static struct i2c_driver tps25990_driver =3D {
