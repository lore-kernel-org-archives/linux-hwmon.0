Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270053B9D85
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 10:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774434987; cv=none; b=q/rkErycDxGtCxSF4XlvfcTREP2WYhtY0LCyOSDPH3f9B6thL9qz75DoOuNR6+ufCI/Z0a646PH/PHSG3aqEhV1eLL8FMo1ew/iytUlrZrrW+0aUeb3vgSgH4JmHfqXimSXUv7bwoDWZPK5iF8KHAK85epDMvBT9s7iYEuzh5JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774434987; c=relaxed/simple;
	bh=46hpJVyCSyBAN8nPcOlcWCY99w6+LR7lZ0obL17CAgA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H8WUhpUpYnEEVssIcMSOoXGWdpS+Nlc9vS8Gz6SrUhlxVARdqxKm7T7rG0FfNxUnraVOtg0OchRXj++K969eT7556Xq9+vWrb2x/ETSX0QxwK9hMsWUFrKtsafJJpOk/vsNx4qMzKaXkEZYiUzPnUp9cRNOLnFl+ENgd/cw07K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ebnl/wWk; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ebnl/wWk"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so15806405e9.0
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 03:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774434984; x=1775039784; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1HfdgdLYhB5v7YewVP5hqPZEX6KSE2sY1vU01hVpVFA=;
        b=Ebnl/wWkH1+gU2xcmhD+S2pNPWdP1iNNrHbG+TvHruakp+WE0XFujby8SEjtB0JT4x
         ZOcDIk2/CkxGHRFOIAR+PXtO1LZktWayYc8E8PkA4Npll/sZ6Y80g7JUUnOevmVgU5mF
         EfYik4QMWr34H588IT1QogwVWDCBHEJR4r3VWJ4Plsp/gLDAJDA/XllTUTznXVvsRvUW
         KKsLa3xzuW/+khO0uUhggmMtZMXbHXglKrmAp8rF1S1FBeqpkpOJC0yb9ixUp9H6K0QA
         H+25sGcmYrOkRCTMk2okoW5NA+YHgvqr1FH33taVLz3mG9c5rivGndh4i8xNarMW7W4v
         pOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774434984; x=1775039784;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1HfdgdLYhB5v7YewVP5hqPZEX6KSE2sY1vU01hVpVFA=;
        b=GPaSpcYAwqe310OhdFSTK9UaD6eygFByab8DY0st/g6raJFBBFjES8kLDmW2Q72Njv
         I/zLkYqG2vwWQmJ59+WpZls3f+E7m4pqcOYSGUOyKQEWsxx0tW5jQG+0oTdnJSkEW2JE
         mIR+oacuIrlAvIXJg5acG1HQ/Na7hM9da7qCLUe3mqSMBXFIAt08V3fU2R31+diU9QvK
         gR1pPgB+Z0wios4uiEMak1E/Nmp1AaxHk1yBxrKIWxd6jgJVIW93uBhtnU/OxkwZJl2/
         Tqc/4ZTQWK7c0gDg1jutpRTtQzkkouCR9Z2kdzcXz9nzTJ96tuh+H1pi79N9Qee05vOl
         V94w==
X-Forwarded-Encrypted: i=1; AJvYcCVYT0LvuKQrAfFKACIbZOAZrH0e2j+usyQqP75DrrdxwAMFVmwtstPuc2FwSPgcKvLuIvP4pwV2DfDg9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0XyeZ6SKrFf4yfqelYMygY8Be+SW5hFBn9dxFs7dmliCAPF5c
	e9/fFkCwP1297Jrt5k2xL03ZAUy4u5V/P1lTips4CsuOZQ/ZdPHG5K4Z
X-Gm-Gg: ATEYQzwrsYjwGdppLgYUOyBjL3w2C0jwmlFn9abHK5jsEyr2nvMD4DryX5pdod3oWkb
	LlJJZUPaVMvGSn5GwhgoALKnksp+cJOWy7nyd7lTk5Ys+ctxScV2anEwT4eLmYMO8rq0HjE6rDN
	KJ5sk29m0u0bhFExXF/ISvi4TirSevLyKDHxcI2ZMUC7Mw9YL+JecGjERMrVTqbhi6aB03u5SLo
	kKD4eP26s+83XICI8GUPlihv8zGfAFZWRjahstxBbJfDjpN4rsgSrf9PLzjs8yQrKHsVcVzmFTY
	KfNNwwd36WEPl5OjWhX4GE4zI1zgjBw0DlebNhA0NApcY5kGshulaCLeB93EqQ8aVLju7nHIOp7
	ATeSwojVW0PYsKC9nsZnAlDzPegN4CjvYAz4hfWYLoKutc3kYX6dLV40x+g9cY5GXCEd+y7pFiv
	m7Pgjk3/IyJ8yBpNveK9S+DtZh1if5rVg=
X-Received: by 2002:a05:600c:3b12:b0:485:3f1c:d887 with SMTP id 5b1f17b1804b1-4871606dc4fmr45915355e9.26.1774434984175;
        Wed, 25 Mar 2026 03:36:24 -0700 (PDT)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116f1905sm125654305e9.3.2026.03.25.03.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 03:36:23 -0700 (PDT)
