Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B21A2C4361B
	for <linux-hwmon@archiver.kernel.org>; Mon, 14 Dec 2020 09:01:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C5F42076A
	for <linux-hwmon@archiver.kernel.org>; Mon, 14 Dec 2020 09:01:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439500AbgLNJBO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 14 Dec 2020 04:01:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439496AbgLNJBN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 14 Dec 2020 04:01:13 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1C75C0613CF
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Dec 2020 01:00:32 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id 23so28197820lfg.10
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Dec 2020 01:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uDMhfTzImcAz16ykzapMdU6zJDZvzxvNuyGWCugsm5w=;
        b=Ivu4P3YiiBMEMMuK/P/sSJMEspT/Y3M8ptFVQlWcLBLGot0GtQB6VNAUDDPuFTEcOj
         iKNsRKNenj4y2EphAuyHJU01bFqRqN0ySk87CbBZcEsAqrMoiiJZUD/JhaxZKQGEQ+WD
         EN5yf5K91NQEL61fZz/x9C9/VD22ihzuKKekJSuvQyqp5pFhRLKh/KSXLoMTaTOWuO+a
         W3pX6UGoYWchlCsYIAjm9EcKVUFwbclOAgjPIsW76oTOcfb0dqXTusZADZddOV/O0tJX
         tqyzXQSdTkU+40n46MxUx2ykPYNSDRKKqUS/vA6tkVezHRh8C1y6h+/OerY5Aiy7TAIE
         TL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uDMhfTzImcAz16ykzapMdU6zJDZvzxvNuyGWCugsm5w=;
        b=JilJNd1HG6ssM1F76u5+yFRvqneaQdY6rs3NfNCDhg2phDLgmT+5mVipg9HomjvtC8
         3bWrSfPE8Y2qqmFqMXRefXoU9g9Da/wsbPJ6u9LAd+9BKl3WUhdsYZyQbvQvCtQ/22Hq
         O+FCySE7n4tf8xRPLSQy00CR8SO1oVXvkzvFFl6ZX1lTcM10DVx+znnr/001qJbJY0YP
         SDpXBTZT66syZVY2heVijZBaUfHMp0wUe/rbKJKswRYrYgnC6ShOF8KEjpDuF/gL6rdA
         DyIwaoykvm2OVKu7ETL5q54fbLAlcUvNon8gGFYiWxkRPQhobyNFYQ4XyXvxMkwkmAO/
         z7kg==
X-Gm-Message-State: AOAM532Y+JFFshMv2vx6WXkR7Jk8xGmj+b1j7uK909OvAw5v/9Vvy+mg
        /S+9qNnt1uU6ZMJuOReZJAcjN28jps0=
X-Google-Smtp-Source: ABdhPJxtiU/StS2hsncGnM5eovzdhoChaokLFbs2soZDqKTvQ1eRpxxe9dQDOCwEizH4CcczHSZQJQ==
X-Received: by 2002:a19:e8a:: with SMTP id 132mr8784814lfo.108.1607936430951;
        Mon, 14 Dec 2020 01:00:30 -0800 (PST)
Received: from desktop (94-255-234-122.cust.bredband2.com. [94.255.234.122])
        by smtp.gmail.com with ESMTPSA id u5sm1699798lfr.154.2020.12.14.01.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 01:00:30 -0800 (PST)
Date:   Mon, 14 Dec 2020 10:00:28 +0100
From:   Johannes Cornelis Draaijer <jcdra1@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: Add AHT10 Temperature and Humidity Sensor Driver
Message-ID: <20201214090028.GB8078@desktop>
References: <20201213214826.GA524437@desktop>
 <f9cd5231-2fa6-dd76-bf42-9cbfb8971b16@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9cd5231-2fa6-dd76-bf42-9cbfb8971b16@roeck-us.net>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Thank you very much for the insightful and quick response. 
I think I've fixed my mail issues now (once more, thanks for 
pointing that out). I will fix the issues that you've listed and
resubmit sometime during this week.

