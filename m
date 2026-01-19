Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E491494DB
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Jan 2026 23:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768866729; cv=none; b=FxO7aQeQ39y0+j/5+4juC3bQIA26rnEi50MGk2l3JIMsSTpT58idjbpxvLxRVXSu2/M6e1drntHWY/wq6LXXoS2h4zOXBeaN3AcvHiqjzN8cGmyUfOHXAtoJ5aAgsL4XVZmS+Xp7gUM2pXl0R/p3M0GkfFILmBsaNWu0x/CxfTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768866729; c=relaxed/simple;
	bh=rrO0nZGRam5hmePxS7ty6ujffIoD061I5JN1JUG9WIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mg2klp/1RKxSWbBK5UpTXcelRfuScv8Y5/RS/BXEu+8VSDmS0s72yEnO1GgzdDUBH3k4u/ILdt1+Gyshxi/hPo1N/BcmbJa7ItpIaGQRgC5k1AcAg7YYgTfOg4BoUJ1ZhhdKEG6cT7hrJJXvBHRXAmGuL7cBY5vJnV/YJ+7EqkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQNq/X0k; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQNq/X0k"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-11f36012fb2so6836695c88.1
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Jan 2026 15:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768866726; x=1769471526; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zxwGn1V2dW/hFTv9wkaq3pQe7QMbTQspIJ1JqRC3kqA=;
        b=KQNq/X0kADeBiFlD5Nig6l4qrJvvKiCSqhJpPTfDg2sq1j4CZCL3BgiYdMrvzKHsKh
         eGzm66HcieYEmgTvTfNeWF62C7cgBeTODNxMSQbUxj3RtRubJOzG4+L0Nl7xzgyjrWe2
         hOy1GB+WZ6W3H6e6+MiuHgBSuIy1ZHQ/yqrZoamMDb4ltYRmp/f3iI/QIirkdnSGmhjV
         BLXHFnyZIttxv42l05KqcJbzn5xqKXEVFgH2ixPwiq8H0slAcA6KvFCo7btS6vr6YElR
         68QB5Aa+G9XHTedGghh1s5AFt/IDprS/w8xdfnxdAp+iUhLkb8MJa7RGzY7ILoJLKXgP
         b3aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768866726; x=1769471526;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zxwGn1V2dW/hFTv9wkaq3pQe7QMbTQspIJ1JqRC3kqA=;
        b=HuZhH6RBU+IHbg6dzS8smUaXzONCxVhRN8bVc3rcXe7ToNpicDSIrPUBEzQNGH/eyn
         KEZMswt5bbpn92a+T1a/nLmttRZ+vzH+mBq9y/OjarNOrwlj7yviF66phHmTYWJMB4tQ
         dOJn8eaHrreVIWbGenmZu75Jtp13tvn/Ztefb3yZxXFC/dAjh08qc7AxyCxi+TO22euS
         fKFQ1RYyzuQz6G6xHqfMBoLNolGpz/YwcYJleVSBFnjJHrvMj4Jm4iVGWPL4GwBenPnY
         /lwnpMPOQgq9k8l2xSzlDFtexxnByVmHv5Ho9xngr5DWkONn5L1xRpenT0qA4C+JtUna
         2dmA==
X-Forwarded-Encrypted: i=1; AJvYcCVcKftQNudB7do2iYuWDt0wofuqq0KMD7vCE51NrEagdqUJilowjkYdN1a/fNpvKEH7yczxbeCrfwYYrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNVi+sSh4dDlcNT5Niw1H8M+XjCdp9rVS4c7IOnRdrXJdiKiZS
	gqk9pKFKCC7FLDJ9ZaNPWJbLxO9k095WKVDBFcJlNZ9x/q2a9J2hcIsj
