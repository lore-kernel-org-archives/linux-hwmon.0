Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A1B205E01;
	Fri, 10 Jan 2025 08:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736497521; cv=none; b=W4L7tkzurSQ5GPadHUqHKF9QMBm8kXr6bwJS4qqlhDCCE9e0zdDfRgWRqQ1X+NNtwha7prrsLSrP3wts22cvOKcacEZxYIH4q5gfi46NtGs6aT3vAS2uLM3R0C9BCSFWGX9hVuiMpcan7sOIKbaCUWTCK/KKZ6MdyWFXgcFDNCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736497521; c=relaxed/simple;
	bh=C4j/PE+SkzjyWIkFfeBW5drHUDYWlyceAsEgQaNU7Jc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N7JmT+96hNK4ndwcTFCZC4nEMJzwBowFVSMymSxL4/YdNKloPHhKQutc3o2avpR51bmgNEM32VyUr7jfGS0tK52QuKVaTIrazFRQgvHb9deJNODnhpqANaCldDCDa+uvU1NJtio2dCqMgjLy28rrZURLi+KAo//P07yfERNNpjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lhJFDFn8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lhJFDFn8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 188E6C4CED6;
	Fri, 10 Jan 2025 08:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736497520;
	bh=C4j/PE+SkzjyWIkFfeBW5drHUDYWlyceAsEgQaNU7Jc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lhJFDFn8//ZIeuv+RJ53Lq3C5jvgXzp6JqBCjbgGqTEFkV88fWniJAp/IIxS/mTKm
	 oiBmvTCYh4HuDi/JaLLcLJbBmAh3Z1pqZQ8Cqvyuhf8TxWGn2xQCBBD8gMeglLYfTt
	 gYl+Hgg6J7QxTO6OVrSxcANeXJEQcAll5bwHDFDxlE3FYO5J30/FrlCF/xt2fvb+xl
	 ZKwZk81unKLSosMILtOPIxUKU+t4kwoDulDXCL7g9BAxcp0KnGmYwTSVaSX3rFyJCk
	 NGQsGmnTra0r50TwkFE9mtkTR84JEDgf8ZJsgj/Pgz9SG2BhobDUsKF8u/HC06Wpyx
	 NgWEcOS1DogHQ==
Message-ID: <8a2f67d3-97e5-49eb-823f-480d59178e18@kernel.org>
Date: Fri, 10 Jan 2025 09:25:12 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hwmon: Add driver for TI INA232 Current and Power
 Monitor
To: Leo Yang <leo.yang.sy0@gmail.com>, jdelvare@suse.com, linux@roeck-us.net,
 robh@kernel.org, davem@davemloft.net, krzk+dt@kernel.org,
 conor+dt@kernel.org, Leo-Yang@quantatw.com, corbet@lwn.net,
 Delphine_CC_Chiu@Wiwynn.com, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>
References: <20250110081546.61667-1-Leo-Yang@quantatw.com>
 <20250110081546.61667-3-Leo-Yang@quantatw.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250110081546.61667-3-Leo-Yang@quantatw.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/01/2025 09:15, Leo Yang wrote:
> Support ina233 driver for Meta Yosemite V4.
> 
> Driver for Texas Instruments INA233 Current and Power Monitor
> With I2C-, SMBus-, and PMBus-Compatible Interface
> 
> Reported-by: kernel test robot <lkp@intel.com>

No, what did the robot report? Drop.

> Closes: https://lore.kernel.org/oe-kbuild-all/202501092213.X9mbPW5Q-lkp@intel.com/

Drop

> Closes: https://lore.kernel.org/oe-kbuild-all/202501061734.nPNdRKqO-lkp@intel.com/

Drop