On Sun, Dec 13, 2020 at 03:10:52PM -0800, Guenter Roeck wrote:
> On 12/13/20 1:48 PM, datdenkikniet wrote:
> > This patch adds a hwmon driver for the AHT10 Temperature
> > and Humidity sensor. It has a maxiumum sample rate, as
> > the datasheet states that the chip may heat up if it is
> > sampled too often.
> > 
> > Has been tested to work on a raspberrypi0w
> > 
> > Signed-off-by: Johannes Cornelis Draaijer (datdenkikniet) <jcdra1@gmail.com>
> 
> This patch didn't make it to patchwork. On top of that, my e-mail provider
> tagged it as spam, based on the following information.
> 
>         1.0 TVD_RCVD_IP            Message was received from an IP address
>         0.4 NO_DNS_FOR_FROM        DNS: Envelope sender has no MX or A DNS records
>         0.0 SPF_NONE               SPF: sender does not publish an SPF Record
>         0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail domains are different
>         1.0 FORGED_GMAIL_RCVD      'From' gmail.com does not match 'Received' headers
>         0.5 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider [jcdra1[at]gmail.com]
>         0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
>         0.0 DKIM_ADSP_CUSTOM_MED   No valid author signature, adsp_override is CUSTOM_MED
>         0.0 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom freemail headers are different
>         0.4 RDNS_DYNAMIC           Delivered to internal network by host with dynamic-looking rDNS
>         1.2 NML_ADSP_CUSTOM_MED    ADSP custom_med hit, and not from a mailing list
>         0.3 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
>         2.0 SPOOFED_FREEMAIL       No description available.
>         1.0 TO_NO_BRKTS_PCNT       To: lacks brackets + percentage
> 
> I would suggest to fix that before resubmitting.
> 
> > ---
> >  drivers/hwmon/Kconfig  |  10 +
> >  drivers/hwmon/Makefile |   1 +
> >  drivers/hwmon/aht10.c  | 405 +++++++++++++++++++++++++++++++++++++++++
> 
> Documentation is missing.
> 
> >  3 files changed, 416 insertions(+)
> >  create mode 100644 drivers/hwmon/aht10.c
> > 
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index 288ae9f63588..96bad243d729 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -257,6 +257,16 @@ config SENSORS_ADT7475
> >  	  This driver can also be built as a module. If so, the module
> >  	  will be called adt7475.
> >  
> > +config SENSORS_AHT10
> > +	tristate "Aosong AHT10"
> > +	depends on I2C
> > +	help
> > +	  If you say yes here, you get support for the Aosong AHT10
> > +	  temperature and humidity sensors
> > +
> > +	  This driver can also be built as a module. If so, the module
> > +	  will be called aht10.
> > +
> >  config SENSORS_AS370
> >  	tristate "Synaptics AS370 SoC hardware monitoring driver"
> >  	help
> > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> > index 3e32c21f5efe..6cb44d54e628 100644
> > --- a/drivers/hwmon/Makefile
> > +++ b/drivers/hwmon/Makefile
> > @@ -45,6 +45,7 @@ obj-$(CONFIG_SENSORS_ADT7411)	+= adt7411.o
> >  obj-$(CONFIG_SENSORS_ADT7462)	+= adt7462.o
> >  obj-$(CONFIG_SENSORS_ADT7470)	+= adt7470.o
> >  obj-$(CONFIG_SENSORS_ADT7475)	+= adt7475.o
> > +obj-$(CONFIG_SENSORS_AHT10)	+= aht10.o
> >  obj-$(CONFIG_SENSORS_AMD_ENERGY) += amd_energy.o
> >  obj-$(CONFIG_SENSORS_APPLESMC)	+= applesmc.o
> >  obj-$(CONFIG_SENSORS_ARM_SCMI)	+= scmi-hwmon.o
> > diff --git a/drivers/hwmon/aht10.c b/drivers/hwmon/aht10.c
> > new file mode 100644
> > index 000000000000..1eeddce02ae9
> > --- /dev/null
> > +++ b/drivers/hwmon/aht10.c
> > @@ -0,0 +1,405 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +
> > +/*
> > + * aht10.c - Linux hwmon driver for AHT10 I2C Temperature and Humidity sensor
> > + * Copyright (C) 2020 Johannes Cornelis Draaijer
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/i2c.h>
> > +#include <linux/mutex.h>
> > +#include <linux/delay.h>
> > +#include <linux/ktime.h>
> > +#include <linux/err.h>
> > +#include <asm/div64.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/hwmon-sysfs.h>
> 
> Alphabetic include file order, please.
> 
> > +
> > +#define AHT10_ADDR 0x38
> > +
> > +// Delays
> > +
> > +#define AHT10_POWERON_USEC_DELAY 40000
> > +#define AHT10_MEAS_USEC_DELAY 80000
> > +#define AHT10_CMD_USEC_DELAY 350000
> > +#define AHT10_USEC_DELAY_OFFSET 100000
> 
> Please use
> 
> #define<space>XXX<tab>VALUE
> 
> > +
> > +// Command bytes
> 
> Please no C++ style comments (except for the SPDX identifier)
> 
> > +
> > +#define AHT10_CMD_INIT 0b11100001
> > +#define AHT10_CMD_MEAS 0b10101100
> > +#define AHT10_CMD_RST  0b10111010
> > +
> > +// Flags in the answer byte/command
> > +
> > +#define AHT10_RESP_ERROR 0xFF
> > +
> > +#define AHT10_CAL_ENABLED (1u << 3u)
> > +#define AHT10_BUSY        (1u << 7u)
> > +#define AHT10_MODE_NOR    (0b11u << 5u)
> > +#define AHT10_MODE_CYC    (0b01u << 5u)
> > +#define AHT10_MODE_CMD    (0b10u << 5u)
> > +
> 
> Please use bit operations where possible.,
> 
> > +#define AHT10_MAX_POLL_INTERVAL_LEN 30
> > +
> > +// Full commands
> > +
> > +const u8 cmd_init[] = {AHT10_CMD_INIT, AHT10_CAL_ENABLED | AHT10_MODE_CYC,
> > +		0x00};
> > +const u8 cmd_meas[] = {AHT10_CMD_MEAS, 0x33, 0x00};
> > +const u8 cmd_rst[] = {AHT10_CMD_RST, 0x00, 0x00};
> > +
> > +struct aht10_measurement {
> > +	u8 data[6];
> 
> Only used within a function and thus pointless.
> 
> > +	u8 status;
> 
> Not used at all.
> 
> > +	int temperature;
> > +	int humidity;
> 
> Fold into struct aht10_data.
> 
> > +};
> > +
> > +/**
> > + *   struct aht10_data - All the data required to operate an AHT10 chip
> > + *   @client: the i2c client associated with the AHT10
> > + *   @lock: a mutex that is used to prevent parallel access to the
> > + *          i2c client
> > + *   @initialized: whether or not the AHT10 has been initialized
> > + *   @current_measurement: the last-measured values of the AHT10
> > + *   @poll_interval: the minimum poll interval
> > + *                   While the poll rate is not 100% necessary,
> > + *                   the datasheet recommends that a measurement
> > + *                   is not performed more too often to prevent
> > + *                   the chip from "heating up". If it's
> > + *                   unwanted, it can be ignored by setting
> > + *                   it to 0.
> > + */
> > +
> > +struct aht10_data {
> > +	struct i2c_client *client;
> > +	struct mutex lock;
> > +	int initialized;
> 
> Only set and never used, and thus pointless.
> 
> > +	struct aht10_measurement current_measurement;
> > +	ktime_t poll_interval;
> > +	ktime_t previous_poll_time;
> > +};
> > +
> > +
> Please no double empty lines. Having said that, checkpatch --strict reports:
> 
> total: 0 errors, 5 warnings, 17 checks, 428 lines checked
> 
> Please fix.
> 
> > +/**
> > + * aht10_init() - Initialize an AHT10 chip
> > + * @client: the i2c client associated with the AHT10
> > + * @data: the data associated with this AHT10 chip
> > + * Return: 0 if succesfull, 1 if not
> > + */
> > +static int aht10_init(struct i2c_client *client, struct aht10_data *data)
> > +{
> > +	struct mutex *mutex = &data->lock;
> 
> Unnecessary variable.
> 
> > +
> > +	int res;
> > +	u8 status;
> > +
> > +	mutex_lock(mutex);
> > +
> 
> Unnecessary lock. This is the init function. It won't be called
> multiple times in parallel.
> 
> > +	usleep_range(AHT10_POWERON_USEC_DELAY, AHT10_POWERON_USEC_DELAY +
> > +		AHT10_USEC_DELAY_OFFSET);
> 
> Pointless delay.
> 
> > +
> > +	i2c_master_send(client, cmd_init, 3);
> > +
> > +	usleep_range(AHT10_CMD_USEC_DELAY, AHT10_CMD_USEC_DELAY +
> > +		AHT10_USEC_DELAY_OFFSET);
> > +
> > +	res = i2c_master_recv(client, &status, 1);
> > +
> > +	if (res != 1) {
> > +		mutex_unlock(mutex);
> > +		return 1;
> 
> Return standard error codes. Everywhere.
> 
> > +	}
> > +
> > +	data->initialized = 1;
> > +
> > +	if (status & AHT10_BUSY)
> > +		pr_warn("AHT10 busy flag is enabled! Is another program already using the AHT10?\n");
> 
> If this is a concern, return -EBUSY and exit with error.
> 
> > +
> > +	mutex_unlock(mutex);
> > +	return 0;
> > +}
> > +
> > +/**
> > + * aht10_read_data() - read and parse the raw data from the AHT10
> > + * @client: the i2c client associated with the AHT10
> > + * @aht10_data: the struct aht10_data to use for the lock
> > + * @aht10_measurement: the struct aht10_measurement to store the raw
> > + *                     data and parsed values in
> > + * Return: 0 if succesfull, 1 if not
> > + */
> > +static int aht10_read_data(struct i2c_client *client,
> > +			struct aht10_data *aht10_data,
> > +			struct aht10_measurement *measurement)
> > +{
> > +	u32 temp, hum;
> > +	int hum_i, temp_i;
> > +	int res;
> > +	struct mutex *mutex = &aht10_data->lock;
> > +	int was_locked = mutex_is_locked(mutex);
> > +	u8 *raw_data = measurement->data;
> > +
> > +	mutex_lock(mutex);
> > +	if (!was_locked) {
> 
> This is both unnecessary and unsafe. Check and update
> previous_poll_time from within the lock instead.
> 
> > +		i2c_master_send(client, cmd_meas, 3);
> > +		usleep_range(AHT10_MEAS_USEC_DELAY,
> > +			AHT10_MEAS_USEC_DELAY + AHT10_USEC_DELAY_OFFSET);
> > +
> > +		res = i2c_master_recv(client, raw_data, 6);
> > +
> > +		if (res != 6) {
> > +			mutex_unlock(mutex);
> > +			pr_warn("Did not receive 6 bytes from AHT10!\n");
> 
> Please no such noise.
> 
> > +			return 1;
> > +		}
> > +
> > +		temp = ((u32) (raw_data[3] & 0x0Fu) << 16u) | ((u32) raw_data[4] << 8u) | raw_data[5];
> > +		hum = ((u32) raw_data[1] << 12u) | ((u32) raw_data[2] << 4u) | (raw_data[3] & 0xF0u >> 4u);
> > +
> > +		/*
> > +		 * Avoid doing float arithmetic, while trying to preserve
> > +		 * precision. There must be a better way to do this (or
> > +		 * by using 64 bit values)
> > +		 */
> 
> Pointless comment. Then implement it.
> 
> > +
> > +		temp = temp * 200;
> > +		temp = temp >> 10u;
> > +		temp = temp * 100;
> > +		temp = temp >> 10u;
> > +
> > +		hum = hum * 100;
> > +		hum = hum >> 10u;
> > +		hum = hum * 100;
> > +		hum = hum >> 10u;
> > +
> > +		temp_i = temp - 5000;
> > +		hum_i = hum;
> > +
> > +		measurement->temperature = temp_i;
> > +		measurement->humidity = hum_i;
> > +	}
> > +	mutex_unlock(mutex);
> > +	return 0;
> > +}
> > +
> > +/**
> > + * aht10_check_and_set_polltime() - check if the minimum poll interval has
> > + *                                  expired, and if so set the previous
> > + *                                  poll time
> > + * @data: what time to compare (and possibly set)
> > + * Return: 1 if the minimum poll interval has expired, 0 if not
> > + */
> > +static int aht10_check_and_set_polltime(struct aht10_data *data)
> > +{
> > +	ktime_t current_time = ktime_get_boottime();
> > +	ktime_t difference = ktime_sub(current_time,
> > +				data->previous_poll_time);
> > +	if (ktime_to_us(difference) >=
> > +	ktime_to_us(data->poll_interval)) {
> 
> Unnecessary line split, and really bad alignment. Also way too complex.
> Use ktime_after() or similar instead.
> 
> > +		data->previous_poll_time = current_time;
> > +		return 1;
> > +	}
> > +	return 0;
> > +}
> > +
> > +/**
> > + * temperature_show() - show the temperature in Celcius
> > + */
> > +static ssize_t temperature_show(struct device *dev,
> > +				struct device_attribute *attr,
> > +				char *buf)
> > +{
> > +	int bytes_written;
> > +	struct aht10_data *data = dev_get_drvdata(dev);
> > +	struct i2c_client *client = data->client;
> > +	struct aht10_measurement *measurement = &data->current_measurement;
> > +
> > +	if (aht10_check_and_set_polltime(data))
> > +		aht10_read_data(client, data, measurement);
> > +
> > +	bytes_written = sprintf(buf, "%d", measurement->temperature * 10);
> > +	return bytes_written;
> > +}
> > +
> > +
> > +/**
> > + * humidity_show() - show the relative humidity in %H
> > + */
> > +static ssize_t humidity_show(struct device *dev,
> > +			struct device_attribute *attr,
> > +			char *buf)
> > +{
> > +	int bytes_written;
> > +	struct aht10_data *data = dev_get_drvdata(dev);
> > +	struct i2c_client *client = data->client;
> > +	struct aht10_measurement *measurement = &data->current_measurement;
> > +
> > +	if (aht10_check_and_set_polltime(data))
> > +		aht10_read_data(client, data, measurement);
> > +
> > +	bytes_written = sprintf(buf, "%d", measurement->humidity * 10);
> > +	return bytes_written;
> > +}
> > +
> > +/**
> > + * reset_store() - reset the ATH10
> > + */
> > +static ssize_t reset_store(struct device *dev,
> > +			struct device_attribute *attr,
> > +			const char *buf, size_t count)
> > +{
> > +	// TODO
> > +	return count;
> 
> Not acceptable.
> 
> > +}
> > +
> > +/**
> > + * min_poll_interval_show() - show the minimum poll interval
> > + *                            in milliseconds
> > + */
> > +static ssize_t min_poll_interval_show(struct device *dev,
> > +				struct device_attribute *attr,
> > +				char *buf)
> > +{
> > +	struct aht10_data *data = dev_get_drvdata(dev);
> > +	int bytes_written;
> > +	u64 usec = ktime_to_us(data->poll_interval);
> > +
> > +	do_div(usec, USEC_PER_MSEC);
> > +	bytes_written = sprintf(buf, "%lld", usec);
> > +	return bytes_written;
> > +}
> > +
> > +/**
> > + * min_poll_interval_store() - store the given minimum poll interval.
> > + * Input in milliseconds
> > + */
> > +static ssize_t min_poll_interval_store(struct device *dev,
> > +			struct device_attribute *attr,
> > +			const char *buf, size_t count)
> > +{
> > +	struct aht10_data *data = dev_get_drvdata(dev);
> > +	int i;
> > +	u64 msecs;
> > +	int res;
> > +
> > +	char null_terminated[AHT10_MAX_POLL_INTERVAL_LEN + 1];
> > +
> > +	if (count > AHT10_MAX_POLL_INTERVAL_LEN) {
> > +		pr_warn("AHT10: Warning! Input too long. Max characters: %d\n",
> > +		AHT10_MAX_POLL_INTERVAL_LEN);
> > +		return count;
> > +	}
> > +
> > +	for (i = 0; i < count && i < AHT10_MAX_POLL_INTERVAL_LEN; i++)
> > +		null_terminated[i] = buf[i];
> > +
> > +	null_terminated[i] = 0;
> > +
> > +	res = kstrtoull(null_terminated, 10, &msecs);
> 
> What is the point of this ? kstrtoull() works directly on buf.
> 
> > +
> > +	if (res) {
> > +		pr_warn("AHT10: Warning! Invalid input.\n");
> 
> Please no such error messages. They can be used to clog the log.
> Return standard error codes....
> 
> > +		return count;
> 
> ... and don't ignore errors.
> 
> > +	}
> > +
> > +	data->poll_interval = ms_to_ktime(msecs);
> > +	return count;
> > +}
> > +
> > +static SENSOR_DEVICE_ATTR(reset, 0200, NULL, reset_store, 0);
> > +static SENSOR_DEVICE_ATTR(temp1_input, 0444, temperature_show, NULL, 0);
> > +static SENSOR_DEVICE_ATTR(humidity1_input, 0444, humidity_show, NULL, 0);
> > +static SENSOR_DEVICE_ATTR(min_poll_interval, 0644, min_poll_interval_show,
> > +						  min_poll_interval_store, 0);
> 
> Please use standard attributes.
> 
> > +
> > +static struct attribute *aht10_attrs[] = {
> > +	&sensor_dev_attr_reset.dev_attr.attr,
> > +	&sensor_dev_attr_temp1_input.dev_attr.attr,
> > +	&sensor_dev_attr_humidity1_input.dev_attr.attr,
> > +	&sensor_dev_attr_min_poll_interval.dev_attr.attr,
> > +	NULL,
> > +};
> > +
> > +ATTRIBUTE_GROUPS(aht10);
> > +
> > +static int aht10_probe(struct i2c_client *client,
> > +		const struct i2c_device_id *aht10_id)
> > +{
> > +	struct device *device = &client->dev;
> > +	struct device *hwmon_dev;
> > +	struct i2c_adapter *adapter = client->adapter;
> > +	struct aht10_data *data;
> > +	const struct attribute_group **attribute_groups = aht10_groups;
> > +	int res = 0;
> > +
> > +	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C))
> > +		return 0;
> > +
> > +	if (client->addr != AHT10_ADDR)
> > +		return 0;
> > +
> > +	data = devm_kzalloc(device, sizeof(*data), GFP_KERNEL);
> > +
> Unnecessary empty line. In general, please no empty line between assignments
> and value checks.
> 
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	data->poll_interval = ns_to_ktime((u64) 10000 * NSEC_PER_MSEC);
> > +	data->previous_poll_time = ns_to_ktime(0);
> > +	data->client = client;
> > +
> > +	i2c_set_clientdata(client, data);
> > +
> > +	mutex_init(&data->lock);
> > +
> > +	res = aht10_init(client, data);
> > +
> > +	if (res)
> > +		return 2;
> > +
> Please use standard error codes.
> 
> > +	hwmon_dev = devm_hwmon_device_register_with_groups(device,
> > +							client->name,
> > +							data,
> > +							attribute_groups);
> 
> New drivers shall use devm_hwmon_device_register_with_info().
> 
> > +
> > +	pr_info("AHT10 was detected and registered\n");
> > +	return PTR_ERR_OR_ZERO(hwmon_dev);
> > +}
> > +
> > +static int aht10_remove(struct i2c_client *client)
> > +{
> > +	if (client->addr != AHT10_ADDR)
> > +		return 0;
> > +
> > +	pr_info("AHT10 was removed\n");
> > +	return 0;
> > +}
> 
> Pointless remove function.
> 
> > +
> > +static const struct i2c_device_id aht10_id[] = {
> > +	{ "aht10", 0 },
> > +	{ },
> > +};
> > +MODULE_DEVICE_TABLE(i2c, aht10_id);
> > +
> > +static const struct of_device_id aht10_of_match[] = {
> > +	{ .compatible = "aht10", },
> 
> Needs to be aosong,aht10 or similar (ie vendor prefix needed),
> and needs to be documented.
> 
> > +};
> > +> +static struct i2c_driver aht10_driver = {
> > +	.driver = {
> > +		.name = "aht10",
> > +		.of_match_table = aht10_of_match,
> 
> This implies (unnecessary) dependency on devicetree. Please
> use of_match_ptr().
> 
> > +	},
> > +	.probe      = aht10_probe,
> > +	.remove     = aht10_remove,
> > +	.id_table   = aht10_id,
> > +};
> > +
> > +module_i2c_driver(aht10_driver);
> > +
> > +MODULE_AUTHOR("Johannes Draaijer <jcdra1@gmail.com>");
> > +MODULE_DESCRIPTION("AHT10 Temperature and Humidity sensor driver");
> > +MODULE_VERSION("1.0");
> > +MODULE_LICENSE("GPL v2");
> > 
> 
