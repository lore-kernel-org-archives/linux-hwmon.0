Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4B3485CE4
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 16:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785946389; cv=none; b=FZNWhgkwYE4WMKsniLp8nJky9mCIS7HAdomsRlHs8pVtuT3SBrVl+q3aOHdIQ+ey5h9YItdcyEWC/7UvHWTuwqcvChQQnGOD2uNt8avs9/8AE9k7rRGBHnu2cmrZlYEeiHNmfKqLJ5UPiyQjihJaOj33o5RidDgO0sSKu5osuRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785946389; c=relaxed/simple;
	bh=ijfr/DwsSLWqPi3D9dZ2x+XIGoO3ldYFoUnKJJ9mifk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d5Gc9+Rvbh9heWtKINUL9pXucKs8zVanY4SVEA36QoUiboWvBwI1fpoPyECq7LnJE0UOpS+4P2lUCFV/VBTg/ss8kUPiveN7pJBny0euDu1QJ57cEPHn8WRWUDRACFYKFKBGOsHKbPJZvMvkQKpjuNb2+QVdZsa1GfWbrsbJphg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DHqOHcpM; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DHqOHcpM"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so6222825e9.2
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Aug 2026 09:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785946383; x=1786551183; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L4kWNcmuWDSMry9uvtYgDGldlrwJYj7m8RrSyinofnM=;
        b=DHqOHcpMvWOOhHCBqNtujWRGS317Rge25pi4KX/+SJMbEgGHg+Mf2WJCYDxhfDira6
         3CUnjfODor1jsf2DEh5Eu9/TXt4tG8EAiyaRw+uq2khkmEvejZfuWPD+/c6Iny0CqRK2
         4ptI6vI1pApEt1iRFxLalN/F+atZKcXqLfp2NjGiWS2ya7TDHhml5VUkhXOoJpGAGpe0
         3NUCO3svTbgMHDY0Terv1WqSKL7uHnhBpJ1yvdEr2yIhmHDn8hfFlx2E1fq25bZJSSOi
         wMMCaZD7BwWIHO1DHT9sDx83aPKATZTYt/B5y663eooCzwXyPuDiSgrGrI7Z/mEP4uQQ
         lZ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785946383; x=1786551183;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=L4kWNcmuWDSMry9uvtYgDGldlrwJYj7m8RrSyinofnM=;
        b=cj7zJbyU0oihFHVccP1qIrBAh4Vm4yJNlFulV4/ZiC6/eyQHK8SIO0m3P4LP9DDLHM
         NqzASnTgp/LcBF3Etgglb8m2TE/ol/61zFXLJxz33EZ9maO48+EuFZfMd3dAYJpkq4k/
         WQZ1ZPrC+hrkOXkadVIVFLlHj13Z2oIyJm0MWGV+veekU5395QrYAoblfk09ikYmx76f
         UH4AHvUQEh7pfzrBEOmlarohSYW0W8DTdWVVNnelzUWh1D8YK/6PO6JSrh3bSJ0QVopz
         d82LfaROM7Q23KR/Co5o+uWyFQNU7qvjDdzrC7mssYwr2FEng/OhvDYCawUNrIzVrsDh
         dH1w==
X-Gm-Message-State: AOJu0YyjV44I5q1dlOjIbxdmnDu5HI73RMJOnNZniZ+jG16hGF/xpW5T
	Oywr1GvWb4quR2jAsDuHxfQotRLzOHxaeifmXgzGFbPU5z6yiFPtIiPGJa/WlSTU
X-Gm-Gg: AR+sD12H/KdussJW5iWJrolbnVrmvC99F8r3geP+y3hgIkI9rkNX0B47GoAK2BcYNzn
	jEf/s1kNUT7H7M2aoOJRB6QyMiUqbddM9b29B7L1OmntwJhXm2G7sMpxXiZXY5raGh/lgBA0phv
	bR2lnh8s5egbAD6bBnE+cle6q2I5PTNR7/H4q7EYq3MaRqAaIRQHXQc1DsxkoCTacXHw0me4QvU
	ErULdyhYnbK4TDKKb4Pa42BuobRvI3AAK7hv/MKkakoJ7HLI7/UKSB1WG54ZCFJbFlmU7Gjf5c8
	ClL2iz1FwG766iay6iTczzV84TkPSsoUGcnbGHkT9jUCNnV47/m6uaPK6YlskJIoZO9kqxuh2mM
	5chXYiZvZwSbuYsObwYqmY3NBmArTviiPZ34h2WmDpEALpjRTG9zKhUANJ+xKgdRH2gCZyeux/M
	2c6EJCWglrpwfPyb3SPhQMSAupdu79lSlky6s3MIucp2OX50/g+9NV
