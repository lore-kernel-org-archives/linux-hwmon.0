Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9256433C19E
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 16:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781196114; cv=none; b=qKUUwvLd+TDY+wNZjSipa3gl/x8dP2F7e21Ohc2lA519MbEd/8DEbWwH1SMJTiRNTpBBwU6SVsCrqqyJwknzCJcTB5+PA82hKqHunkQQ2euJQomTnmqcgbQI3hEuPNN5gyxTxqsQNPqkLF/4znXwTSLDeOC2pG23AVWo61uqZKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781196114; c=relaxed/simple;
	bh=7HHp+3WkShofO9440BPrN8XP5Km3O/6+YPIuMN6rE3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AgFL9KmbXcmgMKn7Sf1IZJLduPruPEBLfipkfrJK8MuInklfhPxt+nk58i1b055mNrCHBRgaDI6KmuxT3u0H+fldY4/Z7HFyeSQidy6LoySfxAWiByCnWsFDncDtq8pRkCKXLe8+HV71K3rk8ado5J1ijCqgTQWa9A3wUkoM+o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uclq3a5c; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uclq3a5c"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c85b73ffb52so278a12.3
        for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 09:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781196112; x=1781800912; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2rUavGM1P5RcCKJn/z9mz2Dyg9MS2Qfk4TLolVbqq+I=;
        b=Uclq3a5c5ISv8ARrbTUl6gC7qz8Qya7b0sAcmLp73XQ/uXdGk6ftcpqiMEl4Fyku70
         tb38sLHy5h8NshJfqlYU3ALe5kE5DlyCxqq8CEVBrqJHdm+/tXSbR3yFMvNsBwCFoZrl
         IjmNRm2HOuy2xrgrnzYMWgwVxfPJI65GYGXUt5T56yxEnNLVtqOW5p8HvGCBjwncn4yf
         3VJU0miz4XQ4BneZmj+BnLPx6YCJo9cbAw17ztqnOZkm1TP087V3CcNsp6QcwcN3ZoLY
         hJgGiiG5ANk7s+WSSgWSfQHzDp4pg4mPSVVOhoMvEvpcdi8jLWJrGjfOolwYrK/c4Fiu
         GeWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781196112; x=1781800912;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2rUavGM1P5RcCKJn/z9mz2Dyg9MS2Qfk4TLolVbqq+I=;
        b=eH0CR6lhYwk9m/4GCEPM6xrIlZPRDbGgWLL2aacR9tUnG1upbvWtbYv/Lc6QO6e6cc
         MEvY4Ys0WJROWWQC9W0JkpROxl0IfiL3YZFOsnXnGXQl10J89sJWGCG4kh9W0/la9vWh
         iRo2gBrWxOp9O0e15biDN3DvLV3JAbNqR/DRXpdjD5NQlOR/n1ywN4mulPTs84CpqNZL
         vtd0WDoRnsXyabviryEpmvXn9Bf6s4J8/6VfLBhSzQwXmpbLl7Mw2oCDeofASqls08Pj
         r6GhcHKM6zC3BctvDxjlnPBig1/dQ/rznFTJNpCduRDXXONTZh5fRFDsQJr0QtnruDiG
         TgNQ==
X-Forwarded-Encrypted: i=1; AFNElJ90kX9BwoOrJ7GxJL946q0WRc+Ob9OhYzzpY6w81Gs27RbgSfp6KvY00t0FLyOaUEZnQ2/b1b9QL8wJDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxscPI0dhmYnIYM2WGE2Ve1oubgyqlO83wT2N88FJL8tbwa01/
	v1zEVkl2Bafd+TWN7VD85pnmCvcnsqq/+PUWdGkfkXa4vuMJTRdF0xqb
X-Gm-Gg: Acq92OEeLKtmmGX7BfyE9MPAwgXZMi5sLqEWPtwjlM2pAWsyM323I/F5VmC5Ca+vpOv
	aebG9rm/HjMqLPReV7Npr9nCUbVvH0gn3Umtj1SHmloa4iP5eFxmUeg86L/0x/KuPpqEkFKXzEk
	5F/HCS9OHFw4BBxMehZPHIureFnUSTxxRGZyrJXGvZIA3xcIu5Nb2ZDExjcG2qpEaKw6w4heZr0
	xjNB2NdWamhFLJoAnyReN2vW06VlitbkbfijFurNvbkqIlnl73ycqHYwfoQ7V4gXNCCDiinbxO4
	qTiBYr7A39HyNwvHfJErrF6sLr82I/6bHgrCaxATSJ5MLV6pO+2yfxdrwbn3+aD8/OctP3xd6mx
	/LgaoEyATpXlnINUjeVq0Urp4WIvvvE3h68UbPuwU5qaKb8gvEzVf04131+C/iTSKmdyZ0eNkk1
	Xwnon8yDjMo2NNCj5hSLcVhUCQ6XWHx5RLve9a
