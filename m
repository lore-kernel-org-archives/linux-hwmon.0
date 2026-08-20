Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8D838757A
	for <linux-hwmon@vger.kernel.org>; Thu, 20 Aug 2026 04:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787201840; cv=none; b=gmq0E+V8OmaeZ7aGYET6uAfoMLW/xUoKEbuRnbqj+W5eC7LWMLcQie+r3fqvv3vIi6wfMF5Kcl3odWB1ec0tjltTFPOvBWQhzxwbfIMe/Rk1uwGyLe1regrCxCilwyFhk7Bt3zYyw0igsdoPklGaTtVENkU5YXbDnLoTl1fPXQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787201840; c=relaxed/simple;
	bh=qafYtsmai3IkLm2TivW5bxUwxjG5ELXA+P5vfaqBV4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FCw/7iEZkJr+VnUaK/XQJ5gLqICphlw/NNNsjBcx17rlyWoVktsJYo6mM8bq1Zwmf2FnRHEwPKxWeZkkwdOSMB64Pmc0jUiGFn8AxPjChEZwlwnAPjsmDIxlKhp55CS5Wx1cqUUgTzgenO8ch8Ma3OvOL5c/xdGZoClal7KTCtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nfE31Fqd; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nfE31Fqd"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so997653a12.2
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Aug 2026 21:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787201837; x=1787806637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2KTVeqO5oz0Ec0zuEdP3whSNxqddIwjvBn/fVV7ajYU=;
        b=nfE31FqddjkR7TMnunZWMWZgEToNEr3sXz01ut+ypUlrz45boqqfVkViSrwd8IQ59C
         CbVEB9xh0MI4WkXQAAt0OGEU4CIZsao1oiooZp2SS7ZUpTtn9bPGwnojKomw9I+dOiTt
         GarBW9mqomx8aKcHkiO89HYIIV9WxQt6RBh7JhIuMh5KnGX/b+NXX4WTNsTpUAjTkylM
         hs05jFBZtGScZmfFk6vt6Peh+z8A+isIbS8YupQiWRTpgEhMki+eGYd9nkoKCwxkn1Ql
         2bbAq4W0w3y+KdeTfqFa+z2PlUHzRO8sFvLvCkFTtNO9Hu13V0fAYwZ3e0wXAQarqaS+
         qkqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787201837; x=1787806637;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2KTVeqO5oz0Ec0zuEdP3whSNxqddIwjvBn/fVV7ajYU=;
        b=SyLptAmtQ4xJiKfWcQa1M6s0nB3k8ntm5FTMXQoxgZTA1wOWK5eOF4MhwNF+dNYcGO
         ONZWwcrneyWERnPoM8U7Sd6+GDHaiapklhCHsNfv9lrrEgqeFZygKAfD9MRzHoRZ8h0M
         tW0XzRr7cE2Q7EmKTTdNSZ+lRTMjZYlbZKytckDfHPfC8F3ouZV11qS69MS/ijDBvXAc
         OV6vla1+Dr8O/S2lR+3iZmda3NkB3EyGsTSeD3iyhZUKD7l9eyrJgMrt+TnNrN0DmQO1
         jDQWYxK/6bcD9m3o66hXCadFJ6tODCwMqs/eZmVMA4CiNK/KRSrosuEpxcusMv/Q6HeO
         i9KQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrb9nivWBlwe09o1aWmv1AsGXnwMb+kqch3x08AkYg70aD/PcgewsCwY4RXAuM7v3Updd8nFSLb6xLfDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLpUypIYpUnOmj3sbadk9rhR8QnugVTVScBXWfFnx7aDUfcLVH
	idBgmSj6mw0T9+rBC802M7/r6XNysoy37EcB97aWJNqPVEA2P6r3xWe9
