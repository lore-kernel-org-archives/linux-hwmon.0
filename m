Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630FD31A07B
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 13:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774444798; cv=none; b=p4ptIsL5m36IglSrZV+zos/mvNYKmkiXcbHrVxNTA2/IkzBvGAEKnQWt8UdJVikCK3BCoD/NUPjyZh74U2DvWdgB1uouCDHkNNLN9RWYUanyGu/QG7P1vhzupnWnc4VEjV491D0j8qR+4XMwQafzf+UoOylcvOC4bYQerYJ27DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774444798; c=relaxed/simple;
	bh=4xWMi88lJ7IhAxH0bRZlTLRqmAQ7/BLMsGLagufBbmc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IVCGJe2ZnYxhucMztBaPcs0RctvUHgIHk4tQnwDENuvR3WZtt0N2gJoBQoUvKgSI8Gvs2aACypozdYbrevBjy95Oj5BJpy1q2k1+izo1GmdXyyeN/01WKzmVop44kohByrneqeGtfKnyikJi4AVbXybOk+hdLVQftkk/CHRUENI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RknddsF5; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RknddsF5"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-486ff201041so45189405e9.1
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 06:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774444795; x=1775049595; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JLVVz4HSsFi/Yg5RQSPCTmETJB33Bw0i1OvQtLpPPaw=;
        b=RknddsF5rUro+34hav5V/exBlkkuMaTNV8/rBpkF4/oBtOyV5n20AxJkwfFuUhy7K9
         f3lXn8H6NSSPNNEyiwK0kzJKDhzAF7qkPhffaoCkeal0nkgtuZLliiFQPoiZifX0Kzbv
         2ZovOruUG1h9qGCYiWE8GpycfJ7HoGD8HOnDBlcjQsY2YCPgUooV7+Z/DQxSxG/ONSRp
         S+gMxy+RvfB//KLxeZYbbL6P9OEpR2Is8UA9D9CE6puvFB7VvNlawCCKv8fFRKjVB4sV
         fd2HIVAShCbT1l/TMSXUrtcdW2MAFW80H5+7vAklnnS9qXzLBJovj+RHclvhsY4UGTUI
         4cjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774444795; x=1775049595;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JLVVz4HSsFi/Yg5RQSPCTmETJB33Bw0i1OvQtLpPPaw=;
        b=hfSXXvqoijFjLvI24gGbYtTVQWp6UHaYkkL7lsdhxBVJ/EYykU6umX5VW/uMzcuRMH
         tGsivVZbHSJp5KJfSl125kg8fUzV5CMOKkJ4OTqznoFijYKRYRgsbMpJae+DBDATq/hw
         DoPaM+zXzvtuaZ/aokGNwLonuyhO9gyhDakSyhJnAyxxRu4BpojQ9wxdZinTOTsAiaiZ
         3pNeen5tiZw5RozdXAeDFGjJYwpZxaMeDq3xCDgcXyBLZcxReTEupkYoMQq+XjuLWqEw
         RQfXaLVUKGE6ePk7WaphCUh2jNQn9UgTynx2gD8XHw16JCdlmkdcdgq87Jvt8qux5HHF
         K53A==
X-Forwarded-Encrypted: i=1; AJvYcCVIJpJsnJroX2D6Jdg/O1x/U2w2AiOWQ4I4X+Q1Ed922RxJQVnsZ+D10xQCbYAkYAW0VsHcEBh3UyGL9g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh9rtoETq0MR455H72d4uJ64qlfir/+QEbE/i8TgKYgzqBryzh
	YlxuxefpzX/j74UxP1E8Y6U3WZABC3MSGEIuIr9dRAPrFvW6OBQ+0OZm/VFDpniHJxk=
