Return-Path: <SRS0=ADoj=2I=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12FD7C47409
	for <linux-hwmon@archiver.kernel.org>; Wed, 18 Dec 2019 03:24:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C708724683
	for <linux-hwmon@archiver.kernel.org>; Wed, 18 Dec 2019 03:24:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHYaYAGt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbfLRDSA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 17 Dec 2019 22:18:00 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43375 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbfLRDSA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 Dec 2019 22:18:00 -0500
Received: by mail-pg1-f196.google.com with SMTP id k197so433149pga.10
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Dec 2019 19:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PtHEWWAuQeDyyJ3ZZDGmbWiD2CM31zKr26k5ZP86x8A=;
        b=AHYaYAGtDVx5z9E542+E+/HPuNV4i6e3gIi5sIn02cqKm82gvkFgXCE/mhT5eVA1Xa
         LW1lLGRnEblU3G19yejJehWv2vjL8tRnMN3/vLtxCYcySsM9JoMzRWZKnxJyl0uQA7lA
         XKdrM+u3ufmBYU0xI+7ZALUfDbQgdfc6uW4LF1pn7yuIT326g0kF5gcgjk5w12Yf87qM
         09YF7UM0CBj2I5UIHrSI0KE7R6zKot+DLqTot5zHXxC/UOtJgNnTWqvxVE1GkG5FI1rv
         WB7Lx2fGiuqdDoR0VEuXR1+qXqMsOaTAclnAR7qxu8VsoVNhCSa2oPbyousBcgv47Adv
         vV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PtHEWWAuQeDyyJ3ZZDGmbWiD2CM31zKr26k5ZP86x8A=;
        b=Y3BsJ8I0LJ1WYQn/0jMuKwE46o+MTC8DJ68ZJyLdOoIrPHU6eQdJwjFlscPLKfdnUT
         EUmF0zQUN0dMpsYpddieeg89QD9SEvr9pH11WJvYR8iegAH7IrVAmzrC5uhDD7p7Hj21
         X/kmjJdcmuZHGH+UV6cgSgwlKhEQ3y78cLP8tQqXyoSDAM6FJi00x9yUltCb8L6o01mt
         i286l820K4UZeoz7vtR0OomK7c57ri3hOXY6V1RQEjJ3E/m28pKHmrDN7+g8hEtjIF3Z
         N5XWsMZgegltEcP3HAv1rSnjcEqnOOxUvz5u6f2zgv1URvQ+lCopS4er1PHJ4aRgWQy3
         u5Rg==
X-Gm-Message-State: APjAAAVtUTPAS2IRn3PSoh3zOQTcE05z25gM2DsFU2FmiGyVAzFqcJw9
        CFM8GFSu3amBwn7yqBPtDMIUz6U1
X-Google-Smtp-Source: APXvYqwo8ceteFsS/jFNGxQhenpYjSOXa9B7Q7wWX7TlJUCcrpgOfpyJKVvE1Jz+opfgspJCcPth9g==
X-Received: by 2002:a63:cd06:: with SMTP id i6mr366536pgg.48.1576639078818;
        Tue, 17 Dec 2019 19:17:58 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o19sm4568660pjr.2.2019.12.17.19.17.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2019 19:17:58 -0800 (PST)
Subject: Re: [PATCH 1/1] hwmon: (adt7475) Added attenuator bypass support
To:     Logan Shaw <logan.shaw@alliedtelesis.co.nz>, jdelvare@suse.com
Cc:     linux-hwmon@vger.kernel.org
References: <20191218024238.19836-1-logan.shaw@alliedtelesis.co.nz>
 <20191218024238.19836-2-logan.shaw@alliedtelesis.co.nz>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <5f444fb6-4acc-031d-45bb-93e5384d9a40@roeck-us.net>
Date:   Tue, 17 Dec 2019 19:17:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191218024238.19836-2-logan.shaw@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 12/17/19 6:42 PM, Logan Shaw wrote:
> Added support for reading and writing the individual and global voltage
> attenuator bypasses. Added loading DTS properties to bypass attenuators on
> device probe.
> 

There is no explanation why it would be necessary or desirable (or even make sense)
to have a non-standard sysfs attribute for this (or, in other words, why this would
need to be runtime configurable). The devicetree property is not documented.