X-Gm-Gg: AR+sD13DW4Y3VB6J3ovHuqLF4ixA54C699FDPJ35KT6ABhSXfB1CGghvtuAdPDY3qud
	jVcqXGPywkHLf6YP5RHye9O6XrUphhvmKFmwzb8RXfPjIuhS5O8jw4OAEBnsLrVdXmwLabLrY/G
	yEIqUkx3o39Oiu4he3PkLu8FGgVs3u4iP2WGe+8uPJ7qZJ/6B9c3hCPnkWNDY64jmJLqDgSj9b1
	B+z1m9YchW3cornVdrl6mebVuyW96NUTGUyVIHkxOH2hY189ISUqt/8J6icNJNcvx6ejAJbjhui
	vnyjg25y/Qf4MniPBMCZWqJHzN8ieSdsfZ4s+K2EyliehfjXjQAakWfWWPMTCdieIzAOYtOnT4E
	5S6SFwQfACSIZidjooBFk0NWc+pqrJ8PiDHTTE/27cYq4XDo9oZfV1pwLS+aSi+yja7zJVzvB5r
	MPBExecGC1Oaobdydk3t9v2tmYlXtXzxzxMJEE+K3RHzTTC+chsq87mVVvtWyxpb3F9vlX9l7g5
	K4LEkNTEsBmyOKMhxI4GKqfJYyA42eOCL6eng==
X-Received: by 2002:a05:6a20:9151:b0:3c4:3112:3b with SMTP id adf61e73a8af0-3cd0137c8e3mr14930707637.18.1787201836838;
        Wed, 19 Aug 2026 21:57:16 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef77be3sm12179683eec.10.2026.08.19.21.57.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 21:57:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <033d3490-9848-436f-a7ad-e6ab73768031@roeck-us.net>
Date: Wed, 19 Aug 2026 21:57:15 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hwmon: (starfive-fan-tach) Add fan tach driver for
 StarFive JHB100
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260819091601.41077-1-changhuang.liang@starfivetech.com>
 <20260819091601.41077-3-changhuang.liang@starfivetech.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260819091601.41077-3-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/19/26 02:16, Changhuang Liang wrote:
> Add fan tach driver for StarFive JHB100 SoC.
> 
> The controller supports up to 16 independent fan tachometer inputs and
> reports fan speed in RPM through the hwmon sysfs interface, along with
> stall and low-speed alarms.
> 
> For this controller, the special clock and reset operation sequence is:
>    probe: clk_prepare_enable() than reset_control_deassert()
>    remove: clk_disable_unprepare() than reset_control_assert()

s/than/then/