Message-ID: <f7069532401720fda1ca6e70b72742526fc79dec.camel@gmail.com>
Subject: Re: [PATCH] hwmon: adm1177: fix sysfs ABI violation and current
 unit conversion
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>,
 "linux-hwmon@vger.kernel.org"	 <linux-hwmon@vger.kernel.org>
Cc: "linux@roeck-us.net" <linux@roeck-us.net>,
 "Michael.Hennerich@analog.com"	 <Michael.Hennerich@analog.com>,
 "beniamin.bia@analog.com"	 <beniamin.bia@analog.com>,
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>, Sanman
 Pradhan <psanman@juniper.net>
Date: Wed, 25 Mar 2026 10:37:10 +0000
In-Reply-To: <20260324182231.228195-1-sanman.pradhan@hpe.com>
References: <20260324182231.228195-1-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-03-24 at 18:22 +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
>=20
> The adm1177 driver exposes the current alert threshold using
> hwmon_curr_max_alarm. Per the hwmon sysfs ABI, *_alarm attributes
> are read-only status flags; the writable threshold should use
> hwmon_curr_max instead.
>=20
> Additionally, the threshold is stored internally in microamps
> (alert_threshold_ua) but the ABI requires milliamps for currN_max.
> Convert appropriately on both the read and write paths, and
> propagate the return value of adm1177_write_alert_thr() which was
> previously discarded.
>=20
> Clamp write values to the range the hardware can represent rather
> than rejecting out-of-range input, and use DIV_ROUND_CLOSEST on the
> read path to minimise rounding error during the uA-to-mA conversion.
>=20
> Fixes: 09b08ac9e8d5 ("hwmon: (adm1177) Add ADM1177 Hot Swap Controller an=
d Digital Power Monitor
> driver")
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>
> ---

For the AI comment, typically these applications don't go to ohms for rsens=
e so, in practice, it
might be that we never get he overflow. But I would still play safe given i=
t's so trivial. I also
see you only replace hwmon_curr_max_alarm with hwmon_curr_max. It would be =
nicer to first fix ABI
and then support hwmon_curr_max_alarm (properly). Though might be a big ask=
 if you don't have HW to
test it. Anyways, after AI feedback addressed:

Acked-by: Nuno S=C3=A1 <nuno.sa@analog.com>

> =C2=A0drivers/hwmon/adm1177.c | 16 +++++++++-------
> =C2=A01 file changed, 9 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/hwmon/adm1177.c b/drivers/hwmon/adm1177.c
> index 8b2c965480e3f..8742b8b5314b6 100644
> --- a/drivers/hwmon/adm1177.c
> +++ b/drivers/hwmon/adm1177.c
> @@ -10,6 +10,7 @@
> =C2=A0#include <linux/hwmon.h>
> =C2=A0#include <linux/i2c.h>
> =C2=A0#include <linux/init.h>
> +#include <linux/minmax.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/regulator/consumer.h>
> =C2=A0
> @@ -91,8 +92,8 @@ static int adm1177_read(struct device *dev, enum hwmon_=
sensor_types type,
> =C2=A0			*val =3D div_u64((105840000ull * dummy),
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4096 * st->r_sense_uohm);
> =C2=A0			return 0;
> -		case hwmon_curr_max_alarm:
> -			*val =3D st->alert_threshold_ua;
> +		case hwmon_curr_max:
> +			*val =3D DIV_ROUND_CLOSEST(st->alert_threshold_ua, 1000);
> =C2=A0			return 0;
> =C2=A0		default:
> =C2=A0			return -EOPNOTSUPP;
> @@ -126,9 +127,10 @@ static int adm1177_write(struct device *dev, enum hw=
mon_sensor_types type,
> =C2=A0	switch (type) {
> =C2=A0	case hwmon_curr:
> =C2=A0		switch (attr) {
> -		case hwmon_curr_max_alarm:
> -			adm1177_write_alert_thr(st, val);
> -			return 0;
> +		case hwmon_curr_max:
> +			val =3D clamp_val(val, 0,
> +					div_u64(105840000ULL, st->r_sense_uohm));
> +			return adm1177_write_alert_thr(st, val * 1000);
> =C2=A0		default:
> =C2=A0			return -EOPNOTSUPP;
> =C2=A0		}
> @@ -156,7 +158,7 @@ static umode_t adm1177_is_visible(const void *data,
> =C2=A0			if (st->r_sense_uohm)
> =C2=A0				return 0444;
> =C2=A0			return 0;
> -		case hwmon_curr_max_alarm:
> +		case hwmon_curr_max:
> =C2=A0			if (st->r_sense_uohm)
> =C2=A0				return 0644;
> =C2=A0			return 0;
> @@ -170,7 +172,7 @@ static umode_t adm1177_is_visible(const void *data,
> =C2=A0
> =C2=A0static const struct hwmon_channel_info * const adm1177_info[] =3D {
> =C2=A0	HWMON_CHANNEL_INFO(curr,
> -			=C2=A0=C2=A0 HWMON_C_INPUT | HWMON_C_MAX_ALARM),
> +			=C2=A0=C2=A0 HWMON_C_INPUT | HWMON_C_MAX),
> =C2=A0	HWMON_CHANNEL_INFO(in,
> =C2=A0			=C2=A0=C2=A0 HWMON_I_INPUT),
> =C2=A0	NULL
