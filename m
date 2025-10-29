Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1D22E3B08
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Oct 2025 22:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761775414; cv=none; b=YKtYeuqIZywSzu7qJ93+idpFzFnolkapZslH/EQ91NkGBPNbQiSiJZ8NAeAdEBtfBkcFxOg/IQjSKG0WGWTzZEwFZlPqwERGuPWZEEn3JkG7UkbFN9ssZcuPpmA6R+0YztNl+8WPu87y64oDeJT3AFLZoPmReQvs+e4KHG5SvK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761775414; c=relaxed/simple;
	bh=Rpx+i+g4UDOw+uheC336cz/8fzW0yUsW3KtUgY9A9/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M5qIHmcbINTDQN9xsrzO23ue5ljojUm95iK0+JwHcEixef5M/E26o0e2oh/7rE55HEuuibA/A/8d5tLBRm4UqW3Jdh1kDJh8eDpOUX77jSV++IVxPoWxuwE0OcBoUmJQ5S+E1b5T+X63ebfpPldXoBZj9P+F0oSM6qVi8P7O0ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BWxji16n; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BWxji16n"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-292fd52d527so3272365ad.2
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Oct 2025 15:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761775411; x=1762380211; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Nblfgm5XoVGA2pwggUTGBEWVQZIZxWS8tzQ3rNya1k=;
        b=BWxji16nJLKjInABvrLXLKUmUE3XuS1E0BNaJ5bmjeGIyBnxSjLDc6MQoRz+9Z+YDX
         g7pZhhRL+s/VBub26bsKS4eUUb595+susT3Rj8u6paScAqqC6BTvFewfsnh6lMfnivU4
         +I3b0ql29WFTh/uwApl9Oh/nG9FLsdvHf0mlbyeGfmb9rla+c6zUXV/556oAyKQ4rqte
         FBfE1Tu1Km3MzpBXnzy4vvaaOivAChYY+/BJxHd8iAWxW0Vkt2PnLqf4pIEG0WHDIq5X
         zyuFON8aen8D+jrRm/Rxd2SZuSRDH89HRIRSY3Gxq8NvU1prHYzR0Fr7EM9Aewa/LDe+
         QieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761775411; x=1762380211;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Nblfgm5XoVGA2pwggUTGBEWVQZIZxWS8tzQ3rNya1k=;
        b=HoQs4cCv6jpUmPP2nYtoF9cnAyLKfL4Q8dVubwJIVbWd7se7dyOuh32WGlZZbjnP8r
         te888E5eCp7FSG/txNqTQuzyw1TzYWcWtsoeFYqQ1WczipJ9aAY910fRnDUV9Wsgc4hT
         1kMmOc0no0EOQ7gjhCyX+QRsbwd8vKr4qCJBQQ9pTlTCM6W4kqDFjg4xSXyHHcxWkgEt
         FofTHN88V9jmsTw2Mr/j7Nb/i1uc3DO2TW1+U9Xtry43sB5xzfdw1+LaDbeuBJ1M1IfV
         QK3VnGzNKvGDs8LOt9Pjml/1GX2pH1xH5P7ISnOk/pgJOaEuhV3f1XBEP2mvy7Xsg68i
         QwcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtHmRAxGVYfs9sjjYisowowMPiB8qtNNn80uTFf8JoDwYAo7oTsqOIHJaJC4tlXRjtjIrUg901+7VCCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc7/LLpGKWNO1H78Y/OSFqJUQ8C2gAL63E3o6nr8jr/D6SyBuV
	+X1RXxi7d9xw2LTa3Ki4batqIrgoqRggQG9kz9qLczfk3ZnOaJWfNOBD
X-Gm-Gg: ASbGncvNAg/0KZHMYHEdn3n3D3/+GU9xTlxqW1sezrsH8CIoOGXGqhPo/OEPs67qYqg
	rHhBN57ySL+IZv7CL8WxEb7RCj5NO1z2ZWerjQ4d4gGYcq084+Ly5+0eQfldjdV5lZz+YhOcqb9
	3c1ZxD4Pac3PA5Bqgbuso+8IyeaZJC4qJT7FNfcizFbDQNZLzDwb1ru+Fm5xu8gR224+2kruQxp
	9eVJ2tSA0+fWwpend2DNkc9PP0SfFx6OSqDdVWVOjaBMR4w9HnEgRKuBcF5mWlasUcAIg9AQMuI
	HULBMYBxDov4/fADWUeEQxSSwQH5cMrKLKBI/87YKZvtLKAncAN9jXiK069XdBcJHKoRATudMoz
	wsOeF7qOhY6DDCGgy6HBrdbnuB0Al1wttXaMZe6fPsNNUh69w2EAoNMI9g9Ma7vwwBcucN00R1V
	cpncAy3HJIWQxv
X-Google-Smtp-Source: AGHT+IEwsj2J/ftTrnWWbeM7o5Z+AJ9IhB7ABxIMbByBawCiASkXvvXWBg+ahShIu+FUAW/13d84Zg==
X-Received: by 2002:a17:903:ad0:b0:269:96db:939 with SMTP id d9443c01a7336-294def33bffmr54489445ad.58.1761775411490;
        Wed, 29 Oct 2025 15:03:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d230basm162597355ad.46.2025.10.29.15.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 15:03:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 29 Oct 2025 15:03:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Marius Cristea <marius.cristea@microchip.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: temperature: add support for EMC1812
Message-ID: <86b94f01-ff93-457e-95cc-4e87009964af@roeck-us.net>
References: <20251029-hw_mon-emc1812-v1-0-be4fd8af016a@microchip.com>
 <20251029-hw_mon-emc1812-v1-2-be4fd8af016a@microchip.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-hw_mon-emc1812-v1-2-be4fd8af016a@microchip.com>

On Wed, Oct 29, 2025 at 05:50:59PM +0200, Marius Cristea wrote:
> This is the hwmon driver for Microchip EMC1812/13/14/15/33
> Multichannel Low-Voltage Remote Diode Sensor Family.
> 
> Signed-off-by: Marius Cristea <marius.cristea@microchip.com>

One more ...

> +static int emc1812_parse_fw_config(struct emc1812_data *data, struct device *dev)
> +{
> +	unsigned int reg_nr = 0;
> +	int ret;
> +

I added
	if (!dev_fwnode(dev)) {
                data->num_channels = data->chip->phys_channels;
                data->active_ch_mask = BIT(data->num_channels) - 1;
                return 0;
        }

to be able to load the driver and run basic unit tests.
I expect something similar in the final driver.

Also, here is the unit test result from writing negative values
into the limit registers:

temp1_crit: Suspected underflow: [min=0, read 4294903296, written -2147483648]
temp1_min: Suspected underflow: [min=0, read 4294903296, written -2147483648]
temp1_max: Suspected underflow: [min=0, read 4294903296, written -2147483648]
temp2_crit: Suspected underflow: [min=0, read 4294903296, written -2147483648]
temp2_min: Suspected underflow: [min=0, read 4294903296, written -2147483648]
temp2_max: Suspected underflow: [min=0, read 4294903296, written -2147483648]

Thanks,
Guenter