NACK for the sysfs attribute unless there is an explanation for the need
to configure it dynamically. The devicetree property needs to be documented
and approved.

The datasheet for ADC7475 does not say anything about the ability to control
attenuators other than for vcc in configuration register 4. Bit 4, 6, and 7
are listed as unused/reserved, suggesting that those bits - if at all - are
only defined for other chips. Nothing in this patch suggests what those chips
are. Attenuation bits need to be validated against the chip type.

More comments inline.

> Signed-off-by: Logan Shaw <logan.shaw@alliedtelesis.co.nz>
> ---
> ---
>   drivers/hwmon/adt7475.c | 163 +++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 162 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
> index 6c64d50c9aae..92a4be9e33eb 100644
> --- a/drivers/hwmon/adt7475.c
> +++ b/drivers/hwmon/adt7475.c
> @@ -19,6 +19,7 @@
>   #include <linux/hwmon-vid.h>
>   #include <linux/err.h>
>   #include <linux/jiffies.h>
> +#include <linux/of.h>
>   #include <linux/util_macros.h>
>   
>   /* Indexes for the sysfs hooks */
> @@ -39,6 +40,7 @@
>   
>   #define ALARM		9
>   #define FAULT		10
> +#define ATTENUATE	11
>   
>   /* 7475 Common Registers */
>   
> @@ -126,9 +128,11 @@
>   #define ADT7475_TACH_COUNT	4
>   #define ADT7475_PWM_COUNT	3
>   
> -/* Macro to read the registers */
> +/* Macros to read and write registers */
>   
>   #define adt7475_read(reg) i2c_smbus_read_byte_data(client, (reg))
> +#define adt7475_write(reg, data) i2c_smbus_write_byte_data(client, (reg), \
> +								(data))

Those are quite pointless macros. Worse, they use a hidden parameter
which should be a no-go to start with. I would accept a patch to remove
the first one, but I won't accept a patch adding yet another pointless
macro.

>   
>   /* Macros to easily index the registers */
>   
> @@ -534,6 +538,82 @@ static ssize_t temp_store(struct device *dev, struct device_attribute *attr,
>   	return count;
>   }
>   
> +/**
> + * Gets the attenuator bit index for a sattr_index.
> + *
> + * If there is no attenuator bit index for a given sattr_index then returns
> + * a negative error code.
> + */
> +static int config4_attenuate_index(char sattr_index)
> +{
> +	int index = -EBADR;
> +
> +	switch (sattr_index) {
> +	case 0:
> +		index = 4;
> +		break;
> +	case 1:
> +		index = 5;
> +		break;
> +	case 3:
> +		index = 6;
> +		break;
> +	case 4:
> +		index = 7;
> +		break;
> +	}
> +
> +	return index;
> +}

This function won't be called for non-supported values of sattr_index.
The calling code doesn't even check the return value for errors.
This is unacceptable, and can be simplified with an if/else.
Besides, the the correct index could be set directly in
SENSOR_DEVICE_ATTR_2_RW, making the function quite pointless.

