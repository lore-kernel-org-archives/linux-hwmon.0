Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70E61B1405
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 14:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724943323; cv=none; b=RZm8LQQBVHU52tj7PwNGBgrHNycl+Btc6UpRj1X6JO2WlR69ERLIb+jjnHN4S5/4L93PFmzrZQg8xE4uZZtC0pN78M1FXs0wBn9orACpAYl5qt2JUdn/PMYJm+MfHgE0lfCnjckdXeCBSJol8sVqIkhuFegaDrVA2BhZB8gI6pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724943323; c=relaxed/simple;
	bh=W96gCz+dKtW0V52Ns/gWn6Iuq18vyRMFdZ3iy/xIbKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rWBkcDm/azm5CaUQNmFlJ6RP7O+ul1ZGFG8v1SDX+oFwC5iWpcp8/D9XAROei6K6GHUzSE8yEQ61aG28g/RWCBNd2iu4P5tKfqHTVqO0Xja4sl52IVy/nI7XWEOdJS8D9O+LierFiaKlrL3FMsNqQU4uOznJkplb3WjZEWJNN84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RuYNpG9N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RuYNpG9N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1FB7C4CEC7;
	Thu, 29 Aug 2024 14:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724943323;
	bh=W96gCz+dKtW0V52Ns/gWn6Iuq18vyRMFdZ3iy/xIbKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RuYNpG9NzOo4bqFoM02WlF39vvOm1eJfJYaO4eGccMXXyZDyxnCSzliRh0/y3rFb1
	 fXxjevOdkslZuFJ6AN45TNxG6JCOQZUbBd82wq5mKT2zHXEzowiqsKZ2GESIn7x8be
	 oPoZcHK5Z1fiTjE1GuyPZbZYO6gu0xmx06LxgsPxsBmwj93vUiJ2jmi2LY8grRdhdY
	 IPGDYu8qVltILQKkijF/cTtzRC+qyFFD2x1gkN8KVSgPuaSDdEXwpSuOTrsuX0tGoC
	 5TEqvSNMjLTCGBKlNHkfKBD9wO4ff8sOHZ6kyaarZXqWmGyClHXL45k+rrUeDiPaVR
	 C+ElP817vqEaQ==
Date: Thu, 29 Aug 2024 22:55:20 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 09/11] hwmon: (ina2xx) Consolidate chip initialization
 code
Message-ID: <ZtCL2DaoC-Am1F2e@tzungbi-laptop>
References: <20240827153455.1344529-1-linux@roeck-us.net>
 <20240827153455.1344529-10-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827153455.1344529-10-linux@roeck-us.net>

On Tue, Aug 27, 2024 at 08:34:53AM -0700, Guenter Roeck wrote:
> +static int ina2xx_init(struct device *dev, struct ina2xx_data *data)
> +{
> +	u16 config = data->config->config_default;
> +	struct regmap *regmap = data->regmap;
> +	u32 shunt;
> +	int ret;
[...]
> +	if (data->chip == ina226 &&
> +	    device_property_read_bool(dev, "ti,alert-polarity-active-high"))
> +		config |= INA226_ALERT_POLARITY;

This looks wrong to me.  The polarity setting should be in INA226_MASK_ENABLE
instead of INA2XX_CONFIG.

> +
> +	ret = regmap_write(regmap, INA2XX_CONFIG, config);
> +	if (ret < 0)
> +		return ret;
> +
