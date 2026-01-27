Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEBA23C503
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 19:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769540788; cv=none; b=K+plj8iyO9MJ3LWcslwAiVBzsaR1UBaAzzUnVk+SDAGya5x/PPRT0w1tX82FAMzNCQfk00DNR1lxgmY5plxtQtLjGTMUsDf/WacPMm7vlLRWxWZmPMWwbBrJDOrigBJZbqVRwLWm5LNVRg9Xgn8r+yWdBd6Qk5TYG/eP1wi3ILU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769540788; c=relaxed/simple;
	bh=T44VeR198I3upruOy1asKmWdrTidLtonZaA4O+DeKc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cMC674wCNTYLvQ8jV0mNINjxdWMMZXxlH3zpEuGdMUtvA7QU3g7Oq4N1ZC7trXRTKCTSrbmKGcNlKfqYgNc0bGerc3VUG5fS30vQSu0RJHb+G+lqu1ey60mLWEQ3JQKtcXadAAWAtqBFN37cTkZgpAyJdRY9xnjFUoo/LJnYOJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bq5Nm9A0; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bq5Nm9A0"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5f53505f012so6232259137.3
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 11:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769540785; x=1770145585; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m0NN/cRu09v0DOapIZODcIBfVWE6w2WjO1wQzxU5hQw=;
        b=bq5Nm9A0o0T+f/+w+RXKzosEvE8Dco+zfcucCQVnsoSVrnHTFXmFnY5YlnCtU33pqS
         KtDM6VaZ9trD9L3x4Ln8JaVrAFniLbmtVq+/+h1NO4evZlNDMqx5VftqUc7elsTkyGJt
         DkVPsWfbpELY2JK2cR9w4kGoK4ldSl4+rQVUbXXdOemFjgH0+BZi6H3r40/srEThYA/t
         Ok5Y5jbRmLGJhUqYcuo67EIe6CPsrFhXEULGdFgQ6Oj30p0N6GVRRevF4MAElkK9yXcF
         SksQVZeQh5ymv09fNXPVti13ACq6nh4AgKPtfMwNNAl28/UpjsV157JSfnghvn5hbYlj
         zCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769540785; x=1770145585;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m0NN/cRu09v0DOapIZODcIBfVWE6w2WjO1wQzxU5hQw=;
        b=vyiyDiwlBqNmGDEJeU6epehdK1C2tG9MFmHinw/LLx0deed+n0Cb6vOE2rV5Leu5ZE
         z6jbJSn/81mBFTMDKtxP4xzGaKP17MIbcJj91smHZ/aTZlM4vxRmsp4KqviceUy8b4uy
         5HKanX0AJ9jBrxTqxBGNIzFEDwCODmnHQ7aq/C8ySVHlI4KOHqOWpi+dzqhobXjMhZvC
         mg2KdMg9CCvk+lFNId1ryF/EsaL2OYj8k3A/zuKT5P0vO/UkL82TEylC/A6yiLRIq78X
         lPoP0Y/bKp0x3E7fwH5hQGRHYriqEg6631b/MZpNY7Vd4UCUSabiIt98c5UWASwNvuFE
         lnbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDeEOld1UkZsavbDJdmDMEoIEUnIQWVJfOQq/EZoJJvPy69N7JB1Sav2+o/bOPvW7lI7tkz1Qrsh4MoA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/tPFQjBayXpzDZJMOSIUpbhWG0yRfO7ATW+lb0hearhjIK2Zy
	oXmbnNFdqoclHEg+nck51fbHwMIROulPEXPhXKzS1elCgxO5c60b8bCHsnicbhUq
X-Gm-Gg: AZuq6aKJjSGGM92A/Vgi+Y7ojB0sfg5/BitiDEWlDHM2nbjxzE3K6h/9dPU0sagKrfl
	HC5We5euFXe85gUN2fH/TAoWmmzfmpZXgOEMFNAsPSAbKNXQgoDxDwXUzFG5RlPtORbTJVCFAOL
	ayfQIJXt9+ZXgOb5QppzBcf0ITOrnsumoH5WHWnVeCU8kiH6tXJDmKVsZvpIs/vYMIiZnb5JU6m
	4Q4N6qKvMdYypIJU0shSTpr1XOHgDahmoBx85TyNwOkGfdrxg9dN0YegrAvW/bcnJJcb+u4Awri
	1GBwKryyNCtRhmXeRvtHZK3beW9PHcZLzX/f2Gf19RIIWdhB7VFu7iqpWFwxrm4aTF0JdQDVWCH
	Vp/5gUTogCAXfDP4KaklblZjlvaoID179UzdG8OZ1JoFC0BHOqIufFq2dAIKmy476mJ3HKGaW/2
	i5vVtfPIbUA3z/EvgNg0CjcFTc