> 
> Co-developed-by: William Qiu <william.qiu@starfivetech.com>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>   Documentation/hwmon/index.rst             |   1 +
>   Documentation/hwmon/starfive-fan-tach.rst |  34 ++
>   MAINTAINERS                               |   8 +
>   drivers/hwmon/Kconfig                     |  14 +
>   drivers/hwmon/Makefile                    |   1 +
>   drivers/hwmon/starfive-fan-tach.c         | 561 ++++++++++++++++++++++
>   6 files changed, 619 insertions(+)
>   create mode 100644 Documentation/hwmon/starfive-fan-tach.rst
>   create mode 100644 drivers/hwmon/starfive-fan-tach.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 29130df44d12..0d64e4cf1051 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -253,6 +253,7 @@ Hardware Monitoring Kernel Drivers
>      smsc47m1
>      sparx5-temp
>      spd5118
> +   starfive-fan-tach
>      stpddc60
>      surface_fan
>      sy7636a-hwmon
> diff --git a/Documentation/hwmon/starfive-fan-tach.rst b/Documentation/hwmon/starfive-fan-tach.rst
> new file mode 100644
> index 000000000000..5ca03b52ad58
> --- /dev/null
> +++ b/Documentation/hwmon/starfive-fan-tach.rst
> @@ -0,0 +1,34 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver starfive-fan-tach
> +===============================
> +
> +Supported chips:
> +
> +  * StarFive JHB100
> +
> +    Prefix: 'starfive_fan_tach'
> +
> +    Addresses scanned: -
> +
> +Authors:
> +      - Changhuang Liang <changhuang.liang@starfivetech.com>
> +
> +Description
> +-----------
> +
> +This driver implements support for the fan tachometer controller found on
> +the StarFive JHB100 SoC. The controller supports up to 16 independent fan
> +tachometer inputs. Each tachometer channel measures the number of pulses
> +within a fixed 100 ms window.
> +
> +Sysfs entries
> +-------------
> +
> +==================== =======================================================
> +fan[1-16]_input      Fan speed in RPM (read-only)
> +fan[1-16]_min        Lower fan speed limit in RPM (read/write)
> +fan[1-16]_enable     Enable/disable the tachometer channel (read/write)
> +fan[1-16]_fault      Fan stall indication (read-only)
> +fan[1-16]_min_alarm  Fan speed below fan[1-16]_min (read-only)
> +==================== =======================================================
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c545aa121d51..83318d2e3e2e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25897,6 +25897,14 @@ S:	Supported
>   F:	Documentation/devicetree/bindings/interrupt-controller/starfive,jhb100-intc.yaml
>   F:	drivers/irqchip/irq-starfive-jhb100-intc.c
>   
> +STARFIVE JHB100 FAN-TACH DRIVER
> +M:	Changhuang Liang <changhuang.liang@starfivetech.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Supported
> +F:	Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tach.yaml
> +F:	Documentation/hwmon/starfive-fan-tach.rst
> +F:	drivers/hwmon/starfive-fan-tach.c
> +
>   STATIC BRANCH/CALL
>   M:	Peter Zijlstra <peterz@infradead.org>
>   M:	Josh Poimboeuf <jpoimboe@kernel.org>
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 5c2d3ff5fce8..2c0000f8e777 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2383,6 +2383,20 @@ config SENSORS_SPD5118_DETECT
>   
>   	  If unsure, say Y.
>   
> +config SENSORS_STARFIVE_FAN_TACH
> +	tristate "StarFive Fan-Tach driver"
> +	depends on ARCH_STARFIVE || COMPILE_TEST
> +	depends on HAS_IOMEM
> +	help
> +	  This driver provides support for the fan tachometer controller
> +	  found on StarFive SoCs such as the JHB100. The controller supports
> +	  up to 16 independent fan tachometer inputs and reports fan speed
> +	  in RPM through the hwmon sysfs interface, along with stall and
> +	  low-speed alarms.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called starfive-fan-tach.
> +
>   config SENSORS_TC74
>   	tristate "Microchip TC74"
>   	depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 63effc0ab8d1..80b2704b94e5 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -223,6 +223,7 @@ obj-$(CONFIG_SENSORS_SMSC47M1)	+= smsc47m1.o
>   obj-$(CONFIG_SENSORS_SMSC47M192)+= smsc47m192.o
>   obj-$(CONFIG_SENSORS_SPARX5)	+= sparx5-temp.o
>   obj-$(CONFIG_SENSORS_SPD5118)	+= spd5118.o
> +obj-$(CONFIG_SENSORS_STARFIVE_FAN_TACH)	+= starfive-fan-tach.o
>   obj-$(CONFIG_SENSORS_STTS751)	+= stts751.o
>   obj-$(CONFIG_SENSORS_SURFACE_FAN)+= surface_fan.o
>   obj-$(CONFIG_SENSORS_SURFACE_TEMP)+= surface_temp.o
> diff --git a/drivers/hwmon/starfive-fan-tach.c b/drivers/hwmon/starfive-fan-tach.c
> new file mode 100644
> index 000000000000..1e6399db424d
> --- /dev/null
> +++ b/drivers/hwmon/starfive-fan-tach.c
> @@ -0,0 +1,561 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * FAN-TACH controller driver for StarFive JHB100
> + *
> + * Copyright (C) 2018-2026 StarFive Technology Co., Ltd.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/completion.h>
> +#include <linux/delay.h>
> +#include <linux/errno.h>
> +#include <linux/hwmon.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/jiffies.h>
> +#include <linux/kernel.h>
> +#include <linux/math64.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +#include <linux/spinlock.h>
> +
> +#define STARFIVE_FAN_TACH_CH			16
> +
> +/* Fan-tach register offest */
> +#define STARFIVE_FAN_TACH_STATUS		0x0c
> +
> +#define STARFIVE_FAN_TACH_SPEED(ch)		(((ch) * 0x04) + 0x10)
> +#define STARFIVE_FAN_TACH_SPEED_VALID		BIT(31)
> +#define STARFIVE_FAN_TACH_VALUE_MASK		GENMASK(30, 0)
> +
> +#define STARFIVE_FAN_TACH_THRESHOLD(ch)		(((ch) * 0x04) + 0x50)
> +
> +#define STARFIVE_FAN_TACH_INT_EN		0x90
> +#define STARFIVE_FAN_TACH_STALL_INT_MASK	GENMASK(15, 0)
> +#define STARFIVE_FAN_TACH_SLOW_INT_MASK		GENMASK(31, 16)
> +#define STARFIVE_FAN_TACH_STALL_INT(ch)		BIT(ch)
> +#define STARFIVE_FAN_TACH_SLOW_INT(ch)		(BIT(ch) << 16)
> +
> +#define STARFIVE_FAN_TACH_MEASURE_TIME		0x94
> +
> +#define STARFIVE_FAN_TACH_CH_EN			0x98
> +#define STARFIVE_FAN_TACH_EN(ch)		BIT(ch)
> +
> +#define STARFIVE_FAN_DEFAULT_PULSE_PR		2
> +#define STARFIVE_FAN_DEFAULT_MEASURE_RATIO	10
> +#define STARFIVE_FAN_DEFAULT_RPM_PAUSE_TIME	(60 * STARFIVE_FAN_DEFAULT_MEASURE_RATIO)
> +
> +#define STARFIVE_FAN_TACH_TIMEOUT \
> +	(USEC_PER_SEC / STARFIVE_FAN_DEFAULT_MEASURE_RATIO)
> +
> +#define STARFIVE_FAN_TACH_TIMEOUT_JIFFIES \
> +	(msecs_to_jiffies(1000) / STARFIVE_FAN_DEFAULT_MEASURE_RATIO)
> +
> +#define FAN_ATTRIBUTE_SET \
> +	(HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_ENABLE | \
> +	 HWMON_F_FAULT | HWMON_F_MIN_ALARM)
> +
> +struct starfive_fan_tach_data {
> +	struct device *dev;
> +	/*
> +	 * Serialises the read-modify-write sequences on CH_EN and INT_EN,
> +	 * and the arm/disarm window of the fault/min_alarm read paths.
> +	 */
> +	struct mutex lock;

I don't see why this would be needed on top of the hwmon subsystem lock.

> +	void __iomem *regs;
> +	struct reset_control *rst;
> +	struct clk *clk;
> +	bool tach_present[STARFIVE_FAN_TACH_CH];
> +	unsigned long clk_rate; /* APB clock frequency */
> +	u8 pulses_per_rev[STARFIVE_FAN_TACH_CH];
> +	struct completion comp_stall[STARFIVE_FAN_TACH_CH];
> +	struct completion comp_slow[STARFIVE_FAN_TACH_CH];
> +	u8 fan_stall[STARFIVE_FAN_TACH_CH];
> +	u8 fan_slow[STARFIVE_FAN_TACH_CH];
> +	u32 armed_stall;
> +	u32 armed_slow;
> +	/* protects fan_stall[]/fan_slow[]/armed_* and the STATUS register */
> +	spinlock_t irq_lock;
> +};
> +
> +static void starfive_fan_tach_ch_enable(struct starfive_fan_tach_data *priv, u8 tach_ch,
> +					bool enable)
> +{
> +	if (enable) {
> +		writel(readl(priv->regs + STARFIVE_FAN_TACH_CH_EN) |
> +		       STARFIVE_FAN_TACH_EN(tach_ch),
> +		       priv->regs + STARFIVE_FAN_TACH_CH_EN);
> +	} else {
> +		writel(readl(priv->regs + STARFIVE_FAN_TACH_CH_EN) &
> +		       ~(STARFIVE_FAN_TACH_EN(tach_ch)),
> +		       priv->regs + STARFIVE_FAN_TACH_CH_EN);
> +	}
> +}
> +
> +static void starfive_fan_tach_ch_stall_unmask(struct starfive_fan_tach_data *priv, u8 tach_ch,
> +					      bool unmask)
> +{
> +	if (unmask) {
> +		writel(readl(priv->regs + STARFIVE_FAN_TACH_INT_EN) |
> +		       STARFIVE_FAN_TACH_STALL_INT(tach_ch),
> +		       priv->regs + STARFIVE_FAN_TACH_INT_EN);
> +	} else {
> +		writel(readl(priv->regs + STARFIVE_FAN_TACH_INT_EN) &
> +		       ~STARFIVE_FAN_TACH_STALL_INT(tach_ch),
> +		       priv->regs + STARFIVE_FAN_TACH_INT_EN);
> +	}
> +}
> +
> +static void starfive_fan_tach_ch_slow_unmask(struct starfive_fan_tach_data *priv, u8 tach_ch,
> +					     bool unmask)
> +{
> +	if (unmask) {
> +		writel(readl(priv->regs + STARFIVE_FAN_TACH_INT_EN) |
> +		       STARFIVE_FAN_TACH_SLOW_INT(tach_ch),
> +		       priv->regs + STARFIVE_FAN_TACH_INT_EN);
> +	} else {
> +		writel(readl(priv->regs + STARFIVE_FAN_TACH_INT_EN) &
> +		       ~STARFIVE_FAN_TACH_SLOW_INT(tach_ch),
> +		       priv->regs + STARFIVE_FAN_TACH_INT_EN);
> +	}
> +}
> +
> +static u32 starfive_fan_tach_rpm_to_val(struct starfive_fan_tach_data *priv, u8 tach_ch, u32 rpm)
> +{
> +	u64 tach_val;
> +	u8 ppr;
> +
> +	ppr = priv->pulses_per_rev[tach_ch];
> +
> +	tach_val = (u64)rpm * ppr;
> +	tach_val = div_u64(tach_val, STARFIVE_FAN_DEFAULT_RPM_PAUSE_TIME);
> +
> +	return min_t(u64, tach_val, STARFIVE_FAN_TACH_VALUE_MASK);
> +}
> +
> +static long starfive_fan_tach_val_to_rpm(struct starfive_fan_tach_data *priv, u8 tach_ch,
> +					 u32 tach_val)
> +{
> +	u64 rpm;
> +	u8 ppr;
> +
> +	ppr = priv->pulses_per_rev[tach_ch];
> +
> +	rpm = (u64)tach_val * STARFIVE_FAN_DEFAULT_RPM_PAUSE_TIME;
> +
> +	return div_u64(rpm, ppr);
> +}
> +
> +static int starfive_fan_tach_get_rpm(struct starfive_fan_tach_data *priv,
> +				     u8 tach_ch, long *rpm)
> +{
> +	u32 val;
> +	int ret;
> +
> +	ret = readl_poll_timeout(priv->regs + STARFIVE_FAN_TACH_SPEED(tach_ch),
> +				 val, val & STARFIVE_FAN_TACH_SPEED_VALID,
> +				 100, STARFIVE_FAN_TACH_TIMEOUT);
> +	if (ret)
> +		return -ENODATA;
> +
> +	val = FIELD_GET(STARFIVE_FAN_TACH_VALUE_MASK, val);
> +	if (!val) {
> +		/* Sampling = 0 may mean no valid capture; wait 1.5 more cycles for valid read. */
> +		fsleep(STARFIVE_FAN_TACH_TIMEOUT + STARFIVE_FAN_TACH_TIMEOUT / 2);
> +		ret = readl_poll_timeout(priv->regs + STARFIVE_FAN_TACH_SPEED(tach_ch),
> +					 val, val & STARFIVE_FAN_TACH_SPEED_VALID,
> +					 100, STARFIVE_FAN_TACH_TIMEOUT);
> +		if (ret)
> +			return -ENODATA;
> +
> +		val = FIELD_GET(STARFIVE_FAN_TACH_VALUE_MASK, val);
> +	}
> +
> +	*rpm = starfive_fan_tach_val_to_rpm(priv, tach_ch, val);
> +
> +	return 0;
> +}
> +
> +static long starfive_fan_tach_get_rpm_threshold(struct starfive_fan_tach_data *priv,
> +						u8 tach_ch)
> +{
> +	u32 val;
> +
> +	val = readl(priv->regs + STARFIVE_FAN_TACH_THRESHOLD(tach_ch));
> +
> +	val = FIELD_GET(STARFIVE_FAN_TACH_VALUE_MASK, val);
> +
> +	return starfive_fan_tach_val_to_rpm(priv, tach_ch, val);
> +}
> +
> +static void starfive_set_tach_rpm_threshold(struct starfive_fan_tach_data *priv,
> +					    u8 tach_ch, u32 val)
> +{
> +	u32 reg_val;
> +
> +	reg_val = starfive_fan_tach_rpm_to_val(priv, tach_ch, val);
> +	reg_val = clamp_val(reg_val, 1, STARFIVE_FAN_TACH_VALUE_MASK);
> +
> +	writel(reg_val, priv->regs + STARFIVE_FAN_TACH_THRESHOLD(tach_ch));
> +}
> +
> +static int starfive_fan_tach_get_ch_en(struct starfive_fan_tach_data *priv,
> +				       u8 tach_ch)