X-Gm-Gg: ATEYQzyCx5kzUPCEJnKCQjgaYQU0dkDGPpIHgxYiggwdgMTIgjI4MApXRZSSRa6mCiT
	m76LaUkY6gtMUYSoL9ZafvoodVjsNU8oNmkB5Po72cmFpieplUwnT4MpOhTHL5kXsppbSGzh+e3
	yCT7/N47lWhYu4nrDDPryPnYyZpJVijAsAzQYhUTDQfLtd/P5fE16xKf3kM0bFbI9qZqOzU0hOR
	y1wgw14CGTSLdPnOacU16GE6iPRyOa1UP+doZsrfhAKffnU7P2S1P4LklFSlFrb914dB/pB4Uwz
	LgGzdCEW97oIGHIiVsCxyyoAqnA+QH+kuslT8HMeSn1VjXJVrP8Be7DrKSYho+bx4ZS3bnaOgX9
	A3CUkq8cvRAjfG0W4C2uTSVw35LpuGTjSlWuBSxH7WJCwQRoSJPrbhWq5TuACvwPr/eCy8w8wYJ
	kQlDcnlQK5htB+ustSonJJuAGaay9uh+E=
X-Received: by 2002:a05:600c:1f8e:b0:487:1108:48bc with SMTP id 5b1f17b1804b1-48716039cd1mr53922825e9.17.1774444794269;
        Wed, 25 Mar 2026 06:19:54 -0700 (PDT)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116f1905sm135313835e9.3.2026.03.25.06.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 06:19:53 -0700 (PDT)
Message-ID: <b71a1c83bee9e78abad6806d7bd84b3d7b5bab52.camel@gmail.com>
Subject: Re: [PATCH v2] hwmon: (adm1177) fix sysfs ABI violation and current
 unit conversion
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>,
 "linux-hwmon@vger.kernel.org"	 <linux-hwmon@vger.kernel.org>
Cc: "linux@roeck-us.net" <linux@roeck-us.net>,
 "Michael.Hennerich@analog.com"	 <Michael.Hennerich@analog.com>,
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>, Sanman
 Pradhan <psanman@juniper.net>