> +
> +/**
> + * Gets the bypass attenuator bit for a voltage input and stores it in the char
> + * array buf.
> + */
> +static ssize_t bypass_attenuator_show(struct device *dev,
> +				      struct device_attribute *attr, char *buf)
> +{
> +	struct adt7475_data *data = adt7475_update_device(dev);
> +	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
> +	u8 attn_bypassed = !!(data->config4 &
> +				(1 << config4_attenuate_index(sattr->index)));
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
> +	return sprintf(buf, "%d\n", attn_bypassed);
> +}
> +
> +/**
> + * Sets the bypass attenuator bit for a given voltage input.
> + */
> +static ssize_t bypass_attenuator_store(struct device *dev,
> +				     struct device_attribute *attr,
> +				     const char *buf, size_t count)
> +{
> +	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct adt7475_data *data = i2c_get_clientdata(client);
> +	long val;
> +
> +	if (kstrtol(buf, 2, &val))
> +		return -EINVAL;
> +
> +	mutex_lock(&data->lock);
> +	data->config4 = adt7475_read(REG_CONFIG4);
> +	if (data->config4 < 0)
> +		return data->config4;
> +
> +	if (val == 0)
> +		data->config4 &= ~(1 << config4_attenuate_index(sattr->index));
> +	else
> +		data->config4 |= (1 << config4_attenuate_index(sattr->index));
> +
> +	adt7475_write(REG_CONFIG4, data->config4);
> +	mutex_unlock(&data->lock);
> +
> +	return count;
> +}
> +
>   /* Assuming CONFIG6[SLOW] is 0 */
>   static const int ad7475_st_map[] = {
>   	37500, 18800, 12500, 7500, 4700, 3100, 1600, 800,
> @@ -1080,10 +1160,14 @@ static SENSOR_DEVICE_ATTR_2_RO(in0_input, voltage, INPUT, 0);
>   static SENSOR_DEVICE_ATTR_2_RW(in0_max, voltage, MAX, 0);
>   static SENSOR_DEVICE_ATTR_2_RW(in0_min, voltage, MIN, 0);
>   static SENSOR_DEVICE_ATTR_2_RO(in0_alarm, voltage, ALARM, 0);
> +static SENSOR_DEVICE_ATTR_2_RW(in0_attenuator_bypass, bypass_attenuator,
> +				ATTENUATE, 0);
>   static SENSOR_DEVICE_ATTR_2_RO(in1_input, voltage, INPUT, 1);
>   static SENSOR_DEVICE_ATTR_2_RW(in1_max, voltage, MAX, 1);
>   static SENSOR_DEVICE_ATTR_2_RW(in1_min, voltage, MIN, 1);
>   static SENSOR_DEVICE_ATTR_2_RO(in1_alarm, voltage, ALARM, 1);
> +static SENSOR_DEVICE_ATTR_2_RW(in1_attenuator_bypass, bypass_attenuator,
> +				ATTENUATE, 1);
>   static SENSOR_DEVICE_ATTR_2_RO(in2_input, voltage, INPUT, 2);
>   static SENSOR_DEVICE_ATTR_2_RW(in2_max, voltage, MAX, 2);
>   static SENSOR_DEVICE_ATTR_2_RW(in2_min, voltage, MIN, 2);
> @@ -1092,10 +1176,14 @@ static SENSOR_DEVICE_ATTR_2_RO(in3_input, voltage, INPUT, 3);
>   static SENSOR_DEVICE_ATTR_2_RW(in3_max, voltage, MAX, 3);
>   static SENSOR_DEVICE_ATTR_2_RW(in3_min, voltage, MIN, 3);
>   static SENSOR_DEVICE_ATTR_2_RO(in3_alarm, voltage, ALARM, 3);
> +static SENSOR_DEVICE_ATTR_2_RW(in3_attenuator_bypass, bypass_attenuator,
> +				ATTENUATE, 3);
>   static SENSOR_DEVICE_ATTR_2_RO(in4_input, voltage, INPUT, 4);
>   static SENSOR_DEVICE_ATTR_2_RW(in4_max, voltage, MAX, 4);
>   static SENSOR_DEVICE_ATTR_2_RW(in4_min, voltage, MIN, 4);
>   static SENSOR_DEVICE_ATTR_2_RO(in4_alarm, voltage, ALARM, 8);
> +static SENSOR_DEVICE_ATTR_2_RW(in4_attenuator_bypass, bypass_attenuator,
> +				ATTENUATE, 4);
>   static SENSOR_DEVICE_ATTR_2_RO(in5_input, voltage, INPUT, 5);
>   static SENSOR_DEVICE_ATTR_2_RW(in5_max, voltage, MAX, 5);
>   static SENSOR_DEVICE_ATTR_2_RW(in5_min, voltage, MIN, 5);
> @@ -1177,6 +1265,7 @@ static struct attribute *adt7475_attrs[] = {
>   	&sensor_dev_attr_in1_max.dev_attr.attr,
>   	&sensor_dev_attr_in1_min.dev_attr.attr,
>   	&sensor_dev_attr_in1_alarm.dev_attr.attr,
> +	&sensor_dev_attr_in1_attenuator_bypass.dev_attr.attr,
>   	&sensor_dev_attr_in2_input.dev_attr.attr,
>   	&sensor_dev_attr_in2_max.dev_attr.attr,
>   	&sensor_dev_attr_in2_min.dev_attr.attr,
> @@ -1263,6 +1352,7 @@ static struct attribute *in0_attrs[] = {
>   	&sensor_dev_attr_in0_max.dev_attr.attr,
>   	&sensor_dev_attr_in0_min.dev_attr.attr,
>   	&sensor_dev_attr_in0_alarm.dev_attr.attr,
> +	&sensor_dev_attr_in0_attenuator_bypass.dev_attr.attr,
>   	NULL
>   };
>   
> @@ -1271,6 +1361,7 @@ static struct attribute *in3_attrs[] = {
>   	&sensor_dev_attr_in3_max.dev_attr.attr,
>   	&sensor_dev_attr_in3_min.dev_attr.attr,
>   	&sensor_dev_attr_in3_alarm.dev_attr.attr,
> +	&sensor_dev_attr_in3_attenuator_bypass.dev_attr.attr,
>   	NULL
>   };
>   
> @@ -1279,6 +1370,7 @@ static struct attribute *in4_attrs[] = {
>   	&sensor_dev_attr_in4_max.dev_attr.attr,
>   	&sensor_dev_attr_in4_min.dev_attr.attr,
>   	&sensor_dev_attr_in4_alarm.dev_attr.attr,
> +	&sensor_dev_attr_in4_attenuator_bypass.dev_attr.attr,
>   	NULL
>   };
>   
> @@ -1457,6 +1549,69 @@ static int adt7475_update_limits(struct i2c_client *client)
>   	return 0;
>   }
>   
> +/**

Is this an API function that would warrant documentation ?

> + * Reads individual voltage input bypass attenuator properties from the DTS,
> + * and if the property is present the corresponding bit is set in the
> + * register.
> + *
> + * Properties must be in the form of "bypass-attenuator-inx", where x is an
> + * integer from the set {0, 1, 3, 4} (can not bypass in2 attenuator).
> + *
> + * Returns a negative error code if there was an error writing to the register.
> + */
> +static int load_individual_bypass_attenuators(const struct i2c_client *client,
> +					      u8 *config4)
> +{
> +	char buf[32];
> +	int attenuate_index, input_index;
> +	u8 config4_copy = *config4;
> +
> +	for (input_index = 0; input_index < 5; input_index++) {
> +		attenuate_index = config4_attenuate_index(input_index);
> +		if (attenuate_index < 0)
> +			continue;
> +
> +		sprintf(buf, "bypass-attenuator-in%d", input_index);
> +		if (of_get_property(client->dev.of_node, buf, NULL))
> +			config4_copy |= (1 << attenuate_index);
> +	}
> +
> +	if (adt7475_write(REG_CONFIG4, config4_copy) < 0)
> +		// Failed to update register

Please follow Documentation/hwmon/submitting-patches.rst.

> +		return -EREMOTEIO;
> +
> +	*config4 = config4_copy;
> +
> +	return 0;
> +}
> +
> +/**
> + * Sets the bypass all attenuators bit, if the "bypass-attenuator-all"
> + * property exists in the DTS.
> + *
> + * Returns a negative error code if there was an error writing to the
> + * register.
> + */
> +static int load_all_bypass_attenuator(const struct i2c_client *client,
> +				      u8 *config2)
> +{
> +	u8 config2_copy = *config2;
> +
> +	if (!of_get_property(client->dev.of_node,
> +			     "bypass-attenuator-all", NULL))
> +		return 0;
> +
> +	config2_copy |= (1 << 5);
> +
> +	if (adt7475_write(REG_CONFIG2, config2_copy) < 0)
> +		// failed to write to register
> +		return -EREMOTEIO;
> +
> +	*config2 = config2_copy;
> +
> +	return 0;
> +}
> +
>   static int adt7475_probe(struct i2c_client *client,
>   			 const struct i2c_device_id *id)
>   {
> @@ -1545,7 +1700,13 @@ static int adt7475_probe(struct i2c_client *client,
>   	}
>   
>   	/* Voltage attenuators can be bypassed, globally or individually */
> +	if (load_individual_bypass_attenuators(client, &(data->config4)) < 0)
> +		dev_warn(&client->dev,
> +			 "Error setting bypass attenuator bits\n");
> +
>   	config2 = adt7475_read(REG_CONFIG2);
> +	if (load_all_bypass_attenuator(client, &config2) < 0)
> +		dev_warn(&client->dev, "Error setting bypass all attenuator\n");
>   	if (config2 & CONFIG2_ATTN) {
>   		data->bypass_attn = (0x3 << 3) | 0x3;
>   	} else {
> 

