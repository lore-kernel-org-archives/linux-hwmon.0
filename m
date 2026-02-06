Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4ED22652D
	for <linux-hwmon@vger.kernel.org>; Fri,  6 Feb 2026 01:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770340189; cv=none; b=iOcJmFZ2tfpnZBHBTwmW9aqK8TIu58wtP5YTV9CObai3gHSjk0jjhRvG1FcD8xAR8FC/jZred9ppKqTnQlGccop2MU2/6vPftMeGV3E8afO1x2kAtgyf+Fkp6h4VuTFPJlCVdKrNidun+NhdZeAU+NZCaq8PbKIV7sApNsN5HZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770340189; c=relaxed/simple;
	bh=rNuWtRvMB0NRy8EVLOoIZ2tDJW/Huf0pVpEpPTseNOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=psRndoHuS05tkajWx2qaX/TN5EUbN+8HWmeZmMUMGJk3DmMmaHFlKiJUopF+RlYTnnT3GoRXCB2OseJjPIOlzkGW6kylyQcArU8RAd7/cFpA8gt2pgGoENS5rLOB8rbK50QcVpZlyL2FVEDzsDGOpKi7+nj8wmp27ZqjffKrZjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CYqNmQI+; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CYqNmQI+"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-11f1fb91996so274623c88.1
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Feb 2026 17:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770340188; x=1770944988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vs2QcgRbbbiP9STmkUY5xRdKIA29w4m7lTues8D5avc=;
        b=CYqNmQI+bOQFSWHbeNVufCRxXX31uX8uJ4Q6/VbpzmaPE8Lo3TqHDyTBDwWs2NvOPu
         /nz9ZVcstSVFnAZoHsE2WRYrsGxTc4Y8+93zbruluQCIxZHvUNHnztpWqGowR1mfkww0
         uOG0EwsBRlrSSR9Vb44d8ZCWOZ9xpaS2hBiRxpfgt12gjO71dYE2fcaM9x4FyujfPLoV
         mhQvWR+40g7iRkrYz/T2GLthUVHikQ3UsQ3VJFvGTHM/R2wVG/SirDcC4hOv3K/z3zsP
         m1yh/7i0QjyJSwG7pvNe7TtcJLBWaYw6WwbIbSLV2NrByK2ubZ4Qi1KYf4AgenAqxy/g
         8pmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770340188; x=1770944988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vs2QcgRbbbiP9STmkUY5xRdKIA29w4m7lTues8D5avc=;
        b=GQPxoGNopnJTUaatrco+XlE1lEqmWsMGz+mutWSNAVHh6HTdbrHNb6ZOskPJeAZzFy
         z0yczsbyZsdPc+v9KolsAtRDX3ll+JEacBL6ihec5f4ZWzZdYqdYAY0aok6oAdgNg7gy
         8QOtbce4W/9EfGVroApP1ZSQiuaS9r8lM7NByumWbIh7lBdzobcIX4wHGjNfo1KOKbRg
         bUKTHqQ0gT50Czj/OjFeeedvYX1qf8jUbN98/kdnK/gZE1JrKHlkQmUb2D+s1A9nGitK
         8XliaCn2BGE1WfQx0aj7VSVG7oqk/u5RNq7cTh4c4oT0Jxn317oeB46FYAxRox7r+QF1
         5nGA==
X-Forwarded-Encrypted: i=1; AJvYcCWJLCpIsmNe5P795cwfpbEiaVC2goOMj8meQshjwudlVsGHLZwxVaHmts2YLjCrJgCJiijSsTBw7uYMYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkJCq6YjB9AKhbd6iobJMepw83FEsS0mRVch0VrGUf9zTjTXTr
	BhseozQipZkZJvv8B1Yrtk2T57rKn8GeB/p4ElIxScH1/wGi5ZKwxF0C
X-Gm-Gg: AZuq6aJWf37q1HftP+VHqPd/Pc/E5xqFme06hh8FH9WxsiAQiOdGaFzxJgxc+yWjVLu
	ynKRorbohw9Op9zYHZSaV6COVT5rBp+pOtX172Mz2adllXgVHihVqQYre+BPPCvPn95woWwhBWB
	vWAPuzmfO60gHEz+c/is9nI5wxVbpINpIj1P2iTGvzX9qoh2rlDezUQb2BpVP9rxCcpWwpYREaF
	hiO/+S8iz4WPNDzWda0CDtFLENXhoERsaWhWJ/TuAgiErG7H1VjLFYkyB6sGcqT9Jcgb570ssK+
	Lre+bySQiWwagGmB3KGNibhC2q60raDtPh2rK+YsKbfRHY5bSVz3yIyP57+mpdpvi/kghXdSQOM
	oulc405+0EfsoXtKwtBtqbzX/fFkSE41o0DHfKzFpCK9dbu2UbiqxlZNaTu2yqRrr6qIjg4nj2C
	ToHwNkW/lNdxaDFHDvFMD/dFkG
