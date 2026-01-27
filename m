Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE83C469D
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 00:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769472497; cv=none; b=hNtn3+LPl2WMDe+gQ/EByQB3xmu2BFD2AEsw+WqOghNPgEGCncC3+I014/JPg0pKCsfNDCuw5PCrA+v/53b0vtoU0/smlU0h0H1wx4objKpGVZpfjXC1+L3c+r2AWWsCkke512Gh4XzJSnzTjsAWRUhiJrZyz2bEBBtXE0SN924=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769472497; c=relaxed/simple;
	bh=HrZhXPBJqusSvFM4NG+y5hsJEOaeoArg4y7NqW6wmi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SDBifnK6FIxt0Rj8oIedRBTT83rtWB8pPKWDZtMLLnwn5heSFEP9dR352aCGn8K4e9u8d3bJhiBK5f46EYkdHTe+GVeHV5xFvISghQtR6yL1As4GJ3/jiVh+tjhHcoO18nvWcJwbUyIpaUjpq+xquxmjJHWded8oOzg0maSMoVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YalmSr6d; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YalmSr6d"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a7bced39cfso55945155ad.1
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Jan 2026 16:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769472494; x=1770077294; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=peBax/13lluz8BPuDFwUqkR/3/p6bAWL1WF8pnhruFE=;
        b=YalmSr6dOLE7tcpYWB3Et2RIMrvzI3GXtSN4hgOFv5bcafzrRe6rxCqIWvHEKV88Rd
         unXLlAsgdRQAAcE4Nu4jughwZgm1i8bO/hmBjCElctRjlQN2eNsp+BaSg1tIpbw3nbqT
         Z9s2CbH+tFVO0iiiOHBHdBXVgfHcwgksHUa9HSORI6mEtV9o5Uz9Iv88tHIZsTn5rkQx
         33K8c5vCcb6MVcqU/D6eg1IieAQw2aq7ac3sESBFd+Ddn3d8KQrq6z39BHiEGTAe10So
         1cE/AFXxMh1EWOIHhyg5OGwC5siYI8ofOLFeSWRX2N9fCj/8NX9uCEM2MHXZyMvpB0z0
         XPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769472494; x=1770077294;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=peBax/13lluz8BPuDFwUqkR/3/p6bAWL1WF8pnhruFE=;
        b=JItLnz5jWNizAtU0T93NrYM/LZUih/5UMTFm/N3+5ZnjELBJGJrLLS6klbSl0mi+2n
         fDLIMAmDumFNMul9B71jtzrWn8okvLbttpcH6+INgXfWBG5UGpTFIcDUUQSUObEFpSzx
         IHcJMKLjoAT549llAE85bvVhVWO2Ol6DWXzQouR9Fi3Tddm9K4uC6v2Tggie8uC5PV5k
         dhi0y1Uolsf5cFSyY8BpnNq3zSWdHgHPMvWZA97RVYnWz0qmkQVx1GMseZ09CjL1iBsG
         mQ9cDngi7zjJ8df3hr7bGxLsndq+FjxpzEdr09T+FVxgrMtuL93DNxyAQ2jxqJx0rIXg
         Fcsg==
X-Gm-Message-State: AOJu0YznpuUaPaglaQ414lhoqdVlLjHO/K2B/psHbgYKNhZq/Qfc4iQD
	L/IflPAwsRjYoNjZnew1Jt7XN/rMEKGTOKkD2ggw7r2MAvhObrN6ZLe3
X-Gm-Gg: AZuq6aJ2VAbn72yNKUZY+H0Dmcg8GNRNdU1VGnK76i/GEZhHK6B6ebBV5WFHqP6pj31
	L4kYy1CfqtM/v9KP3jJfWy+R1aLNK8R0YXzJvp5hvwd+MRd2u6bCwAI/6pJw+KZlrorUcSq2SMi
	mlt97I8ipG5Mlq2zN6lkQeShcRxA88Amtg6jjuQUI3pcGdLJnO8zIAOlGV/J2JW+VeQhjj6Zkce
	v1fYXSbw7RHL5U9ZJcHjSRxce9oh68I9+SpCGB4ieyLiQ91tXllC0HHYVYA5cOvckhh5TcMww5y
	u8Kkjh0Op2AxjDjVj5bbkiU7mLnhPilVpFeA+IHAbcwxpm9//erXcDYofhyxWpay7YzQKxmOI+V
	E/YA+ivHHimn0R5l3/0E+c/CGAMj4AzjC5Bv+anzaX/ESlX7Lnxq8x3j1EaZCVtlmHR5+TR8f+C
	FG0ekh+rsWQC22aGyzBUt5VL0Z
X-Received: by 2002:a17:902:e78f:b0:2a5:8c95:d823 with SMTP id d9443c01a7336-2a8451f927cmr58221555ad.10.1769472493763;
        Mon, 26 Jan 2026 16:08:13 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802daa84esm97363875ad.2.2026.01.26.16.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 16:08:12 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Jan 2026 16:08:11 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Almog Ben Shaul <almogbs@amazon.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	itamark@amazon.com, talel@amazon.com, farbere@amazon.com,
	ayalstei@amazon.com, dwmw@amazon.com
Subject: Re: [PATCH 2/2] hwmon: Add JEDEC PMIC50x0 driver
Message-ID: <746fd0e2-3d3c-4db0-b257-fc61c76a59a3@roeck-us.net>
References: <20260121151947.37719-1-almogbs@amazon.com>
 <20260121151947.37719-3-almogbs@amazon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121151947.37719-3-almogbs@amazon.com>

On Wed, Jan 21, 2026 at 03:19:47PM +0000, Almog Ben Shaul wrote:
> Add hardware monitoring driver for JEDEC PMIC50x0 compliant I2C DDR5
> PMICs.
> 
> The driver provides monitoring for voltage, current, power, and
> temperature across multiple channels, along with comprehensive error
> reporting.
> 
> Signed-off-by: Almog Ben Shaul <almogbs@amazon.com>
> Tested-by: Almog Ben Shaul <almogbs@amazon.com>

Drop Tested-by:.

Please provide a register map (generated using i2dump or similar)
for the chip.

> ---
>  Documentation/hwmon/index.rst    |   1 +
>  Documentation/hwmon/pmic50x0.rst | 113 +++++
>  MAINTAINERS                      |   6 +
>  drivers/hwmon/Kconfig            |  10 +
>  drivers/hwmon/Makefile           |   1 +
>  drivers/hwmon/pmic50x0.c         | 839 +++++++++++++++++++++++++++++++
>  6 files changed, 970 insertions(+)
>  create mode 100644 Documentation/hwmon/pmic50x0.rst
>  create mode 100644 drivers/hwmon/pmic50x0.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 85d7a686883e..a08ef61c9cda 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -210,6 +210,7 @@ Hardware Monitoring Kernel Drivers
>     peci-cputemp
>     peci-dimmtemp
>     pmbus
> +   pmic50x0
>     powerz
>     powr1220
>     pt5161l
> diff --git a/Documentation/hwmon/pmic50x0.rst b/Documentation/hwmon/pmic50x0.rst
> new file mode 100644
> index 000000000000..2a0a6be2a3b1
> --- /dev/null
> +++ b/Documentation/hwmon/pmic50x0.rst
> @@ -0,0 +1,113 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +Kernel driver pmic50x0
> +======================
> +
> +Supported chips:
> +
> +  * JEDEC PMIC50X0 (JESD301) compliant DDR5 PMICs
> +
> +    JEDEC standard download:
> +	https://www.jedec.org/standards-documents/docs/jesd301-1a03
> +
> +    Prefix: 'pmic50x0'
> +
> +    Addresses scanned: ~
> +
> +Author:
> +	Almog Ben Shaul <almogbs@amazon.com>
> +
> +
> +Description
> +-----------
> +
> +This driver implements support for hardware monitoring of JEDEC PMIC50X0

It is really PMIC5000/PMIC5010, not PMIC50X0. PMIC50[2-9]0 are not covered.
Please be explicit.