> Signed-off-by: Leo Yang <Leo-Yang@quantatw.com>
> ---
>  Documentation/hwmon/ina233.rst |  77 ++++++++++++++
>  MAINTAINERS                    |   8 ++
>  drivers/hwmon/pmbus/Kconfig    |   9 ++
>  drivers/hwmon/pmbus/Makefile   |   1 +
>  drivers/hwmon/pmbus/ina233.c   | 184 +++++++++++++++++++++++++++++++++
>  5 files changed, 279 insertions(+)
>  create mode 100644 Documentation/hwmon/ina233.rst
>  create mode 100644 drivers/hwmon/pmbus/ina233.c
> 
> diff --git a/Documentation/hwmon/ina233.rst b/Documentation/hwmon/ina233.rst
> new file mode 100644
> index 000000000000..41537f89bed5
> --- /dev/null
> +++ b/Documentation/hwmon/ina233.rst
> @@ -0,0 +1,77 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver ina233
> +====================
> +
> +Supported chips:
> +
> +  * TI INA233
> +
> +    Prefix: 'ina233'
> +
> +  * Datasheet
> +
> +    Publicly available at the TI website : https://www.ti.com/lit/ds/symlink/ina233.pdf
> +
> +Author:
> +
> +	Leo Yang <Leo-Yang@quantatw.com>
> +
> +Usage Notes
> +-----------
> +
> +The shunt resistor value can be configured by a device tree property;
> +see Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml for details.
> +
> +
> +Description
> +-----------
> +
> +This driver supports hardware monitoring for TI INA233.
> +
> +The driver is a client driver to the core PMBus driver. Please see
> +Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
> +
> +The driver provides the following attributes for input voltage:
> +
> +**in1_input**
> +
> +**in1_label**
> +
> +**in1_max**
> +
> +**in1_max_alarm**
> +
> +**in1_min**
> +
> +**in1_min_alarm**
> +
> +The driver provides the following attributes for shunt voltage:
> +
> +**in2_input**
> +
> +**in2_label**
> +
> +The driver provides the following attributes for output voltage:
> +
> +**in3_input**
> +
> +**in3_label**
> +
> +**in3_alarm**
> +
> +The driver provides the following attributes for output current:
> +
> +**curr1_input**
> +
> +**curr1_label**
> +
> +**curr1_max**
> +
> +**curr1_max_alarm**
> +
> +The driver provides the following attributes for input power:
> +
> +**power1_input**
> +
> +**power1_label**
> \ No newline at end of file

You still have patch warnings. I already commented on this, so you have
to fix it everywhere.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index c575de4903db..fde1713dff9d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11226,6 +11226,14 @@ L:	linux-fbdev@vger.kernel.org
>  S:	Orphan
>  F:	drivers/video/fbdev/imsttfb.c
>  
> +INA233 HARDWARE MONITOR DRIVER
> +M:	Leo Yang <Leo-Yang@quantatw.com>
> +M:	Leo Yang <leo.yang.sy0@gmail.com>

One email.

> +L:	linux-hwmon@vger.kernel.org
> +S:	Odd Fixes

Why would we like to have unmaintained driver? Odd fixes is candidate to
removal, so shall we accept it and remove immediately?


> +F:	Documentation/hwmon/ina233.rst
> +F:	drivers/hwmon/pmbus/ina233.c
> +

...

> +
> +	/* If INA233 skips current/power, shunt-resistor and current-lsb aren't needed.	*/
> +	/* read rshunt value (uOhm) */
> +	if (of_property_read_u32(client->dev.of_node, "shunt-resistor", &rshunt) < 0)
> +		rshunt = INA233_RSHUNT_DEFAULT;
> +
> +	/* read current_lsb value (uA) */
> +	if (of_property_read_u16(client->dev.of_node, "ti,current-lsb", &current_lsb) < 0)
> +		current_lsb = INA233_CURRENT_LSB_DEFAULT;
> +
> +	if (!rshunt || !current_lsb) {
> +		dev_err(&client->dev, "shunt-resistor and current-lsb cannot be zero.\n");

Then properties must have constraints in your schema.

> +		return -EINVAL;


Best regards,
Krzysztof
