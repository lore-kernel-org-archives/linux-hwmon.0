Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBC02F693A
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 14:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760710276; cv=none; b=C7w0O94bMbE5fi10pWZeDzqBFbIrXmHTj86jSkDBqdifnqoht3+RRVOYMgdhbUWQBTbg5ZYc3Ed3QhNCXu3mcJopNOGt8PVyft8rEET7wELfvQ7RtrkNWo0cOgbpzBnGh8/1NYKZ1GVCUCd++Qtj9WW8BxHq5Fuxp7ii/x8layY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760710276; c=relaxed/simple;
	bh=5P3FWayNN00xE1izlOKPyfHjnsiOhPYb4wIyB4zilEA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HtWTIEB1jiw5rGnbSo9wFy/YoUhEpHkRF6EtyE7sxEj3A+WGgwTROc9dhCAqIJmtvhheKHi3ti+VMgYbgbkFPCMwa2URJXeXUwMhEUDhjmMM9YPzfJFgv1r3/j3PVW+H+C1c+BXbzvQgZzaYQeY+uXpef1JFEiysPV7uPcb1wEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WyjvzzMQ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WyjvzzMQ"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-426fc536b5dso1088717f8f.3
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 07:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760710273; x=1761315073; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0FvY6emry2xk5qb8nFBUl+OwEKRDnuB/pcOyKNi3Ak=;
        b=WyjvzzMQCQEffId7DxxdyXpXwupQJ+l8y3iY4O/sGSwVaU0SnYK1m9TcjnOElB8Zcy
         TGUa5Bu3tl4HzHrspO/ADHAPu68H3YY5rQcnDrEDD+I+H8FNHng2Mg3Ydn+0Wi/6mu91
         KSO41aS3Zmt8NfqgDjvqS6fiVisYh+Q6AdOTfFOVf+8jABk0JcGsfbSWhHjKEY73egjq
         ycMcRoz4DIInL8h6IdBM/kqDliNIfnAWLSH7NNnyw88EwpVPf1V6aa6jijU5Ieh2RqzJ
         JibfuiBXBzTDPnKrvYrvIE0Cc/Q4lvzztUHhtHq8Cexh+F0A2lYxr/W2cijv3IhW4zds
         9YQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760710273; x=1761315073;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P0FvY6emry2xk5qb8nFBUl+OwEKRDnuB/pcOyKNi3Ak=;
        b=J6HgSH26T2FBpYeooyyuMg8+lsy/ln3K6BEs1wrI2QF4mGCXoegrML32verI05zdXZ
         QKCl+L7RU3dbxWeLj+Ta5otm6mOSwj724Iyh7OKZ7PvOze2RRG5I5RgJhAr6eDYxlCMp
         Ps309aa7lKOwHsQNldj+O4u7W+laEAL8Xksm5QT99C3jOhOgvyU31lSd6tMSrEThTkmI
         GPig4YYmdYY3bHxPa38voTevF42T56gwFwgxPhPlsoCpAAR6ndxGeX22xwLgHauHrL4e
         yrGQdglSSruLExgAPIg1mDyx2S8Aa2rCauurJ3sQ0v7kwEZcp0moD7RnqugDLFxxD1Z0
         p4HA==
X-Forwarded-Encrypted: i=1; AJvYcCVL71tfIHRPcRhl978t7bjP9LHvCr7Ljn/HFmf5bshkTgSYvHCqLKdrwBQKxxbJhQDPJVdILHCOZwPE6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjk+MyalrHivzDjNlll8JFOaSiiyQv4Z/H4gXokMxOQKoHfIiK
	ZcaqevrA8vPIQypNduEZEx/kZefk+M5aWzzDGvCR3QpXFBeM75YOhTLs
X-Gm-Gg: ASbGncsUHbMzmw05OZZoM1W0ju64f6GkzNl6m2zs/hWcLtE9YMils4eNGxDHCBnMyw5
	oUV1HeePjlFfYgJ25YU62KYXVuWBjHBrHY+JNKIjmdXKnZ8DCBYpRKdLBVGw3iIlt6jqo9BagxL
	DgbABpndYG7wn3rE8G4easFaU2v1t1ZlhHK1iN4JQm4/VvbBHKzCRSbzg1bOQj03hcFtanVcscY
	hzIJ0Sx1e8CztMLZGGC5matLWOEcH4DRVWVVpE3862k/0X+o1I8c/TwBy/4EZO/jIwaUcios/eS
	kn744z1UlPqRGyoKCYj0Vv6FuL7c2AfyLxqrFRpOaZjT0mIxqXA0cweGvEMsKi93yKnL/4ncE8v
	ekQYcykyDtujWHMkur+yCsNpRDID4rDBGJ0i2VcSBYRe6bfQo4eadxO07BqXVUlqhzw/hwsbziA
	TQu1RXhC+k
X-Google-Smtp-Source: AGHT+IGNjNRoHux9l1D72Lo4wLqc+aWKoQWKfO+x0ag5KB1j5eqVQUC3AcEN75FwfLpHp0cmSUVffg==
X-Received: by 2002:a05:6000:24c9:b0:427:6a4:93d0 with SMTP id ffacd0b85a97d-42706a49731mr1897954f8f.59.1760710272798;
        Fri, 17 Oct 2025 07:11:12 -0700 (PDT)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4711444d919sm85434015e9.14.2025.10.17.07.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 07:11:12 -0700 (PDT)
