Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41253115B8;
	Thu, 26 Feb 2026 07:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772092100; cv=none; b=tkMyU/0uE+sw8jXe8iDNnQZ3bo0VIausuz6hGkPtun7cCQIxAMOshPCdg3FVHEGZF0knOBRknz03aTrFccCnmYuI8yEpI3HDPoHuiFdg5uCGHHnUdf14TYlrYxVwyCPk2TUw3h2qRxuDckW2xTNgfG/4Tpc/JFerC+hSwwAkXqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772092100; c=relaxed/simple;
	bh=ie6eGxPY1q4fI9vb9x4urJnzwZGcBFpN4BvSkTUqc9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZU2//XcKHXWsmQ/rJ8yKyOOaKqfSl8UDWxhnFtR/7fZkO6PR7j0d648RRnoKBj6MPPEPxF9uuGA+6BEdOpup5E+8qRvlpgg+zBtqHDugt2iMOVwSR6FlBnRDbWkgGm82XVw88VGDGF5XbhvGwoVSeItJ56R1NSwgCYizOQOznCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jV6+Z+Hc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jV6+Z+Hc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDB50C19422;
	Thu, 26 Feb 2026 07:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772092100;
	bh=ie6eGxPY1q4fI9vb9x4urJnzwZGcBFpN4BvSkTUqc9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jV6+Z+HcS5M29io9elV6nhBHhyKnAgCN2n09T6aNyF1fYfdLNANqNG09Jc6j6+3hD
	 xH/3I15e2+5+md+5Ld2jzqWyN2nk4qea1IqJpU8HipnfAPppJHgzUaqbbEWZUQ/c0H
	 o3kzk/jFzGWQIUVUyvEJpXt60LdcyVt/a6DMfcrtpsfunkdlxqKvsPTTpWXDE8ZyCS
	 3OyUoUEVzFnHG6v3UF6xRwgjxBRDXYWy1S3AVvI3+puS3DhVYf5Fxq7nPwryg3VnR2
	 MboJsVvsnivJJQ/2KjGw/bPgWeFyxngQkLn/GXt3jxQ3bvhXq4U8FUixv/1KKEzMq+
	 REZBIXH53sHgg==
Date: Thu, 26 Feb 2026 08:48:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: wenswang@yeah.net
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux@roeck-us.net, corbet@lwn.net, skhan@linuxfoundation.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: add MP2845 driver
Message-ID: <20260226-vagabond-opalescent-cockle-3dea1b@quoll>
References: <20260225085501.164819-1-wenswang@yeah.net>
 <20260225085631.165106-1-wenswang@yeah.net>
 <20260225085631.165106-2-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260225085631.165106-2-wenswang@yeah.net>

On Wed, Feb 25, 2026 at 04:56:31PM +0800, wenswang@yeah.net wrote:
> +#define MFR_VIN_OV_UV_SET	0x71
> +#define MFR_OVUV_OCWARN_THRES	0x75
> +#define MFR_TOTAL_OCP_SET	0x76
> +#define MFR_PROTECT_STATUS1	0x80
> +#define MFR_PROTECT_STATUS2 0x81
> +
> +#define MP2845_VIN_LIMIT_UINT	125
> +#define MP2845_READ_VIN_UINT	3125
> +#define MP2845_READ_VIN_DIV	100
> +#define MP2845_READ_IOUT_UINT	3125
> +#define MP2845_READ_IOUT_DIV	100
> +#define MP2845_READ_VOUT_UINT	5
> +#define MP2845_TEMP_UINT	1000
> +
> +#define MFR_READ_VIN	0xA6
> +#define MFR_READ_VOUT	0xA7
> +#define MFR_READ_IOUT	0xA8
> +#define MFR_READ_TEMP	0xA9
> +#define MFR_MFG_ID_SCALE_VI1	0x77
> +#define MFR_MFG_ID_SCALE_VI2	0x78
> +
> +struct mp2845_data {
> +	struct i2c_client *client;
> +	int iout_gain[4];
> +	/* lock for preventing concurrency issue */

This is completely useless comment. The definition of lock is to prevent
concurrency issues. It's like adding a comment to a function: "it is a
function".

You must here explain which data or code logic is protected by this.

> +	struct mutex lock;
> +};

...


> +
> +static int mp2845_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct device *hwmon_dev;
> +	struct mp2845_data *data;
> +	int ret;
> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA |
> +				     I2C_FUNC_SMBUS_WORD_DATA)) {
> +		dev_err(dev, "check failed, smbus byte and/or word data not supported!\n");
> +		return -ENODEV;
> +	}
> +
> +	data = devm_kzalloc(dev, sizeof(struct mp2845_data), GFP_KERNEL);

sizeof(*)

> +	if (!data)
> +		return -ENOMEM;
> +
> +	mutex_init(&data->lock);
> +	data->client = client;
> +
> +	ret = mp2845_identify_iout_scale(data, 0);
> +	if (ret < 0) {
> +		dev_err(dev, "unable to identify rail1 iout scale, errno = %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mp2845_identify_iout_scale(data, 1);
> +	if (ret < 0) {
> +		dev_err(dev, "unable to identify rail2 iout scale, errno = %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mp2845_identify_iout_scale(data, 2);
> +	if (ret < 0) {
> +		dev_err(dev, "unable to identify rail3 iout scale, errno = %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mp2845_identify_iout_scale(data, 3);
> +	if (ret < 0) {
> +		dev_err(dev, "unable to identify rail4 iout scale, errno = %d\n", ret);
> +		return ret;
> +	}
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
> +							 data, &mp2845_chip_info,
> +							 NULL);
> +	if (IS_ERR(hwmon_dev)) {
> +		dev_err(dev, "unable to register mp2845 hwmon device\n");
> +		return PTR_ERR(hwmon_dev);
> +	}
> +
> +	dev_info(dev, "%s: sensor '%s'\n", dev_name(hwmon_dev), client->name);

Driver should be silent on success probe. See also coding style and
driver development docs.

Best regards,
Krzysztof

