Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034E313D891
	for <linux-hwmon@vger.kernel.org>; Mon, 13 Oct 2025 11:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760355211; cv=none; b=L2iz1z7Pdaub5Q51uxDXh8veK9/1RnxDMXxM9JjOC0nGVjD9mPJsJbvYGutVXHRMOY6V/39qjONa7CZOaaU5n5yR1Ogc2sVwrfEEkW7E1OViqhcpVDlcUI8GdckSAJz+WPQ13f9R2CxNPES5rJL3u6et41hbzYMhQyQecUovr5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760355211; c=relaxed/simple;
	bh=Vfo9E72PBnSd5L+xLZHlBSu2urtMyE30kc84/qANRcs=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JW4ILlmbj0iejq7gIkn14IpUBS/f0sObHfNud17lVHBNEd/yPWgn02n+aPtnY4omLN4XHIIM5dzalYTh2SEo7OoM8lBtjbHSpEfXl9cor5NRsAOOmIeqM2oS+vC/SZ5sqO4hIP8Qj6PMkV95dG7o9Uj6lIu9bl8co1+9VF2AkIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HvQ3E7Kf; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HvQ3E7Kf"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-46e34052bb7so49538595e9.2
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Oct 2025 04:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760355208; x=1760960008; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVwd46lZ1P5SjPn3tQtq6oAz4fRORTMbO4qmdvwtRXc=;
        b=HvQ3E7KfbTk6AgP9Z162Fq8GWtRteWWtvuBc/mvGe0rISHg3uOnWFbGXW6LoYlXSwQ
         rSHla4wgzL1D4Mvj0V1mgxXZfKB4vvIdAX6umJcOFJ/UVr1fpFtRzT6xzsNPk0f7NyVH
         OAvnw8I9nTmqkylw3X5lFqNltTO18Y5S0qgprspYaURd3+TBPnIvTrnEOq3jVL2ig6aZ
         PHTPhvFyvGCtYcAmihygiQH2X8jC5/g+H9d0dVngHcbbniOT8qqj6XJTM7yDUH+9yW1m
         uD+1r4t+oOWW6S3WV6y5Rmpzo/8J6gRDiBvxT98xH5W2ii/7qFG+5BldgN6RB4BNi9CW
         CO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760355208; x=1760960008;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PVwd46lZ1P5SjPn3tQtq6oAz4fRORTMbO4qmdvwtRXc=;
        b=FwI4HQU5XjjGMOWeHt/nUEV/eyX+XiRaXzSZDYvUg/qSlUFYf2eWenTu7FFL3jQGIb
         pwXlVk6VWHjZ2gmiSl5AHqEhyA7N3vVVkRGyMSFPtDEqbyp3Tw80/AOn0VPOFGKKv43z
         JnVjtO3BJ2kYIRewR6XbdSpHmhMK+sh45seMutHUlnfENwa6tp/CpW8koHHrSdaUmFRd
         OBOwYsoZeTstsj+2TljecPYblqbN69KfB6lHGyfSNlyVhCs+oKwOLbQVxli3+/Q+b0O1
         PpFQayEXgWUKACmPRnqp0aqhcD5J1Bu9yhoHeclCRM3g0f7oh5O7wV5YtwmKdz+Fcv2f
         gcPg==
X-Forwarded-Encrypted: i=1; AJvYcCWP4jNWtXGp1lkObNXvH70Rn//U7W6PCLTf+d97LjNGyQb1LyF8/h0hvKD2xJKtcmu+MtgISCP7SBPMRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxebjSTebl9l3ZCkqSlMha4zFYqcOUp85QSpWqpnd0WAY5VSYmr
	Qg4CO20MZ6FaGeYL0ujyoeEWs5A6UzUd4lEAsMCW8k9uMm2CPFs41y6DEyNA0Ej2
