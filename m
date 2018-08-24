Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45328 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726645AbeHYAEv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Aug 2018 20:04:51 -0400
Date: Fri, 24 Aug 2018 13:28:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tejun Heo <tj@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>, linux-ide@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        smartmontools-support@listi.jpberlin.de
Subject: Re: [PATCH v1] libata: Add hwmon support for SMART temperature
 sensors
Message-ID: <20180824202838.GC18715@roeck-us.net>
References: <20180824191514.14938-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180824191514.14938-1-linus.walleij@linaro.org>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Aug 24, 2018 at 09:15:14PM +0200, Linus Walleij wrote:
> S.M.A.R.T. temperature sensors have been supported for
> years by userspace tools such as smarttools.
> 
> The temperature readout is however also a good fit for
> Linux' hwmon subsystem. By adding a hwmon interface to dig
> out SMART parameter 194, we can expose the drive temperature
> as a standard hwmon sensor.
> 
> The idea came about when experimenting with NAS enclosures
> that lack their own on-board sensors but instead piggy-back
> the sensor found in the harddrive, if any, to decide on a
> policy for driving the on-board fan.
> 
> The kernel thermal subsystem supports defining a thermal
> policy for the enclosure using the device tree, see e.g.:
> arch/arm/boot/dts/gemini-dlink-dns-313.dts
> but this requires a proper hwmon sensor integrated with
> the kernel.
> 
> This is a first attempt at providing a kernel-internal
> hwmon sensor for ATA drives. It is possible to do the
> same for SCSI, NVME etc, but their protocols and
> peculiarities seem to require a per-subsystem implementation.
> They would all end up in the same namespace using the
> SCSI name such as "sd_0:0:0:0".
> 
> With this driver, the hard disk temperatur can be read from
> sysfs:
> 
>  > cd /sys/class/hwmon/hwmon0/
>  > cat temp1_input
>  38
> 
> If the harddrive supports one of the detected vendor
> extensions for providing min/max temperatures we also
> register attributes for displaying that.
> 
> This likely means that they can also be handled by
> userspace tools such as lm_sensors in a uniform way
> without need for any special tools such as "hddtemp"
> (which seems dormant) though I haven't tested it.
> 
> This driver does not block any simultaneous use of
> other SMART userspace tools, it's a both/and approach,
> not either/or.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog RFC->v1:
> - Put includes in alphabetical order.
> - Octal 00444 instead of S_IRUGO
> - Avoid double negations in temperature range test
> - Allocate a sector buffer in the state container
> - Break out the SMART property parser to its own function
> - Sink error codes into property parser
> - Drop registration info print
> - Use return PTR_ERR_OR_ZERO() in probe
> - Make the hwmon device a local variable in probe()
> - Use Guenthers Kconfig trick to avoid exporting the
>   probe call
> - Return temperatures in millicelsus
> - Demote initial temperature to dev_dbg()
> - Dynamically decide whether to display just temperature
>   or also min/max temperatures depending on what the SMART
>   sensor can provide
> TODO:
> - How does this interoperate with SCSI or NVME drives?
>   They have SMART extensions but it is tunneled through
>   ATA?
> - Guenther's preferred device name format?
> ---
>  drivers/ata/Kconfig        |  13 ++
>  drivers/ata/Makefile       |   1 +
>  drivers/ata/libata-hwmon.c | 461 +++++++++++++++++++++++++++++++++++++
>  drivers/ata/libata-hwmon.h |  15 ++
>  drivers/ata/libata-scsi.c  |   2 +
>  5 files changed, 492 insertions(+)
>  create mode 100644 drivers/ata/libata-hwmon.c
>  create mode 100644 drivers/ata/libata-hwmon.h
> 
> diff --git a/drivers/ata/Kconfig b/drivers/ata/Kconfig
> index 2b16e7c8fff3..e7642e6d5c01 100644
> --- a/drivers/ata/Kconfig
> +++ b/drivers/ata/Kconfig
> @@ -59,6 +59,19 @@ config ATA_ACPI
>  	  You can disable this at kernel boot time by using the
>  	  option libata.noacpi=1
>  
> +config ATA_HWMON
> +	bool "ATA S.M.A.R.T. HWMON support"
> +	depends on (ATA=m && HWMON) || HWMON=y
> +	help
> +	  This options compiles in code to support temperature reading
> +	  from an ATA device using the S.M.A.R.T. (Self-Monitoring,
> +	  Analysis and Reporting Technology) support for temperature
> +	  sensors found in some hard drives. The drive will be probed
> +	  to figure out if it has a temperature sensor, and if it does
> +	  the kernel hardware monitor framework will be utilized to
> +	  interact with the sensor. This work orthogonal to any userspace
> +	  S.M.A.R.T. access tools.
> +
>  config SATA_ZPODD
>  	bool "SATA Zero Power Optical Disc Drive (ZPODD) support"
>  	depends on ATA_ACPI && PM
> diff --git a/drivers/ata/Makefile b/drivers/ata/Makefile
> index d21cdd83f7ab..7a22b27c66c0 100644
> --- a/drivers/ata/Makefile
> +++ b/drivers/ata/Makefile
> @@ -126,3 +126,4 @@ libata-$(CONFIG_ATA_SFF)	+= libata-sff.o
>  libata-$(CONFIG_SATA_PMP)	+= libata-pmp.o
>  libata-$(CONFIG_ATA_ACPI)	+= libata-acpi.o
>  libata-$(CONFIG_SATA_ZPODD)	+= libata-zpodd.o
> +libata-$(CONFIG_ATA_HWMON)	+= libata-hwmon.o
> diff --git a/drivers/ata/libata-hwmon.c b/drivers/ata/libata-hwmon.c
> new file mode 100644
> index 000000000000..1c3fab1984d3
> --- /dev/null
> +++ b/drivers/ata/libata-hwmon.c
> @@ -0,0 +1,461 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Hwmon client for ATA S.M.A.R.T. hard disk drivers
> + * (C) 2018 Linus Walleij
> + *
> + * This code is based on know-how and examples from the
> + * smartmontools by Bruce Allen, Christian Franke et al.
> + * (C) 2002-2018
> + */
> +
> +#include <linux/ata.h>
> +#include <linux/device.h>
> +#include <linux/hwmon.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/slab.h>
> +#include <scsi/scsi_cmnd.h>
> +#include <scsi/scsi_device.h>
> +
> +#include "libata-hwmon.h"
> +
> +#define ATA_MAX_SMART_ATTRS 30
> +#define SMART_TEMP_PROP_194 194
> +
> +enum ata_temp_format {
> +	ATA_TEMP_FMT_TT_XX_00_00_00_00,
> +	ATA_TEMP_FMT_TT_XX_LL_HH_00_00,
> +	ATA_TEMP_FMT_TT_LL_HH_00_00_00,
> +	ATA_TEMP_FMT_TT_XX_LL_XX_HH_XX,
> +	ATA_TEMP_FMT_TT_XX_HH_XX_LL_XX,
> +	ATA_TEMP_FMT_TT_XX_LL_HH_CC_CC,
> +	ATA_TEMP_FMT_UNKNOWN,
> +};
> +
> +/**
> + * struct ata_hwmon - device instance state
> + * @dev: parent device
> + * @sdev: associated SCSI device
> + * @tfmt: temperature format
> + * @smartdata: buffer for reading in the SMART "sector"
> + */
> +struct ata_hwmon {
> +	struct device *dev;
> +	struct scsi_device *sdev;
> +	enum ata_temp_format tfmt;
> +	u8 smartdata[ATA_SECT_SIZE];
> +};
> +
> +static umode_t ata_hwmon_is_visible(const void *data,
> +				    enum hwmon_sensor_types type,
> +				    u32 attr, int channel)
> +{
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_input:
> +		case hwmon_temp_min:
> +		case hwmon_temp_max:
> +			/* Readable for everyone */
> +			return 00444;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static int check_temp_word(u16 word)
> +{
> +	if (word <= 0x7f)
> +		return 0x11; /* >= 0, signed byte or word */
> +	if (word <= 0xff)
> +		return 0x01; /* < 0, signed byte */
> +	if (word > 0xff80)
> +		return 0x10; /* < 0, signed word */
> +	return 0x00;
> +}
> +
> +static bool ata_check_temp_range(int t, u8 t1, u8 t2)
> +{
> +	int lo = (s8)t1;
> +	int hi = (s8)t2;
> +
> +	/* This is obviously wrong */
> +	if (lo > hi)
> +		return false;
> +
> +	/*
> +	 * If -60 <= lo <= t <= hi <= 120 and
> +	 * and lo != -1 and hi > 0, then we have valid lo and hi
> +	 */
> +	if (-60 <= lo && lo <= t && t <= hi && hi <= 120
> +	    && (lo != -1 && hi > 0)) {
> +		return true;
> +	}
> +	return false;
> +}
> +
> +static int ata_hwmon_detect_tempformat(struct ata_hwmon *ata, u8 *raw)
> +{
> +	s8 t;
> +	u16 w0, w1, w2;
> +	int ctw0;
> +
> +	/*
> +	 * Interpret the RAW temperature data:
> +	 * raw[0] is the temperature given as signed u8 on all known drives
> +	 *
> +	 * Search for possible min/max values
> +	 * This algorithm is a modified version from the smartmontools.
> +	 *
> +	 * [0][1][2][3][4][5] raw[]
> +	 * [ 0 ] [ 1 ] [ 2 ] word[]
> +	 * TT xx LL xx HH xx  Hitachi/HGST
> +	 * TT xx HH xx LL xx  Kingston SSDs
> +	 * TT xx LL HH 00 00  Maxtor, Samsung, Seagate, Toshiba
> +	 * TT LL HH 00 00 00  WDC
> +	 * TT xx LL HH CC CC  WDC, CCCC=over temperature count
> +	 * (xx = 00/ff, possibly sign extension of lower byte)
> +	 *
> +	 * TODO: detect the 10x temperatures found on some Samsung
> +	 * drives. struct scsi_device contains manufacturer and model
> +	 * information.
> +	 */
> +	w0 = raw[0] | raw[1] << 16;
> +	w1 = raw[2] | raw[3] << 16;
> +	w2 = raw[4] | raw[5] << 16;
> +	t = (s8)raw[0];
> +
> +	/* If this is != 0, then w0 may contain something useful */
> +	ctw0 = check_temp_word(w0);
> +
> +	/* This checks variants with zero in [4] [5] */
> +	if (!w2) {
> +		/* TT xx 00 00 00 00 */
> +		if (!w1 && ctw0)
> +			ata->tfmt = ATA_TEMP_FMT_TT_XX_00_00_00_00;
> +		/* TT xx LL HH 00 00 */
> +		else if (ctw0 &&
> +			 ata_check_temp_range(t, raw[2], raw[3]))
> +			ata->tfmt = ATA_TEMP_FMT_TT_XX_LL_HH_00_00;
> +		/* TT LL HH 00 00 00 */
> +		else if (!raw[3] &&
> +			 ata_check_temp_range(t, raw[1], raw[2]))
> +			ata->tfmt = ATA_TEMP_FMT_TT_LL_HH_00_00_00;
> +		else
> +			return -ENOTSUPP;
> +	} else if (ctw0) {
> +		/*
> +		 * TT xx LL xx HH xx
> +		 * What the expression below does is to check that each word
> +		 * formed by [0][1], [2][3], and [4][5] is something little-
> +		 * endian s8 or s16 that could be meaningful.
> +		 */
> +		if ((ctw0 & check_temp_word(w1) & check_temp_word(w2)) != 0x00)
> +			if (ata_check_temp_range(t, raw[2], raw[4]))
> +				ata->tfmt = ATA_TEMP_FMT_TT_XX_LL_XX_HH_XX;
> +			else if (ata_check_temp_range(t, raw[4], raw[2]))
> +				ata->tfmt = ATA_TEMP_FMT_TT_XX_HH_XX_LL_XX;
> +			else
> +				return -ENOTSUPP;
> +		/*
> +		 * TT xx LL HH CC CC
> +		 * Make sure the CC CC word is at least not negative, and that
> +		 * the max temperature is something >= 40, then it is probably
> +		 * the right format.
> +		 */
> +		else if (w2 < 0x7fff) {
> +			if (ata_check_temp_range(t, raw[2], raw[3]) &&
> +			    raw[3] >= 40)
> +				ata->tfmt = ATA_TEMP_FMT_TT_XX_LL_HH_CC_CC;
> +			else
> +				return -ENOTSUPP;
> +		} else {
> +			return -ENOTSUPP;
> +		}
> +	} else {
> +		return -ENOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static void ata_hwmon_convert_temperatures(struct ata_hwmon *ata, u8 *raw,
> +					   int *t, int *lo, int *hi)
> +{
> +	*t = (s8)raw[0];
> +
> +	switch (ata->tfmt) {
> +	case ATA_TEMP_FMT_TT_XX_00_00_00_00:
> +		*lo = 0;
> +		*hi = 0;
> +		break;
> +	case ATA_TEMP_FMT_TT_XX_LL_HH_00_00:
> +		*lo = (s8)raw[2];
> +		*hi = (s8)raw[3];
> +		break;
> +	case ATA_TEMP_FMT_TT_LL_HH_00_00_00:
> +		*lo = (s8)raw[1];
> +		*hi = (s8)raw[2];
> +		break;
> +	case ATA_TEMP_FMT_TT_XX_LL_XX_HH_XX:
> +		*lo = (s8)raw[2];
> +		*hi = (s8)raw[4];
> +		break;
> +	case ATA_TEMP_FMT_TT_XX_HH_XX_LL_XX:
> +		*lo = (s8)raw[4];
> +		*hi = (s8)raw[2];
> +		break;
> +	case ATA_TEMP_FMT_TT_XX_LL_HH_CC_CC:
> +		*lo = (s8)raw[2];
> +		*hi = (s8)raw[3];
> +		break;
> +	case ATA_TEMP_FMT_UNKNOWN:
> +		*lo = 0;
> +		*hi = 0;
> +		break;
> +	}
> +}
> +
> +static int ata_hwmon_parse_smartdata(struct ata_hwmon *ata,
> +				     u8 *buf, u8 *raw)
> +{
> +	u8 id;
> +	u16 flags;
> +	u8 curr;
> +	u8 worst;
> +	int i;
> +
> +	/* Loop over SMART attributes */
> +	for (i = 0; i < ATA_MAX_SMART_ATTRS; i++) {
> +		int j;
> +
> +		id = buf[2 + i * 12];
> +		if (!id)
> +			continue;
> +
> +		/*
> +		 * The "current" and "worst" values represent a normalized
> +		 * value in the range 0..100 where 0 is "worst" and 100
> +		 * is "best". It does not represent actual temperatures.
> +		 * It is probably possible to use vendor-specific code per
> +		 * drive to convert this to proper temperatures but we leave
> +		 * it out for now.
> +		 */
> +		flags = buf[3 + i * 12] | (buf[4 + i * 12] << 16);
> +		/* Highest temperature since boot */
> +		curr = buf[5 + i * 12];
> +		/* Highest temperature ever */
> +		worst = buf[6 + i * 12];
> +		for (j = 0; j < 6; j++)
> +			raw[j] = buf[7 + i * 12 + j];
> +		dev_dbg(ata->dev, "ID: %d, FLAGS: %04x, current %d, worst %d, "
> +			"RAW %02x %02x %02x %02x %02x %02x\n",
> +			id, flags, curr, worst,
> +			raw[0], raw[1], raw[2], raw[3], raw[4], raw[5]);
> +
> +		if (id == SMART_TEMP_PROP_194)
> +			break;
> +	}
> +
> +	if (id != SMART_TEMP_PROP_194)
> +		return -ENOTSUPP;
> +
> +	return 0;
> +}
> +
> +static int ata_hwmon_read_temp(struct ata_hwmon *ata, int *temp,
> +			       int *min, int *max)
> +{
> +	u8 scsi_cmd[MAX_COMMAND_SIZE];
> +	int cmd_result;
> +	struct scsi_sense_hdr sshdr;
> +	u8 *buf = ata->smartdata;
> +	u8 raw[6];
> +	int ret;
> +	u8 csum;
> +	int i;
> +
> +	/* Send ATA command to read SMART values */
> +	memset(scsi_cmd, 0, sizeof(scsi_cmd));
> +	scsi_cmd[0] = ATA_16;
> +	scsi_cmd[1] = (4 << 1); /* PIO Data-in */
> +	/*
> +	 * No off.line or cc, read from dev, block count in sector count
> +	 * field.
> +	 */
> +	scsi_cmd[2] = 0x0e;
> +	scsi_cmd[4] = ATA_SMART_READ_VALUES;
> +	scsi_cmd[6] = 1; /* Read 1 sector */
> +	scsi_cmd[8] = 0; /* args[1]; */
> +	scsi_cmd[10] = ATA_SMART_LBAM_PASS;
> +	scsi_cmd[12] = ATA_SMART_LBAH_PASS;
> +	scsi_cmd[14] = ATA_CMD_SMART;
> +
> +	cmd_result = scsi_execute(ata->sdev, scsi_cmd, DMA_FROM_DEVICE,
> +				  buf, ATA_SECT_SIZE,
> +				  NULL, &sshdr, 10 * HZ, 5, 0, 0, NULL);
> +	if (cmd_result) {
> +		dev_dbg(ata->dev, "error %d reading SMART values from device\n",
> +			cmd_result);
> +		return -EIO;

I think it would be better to return the error code from scsi_execute().

> +	}
> +
> +	/* Checksum the read value table */
> +	csum = 0;
> +	for (i = 0; i < ATA_SECT_SIZE; i++)
> +		csum += buf[i];
> +	if (csum) {
> +		dev_dbg(ata->dev, "checksum error reading SMART values\n");
> +		return -EIO;
> +	}
> +
> +	/* This will fail with -ENOTSUPP if we don't have temperature */
> +	ret = ata_hwmon_parse_smartdata(ata, buf, raw);
> +	if (ret)
> +		return ret;
> +
> +	if (ata->tfmt == ATA_TEMP_FMT_UNKNOWN) {
> +		ret = ata_hwmon_detect_tempformat(ata, raw);
> +		if (ret)
> +			return ret;
> +	}

As mentioned before, this is only really needed in the probe function.
I think it would be much better to split out the code to read the raw
data into a separate function, call ata_hwmon_detect_tempformat()
explicitly from the probe function, and drop the call here.

> +
> +	ata_hwmon_convert_temperatures(ata, raw, temp, min, max);
> +	dev_dbg(ata->dev, "temp = %d, min = %d, max = %d\n",
> +		*temp, *min, *max);
> +
> +	return 0;
> +}
> +
> +static int ata_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> +			  u32 attr, int channel, long *val)
> +{
> +	struct ata_hwmon *ata = dev_get_drvdata(dev);
> +	int temp, min, max;
> +	int ret;
> +
> +	if (type != hwmon_temp)
> +		return -EINVAL;
> +

This can not happen.

> +	ret = ata_hwmon_read_temp(ata, &temp, &min, &max);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Multiply return values by 1000 as hwmon expects millicentigrades
> +	 */
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		*val = temp * 1000;
> +		break;
> +	case hwmon_temp_min:
> +		*val = min * 1000;
> +		break;
> +	case hwmon_temp_max:
> +		*val = max * 1000;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct hwmon_ops ata_hwmon_ops = {
> +	.is_visible = ata_hwmon_is_visible,
> +	.read = ata_hwmon_read,
> +};
> +
> +static const u32 ata_hwmon_temp_config[] = {
> +	HWMON_T_INPUT,
> +	0,
> +};
> +
> +static const u32 ata_hwmon_minmax_temp_config[] = {
> +	HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX,
> +	0,
> +};
> +
> +static const struct hwmon_channel_info ata_hwmon_temp = {
> +	.type = hwmon_temp,
> +	.config = ata_hwmon_temp_config,
> +};
> +
> +static const struct hwmon_channel_info ata_hwmon_minmax_temp = {
> +	.type = hwmon_temp,
> +	.config = ata_hwmon_minmax_temp_config,
> +};
> +
> +static const struct hwmon_channel_info *ata_hwmon_info[] = {
> +	&ata_hwmon_temp,
> +	NULL,
> +};
> +
> +static const struct hwmon_channel_info *ata_hwmon_minmax_info[] = {
> +	&ata_hwmon_minmax_temp,
> +	NULL,
> +};
> +
> +static const struct hwmon_chip_info ata_hwmon_devinfo = {
> +	.ops = &ata_hwmon_ops,
> +	.info = ata_hwmon_info,
> +};
> +
> +static const struct hwmon_chip_info ata_hwmon_minmax_devinfo = {
> +	.ops = &ata_hwmon_ops,
> +	.info = ata_hwmon_minmax_info,
> +};

That complexity is unnecessary; see below.

> +
> +int ata_hwmon_probe(struct scsi_device *sdev)
> +{
> +	struct device *dev = &sdev->sdev_gendev;
> +	struct device *hwmon_dev;
> +	const struct hwmon_chip_info *devinfo;
> +	struct ata_hwmon *ata;
> +	char *sname;
> +	int t;
> +	int dummy;
> +	int ret;
> +
> +	ata = devm_kzalloc(dev, sizeof(*ata), GFP_KERNEL);
> +	if (!ata)
> +		return -ENOMEM;
> +	ata->dev = dev;
> +	ata->sdev = sdev;
> +
> +	/*
> +	 * If temperature reading is not supported in the SMART
> +	 * properties, we just bail out.
> +	 */
> +	ata->tfmt = ATA_TEMP_FMT_UNKNOWN;
> +	ret = ata_hwmon_read_temp(ata, &t, &dummy, &dummy);

If you had a separate function to determine the temperature format,
you would not need those dummy variables.

> +	if (ret == -ENOTSUPP)
> +		return 0;
> +	/* Any other error, return upward */
> +	if (ret)
> +		return ret;
> +	dev_dbg(dev, "initial temperature %d degrees celsius\n", t);
> +
> +	/*
> +	 * If we have min/max temperature then register attributes
> +	 * for that, else just skip it and just provide the temperature.
> +	 */
> +	if (ata->tfmt == ATA_TEMP_FMT_TT_XX_00_00_00_00)
> +		devinfo = &ata_hwmon_devinfo;
> +	else
> +		devinfo = &ata_hwmon_minmax_devinfo;
> +
This should be handled in ata_hwmon_is_visible().

	...
	switch (attr) {
	case hwmon_temp_input:
		return 00444;
	case hwmon_temp_min:
	case hwmon_temp_max:
		/* Readable for everyone */
		if (ata->tfmt != ATA_TEMP_FMT_TT_XX_00_00_00_00)
			return 00444;
		break;
	}
	...


> +	/* Names the hwmon device something like "sd_0:0:0:0" */
> +	sname = devm_kasprintf(dev, GFP_KERNEL, "sd_%s", dev_name(dev));

As mentioned before, this results in a non-static hwmon device name,
which would be undesirable. I would suggest to stick with "sd",
similar to other hwmon drivers. I won't insist on it if you really
feel strong about it, but it will make it difficult to write sensors
configuration files.

> +	if (!sname)
> +		return -ENOMEM;
> +	hwmon_dev =
> +		devm_hwmon_device_register_with_info(dev, sname, ata,
> +						     devinfo,
> +						     NULL);
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> diff --git a/drivers/ata/libata-hwmon.h b/drivers/ata/libata-hwmon.h
> new file mode 100644
> index 000000000000..df56ba456345
> --- /dev/null
> +++ b/drivers/ata/libata-hwmon.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#include <scsi/scsi_device.h>
> +
> +#ifdef CONFIG_ATA_HWMON
> +
> +int ata_hwmon_probe(struct scsi_device *sdev);
> +
> +#else
> +
> +static inline int ata_hwmon_probe(struct scsi_device *sdev)
> +{
> +	return 0;
> +}
> +
> +#endif
> diff --git a/drivers/ata/libata-scsi.c b/drivers/ata/libata-scsi.c
> index 55b890d19780..a83075e4d3b3 100644
> --- a/drivers/ata/libata-scsi.c
> +++ b/drivers/ata/libata-scsi.c
> @@ -54,6 +54,7 @@
>  
>  #include "libata.h"
>  #include "libata-transport.h"
> +#include "libata-hwmon.h"
>  
>  #define ATA_SCSI_RBUF_SIZE	4096
>  
> @@ -4594,6 +4595,7 @@ void ata_scsi_scan_host(struct ata_port *ap, int sync)
>  			if (!IS_ERR(sdev)) {
>  				dev->sdev = sdev;
>  				scsi_device_put(sdev);
> +				ata_hwmon_probe(sdev);
>  			} else {
>  				dev->sdev = NULL;
>  			}
> -- 
> 2.17.1
> 
