Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268305;
	b=Jzba4UJN6Cedb2l2F+uer+Uw3yHfduynbPvwMQKtLgWdc1tW3KtT/2RBiunBd7XPlPsg
	 1+drliX9Ezh96r5efDqriBk4FRPPKcIcDcx5CoLV+qp/QjSXCg+kQIkTetW+EgCLay09m
	 52Fb4CbUcVcp3iQnywwLeUF63J7wQhC44RMfGsWZiccryHpSVX0GkILxPkLibbS6FMxM+
	 Zap13fnXC2i8d9xdcBre1HFYK3dRA0E5rE0ADwVZg7Bh8CzayfxpZRNmzGYZqUUNxkIaj
	 25+JN1VRK24O/KY+ZkbZ4FojsUCGN82Na/SCPIop3eneJV195URBVbm15BXU4OjvC0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268305;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=mG+Z2x8BVo/jwFACUmpDutjLeT1jmDjIbhjaCHs8Tt0=;
	b=Jld/7LOZj7GH0B3OpQ5g7bt9AQUbifJFTJNr44o3RpWgQXDCVhemIbY4pigaRKEPOwZ1
	 YKxH8y1oKOwk5hfto7hFoiTy61+sDVo/9SjQ4l6+wJkKjiznLYRzW8z5nK9gkwytqyKM3
	 sYjMOnb/ZNx5JC0K2Dowr5YAyxp3WXDDNKhsyqKk7uolV3T/SafN2sMRfVLijJz0DDNPP
	 8A+W5qER5HdzcoB7WcaqHcLHSggVQrIz6xMN4pZglcNwRR9nmRjcmr/cMTUOpaR/LHiSO
	 ViIWiJJsbdE9075U5c+GzhjYXK5hIE+hDRGUt9g8ad9FKmgr91UBO1qHd5ZIUnmoc2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=eJHGXirf;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B99606A321
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 23:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56B99606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=eJHGXirf
Received: from eig-obgw-6003b.ext.cloudfilter.net ([10.0.30.175])
	by cmsmtp with ESMTPS
	id QQQNxoiQz4vCDQZ9MxCWRp; Mon, 09 Nov 2026 23:51:44 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id QZ9LxTbyEGh2BQZ9Lx4Itz; Mon, 09 Nov 2026 23:51:44 +0000
X-Authority-Analysis: v=2.4 cv=Aszu3P9P c=1 sm=1 tr=0 ts=6af25c90
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=XYAwZIGsAAAA:8
 a=3nL8IkXtacJJuiP_3MUA:9 a=CjuIK1q_8ugA:10 a=E8ToXWR_bxluHZ7gmE-Z:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mG+Z2x8BVo/jwFACUmpDutjLeT1jmDjIbhjaCHs8Tt0=; b=eJHGXirffgbhtaHhzY22qhSDiu
	HBiyiwt8ucKOR3S4N4egYKWNVK+JrxLUeetycfKd7WVjSNocMW6fHicSCyGxUQLhT9yvszTaz9mic
	iIB2KTo2SLPnK0Zt7UvQnU9+2YyrrX7OkFrPOWEJBx8HoE0mtvtoNPQRZE3d5yE/FDRUKllGYRsj3
	ba8je+n7X76AZBZhXShmFT5yKBqPB5h87QZNtWdkckxFFWZzHTM6yjHIO8mBq8oDD3uIvgOAZ0xUj
	bC+f2oG98IBb9MUm+9z+vHaGUU+ThC7vOnhpRWdi4aqArXkk7VP8/udeyJ4x0zjrIhNS7Sih0B3yG
	2Aqqxxrw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:58268 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQZ9K-00000001Beu-0Hqc;
	Tue, 10 Nov 2026 05:21:42 +0530
Date: Mon, 9 Nov 2026 15:51:40 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
	Steen.Hegelund@microchip.com, daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com, nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	luka.perkov@sartura.hr
