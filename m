Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D2516FF2A
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Aug 2024 12:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725021017; cv=none; b=CIr9f60k73oMZc779Kq6vgDC4E6XObR9Pzafazi0jt67NynzmEFSD94vMBuh0qNYNsc1ukVxpzR/tHon+YE0rDCIVOTkzp6RqwGaOtO/dHe8ZfUW9hTttYvLpy28N9ii9zUshQG1iySnJvtjBOF4jCq6bdyoEteyBWPR3rXeAxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725021017; c=relaxed/simple;
	bh=xt0KMiDBHmM2ou286/QqKkVWnZtC3DIJBIRnqeX1T5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQjHVF5h6qWakySnxy30lcjdHObtrUwpAYAt7Khj6X77WElZvEvNgVj51ttgrMEua+4g+BZaI6dbt1LKR3AoOLHd1VM/RU5Mps0/ZSQvB5wy0pTFjP/ue0ZJfKgVTrqjDjruB0YgnkMrlB5NFoLwg+7KHiPUKcCAYOvB3AptcR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kDwlUcBl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kDwlUcBl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ACF1C4CEC2;
	Fri, 30 Aug 2024 12:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725021016;
	bh=xt0KMiDBHmM2ou286/QqKkVWnZtC3DIJBIRnqeX1T5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kDwlUcBlLSQ1a7stoXGDw9y4GMFKNYproaYX2nxyUuwdjx/+XEFZ4J5yUSpbjTKFE
	 zYp7ry9dIqsxDXgLm7pnxMTj07jWKp2EZRQ80GlbPT3z+fNIBTaATXaRW7daEeaUTO
	 QrML/cE361bcRvHCkWJ7MzUEEpQlEf0dJofhySHyvMjHliKaGE+GYVxwbtcGgw2Ilk
	 brhDWRFlLxA9xDk4m8sF2OkNQLZC1a+k23VWykc3bEn7OEopWyq2eOZL3Kk++tlTo+
	 LSaDykl8HZD1JluOorx34/PA7c/UGjEF+pmIpyVq80dqU2rWI3Mm8rK0zbTxmxv6jW
	 97ZCneF7xPhGg==
Date: Fri, 30 Aug 2024 20:30:13 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v2 11/14] hwmon: (ina2xx) Convert to use with_info hwmon
 API
Message-ID: <ZtG7VaILKoZUHTkC@tzungbi-laptop>
References: <20240830010554.1462861-1-linux@roeck-us.net>
 <20240830010554.1462861-12-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830010554.1462861-12-linux@roeck-us.net>

On Thu, Aug 29, 2024 at 06:05:51PM -0700, Guenter Roeck wrote:
> +static int ina2xx_chip_read(struct device *dev, u32 attr, long *val)
>  {
> -	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
>  	struct ina2xx_data *data = dev_get_drvdata(dev);
> -	unsigned int mask;
> -	int alarm = 0;
> +	u32 regval;
>  	int ret;
>  
> -	ret = regmap_read_bypassed(data->regmap, INA226_MASK_ENABLE, &mask);
> +	switch (attr) {
> +	case hwmon_chip_update_interval:
> +		ret = regmap_read(data->regmap, INA2XX_CONFIG, &regval);
> +		if (ret)
> +			return ret;
> +
> +		*val = ina226_reg_to_interval(regval);
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +	return 0;

......(1)

> +static int ina2xx_power_read(struct device *dev, u32 attr, long *val)
> +{
> +	struct ina2xx_data *data = dev_get_drvdata(dev);
> +
> +	switch (attr) {
> +	case hwmon_power_input:
> +		return ina2xx_read_init(dev, INA2XX_POWER, val);
> +	case hwmon_power_crit:
> +		return ina226_alert_limit_read(data, INA226_POWER_OVER_LIMIT_MASK,
> +					       INA2XX_POWER, val);
> +	case hwmon_power_crit_alarm:
> +		return ina226_alert_read(data->regmap, INA226_POWER_OVER_LIMIT_MASK, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}

......(2)

Just noticed a nit: there are some *_read() and *_write() functions mainly
contain a switch-case block.  Some of them returns 0 at the end of the function
(1); some of them don't (2).  (1) should be unreachable, however, I'm not sure
whether some checkers might complain about case (2).

In either cases, it would be great if make them consistent.

With that,
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
