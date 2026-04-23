Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F3136492A;
	Thu, 23 Apr 2026 08:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776933797; cv=none; b=HvpNpSoFJSxXfX2pF1xeon2h6Pp5XyMrIBC717ag+kHqdmB/TGRnKF7fs+tBBq9z0pk0say+HKus4dftrDqM64cD0TacNAqhtAhXVcYo2dpaMPRXVdQ4YB6WDDMvXj7Zc1oa/iTl0RAn5E4ilkGnsattuFhpZBdj4Zr8bVxEctw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776933797; c=relaxed/simple;
	bh=fbiHUKc7I5NxdLmjJZOAcwpqf4Yq83kS8Os3am0fli0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bl6ksMjhcKS2L7qXmodu/AaCTRjHKhgp4XMJ8z1pcyBM3ZbIeDiC1ve+Pn+/pNCqduapRkP4SfdCAm+vmU/Vpr/cqot5qNHPtjdmOf4kaOaxQ8IQYPQQEFgJ7FpeVJ/Cui5cDrOxaMPhXhTenJ5VT3XiGc71KPdW/b/ccnMsgpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OAivd/Jw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OAivd/Jw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6C7EC2BCAF;
	Thu, 23 Apr 2026 08:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776933797;
	bh=fbiHUKc7I5NxdLmjJZOAcwpqf4Yq83kS8Os3am0fli0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OAivd/JwhLXU1xc7oBHigtqOcG5QrgW0pR1eIOTu22lf9mBVT7CzA7mfQszf3b7Q7
	 +0QXqZzKcU0cCFuO27nBVV4Ck471/cFN3Rm8z8UHrswsokuXzJBivSFkJUfnU2a7hB
	 W92UXRYpRqO1RcpY7P/LzqzDDSLuigeI3HVqH/u8nl9m4Gq6kWQjOOdEjrSnedRZkt
	 CHirHH/IW8M8zksOwHY4QHf4NpO5jJ7Ca0NSwWt9bH4ZjRBaqV4Qxmom0PyEQiLADT
	 0lxy5eLaauVoTJz97340sAQEz4HFybu+BGvkFEUnVcDrJyg34XPVpwp4m52mXdFJWo
	 UZ7FaHx/HC7rg==
Date: Thu, 23 Apr 2026 10:43:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Brian Chiang <chiang.brian@inventec.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (pmbus/lx1308) Add support for LX1308
Message-ID: <20260423-simple-uber-labrador-0b9b36@quoll>
References: <20260422-add-support-lx1308-v1-0-9b8322f45aae@inventec.com>
 <20260422-add-support-lx1308-v1-2-9b8322f45aae@inventec.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260422-add-support-lx1308-v1-2-9b8322f45aae@inventec.com>

On Wed, Apr 22, 2026 at 12:06:16PM +0000, Brian Chiang wrote:
> +
> +static struct pmbus_driver_info lx1308_info = {
> +	.pages = 1,
> +	.format[PSC_VOLTAGE_IN] = linear,
> +	.format[PSC_VOLTAGE_OUT] = linear,
> +	.format[PSC_CURRENT_IN] = linear,
> +	.format[PSC_CURRENT_OUT] = linear,
> +	.format[PSC_POWER] = linear,
> +	.format[PSC_TEMPERATURE] = linear,
> +
> +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
> +		| PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
> +		| PMBUS_HAVE_PIN | PMBUS_HAVE_POUT
> +		| PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
> +		| PMBUS_HAVE_STATUS_INPUT,
> +
> +	.read_word_data  = lx1308_read_word_data,
> +	.write_word_data = lx1308_write_word_data,
> +};
> +
> +static const struct i2c_device_id lx1308_id[] = {
> +	{ "lx1308" },
> +	{ }
> +};

All ID tables should be next to each other, usually just before the
struct with driver.

> +
> +MODULE_DEVICE_TABLE(i2c, lx1308_id);
> +

...

> +	if (ret != 12 || buf[0] != 'V')
> +		return dev_err_probe(&client->dev, -ENODEV,
> +				     "Unsupported Manufacturer Revision '%s'\n", buf);
> +	return pmbus_do_probe(client, &lx1308_info);
> +}
> +
> +static const struct of_device_id lx1308_of_match[] = {
> +	{ .compatible = "luxshare,lx1308" },

Where is the rest of your compatibles? Do not document ABI which is
unused. submitting-patches in DT forbids that.

> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, lx1308_of_match);

Best regards,
Krzysztof