Message-ID: <6029ec6e9dd59fd121a333223a5ab9e2b0d92b7e.camel@gmail.com>
Subject: Re: [PATCH 17/29] hwmon: (ltc2947-core) Rely on subsystem locking
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Hardware Monitoring
	 <linux-hwmon@vger.kernel.org>
Date: Fri, 17 Oct 2025 15:11:45 +0100
In-Reply-To: <20251017130221.1823453-18-linux@roeck-us.net>
References: <20251017130221.1823453-1-linux@roeck-us.net>
	 <20251017130221.1823453-18-linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-10-17 at 06:02 -0700, Guenter Roeck wrote:
> Attribute access is now serialized in the hardware monitoring core,
> so locking in the driver code is no longer necessary. Drop it.
>=20
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---

Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>

> =C2=A0drivers/hwmon/ltc2947-core.c | 32 +++++---------------------------
> =C2=A01 file changed, 5 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/hwmon/ltc2947-core.c b/drivers/hwmon/ltc2947-core.c
> index 90f70f732b41..ad7120d1e469 100644
> --- a/drivers/hwmon/ltc2947-core.c
> +++ b/drivers/hwmon/ltc2947-core.c
> @@ -120,12 +120,6 @@
> =C2=A0struct ltc2947_data {
> =C2=A0	struct regmap *map;
> =C2=A0	struct device *dev;
> -	/*
> -	 * The mutex is needed because the device has 2 memory pages. When
> -	 * reading/writing the correct page needs to be set so that, the
> -	 * complete sequence select_page->read/write needs to be protected.
> -	 */
> -	struct mutex lock;
> =C2=A0	u32 lsb_energy;
> =C2=A0	bool gpio_out;
> =C2=A0};
> @@ -181,13 +175,9 @@ static int ltc2947_val_read(struct ltc2947_data *st,
> const u8 reg,
> =C2=A0	int ret;
> =C2=A0	u64 __val =3D 0;
> =C2=A0
> -	mutex_lock(&st->lock);
> -
> =C2=A0	ret =3D regmap_write(st->map, LTC2947_REG_PAGE_CTRL, page);
> -	if (ret) {
> -		mutex_unlock(&st->lock);
> +	if (ret)
> =C2=A0		return ret;
> -	}
> =C2=A0
> =C2=A0	dev_dbg(st->dev, "Read val, reg:%02X, p:%d sz:%zu\n", reg, page,
> =C2=A0		size);
> @@ -207,8 +197,6 @@ static int ltc2947_val_read(struct ltc2947_data *st, =
const
> u8 reg,
> =C2=A0		break;
> =C2=A0	}
> =C2=A0
> -	mutex_unlock(&st->lock);
> -
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> @@ -242,13 +230,10 @@ static int ltc2947_val_write(struct ltc2947_data *s=
t,
> const u8 reg,
> =C2=A0{
> =C2=A0	int ret;
> =C2=A0
> -	mutex_lock(&st->lock);
> =C2=A0	/* set device on correct page */
> =C2=A0	ret =3D regmap_write(st->map, LTC2947_REG_PAGE_CTRL, page);
> -	if (ret) {
> -		mutex_unlock(&st->lock);
> +	if (ret)
> =C2=A0		return ret;
> -	}
> =C2=A0
> =C2=A0	dev_dbg(st->dev, "Write val, r:%02X, p:%d, sz:%zu, val:%016llX\n",
> =C2=A0		reg, page, size, val);
> @@ -265,8 +250,6 @@ static int ltc2947_val_write(struct ltc2947_data *st,
> const u8 reg,
> =C2=A0		break;
> =C2=A0	}
> =C2=A0
> -	mutex_unlock(&st->lock);
> -
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> @@ -295,11 +278,9 @@ static int ltc2947_alarm_read(struct ltc2947_data *s=
t,
> const u8 reg,
> =C2=A0
> =C2=A0	memset(alarms, 0, sizeof(alarms));
> =C2=A0
> -	mutex_lock(&st->lock);
> -
> =C2=A0	ret =3D regmap_write(st->map, LTC2947_REG_PAGE_CTRL, LTC2947_PAGE0=
);
> =C2=A0	if (ret)
> -		goto unlock;
> +		return ret;
> =C2=A0
> =C2=A0	dev_dbg(st->dev, "Read alarm, reg:%02X, mask:%02X\n", reg, mask);
> =C2=A0	/*
> @@ -310,13 +291,11 @@ static int ltc2947_alarm_read(struct ltc2947_data *=
st,
> const u8 reg,
> =C2=A0	ret =3D regmap_bulk_read(st->map, LTC2947_REG_STATUS, alarms,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(alarms));
> =C2=A0	if (ret)
> -		goto unlock;
> +		return ret;
> =C2=A0
> =C2=A0	/* get the alarm */
> =C2=A0	*val =3D !!(alarms[offset] & mask);
> -unlock:
> -	mutex_unlock(&st->lock);
> -	return ret;
> +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static int ltc2947_read_temp(struct device *dev, const u32 attr, lo=
ng *val,
> @@ -1100,7 +1079,6 @@ int ltc2947_core_probe(struct regmap *map, const ch=
ar
> *name)
> =C2=A0	st->map =3D map;
> =C2=A0	st->dev =3D dev;
> =C2=A0	dev_set_drvdata(dev, st);
> -	mutex_init(&st->lock);
> =C2=A0
> =C2=A0	ret =3D ltc2947_setup(st);
> =C2=A0	if (ret)
