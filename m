Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87801B86E7
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Jul 2024 04:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722140768; cv=none; b=BjFzWNz5Q2n6JoIztNA+P96seMWCFMt2H6GdFlRVKt4ADdiaokrMfP7P6deB3AEXu/n5uq9YdQ+v/xy6nfkTmzoHJqc/SeehAM5UJ1oYJVo4mlA5lLdBIkaC1Vad7YIz+V9o9cTAGRLOt/mhToDGxONRQOS+iN8MJpe0o10S0Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722140768; c=relaxed/simple;
	bh=2JXmL3g3Uo3vfwE7SvbwrjX2iMf/Le6vxedmCMou2k8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VMB5k2dH08HBmJH/6++H+pXP5yqYjiBnf2qUVwZULiNc1ZITIRrAbQQ270lKV8eN84rpmk7kCz1W1ittrMS7+R/e/BtABvzsxCJs7dWb1gMpyAjOVSGt/4GKI0qs4EXnCERdBEDg0ioPOx94+bSXLEllIzPsIvVt5AyLYDaYrck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LQfpi8YH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LQfpi8YH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA935C116B1;
	Sun, 28 Jul 2024 04:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722140768;
	bh=2JXmL3g3Uo3vfwE7SvbwrjX2iMf/Le6vxedmCMou2k8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LQfpi8YHl4/C554EK4Axyk/5ncMyw27HGv6RnM4gGmpLDblIR/GIkvjoxgoTBrVuq
	 z4QcthxYrE6GiKzOPhhGSAX7VoPuojUtOuTUrZjd/a05hh5bXbCpk+kbMuOkshb8gA
	 a/ni8447Jui29nqPoi9Ox6bIPG34jld32QepJV62ySGeart8dQKOVVSW7XDV7oHI7a
	 bl3Knw0pr9KFzvcY4kgHqI8TR2KP8EEOjjOIm4Wj0zhfsnp13dKIM8RTrJKar/HiQY
	 6EzwN395ukKJ75DR+gr25ro0dJ/u+Qo0JD+BEO17etfwp/0nr/rYaT0s0pmFUy9nb4
	 DdBkaVfeo2OyA==
Date: Sun, 28 Jul 2024 12:26:05 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 3/6] hwmon: (max1619) Convert to use regmap
Message-ID: <ZqXIXfsOQ-39VMsy@tzungbi-laptop>
References: <20240727143820.1358225-1-linux@roeck-us.net>
 <20240727143820.1358225-4-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240727143820.1358225-4-linux@roeck-us.net>

On Sat, Jul 27, 2024 at 07:38:17AM -0700, Guenter Roeck wrote:
> +static int get_alarms(struct regmap *regmap)
> +{
> +	static u32 regs[2] = { MAX1619_REG_STATUS, MAX1619_REG_CONFIG };
> +	u8 regdata[2];
> +	int ret;
> +
> +	ret = regmap_multi_reg_read(regmap, regs, regdata, 2);
> +	if (ret)
> +		return ret;
> +
> +	/* OVERT status bit may be reversed */
> +	if (!(regdata[1] & 0x20))
> +		regdata[0] ^= 0x02;
> +
> +	return regdata[0] & 0x1e;

Why `& 0x1e`?  Original max1619_update_device() doesn't do that.

> -static void max1619_init_client(struct i2c_client *client)
> -{
> -	u8 config;
> +/* regmap */
>  
> -	/*
> -	 * Start the conversions.
> -	 */
> -	i2c_smbus_write_byte_data(client, MAX1619_REG_W_CONVRATE,
> -				  5); /* 2 Hz */
> -	config = i2c_smbus_read_byte_data(client, MAX1619_REG_R_CONFIG);
> -	if (config & 0x40)
> -		i2c_smbus_write_byte_data(client, MAX1619_REG_W_CONFIG,
> -					  config & 0xBF); /* run */

Doesn't it need the initialization anymore?