Subject: Re: [PATCH v2 3/6] hwmon: sparx5: add LAN969x fan monitoring support
Message-ID: <e189dcb8-1cbd-4629-85dc-1b73243806fd@roeck-us.net>
References: <20261109133609.810876-1-robert.marko@sartura.hr>
 <20261109133609.810876-3-robert.marko@sartura.hr>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109133609.810876-3-robert.marko@sartura.hr>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQZ9K-00000001Beu-0Hqc
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:58268
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 105
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHrRYLTvHJvm+smsUWal4BIvXUVaVNgh3ygRjKH4jxER7fTlrOkl8fHzR2ElINlGuBmeTT9xu04fVREbAK2eSHO+eG8beK67eK/MsggJ6QBiePVJPrWK
 TktqerO2Bp6CqHUJhEx1qbtwzB+dRhzxC0wC4yorLwb5S8jN8VUwVZobJ96bX8huwKajlOsEjEHU9GmJNIlWdlXIyMY26SnHHuthTMnkDzQE9WN9DP5YbvXh

On Mon, Nov 09, 2026 at 02:35:07PM +0100, Robert Marko wrote:
> LAN969x has a fan controller with a tachometer in a register block
> separate from its Sparx5-compatible temperature sensor. Match the fan
> node independently and expose fan1_input on its own hwmon device.
> 
> Read the optional pulses-per-revolution property from the fan child.
> Preserve the temperature-only behavior of existing device trees.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

I don't see the point of keeping this as single driver with two completely
different sets of functionality. If you want to have two instances, please
make it separate drivers.

Thanks,
Guenter

> ---
> Changes in v2:
> - Register fan and temperature monitoring as separate hwmon devices.
> - Reject a present but malformed pulses-per-revolution property.
> 
>  Documentation/hwmon/sparx5-temp.rst |   9 ++
>  drivers/hwmon/Kconfig               |   7 +-
>  drivers/hwmon/sparx5-temp.c         | 146 ++++++++++++++++++++++++----
>  3 files changed, 139 insertions(+), 23 deletions(-)
> 
> diff --git a/Documentation/hwmon/sparx5-temp.rst b/Documentation/hwmon/sparx5-temp.rst
> index 0140809089542..a053d12fbdbbb 100644
> --- a/Documentation/hwmon/sparx5-temp.rst
> +++ b/Documentation/hwmon/sparx5-temp.rst
> @@ -15,6 +15,10 @@ Supported chips:
>  
>  Author: Lars Povlsen <lars.povlsen@microchip.com>
>  
> +The driver also supports the Microchip LAN969x temperature sensor and fan
> +controller as separate devices. The fan controller uses the
> +microchip,lan9691-fan compatible.
> +
>  Description
>  -----------
>  
> @@ -30,4 +34,9 @@ The following attributes are supported.
>  
>  ======================= ========================================================
>  temp1_input		Die temperature (in millidegree Celsius.)
> +fan1_input              Fan speed in RPM (LAN969x only).

FWIW, this is misleading. One instance will support the temperature, a
separate hwmon device will support the fan. Really, if you want to have
two separate devices, make it two separate drivers.

>  ======================= ========================================================
> +
> +The tachometer counts pulses over one-second intervals, independently of the
> +PWM output. The fan child's pulses-per-revolution property specifies how many
> +pulses represent one revolution; it defaults to two.
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 3ae676a56d95c..deb9eb82b8501 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -669,11 +669,12 @@ config SENSORS_I5K_AMB
>  	  will be called i5k_amb.
>  
>  config SENSORS_SPARX5
> -	tristate "Sparx5 SoC temperature sensor"
> +	tristate "Sparx5 and LAN969x SoC hardware monitoring"
>  	depends on ARCH_SPARX5 || ARCH_LAN969X || COMPILE_TEST
>  	help
> -	  If you say yes here you get support for temperature monitoring
> -	  with the Microchip Sparx5 SoC.
> +	  If you say yes here you get support for temperature monitoring on
> +	  Microchip Sparx5 and LAN969x SoCs, as well as fan monitoring on
> +	  LAN969x SoCs.

Same here. Based on the description and the documentation, a user would not
expect to get two separate hardware monitoring devices.

