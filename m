Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413186;
	b=iIluyiq/quxkIPLWAqPtIJKXLaK/Tz2PYdkzi0Z4ajoJJqZ5DwA+NYnAQBrrg6elvYlM
	 7IP8DN4mlCohJMXutPzcko8BwamteA5Igd/zSqeYq74uXYtxVMBS0z3sKK4o3Em8yr9Fe
	 ezLoj6xVegD0FEK7BhxzmwyeDhmSwe9awgnnwQsswyk4UirjungvAfC44MQfFLCpXs+bH
	 OXgUt8k/lSXpr76VzIfisvPbIskPlHjL/19MUprnozmEP5RSbbb78esa6m6S7Enixz7Zs
	 kgNXUom1X4I5GynvLleSoDbbo5lDtAgijPP9OFpW3/HaYrXHCogkzdEBdRVNLX7SBoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413186;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=llUXpDDaOMjyfyRgIfDrz1kaDSDAoHSDbFTETwQl+sU=;
	b=3YB7tIOhJTOh3MtpPO3MmF53kZHQdTCfkQ6Qaf6dM6qKPV8OrNVsFZcS7aSSWGWVNDDW
	 8KpQzTu4hKUvdMYPHFYVdGVszA+utFtlq3h3r+uELkNsYUWlzRWBcoiN4A57i3vT6Rp/n
	 fjJZei0XV5NR9QiWxXV+5OI07YRHxgL9PuRgTcaHYmi5GXUdDnRsTI2nmy3c5f8IrOJdD
	 mVMoT+QoQpZ2UicLBhveNDWYn0U1rW1/OfSBZvWVg7KNCmfdWeCpFXhUWQg0xrdramcV1
	 54MI+DpG4bvDF3BwU/jM8VcxqtL4rDr3JY8h+oAGM7XpJ83C8b9NM9MsY+ZwL86RFpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Hlv6JnFj;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBF2606A324
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 16:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECBF2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Hlv6JnFj
Received: from eig-obgw-6001b.ext.cloudfilter.net ([10.0.30.143])
	by cmsmtp with ESMTPS
	id RAVMxaJYqAR1iRAq3xtHQN; Wed, 11 Nov 2026 16:06:19 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id RAq2xWRoydRrRRAq3xusdi; Wed, 11 Nov 2026 16:06:19 +0000
X-Authority-Analysis: v=2.4 cv=LOhmQIW9 c=1 sm=1 tr=0 ts=6af4927b
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=8k6WQxmsAAAA:8
 a=VaRfP0pLmOpoG7BbztEA:9 a=QEXdDO2ut3YA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=llUXpDDaOMjyfyRgIfDrz1kaDSDAoHSDbFTETwQl+sU=; b=Hlv6JnFjf6Qn
	w3nZ0IxUD99jWQkTuCO9s2Crz1yEmdYul915pHzD5wOf3rlm++kdzDpzrB72xT3ynIFydbGBt516R
	8AQqcnbCJYFZAjI3WPIhtj6344wxuGvfhzXsLPsTJBky+Vl1x++15GdffJK2UFQ2G+4i7cIgslJFa
	Yje2yo9N294U316QWdbYjUGcolUlVu/9lXnxzTWccBTCUTjBVBwBC7l1ayw1p8rt8OHoUQcZl3yMY
	eCggFvfe53O3zRdnGB6aUmaKL8y4EQUIo1CAmpsAAkGhrcMzUKulKL1hAIayXUUqyOdAzQWrIXcTN
	elv9Yb4HPfFqXFNAI94obw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:55554)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xRAq2-00000000tVy-25fQ;
	Wed, 11 Nov 2026 21:36:18 +0530
Message-ID: <8328a118-c3f2-4410-9d11-06a80ca79275@roeck-us.net>
Date: Wed, 11 Nov 2026 08:06:17 -0800
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
Subject: Re: [PATCH v1 2/2] hwmon: Add driver for the NCT6801D EC sensor
 window
