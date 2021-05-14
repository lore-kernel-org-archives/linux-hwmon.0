Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1129C433B4
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 May 2021 21:25:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1C2361482
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 May 2021 21:25:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231265AbhENV0b (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 14 May 2021 17:26:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbhENV0b (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 May 2021 17:26:31 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B554C06174A
        for <linux-hwmon@vger.kernel.org>; Fri, 14 May 2021 14:25:19 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id v18so349509qvx.10
        for <linux-hwmon@vger.kernel.org>; Fri, 14 May 2021 14:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=kDLs2G1vEoPlAaJKGYIauEkmpEhcXYC4vZZna/7ufDM=;
        b=nnklITkUT6cDeKCzuMcXyFr+aqokv4Hd0u5TMC+6mx7adnZcPbpCi1+fpR6fLeaKXr
         TVjTyDPDtL0rr+/Eg5uIJzKRjdvvgqTVQFaSRLV50YwZ7iCr/sn1/vFp62V2aekaSvbE
         QNYA2Oymr4NySunoGu/Gx88fI88gcMJFyzy5ZexCNQ97qwJaFejcHSs/7lZdrH4ipodI
         UkH7EkWaMU+iqjjBcWDzTXtoq72P+zQ+UTonrmwiB5c6o7pMsF0J2PBcseMQYBRVXAGY
         RevARpstbGsAbAuV0wr9S2FT1k+Oan9jJEwwMrFFVZmKxV9miUbq2y/XTg8tpQ35WH1m
         xBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition:content-transfer-encoding;
        bh=kDLs2G1vEoPlAaJKGYIauEkmpEhcXYC4vZZna/7ufDM=;
        b=rguLAarHp6DE1X2I3z1Vlnx/Ef5aU3vrraXNeSPz7Em5f+fqAylAzeVhfG8R1XCTMJ
         tnDOA5NO094GuhL7fn5bYZNPFZj8DyQvnBn53frdql5VRKrjwEHM+VhAqjrLfo/cdc+t
         mPrPdspUbR7enhGwq1NjTCkXZ1l26wSWTGP92Au6CErjKiAw/Ad71lRrDe6vz7987Brl
         c6tRov89GJdM0vU2jxBkLIw0/FMFHj2kLN1qWnkVMSL/2vgdon+rPb9mpCQ41T4WWujh
         C3mwkY/NSc9GZdLwYOwyyv0pSOk1zECgB6ebaFuYGmAWISa7FXcHfRG4FC4RZ76uGDt1
         F+KA==
X-Gm-Message-State: AOAM532ktanfLTHeg7F8CfBb9oyZ0IH6vk8Quhx30iRITC2obW5VZAjM
        96EL/VSIqY8aNG0lIoNHh3s=
X-Google-Smtp-Source: ABdhPJw/PoBs2h8FaF5hrJO0BJjsFJlxs1dcE4/YsGOMvgPNb4f6ojO+j+fXCgpIqwx6xfh974lxeQ==
X-Received: by 2002:ad4:510e:: with SMTP id g14mr13071107qvp.5.1621027517615;
        Fri, 14 May 2021 14:25:17 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w196sm5609827qkb.90.2021.05.14.14.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 14:25:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 14 May 2021 14:25:15 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     W_Armin@gmx.de
Cc:     pali@kernel.org, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH RFC] hwmon: (dell-smm-hwmon) Convert to
 devm_hwmon_device_register_with_info()
Message-ID: <20210514212515.GA1403985@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, May 14, 2021 at 07:51:51PM +0200, W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> Convert driver to devm_device_register_with_info() to drop the
> error-prone magic numbers asociated with sysfs file handling.
> Also register a platform device since
> devm_hwmon_device_register_with_info() requieres a device struct.
> 
> Tested on a Dell Latitude C600.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
> 1. Is the patch to big?

I would suggest to introduce the platform driver in the first patch
of a multi-patch series. Also, the probe function should only be called
after detection, or in other words move the detection code (the first
call to dmi_check_system() and other code resulting in -ENODEV))
into the new i8k_init() function.

I would also suggest to use devm_add_action_or_reset() in i8k_init_procfs()
to trigger the call to i8k_exit_procfs(). This way you don't need the remove
function anymore, and the dummy prototype for i8k_exit_procfs() is not
needed anymore either. it would probably be best to do that in a separate
patch after the conversion to a platform driver.

