Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA850C4361B
	for <linux-hwmon@archiver.kernel.org>; Sun, 13 Dec 2020 23:11:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7AB0722DFA
	for <linux-hwmon@archiver.kernel.org>; Sun, 13 Dec 2020 23:11:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729834AbgLMXLg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 13 Dec 2020 18:11:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgLMXLg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 13 Dec 2020 18:11:36 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00D88C0613CF
        for <linux-hwmon@vger.kernel.org>; Sun, 13 Dec 2020 15:10:55 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id d8so14035064otq.6
        for <linux-hwmon@vger.kernel.org>; Sun, 13 Dec 2020 15:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=z38YaDJu3DH168/PkLMPhzxCtvwbxIMPpMIauBj4OlM=;
        b=emXfKRwjt9QYC0fa5NRWijO6fHOTUOfQlD5FWGujI4JHZxEKquLIMKjfqPF8VYL2ye
         /Wwe7RidXU96TC59NDYgIskpioNhIiOAunTcxPz/oz0F7siV23hABteplszfqUprtvHL
         CcieTBpSg4Viyk+oBVUl+b5Z8isUEwU6q5+gjPeLUaNKnVdzEuWaS1Soni8nsfxbbOAQ
         A3/F9WcPWw6rlG5wHCy/DMh7Ek8sRRqAW9dvvxdRTuIWemnOLrMYOkUBUUpswTWfOtCH
         U84aDTK7n0x0UeGZUva7Mhf2feBWmIstUkH1p5BmXKCjOZngEzu77hLsOYxhFd1yAvOz
         NV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=z38YaDJu3DH168/PkLMPhzxCtvwbxIMPpMIauBj4OlM=;
        b=Udu/IgPXLpMelrJNFaFbr0Q/Pfl+gDtiE0hlRnua2dCPD321QOABbqz9d3wSStzL0Q
         +iEM7QUuRsmnHbHyfawaPP+xKsel+jgzihn9SAA5WVZJA1VHfcfn/PlcBNxMLnEhNQkB
         Oh3lm1OZNsjHhsw2gDPvqWx7CQy0S58HEnNed4tO3JBPjEeJZT4CE+03UGZHvauR7pzD
         piB4sf6FnGVJm+RxMHXidRWisAdRlnP1QPYYQeUHK62AL7WDpzCuagOKdWBncm1iGFX+
         WtAcoreZAge2DpulvgK7T6/g/8WwgoAFdyZGnH/B0hegyHObIjPTJ/N6MqLv537orSuI
         0HLg==
X-Gm-Message-State: AOAM532cVC22gTcR0Lx9IdIsczVW/7XU/BDct+mLZ1q/ritR721HTgHj
        1GAPhkea5jqZ53mG7PZJMHtm7hatiBc=
X-Google-Smtp-Source: ABdhPJw+pyat8hu2mWC2sVDlAikLmTJoqZXy1qbeOAUWu9FSije4sF+7uw9qxzhy6balVg63iD9sDQ==
X-Received: by 2002:a9d:7b52:: with SMTP id f18mr17862152oto.123.1607901054847;
        Sun, 13 Dec 2020 15:10:54 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r133sm1656491oia.17.2020.12.13.15.10.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Dec 2020 15:10:53 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] hwmon: Add AHT10 Temperature and Humidity Sensor Driver
To:     datdenkikniet <jcdra1@gmail.com>, jdelvare@suse.com
Cc:     linux-hwmon@vger.kernel.org
References: <20201213214826.GA524437@desktop>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <f9cd5231-2fa6-dd76-bf42-9cbfb8971b16@roeck-us.net>
Date:   Sun, 13 Dec 2020 15:10:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201213214826.GA524437@desktop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 12/13/20 1:48 PM, datdenkikniet wrote:
> This patch adds a hwmon driver for the AHT10 Temperature
> and Humidity sensor. It has a maxiumum sample rate, as
> the datasheet states that the chip may heat up if it is
> sampled too often.
> 
> Has been tested to work on a raspberrypi0w
> 
> Signed-off-by: Johannes Cornelis Draaijer (datdenkikniet) <jcdra1@gmail.com>

