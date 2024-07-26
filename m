Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE079157A5B
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Jul 2024 15:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722007244; cv=none; b=IUAZn2DGb4rmq5K7jQL5pgFYSdlja66WDuUaKVEJYBRqLWEoVNOjNRJZbgxt+jfdjGJSISIHzIrMEgBm67gha3cFgEmj8qVi2rWZBWl+oEn3JfsyvZNozBi4/a/vi95H5/0PtUd8uhU8VOc8AxWflCeuuVlN3NoxxwobT3hJKz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722007244; c=relaxed/simple;
	bh=AS/cJk0p6U7LNwBAXCkUbWWlpAYgWUxELZU+jikPRqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OvNRSM06GjyyNmVwWModBOtjKiyufT5gHCD71Ceke+kQAGwg3TDbaRjWC5a8u73jJv1MIvyEUe5yD9XczVdkI1JgZ4zraDq0YTQu8x5FyuL0d75lTUl4IcYAzgL8sWCk5Em/1dlD7Z12VdAp/Zano/5ZiZa+edHbtewgrDAHZEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cbZNyfPs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cbZNyfPs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99CADC32782;
	Fri, 26 Jul 2024 15:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722007244;
	bh=AS/cJk0p6U7LNwBAXCkUbWWlpAYgWUxELZU+jikPRqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cbZNyfPsuR/VU53BG1ozwWolLQAQi+yh2zx1Pek+JQ/gDEc5Z337I7A406giKDdTS
	 W11ppwjrD9R3RYN8qn+WJAtSPv1n0lJ8AGOPMdRq5SxYtkf3qgysmySrwn9tXb9IPw
	 UY/+TPTRTYN+tgL3ZfBpF2FgKSsh3mtr9tX88wL8IXfdgEpn2WCybXjangtPFb5Sks
	 C61fqKVfwPPA5CNfReeblXHeKsLzR4jj0ly43ZbamSUg42KYYUfgIUOYVZ71dwSkMJ
	 EpNY+9MM+4GYoeTc9iu/rJcdJsmcDABydu1jdWwxo9NYUaRgCr8KXu6bTCit2uoKpm
	 9OoTAeoIGzX/Q==
Date: Fri, 26 Jul 2024 23:20:40 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 3/5] hwmon: (max1668) Convert to use regmap
Message-ID: <ZqO-yJMSvXXZFKm1@tzungbi-laptop>
References: <20240726004329.934763-1-linux@roeck-us.net>
 <20240726004329.934763-4-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726004329.934763-4-linux@roeck-us.net>

On Thu, Jul 25, 2024 at 05:43:27PM -0700, Guenter Roeck wrote:
> @@ -15,6 +16,7 @@
>  #include <linux/jiffies.h>

Should be able to drop.

>  #include <linux/module.h>
>  #include <linux/mutex.h>

Should be able to drop too.

>  static ssize_t show_fault(struct device *dev,
>  			  struct device_attribute *devattr, char *buf)
>  {
>  	int index = to_sensor_dev_attr(devattr)->index;
> -	struct max1668_data *data = max1668_update_device(dev);
> +	struct max1668_data *data = dev_get_drvdata(dev);
> +	struct regmap *regmap = data->regmap;
> +	u32 alarm, temp;
> +	int ret;
>  
> -	if (IS_ERR(data))
> -		return PTR_ERR(data);
> +	ret = regmap_read(regmap, MAX1668_REG_STAT1, &alarm);
> +	if (ret)
> +		return ret;
>  
> -	return sprintf(buf, "%u\n",
> -		       (data->alarms & BIT(12)) && data->temp[index] == 127);
> +	ret = regmap_read(regmap, MAX1668_REG_TEMP(index), &temp);
> +	if (ret)
> +		return ret;
> +
> +	return sprintf(buf, "%u\n", (alarm & BIT(12)) && temp == 127);

Should be BIT(12 & 7).
