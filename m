Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEAF2701B0
	for <linux-hwmon@vger.kernel.org>; Wed, 23 Apr 2025 02:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745375143; cv=none; b=cFBVfW4+j8+jVv7xa7oZlb/JWeivxCYXV1hmwop4zf5/upA5f9GldXy9Wao0P0ZSE0CKHKzlxoK4KidAvjJgDbZyb6NFStZLbo2qBTxe3/dk//IWn2YMk75yT8EZmZNM6ND/GXnsdHJ0XRcCTe53ada21z03h2WvL3+/hRnteeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745375143; c=relaxed/simple;
	bh=Hn1ZIKPfiixtlmBOkzoQtHjMFOjoiyeEcqzFKzghOzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oi+0lMhqwc26seq1BHn5tmNGyakjCMSWNbgk7tbdqyM9Y551x6bgZara1b0xnws/UOb0o+zq9TByoa7y5CWGcwxZLULU+BjxRCGYqb4jYkEmTr2olf5L+vWEWH3+HvsOgXrgX59u989170ZpEMgrfnl/RS7RAJEWVUdLIiD2jmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=KWI/pSQ6; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="KWI/pSQ6"
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 79F973FB68
	for <linux-hwmon@vger.kernel.org>; Wed, 23 Apr 2025 02:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1745375133;
	bh=VZ/wtoYsWd6DgcbKoPTdYSKvbBkgvce35f7alM5I6EI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=KWI/pSQ6oqJtolS6hM1PCwc3BMbYOuJC+xJPMBmSkYK5PQSdos8AHgxF+JQ0jCYFi
	 aYzbRWZM4Nsr7XuxWxWKqpmVHDNkql2FRkciWq79x/j8gRBSnkRZsmVUt70D7UcNDS
	 a3RCs8sny6RtTGYNhIS+9nx5/eTCYDSp9B+XQVW7Qzp3QLHbJLMithk8sreXND0wwU
	 4xXhq9qLeMKxwOsBo5gx5hZhYCU3tUeQpJbycqnlxacakIUpexVRbzF3RPUVtMQo59
	 aHDYc1yfSjdX6AOCkm8kzi56v9WeMZrQ8k9zHEqLBjJBMj1toIgKuwjjFuxzukyX4k
	 m1L3yViN7sL0Q==
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac6b047c0dcso435740566b.0
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Apr 2025 19:25:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745375133; x=1745979933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZ/wtoYsWd6DgcbKoPTdYSKvbBkgvce35f7alM5I6EI=;
        b=lG08kqUbtHuBKAwBhmO511wR2TE1tBkORzUQiv5VP+EO7hxD4aZtDS9/V50id7vWX9
         tJd+tczMVjPMRrI+Ls31z9vv7E1gJ/iiuClijDx0YHNVwlZHQNb6FkqrxmKbWSZkqlh9
         IFkzwa3aLawZQFnnGx+upKnXnCAe2AHi1ASgGDTY0cO3GG/wHuOx54j7+UWjr0WoXPYU
         lqqCKTEpFRis0MJRCVBFXkVDNwh5zTBtaHxomtJJCNVIh9OyNiVyvYBzYO1KaL5qcBuF
         1/xZR2O8Sht56JTdonGUMri2JDWkSFLFH8+Lch1APFuhNfMEQ9Rp2kVSYeCdh1sfYatm
         pdNA==
X-Forwarded-Encrypted: i=1; AJvYcCVCT8y6L8GLrWV08moz3SFJEnMBSqsVI8BaVdtn7dafMqkQPLaDD/1n5t834KzcNYlyWuu+cHbHA2XtYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdudGxww2NgteDdb9hv6d7AdBiXJyE5qFzKmEnY8wIJJymNpvD
	VD/GnPIHI1JGiluW/QaV+Clb5uo6cD+PLhzynIt4To52EgKGjBm3g8sFquVO58DPCFI25LbHN1a
	/aJCtoWbkr6tgKKs8I222LRt10K+t8UFzX10gVvXgb9UCIGBMl2NUXXPL5J9onZenE205xFsnqt
	ArpUUltZyl5el/GYIUdFjrtA4SL7XMkdstLwXLzFd1RDHMrK9RMNI=
X-Gm-Gg: ASbGnctYVK98/pjiX1DJeVRGxz9GfhfEoVWrPMfaOXVtuIAQdqTkf3n0eyFqYVNLMJs
	qywc10oiDzTbZKXu07yuM9+xZNw59HjPPpXX39aAnEvDA8boqi4Gq4peN9GBhilldNTxrpQ==
