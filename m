Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615130;
	b=bX8r8qxCq9jrLdB36JdNn8V2BcQ0YgmZ/U34IyYf2ZN4BtrhhTQF+n8Qi6bDpsQ6z0Mq
	 QUkZ5Lma+4MFOjeCBUv9LufEZ/MSGE5qFl2bM1cBwKI9Y9RnJ1ZQ2N1cgdRW03PFcJUe7
	 3Egsye0G6pocHNpdYw2HFkPtYKoInKqh675vKUh43jrQmbG92s0wneAqm/9t897laZXKS
	 57PfoS/97IfMxwmcc5iVBJh/KFNKSybH3ZxGCbXnZQAHo98u9vKGWs1WxB4/t2W0woVe3
	 IjirZDoMEUTLrfKnRfFfxK3/ywj6C+Co0R5i8Sl0ViORUecnqqJXwXVxLYwxz6X88ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615130;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Mxfibti7PNO3+ZnhH2zBO7NCyd/iScsty4zPnfrGjgI=;
	b=Gplb469wffacouNFu9YpYyXRAfHgp7A/GD/1PZdrGHtkPtHyayZkRWCnWpfZiQxqSFW+
	 ci33+pl/b0mvqcxR4YjqpCGmmEe7LYMIaXuuSpkzKjplEHyQ6WW+1PUuOgVXtLKCNYvvg
	 mILNtT2unX0B6Sd9Yiha9L/vu6+nZtVmbbFUpk4Ibq9lAleP47kbUShLhE5hUQBW4gPx4
	 fszMgbT3N6+xYjJM92oeq+0sR6NYsB68gbFO/PLyCIXGMCD4+3DRJoBuNLQqZ9cE5LSQy
	 l1bIM1pvDHxHaBim0CzTS8rL7OfCY/Z7xjJud22Tdbrw36dgV/sYgQ8F1fzVWQ4rT+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=hvJkSbSe;
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922A1606A324;
	Mon,  2 Nov 2026 10:25:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 922A1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=hvJkSbSe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=Mxfibti7PNO3+ZnhH2zBO7NCyd/iScsty4zPnfrGjgI=; t=1793615129; x=1794824729; 
	b=hvJkSbSeIqfyYKOsdXn0Lq+pjRC4a2zuIxJ2UEgGJbfokxvYsTrf7Y5Ividc8CxtYMoM26QTCXt
	g39LrQRhQ7aTkxTzVpSI5TlVPklZcxs1peLnfbOBtfW4Z1NVLIJFpRFxuIqDldx1ALOmykBhKXbnX
	1tVBr1NOnJGESJTJnaNh/+3CXOI0oR0C7Ft81kM6nwUpxbm7D5O+vjapQVpP6GamMFp0K8me/xvTE
	gIOjB4auMKZoP7uIko7a5rkYKv6T7DfBL0jg6tv0IN0XkYEztwcSgGQPaBRs6prY1Wayp9gTsI6d4
	G6nRFW7aVfJreQQUzNMLQtH1N//rYo9xIvRA==;
Date: Mon, 2 Nov 2026 11:25:22 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Pablo Mazzini <pmazzini@gmail.com>, Alistair Francis
 <alistair@alistair23.me>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/7] hwmon: sy7636a: read the temperature only while
 the rails are on
Message-ID: <20261102112522.76e02b83@kemnade.info>
In-Reply-To: <2c48d47a-85f5-48e8-a675-239b033eb0ce@roeck-us.net>
References: <20261101223125.302001-1-pmazzini@gmail.com>
	<20261101223125.302001-6-pmazzini@gmail.com>
	<2c48d47a-85f5-48e8-a675-239b033eb0ce@roeck-us.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 1 Nov 2026 19:35:16 -0800
Guenter Roeck <linux@roeck-us.net> wrote:

> On 11/1/26 14:31, Pablo Mazzini wrote:
> > The driver enables VCOM at probe, which keeps the panel's high voltage
> > rails on for good, and gets a dummy regulator if it probes before the
> > regulator exists. Read the temperature only while the rails are on, when
> > the chip samples it, and return -ENODATA otherwise. Read power good with
> > it in one transfer, so the value can not be from before the first sample
> > or after the rails went off. Register it under the chip name, as the
> > TPS65185 and FP9931 drivers do.
> > 
> > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> > ---
> >   drivers/hwmon/sy7636a-hwmon.c | 25 ++++++++++++++-----------
> >   1 file changed, 14 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/hwmon/sy7636a-hwmon.c b/drivers/hwmon/sy7636a-hwmon.c
> > index f01f368d68e5..475aff997c2d 100644
> > --- a/drivers/hwmon/sy7636a-hwmon.c
> > +++ b/drivers/hwmon/sy7636a-hwmon.c
> > @@ -14,7 +14,6 @@
> >   #include <linux/module.h>
> >   #include <linux/platform_device.h>
> >   #include <linux/regmap.h>
> > -#include <linux/regulator/machine.h
> >   
> >   #include <linux/mfd/sy7636a.h>
> >   
> > @@ -22,14 +21,22 @@ static int sy7636a_read(struct device *dev, enum hwmon_sensor_types type,
> >   			u32 attr, int channel, long *temp)
> >   {
> >   	struct regmap *regmap = dev_get_drvdata(dev);
> > -	int ret, reg_val;
> > -
> > -	ret = regmap_read(regmap,
> > -			  SY7636A_REG_TERMISTOR_READOUT, &reg_val);
> > +	u8 buf[2];
> > +	int ret;
> > +
> > +	/*
> > +	 * Read power good and the thermistor in one transfer: the thermistor is
> > +	 * only sampled while the rails are on, and power good comes after the
> > +	 * first sample
> > +	 */
> > +	ret = regmap_bulk_read(regmap, SY7636A_REG_FAULT_FLAG, buf, sizeof(buf));
> >   	if (ret)
> >   		return ret;
> >   
> > -	*temp = (s8)reg_val * 1000;
> > +	if (!(buf[0] & SY7636A_FAULT_FLAG_PG))
> > +		return -ENODATA;
> > +  
> 
> I had a look at the datasheet. It does not say anything about the
> temperature not being measured when PG is not set.
> 
That is what I read from there, too. But the PG bit will only
be set if the On/Off bit is also set.

> The datasheet does suggest that temperatures are only measured
> if bit 7 of the operation mode register is set, but that is
> different from the "power good" bit in the fault register.
> 
I can confirm from tests that temperature reads zero if regulator
was not yet powered on.

I read the datasheet in that way so things happen it that order:

1. on bit is set
2. ramping up voltages start / temperature sampling starts.
3. after some time (sampling time + conversion time (ADC_SPL+ADC_DEL)?),
   the first sample is ready and the temperature can be read.
4. after some more time voltage lines stabilize
5. after 1.5 ms PG is asserted

> So why the association with the PG bit and not with the On/Off bit
> of the operation mode register ? That warrants some more explanation.

That should definitively be commented in the code. I have pointed out
races earlier. This has of course the drawback that it limits the time
frame in which reads are possible a bit. I doubt it is worth dealing with
synchronisation code to use that on/off bit (although posssible).

Regards,
Andreas
