Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF50CC2B9F4
	for <linux-hwmon@archiver.kernel.org>; Mon, 28 Jun 2021 15:41:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2B2060233
	for <linux-hwmon@archiver.kernel.org>; Mon, 28 Jun 2021 15:41:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235926AbhF1Pnm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 28 Jun 2021 11:43:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232768AbhF1Pnf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 28 Jun 2021 11:43:35 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00290C051EC5
        for <linux-hwmon@vger.kernel.org>; Mon, 28 Jun 2021 07:58:51 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id h9so22314607oih.4
        for <linux-hwmon@vger.kernel.org>; Mon, 28 Jun 2021 07:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=isNEzHjDWpNvMixL8Mdi+HfdRXSNy14jjNvs03tt/2k=;
        b=LpSo5tWQj82JHeeRFgIpX0vpOmZPkVyKggTqFWPMTAcEs0ngwWoiOuR2ANbGuYcy4J
         ea3Md/PYf1OO/hR6zo/vvL4n2j/5XfSXoSvk6/l0rXc4/0dOS2wE9YD2WXXyM6PPGwmm
         MQIuAEbyIfRA9TkFB14mbOeOaiRzAbdCoTRrZ/KlsBI7dcYsa6BYweN53tRbdVEoE7wU
         avyhfzACbqc8u27szqyCezvez6rS25eCFW0jQ9m2BfPz9WwwLATscEdSB5eiRUItJao8
         3olMN8xPr+0Jp3yFLDWC6s+wwcGMfXGuYO6XhNrYmv9Dj9dl7NP4Oa0WYHrGlcLpjoae
         OhyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=isNEzHjDWpNvMixL8Mdi+HfdRXSNy14jjNvs03tt/2k=;
        b=tzJbMcwJlPsNFo41Sa6K6lpW03KGO4dglncgBtbLF/1zbpkKLpKAgpBX+iNDnP61N9
         kxkzv75skT3OIablRGYsmHm/uGbdYZKWg9BKBOKIJge09g2UV7iZM2vkjYIbU26Ulv5O
         rtmEzKR92GiOps2rPF9Hhp1sjbwLnCBVV4GiyueqFQBgwkvtiYWdg/yOKY4VlMCUNm/S
         EOE1XikR+5PWqH1K5wFhXr+u/GKUIkvQsvIuRVa7ROxMLWnxxcG55a7v5U5l0CZ5hJvz
         pgisyv1D8vFi8bbirav1voNqH7WNQjNbmcUGYRWP/Dj/3SSCal7gy5IbfIhjog5dQ44v
         Y6Eg==
X-Gm-Message-State: AOAM531R4TbNG2/Vb7vyKTmZa1sJJENX57xcAtxbi1v6yY28Tmf5vfIw
        TYTOL723UL2e5H0GeP1maDE=
X-Google-Smtp-Source: ABdhPJyH5XzjsNJC8OBXKGK2BpcdiJFhAmsbY/gqiyOeLlImp8q44Tz/DmYWrE7HAJsWhEveSsd6XQ==
X-Received: by 2002:aca:b5d6:: with SMTP id e205mr20621188oif.91.1624892331249;
        Mon, 28 Jun 2021 07:58:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r2sm3466688otd.54.2021.06.28.07.58.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jun 2021 07:58:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        linux-hwmon@vger.kernel.org
Cc:     Akshay Gupta <Akshay.Gupta@amd.com>
References: <20210625132544.18094-1-nchatrad@amd.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/3] hwmon: sbrmi: Add support for sbrmi power module
Message-ID: <26e0f4b6-5a5d-bf79-7691-b9e3a8c7ec43@roeck-us.net>
Date:   Mon, 28 Jun 2021 07:58:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210625132544.18094-1-nchatrad@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 6/25/21 6:25 AM, Naveen Krishna Chatradhi wrote:
> From: Akshay Gupta <Akshay.Gupta@amd.com>
> 
> On AMD platforms the Out-of-band access is provided by Advanced Platform Management

This is a bit too long for checkpatch.

