Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48A747887B
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 17:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777571722; cv=none; b=WAE5cxi6g79lRTMej2OyluVwiPyas4wteF6zlqI7/PIZW8YFSb5xRiHTzUXHQbzYy6kqN/NfDL6MW6k1RDM3GWpW6hnLUFqF7hGlUWKPywsIlCP09c9W4Zr9pHGlB/USYDCRRtyY50eP/A5rg6bIh4LCGyXsAuZLL11XTg1r2g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777571722; c=relaxed/simple;
	bh=ipKUp57GyoRW23THF7J1POdt4/WFPMNT/SoRXwdqPnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sBr72g/BRNkewdpzVBU7f+msKTB5CrI75wNOUzGS6ktp/MZJQkzWok0nLjbcJs1qY0AJilJAZz0gvcpfduZ/sKTsE85CFaaYafKGwMdTCqqjFET7fDeSTcVfO95LFG99FzuslsJZk8BDRMr2aDzVVad4I/BaXShPKYMKYw2K1cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OLCv5u4s; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OLCv5u4s"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82f69a286dbso877838b3a.2
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 10:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777571721; x=1778176521; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+IcSJbY4/m6vzsR5njH8V/sOHCSKFEcfIX9jSdaOTSk=;
        b=OLCv5u4sOa6xGMfSR/riRqc3tnyoACgt7g6hTcus/op6gSxTFVrWfMy/sJi0ZI73pM
         q3ntHCbXQJIdS9XzSz/CAeL7Tk+c/EP2xVQfTY5oGmuUJbq4MkOoIqoupsvU1buyqfeg
         mp5ZNFk1UpSYACA9psv4MWBn6iME3e5Lw5SUwICHRNFZU7hcf/h3mhCPT8xLo6TULjgE
         vo5fhJIVcMLxXu/PmlnGq3QjF2on1VRBEAfLMSCgaOSFVSNPNlbfEsK0kdohZgVdnM8s
         kCRgQCWEXnuFP7/1ofmho0g22GYrP79XQnBVz2Y570wM7J0QKxqUoEiduoTv+5OLEE0V
         4WPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777571721; x=1778176521;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+IcSJbY4/m6vzsR5njH8V/sOHCSKFEcfIX9jSdaOTSk=;
        b=JrqYOeY4gRgLHCkt4zayIBHkna3A1OIOcfHGNUpy6F+2qNp7xFM5luRowGMno6Rm81
         KOWOMQJXnLvHsNfT0C1D9iS/lOlX0IW4+d635Gav4WrdBiywoWmI3OCRlbzxsSQRU0iJ
         4ezj4epalFcweOgqJ3YL1tXdfTasWLxydhgsEi8miwwyIW7KggzWPQcZGoey7uYzUHJw
         6oV5hDKaNk7CGJtJ4j9oHLybd7DpPxS012PTdvvisHiLb9q7Qt5PpSmzaRMPwmmBGp31
         b1mOJqS0CgvfFmRsApaXr8xt61DXAmmFvULdJS0r38UA3/51rPKkJrM/gR5XWl08lAgh
         gjow==
X-Forwarded-Encrypted: i=1; AFNElJ83zrNO2fFcoztt+gx2HSc9ounFJbPGpeCTzgSThHVGj+R8uZX2q/ieOtWnIh008GOPF/Nsg86hH0qpCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YymFZnpJSDaM/7YZYynSy9Umj/7d36+ray69WGBQnBX2xFItizY
	GPYBYpgorjvphnkFpM26VWZN3vfpP4umifWJzv0X/hRE1R6xLOgC35Dt
X-Gm-Gg: AeBDietzak8B9eQ1v6gUY+1I2YNtcZiHiKid2Hg0y6Nq5jDiqao+O9TQNeb+giZEMEI
	awOFnV3aia7yPngqnW6xmg/MqIpcSV7UzMkd+fujQDsoGfInzU82nOjHMQhDQGtyXFczp4x1lKe
	g7SX8z6rMyusjtuo8WB/Vfs282scVCzILAWulcC+HFWzwQtbZVKnz9Ih1VakOQ9okHOOz+iygmT
	gl0k5TUTKjDlTnPj4mw055UBsmLuxCUNCgxFY6gOK07ZcZtxHsxHfqyMqydWX5JTOhbcdYaiVrm
	FJn1/5/Gw9JyRjnEfmppkJpmWoP937xW9dovPz4stnLfw/pc5ECBKN5tdLeptmD9i4RNgJ2qL7I
	VuQZN2kp0X3xksg4/N92YMNj0eoAdz46UUBB44NACk881nK+Y3/UYvB/3UQ/TLWfEk2yS8QIrfd
	nNmFRtjqMI/fgQVxikWfSX2HH+qMqM5fFK3lNNAauQyIY9KnI=
X-Received: by 2002:a05:6a00:e08:b0:82f:8b20:9165 with SMTP id d2e1a72fcca58-834fdc6d2c0mr4706115b3a.44.1777571720927;
        Thu, 30 Apr 2026 10:55:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8351582ee04sm256974b3a.5.2026.04.30.10.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 10:55:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Apr 2026 10:55:19 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus/max20830) add driver for max20830
Message-ID: <63e770a5-1740-4144-9c5b-929fff8413b1@roeck-us.net>
References: <20260417-dev_max20830-v3-0-0cb8d56067aa@analog.com>
 <20260417-dev_max20830-v3-2-0cb8d56067aa@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417-dev_max20830-v3-2-0cb8d56067aa@analog.com>

,

On Fri, Apr 17, 2026 at 04:27:14PM +0800, Alexis Czezar Torreno wrote:
> Add support for MAX20830 step-down DC-DC switching regulator with
> PMBus interface. It allows monitoring of input/output voltage,
> output current and temperature through the PMBus serial interface.
> 
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> ---
...
> +
> +	/*
> +	 * Use i2c_smbus_read_i2c_block_data() instead of
> +	 * i2c_smbus_read_block_data() to support I2C controllers
> +	 * which do not support SMBus block reads.
> +	 */
> +	ret = i2c_smbus_read_i2c_block_data(client, PMBUS_IC_DEVICE_ID,
> +					    I2C_SMBUS_BLOCK_MAX, buf);
> +	if (ret < 0)
> +		return dev_err_probe(&client->dev, ret,
> +				     "Failed to read IC_DEVICE_ID\n");
> +
> +	/* First byte is the block length (including itself). */
> +	len = buf[0];
> +	if (len != 9 || ret < len)
> +		return dev_err_probe(&client->dev, -ENODEV,
> +				     "IC_DEVICE_ID length mismatch: reported %u, read %d\n",
> +				     len, ret);
> +
> +	/* Data is at buf[1..8], so null terminator goes at buf[9]. */

I ended up checking the kernel code. As it turns out,
i2c_smbus_read_i2c_block_data does _not_ return the length in byte 0.
It returns the first byte of the actual data, and the length as return
value. See i2c_smbus_read_i2c_block_data() in drivers/i2c/i2c-core-smbus.c.

So this can not work as written. Something like

        if (i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BLOCK_DATA))
                ret = i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID, data_buf);
        else
                ret = i2c_smbus_read_i2c_block_data(client, PMBUS_IC_DEVICE_ID,
						    I2C_SMBUS_BLOCK_MAX, buf);

should do, assuming that support for I2C_FUNC_SMBUS_BLOCK_DATA and/or
I2C_FUNC_SMBUS_READ_I2C_BLOCK was checked before.

Thanks,
Guenter