> +compliant DDR5 Power Management ICs. These devices are I2C-based power
> +management controllers designed specifically for DDR5 memory modules.
> +
> +The driver provides monitoring for:
> +
> +  * Voltage measurements across 4 switch nodes (A, B, C, D)
> +  * Current measurements for each switch node
> +  * Power consumption per switch node and total power
> +  * PMIC die temperature
> +  * Comprehensive error status reporting
> +
> +The PMIC50X0 specification defines a standard interface for DDR5 power
> +management, including telemetry and error reporting capabilities.
> +
> +
> +Usage Notes
> +-----------
> +
> +Error monitoring is performed via a delayed work queue that polls error
> +registers at a configurable interval (default 1000ms). The polling interval
> +can be adjusted via the module parameter ``error_polling_ms``.
> +

This is a no-go. Please no such polling in hardware monitoring drivers.
More on that below.

> +
> +Hardware monitoring sysfs entries
> +---------------------------------
> +
> +======================= ========================================================
> +temp1_input		PMIC die temperature in millidegrees Celsius
> +
> +in0_input		Switch Node A output voltage in millivolts
> +in1_input		Switch Node B output voltage in millivolts
> +in2_input		Switch Node C output voltage in millivolts
> +in3_input		Switch Node D output voltage in millivolts
> +
> +curr1_input		Switch Node A output current in milliamperes
> +curr2_input		Switch Node B output current in milliamperes
> +curr3_input		Switch Node C output current in milliamperes
> +curr4_input		Switch Node D output current in milliamperes
> +
> +power1_input		Switch Node A power consumption in microwatts
> +power2_input		Switch Node B power consumption in microwatts
> +power3_input		Switch Node C power consumption in microwatts
> +power4_input		Switch Node D power consumption in microwatts
> +power5_input		Total power consumption (sum of all nodes) in microwatts
> +======================= ========================================================
> +
> +
> +Error Status Counters
> +---------------------
> +
> +The driver maintains counters for various error conditions. Each counter
> +increments when the corresponding error condition is detected during polling.
> +All error attributes are read-only and return the number of times the error
> +has been detected since driver load or counter reset.
> +
> +====================================== =========================================
> +err_global_log_vin_bulk_over_vol       VIN_Bulk input over-voltage error count
> +err_global_log_crit_temp               Critical temperature error count
> +err_global_log_buck_ov_or_uv           Buck converter over/under-voltage count
> +err_vin_bulk_input_over_vol_stat       VIN_Bulk over-voltage status count
> +err_vin_mgmt_input_over_vol_stat       VIN_Mgmt over-voltage status count
> +err_vin_bulk_input_pow_good_stat       VIN_Bulk power good status count
> +err_vin_mgmt_to_vin_bulk_stat          VIN_Mgmt to VIN_Bulk switchover count
> +err_swa_out_pow_good_stat              Switch Node A power good status count
> +err_swb_out_pow_good_stat              Switch Node B power good status count
> +err_swc_out_pow_good_stat              Switch Node C power good status count
> +err_swd_out_pow_good_stat              Switch Node D power good status count
> +err_swa_out_over_vol_stat              Switch Node A over-voltage count
> +err_swb_out_over_vol_stat              Switch Node B over-voltage count
> +err_swc_out_over_vol_stat              Switch Node C over-voltage count
> +err_swd_out_over_vol_stat              Switch Node D over-voltage count
> +err_swa_out_under_vol_lockout_stat     Switch Node A under-voltage lockout count
> +err_swb_out_under_vol_lockout_stat     Switch Node B under-voltage lockout count
> +err_swc_out_under_vol_lockout_stat     Switch Node C under-voltage lockout count
> +err_swd_out_under_vol_lockout_stat     Switch Node D under-voltage lockout count
> +err_swa_high_out_curr_consump_stat     Switch Node A high current warning count
> +err_swb_high_out_curr_consump_stat     Switch Node B high current warning count
> +err_swc_high_out_curr_consump_stat     Switch Node C high current warning count
> +err_swd_high_out_curr_consump_stat     Switch Node D high current warning count
> +err_swa_out_curr_limiter_warn_stat     Switch Node A current limiter count
> +err_swb_out_curr_limiter_warn_stat     Switch Node B current limiter count
> +err_swc_out_curr_limiter_warn_stat     Switch Node C current limiter count
> +err_swd_out_curr_limiter_warn_stat     Switch Node D current limiter count
> +err_crit_temp_shutdown_stat            Critical temperature shutdown count
> +err_pmic_high_temp_warn_stat           High temperature warning count
> +err_vout_1v_out_power_good_stat        VOUT_1.0V LDO power good status count
> +err_vout_1_8v_out_power_good_stat      VOUT_1.8V LDO power good status count
> +err_vbias_power_good_stat              VBias power good status count

Implement in debugfs.