This patch didn't make it to patchwork. On top of that, my e-mail provider
tagged it as spam, based on the following information.

        1.0 TVD_RCVD_IP            Message was received from an IP address
        0.4 NO_DNS_FOR_FROM        DNS: Envelope sender has no MX or A DNS records
        0.0 SPF_NONE               SPF: sender does not publish an SPF Record
        0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail domains are different
        1.0 FORGED_GMAIL_RCVD      'From' gmail.com does not match 'Received' headers
        0.5 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider [jcdra1[at]gmail.com]
        0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
        0.0 DKIM_ADSP_CUSTOM_MED   No valid author signature, adsp_override is CUSTOM_MED
        0.0 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom freemail headers are different
        0.4 RDNS_DYNAMIC           Delivered to internal network by host with dynamic-looking rDNS
        1.2 NML_ADSP_CUSTOM_MED    ADSP custom_med hit, and not from a mailing list
        0.3 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
        2.0 SPOOFED_FREEMAIL       No description available.
        1.0 TO_NO_BRKTS_PCNT       To: lacks brackets + percentage

I would suggest to fix that before resubmitting.

> ---
>  drivers/hwmon/Kconfig  |  10 +
>  drivers/hwmon/Makefile |   1 +
>  drivers/hwmon/aht10.c  | 405 +++++++++++++++++++++++++++++++++++++++++

Documentation is missing.

>  3 files changed, 416 insertions(+)
>  create mode 100644 drivers/hwmon/aht10.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 288ae9f63588..96bad243d729 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -257,6 +257,16 @@ config SENSORS_ADT7475
>  	  This driver can also be built as a module. If so, the module
>  	  will be called adt7475.
>  
> +config SENSORS_AHT10
> +	tristate "Aosong AHT10"
> +	depends on I2C
> +	help
> +	  If you say yes here, you get support for the Aosong AHT10
> +	  temperature and humidity sensors
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called aht10.
> +
>  config SENSORS_AS370
>  	tristate "Synaptics AS370 SoC hardware monitoring driver"
>  	help
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 3e32c21f5efe..6cb44d54e628 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -45,6 +45,7 @@ obj-$(CONFIG_SENSORS_ADT7411)	+= adt7411.o
>  obj-$(CONFIG_SENSORS_ADT7462)	+= adt7462.o
>  obj-$(CONFIG_SENSORS_ADT7470)	+= adt7470.o
>  obj-$(CONFIG_SENSORS_ADT7475)	+= adt7475.o
> +obj-$(CONFIG_SENSORS_AHT10)	+= aht10.o
>  obj-$(CONFIG_SENSORS_AMD_ENERGY) += amd_energy.o
>  obj-$(CONFIG_SENSORS_APPLESMC)	+= applesmc.o
>  obj-$(CONFIG_SENSORS_ARM_SCMI)	+= scmi-hwmon.o
> diff --git a/drivers/hwmon/aht10.c b/drivers/hwmon/aht10.c
> new file mode 100644
> index 000000000000..1eeddce02ae9
> --- /dev/null
> +++ b/drivers/hwmon/aht10.c
> @@ -0,0 +1,405 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/*
> + * aht10.c - Linux hwmon driver for AHT10 I2C Temperature and Humidity sensor
> + * Copyright (C) 2020 Johannes Cornelis Draaijer
> + */
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/i2c.h>
> +#include <linux/mutex.h>
> +#include <linux/delay.h>
> +#include <linux/ktime.h>
> +#include <linux/err.h>
> +#include <asm/div64.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>

Alphabetic include file order, please.

> +
> +#define AHT10_ADDR 0x38
> +
> +// Delays
> +
> +#define AHT10_POWERON_USEC_DELAY 40000
> +#define AHT10_MEAS_USEC_DELAY 80000
> +#define AHT10_CMD_USEC_DELAY 350000
> +#define AHT10_USEC_DELAY_OFFSET 100000

Please use

#define<space>XXX<tab>VALUE

> +
> +// Command bytes

Please no C++ style comments (except for the SPDX identifier)

> +
> +#define AHT10_CMD_INIT 0b11100001
> +#define AHT10_CMD_MEAS 0b10101100
> +#define AHT10_CMD_RST  0b10111010
> +
> +// Flags in the answer byte/command
> +
> +#define AHT10_RESP_ERROR 0xFF
> +
> +#define AHT10_CAL_ENABLED (1u << 3u)
> +#define AHT10_BUSY        (1u << 7u)
> +#define AHT10_MODE_NOR    (0b11u << 5u)
> +#define AHT10_MODE_CYC    (0b01u << 5u)
> +#define AHT10_MODE_CMD    (0b10u << 5u)
> +

Please use bit operations where possible.,

