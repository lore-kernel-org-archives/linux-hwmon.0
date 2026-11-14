Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794697217;
	b=y1p+hSXtvKe4NGrL0nHLWqiI40n0M6JiwpLxgW4Ts3layTnW2+xHnXZL6vu3vDldAodP
	 J+M1wMKKXSPi9w6JkyQV/qcRzWyYXeGhkxc7rzUv4pQkL7lIHlgriGrkjkpgo1BIvo+Jn
	 ckLMw6HAINImlVG10qIknK5Q4JFkUczTsr9bruGm+yK3zCcjkXDhH2UOJfWkYcPwP4Rkv
	 S7BKuK7eypYbCV/xaPsp5vw3+yFxIfaAusxJweztqVYKyibGiy9uqE7B67l6J7xDsIf/k
	 hukBIw8WeWOD1Lz+VwQeo9rBCa9bEoEm6b7ghsYr9giPz7SElkUxAmkkJPDOTE9mquw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794697217;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=VuW9D3pA4BhYvYUnLJq6d0n5o47qXqC8TniM+h3j4pE=;
	b=PFSeGb0bp5Y4d3c6lAysZJJ3p/c2M9LKO4ERXCKt/kecenQWjfD7cA+ElcrG0AC7JZW2
	 dDKGr4zHMd6D1qYRYbMPe+MNNTgCJhiOhCHg8FVntACSaded7aoEeHLlT3t2gSRWRe7NR
	 fkZP1aE/z3NHyWBLuHbSSjCs7aaWtdA7fgSK1c0ZNOoCEUw05QbGWyqSch25WgmDL/2Hm
	 ReT5iCE9VqXAn+R/lAubgBNNCrQq/cMQzZ1NEOWHOvQ9pudVa9iHryI4o8gvJJzAsh7sp
	 zIc5o1YAX4j5LRfC5VdOC2GNwloyZ1qRFjdxr0jHNjQ3wMcVMc94lGSNf4J2SCHy/yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=AGC6QC+l;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4C4606A33E
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 23:00:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F4C4606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=AGC6QC+l
Received: from eig-obgw-5002b.ext.cloudfilter.net ([10.0.29.226])
	by cmsmtp with ESMTPS
	id SFEZxKXamVK9USMj9xnl39; Sat, 14 Nov 2026 23:00:07 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SMj8x2f8lb2qJSMj9xx84M; Sat, 14 Nov 2026 23:00:07 +0000
X-Authority-Analysis: v=2.4 cv=A7tsP7WG c=1 sm=1 tr=0 ts=6af8e7f7
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=VwQbUJbxAAAA:8 a=ZBqnmy3EhzjIU-0YvnwA:9 a=QEXdDO2ut3YA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=VuW9D3pA4BhYvYUnLJq6d0n5o47qXqC8TniM+h3j4pE=; b=AGC6QC+lLikD
	h/VoD9Mr5iDc0pr3TNismOjfFTHN9vSk8np7bsS+sLD0c1Fhk8uaL6JqFHvTY0gfig/yZE3adB7I+
	2Fq0N6Wi/zj5xYVqyGdPR7WIYpjU/0NykU/oc2/yot8u/YAxsPIbvsoJB/S1TMJy+U8Lw+1ev9D/Z
	E6j8mYzcFzD1ogSGkAymAgWdkfBF11DwKmpcxfA9A9IgjBWDHI+WwsFQGhVqt40oYgZbrK+MJCAMQ
	4PRIzImxjT3QE0+igDxn7DOHV9/JjfnqjR2oCveibMIUYNYnuNBbEx0aOetXrKuw9B7XrQcbT7vhX
	F8SZG2U5hc65vITFJ+/yKQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:46236)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSMj8-00000003CAq-22JM;
	Sun, 15 Nov 2026 04:30:06 +0530
Message-ID: <e8ffe364-5c98-4987-b6bd-c263122aeae8@roeck-us.net>
Date: Sat, 14 Nov 2026 15:00:05 -0800
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
Subject: Re: [PATCH 5/7] hwmon: Add driver for Marvel AlphaServer
 environmental sensors