Why not bool ?

> +{
> +	u32 enable;
> +
> +	enable = readl(priv->regs + STARFIVE_FAN_TACH_CH_EN);
> +
> +	return (enable & (1 << tach_ch)) ? 1 : 0;

	return !!(enable & STARFIVE_FAN_TACH_EN(tach_ch));

> +}
> +
> +static int starfive_fan_tach_hwmon_read(struct device *dev,
> +					enum hwmon_sensor_types type, u32 attr,
> +					int channel, long *val)
> +{
> +	struct starfive_fan_tach_data *priv = dev_get_drvdata(dev);
> +	int ret = 0;
> +
> +	switch (attr) {
> +	case hwmon_fan_fault:
> +		scoped_guard(mutex, &priv->lock) {
> +			scoped_guard(spinlock_irqsave, &priv->irq_lock) {
> +				writel(STARFIVE_FAN_TACH_STALL_INT(channel),
> +				       priv->regs + STARFIVE_FAN_TACH_STATUS);
> +				/* clear fan_stall first */
> +				priv->fan_stall[channel] = 0;
> +				reinit_completion(&priv->comp_stall[channel]);
> +				priv->armed_stall |= BIT(channel);
> +			}
> +
> +			starfive_fan_tach_ch_stall_unmask(priv, channel, true);
> +
> +			/* Waiting for hardware to measure */
> +			wait_for_completion_timeout(&priv->comp_stall[channel],
> +						    2 * STARFIVE_FAN_TACH_TIMEOUT_JIFFIES);
> +
> +			starfive_fan_tach_ch_stall_unmask(priv, channel, false);
> +
> +			scoped_guard(spinlock_irqsave, &priv->irq_lock) {
> +				priv->armed_stall &= ~BIT(channel);
> +				*val = priv->fan_stall[channel];
> +			}
> +		}
> +

I'd really be interested to see how long it takes to read the alarm
and fault status of all fans. And, yes, Sashiko has a point: the attributes
are supported to report a sticky status, not something that is calculated
on the fly. Is this based on some heuristics ? I don't claim to understand
how fault and min_alarm are calculated. A comment in the code describing
how this works would be helpful.

> +		break;
> +	case hwmon_fan_input:
> +		ret = starfive_fan_tach_get_ch_en(priv, channel);
> +		if (!ret)
> +			return -ENODATA;

I don't see why the assignment to ret would add value here.

		if (!starfive_fan_tach_get_ch_en(priv, channel))
			return -ENODATA;

> +
> +		ret = starfive_fan_tach_get_rpm(priv, channel, val);
> +		if (ret < 0)
> +			return ret;
> +
> +		break;
> +	case hwmon_fan_min:
> +		*val = starfive_fan_tach_get_rpm_threshold(priv, channel);
> +
> +		break;
> +	case hwmon_fan_min_alarm:
> +		scoped_guard(mutex, &priv->lock) {
> +			scoped_guard(spinlock_irqsave, &priv->irq_lock) {
> +				writel(STARFIVE_FAN_TACH_SLOW_INT(channel),
> +				       priv->regs + STARFIVE_FAN_TACH_STATUS);
> +				/* clear fan_slow first */
> +				priv->fan_slow[channel] = 0;
> +				reinit_completion(&priv->comp_slow[channel]);
> +				priv->armed_slow |= BIT(channel);
> +			}
> +
> +			starfive_fan_tach_ch_slow_unmask(priv, channel, true);
> +
> +			/* Waiting for hardware to measure */
> +			wait_for_completion_timeout(&priv->comp_slow[channel],
> +						    2 * STARFIVE_FAN_TACH_TIMEOUT_JIFFIES);
> +
> +			starfive_fan_tach_ch_slow_unmask(priv, channel, false);
> +
> +			scoped_guard(spinlock_irqsave, &priv->irq_lock) {
> +				priv->armed_slow &= ~BIT(channel);
> +				*val = priv->fan_slow[channel];
> +			}
> +		}
> +
> +		break;
> +	case hwmon_fan_enable:
> +		*val = starfive_fan_tach_get_ch_en(priv, channel);
> +
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static int starfive_fan_tach_hwmon_write(struct device *dev,
> +					 enum hwmon_sensor_types type, u32 attr,
> +					 int channel, long val)
> +{
> +	struct starfive_fan_tach_data *priv = dev_get_drvdata(dev);
> +
> +	guard(mutex)(&priv->lock);
> +
> +	switch (attr) {
> +	case hwmon_fan_min:
> +		if (val < 0 || val > U32_MAX)
> +			return -EINVAL;
> +
> +		starfive_set_tach_rpm_threshold(priv, channel, val);
> +		break;
> +	case hwmon_fan_enable:
> +		if (val != 0 && val != 1)
> +			return -EINVAL;
> +
> +		starfive_fan_tach_ch_enable(priv, channel, val);
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static umode_t starfive_fan_tach_dev_is_visible(const void *drvdata,
> +						enum hwmon_sensor_types type,
> +						u32 attr, int channel)
> +{
> +	const struct starfive_fan_tach_data *priv = drvdata;
> +
> +	if (!priv->tach_present[channel])
> +		return 0;
> +
> +	switch (attr) {
> +	case hwmon_fan_input:
> +	case hwmon_fan_fault:
> +	case hwmon_fan_min_alarm:
> +		return 0444;
> +	case hwmon_fan_min:
> +	case hwmon_fan_enable:
> +		return 0644;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct hwmon_ops starfive_fan_tach_ops = {
> +	.is_visible = starfive_fan_tach_dev_is_visible,
> +	.read = starfive_fan_tach_hwmon_read,
> +	.write = starfive_fan_tach_hwmon_write
> +};
> +
> +static const struct hwmon_channel_info *starfive_fan_tach_info[] = {
> +	HWMON_CHANNEL_INFO(fan,
> +			   FAN_ATTRIBUTE_SET, FAN_ATTRIBUTE_SET,
> +			   FAN_ATTRIBUTE_SET, FAN_ATTRIBUTE_SET,
> +			   FAN_ATTRIBUTE_SET, FAN_ATTRIBUTE_SET,
> +			   FAN_ATTRIBUTE_SET, FAN_ATTRIBUTE_SET,
> +			   FAN_ATTRIBUTE_SET, FAN_ATTRIBUTE_SET,
> +			   FAN_ATTRIBUTE_SET, FAN_ATTRIBUTE_SET,
> +			   FAN_ATTRIBUTE_SET, FAN_ATTRIBUTE_SET,
> +			   FAN_ATTRIBUTE_SET, FAN_ATTRIBUTE_SET),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info starfive_fan_tach_chip_info = {
> +	.ops = &starfive_fan_tach_ops,
> +	.info = starfive_fan_tach_info,
> +};
> +
> +static int starfive_fan_tach_create_fan(struct device *dev, struct device_node *child,
> +					struct starfive_fan_tach_data *priv)
> +{
> +	u8 tach_ch[STARFIVE_FAN_TACH_CH];
> +	int ret, count;
> +	u32 ppr, index;
> +
> +	count = of_property_count_u8_elems(child, "tach-ch");
> +	if (count < 1 || count > STARFIVE_FAN_TACH_CH)
> +		return -EINVAL;
> +
> +	ret = of_property_read_u8_array(child, "tach-ch", tach_ch, count);
> +	if (ret)
> +		return ret;
> +
> +	/* Parse pulses-per-revolution, default to 2 if not specified */
> +	ppr = STARFIVE_FAN_DEFAULT_PULSE_PR;
> +	of_property_read_u32(child, "pulses-per-revolution", &ppr);
> +
> +	if (!ppr || ppr > 4) {
> +		dev_err(dev, "Invalid pulses-per-revolution %u, must be 1-4\n", ppr);
> +		return -EINVAL;
> +	}
> +
> +	for (index = 0; index < count; index++) {
> +		u8 ch = tach_ch[index];
> +
> +		if (ch >= STARFIVE_FAN_TACH_CH) {
> +			dev_warn(priv->dev, "Invalid tach-ch %d, skipping\n", ch);
> +			continue;

This should also return an error. Also, this is the only use of priv->dev,
and priv->dev == dev. priv->dev is therefore unnecessary.

> +		}
> +
> +		priv->pulses_per_rev[ch] = ppr;

What is the point of storing the same ppr value separately for each channel ?

> +		priv->tach_present[ch] = true;
> +		starfive_fan_tach_ch_enable(priv, ch, true);
> +	}
> +
> +	return 0;
> +}
> +
> +static irqreturn_t starfive_fan_tach_irq(int irq, void *dev_id)
> +{
> +	struct starfive_fan_tach_data *priv = dev_id;
> +	u32 fan_status;
> +	int i;
> +
> +	guard(spinlock)(&priv->irq_lock);
> +
> +	fan_status = readl(priv->regs + STARFIVE_FAN_TACH_STATUS);
> +	if (!fan_status)
> +		return IRQ_NONE;
> +
> +	writel(fan_status, priv->regs + STARFIVE_FAN_TACH_STATUS);
> +
> +	for (i = 0; i < STARFIVE_FAN_TACH_CH; i++) {
> +		if (!priv->tach_present[i])
> +			continue;
> +
> +		if ((fan_status & STARFIVE_FAN_TACH_STALL_INT(i)) &&
> +		    (priv->armed_stall & BIT(i))) {
> +			priv->fan_stall[i] = 1;
> +			complete(&priv->comp_stall[i]);
> +		}
> +
> +		if ((fan_status & STARFIVE_FAN_TACH_SLOW_INT(i)) &&
> +		    (priv->armed_slow & BIT(i))) {
> +			priv->fan_slow[i] = 1;
> +			complete(&priv->comp_slow[i]);
> +		}
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void starfive_fan_tach_disable(void *data)
> +{
> +	struct starfive_fan_tach_data *priv = data;
> +
> +	clk_disable_unprepare(priv->clk);
> +	reset_control_assert(priv->rst);
> +}
> +
> +static int starfive_fan_tach_probe(struct platform_device *pdev)
> +{
> +	struct device *hwmon_dev, *dev = &pdev->dev;
> +	struct starfive_fan_tach_data *priv;
> +	int irq;
> +	int ret;
> +	u32 i;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev = dev;
> +	spin_lock_init(&priv->irq_lock);
> +
> +	for (i = 0; i < STARFIVE_FAN_TACH_CH; i++) {
> +		init_completion(&priv->comp_stall[i]);
> +		init_completion(&priv->comp_slow[i]);
> +	}
> +
> +	priv->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->regs))
> +		return dev_err_probe(dev, PTR_ERR(priv->regs),
> +				     "Unable to map IO resources\n");
> +
> +	priv->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(priv->clk))
> +		return dev_err_probe(dev, PTR_ERR(priv->clk),
> +				     "Unable to get fan tach's clock\n");
> +
> +	priv->rst = devm_reset_control_get_exclusive(dev, NULL);
> +	if (IS_ERR(priv->rst))
> +		return dev_err_probe(dev, PTR_ERR(priv->rst),
> +				     "Unable to get fan tach's reset\n");
> +
> +	ret = clk_prepare_enable(priv->clk);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable clock\n");
> +
> +	priv->clk_rate = clk_get_rate(priv->clk);
> +	if (!priv->clk_rate) {
> +		clk_disable_unprepare(priv->clk);
> +		return dev_err_probe(dev, -EINVAL, "Unable to get clock's rate\n");
> +	}
> +
> +	ret = reset_control_deassert(priv->rst);
> +	if (ret) {
> +		clk_disable_unprepare(priv->clk);
> +		return dev_err_probe(dev, ret, "Failed to deassert reset\n");
> +	}
> +
> +	ret = devm_add_action_or_reset(dev, starfive_fan_tach_disable, priv);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_mutex_init(dev, &priv->lock);
> +	if (ret)
> +		return ret;
> +
> +	writel(STARFIVE_FAN_TACH_STALL_INT_MASK | STARFIVE_FAN_TACH_SLOW_INT_MASK,
> +	       priv->regs + STARFIVE_FAN_TACH_STATUS);
> +	writel(priv->clk_rate / STARFIVE_FAN_DEFAULT_MEASURE_RATIO,
> +	       priv->regs + STARFIVE_FAN_TACH_MEASURE_TIME);
> +
> +	for_each_child_of_node_scoped(dev->of_node, child) {
> +		ret = starfive_fan_tach_create_fan(dev, child, priv);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Failed to create fan %pOF\n", child);
> +	}
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return dev_err_probe(dev, irq, "Failed to get IRQ\n");
> +
> +	ret = devm_request_irq(dev, irq, starfive_fan_tach_irq, 0, pdev->name, priv);
> +	if (ret)
> +		return ret;
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, "starfive_fan_tach",
> +							 priv, &starfive_fan_tach_chip_info,
> +							 NULL);
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static const struct of_device_id starfive_fan_tach_of_match[] = {
> +	{ .compatible = "starfive,jhb100-fan-tach", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, starfive_fan_tach_of_match);
> +
> +static struct platform_driver starfive_fan_tach_driver = {
> +	.probe = starfive_fan_tach_probe,
> +	.driver	= {
> +		.name = "starfive-fan-tach",
> +		.of_match_table = starfive_fan_tach_of_match,
> +	},
> +};
> +
> +module_platform_driver(starfive_fan_tach_driver);
> +
> +MODULE_AUTHOR("William Qiu <william.qiu@starfivetech.com>");
> +MODULE_AUTHOR("Changhuang Liang <changhuang.liang@starfivetech.com>");
> +MODULE_DESCRIPTION("StarFive JHB100 Fan Tach device driver");
> +MODULE_LICENSE("GPL");