> +#define AHT10_MAX_POLL_INTERVAL_LEN 30
> +
> +// Full commands
> +
> +const u8 cmd_init[] = {AHT10_CMD_INIT, AHT10_CAL_ENABLED | AHT10_MODE_CYC,
> +		0x00};
> +const u8 cmd_meas[] = {AHT10_CMD_MEAS, 0x33, 0x00};
> +const u8 cmd_rst[] = {AHT10_CMD_RST, 0x00, 0x00};
> +
> +struct aht10_measurement {
> +	u8 data[6];

Only used within a function and thus pointless.

> +	u8 status;

Not used at all.

> +	int temperature;
> +	int humidity;

Fold into struct aht10_data.

> +};
> +
> +/**
> + *   struct aht10_data - All the data required to operate an AHT10 chip
> + *   @client: the i2c client associated with the AHT10
> + *   @lock: a mutex that is used to prevent parallel access to the
> + *          i2c client
> + *   @initialized: whether or not the AHT10 has been initialized
> + *   @current_measurement: the last-measured values of the AHT10
> + *   @poll_interval: the minimum poll interval
> + *                   While the poll rate is not 100% necessary,
> + *                   the datasheet recommends that a measurement
> + *                   is not performed more too often to prevent
> + *                   the chip from "heating up". If it's
> + *                   unwanted, it can be ignored by setting
> + *                   it to 0.
> + */
> +
> +struct aht10_data {
> +	struct i2c_client *client;
> +	struct mutex lock;
> +	int initialized;

Only set and never used, and thus pointless.

> +	struct aht10_measurement current_measurement;
> +	ktime_t poll_interval;
> +	ktime_t previous_poll_time;
> +};
> +
> +
Please no double empty lines. Having said that, checkpatch --strict reports:

total: 0 errors, 5 warnings, 17 checks, 428 lines checked

Please fix.

