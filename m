Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E336B1B1414
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 14:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724943347; cv=none; b=mrePQq+Xb7thx5ErPfYSn3UgufVrnzWvaX9abIEcGE/kcdb4MtwRGuDHAqAY+5luEy5c/HRO3eNTBpvgtKvv3/Kjz8dZkNSym4/0QGIGptAqPOqMqaJSapyJvm2bTw0KE8I9PEQeQJWkp6YXM8Lc+vWu0YG4Qu2WVGoOfxBVvPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724943347; c=relaxed/simple;
	bh=CAQXdo6B9CPJ8DOtYGscRwphFt4ZqrB1Q5KJ92REh38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fa3r/Adwd6D7JIAC5xX5DjKMW7mmEo2DIk0TU1tJFNyDephZ8C4go+WhwztIx0KmbndJC8pcMNpZ4+wsfhM5jkpm8IXx11w2RhustmA/qHHAzrx7in360TKuGft/ok2dIMtwN8KNdgeQRFV99uGKI+W8qIOgaFFWLu5z25eQY1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=In9WIrTn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="In9WIrTn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2E90C4CEC3;
	Thu, 29 Aug 2024 14:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724943346;
	bh=CAQXdo6B9CPJ8DOtYGscRwphFt4ZqrB1Q5KJ92REh38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=In9WIrTntxBsma4/y8pEOVSi0XX8RmkmNrkG6KD1xhCVu+hw+rjyRysKaXi1ybHP+
	 bDJfYkZmytHtMIpfeopSHB35zbkSpNLj/NJGivDvGXs5Qu0/CajGJnTUKYKCrK0nSB
	 F7xtQ0jhAGdgVZK6wjCDIRUeP8zKUuCFDb3vIpXSmDA32YlSwsNMNa/7+cKZP7x+mj
	 rjtgTKoPJgJTYCZIhCytaZvEpPQbai2wi7D4Q0g3bkoeuxfxQkeyXi1P7Z3WKgIsyB
	 tOFi9FJiyrWYyaW5WuoxyRySS7dyTsKhh8lJxlwwIHM+1/+XbTKm9/FQZ0pNG6dPx8
	 CC1XtJImJeTXg==
Date: Thu, 29 Aug 2024 22:55:43 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 11/11] hwmon: (ina2xx) Convert to use with_info hwmon API
Message-ID: <ZtCL74Hra1pYFuR2@tzungbi-laptop>
References: <20240827153455.1344529-1-linux@roeck-us.net>
 <20240827153455.1344529-12-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827153455.1344529-12-linux@roeck-us.net>

On Tue, Aug 27, 2024 at 08:34:55AM -0700, Guenter Roeck wrote:
> +static int ina2xx_in_read(struct device *dev, u32 attr, int channel, long *val)
> +{
> +	int voltage_reg = channel ? INA2XX_BUS_VOLTAGE : INA2XX_SHUNT_VOLTAGE;
> +	u32 under_voltage_mask = channel ? INA226_BUS_UNDER_VOLTAGE_MASK
> +					 : INA226_SHUNT_UNDER_VOLTAGE_MASK;
> +	u32 over_voltage_mask = channel ? INA226_BUS_OVER_VOLTAGE_MASK
> +					: INA226_SHUNT_OVER_VOLTAGE_MASK;
> +	struct ina2xx_data *data = dev_get_drvdata(dev);
> +	struct regmap *regmap = data->regmap;
> +	unsigned int regval;
> +	int ret;
> +
> +	switch (attr) {
> +	case hwmon_in_input:
> +		ret = regmap_read(regmap, voltage_reg, &regval);
> +		if (ret)
> +			return ret;
> +		*val = ina2xx_get_value(data, voltage_reg, regval);

Doesn't it need to call ina2xx_read_init() too?  Originally, [1][2] call
ina2xx_value_show() and then ina2xx_read_reg() and detect if the chip has
been reset.

[1]: https://elixir.bootlin.com/linux/v6.10/source/drivers/hwmon/ina2xx.c#L542
[2]: https://elixir.bootlin.com/linux/v6.10/source/drivers/hwmon/ina2xx.c#L554