X-Received: by 2002:a05:7022:6ba6:b0:123:330b:390 with SMTP id a92af1059eb24-127040083femr589392c88.20.1770340187659;
        Thu, 05 Feb 2026 17:09:47 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855ad9a42sm881029eec.1.2026.02.05.17.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 17:09:47 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 5 Feb 2026 17:09:45 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Marius Cristea <marius.cristea@microchip.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 2/2] hwmon: temperature: add support for EMC1812
Message-ID: <402ba937-226d-44be-8411-428a8842a35c@roeck-us.net>
References: <20260205-hw_mon-emc1812-v5-0-232835aefe8f@microchip.com>
 <20260205-hw_mon-emc1812-v5-2-232835aefe8f@microchip.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205-hw_mon-emc1812-v5-2-232835aefe8f@microchip.com>

On Thu, Feb 05, 2026 at 09:09:04AM +0200, Marius Cristea wrote:
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

Additional AI generated review feedback below. Please address.

Thanks,
Guenter

---

# Task
Date: 2026-02-05 16:00:08
Model: gemini-3-flash-preview
Prompts SHA: 52e5df6 ("various changes")
Commits to review:
- 0f6303cffaab ("dt-bindings: hwmon: temperature: add support for EMC1812")
- c5a5b0f370f0 ("hwmon: temperature: add support for EMC1812")


# Commit 0f6303cffaab ("dt-bindings: hwmon: temperature: add support for EMC1812")
commit 0f6303cffaabd0f20f74335ad88e6e3ec5876d93
Author: Marius Cristea <marius.cristea@microchip.com>

dt-bindings: hwmon: temperature: add support for EMC1812

This commit adds the DeviceTree schema for the Microchip EMC1812 family
of temperature sensors and updates the MAINTAINERS file.

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc1812.yaml
[ ... ]
> +  interrupts:
> +    items:
> +      - description: alert-therm2 asserts when the ALERT limit is exceeded.
> +      - description: therm-addr asserts when the THERM limit is exceeded.
> +    minItems: 1
> +
> +  interrupt-names:
> +    items:
> +      - enum: [alert-therm2, therm-addr]

Is the interrupt-names schema intended to be this flexible?

The current items definition only constrains the first element of the list.
If a second interrupt is provided, it remains unconstrained.

Additionally, if only one interrupt is provided, the interrupts property
enforces it to be alert-therm2 (the first positional item), but the
interrupt-names enum allows it to be named therm-addr.

Should it be defined as:
  interrupt-names:
    items:
      - const: alert-therm2
      - const: therm-addr
    minItems: 1

[ ... ]
> +  microchip,parasitic-res-on-channel1-2:
> +    description:
> +      Indicates that the chip and the diodes/transistors are sufficiently
> +      far apart that a parasitic resistance is added to the wires, which can
> +      affect the measurements. Due to the anti-parallel diode connections,
> +      channels 1 and 2 are affected together.
> +    type: boolean

Is this description accurate for all supported models?

For the EMC1812, there is only one external channel, so it seems
unlikely that "channels 1 and 2 are affected together".

Also, the EMC1813 does not appear to support anti-parallel diodes
according to the commit message and driver documentation, yet this
description attributes the property to anti-parallel diode connections.

[ ... ]
> +patternProperties:
> +  "^channel@[1-4]$":
[ ... ]
> +    properties:
> +      reg:
> +        items:
> +          minimum: 1
> +          maximum: 4

Does the reg property for channels need a maxItems: 1 constraint?

Without it, the schema allows reg to be an array of multiple values,
whereas a channel node reg should typically be a single value.

[ ... ]
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - microchip,emc1812
> +              - microchip,emc1813
> +              - microchip,emc1833
> +    then:
> +      properties:
> +        microchip,parasitic-res-on-channel3-4: false

The EMC1814 supports anti-parallel diodes on channels 2 and 3, but only
has three external channels in total.

Should microchip,parasitic-res-on-channel3-4 also be disabled for the
EMC1814, since it doesn't have a fourth channel?

If the EMC1814 uses this property for its anti-parallel pair (2 and 3),
the property name appears to be a mismatch.

[ ... ]

The driver added in commit c5a5b0f370f0 references a property named
"microchip,enable-anti-parallel", but it is missing from this schema.

Should "microchip,enable-anti-parallel" be added to the bindings?

[ ... ]
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0efa8cc6775b..c807025d911e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS

