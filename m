Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32DF1B86D6
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jul 2024 02:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722219495; cv=none; b=YD1KC3DPpdUm/ddLbgs5DHT/xqZCWS/9isXJONbAdiiZ1Xv5gqgPH46pnfFGxFoXuYj4CmX+TICE/EF03R2ar1rfRdtHUu9kYitL6If9iEZHG6WRFCiqlvOFsiAybIZaolMy0mWvbOWbGVZDlRQ2KjngAd0WCHnwB4+u70/PK3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722219495; c=relaxed/simple;
	bh=Ij8FxDsraMzUJbLoFx7ctEqtD0l2KkcNZ8hWlV3J8DQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o9hlOasPAZkRYinInB49zt9F3dm6iqrhm+lX/DJCAu1ojdGXPrAXgVkGRW1FH+wjZgqNI8YWRarG2YkkiuzjU2Tju4HzZYDKSBtLifYBoyUj9A4BTNeECvdZTzf5e1mGuegkI9CNacZmsz04GeBg1DhYEEKN5tj/8AodpoAXEDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gP6pZEWU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gP6pZEWU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A733C116B1;
	Mon, 29 Jul 2024 02:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722219495;
	bh=Ij8FxDsraMzUJbLoFx7ctEqtD0l2KkcNZ8hWlV3J8DQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gP6pZEWUWaSTmDZf849qNYVM6hTQTlfW0X/Ts9IkV/RqNlSj9BunFPcpUJkxrE73b
	 R+3xvNFDl4A9rex3wi+qeurGv3ZcJe2TDzMyeKqqEoYtX9Dha4ytwvlwz4CLJGhUEE
	 cIrF0+l/8+p77ZYHOI+HUjv5F2zTrLSBubx2BCx/ZX7dLxLWEsSd3+mvNFRZh9fGLA
	 mBDrrXdA8EBtwbbRtLVchWzwZNEomd3V2N/EQScVP69YdZZW3rWZ21WTC6chFlJmar
	 Tztomo5FyMN0c6RIXZmRiZ3CC8a6LNuGfpOuXB9M1DXA/gPIaNempDBzK3AmXUH6D/
	 wM28xpomwXZ7A==
Date: Mon, 29 Jul 2024 02:18:13 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v2 4/7] hwmon: (max1619) Convert to use regmap
Message-ID: <Zqb75Ue3NjENz8g0@google.com>
References: <20240728143715.1585816-1-linux@roeck-us.net>
 <20240728143715.1585816-5-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240728143715.1585816-5-linux@roeck-us.net>

On Sun, Jul 28, 2024 at 07:37:12AM -0700, Guenter Roeck wrote:
> -static void max1619_init_client(struct i2c_client *client)
> +static int max1619_init_chip(struct regmap *regmap)
>  {
> -	u8 config;
> +	int ret;
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
> +	ret = regmap_write(regmap, MAX1619_REG_CONVRATE, 5);	/* 2 Hz */
> +	if (ret)
> +		return ret;
> +
> +	/* Start conversions */
> +	return regmap_set_bits(regmap, MAX1619_REG_CONFIG, 0x40);

Should be regmap_clear_bits()?