> +/**
> + * aht10_init() - Initialize an AHT10 chip
> + * @client: the i2c client associated with the AHT10
> + * @data: the data associated with this AHT10 chip
> + * Return: 0 if succesfull, 1 if not
> + */
> +static int aht10_init(struct i2c_client *client, struct aht10_data *data)
> +{
> +	struct mutex *mutex = &data->lock;

Unnecessary variable.

> +
> +	int res;
> +	u8 status;
> +
> +	mutex_lock(mutex);
> +

Unnecessary lock. This is the init function. It won't be called
multiple times in parallel.

> +	usleep_range(AHT10_POWERON_USEC_DELAY, AHT10_POWERON_USEC_DELAY +
> +		AHT10_USEC_DELAY_OFFSET);

Pointless delay.

> +
> +	i2c_master_send(client, cmd_init, 3);
> +
> +	usleep_range(AHT10_CMD_USEC_DELAY, AHT10_CMD_USEC_DELAY +
> +		AHT10_USEC_DELAY_OFFSET);
> +
> +	res = i2c_master_recv(client, &status, 1);
> +
> +	if (res != 1) {
> +		mutex_unlock(mutex);
> +		return 1;

Return standard error codes. Everywhere.

> +	}
> +
> +	data->initialized = 1;
> +
> +	if (status & AHT10_BUSY)
> +		pr_warn("AHT10 busy flag is enabled! Is another program already using the AHT10?\n");

If this is a concern, return -EBUSY and exit with error.

> +
> +	mutex_unlock(mutex);
> +	return 0;
> +}
> +
> +/**
> + * aht10_read_data() - read and parse the raw data from the AHT10
> + * @client: the i2c client associated with the AHT10
> + * @aht10_data: the struct aht10_data to use for the lock
> + * @aht10_measurement: the struct aht10_measurement to store the raw
> + *                     data and parsed values in
> + * Return: 0 if succesfull, 1 if not
> + */
> +static int aht10_read_data(struct i2c_client *client,
> +			struct aht10_data *aht10_data,
> +			struct aht10_measurement *measurement)
> +{
> +	u32 temp, hum;
> +	int hum_i, temp_i;
> +	int res;
> +	struct mutex *mutex = &aht10_data->lock;
> +	int was_locked = mutex_is_locked(mutex);
> +	u8 *raw_data = measurement->data;
> +
> +	mutex_lock(mutex);
> +	if (!was_locked) {

This is both unnecessary and unsafe. Check and update
previous_poll_time from within the lock instead.

> +		i2c_master_send(client, cmd_meas, 3);
> +		usleep_range(AHT10_MEAS_USEC_DELAY,
> +			AHT10_MEAS_USEC_DELAY + AHT10_USEC_DELAY_OFFSET);
> +
> +		res = i2c_master_recv(client, raw_data, 6);
> +
> +		if (res != 6) {
> +			mutex_unlock(mutex);
> +			pr_warn("Did not receive 6 bytes from AHT10!\n");

Please no such noise.

> +			return 1;
> +		}
> +
> +		temp = ((u32) (raw_data[3] & 0x0Fu) << 16u) | ((u32) raw_data[4] << 8u) | raw_data[5];
> +		hum = ((u32) raw_data[1] << 12u) | ((u32) raw_data[2] << 4u) | (raw_data[3] & 0xF0u >> 4u);
> +
> +		/*
> +		 * Avoid doing float arithmetic, while trying to preserve
> +		 * precision. There must be a better way to do this (or
> +		 * by using 64 bit values)
> +		 */

Pointless comment. Then implement it.

> +
> +		temp = temp * 200;
> +		temp = temp >> 10u;
> +		temp = temp * 100;
> +		temp = temp >> 10u;
> +
> +		hum = hum * 100;
> +		hum = hum >> 10u;
> +		hum = hum * 100;
> +		hum = hum >> 10u;
> +
> +		temp_i = temp - 5000;
> +		hum_i = hum;
> +
> +		measurement->temperature = temp_i;
> +		measurement->humidity = hum_i;
> +	}
> +	mutex_unlock(mutex);
> +	return 0;
> +}
> +
> +/**
> + * aht10_check_and_set_polltime() - check if the minimum poll interval has
> + *                                  expired, and if so set the previous
> + *                                  poll time
> + * @data: what time to compare (and possibly set)
> + * Return: 1 if the minimum poll interval has expired, 0 if not
> + */
> +static int aht10_check_and_set_polltime(struct aht10_data *data)
> +{
> +	ktime_t current_time = ktime_get_boottime();
> +	ktime_t difference = ktime_sub(current_time,
> +				data->previous_poll_time);
> +	if (ktime_to_us(difference) >=
> +	ktime_to_us(data->poll_interval)) {

Unnecessary line split, and really bad alignment. Also way too complex.
Use ktime_after() or similar instead.

> +		data->previous_poll_time = current_time;
> +		return 1;
> +	}
> +	return 0;
> +}
> +
> +/**
> + * temperature_show() - show the temperature in Celcius
> + */
> +static ssize_t temperature_show(struct device *dev,
> +				struct device_attribute *attr,
> +				char *buf)
> +{
> +	int bytes_written;
> +	struct aht10_data *data = dev_get_drvdata(dev);
> +	struct i2c_client *client = data->client;
> +	struct aht10_measurement *measurement = &data->current_measurement;
> +
> +	if (aht10_check_and_set_polltime(data))
> +		aht10_read_data(client, data, measurement);
> +
> +	bytes_written = sprintf(buf, "%d", measurement->temperature * 10);
> +	return bytes_written;
> +}
> +
> +
> +/**
> + * humidity_show() - show the relative humidity in %H
> + */
> +static ssize_t humidity_show(struct device *dev,
> +			struct device_attribute *attr,
> +			char *buf)
> +{
> +	int bytes_written;
> +	struct aht10_data *data = dev_get_drvdata(dev);
> +	struct i2c_client *client = data->client;
> +	struct aht10_measurement *measurement = &data->current_measurement;
> +
> +	if (aht10_check_and_set_polltime(data))
> +		aht10_read_data(client, data, measurement);
> +
> +	bytes_written = sprintf(buf, "%d", measurement->humidity * 10);
> +	return bytes_written;
> +}
> +
> +/**
> + * reset_store() - reset the ATH10
> + */
> +static ssize_t reset_store(struct device *dev,
> +			struct device_attribute *attr,
> +			const char *buf, size_t count)
> +{
> +	// TODO
> +	return count;

Not acceptable.

> +}
> +
> +/**
> + * min_poll_interval_show() - show the minimum poll interval
> + *                            in milliseconds
> + */
> +static ssize_t min_poll_interval_show(struct device *dev,
> +				struct device_attribute *attr,
> +				char *buf)
> +{
> +	struct aht10_data *data = dev_get_drvdata(dev);
> +	int bytes_written;
> +	u64 usec = ktime_to_us(data->poll_interval);
> +
> +	do_div(usec, USEC_PER_MSEC);
> +	bytes_written = sprintf(buf, "%lld", usec);
> +	return bytes_written;
> +}
> +
> +/**
> + * min_poll_interval_store() - store the given minimum poll interval.
> + * Input in milliseconds
> + */
> +static ssize_t min_poll_interval_store(struct device *dev,
> +			struct device_attribute *attr,
> +			const char *buf, size_t count)
> +{
> +	struct aht10_data *data = dev_get_drvdata(dev);
> +	int i;
> +	u64 msecs;
> +	int res;
> +
> +	char null_terminated[AHT10_MAX_POLL_INTERVAL_LEN + 1];
> +
> +	if (count > AHT10_MAX_POLL_INTERVAL_LEN) {
> +		pr_warn("AHT10: Warning! Input too long. Max characters: %d\n",
> +		AHT10_MAX_POLL_INTERVAL_LEN);
> +		return count;
> +	}
> +
> +	for (i = 0; i < count && i < AHT10_MAX_POLL_INTERVAL_LEN; i++)
> +		null_terminated[i] = buf[i];
> +
> +	null_terminated[i] = 0;
> +
> +	res = kstrtoull(null_terminated, 10, &msecs);

What is the point of this ? kstrtoull() works directly on buf.

> +
> +	if (res) {
> +		pr_warn("AHT10: Warning! Invalid input.\n");

Please no such error messages. They can be used to clog the log.
Return standard error codes....

> +		return count;

... and don't ignore errors.

> +	}
> +
> +	data->poll_interval = ms_to_ktime(msecs);
> +	return count;
> +}
> +
> +static SENSOR_DEVICE_ATTR(reset, 0200, NULL, reset_store, 0);
> +static SENSOR_DEVICE_ATTR(temp1_input, 0444, temperature_show, NULL, 0);
> +static SENSOR_DEVICE_ATTR(humidity1_input, 0444, humidity_show, NULL, 0);
> +static SENSOR_DEVICE_ATTR(min_poll_interval, 0644, min_poll_interval_show,
> +						  min_poll_interval_store, 0);