# Commit c5a5b0f370f0 ("hwmon: temperature: add support for EMC1812")
commit c5a5b0f370f04e9e4ae78ae82077cfb684461d8e
Author: Marius Cristea <marius.cristea@microchip.com>

hwmon: temperature: add support for EMC1812

This commit adds a new hwmon driver for the Microchip EMC1812 family of
temperature sensors, including support for EMC1812, EMC1813, EMC1814,
EMC1815, and EMC1833 chips.

> diff --git a/Documentation/hwmon/emc1812.rst b/Documentation/hwmon/emc1812.rst
> new file mode 100644
> index 000000000000..799111a89541
> --- /dev/null
> +++ b/Documentation/hwmon/emc1812.rst
> @@ -0,0 +1,68 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +Kernel driver emc1802
> +=====================

Should this be emc1812?

> +Author:
> +    Marius Cristea <marius.cristea@microchip.com

The closing angle bracket seems to be missing from the email address.

[ ... ]

> diff --git a/drivers/hwmon/emc1812.c b/drivers/hwmon/emc1812.c
> new file mode 100644
> index 000000000000..30bbc377d592
> --- /dev/null
> +++ b/drivers/hwmon/emc1812.c

[ ... ]

> +static int emc1812_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +			int channel, long *val)
> +{
> +	struct emc1812_data *data = dev_get_drvdata(dev);
> +	unsigned int convrate;
> +	int ret;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		return emc1812_read_reg(dev, data, attr, channel, val);
> +	case hwmon_chip:
> +		switch (attr) {
> +		case hwmon_chip_update_interval:
> +			ret = regmap_read(data->regmap, EMC1812_CONV_ADDR, &convrate);
> +			if (ret < 0)
> +				return ret;
> +
> +			if (convrate > 10)
> +				convrate = 4;
> +
> +			*val = 16000 >> convrate;

If convrate is 10, *val becomes 15. However, emc1812_conv_time[10] is 16.
This results in a slight discrepancy where writing 16ms and reading it back
returns 15ms.

> +			return 0;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}

[ ... ]

> +static int emc1812_set_temp(struct device *dev, struct emc1812_data *data, int channel,
> +			    enum emc1812_limit_type map, long val)
> +{
> +	long valh, vall;
> +	u8 regh, regl;
> +	int ret;
> +
> +	regh = emc1812_limit_regs[channel][map];
> +	regl = emc1812_limit_regs_low[channel][map];
> +
> +	if (channel) {
> +		val = DIV_ROUND_CLOSEST(val, 125);
> +		valh = (val >> 3) & 0xff;
> +		vall = (val & 0x07) << 5;
> +	} else {
> +		/* internal channel limit is stored on 8bits */
> +		valh = DIV_ROUND_CLOSEST(val, 1000);
> +	}
> +
> +	ret = regmap_write(data->regmap, regh, valh);

Can this write overflow the 8-bit register for the internal channel?

In emc1812_write(), val is clamped to a maximum of 191875 and then offset
by 64000, resulting in 255875.

emc1812_write()
    val = clamp_val(val, -64000, 191875);
    val = val + 64000; // val is 255875

emc1812_set_temp()
    valh = DIV_ROUND_CLOSEST(255875, 1000); // valh is 256

Since the register is 8 bits wide, writing 256 (0x100) will be truncated
to 0x00, setting the limit to -64.0 C instead of the requested 191.875 C.

[ ... ]

> +static int emc1812_init(struct emc1812_data *priv)
> +{
> +	int ret;
> +	u8 val;

[ ... ]

> +	/* Set ideality factor for all external channels */
> +	ret = regmap_write(priv->regmap, EMC1812_EXT1_IDEALITY_FACTOR_ADDR,
> +			   EMC1812_DEFAULT_IDEALITY_FACTOR);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(priv->regmap, EMC1812_EXT2_IDEALITY_FACTOR_ADDR,
> +			   EMC1812_DEFAULT_IDEALITY_FACTOR);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(priv->regmap, EMC1812_EXT3_IDEALITY_FACTOR_ADDR,
> +			   EMC1812_DEFAULT_IDEALITY_FACTOR);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(priv->regmap, EMC1812_EXT4_IDEALITY_FACTOR_ADDR,
> +			   EMC1812_DEFAULT_IDEALITY_FACTOR);
> +	if (ret)
> +		return ret;

Does this code need to write to EXT2/3/4 ideality factor registers if the
chip (like EMC1812) does not support those channels? While likely ignored
by the hardware, it seems redundant.


# Summary

| Commit                                                                    | Regressions |
| :------------------------------------------------------------------------ | :---------- |
| 0f6303cffaab ("dt-bindings: hwmon: temperature: add support for EMC1812") | 6           |
| c5a5b0f370f0 ("hwmon: temperature: add support for EMC1812")              | 5           |