X-Received: by 2002:a05:6a00:1144:b0:838:a46:ce96 with SMTP id d2e1a72fcca58-84336a9d4fdmr3914919b3a.27.1781196111707;
        Thu, 11 Jun 2026 09:41:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337661635sm3122661b3a.0.2026.06.11.09.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 09:41:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 11 Jun 2026 09:41:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Conor Dooley <conor@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3] hwmon: add a driver for the temp/voltage sensor on
 PolarFire SoC
Message-ID: <4a5f47d6-90ac-4365-b4ae-02d4ca4d31d4@roeck-us.net>
References: <20260611-blank-footprint-5504b819baec@spud>
 <20260611151316.685561F00893@smtp.kernel.org>
 <20260611-disaster-cadmium-91745bc1931d@spud>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-disaster-cadmium-91745bc1931d@spud>

On Thu, Jun 11, 2026 at 05:21:41PM +0100, Conor Dooley wrote:
> On Thu, Jun 11, 2026 at 03:13:16PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> > - [Medium] Negative values written to `update_interval` are incorrectly clamped to the maximum interval instead of returning an error or clamping to 0.
> > - [Medium] Reading `update_interval` inconsistently under-reports the configured value due to integer division truncation.
> > - [Medium] Hardware sensors are enabled in `probe` but are not disabled on probe failure or driver unbind.
> > --
> > 
> > commit 91a403f5c5eef9fbcfcab3857179dc2f03ad3c89
> > Author: Lars Randers <lranders@mail.dk>
> > 
> > hwmon: add a driver for the temp/voltage sensor on PolarFire SoC
> > 
> > Add a driver for the temperature and voltage sensors on PolarFire SoC.
> > The temperature reports how hot the die is, and the voltages are the
> > SoC's 1.05, 1.8 and 2.5 volt rails respectively.
> > 
> > > diff --git a/drivers/hwmon/tvs-mpfs.c b/drivers/hwmon/tvs-mpfs.c
> > > new file mode 100644
> > > index 0000000000000..48de8d98b3444
> > > --- /dev/null
> > > +++ b/drivers/hwmon/tvs-mpfs.c
> > 
> > [ ... ]
> > 
> > > +static int mpfs_tvs_interval_read(struct mpfs_tvs *data, u32 attr, long *val)
> > > +{
> > > +	u32 tmp;
> > > +
> > > +	if (attr != hwmon_chip_update_interval)
> > > +		return -EOPNOTSUPP;
> > > +
> > > +	regmap_read(data->regmap, MPFS_TVS_CTRL, &tmp);
> > > +	*val = FIELD_GET(MPFS_TVS_INTERVAL_MASK, tmp);
> > > +	*val *= MPFS_TVS_INTERVAL_SCALE;
> > > +	*val /= 1000;
> > 
> > [Severity: Medium]
> > Will this return an incorrectly truncated value for certain intervals?
> > 
> > Since integer division is used both here and in mpfs_tvs_interval_write(), 
> > the truncation can cause the readback value to be lower than what was written.
> > For example, writing 7 ms calculates `(7 * 1000) / 32 = 218`. Reading it back
> > computes `(218 * 32) / 1000 = 6` ms. 
> > 
> > Should DIV_ROUND_CLOSEST be used for these conversions to ensure the value
> > survives the round trip?
> 
> Hmm, this is actually a good point that I overlooked.
> What is the desired rounding behaviour here?
> IOW, should asking for 7 ms produce the closest interval less than 7 ms or
> the closest interval greater than 7 ms?
> 
> A consistent rounding is better than rounding to the closest IMO, if both
> update_interval and update_interval_us are going to be supported
> 

Not sure what you mean with "consistent rounding". Effectively the current
code is rounding down. I personally like using DIV_ROUND_CLOSEST() for both
read and write conversions because it gives the most accurate result. So
(7 * 1000) / 32 = 218.75 would result in 219 and (219 * 32) / 1000 = 7.008
would result in 7.

> > 
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int mpfs_tvs_interval_write(struct mpfs_tvs *data, u32 attr, long val)
> > > +{
> > > +	unsigned long temp = val;
> > > +
> > > +	if (attr != hwmon_chip_update_interval)
> > > +		return -EOPNOTSUPP;
> > > +
> > > +	temp = clamp(temp, 0U, MPFS_TVS_INTERVAL_MAX_MS);
> > 
> > [Severity: Medium]
> > Does this correctly handle negative input values?
> > 
> > The parameter `val` is signed, but it is assigned to `unsigned long temp`. If
> > a negative value is passed (e.g., -1), it undergoes an unsigned conversion and
> > becomes a large positive number like ULONG_MAX. 
> > 
> > When clamp() evaluates this against 8 ms, it incorrectly clamps to 8 instead of
> > returning -EINVAL or properly clamping to 0.
> 
> I can definitely clamp this without casting. I considered that inputting
> -1 to get the maximum was not really problematic given the documented
> range and that common sense doesn't permit negative times, but since I
> have to submit a v4 anyway, I'll just make this operate on the signed
> value.

Please do that. I don't think anyone would expect that writing -1
would result in programming the maximum.

Thanks,
Guenter