X-Gm-Gg: AY/fxX6/3mwmvzFBv1P5i8u1/jLDEOTuI5w9HmMKXxh5hV6miSU2n9FmYWus9Rc+O8V
	pDns4W2eDWa1U8mglVl9yTcVMAQVR2IK1v+BGFuowhvyKKc3F+v+dgXM3lum//kWelTGToGTdCy
	RqLtolINzTVUekncowZVkEik9gtT/NGk/gDXZjBymJikrdMoG5+w/EZeUJno1vUm4Zeu+zEaNFD
	knJW7LXXgMvgsZhY0/ZVF6FyoQIUqdOOO6sioTjnqW4o7wAQyBqZMxRvgZ24fNrdz8o2N8SNoG/
	fPkif3vHnbpNqI+8kJZ/J3MEwN9RS03c6WLgE09qAMzupig+NLHgA5Eu03v3+Jmp1G7x/cBl7V0
	M1jMF8BpBUC24ni+gePgb5t7Q2YRYIRW2RS7OqFntWf1SfBVyTP3UmSQEg5QDtsYGKuem1Boash
	52u/ABYUlLctGRflE1kiD2TuR0zBY809fpo+k=
X-Received: by 2002:a05:7022:f94:b0:11b:99a2:9082 with SMTP id a92af1059eb24-1244b32234emr8122312c88.15.1768866726019;
        Mon, 19 Jan 2026 15:52:06 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af10e21sm18360931c88.16.2026.01.19.15.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 15:52:05 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Jan 2026 15:52:04 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Nathan Chancellor <nathan@kernel.org>
Cc: James Calligeros <jcalligeros99@gmail.com>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	asahi@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, Justin Stitt <justinstitt@google.com>,
	Neal Gompa <neal@gompa.dev>
Subject: Re: FIELD_PREP failure in drivers/hwmon/macsmc-hwmon.c
Message-ID: <010a8554-6413-42ff-8d73-1811dffbb5dd@roeck-us.net>
References: <20260119195817.GA1035354@ax162>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119195817.GA1035354@ax162>

Hi,

