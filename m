Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8081DC05D;
	Mon,  6 Jan 2025 10:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736160772; cv=none; b=fh3MqKG/iHW8Ixjyw4Dd9TDkzPcrYJF1ZZPJaQmbG/k27InLVGqgEClCbHpWwmZgl13viADPCTl/jAkLvGPe9TkqbYAQcQ1U+DJ8GW800ubMzPlFX2TtwBeVLVWerewzTOwJ3brcO3bXuXsGrw3MuHjN0mmgAXkZw6ZC1nDH7JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736160772; c=relaxed/simple;
	bh=Q8Z1waplB19mCn1cuTl3dkKfZTG3BnJJmWsNjQ4Qku8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kMxC5GCZiOJrfUTP///o/wNe0YJA+8mmSZjqXNcQ5txW/CYxoUrPwhbrozudphChphW7nGQjThO2LjiPwf/2xOAluAnaG+8VCSGg2+H+MJcKICcTFoXN5ys+tffURmQ6piy2Z0LNus/237QDuE0Rcba4DR7D+Ws9JbjN3RkydV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MvMpPbiE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MvMpPbiE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A54DAC4CED2;
	Mon,  6 Jan 2025 10:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736160772;
	bh=Q8Z1waplB19mCn1cuTl3dkKfZTG3BnJJmWsNjQ4Qku8=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=MvMpPbiEX1tOXJPOqR9fjx0yh2R3COKzsAXfkGiaQKxQ/Cz2f4ZIUz2mY/3HihlaO
	 3ACKmGd2m8xFpMtQYOi5VOj7v24JEZfiutBIb8JNFRT8shN7cCcqDiw4lCSy1TWS7X
	 zSyuf8XJqL2beOF4vvnCPmYWiRQo0VWXt1ypePmLNJMP4buYyxUfi5GGEwBICvQtq/
	 wvrz33GsgMbLcmlOszHJlvOEY+a00M5Ub1/NETStEGDa10OeLG7BV06SjIF9XEU6i5
	 pm4JGeKweag3RDEnfmwPE5kTcqckxKFoePZHFu4DKHGVgvMps+MDW6Pz8uzLGN2/mt
	 BoZFUSQPhnGiQ==
Message-ID: <428c034c-79a2-4753-9af8-4dc5af7d310f@kernel.org>
Date: Mon, 6 Jan 2025 11:52:46 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: Add driver for TI INA233 Current and Power
 Monitor
To: Leo Yang <leo.yang.sy0@gmail.com>, jdelvare@suse.com, linux@roeck-us.net,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 Leo-Yang@quantatw.com, corbet@lwn.net, Delphine_CC_Chiu@Wiwynn.com,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20250106071337.3017926-1-Leo-Yang@quantatw.com>
 <20250106071337.3017926-3-Leo-Yang@quantatw.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250106071337.3017926-3-Leo-Yang@quantatw.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/01/2025 08:13, Leo Yang wrote:
> Support ina233 driver for Meta Yosemite V4.
> 
> Driver for Texas Instruments INA233 Current and Power Monitor
> With I2C-, SMBus-, and PMBus-Compatible Interface
> 
> According to the mail
> https://lore.kernel.org/all/
> 20230920054739.1561080-1-Delphine_CC_Chiu@wiwynn.com

Don't break the URLs. It makes them difficult to use.


> maintainer's suggested rewrite driver
> 



> +INA233 HARDWARE MONITOR DRIVER
> +M:	Leo Yang <Leo-Yang@quantatw.com>
> +M:	Leo Yang <leo.yang.sy0@gmail.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Odd Fixes
> +F:	Documentation/devicetree/bindings/hwmon/ina233.txt

There is no such file.


...

> +
> +struct pmbus_driver_info ina233_info = {

Why this cannot be const and static?

> +	.pages = 1,
> +	.format[PSC_VOLTAGE_IN] = direct,
> +	.format[PSC_VOLTAGE_OUT] = direct,
> +	.format[PSC_CURRENT_OUT] = direct,
> +	.format[PSC_POWER] = direct,
> +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_INPUT
> +		| PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
> +		| PMBUS_HAVE_POUT
> +		| PMBUS_HAVE_VMON | PMBUS_HAVE_STATUS_VMON,
> +	.m[PSC_VOLTAGE_IN] = 8,
> +	.R[PSC_VOLTAGE_IN] = 2,
> +	.m[PSC_VOLTAGE_OUT] = 8,
> +	.R[PSC_VOLTAGE_OUT] = 2,
> +	.read_word_data = ina233_read_word_data,
> +};
> +
> +static int ina233_probe(struct i2c_client *client)
> +{
> +	int ret, m, R;
> +	u32 rshunt;
> +	u16 current_lsb;
> +	u16 calibration;
> +
> +	/* If INA233 skips current/power, shunt-resistor and current-lsb aren't needed.	*/
> +
> +	/* read rshunt value (uOhm) */
> +	ret = of_property_read_u32(client->dev.of_node, "shunt-resistor", &rshunt);
> +	if (ret < 0 || !rshunt) {
> +		dev_err(&client->dev, "Unable to read shunt-resistor or value is 0, default value %d uOhm is used.\n",
> +			INA233_RSHUNT_DEFAULT);

Your binding said this is optional, so how this can be an error?

> +		rshunt = INA233_RSHUNT_DEFAULT;
> +	}
> +
> +	/* read current_lsb value (uA/bit) */
> +	ret = of_property_read_u16(client->dev.of_node, "current-lsb", &current_lsb);
> +	if (ret < 0 || !current_lsb) {
> +		dev_err(&client->dev, "Unable to read current_lsb or value is 0, default value %d uA/bit is used.\n",
> +			INA233_CURRENT_LSB_DEFAULT);

Same problem

> +		current_lsb = INA233_CURRENT_LSB_DEFAULT;
> +	}
> +
Best regards,
Krzysztof