X-Received: by 2002:a05:600c:4709:b0:493:f318:3bc6 with SMTP id 5b1f17b1804b1-4994e7c55b1mr83054355e9.13.1785946383368;
        Wed, 05 Aug 2026 09:13:03 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994dfe8973sm98113745e9.7.2026.08.05.09.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 09:13:03 -0700 (PDT)
Date: Wed, 5 Aug 2026 17:14:13 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>, 
	Nuno Sa <nuno.sa@analog.com>, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 2/3] hwmon: (ltc4282) Clamp negative current limits
Message-ID: <anNguh22t_Pvtdri@nsa>
References: <20260805005721.1566034-1-linux@roeck-us.net>
 <20260805005721.1566034-3-linux@roeck-us.net>
 <anMAcWIbE7_wOjIv@nsa>
 <b1aec4f9-020d-451b-ab5b-af48ab2671bb@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b1aec4f9-020d-451b-ab5b-af48ab2671bb@roeck-us.net>

On Wed, Aug 05, 2026 at 08:41:30AM -0700, Guenter Roeck wrote:
> On 8/5/26 02:22, Nuno Sá wrote:
> > On Tue, Aug 04, 2026 at 05:57:20PM -0700, Guenter Roeck wrote:
> > > When a negative value is passed to ltc4282_write_curr(), the signed long
> > > val is cast directly to u64:
> > > 
> > > drivers/hwmon/ltc4282.c:ltc4282_write_curr() {
> > >          /* need to pass it in millivolt */
> > >          u32 in = DIV_ROUND_CLOSEST_ULL((u64)val * st->rsense, DECA * MICRO);
> > >          ...
> > > }
> > > 
> > > This cast converts negative inputs into large positive values. The
> > > subsequent division result overflows the u32 in variable, truncating
> > > to a pseudo-random positive value. When this is passed to
> > > ltc4282_write_voltage_byte(), it is clamped to the maximum limit instead
> > > of zero.
> > > 
> > > Clamp val to 0 and to the maximum supported upper limit before the cast
> > > and assign the result to a 64-bit temporary variable before the division
> > > to avoid the underflow and an also possible overflow.
> > > 
> > > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > > Fixes: cbc29538dbf7d ("hwmon: Add driver for LTC4282")
> > > Cc: Nuno Sa <nuno.sa@analog.com>
> > > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > > ---
> > >   drivers/hwmon/ltc4282.c | 6 +++++-
> > >   1 file changed, 5 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/hwmon/ltc4282.c b/drivers/hwmon/ltc4282.c
> > > index bb7f6727c44d..bb1bcb369016 100644
> > > --- a/drivers/hwmon/ltc4282.c
> > > +++ b/drivers/hwmon/ltc4282.c
> > > @@ -14,6 +14,7 @@
> > >   #include <linux/hwmon.h>
> > >   #include <linux/i2c.h>
> > >   #include <linux/math.h>
> > > +#include <linux/math64.h>
> > >   #include <linux/minmax.h>
> > >   #include <linux/module.h>
> > >   #include <linux/regmap.h>
> > > @@ -929,8 +930,11 @@ static int ltc4282_curr_reset_hist(struct ltc4282_state *st)
> > >   static int ltc4282_write_curr(struct ltc4282_state *st, u32 attr,
> > >   			      long val)
> > >   {
> > > +	s32 ulimit = min_t(u64, INT_MAX,
> > > +			   div_u64((u64)INT_MAX * DECA * MICRO, st->rsense));
> > 
> > I guess we can do the same as in ltc4283 instead of just assuming
> > INT_MAX:
> > 
> > https://elixir.bootlin.com/linux/v7.2-rc5/source/drivers/hwmon/ltc4283.c#L765
> > 
> > And so we just account for isense_max
> > 
> 
> Sashiko isn't happy with it. It suggests the multiplier in the limit calculation
> should use MILLI, not MICRO, and that a 32-bit operation could overflow.
> With that, I'd rather keep it as is, or drop that patch and let you handle it.
> Please let me know what you prefer.
> 

I guess we would need to also do what we have in ltc4283 and limit the
range of values rsense is allowed to have so we can better reason on
what can or cannot overflow. But I can't really commit to when I can
handle this so I'm fine with the above approach.

- Nuno Sá