Date: Wed, 25 Mar 2026 13:20:40 +0000
In-Reply-To: <20260325051246.28262-1-sanman.pradhan@hpe.com>
References: <20260325051246.28262-1-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-03-25 at 05:13 +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
>=20
> The adm1177 driver exposes the current alert threshold through
> hwmon_curr_max_alarm. This violates the hwmon sysfs ABI, where
> *_alarm attributes are read-only status flags and writable thresholds
> must use currN_max.
>=20
> The driver also stores the threshold internally in microamps, while
> currN_max is defined in milliamps. Convert the threshold accordingly
> on both the read and write paths.
>=20
> Widen the cached threshold and related calculations to 64 bits so
> that small shunt resistor values do not cause truncation or overflow.
> Also use 64-bit arithmetic for the mA/uA conversions, clamp writes
> to the range the hardware can represent, and propagate failures from
> adm1177_write_alert_thr() instead of silently ignoring them.
>=20
> Update the hwmon documentation to reflect the attribute rename and
> the correct units returned by the driver.
>=20
> Fixes: 09b08ac9e8d5 ("hwmon: (adm1177) Add ADM1177 Hot Swap Controller an=
d Digital Power Monitor
> driver")
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>
> ---

Arghh, just saw v2 now (and replied to v1). Seems AI still has some feedbac=
k [1] (even though
not strictly related to this patch). For reference, my comments [2]:

Anyways, as stated in my comment, after addressing the remaining "complain"=
:

Acked-by: Nuno S=C3=A1 <nuno.sa@analog.com>

[1]: https://sashiko.dev/#/patchset/20260325051246.28262-1-sanman.pradhan%4=
0hpe.com
[2]: https://lore.kernel.org/linux-hwmon/f7069532401720fda1ca6e70b72742526f=
c79dec.camel@gmail.com/T/#t

- Nuno S=C3=A1

> v2:
> - Widen alert_threshold_ua to u64 throughout; use div_u64() and
> =C2=A0 (u64) casts to prevent overflow on read, write, and probe paths.
> - Update Documentation/hwmon/adm1177.rst for the attribute rename
> =C2=A0 and correct unit descriptions.
>=20
> v1:
> - Rename hwmon_curr_max_alarm to hwmon_curr_max; add uA-to-mA and
> =C2=A0 mA-to-uA conversions with clamp_val on write path.
> - Propagate adm1177_write_alert_thr() return value on sysfs write;
> =C2=A0 add linux/math64.h and linux/minmax.h includes.
> ---
> =C2=A0Documentation/hwmon/adm1177.rst |=C2=A0 8 ++---
> =C2=A0drivers/hwmon/adm1177.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 54 +++++++++++++++++++--------------
> =C2=A02 files changed, 35 insertions(+), 27 deletions(-)
>=20
> diff --git a/Documentation/hwmon/adm1177.rst b/Documentation/hwmon/adm117=
7.rst
> index 1c85a2af92bf7..375f6d6e03a7d 100644
> --- a/Documentation/hwmon/adm1177.rst
> +++ b/Documentation/hwmon/adm1177.rst
> @@ -27,10 +27,10 @@ for details.
> =C2=A0Sysfs entries
> =C2=A0-------------
> =C2=A0
> -The following attributes are supported. Current maxim attribute
> +The following attributes are supported. Current maximum attribute
> =C2=A0is read-write, all other attributes are read-only.
> =C2=A0
> -in0_input		Measured voltage in microvolts.
> +in0_input		Measured voltage in millivolts.
> =C2=A0
> -curr1_input		Measured current in microamperes.
> -curr1_max_alarm		Overcurrent alarm in microamperes.
> +curr1_input		Measured current in milliamperes.
> +curr1_max		Overcurrent shutdown threshold in milliamperes.
> diff --git a/drivers/hwmon/adm1177.c b/drivers/hwmon/adm1177.c
> index 8b2c965480e3f..7888afe8dafd6 100644
> --- a/drivers/hwmon/adm1177.c
> +++ b/drivers/hwmon/adm1177.c
> @@ -10,6 +10,8 @@
> =C2=A0#include <linux/hwmon.h>
> =C2=A0#include <linux/i2c.h>
> =C2=A0#include <linux/init.h>
> +#include <linux/math64.h>
> +#include <linux/minmax.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/regulator/consumer.h>
> =C2=A0
> @@ -33,7 +35,7 @@
> =C2=A0struct adm1177_state {
> =C2=A0	struct i2c_client	*client;
> =C2=A0	u32			r_sense_uohm;
> -	u32			alert_threshold_ua;
> +	u64			alert_threshold_ua;
> =C2=A0	bool			vrange_high;
> =C2=A0};
> =C2=A0
> @@ -48,7 +50,7 @@ static int adm1177_write_cmd(struct adm1177_state *st, =
u8 cmd)
> =C2=A0}
> =C2=A0
> =C2=A0static int adm1177_write_alert_thr(struct adm1177_state *st,
> -				=C2=A0=C2=A0 u32 alert_threshold_ua)
> +				=C2=A0=C2=A0 u64 alert_threshold_ua)
> =C2=A0{
> =C2=A0	u64 val;
> =C2=A0	int ret;
> @@ -91,8 +93,8 @@ static int adm1177_read(struct device *dev, enum hwmon_=
sensor_types type,
> =C2=A0			*val =3D div_u64((105840000ull * dummy),
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4096 * st->r_sense_uohm);
> =C2=A0			return 0;
> -		case hwmon_curr_max_alarm:
> -			*val =3D st->alert_threshold_ua;
> +		case hwmon_curr_max:
> +			*val =3D div_u64(st->alert_threshold_ua, 1000);
> =C2=A0			return 0;
> =C2=A0		default:
> =C2=A0			return -EOPNOTSUPP;
> @@ -126,9 +128,10 @@ static int adm1177_write(struct device *dev, enum hw=
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
> +			return adm1177_write_alert_thr(st, (u64)val * 1000);
> =C2=A0		default:
> =C2=A0			return -EOPNOTSUPP;
> =C2=A0		}
> @@ -156,7 +159,7 @@ static umode_t adm1177_is_visible(const void *data,
> =C2=A0			if (st->r_sense_uohm)
> =C2=A0				return 0444;
> =C2=A0			return 0;
> -		case hwmon_curr_max_alarm:
> +		case hwmon_curr_max:
> =C2=A0			if (st->r_sense_uohm)
> =C2=A0				return 0644;
> =C2=A0			return 0;
> @@ -170,7 +173,7 @@ static umode_t adm1177_is_visible(const void *data,
> =C2=A0
> =C2=A0static const struct hwmon_channel_info * const adm1177_info[] =3D {
> =C2=A0	HWMON_CHANNEL_INFO(curr,
> -			=C2=A0=C2=A0 HWMON_C_INPUT | HWMON_C_MAX_ALARM),
> +			=C2=A0=C2=A0 HWMON_C_INPUT | HWMON_C_MAX),
> =C2=A0	HWMON_CHANNEL_INFO(in,
> =C2=A0			=C2=A0=C2=A0 HWMON_I_INPUT),
> =C2=A0	NULL
> @@ -192,7 +195,8 @@ static int adm1177_probe(struct i2c_client *client)
> =C2=A0	struct device *dev =3D &client->dev;
> =C2=A0	struct device *hwmon_dev;
> =C2=A0	struct adm1177_state *st;
> -	u32 alert_threshold_ua;
> +	u64 alert_threshold_ua;
> +	u32 prop;
> =C2=A0	int ret;
> =C2=A0
> =C2=A0	st =3D devm_kzalloc(dev, sizeof(*st), GFP_KERNEL);
> @@ -208,22 +212,26 @@ static int adm1177_probe(struct i2c_client *client)
> =C2=A0	if (device_property_read_u32(dev, "shunt-resistor-micro-ohms",
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 &st->r_sense_uohm))
> =C2=A0		st->r_sense_uohm =3D 0;
> -	if (device_property_read_u32(dev, "adi,shutdown-threshold-microamp",
> -				=C2=A0=C2=A0=C2=A0=C2=A0 &alert_threshold_ua)) {
> -		if (st->r_sense_uohm)
> -			/*
> -			 * set maximum default value from datasheet based on
> -			 * shunt-resistor
> -			 */
> -			alert_threshold_ua =3D div_u64(105840000000,
> -						=C2=A0=C2=A0=C2=A0=C2=A0 st->r_sense_uohm);
> -		else
> -			alert_threshold_ua =3D 0;
> +	if (!device_property_read_u32(dev, "adi,shutdown-threshold-microamp",
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &prop)) {
> +		alert_threshold_ua =3D prop;
> +	} else if (st->r_sense_uohm) {
> +		/*
> +		 * set maximum default value from datasheet based on
> +		 * shunt-resistor
> +		 */
> +		alert_threshold_ua =3D div_u64(105840000000ULL,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 st->r_sense_uohm);
> +	} else {
> +		alert_threshold_ua =3D 0;
> =C2=A0	}
> =C2=A0	st->vrange_high =3D device_property_read_bool(dev,
> =C2=A0						=C2=A0=C2=A0=C2=A0 "adi,vrange-high-enable");
> -	if (alert_threshold_ua && st->r_sense_uohm)
> -		adm1177_write_alert_thr(st, alert_threshold_ua);
> +	if (alert_threshold_ua && st->r_sense_uohm) {
> +		ret =3D adm1177_write_alert_thr(st, alert_threshold_ua);
> +		if (ret)
> +			return ret;
> +	}
> =C2=A0
> =C2=A0	ret =3D adm1177_write_cmd(st, ADM1177_CMD_V_CONT |
> =C2=A0				=C2=A0=C2=A0=C2=A0 ADM1177_CMD_I_CONT |