To: Matt Turner <mattst88@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
References: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
 <20261114-marvel-env-v1-5-890328e4b7e5@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261114-marvel-env-v1-5-890328e4b7e5@gmail.com>
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
X-Exim-ID: 1xSMj8-00000003CAq-22JM
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:46236
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPFSzwtgrBeIlW0hfW8IF5GBVQLsJ5Y8FwWAi7CJG421IUYgmvVQt0qSyclkcNbIEOuDVtIfs5JX4ZFtSO6eubgaEUaYpUHVjOOuhZTuOf5dM5zpJelG
 xf2ujUOcklXgFXtjMoipRFH8N1OwkVyAJO68gcFBtU1eWDTAIqtHHajIgyNcqP4ev/Uf8KSwq4AgWFrZyCivpTk3SbQ22BBE5NB1qtf25CYkCOLvc3xVN9Id

On 11/14/26 09:39, Matt Turner wrote:
> The management firmware of the Marvel (EV7) AlphaServers, the GS1280,
> ES80 and ES47, monitors temperatures, fans, voltages and power supplies.
> The SRM console describes each sensor as a packet in a power and
> environment node of its config tree (GCT), and fills in the readings
> when asked to refresh the node. The packet layout was taken from Tru64
> UNIX.
> 
> Export the sensors through hwmon. Temperatures come with their warning
> and fault thresholds and fans with their warning threshold. Voltages
> export a reading and an alarm, power supplies only an alarm.
> 
> A refresh keeps the boot CPU in the console with interrupts disabled for
> up to 300 ms per node, so refresh a node at most once per
> update_interval.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>   Documentation/hwmon/index.rst      |   1 +
>   Documentation/hwmon/marvel-env.rst |  60 ++++
>   MAINTAINERS                        |   8 +
>   drivers/hwmon/Kconfig              |  11 +
>   drivers/hwmon/Makefile             |   1 +
>   drivers/hwmon/marvel-env.c         | 552 +++++++++++++++++++++++++++++++++++++
>   6 files changed, 633 insertions(+)
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 199ca79621e9..b062ad1ff53f 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -157,6 +157,7 @@ Hardware Monitoring Kernel Drivers
>      ltc4286
>      lx1308
>      macsmc-hwmon
> +   marvel-env
>      max127
>      max15301
>      max16064
> diff --git a/Documentation/hwmon/marvel-env.rst b/Documentation/hwmon/marvel-env.rst
> new file mode 100644
> index 000000000000..db36127c3805
> --- /dev/null
> +++ b/Documentation/hwmon/marvel-env.rst
> @@ -0,0 +1,60 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver marvel-env
> +========================
> +
> +Supported systems:
> +
> +  * Marvel (EV7) AlphaServers: the GS1280, ES80 and ES47 families,
> +    booted from the SRM console
> +
> +Author: Matt Turner <mattst88@gmail.com>
> +
> +Description
> +-----------
> +
> +The management firmware of these machines monitors temperatures, fans,
> +voltages and power supplies, and the SRM console describes each sensor in
> +its configuration tree (GCT). This driver asks the console to refresh the
> +readings and exports them.
> +
> +The console has no sensor names, so the labels are built from the reporting
> +unit (such as ``CMM0`` or ``MBM/PBM``) and the sensor's position in that
> +unit. On systems with more than one drawer the label starts with the
> +cabinet and drawer numbers.
> +
> +A refresh keeps the boot CPU in the console with interrupts disabled for up
> +to 300 ms per unit, so a unit is refreshed at most once every
> +``update_interval`` milliseconds (10000 by default).
> +
> +Sysfs entries
> +-------------
> +
> +=========================== =================================================
> +``update_interval``         Minimum time between refreshes of a unit, in ms
> +
> +``temp[1-*]_input``         Temperature
> +``temp[1-*]_max``           Warning threshold
> +``temp[1-*]_crit``          Fault threshold
> +``temp[1-*]_max_alarm``     Sensor is in the warning or fault state

"fault": Sensor is broken.
"max_alarm": Temperature is too high.

That is distincly different. A faulty sensor should not be reported
as "temperature too high".

> +``temp[1-*]_crit_alarm``    Sensor is in the fault state

"fault" and "critical" have a different meaning. If this is a
fault state (sensor is broken), it should be reported as such.