> +====================================== =========================================
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ebc2f1bc0ade..f179bccb992b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13515,6 +13515,12 @@ S:	Maintained
>  F:	arch/x86/include/asm/jailhouse_para.h
>  F:	arch/x86/kernel/jailhouse.c
>  
> +JEDEC PMIC50X0 HARDWARE MONITOR DRIVER
> +M:	Almog Ben Shaul <almogbs@amazon.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	drivers/hwmon/pmic50x0.c
> +
>  JFS FILESYSTEM
>  M:	Dave Kleikamp <shaggy@kernel.org>
>  L:	jfs-discussion@lists.sourceforge.net
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 157678b821fc..7100866ca444 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1905,6 +1905,16 @@ config SENSORS_PWM_FAN
>  	  This driver can also be built as a module. If so, the module
>  	  will be called pwm-fan.
>  
> +config SENSORS_PMIC50X0
> +	tristate "JEDEC PMIC50x0 compliant DDR5 PMICs"
> +	depends on I2C
> +	select REGMAP_I2C
> +	help
> +	  If you say yes here you get support for JEDEC PMIC50x0 compliant
> +	  DDR5 PMIC sensor chips.
> +	  This driver can also be built as a module. If so, the module
> +	  will be called pmic50x0.
> +
>  config SENSORS_QNAP_MCU_HWMON
>  	tristate "QNAP MCU hardware monitoring"
>  	depends on MFD_QNAP_MCU
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index eade8e3b1bde..f831aacc5791 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -197,6 +197,7 @@ obj-$(CONFIG_SENSORS_POWERZ)	+= powerz.o
>  obj-$(CONFIG_SENSORS_POWR1220)  += powr1220.o
>  obj-$(CONFIG_SENSORS_PT5161L)	+= pt5161l.o
>  obj-$(CONFIG_SENSORS_PWM_FAN)	+= pwm-fan.o
> +obj-$(CONFIG_SENSORS_PMIC50X0)	+= pmic50x0.o
>  obj-$(CONFIG_SENSORS_QNAP_MCU_HWMON)	+= qnap-mcu-hwmon.o
>  obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+= raspberrypi-hwmon.o
>  obj-$(CONFIG_SENSORS_SA67MCU)	+= sa67mcu-hwmon.o
> diff --git a/drivers/hwmon/pmic50x0.c b/drivers/hwmon/pmic50x0.c
> new file mode 100644
> index 000000000000..14a336d64a5b
> --- /dev/null
> +++ b/drivers/hwmon/pmic50x0.c
> @@ -0,0 +1,839 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Hardware monitoring driver for JEDEC PMIC50x0 compliant DDR5 PMICs
> + *
> + * Specification: https://www.jedec.org/standards-documents/docs/jesd301-1a03
> + *
> + * Copyright (C) 2026 Almog Ben Shaul <almogbs@amazon.com>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/panic_notifier.h>
> +#include <linux/regmap.h>
> +
> +/* PMIC50X0 Register Mapping */
> +#define PMIC50X0_REG_CURR_POW		0x0C
> +#define PMIC50X0_REG_NODE_A_SUM_SELECT	0x1A
> +#define PMIC50X0_REG_CURR_POW_SELECT	0x1B
> +#define PMIC50X0_REG_VOL_NODE_SELECT	0x30
> +#define PMIC50X0_REG_VOL		0x31
> +#define PMIC50X0_REG_TEMP		0x33
> +#define PMIC50X0_MAX_REG_ADDR		0xFF
> +
> +/* PMIC50X0 Error Registers & Bits Mapping */
> +#define PMIC50X0_ERR_REG0_ADDR	0x04
> +#define PMIC50X0_ERR_REG1_ADDR	0x08
> +#define PMIC50X0_ERR_REG2_ADDR	0x09
> +#define PMIC50X0_ERR_REG3_ADDR	0x0A
> +#define PMIC50X0_ERR_REG4_ADDR	0x0B
> +#define PMIC50X0_ERR_REG5_ADDR	0x33
> +
> +#define PMIC50X0_ERR_REG0_SBIT	4
> +#define PMIC50X0_ERR_REG1_SBIT	0
> +#define PMIC50X0_ERR_REG2_SBIT	0
> +#define PMIC50X0_ERR_REG3_SBIT	4
> +#define PMIC50X0_ERR_REG4_SBIT	0
> +#define PMIC50X0_ERR_REG5_SBIT	2
> +
> +#define PMIC50X0_ERR_REG0_EBIT	6
> +#define PMIC50X0_ERR_REG1_EBIT	7
> +#define PMIC50X0_ERR_REG2_EBIT	7
> +#define PMIC50X0_ERR_REG3_EBIT	7
> +#define PMIC50X0_ERR_REG4_EBIT	7
> +#define PMIC50X0_ERR_REG5_EBIT	2
> +
> +#define ERR_REG_NUM_BITS(bit)	(PMIC50X0_ERR_REG##bit##_EBIT - PMIC50X0_ERR_REG##bit##_SBIT + 1)
> +#define PMIC50X0_ERR_REG0_NUM_BITS ERR_REG_NUM_BITS(0)
> +#define PMIC50X0_ERR_REG1_NUM_BITS ERR_REG_NUM_BITS(1)
> +#define PMIC50X0_ERR_REG2_NUM_BITS ERR_REG_NUM_BITS(2)
> +#define PMIC50X0_ERR_REG3_NUM_BITS ERR_REG_NUM_BITS(3)
> +#define PMIC50X0_ERR_REG4_NUM_BITS ERR_REG_NUM_BITS(4)
> +#define PMIC50X0_ERR_REG5_NUM_BITS ERR_REG_NUM_BITS(5)
> +
> +/* PMIC50X0 Masks and offsets etc. */
> +#define PMIC50X0_VOL_SELECT_MASK	GENMASK(6, 3)
> +#define PMIC50X0_VOL_MASK		GENMASK(7, 0)
> +#define PMIC50X0_TEMP_MASK		GENMASK(7, 5)
> +#define PMIC50X0_CURR_POW_A_MASK	GENMASK(7, 0)
> +#define PMIC50X0_CURR_POW_SUM_MASK	GENMASK(7, 0)
> +#define PMIC50X0_CURR_POW_BCD_MASK	GENMASK(5, 0)
> +#define PMIC50X0_CURR_POW_SELECT	BIT(6)
> +#define PMIC50X0_CURR_POW_A_SUM_SELECT	BIT(1)
> +#define PMIC50X0_VOL_OFFSET		3
> +#define PMIC50X0_CURR_POW_SELECT_OFFSET	6
> +#define PMIC50X0_CURR_POW_A_SUM_OFFSET	1
> +#define	PMIC50X0_SELECT_POWER_A		0
> +#define	PMIC50X0_SELECT_POWER_SUM	BIT(PMIC50X0_CURR_POW_A_SUM_OFFSET)
> +#define PMIC50X0_VOL_SELECT_DELAY	9
> +
> +/* PMIC50X0 consts etc. */
> +#define PMIC50X0_DRIVER_NAME		"pmic50x0"
> +#define PMIC50X0_REG_BITS		8
> +#define PMIC50X0_VAL_BITS		8
> +#define PMIC50X0_VOL_FACTOR		15
> +#define PMIC50X0_TEMP_FACTOR		10
> +#define PMIC50X0_TEMP_BASE		75
> +#define PMIC50X0_CURR_POWER_FACTOR	125
> +#define PMIC50X0_ERR_POLL_INTERVAL_MSEC	1000
> +#define PMIC50X0_VOLTAGE_CHANNELS	4
> +#define PMIC50X0_PASS0_UNLOCK_VAL	0x73
> +#define PMIC50X0_PASS1_UNLOCK_VAL	0x94
> +#define PMIC50X0_PROT_UNLOCK_VAL	0x40
> +#define PMIC50X0_PROT_LOCK_VAL		0x0
> +

Please only provide definitions if actually used.

> +#define MILLIDEGREE_PER_DEGREE          1000

MILLIDEGREE_PER_DEGREE is defined in include/linux/units.h. Use it.

