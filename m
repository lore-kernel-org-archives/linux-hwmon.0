Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB65F38DC5F;
	Wed, 29 Jul 2026 15:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785339638; cv=none; b=mS3H1YBKqF39x4b8NBFzULWBrOJCnPNZAYDTSujLkjAgvMo03eQX36luxxYk0dDPYMjcTZhewIGvGCvdMLPdOKilpQn2VLAZ0FnSIQZ6FNlX62XkzZjjUU7FIkEaym7aDBMKHyANHpc1hS8RcVJE+LHuDMc6lwErHdFG1DW9Ta4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785339638; c=relaxed/simple;
	bh=y4Z9bRI9kl+5SfyqXip40FNbkMh0cLcY/RV/p5Va0g8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JFF28BpbuSf9JaVDbxYzBLUPutbFmZIewdbxKKPGG4iwCbzuuFULZAyj3TzU6UNNY33PdBllyLf6O6NrNz1UbWYCgJgLprJvHFD5bTAZTd/YaxQr7Ytqe+xcp6lVkmCj54LIKYfZwLXpUEVDnxzV4qqREFRqghMrBMmzw9q0FDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=qAN4v858; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="qAN4v858"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1785339634;
	bh=y4Z9bRI9kl+5SfyqXip40FNbkMh0cLcY/RV/p5Va0g8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qAN4v8583/1yw+8mYzSADdu1jNKw5bQGOcHbMZEVkvSSHXzy89SpgT95weARf+ZBf
	 eDfKYoen659YHSGzhprXzrGQlNtrScAIkWIpVDxK5uZCl65AHH8ryQwuZBd1YG6YXc
	 PPgUQPpTKR1RsmiJUfjl8bdkDFbA8y60k9lmCEiA=
Date: Wed, 29 Jul 2026 17:40:33 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (cros_ec) Handle temperature conversion
 overflows
Message-ID: <63f9c782-3e4e-468e-a31f-901d1e2ff40b@t-8ch.de>
References: <20260728-cros_ec-hwmon-overflow-v2-1-d24e24d0792b@weissschuh.net>
 <0fbf7f69-bb90-4209-b9d5-258759711496@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0fbf7f69-bb90-4209-b9d5-258759711496@roeck-us.net>