X-Received: by 2002:a05:7300:7491:b0:2ae:5c71:3535 with SMTP id 5a478bee46e88-2b78d8a8ca3mr1787617eec.9.1769534542029;
        Tue, 27 Jan 2026 09:22:22 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b79c8f031csm23765eec.21.2026.01.27.09.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 09:22:21 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 27 Jan 2026 09:22:20 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Marius Cristea <marius.cristea@microchip.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 2/2] hwmon: temperature: add support for EMC1812
Message-ID: <8248d422-c764-4b2d-ba82-3a68cff21256@roeck-us.net>
References: <20260127-hw_mon-emc1812-v4-0-6bf636b54847@microchip.com>
 <20260127-hw_mon-emc1812-v4-2-6bf636b54847@microchip.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-hw_mon-emc1812-v4-2-6bf636b54847@microchip.com>

Hi,

On Tue, Jan 27, 2026 at 05:05:25PM +0200, Marius Cristea wrote:
> This is the hwmon driver for Microchip EMC1812/13/14/15/33
> Multichannel Low-Voltage Remote Diode Sensor Family.
> 
> EMC1812 has one external remote temperature monitoring channel.
> EMC1813 has two external remote temperature monitoring channels.
> EMC1814 has three external remote temperature monitoring channels and
> channels 2 and 3 supports anti parallel diode.
> EMC1815 has four external remote temperature monitoring channels and
> channels 1/2  and 3/4 supports anti parallel diode.
> EMC1833 has two external remote temperature monitoring channels and
> channels 1 and 2 supports anti parallel diode.
> 
> Signed-off-by: Marius Cristea <marius.cristea@microchip.com>
> ---
>  Documentation/hwmon/emc1812.rst |  68 +++
>  Documentation/hwmon/index.rst   |   1 +
>  MAINTAINERS                     |   2 +
>  drivers/hwmon/Kconfig           |  11 +
>  drivers/hwmon/Makefile          |   1 +
>  drivers/hwmon/emc1812.c         | 963 ++++++++++++++++++++++++++++++++++++++++
>  6 files changed, 1046 insertions(+)
> 
> diff --git a/Documentation/hwmon/emc1812.rst b/Documentation/hwmon/emc1812.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..799111a89541c57a839a121bb3dfc12f42604bc2
> --- /dev/null
> +++ b/Documentation/hwmon/emc1812.rst
> @@ -0,0 +1,68 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +Kernel driver emc1802
> +=====================
> +
> +Supported chips:
> +
> +  * Microchip EMC1812, EMC1813, EMC1814, EMC1815, EMC1833
> +
> +    Addresses scanned: I2C 0x1c, 0x3c, 0x4c, 0x4d, 0x5c, 0x6c, 0x7c
> +
> +    Prefix: 'emc1812'
> +
> +    Datasheets:
> +
> +	- https://ww1.microchip.com/downloads/aemDocuments/documents/MSLD/ProductDocuments/DataSheets/EMC1812-3-4-5-33-Data-Sheet-DS20005751.pdf
> +
> +Author:
> +    Marius Cristea <marius.cristea@microchip.com
> +
> +
> +Description
> +-----------
> +
> +The Microchip EMC181x/33 chips contain up to 4 remote temperature sensors
> +and one internal.
> +- The EMC1812 is a single channel remote temperature sensor.
> +- The EMC1813 and EMC1833 is a dual channel remote temperature sensor. The
> +remote channels for this selection of devices can support substrate diodes,
> +discrete diode-connected transistors or CPU/GPU thermal diodes.
> +- The EMC1814 is a three channel remote temperature sensor that supports
> +Anti-Parallel Diode (APD) only on one channel. For the channel that does not
> +support APD functionality, substrate diodes, discrete diode-connected
> +transistors or CPU/GPU thermal diodes are supported. For the channel that
> +supports APD, only discrete diode-connected transistors may be implemented.
> +However, if APD is disabled on the EMC1814, then the channel that supports
> +APD will be functional with substrate diodes, discrete diode-connected
> +transistors and CPU/GPU thermal diodes.
> +- The EMC1815 is a four channel remote temperature sensor. The EMC1815 and
> +EMC1833 support APD on all channels. When APD is enabled, the channels support
> +only diode-connected transistors. If APD is disabled, then the channels will
> +support substrate transistors, discrete diode-connected transistors and
> +CPU/GPU thermal diodes.
> +
> +Note: Disabling APD functionality to implement substrate diodes on devices
> +that support APD eliminates the benefit of APD (two diodes on one channel).
> +
> +The chips implement three limits for each sensor: low (tempX_min), high
> +(tempX_max) and critical (tempX_crit). The chips also implement an
> +hysteresis mechanism which applies to all limits. The relative difference
> +is stored in a single register on the chip, which means that the relative
> +difference between the limit and its hysteresis is always the same for
> +all three limits.
> +
> +This implementation detail implies the following:
> +
> +* When setting a limit, its hysteresis will automatically follow, the
> +  difference staying unchanged. For example, if the old critical limit was
> +  80 degrees C, and the hysteresis was 75 degrees C, and you change the
> +  critical limit to 90 degrees C, then the hysteresis will automatically
> +  change to 85 degrees C.
> +* The hysteresis values can't be set independently. We decided to make
> +  only tempX_crit_hyst writable, while all other hysteresis attributes
> +  are read-only. Setting tempX_crit_hyst writes the difference between
> +  tempX_crit_hyst and tempX_crit into the chip, and the same relative
> +  hysteresis applies automatically to all other limits.
> +* The limits should be set before the hysteresis. At power up the device
> +  starts with a 10 degree written into hysteresis register.
...
> --- /dev/null
> +++ b/drivers/hwmon/emc1812.c
...
> +
> +static int emc1812_chip_identify(struct emc1812_data *data, struct i2c_client *client)
> +{
> +	const struct emc1812_features *chip;
> +	struct device *dev = &client->dev;
> +	int ret, tmp;
> +
> +	ret = regmap_read(data->regmap, EMC1812_PRODUCT_ID_ADDR, &tmp);
> +	if (ret)
> +		return ret;
> +
> +	chip = device_get_match_data(&client->dev);
> +
> +	switch (tmp) {
> +	case EMC1812_PID:
> +		data->chip = &emc1812_chip_config;
> +		break;
> +	case EMC1813_PID:
> +		data->chip = &emc1813_chip_config;
> +		break;
> +	case EMC1814_PID:
> +		data->chip = &emc1814_chip_config;
> +		break;
> +	case EMC1815_PID:
> +		data->chip = &emc1815_chip_config;
> +		break;
> +	case EMC1833_PID:
> +		data->chip = &emc1833_chip_config;
> +		break;
> +	default:
> +		/*
> +		 * If failed to identify the hardware based on internal registers,
> +		 * try using fallback compatible in device tree to deal with some
> +		 * newer part number.
> +		 */
> +		dev_info(dev, "Unknown hardware id: %x\n", tmp);

dev_warn() might be more appropriate. Alternatively, use dev_err() and bail out
with -ENODEV, as suggested below.

> +
> +		data->chip = chip;
> +

AI feedback:

Potential NULL pointer dereference. `device_get_match_data()` returns NULL
when the driver is instantiated via I2C ID table (e.g. via sysfs
`new_device`) instead of via Device Tree or ACPI. If the hardware ID
is also unknown (triggering the `default` case), `data->chip` becomes NULL.

The function returns 0 (success), and `emc1812_probe` proceeds to call
`emc1812_parse_fw_config`, which immediately dereferences `data->chip`:

Side note (not from AI): It might be appropriate to notify the user
if the devicetree data does not match the real hardware.

> +static int emc1812_parse_fw_config(struct emc1812_data *data, struct device *dev)
> +{
> +    /* to be able to load the driver in case we don't have device tree */
> +    if (!dev_fwnode(dev)) {
> +        data->active_ch_mask = BIT(data->chip->phys_channels) - 1;
> +        return 0;
> +    }

This will crash.

The driver should likely use `i2c_get_match_data(client)` instead of
`device_get_match_data()` to support both ID table and FW node matching,
or return an error in the default case if `chip` is NULL.

> +		return 0;
> +	}
> +
> +	return 0;
> +}
> +