> +#define PMIC50X0_DEV_ATTR(name, index)	\
> +	static SENSOR_DEVICE_ATTR(name, 0444, pmic50x0_err_show, 0, (index))
> +
> +enum pmic50x0_curr_pow_node {
> +	PMIC50X0_CURR_POW_NODE_A,
> +	PMIC50X0_CURR_POW_NODE_B,
> +	PMIC50X0_CURR_POW_NODE_C,
> +	PMIC50X0_CURR_POW_NODE_D,
> +	PMIC50X0_CURR_POW_SUM
> +};
> +
> +enum pmic50x0_select_current_power {
> +	PMIC50X0_SELECT_CURRENT,
> +	PMIC50X0_SELECT_POWER,
> +};
> +
> +enum pmic50x0_error_list {
> +	PMIC50X0_ERR_GLOBAL_LOG_VIN_BULK_OVER_VOL,
> +	PMIC50X0_ERR_GLOBAL_LOG_CRIT_TEMP,
> +	PMIC50X0_ERR_GLOBAL_LOG_BUCK_OV_OR_UV,
> +	PMIC50X0_ERR_VIN_BULK_INPUT_OVER_VOL_STAT,
> +	PMIC50X0_ERR_VIN_MGMT_INPUT_OVER_VOL_STAT,
> +	PMIC50X0_ERR_SWD_OUT_POW_GOOD_STAT,
> +	PMIC50X0_ERR_SWC_OUT_POW_GOOD_STAT,
> +	PMIC50X0_ERR_SWB_OUT_POW_GOOD_STAT,
> +	PMIC50X0_ERR_SWA_OUT_POW_GOOD_STAT,
> +	PMIC50X0_ERR_CRIT_TEMP_SHUTDOWN_STAT,
> +	PMIC50X0_ERR_VIN_BULK_INPUT_POW_GOOD_STAT,
> +	PMIC50X0_ERR_SWD_HIGH_OUT_CURR_CONSUMP_STAT,
> +	PMIC50X0_ERR_SWC_HIGH_OUT_CURR_CONSUMP_STAT,
> +	PMIC50X0_ERR_SWB_HIGH_OUT_CURR_CONSUMP_STAT,
> +	PMIC50X0_ERR_SWA_HIGH_OUT_CURR_CONSUMP_STAT,
> +	PMIC50X0_ERR_VIN_MGMT_TO_VIN_BULK_STAT,
> +	PMIC50X0_ERR_VOUT_1_8V_OUT_POWER_GOOD_STAT,
> +	PMIC50X0_ERR_VBIAS_POWER_GOOD_STAT,
> +	PMIC50X0_ERR_PMIC_HIGH_TEMP_WARN_STAT,
> +	PMIC50X0_ERR_SWD_OUT_OVER_VOL_STAT,
> +	PMIC50X0_ERR_SWC_OUT_OVER_VOL_STAT,
> +	PMIC50X0_ERR_SWB_OUT_OVER_VOL_STAT,
> +	PMIC50X0_ERR_SWA_OUT_OVER_VOL_STAT,
> +	PMIC50X0_ERR_SWD_OUT_UNDER_VOL_LOCKOUT_STAT,
> +	PMIC50X0_ERR_SWC_OUT_UNDER_VOL_LOCKOUT_STAT,
> +	PMIC50X0_ERR_SWB_OUT_UNDER_VOL_LOCKOUT_STAT,
> +	PMIC50X0_ERR_SWA_OUT_UNDER_VOL_LOCKOUT_STAT,
> +	PMIC50X0_ERR_SWD_OUT_CURR_LIMITER_WARN_STAT,
> +	PMIC50X0_ERR_SWC_OUT_CURR_LIMITER_WARN_STAT,
> +	PMIC50X0_ERR_SWB_OUT_CURR_LIMITER_WARN_STAT,
> +	PMIC50X0_ERR_SWA_OUT_CURR_LIMITER_WARN_STAT,
> +	PMIC50X0_ERR_VOUT_1V_OUT_POWER_GOOD_STAT,
> +	PMIC50X0_ERR_MAX
> +};
> +
> +struct pmic50x0_error {
> +	u8 reg;
> +	u8 bit;
> +};
> +
> +static const struct pmic50x0_error pmic50x0_error_reg[PMIC50X0_ERR_MAX] = {
> +	[PMIC50X0_ERR_GLOBAL_LOG_VIN_BULK_OVER_VOL] =	{.reg = 0, .bit = 4},
> +	[PMIC50X0_ERR_GLOBAL_LOG_CRIT_TEMP] =		{.reg = 0, .bit = 5},
> +	[PMIC50X0_ERR_GLOBAL_LOG_BUCK_OV_OR_UV] =	{.reg = 0, .bit = 6},
> +	[PMIC50X0_ERR_VIN_BULK_INPUT_OVER_VOL_STAT] =   {.reg = 1, .bit = 0},
> +	[PMIC50X0_ERR_VIN_MGMT_INPUT_OVER_VOL_STAT] =   {.reg = 1, .bit = 1},
> +	[PMIC50X0_ERR_SWD_OUT_POW_GOOD_STAT] =          {.reg = 1, .bit = 2},
> +	[PMIC50X0_ERR_SWC_OUT_POW_GOOD_STAT] =          {.reg = 1, .bit = 3},
> +	[PMIC50X0_ERR_SWB_OUT_POW_GOOD_STAT] =          {.reg = 1, .bit = 4},
> +	[PMIC50X0_ERR_SWA_OUT_POW_GOOD_STAT] =          {.reg = 1, .bit = 5},
> +	[PMIC50X0_ERR_CRIT_TEMP_SHUTDOWN_STAT] =        {.reg = 1, .bit = 6},
> +	[PMIC50X0_ERR_VIN_BULK_INPUT_POW_GOOD_STAT] =   {.reg = 1, .bit = 7},
> +	[PMIC50X0_ERR_SWD_HIGH_OUT_CURR_CONSUMP_STAT] = {.reg = 2, .bit = 0},
> +	[PMIC50X0_ERR_SWC_HIGH_OUT_CURR_CONSUMP_STAT] = {.reg = 2, .bit = 1},
> +	[PMIC50X0_ERR_SWB_HIGH_OUT_CURR_CONSUMP_STAT] = {.reg = 2, .bit = 2},
> +	[PMIC50X0_ERR_SWA_HIGH_OUT_CURR_CONSUMP_STAT] = {.reg = 2, .bit = 3},
> +	[PMIC50X0_ERR_VIN_MGMT_TO_VIN_BULK_STAT] =      {.reg = 2, .bit = 4},
> +	[PMIC50X0_ERR_VOUT_1_8V_OUT_POWER_GOOD_STAT] =  {.reg = 2, .bit = 5},
> +	[PMIC50X0_ERR_VBIAS_POWER_GOOD_STAT] =          {.reg = 2, .bit = 6},
> +	[PMIC50X0_ERR_PMIC_HIGH_TEMP_WARN_STAT] =       {.reg = 2, .bit = 7},
> +	[PMIC50X0_ERR_SWD_OUT_OVER_VOL_STAT] =          {.reg = 3, .bit = 4},
> +	[PMIC50X0_ERR_SWC_OUT_OVER_VOL_STAT] =          {.reg = 3, .bit = 5},
> +	[PMIC50X0_ERR_SWB_OUT_OVER_VOL_STAT] =          {.reg = 3, .bit = 6},
> +	[PMIC50X0_ERR_SWA_OUT_OVER_VOL_STAT] =          {.reg = 3, .bit = 7},
> +	[PMIC50X0_ERR_SWD_OUT_UNDER_VOL_LOCKOUT_STAT] = {.reg = 4, .bit = 0},
> +	[PMIC50X0_ERR_SWC_OUT_UNDER_VOL_LOCKOUT_STAT] = {.reg = 4, .bit = 1},
> +	[PMIC50X0_ERR_SWB_OUT_UNDER_VOL_LOCKOUT_STAT] = {.reg = 4, .bit = 2},
> +	[PMIC50X0_ERR_SWA_OUT_UNDER_VOL_LOCKOUT_STAT] = {.reg = 4, .bit = 3},
> +	[PMIC50X0_ERR_SWD_OUT_CURR_LIMITER_WARN_STAT] = {.reg = 4, .bit = 4},
> +	[PMIC50X0_ERR_SWC_OUT_CURR_LIMITER_WARN_STAT] = {.reg = 4, .bit = 5},
> +	[PMIC50X0_ERR_SWB_OUT_CURR_LIMITER_WARN_STAT] = {.reg = 4, .bit = 6},
> +	[PMIC50X0_ERR_SWA_OUT_CURR_LIMITER_WARN_STAT] = {.reg = 4, .bit = 7},
> +	[PMIC50X0_ERR_VOUT_1V_OUT_POWER_GOOD_STAT]    = {.reg = 5, .bit = 2},
> +};
> +
> +static const char *pmic50x0_reg0_err_msgs[PMIC50X0_ERR_REG0_NUM_BITS] = {
> +	"Global Error Log History for Critical Temperature",
> +	"Global Error Log History for VIN_Bulk Over",
> +	"Global Error Log History for Buck Regulator Output O/U Voltage",
> +};
> +
> +static const char *pmic50x0_reg1_err_msgs[PMIC50X0_ERR_REG1_NUM_BITS] = {
> +	"VIN_Bulk Input Supply Over Voltage Status",
> +	"VIN_Mgmt Input Supply Over Voltage Status",
> +	"Switch Node D Output Power Good Status",
> +	"Switch Node C Output Power Good Status",
> +	"Switch Node B Output Power Good Status",
> +	"Switch Node A Output Power Good Status",
> +	"Critical Temperature Shutdown Status",
> +	"VIN_Bulk Input Power Good Status"
> +};
> +
> +static const char *pmic50x0_reg2_err_msgs[PMIC50X0_ERR_REG2_NUM_BITS] = {
> +	"Switch Node D High Output Current Consumption Warning Status",
> +	"Switch Node C High Output Current Consumption Warning Status",
> +	"Switch Node B High Output Current Consumption Warning Status",
> +	"Switch Node A High Output Current Consumption Warning Status",
> +	"VIN_Mgmt to VIN_Bulk Input Supply Automatic Switchover Status",
> +	"VOUT_1.8V LDO Output Power Good Status",
> +	"VBias Power Good Status",
> +	"PMIC High Temperature Warning Status"
> +};
> +
> +static const char *pmic50x0_reg3_err_msgs[PMIC50X0_ERR_REG3_NUM_BITS] = {
> +	"Switch Node D Output Over Voltage Status",
> +	"Switch Node C Output Over Voltage Status",
> +	"Switch Node B Output Over Voltage Status",
> +	"Switch Node A Output Over Voltage Status"
> +};
> +
> +static const char *pmic50x0_reg4_err_msgs[PMIC50X0_ERR_REG4_NUM_BITS] = {
> +	"Switch Node D Output Under Voltage Lockout Status",
> +	"Switch Node C Output Under Voltage Lockout Status",
> +	"Switch Node B Output Under Voltage Lockout Status",
> +	"Switch Node A Output Under Voltage Lockout Status",
> +	"Switch Node D Output Current Limiter Warning Status",
> +	"Switch Node C Output Current Limiter Warning Status",
> +	"Switch Node B Output Current Limiter Warning Status",
> +	"Switch Node A Output Current Limiter Warning Status"
> +};
> +
> +static const char *pmic50x0_reg5_err_msgs[PMIC50X0_ERR_REG5_NUM_BITS] = {
> +	"VOUT_1.0V LDO Output Power Good"
> +};
> +
> +struct pmic50x0_err_reg {
> +	unsigned int addr;
> +	unsigned int *counters;
> +	const char **err_msgs;
> +	u8 sbit;
> +	u8 ebit;
> +	u8 size;
> +	u8 err_active;
> +};
> +
> +/* Main driver struct */
> +struct pmic50x0 {
> +	struct device *dev;
> +	struct regmap *regmap;
> +	struct delayed_work work;
> +	struct pmic50x0_err_reg *err_regs;
> +	struct notifier_block panic_notifier;
> +	long last_voltage[PMIC50X0_VOLTAGE_CHANNELS];
> +	/* Mutex for reading the voltage registers */
> +	struct mutex voltage_mutex;
> +	/* Mutex for reading the current and power registers */
> +	struct mutex curr_power_mutex;

The hwmon core already implements locking.

> +
> +};
> +
> +static unsigned int error_polling_ms = PMIC50X0_ERR_POLL_INTERVAL_MSEC;
> +module_param(error_polling_ms, uint, 0644);
> +MODULE_PARM_DESC(error_polling_ms, "PMIC error polling interval in msec, default = 1000");

