Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B129515666B;
	Thu, 30 May 2024 09:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717060104; cv=none; b=SdSyfdTNwk+AhJ1rNzruqf+DYY8NeM4fv0hsPB35sZXDRMnjZ0FBWUNnakb7vxjMa9lzoBK2OQPJ8T/z2Qjy194GkdQM1NcFjPZnEVNyzJG5HasbLER4KLJZ4fdbGAoMIHh24dajR5K7gAi1o4jwEhbwumsaQdeO8Y1K4UKQ5ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717060104; c=relaxed/simple;
	bh=EJpiJuLnLplPlSX97jzmByJ0QFWruhAlXtw+kfZ0+Bw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vBjEXC9JM1O7w3ceC59lOyG8ht46gyTMInQmtuzaS+kZ8kQOxEoQEHWRE4kOsPPER9Y4+xFJJ1REu/8D/U/+x1H9887AaIyURl5iwwYtt/NrhyTN47m5bwevjllfISMNjdyiciAWy3/aF4mYPjQ+/muaH51Pj2pLnK2SfZpnWqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de; spf=pass smtp.mailfrom=t-8ch.de; dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b=JJ/ooLuq; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b="JJ/ooLuq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1717060092; bh=EJpiJuLnLplPlSX97jzmByJ0QFWruhAlXtw+kfZ0+Bw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JJ/ooLuqra1+kbE6aNHdyuEQd5hWdBzjUrtkT/ol+JITu/NLqv5OmCVEvABgx1T24
	 bh/cyiMMwgWkOYG7LF9wHYxwKCUcNsCTccrck4NlgGnVhnn4VyTftTsGhbVn027/Yg
	 ZlMwGZALU61ALxRoesPAWPwBVRStkjjQhAR7kQU8=
Date: Thu, 30 May 2024 11:08:12 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Hristo Venev <hristo@venev.name>, 
	=?utf-8?B?UmVuw6k=?= Rebe <rene@exactcode.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Radu Sabau <radu.sabau@analog.com>
Subject: Re: [PATCH 2/3] hwmon: Add support for SPD5118 compliant temperature
 sensors
Message-ID: <45396bd5-adb8-485a-98d0-eecfb7439bfa@t-8ch.de>
References: <20240529205204.81208-1-linux@roeck-us.net>
 <20240529205204.81208-3-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240529205204.81208-3-linux@roeck-us.net>

On 2024-05-29 13:52:03+0000, Guenter Roeck wrote:
> Add support for SPD5118 (Jedec JESD300-5B.01) compliant temperature
> sensors. Such sensors are typically found on DDR5 memory modules.
> 
> Cc: René Rebe <rene@exactcode.de>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---

<snip>

> +/* Return 0 if detection is successful, -ENODEV otherwise */
> +static int spd5118_detect(struct i2c_client *client, struct i2c_board_info *info)
> +{
> +	struct i2c_adapter *adapter = client->adapter;
> +	int regval;
> +
> +	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA |
> +				     I2C_FUNC_SMBUS_WORD_DATA))
> +		return -ENODEV;
> +
> +	regval = i2c_smbus_read_word_swapped(client, SPD5118_REG_TYPE);
> +	if (regval != 0x5118)
> +		return -ENODEV;
> +
> +	regval = i2c_smbus_read_word_data(client, SPD5118_REG_VENDOR);
> +	if (regval < 0 || !spd5118_vendor_valid(regval & 0xff, regval >> 8))
> +		return -ENODEV;
> +
> +	regval = i2c_smbus_read_byte_data(client, SPD5118_REG_CAPABILITY);
> +	if (regval < 0)
> +		return -ENODEV;
> +
> +	regval = i2c_smbus_read_byte_data(client, SPD5118_REG_TEMP_CLR);
> +	if (regval)
> +		return -ENODEV;
> +	regval = i2c_smbus_read_byte_data(client, SPD5118_REG_ERROR_CLR);
> +	if (regval)
> +		return -ENODEV;
> +
> +	if (!(regval & SPD5118_CAP_TS_SUPPORT) || (regval & 0xfc))
> +		return -ENODEV;

This breaks automatic detection for me.

I think the test should after the read of SPD5118_REG_CAPABILITY and
test that register, similar on how it is done in _probe().

> +
> +	regval = i2c_smbus_read_byte_data(client, SPD5118_REG_REVISION);
> +	if (regval < 0 || (regval & 0xc1))
> +		return -ENODEV;
> +
> +	regval = i2c_smbus_read_byte_data(client, SPD5118_REG_TEMP_CONFIG);
> +	if (regval < 0)
> +		return -ENODEV;
> +	if (regval & ~SPD5118_TS_DISABLE)
> +		return -ENODEV;
> +
> +	strscpy(info->type, "spd5118", I2C_NAME_SIZE);
> +	return 0;
> +}

<snip>
