Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345511E519
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jul 2024 03:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722223443; cv=none; b=BexMxNfwT2zlCgzPCn6wu91kmwmfivLsbY+xAW7DL88V3MK1a3QxSE8RpD/W5Nxkh5INCZjb2qp/nqPRD595XhAQXFTPJSFZrHoErh/9mnv6DYMi3asMH3nnMfnySWsvF1s/qxgOUupzQRjwpTe2nEl8/6A+KATG3xZ0m/Fbhpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722223443; c=relaxed/simple;
	bh=hMsl1Ih20ugtCIMhCPoqjCOBA5cbx4DCFM/cAjDatmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Um+rOyQecF6SQ8sj3Z7Igd8sMB65MQ/jGcmHduOwDeFig32E/6f66+GGBlx6cy/z1QasM+jdoJf7SF4mmAg7vLgY0nsGUSv7hJSNbYuqzfffb/rjR2ZzinzDgRm6XIBx2F76mCXlOpAvphrwG8+PcEPk0V4Lzx6JELh2fJeuYE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ncEuXOUb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ncEuXOUb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31DF4C32786;
	Mon, 29 Jul 2024 03:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722223442;
	bh=hMsl1Ih20ugtCIMhCPoqjCOBA5cbx4DCFM/cAjDatmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ncEuXOUbtAWi1uiHBehcSHYmcWV/entp/rQ7GXAd/ux8q/Z5keu8pqfLTVhwYNjX6
	 quQv1J8U6p6yJz8ZiVLwmVKBq1WFbrQn1Y3qkD4JKnRXJqZyZcNmNQdSNSf87LZZiT
	 bpsyZDdPumR8hdRl7emR3YMQt5MV1+mwrmz/qJaYGuraRXPJWUCY6szHiIWswdCReL
	 BCf+3rwd8v3TFmzOPp4a4TOLnp6c+oOhzodhhRGaWxPDM/sYUFaVJ4zviFrTEdk9dn
	 uVIQIFFlFbqhsqdMyum+7IsF20DVQPaB6omaoXLR3VOemaqaxRJj6JbJBIyZqZuor1
	 AguPbJCDax1xw==
Date: Mon, 29 Jul 2024 03:24:00 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v2 4/7] hwmon: (max1619) Convert to use regmap
Message-ID: <ZqcLUDCtxKPs-sRN@google.com>
References: <20240728143715.1585816-1-linux@roeck-us.net>
 <20240728143715.1585816-5-linux@roeck-us.net>
 <Zqb75Ue3NjENz8g0@google.com>
 <ea599334-5916-4d03-a662-a0d02d1296bc@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea599334-5916-4d03-a662-a0d02d1296bc@roeck-us.net>

On Sun, Jul 28, 2024 at 08:16:35PM -0700, Guenter Roeck wrote:
> On 7/28/24 19:18, Tzung-Bi Shih wrote:
> > On Sun, Jul 28, 2024 at 07:37:12AM -0700, Guenter Roeck wrote:
> > > -static void max1619_init_client(struct i2c_client *client)
> > > +static int max1619_init_chip(struct regmap *regmap)
> > >   {
> > > -	u8 config;
> > > +	int ret;
> > > -	/*
> > > -	 * Start the conversions.
> > > -	 */
> > > -	i2c_smbus_write_byte_data(client, MAX1619_REG_W_CONVRATE,
> > > -				  5); /* 2 Hz */
> > > -	config = i2c_smbus_read_byte_data(client, MAX1619_REG_R_CONFIG);
> > > -	if (config & 0x40)
> > > -		i2c_smbus_write_byte_data(client, MAX1619_REG_W_CONFIG,
> > > -					  config & 0xBF); /* run */
> > > +	ret = regmap_write(regmap, MAX1619_REG_CONVRATE, 5);	/* 2 Hz */
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/* Start conversions */
> > > +	return regmap_set_bits(regmap, MAX1619_REG_CONFIG, 0x40);
> > 
> > Should be regmap_clear_bits()?
> 
> 
> Sigh. yes, of course.

With that,
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