This is a no-go. If some kind of error attribute/register polling is wanted,
implement it from userspace. For the kernel it is unnecessary burden and costly
for everyone not wanting/needing it.

> +
> +static ssize_t pmic50x0_err_show(struct device *dev,
> +				 struct device_attribute *da, char *buf)
> +{
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
> +	struct pmic50x0 *pmic50x0 = dev_get_drvdata(dev);
> +	unsigned int idx = attr->index;
> +	struct pmic50x0_error err = pmic50x0_error_reg[idx];
> +	u8 reg, bit;
> +
> +	reg = err.reg;
> +	bit = err.bit - pmic50x0->err_regs[reg].sbit;
> +
> +	return scnprintf(buf, PAGE_SIZE, "%u\n", pmic50x0->err_regs[reg].counters[bit]);
> +}
> +
> +/* Error Sysfs group */
> +PMIC50X0_DEV_ATTR(err_global_log_vin_bulk_over_vol, PMIC50X0_ERR_GLOBAL_LOG_VIN_BULK_OVER_VOL);
> +PMIC50X0_DEV_ATTR(err_global_log_crit_temp, PMIC50X0_ERR_GLOBAL_LOG_CRIT_TEMP);
> +PMIC50X0_DEV_ATTR(err_global_log_buck_ov_or_uv, PMIC50X0_ERR_GLOBAL_LOG_BUCK_OV_OR_UV);
> +PMIC50X0_DEV_ATTR(err_vin_bulk_input_over_vol_stat, PMIC50X0_ERR_VIN_BULK_INPUT_OVER_VOL_STAT);
> +PMIC50X0_DEV_ATTR(err_vin_mgmt_input_over_vol_stat, PMIC50X0_ERR_VIN_MGMT_INPUT_OVER_VOL_STAT);
> +PMIC50X0_DEV_ATTR(err_swd_out_pow_good_stat, PMIC50X0_ERR_SWD_OUT_POW_GOOD_STAT);
> +PMIC50X0_DEV_ATTR(err_swc_out_pow_good_stat, PMIC50X0_ERR_SWC_OUT_POW_GOOD_STAT);
> +PMIC50X0_DEV_ATTR(err_swb_out_pow_good_stat, PMIC50X0_ERR_SWB_OUT_POW_GOOD_STAT);
> +PMIC50X0_DEV_ATTR(err_swa_out_pow_good_stat, PMIC50X0_ERR_SWA_OUT_POW_GOOD_STAT);
> +PMIC50X0_DEV_ATTR(err_crit_temp_shutdown_stat, PMIC50X0_ERR_CRIT_TEMP_SHUTDOWN_STAT);
> +PMIC50X0_DEV_ATTR(err_vin_bulk_input_pow_good_stat, PMIC50X0_ERR_VIN_BULK_INPUT_POW_GOOD_STAT);
> +PMIC50X0_DEV_ATTR(err_swd_high_out_curr_consump_stat, PMIC50X0_ERR_SWD_HIGH_OUT_CURR_CONSUMP_STAT);
> +PMIC50X0_DEV_ATTR(err_swc_high_out_curr_consump_stat, PMIC50X0_ERR_SWC_HIGH_OUT_CURR_CONSUMP_STAT);
> +PMIC50X0_DEV_ATTR(err_swb_high_out_curr_consump_stat, PMIC50X0_ERR_SWB_HIGH_OUT_CURR_CONSUMP_STAT);
> +PMIC50X0_DEV_ATTR(err_swa_high_out_curr_consump_stat, PMIC50X0_ERR_SWA_HIGH_OUT_CURR_CONSUMP_STAT);
> +PMIC50X0_DEV_ATTR(err_vin_mgmt_to_vin_bulk_stat, PMIC50X0_ERR_VIN_MGMT_TO_VIN_BULK_STAT);
> +PMIC50X0_DEV_ATTR(err_vout_1_8v_out_power_good_stat, PMIC50X0_ERR_VOUT_1_8V_OUT_POWER_GOOD_STAT);
> +PMIC50X0_DEV_ATTR(err_vbias_power_good_stat, PMIC50X0_ERR_VBIAS_POWER_GOOD_STAT);
> +PMIC50X0_DEV_ATTR(err_pmic_high_temp_warn_stat, PMIC50X0_ERR_PMIC_HIGH_TEMP_WARN_STAT);
> +PMIC50X0_DEV_ATTR(err_swd_out_over_vol_stat, PMIC50X0_ERR_SWD_OUT_OVER_VOL_STAT);
> +PMIC50X0_DEV_ATTR(err_swc_out_over_vol_stat, PMIC50X0_ERR_SWC_OUT_OVER_VOL_STAT);
> +PMIC50X0_DEV_ATTR(err_swb_out_over_vol_stat, PMIC50X0_ERR_SWB_OUT_OVER_VOL_STAT);
> +PMIC50X0_DEV_ATTR(err_swa_out_over_vol_stat, PMIC50X0_ERR_SWA_OUT_OVER_VOL_STAT);
> +PMIC50X0_DEV_ATTR(err_swd_out_under_vol_lockout_stat, PMIC50X0_ERR_SWD_OUT_UNDER_VOL_LOCKOUT_STAT);
> +PMIC50X0_DEV_ATTR(err_swc_out_under_vol_lockout_stat, PMIC50X0_ERR_SWC_OUT_UNDER_VOL_LOCKOUT_STAT);
> +PMIC50X0_DEV_ATTR(err_swb_out_under_vol_lockout_stat, PMIC50X0_ERR_SWB_OUT_UNDER_VOL_LOCKOUT_STAT);
> +PMIC50X0_DEV_ATTR(err_swa_out_under_vol_lockout_stat, PMIC50X0_ERR_SWA_OUT_UNDER_VOL_LOCKOUT_STAT);
> +PMIC50X0_DEV_ATTR(err_swd_out_curr_limiter_warn_stat, PMIC50X0_ERR_SWD_OUT_CURR_LIMITER_WARN_STAT);
> +PMIC50X0_DEV_ATTR(err_swc_out_curr_limiter_warn_stat, PMIC50X0_ERR_SWC_OUT_CURR_LIMITER_WARN_STAT);
> +PMIC50X0_DEV_ATTR(err_swb_out_curr_limiter_warn_stat, PMIC50X0_ERR_SWB_OUT_CURR_LIMITER_WARN_STAT);
> +PMIC50X0_DEV_ATTR(err_swa_out_curr_limiter_warn_stat, PMIC50X0_ERR_SWA_OUT_CURR_LIMITER_WARN_STAT);
> +PMIC50X0_DEV_ATTR(err_vout_1v_out_power_good_stat, PMIC50X0_ERR_VOUT_1V_OUT_POWER_GOOD_STAT);
> +
> +static struct attribute *pmic50x0_err_attrs[] = {
> +	&sensor_dev_attr_err_global_log_vin_bulk_over_vol.dev_attr.attr,
> +	&sensor_dev_attr_err_global_log_crit_temp.dev_attr.attr,
> +	&sensor_dev_attr_err_global_log_buck_ov_or_uv.dev_attr.attr,
> +	&sensor_dev_attr_err_vin_bulk_input_over_vol_stat.dev_attr.attr,
> +	&sensor_dev_attr_err_vin_mgmt_input_over_vol_stat.dev_attr.attr,
> +	&sensor_dev_attr_err_swd_out_pow_good_stat.dev_attr.attr,
> +	&sensor_dev_attr_err_swc_out_pow_good_stat.dev_attr.attr,
> +	&sensor_dev_attr_err_swb_out_pow_good_stat.dev_attr.attr,
> +	&sensor_dev_attr_err_swa_out_pow_good_stat.dev_attr.attr,
> +	&sensor_dev_attr_err_crit_temp_shutdown_stat.dev_attr.attr,
> +	&sensor_dev_attr_err_vin_bulk_input_pow_good_stat.dev_attr.attr,
> +	&sensor_dev_attr_err_swd_high_out_curr_consump_stat.dev_attr.attr,
> +	&sensor_dev_attr_err_swc_high_out_curr_consump_stat.dev_attr.attr,
> +	&sensor_dev_attr_err_swb_high_out_curr_consump_stat.dev_attr.attr,
> +	&sensor_dev_attr_err_swa_high_out_curr_consump_stat.dev_attr.attr,
> +	&sensor_dev_attr_err_vin_mgmt_to_vin_bulk_stat.dev_attr.attr,
> +	&sensor_dev_attr_err_vout_1_8v_out_power_good_stat.dev_attr.attr,
> +	&sensor_dev_attr_err_vbias_power_good_stat.dev_attr.attr,
> +	&sensor_dev_attr_err_pmic_high_temp_warn_stat.dev_attr.attr,
> +	&sensor_dev_attr_err_swd_out_over_vol_stat.dev_attr.attr,
> +	&sensor_dev_attr_err_swc_out_over_vol_stat.dev_attr.attr,
> +	&sensor_dev_attr_err_swb_out_over_vol_stat.dev_attr.attr,
> +	&sensor_dev_attr_err_swa_out_over_vol_stat.dev_attr.attr,
> +	&sensor_dev_attr_err_swd_out_under_vol_lockout_stat.dev_attr.attr,
> +	&sensor_dev_attr_err_swc_out_under_vol_lockout_stat.dev_attr.attr,
> +	&sensor_dev_attr_err_swb_out_under_vol_lockout_stat.dev_attr.attr,
> +	&sensor_dev_attr_err_swa_out_under_vol_lockout_stat.dev_attr.attr,
> +	&sensor_dev_attr_err_swd_out_curr_limiter_warn_stat.dev_attr.attr,
> +	&sensor_dev_attr_err_swc_out_curr_limiter_warn_stat.dev_attr.attr,
> +	&sensor_dev_attr_err_swb_out_curr_limiter_warn_stat.dev_attr.attr,
> +	&sensor_dev_attr_err_swa_out_curr_limiter_warn_stat.dev_attr.attr,
> +	&sensor_dev_attr_err_vout_1v_out_power_good_stat.dev_attr.attr,
> +	NULL,
> +};
> +
> +ATTRIBUTE_GROUPS(pmic50x0_err);

