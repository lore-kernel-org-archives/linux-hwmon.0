Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793588770;
	b=bVrc5XqqFN9hO35XK1UPHWVPtcXw+bNLRcL4nllgR5TlaB+tCodivx0sA+CFAQRkEJ6v
	 6g9qfsSUXLtAesp7Vf61cVg4dj7v8q5OfOvb9GWWvxVL+VkuQRHGokGTkzeIKq5r0OzH2
	 IhbkFnX3ErTypqWBmKu4MhsFKt6l+NJp1BDxnJc9YP37/2Uu1FhQsDqjUoIYnMD/Fqs6J
	 fiYl3SfEEJau6TZz6FE8XjS+uco7GMVnAOMVUMa7ayEcA9Zo4P4zSakcpQo35IUTujsTk
	 dzY37tIY5z6oQVY7o4aFnC6Y7h+IPLD9KsfB9JmKYHxg3rEcQOHxoSfWtapOFWpw3VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793588770;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=OyjZ+N4a9qefmJo7byV/+mRX+hSQfs4A6Vsng69VtNY=;
	b=5tRqo5ND8Y1Y+wyDi+n/dHlxzSIdJP9k7Q5914BGr1i8847hKOAx2P8jahgK1Z3EzB7Z
	 oW0o4kRCEZJhqJ/VWq97U/GklGdx+z93LNXhAf+OYug4Re/RQCh/kqZWXwtNBYBq9J8D8
	 zJyRM+fXsXYuxsr8HBx9lMBf4ARPIoWApWykC9fA8fyeMChoocWg43OFnyzcmcSR1+5C1
	 nA29GplopNNILc+5AJAa2Sw7+qcJSBQx2jcSDEwoF2Cz1atXDjTvfRzib5RA8/04tln6r
	 2Y2wCtSMb0xaQ5rbHct4tV87Wh+Geu4WuuV9lEK0dYgKLMQxL5DpkTYwKr6fACjM+8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Jj0McUwA;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E135606A327
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 03:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E135606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Jj0McUwA
Received: from eig-obgw-6006b.ext.cloudfilter.net ([10.0.30.211])
	by cmsmtp with ESMTPS
	id NXoqxJltLv0ndNiN2x3fLS; Mon, 02 Nov 2026 03:06:04 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id NiN1x9SzgsTgvNiN1xUbAa; Mon, 02 Nov 2026 03:06:03 +0000
X-Authority-Analysis: v=2.4 cv=DPiP4zNb c=1 sm=1 tr=0 ts=6ae7fe1b
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=_jlGtV7tAAAA:8 a=BA9JajvoVav3SfIcZTsA:9 a=QEXdDO2ut3YA:10
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=OyjZ+N4a9qefmJo7byV/+mRX+hSQfs4A6Vsng69VtNY=; b=Jj0McUwAXo72
	pfdTEsKRTiyHHnfMuY0EpKvuuYzwKf1wBSkOWqxJTrWG+5+XSfwlEPykzWGNjCsI/0G/ChziK2DVr
	WWoZUjT9g53xKRG4Yss2N+Q9IF9wcRSGxQlRXtIIspcLiVMod3WoqtzJ5I6Ws5Tvb4pl4MgYuq4C8
	0GO0QC9yqCtN3nkk99CalXkv5j4Rp9WuxWl36IIfZsuhXxNldTaaVkPr9sHR1wBB0zogdUl3gXFq+
	f4csWBgI+74/0LSNhDRps/fgtIlCknx/PNkzfTQ/rQMlXD/T+SMkdSzSYlZwh2xKoKGjLp5bgBLft
	AKvPH0T3+3KmgyHM+NKGtA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:39052)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xNiMy-000000012bx-0sK1;
	Mon, 02 Nov 2026 08:36:00 +0530
Message-ID: <b65ef6c6-cbcf-4793-9ba1-7c5cb270f574@roeck-us.net>
Date: Sun, 1 Nov 2026 19:05:56 -0800
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] hwmon: Add Broadcom PMB PVTMON monitoring
To: Linus Walleij <linusw@kernel.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 William Zhang <william.zhang@broadcom.com>,
 Anand Gore <anand.gore@broadcom.com>, Kursad Oney
 <kursad.oney@broadcom.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 Randy Dunlap <rdunlap@infradead.org>,
 Benjamin Larsson <benjamin.larsson@genexis.eu>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-hwmon@vger.kernel.org