On 2026-07-28 08:02:28-0700, Guenter Roeck wrote:
> On 7/28/26 03:17, Thomas Weißschuh wrote:
> > The calculations converting between the different temperature units can
> > overflow on 32-bit systems, resulting in incorrect data.
> > 
> > Detect these overflows and handle them.
> > 
> > The code is written in a way that there is a single conversion function
> > and the compiler can recognize when overflows are impossible (on 64-bit
> > and in cros_ec_hwmon_temp_to_millicelsius()). If the compiler detects
> > this, it will optimize away the overflow checks.
> > 
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > ---
> > Changes in v2:
> > - Drop already applied patch 1.
> > - Also handle overflow of u32 -> long.
> > - Clarify commit message wrt compiler optimizations.
> > - Use __always_inline over __flatten to allow the compiler to optimize
> >    away more unnecessary overflow checks.
> > - Link to v1: https://patch.msgid.link/20260630-cros_ec-hwmon-overflow-v1-0-3d2ecd3eb0f2@weissschuh.net
> > ---
> >   drivers/hwmon/cros_ec_hwmon.c | 31 ++++++++++++++++++++++++++-----
> >   1 file changed, 26 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> > index 1337b646e022..004a8180b665 100644
> > --- a/drivers/hwmon/cros_ec_hwmon.c
> > +++ b/drivers/hwmon/cros_ec_hwmon.c
> > @@ -5,11 +5,13 @@
> >    *  Copyright (C) 2024 Thomas Weißschuh <linux@weissschuh.net>
> >    */
> > +#include <linux/build_bug.h>
> >   #include <linux/cleanup.h>
> >   #include <linux/device.h>
> >   #include <linux/hwmon.h>
> >   #include <linux/math.h>
> >   #include <linux/module.h>
> > +#include <linux/overflow.h>
> >   #include <linux/platform_device.h>
> >   #include <linux/platform_data/cros_ec_commands.h>
> >   #include <linux/platform_data/cros_ec_proto.h>
> > @@ -151,14 +153,28 @@ static bool cros_ec_hwmon_is_error_temp(u8 temp)
> >   /* This differs slightly from the variant in units.h to avoid rounding inconsistencies. */
> >   #define CROS_EC_HWMON_ABSOLUTE_ZERO_MILLICELSIUS (-273000)
> > -static long cros_ec_hwmon_kelvin_to_millicelsius(long t)
> > +static __always_inline bool cros_ec_hwmon_kelvin_to_millicelsius_overflow(long t, long *ret)
> >   {
> > -	return t * MILLIDEGREE_PER_DEGREE + CROS_EC_HWMON_ABSOLUTE_ZERO_MILLICELSIUS;
> > +	if (check_mul_overflow(t, MILLIDEGREE_PER_DEGREE, ret))
> > +		return true;
> > +
> > +	if (check_add_overflow(*ret, CROS_EC_HWMON_ABSOLUTE_ZERO_MILLICELSIUS, ret))
> > +		return true;
> > +
> > +	return false;
> 
> 	return check_add_overflow(*ret, CROS_EC_HWMON_ABSOLUTE_ZERO_MILLICELSIUS, ret);
> >   }
> >   static long cros_ec_hwmon_temp_to_millicelsius(u8 temp)
> 
> The maximum value of "temp" is 255.
> 
> >   {
> > -	return cros_ec_hwmon_kelvin_to_millicelsius((((long)temp) + EC_TEMP_SENSOR_OFFSET));
> 
> 255 + 200 = 455.
> 455 * 1000 = 455000 (not even counting the conversion from kelvin to C).
> 
> How could this ever overflow ?

It will never overflow. And the compiler knows this and optimizes away
all the overflow checks. Otherwise the build would straight up fail to
the BUILD_BUG()s below.

The idea was that not everyone reading this code needs to do the
calculations and double-check.

> > +	long ret;
> > +
> > +	if (check_add_overflow(temp, EC_TEMP_SENSOR_OFFSET, &ret))
> > +		BUILD_BUG();
> > +
> > +	if (cros_ec_hwmon_kelvin_to_millicelsius_overflow(ret, &ret))
> > +		BUILD_BUG();
> > +
> > +	return ret;
> >   }
> >   static bool cros_ec_hwmon_attr_is_temp_threshold(u32 attr)
> > @@ -236,8 +252,13 @@ static int cros_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> >   			ret = cros_ec_hwmon_read_temp_threshold(priv->cros_ec, channel,
> >   								cros_ec_hwmon_attr_to_thres(attr),
> >   								&threshold);
> > -			if (ret == 0)
> > -				*val = cros_ec_hwmon_kelvin_to_millicelsius(threshold);
> > +			if (ret == 0) {
> > +				if (overflows_type(threshold, long))
> > +					*val = LONG_MAX;
> > +
> > +				if (cros_ec_hwmon_kelvin_to_millicelsius_overflow(threshold, val))
> > +					*val = LONG_MAX;
> > +			}
> 
> I agree with Sashiko - it does not make sense to call cros_ec_hwmon_kelvin_to_millicelsius_overflow()
> if it is already known that threshold overflowed.

Yep, this is a bug. This would be correct:

if (ret == 0) {
       if (overflows_type(threshold, long) ||
	   cros_ec_hwmon_kelvin_to_millicelsius_overflow(threshold, val))
	       *val = LONG_MAX;
}

> Personally I think this is way too complicated. An overflowing temperature above 255 degrees C
> does not make any sense, and returning LONG_MAX as temperature seems a bit odd.
> I would just have checked for some reasonable limit, such as
> 			if (threshold > 255 + 273)
> 				*val = 255000;
> 			else
> 				*val = cros_ec_hwmon_kelvin_to_millicelsius(threshold);

That works for me, too. Thanks.

> If it does make sense to return LONG_MAX as temperature for some reason, that should
> be explained.

No specific reason.


Thomas