X-Gm-Gg: ASbGncvUZPJP7++VYyLQ8ahuoZB9gRlgl0wzJ3hWgOocuXT62ecHbLFeZ8dLOhJSOtk
	kfLf2gEI4vdrD5U6rYcmN7o3y1TylVfcjZTgz7SZn5gUOYy/9hRKWsdvuuBSK2oUNXO5U4g7bKA
	KIRkvGYJCUeOamllSAtKT1tSnk3N42w3/NaQs+0qM+a9BqHA5VDerMVSHJ3+AgDdmBJxDt1o0Ok
	O6xGkn+mYqukawlugHzquySycjAn543mCmRD05VSjzIxH5BfOx1FjK1SdsVVWC770v64PRI3+GI
	b5nHAc11tWHIxmz3fGnZtzwf4S9Q9fYWByGp4sTLS9515T3VAxxzgVknPoyxVlaGTNa8ITwK0io
	gKmZcFte8TPuMz1Rh0VXh7Zn1JLqBfxvJachwpf705UhGQq4nvzrKK2/Hakog
X-Google-Smtp-Source: AGHT+IH3L14xC5IYIFPaUP4nV9yD6Wk9MrKtJjXN/b1Kt2ITOKrHWKjoIUoVAqkoIkEvNwzyLLn0qg==
X-Received: by 2002:a05:600c:8206:b0:46c:d476:52f3 with SMTP id 5b1f17b1804b1-46fa9b021abmr130647885e9.26.1760355207849;
        Mon, 13 Oct 2025 04:33:27 -0700 (PDT)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb49c3e49sm180303735e9.16.2025.10.13.04.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 04:33:27 -0700 (PDT)
Message-ID: <53cdbb146066f9da937247ec33206960571bce18.camel@gmail.com>
Subject: Re: [PATCH 2/2] hwmon: (ltc4282) Use the energy64 attribute type to
 report the energy
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Hardware Monitoring
	 <linux-hwmon@vger.kernel.org>
Date: Mon, 13 Oct 2025 12:33:59 +0100
In-Reply-To: <20251012211625.533791-2-linux@roeck-us.net>
References: <20251012211625.533791-1-linux@roeck-us.net>
	 <20251012211625.533791-2-linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.0 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2025-10-12 at 14:16 -0700, Guenter Roeck wrote:
> Use the energy64 attribute type instead of a locally defined sysfs
> attribute to report the accumulated energy.
>=20
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---

Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>