References: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org>
 <20261101-xg6846b-bcmbca-xrdp-reset-v2-6-455fe9eed5ee@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261101-xg6846b-bcmbca-xrdp-reset-v2-6-455fe9eed5ee@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xNiMy-000000012bx-0sK1
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:39052
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 20
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfCmN4+GZyXY8JKRbbABqr40O7Tq/frQ2wSRVHQtXYV483pt7zsZidP6jVydhBUOQ9ApEHzFc8k5wseL1bldRJVRHpsH5wYHHXVUiEA28G0ZhLVckHg+y
 trQ2qZSJlS4NOfweIpz7lmVyNmzzDZ+wlsgKMRHxH/M4XHyY5q84ViCaFdvjiMUb+0DP8m1OsY9FfvRcj2SLwS7X81nBc+ExR4SrPg7kmrL50JGrUvc17DbO

On 11/1/26 14:14, Linus Walleij wrote:
> Expose the BCM6846 die temperature and seven voltage inputs through
> hwmon using the shared Processor Monitor Bus (PMB) regmap.
> 
> Register the temperature channel with the thermal framework so
> existing zero-cell device-tree thermal sensor references work.
> 
> Poll for valid samples with a bounded timeout, releasing the PMB lock
> between reads. Report temperature in millidegrees Celsius, including
> negative values, and voltages in millivolts.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Acked-by: Guenter Roeck <linux@roeck-us.net>

Please let me know if you want me to take this patch through
the hwmon subsystem.

Thanks,
Guenter