On Mon, Jan 19, 2026 at 12:58:17PM -0700, Nathan Chancellor wrote:
> Hi folks,
> 
> There is a build error from a FIELD_PREP in drivers/hwmon/macsmc-hwmon.c
> when building with clang-17 and older:
> 
>   drivers/hwmon/macsmc-hwmon.c:249:10: error: call to '__compiletime_assert_814' declared with 'error' attribute: FIELD_PREP: value too large for the field
>     249 |                        FIELD_PREP(FLT_MANT_MASK, val);
>         |                        ^
>   include/linux/bitfield.h:137:3: note: expanded from macro 'FIELD_PREP'
>     137 |                 __FIELD_PREP(_mask, _val, "FIELD_PREP: ");              \
>         |                 ^
>   include/linux/bitfield.h:90:3: note: expanded from macro '__FIELD_PREP'
>      90 |                 __BF_FIELD_CHECK_MASK(mask, val, pfx);                  \
>         |                 ^
>   include/linux/bitfield.h:69:3: note: expanded from macro '__BF_FIELD_CHECK_MASK'
>      69 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
>         |                 ^
>   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>   include/linux/compiler_types.h:619:2: note: expanded from macro '_compiletime_assert'
>     619 |         __compiletime_assert(condition, msg, prefix, suffix)
>         |         ^
>   include/linux/compiler_types.h:612:4: note: expanded from macro '__compiletime_assert'
>     612 |                         prefix ## suffix();                             \
>         |                         ^
>   <scratch space>:18:1: note: expanded from here
>      18 | __compiletime_assert_814
>         | ^
> 
> This does not appear to be strictly clang related, as this can be
> reproduced with GCC if macsmc_hwmon_write_f32() and
> macsmc_hwmon_write_key() are marked as __always_inline (after an
> internal change in LLVM, these functions are not inlined anymore):
> 
> ===
> diff --git a/drivers/hwmon/macsmc-hwmon.c b/drivers/hwmon/macsmc-hwmon.c
> index 1c0bbec7e8eb..e66d6ee30d7f 100644
> --- a/drivers/hwmon/macsmc-hwmon.c
> +++ b/drivers/hwmon/macsmc-hwmon.c
> @@ -224,7 +224,7 @@ static int macsmc_hwmon_read_key(struct apple_smc *smc,
>         return 0;
>  }
> 
> -static int macsmc_hwmon_write_f32(struct apple_smc *smc, smc_key key, int value)
> +static __always_inline int macsmc_hwmon_write_f32(struct apple_smc *smc, smc_key key, int value)
>  {
>         u64 val;
>         u32 fval = 0;
> @@ -252,7 +252,7 @@ static int macsmc_hwmon_write_f32(struct apple_smc *smc, smc_key key, int value)
>         return apple_smc_write_u32(smc, key, fval);
>  }
> 
> -static int macsmc_hwmon_write_key(struct apple_smc *smc,
> +static __always_inline int macsmc_hwmon_write_key(struct apple_smc *smc,
>                                   struct macsmc_hwmon_sensor *sensor, long val)
>  {
>         switch (sensor->info.type_code) {
> ===
> 
>   In file included from <command-line>:
>   In function 'macsmc_hwmon_write_f32',
>       inlined from 'macsmc_hwmon_write_key' at drivers/hwmon/macsmc-hwmon.c:261:10,
>       inlined from 'macsmc_hwmon_write_fan.isra' at drivers/hwmon/macsmc-hwmon.c:317:10:
>   include/linux/compiler_types.h:631:45: error: call to '__compiletime_assert_814' declared with attribute error: FIELD_PREP: value too large for the field
>     631 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>         |                                             ^
>   include/linux/compiler_types.h:612:25: note: in definition of macro '__compiletime_assert'
>     612 |                         prefix ## suffix();                             \
>         |                         ^~~~~~
>   include/linux/compiler_types.h:631:9: note: in expansion of macro '_compiletime_assert'
>     631 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>         |         ^~~~~~~~~~~~~~~~~~~
>   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
>      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>         |                                     ^~~~~~~~~~~~~~~~~~
>   include/linux/bitfield.h:69:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>      69 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
>         |                 ^~~~~~~~~~~~~~~~
>   include/linux/bitfield.h:90:17: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
>      90 |                 __BF_FIELD_CHECK_MASK(mask, val, pfx);                  \
>         |                 ^~~~~~~~~~~~~~~~~~~~~
>   include/linux/bitfield.h:137:17: note: in expansion of macro '__FIELD_PREP'
>     137 |                 __FIELD_PREP(_mask, _val, "FIELD_PREP: ");              \
>         |                 ^~~~~~~~~~~~
>   drivers/hwmon/macsmc-hwmon.c:249:24: note: in expansion of macro 'FIELD_PREP'
>     249 |                        FIELD_PREP(FLT_MANT_MASK, val);
>         |                        ^~~~~~~~~~
> 
> Justin did a little digging and saw that through
> 
>   macsmc_hwmon_write_fan()
>   -> macsmc_hwmon_write_key()
>     -> macsmc_hwmon_write_f32()
> 
> value is 1 so:
> 
> static __always_inline int macsmc_hwmon_write_f32(struct apple_smc *smc, smc_key key, int value)
> {
>         u64 val;
>         u32 fval = 0;
>         int exp = 0, neg;
> 
>         val = abs(value); // val == 1
>         neg = val != value;
> 
>         if (val) {
>                 int msb = __fls(val) - exp; // __fls(1) == 0, thus msb == 0
> 
>                 if (msb > 23) {
>                         val >>= msb - FLT_MANT_BIAS;
>                         exp -= msb - FLT_MANT_BIAS;
>                 } else if (msb < 23) {
>                         val <<= FLT_MANT_BIAS - msb; // val = (1 << 23) == 0x800000
>                         exp += msb;
>                 }
> 
>                 fval = FIELD_PREP(FLT_SIGN_MASK, neg) |
>                        FIELD_PREP(FLT_EXP_MASK, exp + FLT_EXP_BIAS) |
>                        // Fails __BF_FIELD_CHECK_MASK as
>                        //
>                        // __builtin_ffsll(0x7FFFFF) - 1) == 0
>                        //
>                        // ~(0x7FFFFF >> 0) & (0x800000) == 0x800000
>                        FIELD_PREP(FLT_MANT_MASK, val);
>         }
> 
>         return apple_smc_write_u32(smc, key, fval);
> }
> 
> It seems like msb of zero is unexpected in this path but I am not sure
> what the fix is, hence the report.
> 
I attached two AI reviews of the driver. That may give some hints.

James, please have a look.

Thanks,
Guenter

---
commit 785205fd81399bd8e49065aee3362a99d5702321
Author:     James Calligeros <jcalligeros99@gmail.com>
hwmon: Add Apple Silicon SMC hwmon driver

Add a hwmon driver to expose current, power, temperature, and voltage
monitoring sensors, as well as fan speed monitoring and control via
the SMC on Apple Silicon devices.

Link: https://lore.kernel.org/r/20251112-macsmc-subdevs-v5-6-728e4b91fe81@gmail.com

> diff --git a/drivers/hwmon/macsmc-hwmon.c b/drivers/hwmon/macsmc-hwmon.c
> new file mode 100644
> index 000000000000..1c0bbec7e8eb
> --- /dev/null
> +++ b/drivers/hwmon/macsmc-hwmon.c
> @@ -0,0 +1,851 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Apple SMC hwmon driver for Apple Silicon platforms
[ ... ]
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/hwmon.h>
> +#include <linux/mfd/macsmc.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>

The driver uses __fls() later on. Should <linux/bitops.h> be included here?

> +
> +#define MAX_LABEL_LENGTH	32
> +
> +/* Temperature, voltage, current, power, fan(s) */
[ ... ]
> +/*
> + * Many sensors report their data as IEEE-754 floats. No other SMC function uses
> + * them.
> + */
> +static int macsmc_hwmon_read_f32_scaled(struct apple_smc *smc, smc_key key,
> +					int *p, int scale)
> +{
> +	u32 fval;
> +	u64 val;
> +	int ret, exp;
> +
> +	ret = apple_smc_read_u32(smc, key, &fval);
> +	if (ret < 0)
> +		return ret;
> +
> +	val = ((u64)((fval & FLT_MANT_MASK) | BIT(23)));
> +	exp = ((fval >> 23) & 0xff) - FLT_EXP_BIAS - FLT_MANT_BIAS;
> +
> +	/* We never have negatively scaled SMC floats */
> +	val *= scale;
> +
> +	if (exp > 63)
> +		val = U64_MAX;
> +	else if (exp < -63)
> +		val = 0;
> +	else if (exp < 0)
> +		val >>= -exp;
> +	else if (exp != 0 && (val & ~((1UL << (64 - exp)) - 1))) /* overflow */
> +		val = U64_MAX;
> +	else
> +		val <<= exp;
> +
> +	if (fval & FLT_SIGN_MASK) {
> +		if (val > (-(s64)INT_MIN))
> +			*p = INT_MIN;
> +		else
> +			*p = -val;
> +	} else {
> +		if (val > INT_MAX)
> +			*p = INT_MAX;
> +		else
> +			*p = val;
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * The SMC has keys of multiple types, denoted by a FourCC of the same format
> + * as the key ID. We don't know what data type a key encodes until we poke at it.
> + */
> +static int macsmc_hwmon_read_key(struct apple_smc *smc,
> +				 struct macsmc_hwmon_sensor *sensor, int scale,
> +				 long *val)
> +{
> +	int ret;
> +
> +	switch (sensor->info.type_code) {
> +	/* 32-bit IEEE 754 float */
> +	case __SMC_KEY('f', 'l', 't', ' '): {
> +		u32 flt_ = 0;
> +
> +		ret = macsmc_hwmon_read_f32_scaled(smc, sensor->macsmc_key,
> +						   &flt_, scale);

macsmc_hwmon_read_f32_scaled() takes int * as its third argument, but here a
pointer to u32 is passed. This results in the signed integer result being stored
in an unsigned variable. When flt_ is subsequently assigned to *val (which is
long), the sign extension is lost, causing negative values (such as temperatures
below zero) to be reported as large positive numbers. Should flt_ be declared as
int instead?

> +		if (ret)
> +			return ret;
> +
> +		*val = flt_;
> +		break;
> +	}
> +	/* 48.16 fixed point decimal */
> +	case __SMC_KEY('i', 'o', 'f', 't'): {
[ ... ]
> +		break;
> +	}
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static int macsmc_hwmon_write_f32(struct apple_smc *smc, smc_key key, int value)
> +{
> +	u64 val;
> +	u32 fval = 0;
> +	int exp = 0, neg;
> +
> +	val = abs(value);

Does value come from user input? If value is INT_MIN, abs(value) might be
undefined or return INT_MIN. Also, macsmc_hwmon_write passes long val, which
is truncated to int value here. While fan speeds are likely small, should this
take long to match the caller and handle potential overflow or large values
correctly?

> +	neg = val != value;
> +
> +	if (val) {
> +		int msb = __fls(val) - exp;
> +
> +		if (msb > 23) {
> +			val >>= msb - FLT_MANT_BIAS;
> +			exp -= msb - FLT_MANT_BIAS;

If msb > 23 (e.g. value is 1<<24), exp (which is 0) is decremented by 1
(24 - 23). This results in an effective exponent of -1. Should exp be
incremented by msb - FLT_MANT_BIAS instead, similar to how it is incremented
in the msb < 23 case (where it becomes msb)? The current logic seems to
produce incorrect float values for integers larger than 2^23.

> +		} else if (msb < 23) {
> +			val <<= FLT_MANT_BIAS - msb;
> +			exp += msb;
> +		}
> +

What happens if msb == 23? The else if (msb < 23) condition is false, so it
falls through. exp remains 0. However, for 1<<23, the exponent should be 23.
It seems the msb == 23 case is mishandled and results in an incorrect
exponent of 0.

> +		fval = FIELD_PREP(FLT_SIGN_MASK, neg) |
> +		       FIELD_PREP(FLT_EXP_MASK, exp + FLT_EXP_BIAS) |
> +		       FIELD_PREP(FLT_MANT_MASK, val);
> +	}
> +
> +	return apple_smc_write_u32(smc, key, fval);
> +}
[ ... ]

---
2nd review, pointing out the possible problem with FIELD_PREP:

The following is a review of commit 785205fd81399bd8e49065aee3362a99d5702321.

  drivers/hwmon/macsmc-hwmon.c

  The function macsmc_hwmon_write_f32 contains two issues: incorrect exponent calculation for larger integers and a value overflow in FIELD_PREP.

  1. Incorrect Exponent Calculation

  In macsmc_hwmon_write_f32, the logic for handling values where msb > 23 is incorrect.

   1         } else if (msb < 23) {
   2             val <<= FLT_MANT_BIAS - msb;
   3             exp += msb;
   4         }
  For msb < 23, exp correctly becomes msb (since exp starts at 0).
  However:

   1         if (msb > 23) {
   2             val >>= msb - FLT_MANT_BIAS;
   3             exp -= msb - FLT_MANT_BIAS;
  For msb > 23, exp is decremented. For example, if value is 2^24 (msb=24), exp becomes -1. The correct exponent should be 24. The code effectively calculates the inverse direction for the exponent when shifting right. It should simply be
  exp = msb in all cases (conceptually), or exp += msb if accumulating.

  2. Value Overflow to FIELD_PREP

   1         fval = FIELD_PREP(FLT_SIGN_MASK, neg) |
   2                FIELD_PREP(FLT_EXP_MASK, exp + FLT_EXP_BIAS) |
   3                FIELD_PREP(FLT_MANT_MASK, val);

  FLT_MANT_MASK covers bits 0-22. After the normalization shifts, val has the implicit leading bit set at bit 23 (defined as FLT_MANT_BIAS). FIELD_PREP checks if the value fits within the mask. Since bit 23 is set in val but not in
  FLT_MANT_MASK, this will trigger a warning/error (depending on kernel config) about value overflow. The implicit bit should be masked off before passing it to FIELD_PREP.

  Suggested Fix:

    1 static int macsmc_hwmon_write_f32(struct apple_smc *smc, smc_key key, int value)
    2 {
    3     u64 val;
    4     u32 fval = 0;
    5     int exp = 0, neg;
    6 
    7     val = abs(value);
    8     neg = val != value;
    9 
   10     if (val) {
   11         int msb = __fls(val) - exp;
   12 
   13         if (msb > 23)
   14             val >>= msb - FLT_MANT_BIAS;
   15         else
   16             val <<= FLT_MANT_BIAS - msb;
   17 
   18         exp += msb;
   19 
   20         fval = FIELD_PREP(FLT_SIGN_MASK, neg) |
   21                FIELD_PREP(FLT_EXP_MASK, exp + FLT_EXP_BIAS) |
   22                FIELD_PREP(FLT_MANT_MASK, val & FLT_MANT_MASK);
   23     }
   24 
   25     return apple_smc_write_u32(smc, key, fval);
   26 }

  Note: __fls returns unsigned long, so mixing it with int exp is slightly messy but likely fine given the range of int. The simplified logic exp += msb works because exp starts at 0. Masking val ensures FIELD_PREP doesn't complain about the
  implicit bit.