Please use standard attributes.

> +
> +static struct attribute *aht10_attrs[] = {
> +	&sensor_dev_attr_reset.dev_attr.attr,
> +	&sensor_dev_attr_temp1_input.dev_attr.attr,
> +	&sensor_dev_attr_humidity1_input.dev_attr.attr,
> +	&sensor_dev_attr_min_poll_interval.dev_attr.attr,
> +	NULL,
> +};
> +
> +ATTRIBUTE_GROUPS(aht10);
> +
> +static int aht10_probe(struct i2c_client *client,
> +		const struct i2c_device_id *aht10_id)
> +{
> +	struct device *device = &client->dev;
> +	struct device *hwmon_dev;
> +	struct i2c_adapter *adapter = client->adapter;
> +	struct aht10_data *data;
> +	const struct attribute_group **attribute_groups = aht10_groups;
> +	int res = 0;
> +
> +	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C))
> +		return 0;
> +
> +	if (client->addr != AHT10_ADDR)
> +		return 0;
> +
> +	data = devm_kzalloc(device, sizeof(*data), GFP_KERNEL);
> +
Unnecessary empty line. In general, please no empty line between assignments
and value checks.

> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->poll_interval = ns_to_ktime((u64) 10000 * NSEC_PER_MSEC);
> +	data->previous_poll_time = ns_to_ktime(0);
> +	data->client = client;
> +
> +	i2c_set_clientdata(client, data);
> +
> +	mutex_init(&data->lock);
> +
> +	res = aht10_init(client, data);
> +
> +	if (res)
> +		return 2;
> +
Please use standard error codes.

> +	hwmon_dev = devm_hwmon_device_register_with_groups(device,
> +							client->name,
> +							data,
> +							attribute_groups);

New drivers shall use devm_hwmon_device_register_with_info().

> +
> +	pr_info("AHT10 was detected and registered\n");
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static int aht10_remove(struct i2c_client *client)
> +{
> +	if (client->addr != AHT10_ADDR)
> +		return 0;
> +
> +	pr_info("AHT10 was removed\n");
> +	return 0;
> +}

Pointless remove function.

> +
> +static const struct i2c_device_id aht10_id[] = {
> +	{ "aht10", 0 },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(i2c, aht10_id);
> +
> +static const struct of_device_id aht10_of_match[] = {
> +	{ .compatible = "aht10", },

Needs to be aosong,aht10 or similar (ie vendor prefix needed),
and needs to be documented.

> +};
> +> +static struct i2c_driver aht10_driver = {
> +	.driver = {
> +		.name = "aht10",
> +		.of_match_table = aht10_of_match,

This implies (unnecessary) dependency on devicetree. Please
use of_match_ptr().

> +	},
> +	.probe      = aht10_probe,
> +	.remove     = aht10_remove,
> +	.id_table   = aht10_id,
> +};
> +
> +module_i2c_driver(aht10_driver);
> +
> +MODULE_AUTHOR("Johannes Draaijer <jcdra1@gmail.com>");
> +MODULE_DESCRIPTION("AHT10 Temperature and Humidity sensor driver");
> +MODULE_VERSION("1.0");
> +MODULE_LICENSE("GPL v2");
> 