> ---
>   Documentation/hwmon/bcm_pmb_pvtmon.rst |  53 ++++++++
>   Documentation/hwmon/index.rst          |   1 +
>   MAINTAINERS                            |   2 +
>   drivers/hwmon/Kconfig                  |  18 +++
>   drivers/hwmon/Makefile                 |   1 +
>   drivers/hwmon/bcm_pmb_pvtmon.c         | 232 +++++++++++++++++++++++++++++++++
>   6 files changed, 307 insertions(+)
> 
> diff --git a/Documentation/hwmon/bcm_pmb_pvtmon.rst b/Documentation/hwmon/bcm_pmb_pvtmon.rst
> new file mode 100644
> index 000000000000..7dba658bdc76
> --- /dev/null
> +++ b/Documentation/hwmon/bcm_pmb_pvtmon.rst
> @@ -0,0 +1,53 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +Kernel driver bcm_pmb_pvtmon
> +============================
> +
> +Supported chips:
> +
> +  * Broadcom BCM6846 PVTMON
> +
> +    Access: Processor Monitor Bus (PMB), bus 1, device 6
> +
> +Author: Linus Walleij <linusw@kernel.org>
> +
> +Description
> +-----------
> +
> +The process, voltage and temperature monitor (PVTMON) measures die
> +temperature and seven voltage inputs. The driver uses the shared PMB MFD
> +transport and obtains its clock and reset from the sibling providers.
> +
> +With CONFIG_THERMAL_OF enabled, the temperature channel also supplies
> +device-tree thermal zones. The PVTMON node uses #thermal-sensor-cells = <0>;
> +voltage inputs do not have thermal sensor indices.
> +
> +Sysfs attributes
> +----------------
> +
> +All attributes are read-only. Temperature is reported in millidegrees
> +Celsius and voltages in millivolts, using the BCM6846 vendor conversion
> +formulas and input-divider ratios.
> +
> +================ ================================
> +Attribute        Description
> +================ ================================
> +temp1_input      Die temperature
> +in0_input        First 0.85 V input
> +in1_input        Second 0.85 V input
> +in2_input        VIN input
> +in3_input        1.0 V input
> +in4_input        1.8 V input
> +in5_input        3.3 V input
> +in6_input        Diagnostic test input
> +in0_label        V0.85_1
> +in1_label        V0.85_2
> +in2_label        VIN
> +in3_label        V1.0
> +in4_label        V1.8
> +in5_label        V3.3
> +in6_label        Vtest
> +================ ================================
> +
> +Labels follow the vendor channel names. Vtest is a diagnostic ADC input,
> +not a supply rail. The driver does not change the analog test routing.
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 199ca79621e9..5a579391cf9e 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -54,6 +54,7 @@ Hardware Monitoring Kernel Drivers
>      axiado-pwm-fan
>      axiado-tsadc
>      bcm54140
> +   bcm_pmb_pvtmon
>      bel-pfe
>      bpa-rs600
>      cgbc-hwmon
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 74f0783d512f..124d67ea1582 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5451,7 +5451,9 @@ F:	Documentation/devicetree/bindings/hwmon/brcm,bcm6846-pmb-pvtmon.yaml
>   F:	Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml
>   F:	Documentation/devicetree/bindings/reset/brcm,bcm6846-pmb-reset.yaml
>   F:	Documentation/devicetree/bindings/soc/bcm/brcm,bcm6846-pmb.yaml
> +F:	Documentation/hwmon/bcm_pmb_pvtmon.rst
>   F:	drivers/clk/bcm/clk-bcmbca-pmb.c
> +F:	drivers/hwmon/bcm_pmb_pvtmon.c
>   F:	drivers/mfd/bcmbca_pmc3_pmb.c
>   F:	drivers/reset/reset-bcmbca-pmb.c
>   F:	include/dt-bindings/clock/brcm,bcm6846-pmb.h
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 18c682e1a475..7e2bc32628d4 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -334,6 +334,24 @@ config SENSORS_AXIADO_TSADC
>   	  This driver can also be built as a module. If so, the module
>   	  will be called axiado-tsadc.
>   
> +config SENSORS_BCM_PMB_PVTMON
> +	tristate "Broadcom PMB PVTMON hardware monitoring"
> +	depends on ARCH_BCMBCA || COMPILE_TEST
> +	depends on MFD_BCMBCA_PMB
> +	depends on COMMON_CLK
> +	depends on RESET_CONTROLLER
> +	select CLK_BCMBCA_PMB
> +	select RESET_BCMBCA_PMB
> +	select REGMAP
> +	default MFD_BCMBCA_PMB
> +	help
> +	  Enable temperature and voltage monitoring through the Processor
> +	  Monitor Bus on Broadcom BCM6846. With THERMAL_OF enabled, the
> +	  temperature channel also supplies the thermal zones described in
> +	  the device tree.
> +
> +	  This driver can also be built as a module called bcm_pmb_pvtmon.
> +
>   config SENSORS_K8TEMP
>   	tristate "AMD Athlon64/FX or Opteron temperature sensor"
>   	depends on X86 && PCI
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index d4c345ed7261..edf8e8d2f345 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -62,6 +62,7 @@ obj-$(CONFIG_SENSORS_ATXP1)	+= atxp1.o
>   obj-$(CONFIG_SENSORS_AXI_FAN_CONTROL) += axi-fan-control.o
>   obj-$(CONFIG_SENSORS_AXIADO_PWM_FAN) += axiado-pwm-fan.o
>   obj-$(CONFIG_SENSORS_AXIADO_TSADC)	+= axiado-tsadc.o
> +obj-$(CONFIG_SENSORS_BCM_PMB_PVTMON) += bcm_pmb_pvtmon.o
>   obj-$(CONFIG_SENSORS_CGBC)	+= cgbc-hwmon.o
>   obj-$(CONFIG_SENSORS_CHIPCAP2) += chipcap2.o
>   obj-$(CONFIG_SENSORS_CORETEMP)	+= coretemp.o
> diff --git a/drivers/hwmon/bcm_pmb_pvtmon.c b/drivers/hwmon/bcm_pmb_pvtmon.c
> new file mode 100644
> index 000000000000..8b95dac83994
> --- /dev/null
> +++ b/drivers/hwmon/bcm_pmb_pvtmon.c
> @@ -0,0 +1,232 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Broadcom BCM6846 process, voltage and temperature monitor (PVTMON).
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/hwmon.h>
> +#include <linux/mfd/bcmbca-pmb.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +
> +#define PVTMON_BUS		1
> +#define PVTMON_DEVICE		6
> +
> +/* PMB register offsets are in 32-bit words. */
> +#define PVTMON_CONFIG		17
> +#define PVTMON_RESET_N		BIT(0)
> +#define PVTMON_POWER_DOWN		BIT(1)
> +
> +#define PVTMON_ACQ_CONFIG		20
> +#define PVTMON_ACCUM_ENABLE	BIT(0)
> +#define PVTMON_SKIP_LENGTH	GENMASK(11, 8)
> +
> +#define PVTMON_CHANNEL_BASE	24
> +#define PVTMON_NUM_CHANNELS	8
> +#define PVTMON_VALUE		GENMASK(9, 0)
> +#define PVTMON_VALID		BIT(18)
> +#define PVTMON_SAMPLES		GENMASK(26, 24)
> +#define PVTMON_CHANNEL_ENABLE	BIT(31)
> +
> +/* Voltage labels and divider ratios follow the BCM6846 vendor definitions. */
> +static const struct {
> +	const char *label;
> +	unsigned int divisor;
> +} bcm6846_pvtmon_voltages[] = {
> +	{ "V0.85_1", 10 },
> +	{ "V0.85_2", 10 },
> +	{ "VIN", 7 },
> +	{ "V1.0", 7 },
> +	{ "V1.8", 4 },
> +	{ "V3.3", 2 },
> +	{ "Vtest", 10 },
> +};
> +
> +static int bcm_pmb_pvtmon_init(struct regmap *regmap,
> +			       struct reset_control *reset)
> +{
> +	unsigned int reg = BCMBCA_PMB_REG(PVTMON_BUS, PVTMON_DEVICE, PVTMON_CONFIG);
> +	u32 config, acq, channel;
> +	unsigned int i;
> +	int ret;
> +
> +	ret = regmap_read(regmap, reg, &config);
> +	if (ret)
> +		return ret;
> +
> +	/* Do not reset acquisition already running for the PMC firmware. */
> +	if ((config & (PVTMON_RESET_N | PVTMON_POWER_DOWN)) != PVTMON_RESET_N) {
> +		ret = regmap_update_bits(regmap, reg, PVTMON_POWER_DOWN, 0);
> +		if (ret)
> +			return ret;
> +		ret = reset_control_reset(reset);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = regmap_read(regmap, BCMBCA_PMB_REG(PVTMON_BUS, PVTMON_DEVICE,
> +						 PVTMON_ACQ_CONFIG), &acq);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < PVTMON_NUM_CHANNELS; i++) {
> +		reg = BCMBCA_PMB_REG(PVTMON_BUS, PVTMON_DEVICE, PVTMON_CHANNEL_BASE + i);
> +		ret = regmap_read(regmap, reg, &channel);
> +		if (ret)
> +			return ret;
> +
> +		if (channel & PVTMON_CHANNEL_ENABLE)
> +			continue;
> +
> +		/* Average 32 samples, matching the vendor acquisition setup. */
> +		ret = regmap_update_bits(regmap, reg, PVTMON_CHANNEL_ENABLE | PVTMON_SAMPLES,
> +					 PVTMON_CHANNEL_ENABLE | FIELD_PREP(PVTMON_SAMPLES, 5));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (!(acq & PVTMON_ACCUM_ENABLE))
> +		return regmap_update_bits(regmap,
> +					  BCMBCA_PMB_REG(PVTMON_BUS, PVTMON_DEVICE,
> +							 PVTMON_ACQ_CONFIG),
> +					  PVTMON_SKIP_LENGTH | PVTMON_ACCUM_ENABLE,
> +					  PVTMON_ACCUM_ENABLE | FIELD_PREP(PVTMON_SKIP_LENGTH, 8));
> +
> +	return 0;
> +}
> +
> +static int bcm_pmb_pvtmon_read(struct device *dev, enum hwmon_sensor_types type,
> +			       u32 attr, int channel, long *val)
> +{
> +	struct regmap *map = dev_get_drvdata(dev);
> +	unsigned int index;
> +	u32 value;
> +	int ret;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		if (attr != hwmon_temp_input)
> +			return -EOPNOTSUPP;
> +		index = 0;
> +		break;
> +	case hwmon_in:
> +		if (attr != hwmon_in_input)
> +			return -EOPNOTSUPP;
> +		index = channel + 1;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	/* Release the PMB between samples so other clients can make progress. */
> +	ret = regmap_read_poll_timeout(map,
> +				       BCMBCA_PMB_REG(PVTMON_BUS, PVTMON_DEVICE,
> +						      PVTMON_CHANNEL_BASE + index),
> +				       value, value & PVTMON_VALID, 1000, 100000);
> +	if (ret)
> +		return ret;
> +
> +	value = FIELD_GET(PVTMON_VALUE, value);
> +	if (type == hwmon_temp) {
> +		/* Signed arithmetic allows temperatures below zero Celsius. */
> +		*val = (41335000 - 49055 * (int)value) / 100;
> +	} else {
> +		/* 880 mV ADC reference, accounting for each input divider. */
> +		*val = 880 * value * 10 /
> +			(bcm6846_pvtmon_voltages[channel].divisor * 1024);
> +	}
> +
> +	return 0;
> +}
> +
> +static int bcm_pmb_pvtmon_read_string(struct device *dev,
> +				      enum hwmon_sensor_types type, u32 attr,
> +				      int channel, const char **str)
> +{
> +	if (type != hwmon_in || attr != hwmon_in_label)
> +		return -EOPNOTSUPP;
> +
> +	*str = bcm6846_pvtmon_voltages[channel].label;
> +	return 0;
> +}
> +
> +static const struct hwmon_ops bcm_pmb_pvtmon_ops = {
> +	.visible = 0444,
> +	.read = bcm_pmb_pvtmon_read,
> +	.read_string = bcm_pmb_pvtmon_read_string,
> +};
> +
> +static const struct hwmon_channel_info * const bcm_pmb_pvtmon_info[] = {
> +	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
> +	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
> +	HWMON_CHANNEL_INFO(in,
> +			   HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info bcm_pmb_pvtmon_chip_info = {
> +	.ops = &bcm_pmb_pvtmon_ops,
> +	.info = bcm_pmb_pvtmon_info,
> +};
> +
> +static int bcm_pmb_pvtmon_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct regmap *regmap = dev_get_regmap(dev->parent, NULL);
> +	struct device *hwmon;
> +	struct reset_control *reset;
> +	struct clk *clk;
> +	int ret;
> +
> +	if (!regmap)
> +		return -ENODEV;
> +
> +	reset = devm_reset_control_get_exclusive(dev, NULL);
> +	if (IS_ERR(reset))
> +		return dev_err_probe(dev, PTR_ERR(reset), "failed to get PVTMON reset\n");
> +
> +	clk = devm_clk_get_enabled(dev, NULL);
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable PVTMON clock\n");
> +
> +	ret = bcm_pmb_pvtmon_init(regmap, reset);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to initialize PVTMON\n");
> +
> +	hwmon = devm_hwmon_device_register_with_info(dev, "bcm6846_pvtmon", regmap,
> +						     &bcm_pmb_pvtmon_chip_info, NULL);
> +	if (IS_ERR(hwmon))
> +		return dev_err_probe(dev, PTR_ERR(hwmon), "failed to register hwmon device\n");
> +
> +	/* Acquisition remains enabled for the PMC firmware after unbinding. */
> +	return 0;
> +}
> +
> +static const struct of_device_id bcm_pmb_pvtmon_of_match[] = {
> +	{ .compatible = "brcm,bcm6846-pmb-pvtmon" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, bcm_pmb_pvtmon_of_match);
> +
> +static struct platform_driver bcm_pmb_pvtmon_driver = {
> +	.probe = bcm_pmb_pvtmon_probe,
> +	.driver = {
> +		.name = "bcm6846-pmb-pvtmon",
> +		.of_match_table = bcm_pmb_pvtmon_of_match,
> +	},
> +};
> +module_platform_driver(bcm_pmb_pvtmon_driver);
> +
> +MODULE_AUTHOR("Linus Walleij <linusw@kernel.org>");
> +MODULE_DESCRIPTION("Broadcom PMB PVTMON hardware monitoring driver");
> +MODULE_LICENSE("GPL");
> 

