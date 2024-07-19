Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26012F30
	for <linux-hwmon@vger.kernel.org>; Fri, 19 Jul 2024 00:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721350371; cv=none; b=nZY0t+ddl7oODSoZ+JoeXAH+JsaviqnKOZA1fOIQFCAiW0f3Vy8JyFbFtKB99U6wm0eWHUK0qzyF89vz4y9q4U+xf3CobjcKiLpKSudPeRPaE9w41Zm9JKTKaevsH2gVHSF/FENtplEXNDHqpVPP9eRQhKIpnjfneR+xIrGeT0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721350371; c=relaxed/simple;
	bh=RjDRtXx5cqtHlxR/yl9PVef3iiTLVi9CCHWNPVMs4LE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dLRmqeXrduKDY4J4I8R0I5Mn0yF8tUql0KzoSNbUxBDpb4FYlz6RX6wTV5Lsb3WvkDoLko6mIBffMX6B2J5ww5ervHcX9vGFdjTSXd3nnswdpBncvuClIP32+rNm2r3rl7NT7rFWgpmvl1C41CiJbkXuL/fUf7I+SeNnwuKw41o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FBpDHM5o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FBpDHM5o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE2DAC116B1;
	Fri, 19 Jul 2024 00:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721350371;
	bh=RjDRtXx5cqtHlxR/yl9PVef3iiTLVi9CCHWNPVMs4LE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FBpDHM5ojpLh7MdDmCg6JqxgGYAnmo5bZOEifozdDFdCvCyuxOD61WzcGb0dCskLo
	 Zaud1RLcWb1Aby/mpmo34/nUFKT5Dyrhx0wcHxX+2k4u/+l8UzOunrGmf1K7QPABKV
	 i1WXOY5my8dTLjg28kYjewwAfqc5clN2RJPRffXZSISmJfS5fxqOCwYXQa1SeQl0H5
	 8bdWbmJHOLT7EyRdcTyo4D6H/H/9ylYHQE0hJt2NGtSF2OhIntFsvlCfYNeYg65XQY
	 /uQb1RszBQ9CVgp6z3UFlPf/6PJR5w3SvxJ1yscqodH7bMucjhNivU3lFloPoeL/rq
	 VFAUAsH085vQw==
Date: Fri, 19 Jul 2024 00:52:48 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 4/6] hwmon: (lm95234) Convert to with_info hwmon API
Message-ID: <Zpm44KVimCVZWhrq@google.com>
References: <20240718033935.205185-1-linux@roeck-us.net>
 <20240718033935.205185-5-linux@roeck-us.net>
 <ZplFeHMIKjHPiwTc@tzungbi-laptop>
 <89c18e08-3a98-4c33-bca4-ea5acba9f6f2@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89c18e08-3a98-4c33-bca4-ea5acba9f6f2@roeck-us.net>

On Thu, Jul 18, 2024 at 10:47:55AM -0700, Guenter Roeck wrote:
> On 7/18/24 09:40, Tzung-Bi Shih wrote:
> > On Wed, Jul 17, 2024 at 08:39:33PM -0700, Guenter Roeck wrote:
> > > +static int lm95234_temp_write(struct device *dev, u32 attr, int channel, long val)
> > >   {
> > [...]
> > > +	case hwmon_temp_max:
> > > +		val = clamp_val(val, 0, channel ? 255000 : 127000);
> > 
> > Perhaps I am misunderstanding, but this looks weird to me.  By applying
> > the patch, the maximum values are:
> > 
> > static SENSOR_DEVICE_ATTR_RW(temp1_max, tcrit1, 0); -> 127000
> > static SENSOR_DEVICE_ATTR_RW(temp2_max, tcrit2, 0); -> 255000
> > static SENSOR_DEVICE_ATTR_RW(temp3_max, tcrit2, 1); -> 255000
> > static SENSOR_DEVICE_ATTR_RW(temp4_max, tcrit1, 3); -> 255000
> > static SENSOR_DEVICE_ATTR_RW(temp5_max, tcrit1, 4); -> 255000
> > 
> > 
> > However, it was originally:
> > 
> > static ssize_t tcrit1_store(struct device *dev, struct device_attribute *attr,
> > 	        const char *buf, size_t count)
> > {
> > [...]
> >      val = DIV_ROUND_CLOSEST(clamp_val(val, 0, 255000), 1000);
> > 
> > static ssize_t tcrit2_store(struct device *dev, struct device_attribute *attr,
> > 	        const char *buf, size_t count)
> > {
> > [...]
> >      val = DIV_ROUND_CLOSEST(clamp_val(val, 0, (index ? 255 : 127) * 1000),
> > 		    1000);
> > 
> > static SENSOR_DEVICE_ATTR_RW(temp1_max, tcrit1, 0); -> 255000
> > static SENSOR_DEVICE_ATTR_RW(temp2_max, tcrit2, 0); -> 127000
> > static SENSOR_DEVICE_ATTR_RW(temp3_max, tcrit2, 1); -> 255000
> > static SENSOR_DEVICE_ATTR_RW(temp4_max, tcrit1, 3); -> 255000
> > static SENSOR_DEVICE_ATTR_RW(temp5_max, tcrit1, 4); -> 255000
> > 
> > > +		val = DIV_ROUND_CLOSEST(val, 1000);
> > > +		return regmap_write(regmap, lm95234_crit_reg(channel), val);
> > 
> 
> That is indeed a bug. Here is the fix:
> 
> diff --git a/drivers/hwmon/lm95234.c b/drivers/hwmon/lm95234.c
> index c3c68c196479..7da6c8f07332 100644
> --- a/drivers/hwmon/lm95234.c
> +++ b/drivers/hwmon/lm95234.c
> @@ -150,7 +150,7 @@ static int lm95234_temp_write(struct device *dev, u32 attr, int channel, long va
>                 val = DIV_ROUND_CLOSEST(clamp_val(val, -64000, 63500), 500);
>                 return regmap_write(regmap, LM95234_REG_OFFSET(channel - 1), val);
>         case hwmon_temp_max:
> -               val = clamp_val(val, 0, channel ? 255000 : 127000);
> +               val = clamp_val(val, 0, channel == 1 ? 127000 : 255000);
>                 val = DIV_ROUND_CLOSEST(val, 1000);
>                 return regmap_write(regmap, lm95234_crit_reg(channel), val);
>         case hwmon_temp_max_hyst:

With that,
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
