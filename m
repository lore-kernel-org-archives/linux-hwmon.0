Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DD632F757
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Aug 2026 15:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786031817; cv=none; b=arKTpUrhAsFiyLG6WT5qAc0GCsXsedWGLrQy1Ps+df75R+k48XX0XC7TY9vR+lLUqlx6SZwBl4DaMpgpas1FdPgYBRu7w8qYw3S4rOEddpV7WGUNVzn7dwkUyJVLHvGnZwo887cK8gFkiR1Dn4bC73ybAebI+dy4lYjquI582DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786031817; c=relaxed/simple;
	bh=tLyMlvPdn7HA4G3WRqLGTcg2nsh1/vxka/KDlj4IltM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mF/B3vmXC4X4YSUmfGKHp0juZsWX0iRTNI02xatKNoyRPd6bYAoXIKFbj77J/oNqYGVaYw5hjfiypl4SFXJsqlRMQLtvDMjyNkVFmzMq4DDyujt2YsxSOJKuMPp2KX2nIfGH2UNk/zy17ScyiJm0XlSfjF3ek+bKCQI32XoQIo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=nFNbaTwm; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="nFNbaTwm"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 172E4240101
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Aug 2026 17:56:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1786031806;
	bh=DsAR8es1zDWhLTN76LiATC65gXc45MOPxStdyRuyBuI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=nFNbaTwmWAD80/VH9cAV83qhJYvgN9g6B7He74w9Oquqv0L3D3+kbLGgNmXhmZg5E
	 ou+aASAW5JVpzOwXCOrO3x24k4PI6T6Az+ebTjv2vZMtRKeNn3J3aqFSKSoVo0wrvZ
	 8uAhTUMtBU++6g1I47F4cEWfOF6050x3xzF3TsdKYj1HGSpQVPzL43wm8kLDtC43t0
	 6n6Oex4JuU9CG6WFab284znuKS3xCciVMRX9Qy3FKLo7kpFHmZfwHsvDNKbWcT9CPX
	 /di0wK0tJAQaC3D8Xfi2ObNCe9UUJZlx87Sm3UzdhBeIWR/+GlGed0qG84wJ1YI1qu
	 PZhFAFteYWaww==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hGBjT4b2kz9rxK;
	Thu,  6 Aug 2026 17:56:45 +0200 (CEST)
Date: Thu, 06 Aug 2026 15:56:45 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>, Sashiko
 <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2] hwmon: (corsair-psu) Fix linear11 calculation
Message-ID: <20260806175645.5e50b70c@posteo.net>
In-Reply-To: <deb3db39-e8da-40d2-af9e-bdaf73b9bf3c@roeck-us.net>
References: <20260804034811.2385506-1-linux@roeck-us.net>
	<20260806173411.6be71067@posteo.net>
	<deb3db39-e8da-40d2-af9e-bdaf73b9bf3c@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 6 Aug 2026 08:52:41 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> On 8/6/26 08:34, Wilken Gottwalt wrote:
> > On Mon,  3 Aug 2026 20:48:11 -0700
> > Guenter Roeck <linux@roeck-us.net> wrote:
> > 
> >> In corsairpsu_linear11_to_int(), the mantissa is extracted using bitwise
> >> operations and cast to s16 before being shifted left:
> >>
> >> static int corsairpsu_linear11_to_int(const u16 val, const int scale)
> >> {
> >>      ...
> >>      const int mant = (((s16)(val & 0x7ff)) << 5) >> 5;
> >>      ...
> >> }
> >>
> >> Due to C integer promotion rules, the masked value (which is always
> >> positive) is promoted to a 32-bit integer before the left shift. As a
> >> result, the sign bit is never extended to bit 31 of the promoted integer.
> >>
> >> When the device hardware reports a negative temperature in Linear11 format
> >> (such as an ambient temperature probe reporting sub-zero), the negative
> >> mantissa is parsed incorrectly as a massive positive value. For example,
> >> -1 becomes 2047, which scales to 2047 degrees Celsius.
> >>
> >> Fix the problem by type casting the result of the left shift operation
> >> to s16.
> >>
> >> Another problem is left-shifting of negative values. In C, the result of
> >> left-shifting negative values is undefined. Use a multiplication instead
> >> to avoid the problem.
> >>
> >> Also use a local s64 variable to store temporary results, change
> >> the return value type from int to long, and clamp the final value
> >> to LONG_MIN and LONG_MAX to avoid under- and overflow issues while
> >> retaining as much information as possible.
> >>
> >> Reported-by: Sashiko <sashiko-bot@kernel.org>
> >> Cc: Wilken Gottwalt <wilken.gottwalt@posteo.net>
> >> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> >> ---
> >> v2: Skip handling right-shift of negative values
> >>      (since it is widely used in the kernel)
> >>
> >>   drivers/hwmon/corsair-psu.c | 23 ++++++++++++++---------
> >>   1 file changed, 14 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
> >> index 24100519cd83..c437b469de5c 100644
> >> --- a/drivers/hwmon/corsair-psu.c
> >> +++ b/drivers/hwmon/corsair-psu.c
> >> @@ -137,13 +137,18 @@ struct corsairpsu_data {
> >>   };
> >>   
> >>   /* some values are SMBus LINEAR11 data which need a conversion */
> >> -static int corsairpsu_linear11_to_int(const u16 val, const int scale)
> >> +static long corsairpsu_linear11_to_long(const u16 val, const int scale)
> >>   {
> >>   	const int exp = ((s16)val) >> 11;
> >> -	const int mant = (((s16)(val & 0x7ff)) << 5) >> 5;
> >> -	const int result = mant * scale;
> >> +	const int mant = ((s16)((val & 0x7ff) << 5)) >> 5;
> > 
> > 
> >> +	s64 result = mant * scale;
> > 
> > Uhm, this is a 32bit multiplicaiton, actully a C gotcha I explain the beginners
> > in our company. https://godbolt.org/z/eM6TbGG5E
> > 
> 
> It is, but that is ok and intentional: both mant and exp are guaranteed to be
> no larger than s16, meaning the result is never larger than s32 and will never
> overflow.
> 
> >> -	return (exp >= 0) ? (result << exp) : (result >> -exp);
> >> +	if (exp >= 0)
> >> +		result *= (int)(1UL << exp);
> 
> This is the calculation that can overflow, making it necessary for result to be s64.

Yeah, it was just funny to see in the wild. It made my day. :D

greetings,
Wilken