> =C2=A0drivers/hwmon/ltc4282.c | 44 ++++++++++++--------------------------=
---
> =C2=A01 file changed, 13 insertions(+), 31 deletions(-)
>=20
> diff --git a/drivers/hwmon/ltc4282.c b/drivers/hwmon/ltc4282.c
> index 1d664a2d7b3c..44102879694a 100644
> --- a/drivers/hwmon/ltc4282.c
> +++ b/drivers/hwmon/ltc4282.c
> @@ -12,7 +12,6 @@
> =C2=A0#include <linux/delay.h>
> =C2=A0#include <linux/device.h>
> =C2=A0#include <linux/hwmon.h>
> -#include <linux/hwmon-sysfs.h>
> =C2=A0#include <linux/i2c.h>
> =C2=A0#include <linux/math.h>
> =C2=A0#include <linux/minmax.h>
> @@ -541,7 +540,7 @@ static int ltc4282_read_power_byte(const struct
> ltc4282_state *st, u32 reg,
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> -static int ltc4282_read_energy(const struct ltc4282_state *st, u64 *val)
> +static int ltc4282_read_energy(const struct ltc4282_state *st, s64 *val)
> =C2=A0{
> =C2=A0	u64 temp, energy;
> =C2=A0	__be64 raw;
> @@ -617,6 +616,12 @@ static int ltc4282_read(struct device *dev, enum
> hwmon_sensor_types type,
> =C2=A0			*val =3D st->energy_en;
> =C2=A0		}
> =C2=A0		return 0;
> +	case hwmon_energy64:
> +		scoped_guard(mutex, &st->lock) {
> +			if (st->energy_en)
> +				return ltc4282_read_energy(st, (s64 *)val);
> +		}
> +		return -ENODATA;
> =C2=A0	default:
> =C2=A0		return -EOPNOTSUPP;
> =C2=A0	}
> @@ -1078,6 +1083,9 @@ static umode_t ltc4282_is_visible(const void *data,
> =C2=A0	case hwmon_energy:
> =C2=A0		/* hwmon_energy_enable */
> =C2=A0		return 0644;
> +	case hwmon_energy64:
> +		/* hwmon_energy_input */
> +		return 0444;
> =C2=A0	default:
> =C2=A0		return 0;
> =C2=A0	}
> @@ -1106,24 +1114,6 @@ static int ltc4282_read_labels(struct device *dev,
> =C2=A0	}
> =C2=A0}
> =C2=A0
> -static ssize_t ltc4282_energy_show(struct device *dev,
> -				=C2=A0=C2=A0 struct device_attribute *da, char *buf)
> -{
> -	struct ltc4282_state *st =3D dev_get_drvdata(dev);
> -	u64 energy;
> -	int ret;
> -
> -	guard(mutex)(&st->lock);
> -	if (!st->energy_en)
> -		return -ENODATA;
> -
> -	ret =3D ltc4282_read_energy(st, &energy);
> -	if (ret < 0)
> -		return ret;
> -
> -	return sysfs_emit(buf, "%llu\n", energy);
> -}
> -
> =C2=A0static const struct clk_ops ltc4282_ops =3D {
> =C2=A0	.recalc_rate =3D ltc4282_recalc_rate,
> =C2=A0	.determine_rate =3D ltc4282_determine_rate,
> @@ -1588,6 +1578,8 @@ static const struct hwmon_channel_info * const
> ltc4282_info[] =3D {
> =C2=A0			=C2=A0=C2=A0 HWMON_P_RESET_HISTORY | HWMON_P_LABEL),
> =C2=A0	HWMON_CHANNEL_INFO(energy,
> =C2=A0			=C2=A0=C2=A0 HWMON_E_ENABLE),
> +	HWMON_CHANNEL_INFO(energy64,
> +			=C2=A0=C2=A0 HWMON_E_INPUT),
> =C2=A0	NULL
> =C2=A0};
> =C2=A0
> @@ -1603,15 +1595,6 @@ static const struct hwmon_chip_info ltc4282_chip_i=
nfo =3D
> {
> =C2=A0	.info =3D ltc4282_info,
> =C2=A0};
> =C2=A0
> -/* energy attributes are 6bytes wide so we need u64 */
> -static SENSOR_DEVICE_ATTR_RO(energy1_input, ltc4282_energy, 0);
> -
> -static struct attribute *ltc4282_attrs[] =3D {
> -	&sensor_dev_attr_energy1_input.dev_attr.attr,
> -	NULL
> -};
> -ATTRIBUTE_GROUPS(ltc4282);
> -
> =C2=A0static int ltc4282_show_fault_log(void *arg, u64 *val, u32 mask)
> =C2=A0{
> =C2=A0	struct ltc4282_state *st =3D arg;
> @@ -1718,8 +1701,7 @@ static int ltc4282_probe(struct i2c_client *i2c)
> =C2=A0
> =C2=A0	mutex_init(&st->lock);
> =C2=A0	hwmon =3D devm_hwmon_device_register_with_info(dev, "ltc4282", st,
> -						=C2=A0=C2=A0=C2=A0=C2=A0 &ltc4282_chip_info,
> -						=C2=A0=C2=A0=C2=A0=C2=A0 ltc4282_groups);
> +						=C2=A0=C2=A0=C2=A0=C2=A0 &ltc4282_chip_info,
> NULL);
> =C2=A0	if (IS_ERR(hwmon))
> =C2=A0		return PTR_ERR(hwmon);
> =C2=A0
