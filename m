Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB81522A4EB;
	Thu, 15 Jan 2026 08:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768467204; cv=none; b=hbpmS6KQ/MNdJ5itghMsmIfCzdr6BDnKZL8ft3e9fCA99A+C1vYwLoR9Y34RK+jr6o/l/OjhgNbBgaI2JB/v9swcWkUn7Nx27eKqQ8JhXxgwyoMB6JcGNXeu/90a+4gbe+iq/Q/kbBONof1qXcX/NwsDuwYTjoZPbDkXFFHdyRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768467204; c=relaxed/simple;
	bh=u4r7k4v/QLQr7iis7zl29Bdym9mmUE102gG7EboGlzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JQrYS9ajm6TMbAidc4zJFDymK94uBUzxu491REpavIc7UAeJPFGA+8Zo5lovIYQLYLFminIGrPPPGksYHboVeNAPFckfEtxGmO+QpRag4vluQjy9NW8N9fi5ZvxAaZqMht0JaN0InDDUsaErvL20tz3+NUAwp+DgKCwfOS+ecuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cTgGlXxd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cTgGlXxd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC1A3C116D0;
	Thu, 15 Jan 2026 08:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768467204;
	bh=u4r7k4v/QLQr7iis7zl29Bdym9mmUE102gG7EboGlzA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cTgGlXxdv5orzbDwpbqvnVWNc7KaYKVJLUWBAfSQ9NAMjKg2evRemjSSB6p1mxlSR
	 ovE+lTvbSgcuj2dBoAdOd8ruld2ri65X9DMD0CyR2PiL24qiWg2G/Ms+XLas4/rzeQ
	 D2jodQaSnm5mgCXyIPk66t4PCwLfct346gOIErK2o9sH9bp+5dHOWdFemWQuEbIZFF
	 ZxEz93I5g3O3nHnEIylH/8KygzsPv7s555CnoMSt+urHtgsSASqWIKQvTGIZB2KWsR
	 0++eKV40HMwyjEP96Xpz9fOW0VPHKUjgJwXLi9FQEMsVFo+GWowxVc1Mvw1uaTCdzT
	 DvPDUx3H+tlGw==
Message-ID: <ae5d7b54-bc05-434a-b4a1-8cad1899462c@kernel.org>
Date: Thu, 15 Jan 2026 09:53:19 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] hwmon: (tmp108) Add support for P3T1035 and
 P3T2030
To: Mayank Mahajan <mayankmahajan.x@nxp.com>, linux@roeck-us.net,
 corbet@lwn.net, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: priyanka.jain@nxp.com, vikash.bansal@nxp.com
References: <20260115065757.35-1-mayankmahajan.x@nxp.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260115065757.35-1-mayankmahajan.x@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/01/2026 07:57, Mayank Mahajan wrote:

> @@ -369,7 +486,7 @@ static int tmp108_common_probe(struct device *dev, struct regmap *regmap, char *
> 
>  	err = devm_add_action_or_reset(dev, tmp108_restore_config, tmp108);
>  	if (err) {
> -		dev_err(dev, "add action or reset failed: %d", err);
> +		dev_err_probe(dev, err, "Add action or reset failed");

How is this relevant to new device? Do not mix independent changes into
one commit. Please carefully read submitting patches, although this is
generic programming practice and nothing specific to kernel.

>  		return err;
>  	}
> 
> @@ -384,17 +501,34 @@ static int tmp108_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
>  	struct regmap *regmap;
> +	enum tmp108_hw_id hw_id;
> +	const void *of_data;
> 
>  	if (!i2c_check_functionality(client->adapter,
> -				     I2C_FUNC_SMBUS_WORD_DATA))
> -		return dev_err_probe(dev, -ENODEV,
> +				     I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA))
> +		return dev_err_probe(dev, -EOPNOTSUPP,
>  				     "adapter doesn't support SMBus word transactions\n");

I do not see how changing error code is related/relevant to new device
support...

> 
> -	regmap = devm_regmap_init_i2c(client, &tmp108_regmap_config);
> +	regmap = devm_regmap_init(dev, &tmp108_i2c_regmap_bus, client, &tmp108_regmap_config);
>  	if (IS_ERR(regmap))
>  		return dev_err_probe(dev, PTR_ERR(regmap), "regmap init failed");
> 
> -	return tmp108_common_probe(dev, regmap, client->name);
> +	/* Prefer OF match data (DT-first systems) */
> +	of_data = device_get_match_data(&client->dev);
> +	if (of_data) {
> +		hw_id = (enum tmp108_hw_id)(uintptr_t)of_data;

Completely mixed up cases. First, do not use uintptr_t. Second, last
enum cast is not needed. You only need cast via unsigned long.

> +	} else {
> +		/* Fall back to legacy I2C ID table */
> +		const struct i2c_device_id *id = i2c_client_get_device_id(client);
> +
> +		if (!id) {
> +			dev_err_probe(dev, -ENODEV, "No matching device ID for i2c device\n");
> +			return -ENODEV;

Syntax is return dev_err_probe. Look above - just few lines above you
have it right, so you are you introducing different syntax?

> +		}
> +		hw_id = (enum tmp108_hw_id)id->driver_data;

And this should cause build warnings on W=1.

Are you sure you build tested it with different compilers, with W=1, for
32 and 64 bit platforms?

> +	}
> +
> +	return tmp108_common_probe(dev, regmap, client->name, hw_id);
>  }
> 


> 
>  static const struct of_device_id tmp108_of_ids[] = {
> -	{ .compatible = "nxp,p3t1085", },
> -	{ .compatible = "ti,tmp108", },
> -	{}
> +	{ .compatible = "nxp,p3t1035", .data = (void *)(uintptr_t)P3T1035_ID },
> +	{ .compatible = "nxp,p3t1085", .data = (void *)(uintptr_t)P3T1085_ID },
> +	{ .compatible = "nxp,p3t2030", .data = (void *)(uintptr_t)P3T1035_ID },

So devices are compatible? If so, drop this and express it in the bindings.

> +	{ .compatible = "ti,tmp108", .data = (void *)(uintptr_t)TMP108_ID },
> +	{ /* sentinel */ },

Please organize the patch documenting the compatible (DT bindings)
before the patch using that compatible.
See also:
https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46



Best regards,
Krzysztof
