Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85ACA3F8EDC
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 09:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785921686; cv=none; b=dqtR3UQVjX9nxNAN7GIFC1bw90/gtRBgf2/NLD6E+MDWkweTJtdoraG+8q5vaEPy7H02i4ESQh7snALZPETA+QJLc3m45aOnBPBMJlun7qNRyzKRnv6zbYB7zQc+P+T6NZEWu624hBeZZjWAlvRR8FEnfyxRE8BhUbxUMTTzlW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785921686; c=relaxed/simple;
	bh=CdRWWy6WZBFaMoEYTQpqTaVQ0gAhjtF3y65NDCyd1mM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GCt+AT7suFbI5qNew01w80MQ/UCfLwqGZqToJ8mhkT72nDTwOtWGc5jaOU0CN9telsH5EgKj07Uw8XHSc/u9yHaBtzud2lb7/YoL/xVft4PbmqBQAH1ejD9f5qIHJau6ha61MQgnaP0q/M9RKme7A5NkDRUaMcPiKi5gtRVeHIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fYwkDo7y; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fYwkDo7y"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so8453345e9.2
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Aug 2026 02:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785921678; x=1786526478; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jvfBNK9XJ2qiRLZWNY6k1wOhe0IbEhdXR9dsXAa20As=;
        b=fYwkDo7yRdiWSwwpklggHerWCdptXwXXUrHM39RW6TJ6ONuuP+1yPMw01Cnk8rWmk7
         7TSm+xr7+FC32mhbv9Cg39wetF91pc/MCYZWeRF6KYU0SCRF8LIeR7I6gAtVjb8zEGoV
         g/WIMOLN1rTJdFjN1W4jjb+VV4nR+oUiH/5u8ySFOzKN+aVgRUd5R1RjlrXZOmtAwZyO
         Cv/XjAeISkHCqlQwV+WJeYMPhyF7gIfhFnPV4gF8er3H7Aa16JC5mPWJbLBmgoAD8GFh
         S0hgxA6bgITZ4RQIjoCVyJHS6f/U5SFI3dqtuYd3eb6KjyHdG+d8FQ1284eU73Oj9FrB
         qT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785921678; x=1786526478;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jvfBNK9XJ2qiRLZWNY6k1wOhe0IbEhdXR9dsXAa20As=;
        b=kEUE6P7cLBzqMmbqQYM5tygM6jnCBOxi+K2zYOkx9ULw5gBNVzsz+4XnI5bddqPm/h
         P6jc0tXYbcZA13AEAeWiV7ayKoP88LCLDSp0DyFxnhK8C9pI00SFyT0dxP9is4a0ZMs0
         ybhF0XM4rVoKZeHl85cBc/UvYRSvF8HpFkXLB0Jp6lisXwMNdtahkVB2arCECe6slpHH
         e6xYLq8+283Y4XqjjirBU4yUhMBLOQ1F9i0MmPHbxSzqWP1BwCFR6v6x2AiK21ehusCP
         8dx16qqfOczrKRvwQtYFYX0n6z4wDP55LorhgRy4eYS1Txq4yr6qcLvKZ2TDLiww3cY2
         INGA==
X-Gm-Message-State: AOJu0YzCVyKo3YDTOoQSEOL5NPMYsoK/LGNCRAADanXzaQFslWJ4drnK
	k+91s/iMkK7BCcQ/fPrCcwbGE3CoD1MkLBolPvxXvkPTbA/WRpKBOG7y
X-Gm-Gg: AR+sD12Flq7mqe23HuTdX904Pm0olp6kyjaGAYU5NRrU/9KEkW3bBAsP4jN1+eJEYyg
	d5mCAys4C8eNqoHhMOALGoIr8B9g8bA57vEbnvWLjMJCLZHpoFBbvzrdVhjKaIY352j8r824o6H
	OZOPaJuHMTvgqyIi3pACyxPpQnXcC5gOAZDnIv9GOs+/T3pkD144wk76779tvK7QecfgdYcwhOU
	tFQ3otY9Y9/gcaO/a8Djx+Px3SwABUnyD6GtRFMFxCMEebf4z4EnW/2kvOnNWYk9fBD4GKl8Mse
	28hLudxiSrAcSrM2TFXlgqre/c+xnIbY1uXcl+L/Wg/cEsL7gMllghRVcKvZCVm5v6lcbcKyA/S
	i8DMaqtREuwwmqTRrjiWljo7gcbLEhHDz6uIU2DljlwXOTYDSxgT//h3ZIkyXC3dnHhXE9t+nHh
	5x+oUDlcXL6k14wd12+tU+zkRv2mfdw/W8JPN1u0B9R0J+3zMtcTex
X-Received: by 2002:a05:600c:4e87:b0:495:573e:1c54 with SMTP id 5b1f17b1804b1-4994e7c1122mr51134215e9.9.1785921677820;
        Wed, 05 Aug 2026 02:21:17 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e98fdedsm44655085e9.4.2026.08.05.02.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 02:21:17 -0700 (PDT)
Date: Wed, 5 Aug 2026 10:22:28 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>, 
	Nuno Sa <nuno.sa@analog.com>, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 2/3] hwmon: (ltc4282) Clamp negative current limits
Message-ID: <anMAcWIbE7_wOjIv@nsa>
References: <20260805005721.1566034-1-linux@roeck-us.net>
 <20260805005721.1566034-3-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260805005721.1566034-3-linux@roeck-us.net>

On Tue, Aug 04, 2026 at 05:57:20PM -0700, Guenter Roeck wrote:
> When a negative value is passed to ltc4282_write_curr(), the signed long
> val is cast directly to u64:
> 
> drivers/hwmon/ltc4282.c:ltc4282_write_curr() {
>         /* need to pass it in millivolt */
>         u32 in = DIV_ROUND_CLOSEST_ULL((u64)val * st->rsense, DECA * MICRO);
>         ...
> }
> 
> This cast converts negative inputs into large positive values. The
> subsequent division result overflows the u32 in variable, truncating
> to a pseudo-random positive value. When this is passed to
> ltc4282_write_voltage_byte(), it is clamped to the maximum limit instead
> of zero.
> 
> Clamp val to 0 and to the maximum supported upper limit before the cast
> and assign the result to a 64-bit temporary variable before the division
> to avoid the underflow and an also possible overflow.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Fixes: cbc29538dbf7d ("hwmon: Add driver for LTC4282")
> Cc: Nuno Sa <nuno.sa@analog.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/ltc4282.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/ltc4282.c b/drivers/hwmon/ltc4282.c
> index bb7f6727c44d..bb1bcb369016 100644
> --- a/drivers/hwmon/ltc4282.c
> +++ b/drivers/hwmon/ltc4282.c
> @@ -14,6 +14,7 @@
>  #include <linux/hwmon.h>
>  #include <linux/i2c.h>
>  #include <linux/math.h>
> +#include <linux/math64.h>
>  #include <linux/minmax.h>
>  #include <linux/module.h>
>  #include <linux/regmap.h>
> @@ -929,8 +930,11 @@ static int ltc4282_curr_reset_hist(struct ltc4282_state *st)
>  static int ltc4282_write_curr(struct ltc4282_state *st, u32 attr,
>  			      long val)
>  {
> +	s32 ulimit = min_t(u64, INT_MAX,
> +			   div_u64((u64)INT_MAX * DECA * MICRO, st->rsense));

I guess we can do the same as in ltc4283 instead of just assuming
INT_MAX:

https://elixir.bootlin.com/linux/v7.2-rc5/source/drivers/hwmon/ltc4283.c#L765

And so we just account for isense_max

- Nuno Sá