> Link (APML), APML is a SMBus v2.0 compatible 2-wire processor client interface.
> APML is also referred as the sideband interface (SBI).
> 
> APML is used to communicate with the Remote Management Interface
> (SB-Remote Management Interface (SB-RMI) which provides Soft Mailbox messages
> to report power consumption and power limits of the CPU socket.
> 
> - This module add support to read power consumption,
>    power limit & max power limit and write power limit.
> - To instantiate this driver on an AMD CPU with SB-RMI support,
>    the i2c bus number would be the bus connected from the board
>    management controller (BMC) to the CPU.
> 

This is a bit vague. Would this driver be instantiated on the host CPU or on the BMC ?

> Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> ---
>   drivers/hwmon/Kconfig  |  10 ++
>   drivers/hwmon/Makefile |   1 +
>   drivers/hwmon/sbrmi.c  | 394 +++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 405 insertions(+)
>   create mode 100644 drivers/hwmon/sbrmi.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 87624902ea80..d1813ea8382c 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1551,6 +1551,16 @@ config SENSORS_SBTSI
>   	  This driver can also be built as a module. If so, the module will
>   	  be called sbtsi_temp.
>   
> +config SENSORS_SBRMI
> +	tristate "Emulated SB-RMI sensor"
> +	depends on I2C
> +	help
> +	  If you say yes here you get support for emulated RMI
> +	  sensors on AMD SoCs with APML interface connected to a BMC device.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called sbrmi.
> +
>   config SENSORS_SHT15
>   	tristate "Sensiron humidity and temperature sensors. SHT15 and compat."
>   	depends on GPIOLIB || COMPILE_TEST
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 59e78bc212cf..8031acf58936 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -164,6 +164,7 @@ obj-$(CONFIG_SENSORS_PWM_FAN)	+= pwm-fan.o
>   obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+= raspberrypi-hwmon.o
>   obj-$(CONFIG_SENSORS_S3C)	+= s3c-hwmon.o
>   obj-$(CONFIG_SENSORS_SBTSI)	+= sbtsi_temp.o
> +obj-$(CONFIG_SENSORS_SBRMI)	+= sbrmi.o
>   obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+= sch56xx-common.o
>   obj-$(CONFIG_SENSORS_SCH5627)	+= sch5627.o
>   obj-$(CONFIG_SENSORS_SCH5636)	+= sch5636.o
> diff --git a/drivers/hwmon/sbrmi.c b/drivers/hwmon/sbrmi.c
> new file mode 100644
> index 000000000000..c35829513459
> --- /dev/null
> +++ b/drivers/hwmon/sbrmi.c
> @@ -0,0 +1,394 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * sbrmi.c - hwmon driver for a SB-RMI mailbox
> + *           compliant AMD SoC device.
> + *
> + * Copyright (C) 2020-2021 Advanced Micro Devices, Inc.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>

I don't immediately see why this include is needed.

> +#include <asm-generic/ioctl.h>

This looks wrong, and I don't immediately see why it would be needed.

> +#include <linux/delay.h>

Alphabetic include file order, please.

> +
> +/* Do not allow setting negative power limit */
> +#define SBRMI_PWR_MIN 0
> +/* Mask for Status Register bit[1] */
> +#define SW_ALERT_MASK 0x2
> +

Please always use

#define<space>DEFINITION<tab>value
                         ^^^^^

> +/* Software Interrupt for triggering */
> +#define START_CMD	0x80
> +#define TRIGGER_MAILBOX	0x01
> +
> +/*
> + * SB-RMI supports soft mailbox service request to MP1 (power management
> + * firmware) through SBRMI inbound/outbound message registers.
> + * SB-RMI message IDs
> + */
> +enum sbrmi_msg_id {
> +	SBRMI_READ_PKG_PWR_CONSUMPTION = 0x1,
> +	SBRMI_WRITE_PKG_PWR_LIMIT,
> +	SBRMI_READ_PKG_PWR_LIMIT,
> +	SBRMI_READ_PKG_MAX_PWR_LIMIT,
> +};
> +
> +/* SB-RMI registers */
> +enum sbrmi_reg {
> +	SBRMI_CTRL		= 0x01,
> +	SBRMI_STATUS,
> +	SBRMI_OUTBNDMSG0	= 0x30,
> +	SBRMI_OUTBNDMSG1,
> +	SBRMI_OUTBNDMSG2,
> +	SBRMI_OUTBNDMSG3,
> +	SBRMI_OUTBNDMSG4,
> +	SBRMI_OUTBNDMSG5,
> +	SBRMI_OUTBNDMSG6,
> +	SBRMI_OUTBNDMSG7,
> +	SBRMI_INBNDMSG0,
> +	SBRMI_INBNDMSG1,
> +	SBRMI_INBNDMSG2,
> +	SBRMI_INBNDMSG3,
> +	SBRMI_INBNDMSG4,
> +	SBRMI_INBNDMSG5,
> +	SBRMI_INBNDMSG6,
> +	SBRMI_INBNDMSG7,
> +	SBRMI_SW_INTERRUPT,
> +};
> +
> +/*
> + * Each client has this additional data
> + */

Please be consistent with comments: This does not really need to be
a multi-line comment. While that does not really matter, you use
a single-line comment to describe the next structure. Please make it
both either single-line or multi-line.

> +struct sbrmi_data {
> +	struct i2c_client *client;
> +	struct mutex lock;
> +};
> +
> +/* Mailbox message data format */
> +union mailbox_word {
> +	u8 bytes[4];
> +	u32 value;

That strongly suggests that the driver will only work on either little-endian
or big-endian systems, depending on the byte order of transfers. Please restrict
it accordingly.

> +};
> +
> +struct sbrmi_mailbox_msg {
> +	u8 cmd;
> +	bool read;
> +	union mailbox_word data_in;
> +	union mailbox_word data_out;
> +};
> +
> +static int print_mailbox_error(struct sbrmi_data *data)
> +{

Nit> Many functions only use data>client and, in some cases, dereference it
several times. It might be easier to just pass 'client'.

> +	int status;
> +
> +	/* Mailbox error code will be written by Firmware in
> +	 * SBRMI::OutBndMsg_inst7 (SBRMI_x37)
> +	 */

/*
  * Please use standard multi-line comments. Applies to entire driver.
  */

> +	status = i2c_smbus_read_byte_data(data->client, SBRMI_OUTBNDMSG7);
> +	if (status < 0) {
> +		pr_err("SMBUS translation failed\n");
> +		return status;
> +	}
> +
> +	switch (status) {
> +	case 0x0:	/* Success */
> +		break;
> +	case 0x1:
> +		pr_err("Mailbox message command is aborted\n");
> +		break;
> +	case 0x2:
> +		pr_err("Unknown mailbox message\n");
> +		break;
> +	case 0x3:
> +		pr_err("Invalid core is specified in mailbox message parameters\n");
> +		break;
> +	default:
> +		pr_err("Unknown Error\n");
> +	}

Is this noise necessary ? I am concerned that, if it occurs, it would be persistent
and fill up the kernel log with noise.

> +
> +	return status;

Error codes are supposed to be negative and standard Linux error codes.
Please convert the above errors to standard Linux error codes.

> +}
> +
> +static int sbrmi_enable_alert(struct sbrmi_data *data)
> +{
> +	int ctrl;
> +
> +	/* Enable the SB-RMI Software alert status
> +	 * by writing 0 to bit 4 of Control register(0x1)
> +	 */
> +	ctrl = i2c_smbus_read_byte_data(data->client, SBRMI_CTRL);
> +	if (ctrl < 0)
> +		return ctrl;
> +
> +	if (ctrl & 0x10) {
> +		ctrl &= ~0x10;
> +		return i2c_smbus_write_byte_data(data->client,
> +						 SBRMI_CTRL, ctrl);
> +	}
> +
> +	return 0;
> +}
> +
> +static int rmi_mailbox_xfer(struct sbrmi_data *data,
> +			    struct sbrmi_mailbox_msg *msg)
> +{
> +	union mailbox_word output, input;
> +	int i, err = 0, retry = 10;

Initializing 'err' is unnecessary.

> +	int sw_status;
> +
> +	mutex_lock(&data->lock);
> +
> +	err = sbrmi_enable_alert(data);
> +	if (err < 0)
> +		goto exit_unlock;
> +
> +	/* Indicate firmware a command is to be serviced */
> +	err = i2c_smbus_write_byte_data(data->client,
> +					SBRMI_INBNDMSG7, START_CMD);
> +	if (err < 0)
> +		goto exit_unlock;
> +
> +	/* Write the command to SBRMI::InBndMsg_inst0 */
> +	err = i2c_smbus_write_byte_data(data->client,
> +					SBRMI_INBNDMSG0, msg->cmd);
> +	if (err < 0)
> +		goto exit_mod;
> +
> +	/*
> +	 * For both read and write the initiator (BMC) writes
> +	 * Command Data In[31:0] to SBRMI::InBndMsg_inst[4:1]
> +	 * SBRMI_x3C(MSB):SBRMI_x39(LSB)
> +	 */
> +	input = msg->data_in;
> +	for (i = 0; i < 3; i++) {

This writes 3 bytes. Is that on purpose ? If so please explain since the above
suggests that 4 bytes should be written.

> +		err = i2c_smbus_write_byte_data(data->client,
> +						(SBRMI_INBNDMSG1 + i),

Unnecessary ( )

> +						input.bytes[i]);
> +		if (err < 0)
> +			goto exit_mod;
> +	}
> +
> +	/*
> +	 * Write 0x01 to SBRMI::SoftwareInterrupt to notify firmware to
> +	 * perform the requested read or write command
> +	 */
> +	err = i2c_smbus_write_byte_data(data->client,
> +					SBRMI_SW_INTERRUPT, TRIGGER_MAILBOX);
> +	if (err < 0)
> +		goto exit_mod;
> +
> +	/*
> +	 * Firmware will write SBRMI::Status[SwAlertSts]=1 to generate
> +	 * an ALERT (if enabled) to initiator (BMC) to indicate completion
> +	 * of the requested command
> +	 */
> +	do {
> +		sw_status = i2c_smbus_read_byte_data(data->client,
> +						     SBRMI_STATUS);
> +		if (sw_status < 0) {
> +			err = sw_status;
> +			goto exit_mod;
> +		}
> +		if (sw_status & SW_ALERT_MASK)
> +			break;
> +		usleep_range(50, 100);
> +	} while (retry--);
> +
> +	if (retry < 0) {
> +		pr_err("Firmware fail to indicate command colmpletion\n");

completion

> +		err = -1;
> +		goto exit_mod;
> +	}
> +
> +	/*
> +	 * For a read operation, the initiator (BMC) reads the firmware response
> +	 * Command Data Out[31:0] from SBRMI::OutBndMsg_inst[4:1]
> +	 * {SBRMI_x34(MSB):SBRMI_x31(LSB)}.
> +	 */
> +	if (msg->read) {
> +		for (i = 0; i < 4; i++) {
> +			output.bytes[i] = i2c_smbus_read_byte_data(data->client,
> +								   (SBRMI_OUTBNDMSG1 + i));

Unnecessary ().

> +			if (output.bytes[i] < 0) {

output.bytes is defined as u8. This will not catch errors.

> +				err = output.bytes[i];
> +				goto exit_mod;
> +			}
> +		}
> +	}
> +	msg->data_out = output;
> +
> +	/*
> +	 * BMC must write 1'b1 to SBRMI::Status[SwAlertSts] to clear the
> +	 * ALERT to initiator
> +	 */
> +	err = i2c_smbus_write_byte_data(data->client, SBRMI_STATUS,
> +					(sw_status | SW_ALERT_MASK));

Unnecessary ().

> +
> +exit_mod:
> +	if (err < 0)
> +		pr_err("SMBUS translation failed\n");
> +	else
> +		err = print_mailbox_error(data);
> +exit_unlock:
> +	mutex_unlock(&data->lock);
> +	return err;
> +}
> +
> +static int sbrmi_read(struct device *dev, enum hwmon_sensor_types type,
> +		      u32 attr, int channel, long *val)
> +{
> +	struct sbrmi_data *data = dev_get_drvdata(dev);
> +	struct sbrmi_mailbox_msg msg = { 0 };
> +	int ret;
> +
> +	if (type != hwmon_power)
> +		return -EINVAL;
> +
> +	msg.read = true;
> +	switch (attr) {
> +	case hwmon_power_input:
> +		msg.cmd = SBRMI_READ_PKG_PWR_CONSUMPTION;
> +		ret = rmi_mailbox_xfer(data, &msg);
> +		break;
> +	case hwmon_power_cap:
> +		msg.cmd = SBRMI_READ_PKG_PWR_LIMIT;
> +		ret = rmi_mailbox_xfer(data, &msg);
> +		break;
> +	case hwmon_power_cap_max:
> +		msg.cmd = SBRMI_READ_PKG_MAX_PWR_LIMIT;
> +		ret = rmi_mailbox_xfer(data, &msg);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	/*
> +	 * hwmon power attributes are in microWatt
> +	 */
> +	*val = (long)msg.data_out.value * 1000;
> +	return ret;
> +}
> +
> +static int sbrmi_write(struct device *dev, enum hwmon_sensor_types type,
> +		       u32 attr, int channel, long val)
> +{
> +	struct sbrmi_data *data = dev_get_drvdata(dev);
> +	struct sbrmi_mailbox_msg msg = { 0 };
> +
> +	if (type != hwmon_power && attr != hwmon_power_cap)
> +		return -EINVAL;
> +	/*
> +	 * hwmon power attributes are in microWatt
> +	 * mailbox read/write is in mWatt
> +	 */
> +	val /= 1000;
> +
> +	msg.cmd = SBRMI_READ_PKG_MAX_PWR_LIMIT;
> +	msg.data_in.value = 0;
> +	msg.read = true;
> +	rmi_mailbox_xfer(data, &msg);
> +
> +	val = clamp_val(val, SBRMI_PWR_MIN, msg.data_out.value);
> +
> +	msg.cmd = SBRMI_WRITE_PKG_PWR_LIMIT;
> +	msg.data_in.value = val;
> +	msg.read = false;
> +
> +	return rmi_mailbox_xfer(data, &msg);
> +}
> +
> +static umode_t sbrmi_is_visible(const void *data,
> +				enum hwmon_sensor_types type,
> +				u32 attr, int channel)
> +{
> +	switch (type) {
> +	case hwmon_power:
> +		switch (attr) {
> +		case hwmon_power_input:
> +		case hwmon_power_cap_max:
> +			return 0444;
> +		case hwmon_power_cap:
> +			return 0644;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static const struct hwmon_channel_info *sbrmi_info[] = {
> +	HWMON_CHANNEL_INFO(power,
> +			   HWMON_P_INPUT | HWMON_P_CAP | HWMON_P_CAP_MAX),
> +	NULL
> +};
> +
> +static const struct hwmon_ops sbrmi_hwmon_ops = {
> +	.is_visible = sbrmi_is_visible,
> +	.read = sbrmi_read,
> +	.write = sbrmi_write,
> +};
> +
> +static const struct hwmon_chip_info sbrmi_chip_info = {
> +	.ops = &sbrmi_hwmon_ops,
> +	.info = sbrmi_info,
> +};
> +
> +static int sbrmi_probe(struct i2c_client *client,
> +		       const struct i2c_device_id *id)
> +{
> +	struct device *dev = &client->dev;
> +	struct device *hwmon_dev;
> +	struct sbrmi_data *data;
> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
> +		dev_err(&client->dev, "adapter does not support true I2C\n");

Why would that matter? It only uses SMBus functions.

> +		return -ENODEV;
> +	}
> +
> +	data = devm_kzalloc(dev, sizeof(struct sbrmi_data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->client = client;
> +	mutex_init(&data->lock);
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
> +							 &sbrmi_chip_info, NULL);
> +
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static const struct i2c_device_id sbrmi_id[] = {
> +	{"sbrmi", 0},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, sbrmi_id);
> +
> +static const struct of_device_id __maybe_unused sbrmi_of_match[] = {
> +	{
> +		.compatible = "amd,sbrmi",
> +	},
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, sbrmi_of_match);
> +
> +static struct i2c_driver sbrmi_driver = {
> +	.class = I2C_CLASS_HWMON,
> +	.driver = {
> +		.name = "sbrmi",
> +		.of_match_table = of_match_ptr(sbrmi_of_match),
> +	},
> +	.probe = sbrmi_probe,
> +	.id_table = sbrmi_id,
> +};
> +
> +module_i2c_driver(sbrmi_driver);
> +
> +MODULE_AUTHOR("Akshay Gupta <akshay.gupta@amd.com>");
> +MODULE_DESCRIPTION("Hwmon driver for AMD SB-RMI emulated sensor");
> +MODULE_LICENSE("GPL");
> 

