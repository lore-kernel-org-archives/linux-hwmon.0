Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991A0134B6
	for <linux-hwmon@vger.kernel.org>; Tue, 23 Jul 2024 05:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721713034; cv=none; b=bdFeeVBKhojWaKAWbtqveFslKe+5CCwcO5T3ex8i9gEE2ecIiGKuu8qgNDjGKfnSzA5DZQnoDxv/xolkaEYAX9x8b+NHaH1GGqCwpe2QCJkp59Fnm7rKXYCvu4B/+qzo0EqhRSSSq924iujdhmnUlsu8LI5qNQ54cZQHfVo5Z48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721713034; c=relaxed/simple;
	bh=SbZMeYOgwHCHJo/JfX2o22XaAXQn7itO+Yt9PgCJx+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fPhw0FBp5AB8R3cz7105BgoiDXGfg8pFZjsyyuCtYkN8MGaFd0R113uSGoEsiGBYME8o6xIkHfj5tXzeq64qS5M+2of8kk5fXICv+wp8BjpeKHEVF25ws7/fc5XwUG50R8TF0duRlZW1E9IzeHzqvv/2OeRq3yZwTj3DFoAasAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KgZEWfAw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KgZEWfAw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A02EBC4AF0B;
	Tue, 23 Jul 2024 05:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721713034;
	bh=SbZMeYOgwHCHJo/JfX2o22XaAXQn7itO+Yt9PgCJx+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KgZEWfAwV+WrW8MF9aQY4hqOvGHfkz2XdmEW+P3A4HlczlS5WpYjJzrq8bJNj8lhN
	 YwIImf6MdvQf6sY8oHer/4RWnb9yjSqhveVIchhBPeyaLuEBLEbAXfB4MHpcRW66YA
	 hfKcOtsfBmd+k6os9xnJ/AWS57ojacgNpqQobeGlTgNzWpdOReWsiriysktwaM1xC6
	 XpORMq87XIkPA4WGba0h1g1NXYt++kVFy9QteJGzE38O00yBcJkTEjqsQh2DuZ+PAL
	 kOfBxbUX84Ht/BXu185Uv9+4anSaoIm1S5ylBDkGD/AOFaQ8dflL6gFAfkg0OZHows
	 AEaC1P0vwTfbA==
Date: Tue, 23 Jul 2024 05:37:11 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 2/6] hwmon: (max6697) Drop platform data support
Message-ID: <Zp9Bh4JgGJX3yhV6@google.com>
References: <20240723005204.1356501-1-linux@roeck-us.net>
 <20240723005204.1356501-3-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723005204.1356501-3-linux@roeck-us.net>

On Mon, Jul 22, 2024 at 05:52:00PM -0700, Guenter Roeck wrote:
> +static int max6697_config_of(struct max6697_data *data, struct i2c_client *client)
>  {
[...]
> -	pdata->smbus_timeout_disable =
> -		of_property_read_bool(node, "smbus-timeout-disable");
> -	pdata->extended_range_enable =
> -		of_property_read_bool(node, "extended-range-enable");
> -	pdata->beta_compensation =
> -		of_property_read_bool(node, "beta-compensation-enable");
> +	confreg = 0;
> +	if (of_property_read_bool(node, "smbus-timeout-disable") &&
> +	    (data->chip->valid_conf & MAX6697_CONF_TIMEOUT)) {

s/data->chip/chip/.

> +	if (data->type == max6581) {

Should be `data->type != max6581`.