X-Received: by 2002:a17:906:478f:b0:ac2:9841:3085 with SMTP id a640c23a62f3a-acb74b7743bmr1326232566b.30.1745375132854;
        Tue, 22 Apr 2025 19:25:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIdojfV5b0KyC7J2nTqENIJbr2BkJCKEwKwbnPOKpiorYi9Jw1+vi/xhrySjjMkyatWeUeoTfIjJi9XEZx0sw=
X-Received: by 2002:a17:906:478f:b0:ac2:9841:3085 with SMTP id
 a640c23a62f3a-acb74b7743bmr1326231166b.30.1745375132434; Tue, 22 Apr 2025
 19:25:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416-for-upstream-spd5118-spd-write-prot-detect-v1-0-8b3bcafe9dad@canonical.com>
 <20250416-for-upstream-spd5118-spd-write-prot-detect-v1-2-8b3bcafe9dad@canonical.com>
 <acf31929-5d13-4fc5-b370-ab7fc5062455@roeck-us.net>
In-Reply-To: <acf31929-5d13-4fc5-b370-ab7fc5062455@roeck-us.net>
From: "Yo-Jung (Leo) Lin" <leo.lin@canonical.com>
Date: Wed, 23 Apr 2025 10:25:20 +0800
X-Gm-Features: ATxdqUH5EeFZ6ymv0ydpxwd4RcHCLJqEW0GUNkUaet1rNsKFU1iusKFJFLff8tc
Message-ID: <CABscksOHUdS2jJ2PZQXymheLuX25spxYVGX5Bu0YJxEybvYw+Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] hwmon: (spd5118) restrict writes under SPD write protection
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 6:39=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 4/15/25 23:46, Yo-Jung (Leo) Lin wrote:
> > On some platforms, SPD Write Protection for the SMBus controller may be
> > enabled. For the i801 family, this will forbid writing data to devices
> > residing on addresses from 0x50 to 0x57. This may lead to the following
> > issues:
> >
> >    1) Writes to the sensor hwmon sysfs attributes will always result in
> >       ENXIO.
> >
> >    2) System-wide resume will encounter errors during regcache sync bac=
k,
> >       resulting in the following messages during resume:
> >
> >       kernel: spd5118 1-0050: Failed to write b =3D 0: -6
> >       kernel: spd5118 1-0050: PM: dpm_run_callback(): spd5118_resume [s=
pd5118] returns -6
> >       kernel: spd5118 1-0050: PM: failed to resume async: error -6
> >
>
> Missing:
>
> 3) NVMEM access will fail
>
> > To address this, check if the sensor can be written to at probe, and by=
pass
> > write-related functions if writing to the sensor is not possible.
> >
> > Signed-off-by: Yo-Jung (Leo) Lin <leo.lin@canonical.com>
> > ---
> >   drivers/hwmon/spd5118.c | 31 +++++++++++++++++++++++++++++--
> >   1 file changed, 29 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
> > index 3cb2eb2e0227..9dd5342c31dd 100644
> > --- a/drivers/hwmon/spd5118.c
> > +++ b/drivers/hwmon/spd5118.c
> > @@ -75,6 +75,7 @@ static const unsigned short normal_i2c[] =3D {
> >   struct spd5118_data {
> >       struct regmap *regmap;
> >       struct mutex nvmem_lock;
> > +     bool write_protected;
> >   };
> >
> >   /* hwmon */
> > @@ -284,7 +285,7 @@ static umode_t spd5118_is_visible(const void *_data=
, enum hwmon_sensor_types typ
> >       case hwmon_temp_lcrit:
> >       case hwmon_temp_crit:
> >       case hwmon_temp_enable:
> > -             return 0644;
> > +             return data->write_protected ? 0444 : 0644;
> >       case hwmon_temp_min_alarm:
> >       case hwmon_temp_max_alarm:
> >       case hwmon_temp_crit_alarm:
> > @@ -499,7 +500,7 @@ static const struct regmap_range_cfg spd5118_regmap=
_range_cfg[] =3D {
> >       },
> >   };
> >
> > -static const struct regmap_config spd5118_regmap_config =3D {
> > +static struct regmap_config spd5118_regmap_config =3D {
> >       .reg_bits =3D 8,
> >       .val_bits =3D 8,
> >       .max_register =3D 0x7ff,
> > @@ -563,6 +564,21 @@ static int spd5118_init(struct i2c_client *client)
> >       return 0;
> >   }
> >
> > +static bool spd5118_write_protected(struct i2c_client *client)
> > +{
> > +     struct device *dev =3D &client->dev;
> > +     int mode =3D 0;
> > +     int err =3D 0;
>
> Both initializations are unnecessary.
>
> > +
> > +     mode =3D i2c_smbus_read_byte_data(client, SPD5118_REG_I2C_LEGACY_=
MODE);
> > +     if (mode < 0)
> > +             dev_warn(dev, "Failed to read MR11: %d", mode);
> > +
> > +     err =3D i2c_smbus_write_byte_data(client, SPD5118_REG_I2C_LEGACY_=
MODE, mode);
> > +
>
> That would try to write the error back if MR11 can not be read, which wou=
ld be
> a bad idea. If the register is not even readable, being able to write it =
is of
> secondary concern.
>
> > +     return (err < 0);
>
> I think this requires a better means to determine if the address range is=
 write
> protected. The above is just a wild guess, after all.

For now I'll probably approach this from the i801 side (as later part
of your comments suggest), and skip the device instantiation if write
protection is enabled.

>
> Isn't this already handled somehow for DDR4 nvmem (ee1004) ? That has ult=
imately
> the same problem because ee1004 devices can not be accessed if the i2c ad=
dress
> range is write protected.

From ee1004_probe_temp_sensor() I think that the temperature sensor on
ee1004 (jc42) uses address 0x18, and the ee1004 itself at 0x5*
addresses seems to be just an read-only eeprom and has no pm
operations. That's probably why it evades the issue of write
disabling.

>
> > +}
> > +
> >   static int spd5118_probe(struct i2c_client *client)
> >   {
> >       struct device *dev =3D &client->dev;
> > @@ -580,6 +596,11 @@ static int spd5118_probe(struct i2c_client *client=
)
> >       if (!data)
> >               return -ENOMEM;
> >
> > +     if (spd5118_write_protected(client)) {
> > +             data->write_protected =3D true;
> > +             spd5118_regmap_config.cache_type =3D REGCACHE_NONE;
> > +     }
> > +
>
> This is insufficient, and overwriting spd5118_regmap_config is not a good=
 idea.
> It should be a completely separate configuration which does not list any =
writeable
> registers. I also don't see the value in dropping register caching entire=
ly.
>
> However, even that is insufficient: The driver relies on the register ran=
ge
> being writeable. It is not immediately visible, but the regmap code write=
s
> MR11 to select the nvmem page. If this fails, the entire driver is unusab=
le.
> At the very least nvmem access would have to be disabled. However, if the=
 ROM
> monitor left the chip in read-only state and had set the page to a value =
!=3D 0
> (I have seen that with some motherboards), temperature monitoring would n=
ot work
> either at least for memory with spd chips from manufacturers who took the
> specification literally (such as Renesas).
>
> That does not apply if the chip is programmed in 16-bit mode (which is no=
t
> currently supported), making handling the situation even more complicated=
.
>
> I think that drivers/i2c/busses/i2c-i801.c should detect if the address s=
pace
> is write protected, and the driver should not even try to instantiate if =
that
> is the case.
>
> _If_ the driver is to be instantiated, the write protect flag should be p=
assed
> to the driver from the instantiating code, for example with a device prop=
erty.

Although I'll try not instantiate the device at all for now, in case
that there are some users that still think reading DRAM temperature is
helpful, if I were to add a device property here at runtime (e.g. in
i2c_register_spd), should I also update its devicetree binding?

>
> >       regmap =3D devm_regmap_init_i2c(client, &spd5118_regmap_config);
> >       if (IS_ERR(regmap))
> >               return dev_err_probe(dev, PTR_ERR(regmap), "regmap init f=
ailed\n");
> > @@ -638,6 +659,9 @@ static int spd5118_suspend(struct device *dev)
> >       u32 regval;
> >       int err;
> >
> > +     if (data->write_protected)
> > +             return 0;
> > +
> >       /*
> >        * Make sure the configuration register in the regmap cache is cu=
rrent
> >        * before bypassing it.
> > @@ -662,6 +686,9 @@ static int spd5118_resume(struct device *dev)
> >       struct spd5118_data *data =3D dev_get_drvdata(dev);
> >       struct regmap *regmap =3D data->regmap;
> >
> > +     if (data->write_protected)
> > +             return 0;
> > +
>
> suspend/resume support should be disabled completely in this situation
> since it is very much pointless.
>
> Worse, if the BIOS for some reason decides to select a different (non-zer=
o)
> page on resume, the driver would be completely inoperable after resume.
> That is another argument for not instantiating it in the first place
> if this is the case. The impact is just completely unpredictable.
Wouldn't this already be catched spd5118_init() function, where the
driver would attempt to overwrite the MR11, and the device won't even
probe successfully if that fails?


>
> Guenter
>
> >       regcache_cache_only(regmap, false);
> >       return regcache_sync(regmap);
> >   }
> >
>