>  
>  	  This driver can also be built as a module. If so, the module
>  	  will be called sparx5-temp.
> diff --git a/drivers/hwmon/sparx5-temp.c b/drivers/hwmon/sparx5-temp.c
> index 0fd5c147f8167..1f197004780cc 100644
> --- a/drivers/hwmon/sparx5-temp.c
> +++ b/drivers/hwmon/sparx5-temp.c
> @@ -9,8 +9,11 @@
>  #include <linux/hwmon.h>
>  #include <linux/init.h>
>  #include <linux/io.h>
> +#include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  
>  #define TEMP_CTRL		0
>  #define TEMP_CFG		4
> @@ -20,9 +23,26 @@
>  #define  TEMP_STAT_VALID	BIT(12)
>  #define  TEMP_STAT_TEMP		GENMASK(11, 0)
>  
> +#define FAN_CFG			0
> +#define  FAN_CFG_GATE_ENA	BIT(2)
> +#define  FAN_CFG_STAT_MODE	BIT(0)
> +#define FAN_PWM_FREQ		4
> +#define  FAN_PWM_FREQ_CYCLES	GENMASK(27, 16)
> +#define FAN_CNT			8
> +#define  FAN_CNT_DATA		GENMASK(15, 0)
> +
> +#define FAN_TACH_INTERVAL_HZ	100000
> +
> +struct s5_match_data {
> +	bool is_fan;
> +};
> +
>  struct s5_hwmon {
>  	void __iomem *base;
> +	void __iomem *fan;
>  	struct clk *clk;
> +	unsigned long clk_rate;
> +	u32 pulses_per_revolution;
>  };
>  
>  static void s5_temp_enable(struct s5_hwmon *hwmon)
> @@ -37,6 +57,24 @@ static void s5_temp_enable(struct s5_hwmon *hwmon)
>  	writel(val, hwmon->base + TEMP_CFG);
>  }
>  
> +static void s5_fan_enable(struct s5_hwmon *hwmon)
> +{
> +	u32 cycles, val;
> +
> +	cycles = DIV_ROUND_CLOSEST(hwmon->clk_rate, FAN_TACH_INTERVAL_HZ);
> +	cycles = clamp_val(cycles, 1, FIELD_MAX(FAN_PWM_FREQ_CYCLES));
> +
> +	val = readl(hwmon->fan + FAN_PWM_FREQ);
> +	val &= ~FAN_PWM_FREQ_CYCLES;
> +	val |= FIELD_PREP(FAN_PWM_FREQ_CYCLES, cycles);
> +	writel(val, hwmon->fan + FAN_PWM_FREQ);
> +
> +	/* Count all tachometer pulses over one-second intervals. */
> +	val = readl(hwmon->fan + FAN_CFG);
> +	val &= ~(FAN_CFG_STAT_MODE | FAN_CFG_GATE_ENA);
> +	writel(val, hwmon->fan + FAN_CFG);
> +}
> +
>  static int s5_read_temp(struct s5_hwmon *hwmon, long *temp)
>  {
>  	int value;
> @@ -62,6 +100,17 @@ static int s5_read_temp(struct s5_hwmon *hwmon, long *temp)
>  	return 0;
>  }
>  
> +static int s5_read_fan(struct s5_hwmon *hwmon, long *val)
> +{
> +	u32 count;
> +
> +	count = readl_relaxed(hwmon->fan + FAN_CNT);
> +	count = FIELD_GET(FAN_CNT_DATA, count);
> +	*val = count * 60 / hwmon->pulses_per_revolution;
> +
> +	return 0;
> +}
> +
>  static int s5_read(struct device *dev, enum hwmon_sensor_types type,
>  		   u32 attr, int channel, long *val)
>  {
> @@ -72,6 +121,10 @@ static int s5_read(struct device *dev, enum hwmon_sensor_types type,
>  		if (attr == hwmon_temp_input)
>  			return s5_read_temp(hwmon, val);
>  		break;
> +	case hwmon_fan:
> +		if (attr == hwmon_fan_input && hwmon->fan)
> +			return s5_read_fan(hwmon, val);
> +		break;
>  	default:
>  		break;
>  	}
> @@ -82,62 +135,115 @@ static int s5_read(struct device *dev, enum hwmon_sensor_types type,
>  static umode_t s5_is_visible(const void *_data, enum hwmon_sensor_types type,
>  			     u32 attr, int channel)
>  {
> -	if (type != hwmon_temp)
> -		return 0;
> +	const struct s5_hwmon *hwmon = _data;
>  
> -	switch (attr) {
> -	case hwmon_temp_input:
> -		return 0444;
> +	switch (type) {
> +	case hwmon_temp:
> +		return attr == hwmon_temp_input ? 0444 : 0;
> +	case hwmon_fan:
> +		if (hwmon->fan && attr == hwmon_fan_input)
> +			return 0444;
> +		return 0;
>  	default:
>  		return 0;
>  	}
>  }
>  
> -static const struct hwmon_channel_info * const s5_info[] = {
> +static const struct hwmon_channel_info * const s5_temp_info[] = {
>  	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
>  	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
>  	NULL
>  };
>  
> +static const struct hwmon_channel_info * const s5_fan_info[] = {
> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
> +	NULL
> +};
> +
>  static const struct hwmon_ops s5_hwmon_ops = {
>  	.is_visible = s5_is_visible,
>  	.read = s5_read,
>  };
>  
> -static const struct hwmon_chip_info s5_chip_info = {
> +static const struct hwmon_chip_info s5_temp_chip_info = {
>  	.ops = &s5_hwmon_ops,
> -	.info = s5_info,
> +	.info = s5_temp_info,
> +};
> +
> +static const struct hwmon_chip_info s5_fan_chip_info = {
> +	.ops = &s5_hwmon_ops,
> +	.info = s5_fan_info,
>  };
>  
>  static int s5_temp_probe(struct platform_device *pdev)
>  {
> +	const struct s5_match_data *match_data;
> +	struct device *dev = &pdev->dev;
>  	struct device *hwmon_dev;
>  	struct s5_hwmon *hwmon;
> +	struct device_node *fan_np __free(device_node) = NULL;
> +	void __iomem *base;
> +	bool is_fan;
> +	int ret;
>  
> -	hwmon = devm_kzalloc(&pdev->dev, sizeof(*hwmon), GFP_KERNEL);
> +	match_data = device_get_match_data(dev);
> +	is_fan = match_data && match_data->is_fan;
> +
> +	hwmon = devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
>  	if (!hwmon)
>  		return -ENOMEM;
>  
> -	hwmon->base = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(hwmon->base))
> -		return PTR_ERR(hwmon->base);
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	if (is_fan) {
> +		hwmon->fan = base;
> +		hwmon->pulses_per_revolution = 2;
> +		fan_np = of_get_available_child_by_name(dev->of_node, "fan");
> +		if (fan_np &&
> +		    of_property_present(fan_np, "pulses-per-revolution")) {
> +			ret = of_property_read_u32(fan_np, "pulses-per-revolution",
> +						   &hwmon->pulses_per_revolution);
> +			if (ret)
> +				return dev_err_probe(dev, ret,
> +						     "invalid pulses-per-revolution\n");
> +		}
> +		if (!hwmon->pulses_per_revolution ||
> +		    hwmon->pulses_per_revolution > 4)
> +			return dev_err_probe(dev, -EINVAL,
> +					     "invalid pulses-per-revolution\n");
> +	} else {
> +		hwmon->base = base;
> +	}
>  
> -	hwmon->clk = devm_clk_get_enabled(&pdev->dev, NULL);
> +	hwmon->clk = devm_clk_get_enabled(dev, NULL);
>  	if (IS_ERR(hwmon->clk))
>  		return PTR_ERR(hwmon->clk);
> +	hwmon->clk_rate = clk_get_rate(hwmon->clk);
>  
> -	s5_temp_enable(hwmon);
> +	if (is_fan)
> +		s5_fan_enable(hwmon);
> +	else
> +		s5_temp_enable(hwmon);
>  
> -	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
> -							 "s5_temp",
> -							 hwmon,
> -							 &s5_chip_info,
> -							 NULL);
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev,
> +					is_fan ? "lan969x_fan" : "s5_temp", hwmon,
> +					is_fan ? &s5_fan_chip_info :
> +						 &s5_temp_chip_info, NULL);
>  
>  	return PTR_ERR_OR_ZERO(hwmon_dev);
>  }
>  
> +static const struct s5_match_data lan969x_fan_match_data = {
> +	.is_fan = true,
> +};
> +
>  static const struct of_device_id s5_temp_match[] = {
> +	{
> +		.compatible = "microchip,lan9691-fan",
> +		.data = &lan969x_fan_match_data,
> +	},
>  	{ .compatible = "microchip,sparx5-temp" },
>  	{},
>  };
> @@ -154,5 +260,5 @@ static struct platform_driver s5_temp_driver = {
>  module_platform_driver(s5_temp_driver);
>  
>  MODULE_AUTHOR("Lars Povlsen <lars.povlsen@microchip.com>");
> -MODULE_DESCRIPTION("Sparx5 SoC temperature sensor driver");
> +MODULE_DESCRIPTION("Sparx5 SoC hardware monitoring driver");
>  MODULE_LICENSE("GPL");