To: Jiqi Li <lijq9@lenovo.com>, linux-hwmon@vger.kernel.org
Cc: jdelvare@suse.com
References: <20261111091338.799889-1-lijq9@lenovo.com>
 <20261111091338.799889-3-lijq9@lenovo.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261111091338.799889-3-lijq9@lenovo.com>
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
X-Exim-ID: 1xRAq2-00000000tVy-25fQ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:55554
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfC3xllZTcGuiuMugRrr5T1gBhPT3gNlWU7xnSidJjj8WeTjmGwKa6K8mVwN6au1Xxo9jtTu+SWnKj77TK8aNfy57yuFaF+se71/pxOEDDFWaszOZvWoy
 v790ySEYsGUR+HDNyjhGVFJqjDKv7saweqpbHiU44m3LfCG0K//a9FeZTifoI0Ks5i3qQeX5U5FS1Zu+ijvVOHf6UjgUlkvpWAPOIAm7iUg++IRJob8seofb

On 11/11/26 01:13, Jiqi Li wrote:
> The Nuvoton NCT6801D used in the Lenovo P3 TWR G2 does not expose a
> hardware monitor logical device in its Super-I/O configuration space:
> LDN 0Bh is the ATXPGD/BEEP/DDR4 block, so the eSIO-style register window
> that nct6683 relies on does not exist on this part.

Confused. Why add the chip to the nct6683 driver in the first patch
of the series  if it isn't supported by that driver ?

> 
> Fan and temperature values are instead published by the EC firmware in
> one of the shared-memory windows of the SHM logical device (LDN 0Fh),
> which the ACPI firmware maps as
> 
> 	OperationRegion (SHWM, SystemMemory, <base>, 0xFF)
> 

That makes me extremely uncomfortable. It appears that ACPI registers
and accesses the EC, which means that the sensors should be read through
EC to avoid race conditions.

> The window base is not hardcoded: it is read back from the shared-memory
> configuration registers (SHAW1..SHAW5 base address, at indices F7h-F4h,
> FBh-F8h, E3h-E0h, E7h-E4h and EBh-E8h of LDN 0Fh for memory access), as
> documented in the Datasheet. Several windows are normally enabled, so
> each candidate is checked for plausible sensor data before it is
> accepted and an unrelated mapping is never exposed as a sensor device.
> 
> The controller is matched on the full 16-bit Super-I/O ID (registers
> 20h/21h), which reads back as 0113h. The lower nibble carries the device
> variant on this part, so a masked comparison would clear the very bits
> that identify it.
> 

This driver should use a DMI match. I have no idea what "device variant"
means and if/how it is associated to the PC or board manufacturer,
or to what it is related. If the device ID really identifies the "device
variant", what guarantees that the same device variant is not used on
some other system with completely different EC access ?

> The layout inside the window is defined by the platform firmware rather
> than by the controller: the Datasheet specifies the window mechanism but
> no fan or temperature register block inside it. The offsets used here are
> the ones the Lenovo firmware generates for this machine:
> 
>    0x24/0x26/0x28  TD0..TD2 thermal diodes
>    0x30            CPU temperature
>    0x32            PCH temperature
>    0x50            10 fan tachometers, 2 bytes each, big endian RPM
> 
> A machine whose firmware lays the window out differently fails the same
> plausibility check and reports no sensors instead of wrong ones, so
> tying the offsets to this platform does not turn into bad readings
> elsewhere.
> 
> Verified on a Lenovo P3 TWR G2: the driver locates the window
> (0xfe500200) without any module parameter. Under full load the CPU fan
> goes from 808 to 2920 RPM and the CPU temperature from 32 to 100 C. At
> the same moment ACPI TCPU reads 100.05 C, TCPU_PCI 100.00 C,
> x86_pkg_temp 100.00 C and coretemp 101.0 C, i.e. four independent
> sources agree within 1 C. Readings return to idle values when the load
> is removed.
> 
> Signed-off-by: Jiqi Li <lijq9@lenovo.com>
> ---
>   drivers/hwmon/Kconfig          |  17 ++
>   drivers/hwmon/Makefile         |   1 +
>   drivers/hwmon/nct-ec-sensors.c | 507 +++++++++++++++++++++++++++++++++

That is a very generic name for such a driver. It should be named after
the system, not after the EC manufacturer.

THanks,
Guenter

