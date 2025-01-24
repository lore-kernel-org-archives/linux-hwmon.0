Received: from smtp.smtpout.orange.fr (smtp-70.smtpout.orange.fr [80.12.242.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2BE204F77;
	Fri, 24 Jan 2025 08:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737706235; cv=none; b=TpFVG2gbQa1wj/659BsgU0fjUeVSNFLRScOXmSTqJM7ilhJs0MQUpX0Kc4RTAohLaP19U7YwQgg+6VJo/9W9S75UQdEUnBy6sdnq0m4qc4VhstqjzHkxfofsTjfzQp0XcJXPpbD2gj7L3lYZwANPX0Q6wf8xrSbNxoLEf6UCLdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737706235; c=relaxed/simple;
	bh=U+Ke4NzHrOwQl7GCmSVq2/1h7x3FJmPEhyLfmXWO4ws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hpTL9UfnuQ4tWWjJsiJ9agfTso1bVRYA/ez4QBAI7vE8R1kBrjpB3D48Le/81M4+NHxxDNkN4r2hPNOkV+rlbyvcEtIxQRCv72bl9xDhwtAGqWBt0ez/ZWe9F0/L9ax7V8AtxjcRo6dh5NA/h/2pFHZGY6EMvy77oeWItpvomTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=OaFfjg6x; arc=none smtp.client-ip=80.12.242.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="OaFfjg6x"
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id bEkdtpXlrix9LbEkgtmg6v; Fri, 24 Jan 2025 09:09:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1737706159;
	bh=qVjoxrPA3pXlplvDqf3JkiUXAD00q2kACFLq5psiNvM=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=OaFfjg6xaUCbYk1mFck/dtH6AC01fUAySRr46p+Nn2OmRLk3W1ePrCTzTtZOwTgxI
	 bVddpKOmTD4et6cDPyzC4pH6L+wT3I06DTq71JLjQ/7k92W2CNmpTjCrZn/erzgD0S
	 ECYVftkCjdy1dNRTqJTi/QM9duuvIkJDbFU/hd8hp3t762KnLQS1pkbtvm/WDeexKh
	 P6k/yViSwfzB7UwUMhnPMIoYapewo64T9GUGVFWw2oNjScUlqRQEalNv81IKn4/OJT
	 Nbo9zhyHA1pw4yFsxtuwCO/JqWzZl5ERTn+Zfgu3OdjyfzgGPjr8hq20h/SJ3/lVJL
	 mViPxuswfnjqQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 24 Jan 2025 09:09:19 +0100
X-ME-IP: 90.11.132.44
Message-ID: <5f4095b0-8105-4001-81ac-e4f7053e45ae@wanadoo.fr>
Date: Fri, 24 Jan 2025 09:09:14 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] hwmon:(ina238)Add support for SQ52206
To: Wenliang Yan <wenliang202407@163.com>, linux@roeck-us.net,
 Jean Delvare <jdelvare@suse.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250117082017.688212-1-wenliang202407@163.com>
 <20250117082017.688212-3-wenliang202407@163.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250117082017.688212-3-wenliang202407@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 17/01/2025 à 09:20, Wenliang Yan a écrit :
> Add support for SQ52206 to the Ina238 driver. Add registers,
> add calculation formulas, increase compatibility, add
> compatibility programs for multiple chips.
> 
> Signed-off-by: Wenliang Yan <wenliang202407@163.com>
> ---

Hi,

a few nitpick below, should a v4 be needed.

...

> +static ssize_t energy1_input_show(struct device *dev,
> +				  struct device_attribute *da, char *buf)
> +{
> +	struct ina238_data *data = dev_get_drvdata(dev);
> +	int ret;
> +	u64 val;
> +
> +	ret = ina238_read_reg40(data->client, SQ52206_ENERGY, &val);
> +	if (ret)
> +		return ret;
> +
> +	/* result in microJoule */
> +	val = div_u64(val * 96 * INA238_FIXED_SHUNT * data->gain,
> +			       data->rshunt * 100);
> +
> +	return sprintf(buf, "%llu\n", val);

Maybe sysfs_emit()?

> +}
> +
>   static int ina238_read(struct device *dev, enum hwmon_sensor_types type,
>   		       u32 attr, int channel, long *val)
>   {

...

> @@ -530,6 +640,15 @@ static const struct hwmon_chip_info ina238_chip_info = {
>   	.info = ina238_info,
>   };
>   
> +/* energy attributes are 5bytes wide so we need u64 */

Missing space or done intentionally? (5 bytes)

> +static DEVICE_ATTR_RO(energy1_input);
> +
> +static struct attribute *ina238_attrs[] = {
> +	&dev_attr_energy1_input.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(ina238);
> +
>   static int ina238_probe(struct i2c_client *client)
>   {
>   	struct ina2xx_platform_data *pdata = dev_get_platdata(&client->dev);
> @@ -537,13 +656,19 @@ static int ina238_probe(struct i2c_client *client)
>   	struct device *hwmon_dev;
>   	struct ina238_data *data;
>   	int config;
> +	enum ina238_ids chip;

Maybe move 1 line up, to keep RCT style?

>   	int ret;
>   
> +	chip = (uintptr_t)i2c_get_match_data(client);
> +
>   	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>   	if (!data)
>   		return -ENOMEM;

...

> @@ -616,14 +747,26 @@ static int ina238_probe(struct i2c_client *client)
>   }
>   
>   static const struct i2c_device_id ina238_id[] = {
> -	{ "ina238" },
> +	{ "ina237", ina237 },
> +	{ "ina238", ina238 },
> +	{ "sq52206", sq52206 },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(i2c, ina238_id);
>   
>   static const struct of_device_id __maybe_unused ina238_of_match[] = {
> -	{ .compatible = "ti,ina237" },
> -	{ .compatible = "ti,ina238" },
> +	{
> +		.compatible = "silergy,sq52206",
> +		.data = (void *)sq52206
> +	},
> +	{
> +		.compatible = "ti,ina237",
> +		.data = (void *)ina237
> +	},
> +	{
> +		.compatible = "ti,ina238",
> +		.data = (void *)ina238
> +	},
>   	{ },

While touching things here, this ending comma could be removed ro be 
consistent with the other struct just above.

>   };
>   MODULE_DEVICE_TABLE(of, ina238_of_match);
> @@ -642,3 +785,4 @@ module_i2c_driver(ina238_driver);
>   MODULE_AUTHOR("Nathan Rossi <nathan.rossi@digi.com>");
>   MODULE_DESCRIPTION("ina238 driver");
>   MODULE_LICENSE("GPL");
> +