> +``temp[1-*]_label``         Sensor label
> +
> +``fan[1-*]_input``          Fan speed
> +``fan[1-*]_min``            Warning threshold
> +``fan[1-*]_min_alarm``      Fan is in the warning or fault state

This is wrong since there is also a separate fault attribute,
and "fault" means defective, not "speed too low".

> +``fan[1-*]_fault``          Fan is in the fault state
> +``fan[1-*]_label``          Fan label
> +
> +``in[0-*]_input``           Voltage
> +``in[0-*]_alarm``           Sensor is in the warning or fault state

Which one is it ? Is it distinct ? A "fault" means
that the hardware is broken/defective. An alarm means that
the voltage is too high or too low. A faulty channel
should not be reported as alarm but as fault.

> +``in[0-*]_label``           Sensor label
> +
> +``power[1-*]_alarm``        Power supply is in the warning or fault state
> +``power[1-*]_label``        Power supply label

"power" is supposed to report the system power, not
a "power supply warning or fault state". If there is
nothing else, this should be identical to the matching
inX_alarm and/or inX_fault attribute.

Thanks,
Guenter

> +=========================== =================================================
> +
> +Sensors that the console reports as unknown or not present when the driver
> +loads are not exported. If a sensor becomes unknown later, reading its input
> +attribute fails with ``-ENODATA``, as does reading the alarm of a voltage
> +sensor or power supply.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93abbb315065..09dee8fab9ec 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16100,6 +16100,14 @@ L:	linux-mips@vger.kernel.org
>   S:	Maintained
>   F:	arch/mips/boot/dts/img/pistachio*
>   
> +MARVEL ALPHASERVER ENVIRONMENTAL SENSOR DRIVER
> +M:	Matt Turner <mattst88@gmail.com>
> +L:	linux-hwmon@vger.kernel.org
> +L:	linux-alpha@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/hwmon/marvel-env.rst
> +F:	drivers/hwmon/marvel-env.c
> +
>   MARVELL 88E6XXX ETHERNET SWITCH FABRIC DRIVER
>   M:	Andrew Lunn <andrew@lunn.ch>
>   L:	netdev@vger.kernel.org
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 18c682e1a475..50a1bf966f30 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1255,6 +1255,17 @@ config SENSORS_MACSMC_HWMON
>   	  This driver can also be built as a module. If so, the module will
>   	  be called macsmc-hwmon.
>   
> +config SENSORS_MARVEL_ENV
> +	tristate "Marvel (EV7) AlphaServer environmental sensors"
> +	depends on ALPHA_MARVEL || ALPHA_GENERIC
> +	help
> +	  If you say yes here you get support for the temperature, fan,
> +	  voltage and power supply sensors of Marvel AlphaServers (the
> +	  GS1280, ES80 and ES47), as described by the SRM console.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called marvel-env.
> +
>   config SENSORS_MAX1111
>   	tristate "Maxim MAX1111 Serial 8-bit ADC chip and compatibles"
>   	depends on SPI_MASTER
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index d4c345ed7261..2b1b1850d641 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -157,6 +157,7 @@ obj-$(CONFIG_SENSORS_LTC4282)	+= ltc4282.o
>   obj-$(CONFIG_SENSORS_LTC4283)	+= ltc4283.o
>   obj-$(CONFIG_SENSORS_LTQ_CPUTEMP) += ltq-cputemp.o
>   obj-$(CONFIG_SENSORS_MACSMC_HWMON)	+= macsmc-hwmon.o
> +obj-$(CONFIG_SENSORS_MARVEL_ENV)	+= marvel-env.o
>   obj-$(CONFIG_SENSORS_MAX1111)	+= max1111.o
>   obj-$(CONFIG_SENSORS_MAX127)	+= max127.o
>   obj-$(CONFIG_SENSORS_MAX16065)	+= max16065.o
> diff --git a/drivers/hwmon/marvel-env.c b/drivers/hwmon/marvel-env.c
> new file mode 100644
> index 000000000000..cdc7e059e17b
> --- /dev/null
> +++ b/drivers/hwmon/marvel-env.c
> @@ -0,0 +1,552 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Environmental sensors of Marvel (EV7) AlphaServers: the GS1280, ES80 and
> + * ES47 families.
> + *
> + * The SRM console describes every sensor in the config tree (GCT). Each power
> + * and environment (P&E) node may carry a list of environmental packets:
> + * temperature and voltage sensors, fans and power supplies. The console fills
> + * in the readings when asked to refresh the node. The packet layout was
> + * taken from Tru64 UNIX.
> + */
> +
> +#include <linux/hwmon.h>
> +#include <linux/jiffies.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +
> +#include <asm/gct.h>
> +#include <asm/marvel_env.h>
> +
> +#define DRVNAME "marvel_env"
> +
> +#define GCT_TYPE_PE		0x13
> +#define GCT_FLAGS_REQUIRED	BIT(9)
> +#define GCT_FLAGS_EXCLUDED	(BIT(2) | BIT(7) | BIT(12) | BIT(14))
> +
> +/* Packet types. */
> +#define ENV_PKT_POWER_SUPPLY	0x08
> +#define ENV_PKT_FAN		0x09
> +#define ENV_PKT_SENSOR		0x2a
> +
> +/*
> + * Sensor packet: kind, status, reading, high warning, high fault.
> + * Temperatures are in tenths of a degree Celsius, voltages in millivolts.
> + * For voltages the two thresholds look like the nominal voltage and an upper
> + * limit, so they are not exported.
> + */
> +#define SENSOR_KIND		0x28
> +#define SENSOR_STATUS		0x2c
> +#define SENSOR_VALUE		0x30
> +#define SENSOR_WARN		0x34
> +#define SENSOR_FAULT		0x38
> +#define SENSOR_SIZE		0x3c
> +
> +#define SENSOR_KIND_THERMAL	2
> +#define SENSOR_KIND_VOLT_FIRST	3
> +#define SENSOR_KIND_VOLT_LAST	5
> +
> +/* Fan packet: status, rpm, low warning, low fault. */
> +#define FAN_STATUS		0x24
> +#define FAN_VALUE		0x28
> +#define FAN_WARN		0x2c
> +#define FAN_SIZE		0x34
> +
> +/* Power supply packet: status. */
> +#define PS_STATUS		0x24
> +#define PS_SIZE			0x28
> +
> +/* Status values, in the low byte of the status word. */
> +#define ENV_OK			0
> +#define ENV_WARNING		1
> +#define ENV_FAULT		2
> +#define ENV_UNKNOWN		0xfe
> +#define ENV_NOT_PRESENT		0xff
> +
> +/* Console status of a refresh that Tru64 also treats as success. */
> +#define CFGTREE_STATUS_OK2	(-0x4a)
> +
> +struct marvel_env_node {
> +	gct6_node *node;
> +	unsigned long offset;		/* from the start of the GCT */
> +	unsigned long last_refresh;
> +	bool valid;
> +	unsigned int cabinet, drawer, pe;
> +};
> +
> +struct marvel_env_chan {
> +	struct marvel_env_node *node;
> +	unsigned int pkt;		/* packet offset in the node */
> +	char label[32];
> +};
> +
> +struct marvel_env_data {
> +	struct device *dev;
> +	struct mutex lock;		/* serializes refreshes and reads */
> +	unsigned int update_interval;	/* ms */
> +	struct marvel_env_node *nodes;
> +	unsigned int nr_nodes;
> +	struct marvel_env_chan *chans[hwmon_max];
> +	unsigned int nr_chans[hwmon_max];
> +};
> +
> +static const char * const pe_names[] = {
> +	[0x09] = "MBM",
> +	[0x0a] = "MBM/PBM",
> +	[0x0c] = "PS",
> +	[0x0d] = "FAN",
> +	[0x0f] = "CMM0", [0x10] = "CMM1", [0x11] = "CMM2", [0x12] = "CMM3",
> +	[0x14] = "VRM0", [0x15] = "VRM1", [0x16] = "VRM2", [0x17] = "VRM3",
> +	[0x19] = "PBM",
> +	[0x1a] = "XSHELF",
> +	[0x1b] = "PCIPS",
> +	[0x1c] = "PCIFANS",
> +};
> +
> +static inline u32 env_rd(struct marvel_env_node *n, unsigned int off)
> +{
> +	return *(u32 *)((char *)n->node + off);
> +}
> +
> +static inline u8 env_status(struct marvel_env_node *n, unsigned int off)
> +{
> +	return env_rd(n, off) & 0xff;
> +}
> +
> +static bool env_status_valid(u8 status)
> +{
> +	return status != ENV_UNKNOWN && status != ENV_NOT_PRESENT;
> +}
> +
> +static bool env_status_alarm(u8 status)
> +{
> +	return status == ENV_WARNING || status == ENV_FAULT;
> +}
> +
> +static unsigned int env_status_off(enum hwmon_sensor_types type)
> +{
> +	switch (type) {
> +	case hwmon_fan:
> +		return FAN_STATUS;
> +	case hwmon_power:
> +		return PS_STATUS;
> +	default:
> +		return SENSOR_STATUS;
> +	}
> +}
> +
> +static inline gct6_node *gct_node(gct6_handle h)
> +{
> +	return GCT_NODE_PTR(h);
> +}
> +
> +/* Cabinet and drawer come from the P&E node's parent. */
> +static void marvel_env_keys(struct marvel_env_node *n)
> +{
> +	gct6_node *parent = n->node->parent ? gct_node(n->node->parent) : NULL;
> +
> +	n->pe = n->node->id & 0xff;
> +	if (!parent)
> +		return;
> +	if (parent->type == GCT_TYPE_PE && parent->subtype == 0x3d)
> +		n->cabinet = (parent->id >> 48) & 0xff;
> +	else
> +		n->cabinet = (parent->id >> 48) & 0x3f;
> +	n->drawer = (parent->id >> 32) & 0xff;
> +}
> +
> +static int marvel_env_refresh(struct marvel_env_data *data,
> +			      struct marvel_env_node *n)
> +{
> +	long status;
> +
> +	if (n->valid && time_before(jiffies, n->last_refresh +
> +				    msecs_to_jiffies(data->update_interval)))
> +		return 0;
> +
> +	status = marvel_cfgtree_partial_update(n->offset);
> +	if (status != 1 && status != CFGTREE_STATUS_OK2) {
> +		dev_warn_ratelimited(data->dev,
> +				     "refresh of GCT node %#lx failed: %ld\n",
> +				     n->offset, status);
> +		return -EIO;
> +	}
> +	n->last_refresh = jiffies;
> +	n->valid = true;
> +	return 0;
> +}
> +
> +/* The hwmon type of a packet, or hwmon_max to skip it. */
> +static enum hwmon_sensor_types marvel_env_pkt_type(struct marvel_env_node *n,
> +						   unsigned int pkt,
> +						   unsigned int type)
> +{
> +	unsigned int len = env_rd(n, pkt) & 0xffff;
> +	u32 kind;
> +
> +	switch (type) {
> +	case ENV_PKT_SENSOR:
> +		if (len < SENSOR_SIZE)
> +			break;
> +		kind = env_rd(n, pkt + SENSOR_KIND);
> +		if (kind == SENSOR_KIND_THERMAL)
> +			return hwmon_temp;
> +		if (kind >= SENSOR_KIND_VOLT_FIRST && kind <= SENSOR_KIND_VOLT_LAST)
> +			return hwmon_in;
> +		break;
> +	case ENV_PKT_FAN:
> +		if (len >= FAN_SIZE)
> +			return hwmon_fan;
> +		break;
> +	case ENV_PKT_POWER_SUPPLY:
> +		if (len >= PS_SIZE)
> +			return hwmon_power;
> +		break;
> +	}
> +	return hwmon_max;
> +}
> +
> +static void marvel_env_add_chan(struct marvel_env_data *data,
> +				struct marvel_env_node *n, unsigned int pkt,
> +				enum hwmon_sensor_types type,
> +				unsigned int index)
> +{
> +	static const char * const what[hwmon_max] = {
> +		[hwmon_temp] = "Temp", [hwmon_fan] = "Fan",
> +		[hwmon_in] = "Volt", [hwmon_power] = "PS",
> +	};
> +	struct marvel_env_chan *c;
> +	const char *pe = NULL;
> +	size_t len = 0;
> +
> +	c = &data->chans[type][data->nr_chans[type]++];
> +	c->node = n;
> +	c->pkt = pkt;
> +
> +	if (n->cabinet || n->drawer)
> +		len = scnprintf(c->label, sizeof(c->label), "Cab%u Dra%u ",
> +				n->cabinet, n->drawer);
> +
> +	if (n->pe < ARRAY_SIZE(pe_names))
> +		pe = pe_names[n->pe];
> +	if (pe && !strncasecmp(pe, what[type], strlen(what[type])))
> +		scnprintf(c->label + len, sizeof(c->label) - len, "%s %u",
> +			  pe, index);
> +	else if (pe)
> +		scnprintf(c->label + len, sizeof(c->label) - len, "%s %s %u",
> +			  pe, what[type], index);
> +	else
> +		scnprintf(c->label + len, sizeof(c->label) - len, "PE%u %s %u",
> +			  n->pe, what[type], index);
> +}
> +
> +/*
> + * Walk a P&E node's packets, counting them, or adding them when @add. The
> + * header at hd_extension holds the count at +0x10 and the offset of the
> + * first packet at +0x14. As Tru64 does, visit count + 1 packets and number
> + * sensors from their position minus one.
> + */
> +static void marvel_env_walk(struct marvel_env_data *data,
> +			    struct marvel_env_node *n, bool add)
> +{
> +	unsigned int size = n->node->size;
> +	unsigned int hdr = n->node->hd_extension;
> +	unsigned int count, pkt, i;
> +
> +	if (!hdr || hdr + 0x18 > size)
> +		return;
> +	count = env_rd(n, hdr + 0x10);
> +	pkt = env_rd(n, hdr + 0x14);
> +
> +	for (i = 0; i <= count; i++) {
> +		enum hwmon_sensor_types type;
> +		unsigned int len, pkt_type;
> +
> +		if (pkt < 8 || pkt + 8 > size)
> +			break;
> +		len = env_rd(n, pkt) & 0xffff;
> +		pkt_type = env_rd(n, pkt + 4) & 0xffff;
> +		if (len < 8 || pkt + len > size)
> +			break;
> +
> +		type = marvel_env_pkt_type(n, pkt, pkt_type);
> +		if (type != hwmon_max && add)
> +			marvel_env_add_chan(data, n, pkt, type,
> +					    pkt_type == ENV_PKT_SENSOR && i ?
> +					    i - 1 : i);
> +		else if (type != hwmon_max)
> +			data->nr_chans[type]++;
> +		pkt += len;
> +	}
> +}
> +
> +/* Collect the P&E nodes with an environmental packet list. */
> +static void marvel_env_find_nodes(struct marvel_env_data *data,
> +				  gct6_node *node, bool record)
> +{
> +	for (; node; node = node->next ? gct_node(node->next) : NULL) {
> +		if (node->magic != GCT_NODE_MAGIC)
> +			return;
> +		if (node->type == GCT_TYPE_PE && node->hd_extension &&
> +		    (node->flags & GCT_FLAGS_REQUIRED) &&
> +		    !(node->flags & GCT_FLAGS_EXCLUDED)) {
> +			if (record) {
> +				struct marvel_env_node *n =
> +					&data->nodes[data->nr_nodes];
> +
> +				n->node = node;
> +				n->offset = (char *)node - (char *)gct_node(0);
> +				marvel_env_keys(n);
> +			}
> +			data->nr_nodes++;
> +		}
> +		if (node->child)
> +			marvel_env_find_nodes(data, gct_node(node->child),
> +					      record);
> +	}
> +}
> +
> +static umode_t marvel_env_is_visible(const void *drvdata,
> +				     enum hwmon_sensor_types type,
> +				     u32 attr, int channel)
> +{
> +	const struct marvel_env_data *data = drvdata;
> +	const struct marvel_env_chan *c;
> +
> +	if (type == hwmon_chip)
> +		return 0644;
> +
> +	/* Hide sensors that are absent when the driver loads. */
> +	c = &data->chans[type][channel];
> +	if (!env_status_valid(env_status(c->node, c->pkt + env_status_off(type))))
> +		return 0;
> +	return 0444;
> +}
> +
> +static int marvel_env_read(struct device *dev, enum hwmon_sensor_types type,
> +			   u32 attr, int channel, long *val)
> +{
> +	struct marvel_env_data *data = dev_get_drvdata(dev);
> +	struct marvel_env_chan *c;
> +	struct marvel_env_node *n;
> +	unsigned int pkt;
> +	u8 status;
> +	int ret;
> +
> +	if (type == hwmon_chip) {
> +		*val = data->update_interval;
> +		return 0;
> +	}
> +
> +	c = &data->chans[type][channel];
> +	n = c->node;
> +	pkt = c->pkt;
> +
> +	mutex_lock(&data->lock);
> +	ret = marvel_env_refresh(data, n);
> +	if (ret)
> +		goto out;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		status = env_status(n, pkt + SENSOR_STATUS);
> +		switch (attr) {
> +		case hwmon_temp_input:
> +			if (!env_status_valid(status))
> +				ret = -ENODATA;
> +			else
> +				*val = (s32)env_rd(n, pkt + SENSOR_VALUE) * 100L;
> +			break;
> +		case hwmon_temp_max:
> +			*val = (s32)env_rd(n, pkt + SENSOR_WARN) * 100L;
> +			break;
> +		case hwmon_temp_crit:
> +			*val = (s32)env_rd(n, pkt + SENSOR_FAULT) * 100L;
> +			break;
> +		case hwmon_temp_max_alarm:
> +			*val = env_status_alarm(status);
> +			break;
> +		case hwmon_temp_crit_alarm:
> +			*val = status == ENV_FAULT;
> +			break;
> +		default:
> +			ret = -EOPNOTSUPP;
> +		}
> +		break;
> +	case hwmon_fan:
> +		status = env_status(n, pkt + FAN_STATUS);
> +		switch (attr) {
> +		case hwmon_fan_input:
> +			if (!env_status_valid(status))
> +				ret = -ENODATA;
> +			else
> +				*val = env_rd(n, pkt + FAN_VALUE);
> +			break;
> +		case hwmon_fan_min:
> +			*val = env_rd(n, pkt + FAN_WARN);
> +			break;
> +		case hwmon_fan_min_alarm:
> +			*val = env_status_alarm(status);
> +			break;
> +		case hwmon_fan_fault:
> +			*val = status == ENV_FAULT;
> +			break;
> +		default:
> +			ret = -EOPNOTSUPP;
> +		}
> +		break;
> +	case hwmon_in:
> +	case hwmon_power:
> +		status = env_status(n, pkt + env_status_off(type));
> +		if (!env_status_valid(status))
> +			ret = -ENODATA;
> +		else if (type == hwmon_in && attr == hwmon_in_input)
> +			*val = (s32)env_rd(n, pkt + SENSOR_VALUE);
> +		else
> +			*val = env_status_alarm(status);
> +		break;
> +	default:
> +		ret = -EOPNOTSUPP;
> +	}
> +out:
> +	mutex_unlock(&data->lock);
> +	return ret;
> +}
> +
> +static int marvel_env_write(struct device *dev, enum hwmon_sensor_types type,
> +			    u32 attr, int channel, long val)
> +{
> +	struct marvel_env_data *data = dev_get_drvdata(dev);
> +
> +	if (type != hwmon_chip || attr != hwmon_chip_update_interval)
> +		return -EOPNOTSUPP;
> +
> +	mutex_lock(&data->lock);
> +	data->update_interval = clamp_val(val, 0, 3600 * MSEC_PER_SEC);
> +	mutex_unlock(&data->lock);
> +	return 0;
> +}
> +
> +static int marvel_env_read_string(struct device *dev,
> +				  enum hwmon_sensor_types type, u32 attr,
> +				  int channel, const char **str)
> +{
> +	struct marvel_env_data *data = dev_get_drvdata(dev);
> +
> +	*str = data->chans[type][channel].label;
> +	return 0;
> +}
> +
> +static const struct hwmon_ops marvel_env_ops = {
> +	.is_visible = marvel_env_is_visible,
> +	.read = marvel_env_read,
> +	.write = marvel_env_write,
> +	.read_string = marvel_env_read_string,
> +};
> +
> +static const struct {
> +	enum hwmon_sensor_types type;
> +	u32 config;
> +} marvel_env_hwmon[] = {
> +	{ hwmon_temp, HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
> +		      HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM | HWMON_T_LABEL },
> +	{ hwmon_fan, HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_MIN_ALARM |
> +		     HWMON_F_FAULT | HWMON_F_LABEL },
> +	{ hwmon_in, HWMON_I_INPUT | HWMON_I_ALARM | HWMON_I_LABEL },
> +	{ hwmon_power, HWMON_P_ALARM | HWMON_P_LABEL },
> +};
> +
> +static const struct hwmon_channel_info * const marvel_env_chip_info =
> +	HWMON_CHANNEL_INFO(chip, HWMON_C_UPDATE_INTERVAL);
> +
> +static int marvel_env_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	const struct hwmon_channel_info **info;
> +	struct marvel_env_data *data;
> +	struct hwmon_chip_info *chip;
> +	struct device *hwmon;
> +	unsigned int i, k, nr_info = 0;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +	data->dev = dev;
> +	data->update_interval = 10 * MSEC_PER_SEC;
> +	mutex_init(&data->lock);
> +
> +	marvel_env_find_nodes(data, gct_node(0), false);
> +	if (!data->nr_nodes)
> +		return -ENODEV;
> +	data->nodes = devm_kcalloc(dev, data->nr_nodes, sizeof(*data->nodes),
> +				   GFP_KERNEL);
> +	if (!data->nodes)
> +		return -ENOMEM;
> +	data->nr_nodes = 0;
> +	marvel_env_find_nodes(data, gct_node(0), true);
> +
> +	for (i = 0; i < data->nr_nodes; i++) {
> +		marvel_env_refresh(data, &data->nodes[i]);
> +		marvel_env_walk(data, &data->nodes[i], false);
> +	}
> +
> +	info = devm_kcalloc(dev, ARRAY_SIZE(marvel_env_hwmon) + 2,
> +			    sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +	info[nr_info++] = marvel_env_chip_info;
> +
> +	for (k = 0; k < ARRAY_SIZE(marvel_env_hwmon); k++) {
> +		enum hwmon_sensor_types type = marvel_env_hwmon[k].type;
> +		struct hwmon_channel_info *ci;
> +		u32 *config;
> +
> +		if (!data->nr_chans[type])
> +			continue;
> +		data->chans[type] = devm_kcalloc(dev, data->nr_chans[type],
> +						 sizeof(*data->chans[type]),
> +						 GFP_KERNEL);
> +		ci = devm_kzalloc(dev, sizeof(*ci), GFP_KERNEL);
> +		config = devm_kcalloc(dev, data->nr_chans[type] + 1,
> +				      sizeof(*config), GFP_KERNEL);
> +		if (!data->chans[type] || !ci || !config)
> +			return -ENOMEM;
> +		for (i = 0; i < data->nr_chans[type]; i++)
> +			config[i] = marvel_env_hwmon[k].config;
> +		ci->type = type;
> +		ci->config = config;
> +		info[nr_info++] = ci;
> +		data->nr_chans[type] = 0;
> +	}
> +	if (nr_info == 1)
> +		return -ENODEV;
> +
> +	for (i = 0; i < data->nr_nodes; i++)
> +		marvel_env_walk(data, &data->nodes[i], true);
> +
> +	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +	chip->ops = &marvel_env_ops;
> +	chip->info = info;
> +
> +	hwmon = devm_hwmon_device_register_with_info(dev, DRVNAME, data, chip,
> +						     NULL);
> +	return PTR_ERR_OR_ZERO(hwmon);
> +}
> +
> +static struct platform_driver marvel_env_driver = {
> +	.driver = {
> +		.name = DRVNAME,
> +	},
> +	.probe = marvel_env_probe,
> +};
> +module_platform_driver(marvel_env_driver);
> +
> +MODULE_ALIAS("platform:" DRVNAME);
> +MODULE_DESCRIPTION("Marvel (EV7) AlphaServer environmental sensors");
> +MODULE_LICENSE("GPL");
> 