Not acceptable as hardware monitoring attributes. Follow the ABI;
it supports various alarm attributes. For those not covered by
the ABI, implement using debugfs.

> +
> +static struct pmic50x0_err_reg pmic50x0_err_regs[] = {
> +	{
> +		.addr = PMIC50X0_ERR_REG0_ADDR,
> +		.err_msgs = pmic50x0_reg0_err_msgs,
> +		.sbit = PMIC50X0_ERR_REG0_SBIT,
> +		.ebit = PMIC50X0_ERR_REG0_EBIT,
> +		.size = PMIC50X0_ERR_REG0_NUM_BITS,
> +	},
> +	{
> +		.addr = PMIC50X0_ERR_REG1_ADDR,
> +		.err_msgs = pmic50x0_reg1_err_msgs,
> +		.sbit = PMIC50X0_ERR_REG1_SBIT,
> +		.ebit = PMIC50X0_ERR_REG1_EBIT,
> +		.size = PMIC50X0_ERR_REG1_NUM_BITS,
> +	},
> +	{
> +		.addr = PMIC50X0_ERR_REG2_ADDR,
> +		.err_msgs = pmic50x0_reg2_err_msgs,
> +		.sbit = PMIC50X0_ERR_REG2_SBIT,
> +		.ebit = PMIC50X0_ERR_REG2_EBIT,
> +		.size = PMIC50X0_ERR_REG2_NUM_BITS,
> +	},
> +	{
> +		.addr = PMIC50X0_ERR_REG3_ADDR,
> +		.err_msgs = pmic50x0_reg3_err_msgs,
> +		.sbit = PMIC50X0_ERR_REG3_SBIT,
> +		.ebit = PMIC50X0_ERR_REG3_EBIT,
> +		.size = PMIC50X0_ERR_REG3_NUM_BITS,
> +	},
> +	{
> +		.addr = PMIC50X0_ERR_REG4_ADDR,
> +		.err_msgs = pmic50x0_reg4_err_msgs,
> +		.sbit = PMIC50X0_ERR_REG4_SBIT,
> +		.ebit = PMIC50X0_ERR_REG4_EBIT,
> +		.size = PMIC50X0_ERR_REG4_NUM_BITS,
> +	},
> +	{
> +		.addr = PMIC50X0_ERR_REG5_ADDR,
> +		.err_msgs = pmic50x0_reg5_err_msgs,
> +		.sbit = PMIC50X0_ERR_REG5_SBIT,
> +		.ebit = PMIC50X0_ERR_REG5_EBIT,
> +		.size = PMIC50X0_ERR_REG5_NUM_BITS,
> +	},
> +};
> +
> +static int pmic50x0_temp_read(struct device *dev, long *val)
> +{
> +	struct pmic50x0 *pmic50x0 = dev_get_drvdata(dev);
> +	unsigned int regval;
> +	long temp;
> +	int err;
> +
> +	err = regmap_read(pmic50x0->regmap, PMIC50X0_REG_TEMP, &regval);
> +	if (err < 0)
> +		return err;
> +
> +	temp = FIELD_GET(PMIC50X0_TEMP_MASK, regval) * PMIC50X0_TEMP_FACTOR;
> +	*val = MILLIDEGREE_PER_DEGREE * (PMIC50X0_TEMP_BASE + temp);
> +
> +	return 0;
> +}
> +
> +static int pmic50x0_in_read(struct device *dev, long *val, int channel)
> +{
> +	struct pmic50x0 *pmic50x0 = dev_get_drvdata(dev);
> +	unsigned int regval;
> +	int err;
> +
> +	mutex_lock(&pmic50x0->voltage_mutex);
> +
> +	/* Select the node */
> +	err = regmap_update_bits(pmic50x0->regmap, PMIC50X0_REG_VOL_NODE_SELECT,
> +				 PMIC50X0_VOL_SELECT_MASK, channel << PMIC50X0_VOL_OFFSET);
> +	if (err < 0)
> +		goto ret_unlock;
> +
> +	/* The spec requires 9ms delay between the node selection and the reading */
> +	msleep(PMIC50X0_VOL_SELECT_DELAY);

Use usleep_range() or better fsleep().

> +
> +	/* Read the voltage register after selecting the node */
> +	err = regmap_read(pmic50x0->regmap, PMIC50X0_REG_VOL, &regval);
> +	if (err < 0)
> +		goto ret_unlock;
> +
> +	*val = FIELD_GET(PMIC50X0_VOL_MASK, regval) * PMIC50X0_VOL_FACTOR;
> +	pmic50x0->last_voltage[channel] = *val;
> +
> +ret_unlock:
> +	mutex_unlock(&pmic50x0->voltage_mutex);
> +
> +	return err;
> +}
> +
> +static int pmic50x0_curr_power_read(struct device *dev, long *val, int channel,
> +				    enum pmic50x0_select_current_power node)
> +{
> +	struct pmic50x0 *pmic50x0 = dev_get_drvdata(dev);
> +	unsigned int regval, reg;
> +	long mask;
> +	int err;
> +
> +	mutex_lock(&pmic50x0->curr_power_mutex);
> +
> +	/* Select power/current mode */
> +	err = regmap_update_bits(pmic50x0->regmap, PMIC50X0_REG_CURR_POW_SELECT,
> +				 PMIC50X0_CURR_POW_SELECT, node << PMIC50X0_CURR_POW_SELECT_OFFSET);
> +	if (err < 0)
> +		goto ret_unlock;
> +
> +	switch (channel) {
> +	case PMIC50X0_CURR_POW_NODE_A:
> +		mask = PMIC50X0_CURR_POW_A_MASK;
> +		reg = PMIC50X0_REG_CURR_POW;
> +
> +		/* Select node A */
> +		err = regmap_update_bits(pmic50x0->regmap, PMIC50X0_REG_NODE_A_SUM_SELECT,
> +					 PMIC50X0_CURR_POW_A_SUM_SELECT, PMIC50X0_SELECT_POWER_A);
> +		if (err < 0)
> +			goto ret_unlock;
> +		break;
> +	case PMIC50X0_CURR_POW_NODE_B:
> +	case PMIC50X0_CURR_POW_NODE_C:
> +	case PMIC50X0_CURR_POW_NODE_D:
> +		mask = PMIC50X0_CURR_POW_BCD_MASK;
> +		reg = PMIC50X0_REG_CURR_POW + channel;
> +		break;
> +	case PMIC50X0_CURR_POW_SUM:
> +		mask = PMIC50X0_CURR_POW_SUM_MASK;
> +		reg = PMIC50X0_REG_CURR_POW;
> +
> +		/* Select the sum of A,B,C and D nodes */
> +		err = regmap_update_bits(pmic50x0->regmap, PMIC50X0_REG_NODE_A_SUM_SELECT,
> +					 PMIC50X0_CURR_POW_A_SUM_SELECT, PMIC50X0_SELECT_POWER_SUM);
> +		if (err < 0)
> +			goto ret_unlock;
> +		break;
> +	default:
> +		err = -EOPNOTSUPP;
> +		goto ret_unlock;
> +	}
> +
> +	err = regmap_read(pmic50x0->regmap, reg, &regval);
> +	if (err < 0)
> +		goto ret_unlock;
> +
> +	*val = (regval & mask) * PMIC50X0_CURR_POWER_FACTOR;

Power is reported in uW per ABI. The registers report power in steps of 125mW.
PMIC50X0_CURR_POWER_FACTOR is 125, so this calculation seems off by a factor
of 1,000 for power readings.

> +
> +ret_unlock:
> +	mutex_unlock(&pmic50x0->curr_power_mutex);
> +
> +	return err;
> +}
> +
> +static int pmic50x0_read(struct device *dev, enum hwmon_sensor_types type, u32 attr, int channel,
> +			 long *val)
> +{
> +	switch (type) {
> +	case hwmon_temp:
> +		if (attr != hwmon_temp_input)
> +			return -EOPNOTSUPP;
> +		return pmic50x0_temp_read(dev, val);
> +	case hwmon_in:
> +		if (attr != hwmon_in_input)
> +			return -EOPNOTSUPP;
> +		return pmic50x0_in_read(dev, val, channel);
> +	case hwmon_curr:
> +		if (attr != hwmon_curr_input)
> +			return -EOPNOTSUPP;
> +		return pmic50x0_curr_power_read(dev, val, channel, PMIC50X0_SELECT_CURRENT);
> +	case hwmon_power:
> +		if (attr != hwmon_power_input)
> +			return -EOPNOTSUPP;
> +		return pmic50x0_curr_power_read(dev, val, channel, PMIC50X0_SELECT_POWER);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static umode_t pmic50x0_is_visible(const void *data, enum hwmon_sensor_types type, u32 attr,
> +				   int channel)
> +{
> +	switch (type) {
> +	case hwmon_temp:
> +		return (attr == hwmon_temp_input) ? 0444 : 0;
> +	case hwmon_in:
> +		return (attr == hwmon_in_input) ? 0444 : 0;
> +	case hwmon_curr:
> +		return (attr == hwmon_curr_input) ? 0444 : 0;
> +	case hwmon_power:
> +		return (attr == hwmon_power_input) ? 0444 : 0;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static const u32 pmic50x0_temp_config[] = {
> +	HWMON_T_INPUT,
> +	0
> +};
> +
> +static const struct hwmon_channel_info pmic50x0_temp = {
> +	.type = hwmon_temp,
> +	.config = pmic50x0_temp_config,
> +};
> +
> +static const u32 pmic50x0_in_config[] = {
> +	HWMON_I_INPUT,
> +	HWMON_I_INPUT,
> +	HWMON_I_INPUT,
> +	HWMON_I_INPUT,

The chips support measuring a total of 9 different voltages.
Why only support SWA..SWD ?

> +	0
> +};
> +
> +static const struct hwmon_channel_info pmic50x0_in = {
> +	.type = hwmon_in,
> +	.config = pmic50x0_in_config,
> +};
> +
> +static const u32 pmic50x0_curr_config[] = {
> +	HWMON_C_INPUT,
> +	HWMON_C_INPUT,
> +	HWMON_C_INPUT,
> +	HWMON_C_INPUT,
> +	0
> +};
> +
> +static const struct hwmon_channel_info pmic50x0_curr = {
> +	.type = hwmon_curr,
> +	.config = pmic50x0_curr_config,
> +};
> +
> +static const u32 pmic50x0_power_config[] = {
> +	HWMON_P_INPUT,
> +	HWMON_P_INPUT,
> +	HWMON_P_INPUT,
> +	HWMON_P_INPUT,
> +	HWMON_P_INPUT,
> +	0
> +};
> +
> +static const struct hwmon_channel_info pmic50x0_power = {
> +	.type = hwmon_power,
> +	.config = pmic50x0_power_config,
> +};
> +
> +static const struct hwmon_channel_info *pmic50x0_info[] = {
> +	&pmic50x0_temp,
> +	&pmic50x0_in,
> +	&pmic50x0_curr,
> +	&pmic50x0_power,
> +	NULL
> +};

Use the HWMON_CHANNEL_INFO() macro.

Why are limits not supported ?

> +
> +static const struct hwmon_ops pmic50x0_ops = {
> +	.is_visible = pmic50x0_is_visible,
> +	.read = pmic50x0_read,
> +};
> +
> +static const struct hwmon_chip_info pmic50x0_chip_info = {
> +	.ops = &pmic50x0_ops,
> +	.info = pmic50x0_info
> +};
> +
> +static const struct regmap_config pmic50x0_regmap_config = {
> +	.reg_bits = PMIC50X0_REG_BITS,
> +	.val_bits = PMIC50X0_VAL_BITS,
> +	.max_register = PMIC50X0_MAX_REG_ADDR
> +};
> +
> +static void pmic50x0_update_last_volt(struct pmic50x0 *pmic50x0)
> +{
> +	struct device *dev = pmic50x0->dev;
> +	int i, err;
> +
> +	for (i = 0; i < PMIC50X0_VOLTAGE_CHANNELS; i++) {
> +		err = pmic50x0_in_read(dev, &pmic50x0->last_voltage[i], i);
> +		if (err < 0)
> +			dev_err(dev, "Failed to read voltage (%d)\n", err);
> +	}
> +}

Not acceptable. Implement history like this from userspace.

> +
> +static void pmic50x0_work_callback(struct work_struct *work)
> +{
> +	struct delayed_work *delayed_work = to_delayed_work(work);
> +	struct pmic50x0 *pmic50x0 = container_of(delayed_work, struct pmic50x0, work);
> +	struct pmic50x0_err_reg *reg;
> +	u8 bit, sbit, ebit, i, idx;
> +	unsigned int err_reg;
> +	int err;
> +
> +	pmic50x0_update_last_volt(pmic50x0);
> +
> +	for (i = 0; i < ARRAY_SIZE(pmic50x0_err_regs); i++) {
> +		reg = &pmic50x0->err_regs[i];
> +		err = regmap_read(pmic50x0->regmap, reg->addr, &err_reg);
> +		if (err < 0) {
> +			dev_err(pmic50x0->dev, "Could not read Error Register at %x\n", reg->addr);
> +			continue;
> +		}
> +
> +		/* Checks if error bits changed since last polling interval */
> +		if (err_reg == reg->err_active)
> +			continue;
> +
> +		sbit = reg->sbit;
> +		ebit = reg->ebit;
> +
> +		for (bit = sbit; bit <= ebit; bit++) {
> +			idx = bit - sbit;
> +
> +			if (err_reg & BIT(bit)) {
> +				/* Continue if error is not new */
> +				if (reg->err_active & BIT(bit))
> +					continue;
> +
> +				/* Mark the error bit as active */
> +				reg->err_active |= BIT(bit);
> +				reg->counters[idx]++;
> +
> +				dev_err(pmic50x0->dev, "%s (cnt=%u)\n", reg->err_msgs[idx],
> +					reg->counters[idx]);
> +			} else if (reg->err_active & BIT(bit)) {
> +				/* Error cleared since last polling interval. */
> +				dev_info(pmic50x0->dev, "Error (%s) cleared\n", reg->err_msgs[idx]);
> +
> +				reg->err_active &= ~BIT(bit);
> +			}
> +		}
> +	}
> +
> +	schedule_delayed_work(&pmic50x0->work, msecs_to_jiffies(error_polling_ms));
> +}
> +
> +static void pmic50x0_cancel_work(void *work)
> +{
> +	cancel_delayed_work_sync(work);
> +}
> +
> +static int pmic50x0_work_init(struct device *dev)
> +{
> +	struct pmic50x0 *pmic50x0 = dev_get_drvdata(dev);
> +
> +	INIT_DELAYED_WORK(&pmic50x0->work, pmic50x0_work_callback);
> +	schedule_delayed_work(&pmic50x0->work, msecs_to_jiffies(error_polling_ms));
> +
> +	return devm_add_action_or_reset(dev, pmic50x0_cancel_work, &pmic50x0->work);
> +}

As said before, this is unacceptable. Implement such tracking from userspace.

> +
> +static int pmic50x0_error_init(struct device *dev)
> +{
> +	struct pmic50x0 *pmic50x0 = dev_get_drvdata(dev);
> +	int reg;
> +
> +	pmic50x0->err_regs = devm_kcalloc(dev, ARRAY_SIZE(pmic50x0_err_regs),
> +					  sizeof(*pmic50x0->err_regs), GFP_KERNEL);
> +	if (!pmic50x0->err_regs)
> +		return -ENOMEM;
> +
> +	for (reg = 0; reg < ARRAY_SIZE(pmic50x0_err_regs); reg++) {
> +		pmic50x0->err_regs[reg] = pmic50x0_err_regs[reg];
> +		pmic50x0->err_regs[reg].counters =
> +			devm_kcalloc(dev, pmic50x0->err_regs[reg].size,
> +				     sizeof(*pmic50x0->err_regs[reg].counters), GFP_KERNEL);
> +		if (!pmic50x0->err_regs[reg].counters)
> +			return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +static void pmic50x0_mutexes_destroy(void *arg)
> +{
> +	struct pmic50x0 *pmic50x0 = arg;
> +
> +	mutex_destroy(&pmic50x0->curr_power_mutex);
> +	mutex_destroy(&pmic50x0->voltage_mutex);
> +}
> +
> +static int pmic50x0_mutexes_init(struct pmic50x0 *pmic50x0)
> +{
> +	mutex_init(&pmic50x0->voltage_mutex);
> +	mutex_init(&pmic50x0->curr_power_mutex);
> +
> +	return devm_add_action_or_reset(pmic50x0->dev, pmic50x0_mutexes_destroy, pmic50x0);
> +}

Those mutexes are unnecessary.

> +
> +static int pmic50x0_panic_callback(struct notifier_block *nb,
> +				   unsigned long action, void *data)
> +{
> +	struct pmic50x0 *pmic50x0 = container_of(nb, struct pmic50x0, panic_notifier);
> +
> +	dev_emerg(pmic50x0->dev, "volt(mV): A=%ld, B=%ld, C=%ld, D=%ld\n",
> +		  pmic50x0->last_voltage[0], pmic50x0->last_voltage[1],
> +		  pmic50x0->last_voltage[2], pmic50x0->last_voltage[3]);
> +
> +	return NOTIFY_DONE;
> +}

This is a no-go. If you want to keep track of historic voltages, do it from userspace,
and I don't want to see such panic notifiers in hardware monitoring drivers.

> +
> +static void pmic50x0_panic_notifier_unregister(void *data)
> +{
> +	struct pmic50x0 *pmic50x0 = data;
> +
> +	atomic_notifier_chain_unregister(&panic_notifier_list, &pmic50x0->panic_notifier);
> +}
> +
> +static int pmic50x0_panic_notifier_register(struct pmic50x0 *pmic50x0)
> +{
> +	struct notifier_block *panic_notifier = &pmic50x0->panic_notifier;
> +	struct device *dev = pmic50x0->dev;
> +	int ret;
> +
> +	panic_notifier->notifier_call = pmic50x0_panic_callback;
> +	panic_notifier->priority = 0;
> +
> +	ret = atomic_notifier_chain_register(&panic_notifier_list, panic_notifier);
> +	if (ret) {
> +		dev_err(dev, "failed to register panic notifier (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	return devm_add_action_or_reset(dev, pmic50x0_panic_notifier_unregister, pmic50x0);
> +}
> +
> +static int pmic50x0_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct pmic50x0 *pmic50x0;
> +	struct device *hwmon_dev;
> +	int err;
> +
> +	pmic50x0 = devm_kzalloc(dev, sizeof(*pmic50x0), GFP_KERNEL);
> +	if (!pmic50x0)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(dev, pmic50x0);
> +
> +	pmic50x0->dev = dev;
> +	pmic50x0->regmap = devm_regmap_init_i2c(client, &pmic50x0_regmap_config);
> +	if (IS_ERR(pmic50x0->regmap)) {
> +		dev_err(dev, "init regmap failed!\n");
> +		return PTR_ERR(pmic50x0->regmap);

Use dev_err_probe().

> +	}
> +
> +	err = pmic50x0_error_init(dev);
> +	if (err < 0)
> +		return err;
> +
> +	err = pmic50x0_mutexes_init(pmic50x0);
> +	if (err < 0)
> +		return err;
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, pmic50x0,
> +							 &pmic50x0_chip_info, pmic50x0_err_groups);
> +	if (IS_ERR(hwmon_dev))
> +		return PTR_ERR(hwmon_dev);
> +
> +	err = pmic50x0_panic_notifier_register(pmic50x0);
> +	if (err < 0)
> +		return err;
> +
> +	return pmic50x0_work_init(dev);
> +}
> +
> +static const struct i2c_device_id pmic50x0_ids[] = {
> +	{ PMIC50X0_DRIVER_NAME },
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, pmic50x0_ids);
> +
> +static const struct of_device_id pmic50x0_of_match[] = {
> +	{ .compatible = "jedec,pmic50x0" },
> +	{ },
> +};
> +
> +MODULE_DEVICE_TABLE(of, pmic50x0_of_match);
> +
> +static struct i2c_driver pmic50x0_driver = {
> +	.class		= I2C_CLASS_HWMON,

There is no detect function, so this is pointless.

> +	.driver		= {
> +				.name = PMIC50X0_DRIVER_NAME,
> +				.of_match_table = pmic50x0_of_match,
> +			},
> +	.probe		= pmic50x0_probe,
> +	.id_table	= pmic50x0_ids,
> +};
> +
> +module_i2c_driver(pmic50x0_driver);
> +
> +MODULE_AUTHOR("Almog Ben Shaul <almogbs@amazon.com>");
> +MODULE_DESCRIPTION("JEDEC PMIC50x0 Hardware Monitoring Driver");
> +MODULE_LICENSE("GPL");