It would also be desirable to move all static variables into a driver
private data structure if that is feasible. That could be done as
separate patch as well.

> 2. Without the ability to read the fan speed, pwmconfig ignores
> the pwm files. Should i use fanX_fault in such cases?
> 3. pwm1_enable likely affects all fan channels, should i create
> a pwmX_enable file for every channel?

The conversion itself should not modify the behavior of existing
attributes. We can discuss functional changes, but those should
be done in separate patches.

Hope this helps,

Guenter

> ---
>  drivers/hwmon/dell-smm-hwmon.c | 594 ++++++++++++++++-----------------
>  1 file changed, 292 insertions(+), 302 deletions(-)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index f2221ca0aa7b..c94acef582a8 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -12,9 +12,12 @@
> 
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> 
> +#include <linux/bitmap.h>
>  #include <linux/cpu.h>
>  #include <linux/delay.h>
> +#include <linux/err.h>
>  #include <linux/module.h>
> +#include <linux/platform_device.h>
>  #include <linux/types.h>
>  #include <linux/init.h>
>  #include <linux/proc_fs.h>
> @@ -23,7 +26,6 @@
>  #include <linux/capability.h>
>  #include <linux/mutex.h>
>  #include <linux/hwmon.h>
> -#include <linux/hwmon-sysfs.h>
>  #include <linux/uaccess.h>
>  #include <linux/io.h>
>  #include <linux/sched.h>
> @@ -58,11 +60,13 @@
>  #define I8K_POWER_AC		0x05
>  #define I8K_POWER_BATTERY	0x01
> 
> +#define DELL_SMM_NO_TEMP	10
> +#define DELL_SMM_NO_FANS	3
> +
>  static DEFINE_MUTEX(i8k_mutex);
> +static DECLARE_BITMAP(i8k_hwmon_flags, DELL_SMM_NO_TEMP);
>  static char bios_version[4];
>  static char bios_machineid[16];
> -static struct device *i8k_hwmon_dev;
> -static u32 i8k_hwmon_flags;
>  static uint i8k_fan_mult = I8K_FAN_MULT;
>  static uint i8k_pwm_mult;
>  static uint i8k_fan_max = I8K_FAN_HIGH;
> @@ -70,20 +74,7 @@ static bool disallow_fan_type_call;
>  static bool disallow_fan_support;
>  static unsigned int manual_fan;
>  static unsigned int auto_fan;
> -
> -#define I8K_HWMON_HAVE_TEMP1	(1 << 0)
> -#define I8K_HWMON_HAVE_TEMP2	(1 << 1)
> -#define I8K_HWMON_HAVE_TEMP3	(1 << 2)
> -#define I8K_HWMON_HAVE_TEMP4	(1 << 3)
> -#define I8K_HWMON_HAVE_TEMP5	(1 << 4)
> -#define I8K_HWMON_HAVE_TEMP6	(1 << 5)
> -#define I8K_HWMON_HAVE_TEMP7	(1 << 6)
> -#define I8K_HWMON_HAVE_TEMP8	(1 << 7)
> -#define I8K_HWMON_HAVE_TEMP9	(1 << 8)
> -#define I8K_HWMON_HAVE_TEMP10	(1 << 9)
> -#define I8K_HWMON_HAVE_FAN1	(1 << 10)
> -#define I8K_HWMON_HAVE_FAN2	(1 << 11)
> -#define I8K_HWMON_HAVE_FAN3	(1 << 12)
> +static long auto_fan_enable = 2;
> 
>  MODULE_AUTHOR("Massimo Dal Zotto (dz@debian.org)");
>  MODULE_AUTHOR("Pali Rohár <pali@kernel.org>");
> @@ -630,11 +621,131 @@ static inline void __exit i8k_exit_procfs(void)
>   * Hwmon interface
>   */
> 
> -static ssize_t i8k_hwmon_temp_label_show(struct device *dev,
> -					 struct device_attribute *devattr,
> -					 char *buf)
> +static umode_t dell_smm_is_visible(const void *drvdata, enum hwmon_sensor_types type, u32 attr,
> +				   int channel)
> +{
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_input:
> +		case hwmon_temp_label:
> +			if (test_bit(channel, i8k_hwmon_flags))
> +				return 0444;
> +
> +			break;
> +
> +		default:
> +			break;
> +		}
> +		break;
> +	case hwmon_fan:
> +		if (disallow_fan_support)
> +			break;
> +
> +		switch (attr) {
> +		case hwmon_fan_label:
> +			if (i8k_get_fan_type(channel) >= 0)
> +				return 0444;
> +
> +			break;
> +		case hwmon_fan_input:
> +			if (i8k_get_fan_speed(channel) >= 0)
> +				return 0444;
> +
> +			break;
> +		default:
> +			break;
> +		}
> +		break;
> +	case hwmon_pwm:
> +		if (disallow_fan_support)
> +			break;
> +
> +		switch (attr) {
> +		case hwmon_pwm_input:
> +			if (i8k_get_fan_status(channel) >= 0)
> +				return 0644;
> +
> +			break;
> +		case hwmon_pwm_enable:
> +			if (auto_fan)
> +				return 0644;
> +
> +			break;
> +		default:
> +			break;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int dell_smm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr, int channel,
> +			 long *val)
>  {
> -	static const char * const labels[] = {
> +	int temp;
> +	int fan;
> +	int pwm;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_input:
> +			temp = i8k_get_temp(channel);
> +			if (temp < 0)
> +				return temp;
> +
> +			*val = temp * 1000;
> +			return 0;
> +		default:
> +			break;
> +		}
> +		break;
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_input:
> +			fan = i8k_get_fan_speed(channel);
> +			if (fan < 0)
> +				return fan;
> +
> +			*val = fan;
> +			return 0;
> +		default:
> +			break;
> +		}
> +		break;
> +	case hwmon_pwm:
> +		switch (attr) {
> +		case hwmon_pwm_input:
> +			pwm = i8k_get_fan_status(channel);
> +			if (pwm < 0)
> +				return pwm;
> +
> +			*val = clamp_val(pwm * i8k_pwm_mult, 0, 255);
> +			return 0;
> +		case hwmon_pwm_enable:
> +			if (!auto_fan)
> +				break;
> +
> +			*val = auto_fan_enable;
> +			return 0;
> +		default:
> +			break;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static const char *dell_smm_temp_label(int channel)
> +{
> +	static const char * const temp_labels[] = {
>  		"CPU",
>  		"GPU",
>  		"SODIMM",
> @@ -642,35 +753,21 @@ static ssize_t i8k_hwmon_temp_label_show(struct device *dev,
>  		"Ambient",
>  		"Other",
>  	};
> -	int index = to_sensor_dev_attr(devattr)->index;
>  	int type;
> 
> -	type = i8k_get_temp_type(index);
> +	type = i8k_get_temp_type(channel);
>  	if (type < 0)
> -		return type;
> -	if (type >= ARRAY_SIZE(labels))
> -		type = ARRAY_SIZE(labels) - 1;
> -	return sprintf(buf, "%s\n", labels[type]);
> -}
> +		return ERR_PTR(type);
> 
> -static ssize_t i8k_hwmon_temp_show(struct device *dev,
> -				   struct device_attribute *devattr,
> -				   char *buf)
> -{
> -	int index = to_sensor_dev_attr(devattr)->index;
> -	int temp;
> +	if (type >= ARRAY_SIZE(temp_labels))
> +		type = ARRAY_SIZE(temp_labels) - 1;
> 
> -	temp = i8k_get_temp(index);
> -	if (temp < 0)
> -		return temp;
> -	return sprintf(buf, "%d\n", temp * 1000);
> +	return temp_labels[type];
>  }
> 
> -static ssize_t i8k_hwmon_fan_label_show(struct device *dev,
> -					struct device_attribute *devattr,
> -					char *buf)
> +static const char *dell_smm_fan_label(int channel)
>  {
> -	static const char * const labels[] = {
> +	static const char * const fan_labels[] = {
>  		"Processor Fan",
>  		"Motherboard Fan",
>  		"Video Fan",
> @@ -678,293 +775,171 @@ static ssize_t i8k_hwmon_fan_label_show(struct device *dev,
>  		"Chipset Fan",
>  		"Other Fan",
>  	};
> -	int index = to_sensor_dev_attr(devattr)->index;
> +	static const char * const docking_labels[] = {
> +		"Docking Processor Fan",
> +		"Docking Motherboard Fan",
> +		"Docking Video Fan",
> +		"Docking Power Supply Fan",
> +		"Docking Chipset Fan",
> +		"Docking Other Fan",
> +	};
>  	bool dock = false;
>  	int type;
> 
> -	type = i8k_get_fan_type(index);
> +	type = i8k_get_fan_type(channel);
>  	if (type < 0)
> -		return type;
> +		return ERR_PTR(type);
> 
>  	if (type & 0x10) {
>  		dock = true;
>  		type &= 0x0F;
>  	}
> 
> -	if (type >= ARRAY_SIZE(labels))
> -		type = (ARRAY_SIZE(labels) - 1);
> +	if (type >= ARRAY_SIZE(fan_labels))
> +		type = ARRAY_SIZE(fan_labels) - 1;
> 
> -	return sprintf(buf, "%s%s\n", (dock ? "Docking " : ""), labels[type]);
> +	return dock ? docking_labels[type] : fan_labels[type];
>  }
> 
> -static ssize_t i8k_hwmon_fan_show(struct device *dev,
> -				  struct device_attribute *devattr, char *buf)
> +static int dell_smm_read_string(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +				int channel, const char **str)
>  {
> -	int index = to_sensor_dev_attr(devattr)->index;
> -	int fan_speed;
> -
> -	fan_speed = i8k_get_fan_speed(index);
> -	if (fan_speed < 0)
> -		return fan_speed;
> -	return sprintf(buf, "%d\n", fan_speed);
> -}
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_label:
> +			*str = dell_smm_temp_label(channel);
> +			return PTR_ERR_OR_ZERO(*str);
> +		default:
> +			break;
> +		}
> +		break;
> +	case hwmon_fan:
> +		if (disallow_fan_type_call)
> +			break;
> 
> -static ssize_t i8k_hwmon_pwm_show(struct device *dev,
> -				  struct device_attribute *devattr, char *buf)
> -{
> -	int index = to_sensor_dev_attr(devattr)->index;
> -	int status;
> +		switch (attr) {
> +		case hwmon_fan_label:
> +			*str = dell_smm_fan_label(channel);
> +			return PTR_ERR_OR_ZERO(*str);
> +		default:
> +			break;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> 
> -	status = i8k_get_fan_status(index);
> -	if (status < 0)
> -		return -EIO;
> -	return sprintf(buf, "%d\n", clamp_val(status * i8k_pwm_mult, 0, 255));
> +	return -EOPNOTSUPP;
>  }
> 
> -static ssize_t i8k_hwmon_pwm_store(struct device *dev,
> -				   struct device_attribute *attr,
> -				   const char *buf, size_t count)
> +static int dell_smm_write(struct device *dev, enum hwmon_sensor_types type, u32 attr, int channel,
> +			  long val)
>  {
> -	int index = to_sensor_dev_attr(attr)->index;
> -	unsigned long val;
> +	unsigned long pwm;
> +	bool enable;
>  	int err;
> 
> -	err = kstrtoul(buf, 10, &val);
> -	if (err)
> -		return err;
> -	val = clamp_val(DIV_ROUND_CLOSEST(val, i8k_pwm_mult), 0, i8k_fan_max);
> +	switch (type) {
> +	case hwmon_pwm:
> +		switch (attr) {
> +		case hwmon_pwm_input:
> +			pwm = clamp_val(DIV_ROUND_CLOSEST(val, i8k_pwm_mult), 0, i8k_fan_max);
> 
> -	mutex_lock(&i8k_mutex);
> -	err = i8k_set_fan(index, val);
> -	mutex_unlock(&i8k_mutex);
> +			mutex_lock(&i8k_mutex);
> +			err = i8k_set_fan(channel, pwm);
> +			mutex_unlock(&i8k_mutex);
> 
> -	return err < 0 ? -EIO : count;
> -}
> +			if (err < 0)
> +				return err;
> 
> -static ssize_t i8k_hwmon_pwm_enable_store(struct device *dev,
> -					  struct device_attribute *attr,
> -					  const char *buf, size_t count)
> -{
> -	int err;
> -	bool enable;
> -	unsigned long val;
> +			return 0;
> +		case hwmon_pwm_enable:
> +			if (!val)
> +				break;
> 
> -	if (!auto_fan)
> -		return -ENODEV;
> +			if (val == 1)
> +				enable = false;
> +			else
> +				enable = true;
> 
> -	err = kstrtoul(buf, 10, &val);
> -	if (err)
> -		return err;
> +			mutex_lock(&i8k_mutex);
> +			err = i8k_enable_fan_auto_mode(enable);
> +			mutex_unlock(&i8k_mutex);
> 
> -	if (val == 1)
> -		enable = false;
> -	else if (val == 2)
> -		enable = true;
> -	else
> -		return -EINVAL;
> +			if (err < 0)
> +				return err;
> 
> -	mutex_lock(&i8k_mutex);
> -	err = i8k_enable_fan_auto_mode(enable);
> -	mutex_unlock(&i8k_mutex);
> +			auto_fan_enable = val;
> 
> -	return err ? err : count;
> +			return 0;
> +		default:
> +			break;
> +		}
> +	default:
> +		break;
> +	}
> +
> +	return -EOPNOTSUPP;
>  }
> 
> -static SENSOR_DEVICE_ATTR_RO(temp1_input, i8k_hwmon_temp, 0);
> -static SENSOR_DEVICE_ATTR_RO(temp1_label, i8k_hwmon_temp_label, 0);
> -static SENSOR_DEVICE_ATTR_RO(temp2_input, i8k_hwmon_temp, 1);
> -static SENSOR_DEVICE_ATTR_RO(temp2_label, i8k_hwmon_temp_label, 1);
> -static SENSOR_DEVICE_ATTR_RO(temp3_input, i8k_hwmon_temp, 2);
> -static SENSOR_DEVICE_ATTR_RO(temp3_label, i8k_hwmon_temp_label, 2);
> -static SENSOR_DEVICE_ATTR_RO(temp4_input, i8k_hwmon_temp, 3);
> -static SENSOR_DEVICE_ATTR_RO(temp4_label, i8k_hwmon_temp_label, 3);
> -static SENSOR_DEVICE_ATTR_RO(temp5_input, i8k_hwmon_temp, 4);
> -static SENSOR_DEVICE_ATTR_RO(temp5_label, i8k_hwmon_temp_label, 4);
> -static SENSOR_DEVICE_ATTR_RO(temp6_input, i8k_hwmon_temp, 5);
> -static SENSOR_DEVICE_ATTR_RO(temp6_label, i8k_hwmon_temp_label, 5);
> -static SENSOR_DEVICE_ATTR_RO(temp7_input, i8k_hwmon_temp, 6);
> -static SENSOR_DEVICE_ATTR_RO(temp7_label, i8k_hwmon_temp_label, 6);
> -static SENSOR_DEVICE_ATTR_RO(temp8_input, i8k_hwmon_temp, 7);
> -static SENSOR_DEVICE_ATTR_RO(temp8_label, i8k_hwmon_temp_label, 7);
> -static SENSOR_DEVICE_ATTR_RO(temp9_input, i8k_hwmon_temp, 8);
> -static SENSOR_DEVICE_ATTR_RO(temp9_label, i8k_hwmon_temp_label, 8);
> -static SENSOR_DEVICE_ATTR_RO(temp10_input, i8k_hwmon_temp, 9);
> -static SENSOR_DEVICE_ATTR_RO(temp10_label, i8k_hwmon_temp_label, 9);
> -static SENSOR_DEVICE_ATTR_RO(fan1_input, i8k_hwmon_fan, 0);
> -static SENSOR_DEVICE_ATTR_RO(fan1_label, i8k_hwmon_fan_label, 0);
> -static SENSOR_DEVICE_ATTR_RW(pwm1, i8k_hwmon_pwm, 0);
> -static SENSOR_DEVICE_ATTR_WO(pwm1_enable, i8k_hwmon_pwm_enable, 0);
> -static SENSOR_DEVICE_ATTR_RO(fan2_input, i8k_hwmon_fan, 1);
> -static SENSOR_DEVICE_ATTR_RO(fan2_label, i8k_hwmon_fan_label, 1);
> -static SENSOR_DEVICE_ATTR_RW(pwm2, i8k_hwmon_pwm, 1);
> -static SENSOR_DEVICE_ATTR_RO(fan3_input, i8k_hwmon_fan, 2);
> -static SENSOR_DEVICE_ATTR_RO(fan3_label, i8k_hwmon_fan_label, 2);
> -static SENSOR_DEVICE_ATTR_RW(pwm3, i8k_hwmon_pwm, 2);
> -
> -static struct attribute *i8k_attrs[] = {
> -	&sensor_dev_attr_temp1_input.dev_attr.attr,	/* 0 */
> -	&sensor_dev_attr_temp1_label.dev_attr.attr,	/* 1 */
> -	&sensor_dev_attr_temp2_input.dev_attr.attr,	/* 2 */
> -	&sensor_dev_attr_temp2_label.dev_attr.attr,	/* 3 */
> -	&sensor_dev_attr_temp3_input.dev_attr.attr,	/* 4 */
> -	&sensor_dev_attr_temp3_label.dev_attr.attr,	/* 5 */
> -	&sensor_dev_attr_temp4_input.dev_attr.attr,	/* 6 */
> -	&sensor_dev_attr_temp4_label.dev_attr.attr,	/* 7 */
> -	&sensor_dev_attr_temp5_input.dev_attr.attr,	/* 8 */
> -	&sensor_dev_attr_temp5_label.dev_attr.attr,	/* 9 */
> -	&sensor_dev_attr_temp6_input.dev_attr.attr,	/* 10 */
> -	&sensor_dev_attr_temp6_label.dev_attr.attr,	/* 11 */
> -	&sensor_dev_attr_temp7_input.dev_attr.attr,	/* 12 */
> -	&sensor_dev_attr_temp7_label.dev_attr.attr,	/* 13 */
> -	&sensor_dev_attr_temp8_input.dev_attr.attr,	/* 14 */
> -	&sensor_dev_attr_temp8_label.dev_attr.attr,	/* 15 */
> -	&sensor_dev_attr_temp9_input.dev_attr.attr,	/* 16 */
> -	&sensor_dev_attr_temp9_label.dev_attr.attr,	/* 17 */
> -	&sensor_dev_attr_temp10_input.dev_attr.attr,	/* 18 */
> -	&sensor_dev_attr_temp10_label.dev_attr.attr,	/* 19 */
> -	&sensor_dev_attr_fan1_input.dev_attr.attr,	/* 20 */
> -	&sensor_dev_attr_fan1_label.dev_attr.attr,	/* 21 */
> -	&sensor_dev_attr_pwm1.dev_attr.attr,		/* 22 */
> -	&sensor_dev_attr_pwm1_enable.dev_attr.attr,	/* 23 */
> -	&sensor_dev_attr_fan2_input.dev_attr.attr,	/* 24 */
> -	&sensor_dev_attr_fan2_label.dev_attr.attr,	/* 25 */
> -	&sensor_dev_attr_pwm2.dev_attr.attr,		/* 26 */
> -	&sensor_dev_attr_fan3_input.dev_attr.attr,	/* 27 */
> -	&sensor_dev_attr_fan3_label.dev_attr.attr,	/* 28 */
> -	&sensor_dev_attr_pwm3.dev_attr.attr,		/* 29 */
> -	NULL
> +static const struct hwmon_ops dell_smm_ops = {
> +	.is_visible = dell_smm_is_visible,
> +	.read = dell_smm_read,
> +	.read_string = dell_smm_read_string,
> +	.write = dell_smm_write,
>  };
> 
> -static umode_t i8k_is_visible(struct kobject *kobj, struct attribute *attr,
> -			      int index)
> -{
> -	if (disallow_fan_support && index >= 20)
> -		return 0;
> -	if (disallow_fan_type_call &&
> -	    (index == 21 || index == 25 || index == 28))
> -		return 0;
> -	if (index >= 0 && index <= 1 &&
> -	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP1))
> -		return 0;
> -	if (index >= 2 && index <= 3 &&
> -	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP2))
> -		return 0;
> -	if (index >= 4 && index <= 5 &&
> -	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP3))
> -		return 0;
> -	if (index >= 6 && index <= 7 &&
> -	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP4))
> -		return 0;
> -	if (index >= 8 && index <= 9 &&
> -	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP5))
> -		return 0;
> -	if (index >= 10 && index <= 11 &&
> -	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP6))
> -		return 0;
> -	if (index >= 12 && index <= 13 &&
> -	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP7))
> -		return 0;
> -	if (index >= 14 && index <= 15 &&
> -	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP8))
> -		return 0;
> -	if (index >= 16 && index <= 17 &&
> -	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP9))
> -		return 0;
> -	if (index >= 18 && index <= 19 &&
> -	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP10))
> -		return 0;
> -
> -	if (index >= 20 && index <= 23 &&
> -	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN1))
> -		return 0;
> -	if (index >= 24 && index <= 26 &&
> -	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN2))
> -		return 0;
> -	if (index >= 27 && index <= 29 &&
> -	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN3))
> -		return 0;
> -
> -	if (index == 23 && !auto_fan)
> -		return 0;
> -
> -	return attr->mode;
> -}
> +static const struct hwmon_channel_info *dell_smm_info[] = {
> +	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL
> +			   ),
> +	HWMON_CHANNEL_INFO(fan,
> +			   HWMON_F_INPUT | HWMON_F_LABEL,
> +			   HWMON_F_INPUT | HWMON_F_LABEL,
> +			   HWMON_F_INPUT | HWMON_F_LABEL
> +			   ),
> +	HWMON_CHANNEL_INFO(pwm,
> +			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
> +			   HWMON_PWM_INPUT,
> +			   HWMON_PWM_INPUT
> +			   ),
> +	NULL
> +};
> 
> -static const struct attribute_group i8k_group = {
> -	.attrs = i8k_attrs,
> -	.is_visible = i8k_is_visible,
> +static const struct hwmon_chip_info dell_smm_chip_info = {
> +	.ops = &dell_smm_ops,
> +	.info = dell_smm_info,
>  };
> -__ATTRIBUTE_GROUPS(i8k);
> 
> -static int __init i8k_init_hwmon(void)
> +static int __init dell_smm_init_hwmon(struct device *dev)
>  {
> +	struct device *dell_smm_hwmon_dev;
>  	int err;
> +	int i;
> +
> +	bitmap_zero(i8k_hwmon_flags, DELL_SMM_NO_TEMP);
> 
> -	i8k_hwmon_flags = 0;
> -
> -	/* CPU temperature attributes, if temperature type is OK */
> -	err = i8k_get_temp_type(0);
> -	if (err >= 0)
> -		i8k_hwmon_flags |= I8K_HWMON_HAVE_TEMP1;
> -	/* check for additional temperature sensors */
> -	err = i8k_get_temp_type(1);
> -	if (err >= 0)
> -		i8k_hwmon_flags |= I8K_HWMON_HAVE_TEMP2;
> -	err = i8k_get_temp_type(2);
> -	if (err >= 0)
> -		i8k_hwmon_flags |= I8K_HWMON_HAVE_TEMP3;
> -	err = i8k_get_temp_type(3);
> -	if (err >= 0)
> -		i8k_hwmon_flags |= I8K_HWMON_HAVE_TEMP4;
> -	err = i8k_get_temp_type(4);
> -	if (err >= 0)
> -		i8k_hwmon_flags |= I8K_HWMON_HAVE_TEMP5;
> -	err = i8k_get_temp_type(5);
> -	if (err >= 0)
> -		i8k_hwmon_flags |= I8K_HWMON_HAVE_TEMP6;
> -	err = i8k_get_temp_type(6);
> -	if (err >= 0)
> -		i8k_hwmon_flags |= I8K_HWMON_HAVE_TEMP7;
> -	err = i8k_get_temp_type(7);
> -	if (err >= 0)
> -		i8k_hwmon_flags |= I8K_HWMON_HAVE_TEMP8;
> -	err = i8k_get_temp_type(8);
> -	if (err >= 0)
> -		i8k_hwmon_flags |= I8K_HWMON_HAVE_TEMP9;
> -	err = i8k_get_temp_type(9);
> -	if (err >= 0)
> -		i8k_hwmon_flags |= I8K_HWMON_HAVE_TEMP10;
> -
> -	/* First fan attributes, if fan status or type is OK */
> -	err = i8k_get_fan_status(0);
> -	if (err < 0)
> -		err = i8k_get_fan_type(0);
> -	if (err >= 0)
> -		i8k_hwmon_flags |= I8K_HWMON_HAVE_FAN1;
> -
> -	/* Second fan attributes, if fan status or type is OK */
> -	err = i8k_get_fan_status(1);
> -	if (err < 0)
> -		err = i8k_get_fan_type(1);
> -	if (err >= 0)
> -		i8k_hwmon_flags |= I8K_HWMON_HAVE_FAN2;
> -
> -	/* Third fan attributes, if fan status or type is OK */
> -	err = i8k_get_fan_status(2);
> -	if (err < 0)
> -		err = i8k_get_fan_type(2);
> -	if (err >= 0)
> -		i8k_hwmon_flags |= I8K_HWMON_HAVE_FAN3;
> -
> -	i8k_hwmon_dev = hwmon_device_register_with_groups(NULL, "dell_smm",
> -							  NULL, i8k_groups);
> -	if (IS_ERR(i8k_hwmon_dev)) {
> -		err = PTR_ERR(i8k_hwmon_dev);
> -		i8k_hwmon_dev = NULL;
> -		pr_err("hwmon registration failed (%d)\n", err);
> -		return err;
> +	for (i = 0; i < DELL_SMM_NO_TEMP; i++) {
> +		err =  i8k_get_temp_type(i);
> +		if (err >= 0)
> +			__set_bit(i, i8k_hwmon_flags);
>  	}
> -	return 0;
> +
> +	dell_smm_hwmon_dev = devm_hwmon_device_register_with_info(dev, "dell_smm", NULL,
> +								  &dell_smm_chip_info, NULL);
> +
> +	return PTR_ERR_OR_ZERO(dell_smm_hwmon_dev);
>  }
> 
>  struct i8k_config_data {
> @@ -1224,7 +1199,7 @@ static struct dmi_system_id i8k_whitelist_fan_control[] __initdata = {
>  /*
>   * Probe for the presence of a supported laptop.
>   */
> -static int __init i8k_probe(void)
> +static int __init dell_smm_probe(struct platform_device *pdev)
>  {
>  	const struct dmi_system_id *id, *fan_control;
>  	int fan, ret;
> @@ -1313,29 +1288,44 @@ static int __init i8k_probe(void)
>  		i8k_fan_mult = fan_mult;
>  	}
> 
> +	ret = dell_smm_init_hwmon(&pdev->dev);
> +	if (ret)
> +		return ret;
> +
> +	i8k_init_procfs();
> +
>  	return 0;
>  }
> 
> -static int __init i8k_init(void)
> +static int dell_smm_remove(struct platform_device *pdev)
>  {
> -	int err;
> +	i8k_exit_procfs();
> 
> -	/* Are we running on an supported laptop? */
> -	if (i8k_probe())
> -		return -ENODEV;
> +	return 0;
> +}
> +
> +static struct platform_driver dell_smm_driver = {
> +	.driver		= {
> +		.name	= KBUILD_MODNAME,
> +	},
> +	.remove		= dell_smm_remove,
> +};
> 
> -	err = i8k_init_hwmon();
> -	if (err)
> -		return err;
> +static struct platform_device *dell_smm_device;
> 
> -	i8k_init_procfs();
> -	return 0;
> +static int __init i8k_init(void)
> +{
> +	/* Are we running on an supported laptop? */
> +	dell_smm_device = platform_create_bundle(&dell_smm_driver, dell_smm_probe, NULL, 0, NULL,
> +						 0);
> +
> +	return PTR_ERR_OR_ZERO(dell_smm_device);
>  }
> 
>  static void __exit i8k_exit(void)
>  {
> -	hwmon_device_unregister(i8k_hwmon_dev);
> -	i8k_exit_procfs();
> +	platform_device_unregister(dell_smm_device);
> +	platform_driver_unregister(&dell_smm_driver);
>  }
> 
>  module_init(i8k_init);
> --
> 2.20.1
> 