>   3 files changed, 525 insertions(+)
>   create mode 100644 drivers/hwmon/nct-ec-sensors.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 5c2d3ff5fce8..6358ec85c700 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1754,6 +1754,23 @@ config SENSORS_NCT6683
>   	  This driver can also be built as a module. If so, the module
>   	  will be called nct6683.
>   
> +config SENSORS_NCT_EC
> +	tristate "Nuvoton EC sensor window"
> +	depends on HAS_IOPORT
> +	depends on !PPC
> +	help
> +	  If you say yes here you get support for the fan and temperature
> +	  sensors of the Nuvoton NCT6801D embedded controller found in
> +	  Lenovo systems, which are published through the EC shared-memory
> +	  window rather than through a Super-I/O hardware monitor block.
> +
> +	  The window is set up by the platform firmware; the driver only
> +	  reads it. A machine whose firmware lays the window out
> +	  differently reports no sensors rather than wrong readings.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called nct_ec_sensors.
> +
>   config SENSORS_NCT6694
>   	tristate "Nuvoton NCT6694 Hardware Monitor support"
>   	depends on MFD_NCT6694
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 63effc0ab8d1..59b50cf80e9c 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -179,6 +179,7 @@ obj-$(CONFIG_SENSORS_TPS23861)	+= tps23861.o
>   obj-$(CONFIG_SENSORS_MLXREG_FAN) += mlxreg-fan.o
>   obj-$(CONFIG_SENSORS_MENF21BMC_HWMON) += menf21bmc_hwmon.o
>   obj-$(CONFIG_SENSORS_MR75203)	+= mr75203.o
> +obj-$(CONFIG_SENSORS_NCT_EC)	+= nct-ec-sensors.o
>   obj-$(CONFIG_SENSORS_NCT6683)	+= nct6683.o
>   obj-$(CONFIG_SENSORS_NCT6694)	+= nct6694-hwmon.o
>   obj-$(CONFIG_SENSORS_NCT6775_CORE) += nct6775-core.o
> diff --git a/drivers/hwmon/nct-ec-sensors.c b/drivers/hwmon/nct-ec-sensors.c
> new file mode 100644
> index 000000000000..82d048275cba
> --- /dev/null
> +++ b/drivers/hwmon/nct-ec-sensors.c
> @@ -0,0 +1,507 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * nct_ec_sensors - hwmon driver for the Nuvoton EC sensor window
> + *
> + * Copyright (C) 2026 Jiqi Li <lijq9@lenovo.com>
> + *
> + * The Nuvoton NCT6801D embedded controller used in Lenovo systems does
> + * not expose a hardware-monitor logical device in its Super-I/O
> + * configuration space: LDN 0Bh is the ATXPGD/BEEP/DDR4 block, so the
> + * eSIO-style register window that nct6683 relies on does not exist on
> + * this part.
> + *
> + * Fan and temperature values are instead published by the EC firmware in
> + * one of the shared-memory windows of the SHM logical device (LDN 0Fh),
> + * which the ACPI firmware maps as
> + *
> + *	OperationRegion (SHWM, SystemMemory, <base>, 0xFF)
> + *
> + * The window base is not hardcoded. It is read back from the shared-memory
> + * configuration registers of the EC itself (LDN 0Fh, SHAW1..SHAW5 base
> + * address registers at indices F7h-F4h, FBh-F8h, E3h-E0h, E7h-E4h and
> + * EBh-E8h for memory access), which is where the firmware that programmed
> + * the window keeps it. Several windows are usually enabled, so each
> + * candidate is checked for plausible sensor data before it is accepted.
> + *
> + * The layout inside the window is defined by the platform firmware and
> + * not by the controller: the Datasheet specifies the window mechanism but
> + * no fan or temperature register block inside it. Different machines can
> + * therefore lay the same window out differently. The offsets used here
> + * are the ones this machine's firmware generates; a window whose contents
> + * do not match them is rejected instead of being exposed as a sensor
> + * device.
> + *
> + * Fan readings are big endian, in RPM. Temperature readings use the first
> + * byte of each pair and are in degrees Celsius.
> + */
> +
> +#include <linux/hwmon.h>
> +#include <linux/io.h>
> +#include <linux/ioport.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +#define DRVNAME			"nct_ec_sensors"
> +
> +/* Super-I/O configuration ports and registers */
> +#define SIO_PORT_2E		0x2e
> +#define SIO_PORT_4E		0x4e
> +#define SIO_REG_LDSEL		0x07
> +#define SIO_REG_DEVID		0x20
> +#define SIO_LD_SHM		0x0f
> +
> +/* Sensor window geometry */
> +/*
> + * Window span. The firmware maps at least 0x200 bytes from the base, but
> + * only the first 0x100 are needed: the highest offset any layout uses is
> + * 0x50 + 2 * NCT_EC_MAX_FANS = 0x64.
> + */
> +#define SHM_SIZE		0x100
> +#define NCT_EC_MAX_FANS		10
> +
> +/*
> + * Plausibility limits used to tell the sensor window from the other
> + * shared-memory windows the firmware also enables. A candidate that does
> + * not look like sensor data is skipped, so the driver never exposes
> + * garbage readings.
> + */
> +#define TEMP_MAX_C		125
> +#define FAN_MAX_RPM		0x8000
> +
> +/* SHAW1..SHAW5 base address registers, memory-window form */
> +static const u8 nct_ec_shaw_reg[] = { 0xf4, 0xf8, 0xe0, 0xe4, 0xe8 };
> +
> +/*
> + * Controller identification. The device variant is encoded in the lower
> + * nibble of the Super-I/O ID, so the full 16-bit value is compared rather
> + * than the SIO_ID_MASK-masked value nct6683 uses: masking would clear the
> + * very bits that identify the part.
> + */
> +struct nct_ec_chip {
> +	const char *name;
> +	u16 sid;
> +};
> +
> +static const struct nct_ec_chip nct_ec_chips[] = {
> +	{ "NCT6801D", 0x0113 },
> +};
> +
> +struct nct_ec_temp_ch {
> +	u8 reg;
> +	const char *label;
> +};
> +
> +/* Window layout of one machine family */
> +struct nct_ec_layout {
> +	const struct nct_ec_temp_ch *temps;
> +	unsigned int ntemps;
> +	u8 fan_reg;
> +	unsigned int nfans;
> +	const char *const *fan_labels;	/* optional, may be NULL */
> +};
> +
> +#define NCT_EC_TEMP_CH(r, l)	{ .reg = (r), .label = (l) }
> +
> +/*
> + * Layout used by the Lenovo P3 TWR G2, taken from the SHWM field
> + * definition in that platform's DSDT. This is the only layout known to be
> + * correct today; a machine whose firmware lays the window out differently
> + * fails the plausibility check below and gets no sensor device, so
> + * readings are never taken from the wrong offsets.
> + */
> +static const struct nct_ec_temp_ch nct_ec_temps_p3twr[] = {
> +	NCT_EC_TEMP_CH(0x24, "Ambient"),	/* TD0 */
> +	NCT_EC_TEMP_CH(0x26, "VCC_IA VR"),	/* TD1 */
> +	NCT_EC_TEMP_CH(0x28, "Diode 2"),	/* TD2 */
> +	NCT_EC_TEMP_CH(0x30, "CPU"),		/* CPT */
> +	NCT_EC_TEMP_CH(0x32, "PCH"),		/* PHT */
> +};
> +
> +static const char *const nct_ec_fans_p3twr[NCT_EC_MAX_FANS] = {
> +	[0] = "Front",
> +	[4] = "Side",
> +	[5] = "CPU",
> +	[6] = "Rear",
> +};
> +
> +static const struct nct_ec_layout nct_ec_layout_default = {
> +	.temps = nct_ec_temps_p3twr,
> +	.ntemps = ARRAY_SIZE(nct_ec_temps_p3twr),
> +	.fan_reg = 0x50,
> +	.nfans = NCT_EC_MAX_FANS,
> +	.fan_labels = nct_ec_fans_p3twr,
> +};
> +
> +/*
> + * Optional override, mainly for bring-up. Zero means "discover from the
> + * EC configuration space", which is the normal case.
> + */
> +static unsigned long shm_base;
> +module_param(shm_base, ulong, 0444);
> +MODULE_PARM_DESC(shm_base,
> +		 "Physical address of the EC sensor window (0 = auto-detect)");
> +
> +struct nct_ec_data {
> +	void __iomem *regs;
> +	const struct nct_ec_layout *layout;
> +};
> +
> +/* ------------------------------------------------------------------ */
> +/* Super-I/O access                                                    */
> +
> +static int nct_ec_sio_enter(int port)
> +{
> +	if (!request_muxed_region(port, 2, DRVNAME))
> +		return -EBUSY;
> +
> +	outb(0x87, port);
> +	outb(0x87, port);
> +
> +	return 0;
> +}
> +
> +static void nct_ec_sio_exit(int port)
> +{
> +	outb(0xaa, port);
> +	release_region(port, 2);
> +}
> +
> +static u8 nct_ec_sio_inb(int port, u8 reg)
> +{
> +	outb(reg, port);
> +	return inb(port + 1);
> +}
> +
> +static void nct_ec_sio_select(int port, u8 ld)
> +{
> +	outb(SIO_REG_LDSEL, port);
> +	outb(ld, port + 1);
> +}
> +
> +static u32 nct_ec_read_shaw(int port, u8 reg)
> +{
> +	return nct_ec_sio_inb(port, reg) |
> +	       (nct_ec_sio_inb(port, reg + 1) << 8) |
> +	       (nct_ec_sio_inb(port, reg + 2) << 16) |
> +	       ((u32)nct_ec_sio_inb(port, reg + 3) << 24);
> +}
> +
> +static const struct nct_ec_chip *nct_ec_identify(int port)
> +{
> +	u16 sid;
> +	int i;
> +
> +	sid = (nct_ec_sio_inb(port, SIO_REG_DEVID) << 8) |
> +	      nct_ec_sio_inb(port, SIO_REG_DEVID + 1);
> +
> +	for (i = 0; i < ARRAY_SIZE(nct_ec_chips); i++) {
> +		if (nct_ec_chips[i].sid == sid)
> +			return &nct_ec_chips[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +/* ------------------------------------------------------------------ */
> +/* Sensor window discovery                                             */
> +
> +static bool nct_ec_window_valid(struct nct_ec_data *data)
> +{
> +	const struct nct_ec_layout *l = data->layout;
> +	unsigned int i;
> +	int sane_temps = 0;
> +	int sane_fans = 0;
> +
> +	/*
> +	 * A channel reading 0xff means "not connected" on these ECs, which
> +	 * is normal early in boot and on SKUs without every sensor fitted,
> +	 * so require at least one plausible reading rather than all of
> +	 * them. Fans are counted the same way.
> +	 */
> +	for (i = 0; i < l->ntemps; i++) {
> +		u8 t = readb(data->regs + l->temps[i].reg);
> +
> +		if (t != 0xff && t <= TEMP_MAX_C)
> +			sane_temps++;
> +	}
> +
> +	for (i = 0; i < l->nfans; i++) {
> +		u16 rpm = (readb(data->regs + l->fan_reg + i * 2) << 8) |
> +			  readb(data->regs + l->fan_reg + i * 2 + 1);
> +
> +		if (rpm > 0 && rpm < FAN_MAX_RPM)
> +			sane_fans++;
> +	}
> +
> +	return sane_temps > 0 && sane_fans > 0;
> +}
> +
> +static phys_addr_t nct_ec_find_window(const struct nct_ec_layout *layout,
> +				      const struct nct_ec_chip **chip)
> +{
> +	static const int ports[] = { SIO_PORT_2E, SIO_PORT_4E };
> +	struct nct_ec_data probe = { .layout = layout };
> +	u32 bases[ARRAY_SIZE(nct_ec_shaw_reg)];
> +	phys_addr_t found = 0;
> +	int p, i, n;
> +
> +	for (p = 0; p < ARRAY_SIZE(ports) && !found; p++) {
> +		const struct nct_ec_chip *c;
> +		int port = ports[p];
> +
> +		if (nct_ec_sio_enter(port))
> +			continue;
> +
> +		c = nct_ec_identify(port);
> +		if (!c) {
> +			nct_ec_sio_exit(port);
> +			continue;
> +		}
> +
> +		nct_ec_sio_select(port, SIO_LD_SHM);
> +		n = 0;
> +		for (i = 0; i < ARRAY_SIZE(nct_ec_shaw_reg); i++) {
> +			u32 base = nct_ec_read_shaw(port, nct_ec_shaw_reg[i]);
> +
> +			/*
> +			 * SHAWnBA_3-0 == 0 means the window is disabled
> +			 * (Datasheet 5.3.3). The Core side WIN_BASEn
> +			 * register has its own disabled marker, but it is
> +			 * not reachable from the host, so the only further
> +			 * check available here is the content check below.
> +			 */
> +			if (base)
> +				bases[n++] = base;
> +		}
> +		nct_ec_sio_exit(port);
> +
> +		/* Validate outside the configuration-region lock. */
> +		for (i = 0; i < n && !found; i++) {
> +			probe.regs = ioremap(bases[i], SHM_SIZE);
> +			if (!probe.regs)
> +				continue;
> +			if (nct_ec_window_valid(&probe)) {
> +				found = bases[i];
> +				*chip = c;
> +			}
> +			iounmap(probe.regs);
> +		}
> +	}
> +
> +	return found;
> +}
> +
> +/* ------------------------------------------------------------------ */
> +/* hwmon interface                                                     */
> +
> +static int nct_ec_read(struct device *dev, enum hwmon_sensor_types type,
> +		       u32 attr, int channel, long *val)
> +{
> +	struct nct_ec_data *data = dev_get_drvdata(dev);
> +	const struct nct_ec_layout *l = data->layout;
> +	u16 rpm;
> +	u8 t;
> +
> +	switch (type) {
> +	case hwmon_fan:
> +		if (attr != hwmon_fan_input || channel >= l->nfans)
> +			return -EOPNOTSUPP;
> +		rpm = (readb(data->regs + l->fan_reg + channel * 2) << 8) |
> +		      readb(data->regs + l->fan_reg + channel * 2 + 1);
> +		if (rpm == 0xffff)
> +			return -ENODATA;
> +		*val = rpm;
> +		return 0;
> +	case hwmon_temp:
> +		if (attr != hwmon_temp_input || channel >= l->ntemps)
> +			return -EOPNOTSUPP;
> +		t = readb(data->regs + l->temps[channel].reg);
> +		if (t == 0xff)
> +			return -ENODATA;
> +		*val = t * 1000;
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int nct_ec_read_string(struct device *dev, enum hwmon_sensor_types type,
> +			      u32 attr, int channel, const char **str)
> +{
> +	struct nct_ec_data *data = dev_get_drvdata(dev);
> +	const struct nct_ec_layout *l = data->layout;
> +
> +	switch (type) {
> +	case hwmon_fan:
> +		if (attr != hwmon_fan_label || channel >= l->nfans ||
> +		    !l->fan_labels || !l->fan_labels[channel])
> +			return -EOPNOTSUPP;
> +		*str = l->fan_labels[channel];
> +		return 0;
> +	case hwmon_temp:
> +		if (attr != hwmon_temp_label || channel >= l->ntemps ||
> +		    !l->temps[channel].label)
> +			return -EOPNOTSUPP;
> +		*str = l->temps[channel].label;
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static umode_t nct_ec_is_visible(const void *drvdata,
> +				 enum hwmon_sensor_types type,
> +				 u32 attr, int channel)
> +{
> +	const struct nct_ec_data *data = drvdata;
> +
> +	switch (type) {
> +	case hwmon_fan:
> +		if (channel >= data->layout->nfans)
> +			return 0;
> +		if (attr == hwmon_fan_label &&
> +		    (!data->layout->fan_labels ||
> +		     !data->layout->fan_labels[channel]))
> +			return 0;
> +		return 0444;
> +	case hwmon_temp:
> +		if (channel >= data->layout->ntemps)
> +			return 0;
> +		if (attr == hwmon_temp_label &&
> +		    !data->layout->temps[channel].label)
> +			return 0;
> +		return 0444;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static const struct hwmon_channel_info * const nct_ec_info[] = {
> +	HWMON_CHANNEL_INFO(fan,
> +			   HWMON_F_INPUT | HWMON_F_LABEL,
> +			   HWMON_F_INPUT | HWMON_F_LABEL,
> +			   HWMON_F_INPUT | HWMON_F_LABEL,
> +			   HWMON_F_INPUT | HWMON_F_LABEL,
> +			   HWMON_F_INPUT | HWMON_F_LABEL,
> +			   HWMON_F_INPUT | HWMON_F_LABEL,
> +			   HWMON_F_INPUT | HWMON_F_LABEL,
> +			   HWMON_F_INPUT | HWMON_F_LABEL,
> +			   HWMON_F_INPUT | HWMON_F_LABEL,
> +			   HWMON_F_INPUT | HWMON_F_LABEL),
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL),
> +	NULL
> +};
> +
> +static const struct hwmon_ops nct_ec_ops = {
> +	.is_visible = nct_ec_is_visible,
> +	.read = nct_ec_read,
> +	.read_string = nct_ec_read_string,
> +};
> +
> +static const struct hwmon_chip_info nct_ec_chip_info = {
> +	.ops = &nct_ec_ops,
> +	.info = nct_ec_info,
> +};
> +
> +/* ------------------------------------------------------------------ */
> +/* Platform glue                                                       */
> +
> +static int nct_ec_probe(struct platform_device *pdev)
> +{
> +	const struct nct_ec_layout *layout = &nct_ec_layout_default;
> +	const struct nct_ec_chip *chip = NULL;
> +	struct device *dev = &pdev->dev;
> +	struct nct_ec_data *data;
> +	struct device *hwmon;
> +	phys_addr_t base;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->layout = layout;
> +
> +	base = shm_base ? shm_base : nct_ec_find_window(layout, &chip);
> +	if (!base) {
> +		dev_dbg(dev, "no supported Nuvoton EC sensor window found\n");
> +		return -ENODEV;
> +	}
> +
> +	if (!devm_request_mem_region(dev, base, SHM_SIZE, DRVNAME))
> +		return -EBUSY;
> +
> +	data->regs = devm_ioremap(dev, base, SHM_SIZE);
> +	if (!data->regs)
> +		return -ENOMEM;
> +
> +	if (!nct_ec_window_valid(data)) {
> +		if (!shm_base) {
> +			dev_dbg(dev, "rejecting implausible window at %pa\n",
> +				&base);
> +			return -ENODEV;
> +		}
> +		/*
> +		 * The base came from the module parameter, so this is a
> +		 * bring-up session and the caller wants to see what the
> +		 * window actually holds. Say plainly that the values are
> +		 * not trustworthy: with a wrong base they read back as
> +		 * figures like 187 degrees or 25088 RPM.
> +		 */
> +		dev_warn(dev,
> +			 "window at %pa does not look like sensor data, readings will be bogus\n",
> +			 &base);
> +	}
> +
> +	dev_info(dev, "%s EC sensor window at %pa\n",
> +		 chip ? chip->name : "Nuvoton", &base);
> +	platform_set_drvdata(pdev, data);
> +
> +	hwmon = devm_hwmon_device_register_with_info(dev, DRVNAME, data,
> +						     &nct_ec_chip_info, NULL);
> +	return PTR_ERR_OR_ZERO(hwmon);
> +}
> +
> +static struct platform_driver nct_ec_driver = {
> +	.driver = {
> +		.name = DRVNAME,
> +	},
> +	.probe = nct_ec_probe,
> +};
> +
> +static struct platform_device *nct_ec_pdev;
> +
> +static int __init nct_ec_init(void)
> +{
> +	int ret;
> +
> +	ret = platform_driver_register(&nct_ec_driver);
> +	if (ret)
> +		return ret;
> +
> +	nct_ec_pdev = platform_device_register_simple(DRVNAME, -1, NULL, 0);
> +	if (IS_ERR(nct_ec_pdev)) {
> +		ret = PTR_ERR(nct_ec_pdev);
> +		platform_driver_unregister(&nct_ec_driver);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void __exit nct_ec_exit(void)
> +{
> +	platform_device_unregister(nct_ec_pdev);
> +	platform_driver_unregister(&nct_ec_driver);
> +}
> +
> +module_init(nct_ec_init);
> +module_exit(nct_ec_exit);
> +
> +MODULE_AUTHOR("Jiqi Li <lijq9@lenovo.com>");
> +MODULE_DESCRIPTION("Nuvoton EC shared-memory sensor driver");
> +MODULE_LICENSE("GPL");

