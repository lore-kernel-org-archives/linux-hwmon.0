Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE35BC61DA4
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Feb 2023 14:15:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231515AbjBFOPW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 6 Feb 2023 09:15:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231601AbjBFOO6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 6 Feb 2023 09:14:58 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B813D12F35
        for <linux-hwmon@vger.kernel.org>; Mon,  6 Feb 2023 06:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675692813;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2pKelIDvvu0eg8F8RVTWQ0DecSfXHRsnNSF+IfLHJfM=;
        b=XBp7t17Go/IWx7+bZb0viEEOTveOI4FWJSoKYGMPYErEMVJ4HvtT5ZB7aSUu/Jjqyj6ZXs
        j6u/2l6XRGjMgm9h4PT7m/p9YOfqN6HCBgX5d907gZiQ/USzrKc5NyuZJB4JpgAh5+jOJn
        SnyT7AbqOwj+erOddgOnT1bFfVhnp70=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-609-Rajk9oj8O3aHPhgnT_2jXQ-1; Mon, 06 Feb 2023 09:13:32 -0500
X-MC-Unique: Rajk9oj8O3aHPhgnT_2jXQ-1
Received: by mail-ed1-f71.google.com with SMTP id eo7-20020a056402530700b004aab4319cedso1442129edb.2
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Feb 2023 06:13:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2pKelIDvvu0eg8F8RVTWQ0DecSfXHRsnNSF+IfLHJfM=;
        b=xfD5XPUXb+/pAUrR9HFcqQZJ6bkbBMRuwm98C0s8G5rEerBBQqxIz0pIWYfo8dtYyq
         7FS07oRK/wAmfoX9Ut0EjqoEOsPtAZxLUxgm/ZlRR/vuGHXRoHcLTtJK96TpCrgRwhWq
         USYJvnwjDvR1RMzJHQWcj5bkHXEaI9qAPx9tNzfKXRuRplCor1rnd/mPh/AIYonImSzP
         u4hfLH4CIpyhz7lRxJfYJak8rZ+EIkCnzrFCkcERCqCeY3INpW5fZ/Bv5kO2ihyyehkN
         52Vft7zWlizpd8MEiO/OqpvVDwNctzTojc4vDOBu+Hq/VtrQpi8z2LApjX/axacSMd+b
         AmhA==
X-Gm-Message-State: AO0yUKVJu99vsiKdI1T0P/knAr9H9XeiIn25ohYo+I7jHL4EHLEvEqAs
        rKtbkj4r2e+WhKy9D+ENjhZuf/oonAfQ79jS35te2gK/iyL7JV2KSRUqF7e9tdbvNY7FZvTDph6
        5Ov5s8jsEq6zfdW4iXePnApQ=
X-Received: by 2002:a05:6402:4025:b0:4aa:bc53:be32 with SMTP id d37-20020a056402402500b004aabc53be32mr1684774eda.0.1675692811410;
        Mon, 06 Feb 2023 06:13:31 -0800 (PST)
X-Google-Smtp-Source: AK7set8s2EE+ABlmkJySK1wBLJpxUMdUcc2lEZw8Z4jyMSB9lMLKE6hSPAPcQzjNsOyIgEEQOH1xXw==
X-Received: by 2002:a05:6402:4025:b0:4aa:bc53:be32 with SMTP id d37-20020a056402402500b004aabc53be32mr1684478eda.0.1675692806345;
        Mon, 06 Feb 2023 06:13:26 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id b18-20020aa7dc12000000b004a9b5c957bfsm4598653edu.77.2023.02.06.06.13.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 06:13:25 -0800 (PST)
Message-ID: <a7d2e011-142d-88b9-2591-cf4508f1b8c5@redhat.com>
Date:   Mon, 6 Feb 2023 15:13:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] platform/x86: dell-ddv: Add hwmon support
Content-Language: en-US, nl
To:     Armin Wolf <W_Armin@gmx.de>, markgross@kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net,
        platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230205205456.2364-1-W_Armin@gmx.de>
 <20230205205456.2364-2-W_Armin@gmx.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230205205456.2364-2-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Armin,

On 2/5/23 21:54, Armin Wolf wrote:
> Thanks to bugreport 216655 on bugzilla triggered by the
> dell-smm-hwmon driver, the contents of the sensor buffers
> could be almost completely decoded.
> Add an hwmon interface for exposing the fan and thermal
> sensor values. Since the WMI interface can be quite slow
> on some machines, the sensor buffers are cached for 1 second
> to lessen the performance impact.
> The debugfs interface remains in place to aid in reverse-engineering
> of unknown sensor types and the thermal buffer.
> 
> Tested-by: Antonín Skala <skala.antonin@gmail.com>
> Tested-by: Gustavo Walbon <gustavowalbon@gmail.com>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

This looks nice and clean to me, thank you:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I'm going to wait a bit with merging this to see if Guenter
has any remarks. If there are no remarks by next Monday then
I'll merge this for the 6.3 merge window.

Regards,

Hans



> ---
>  drivers/platform/x86/dell/Kconfig        |   8 +-
>  drivers/platform/x86/dell/dell-wmi-ddv.c | 492 ++++++++++++++++++++++-
>  2 files changed, 495 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
> index d319de8f2132..bdd78076b1d7 100644
> --- a/drivers/platform/x86/dell/Kconfig
> +++ b/drivers/platform/x86/dell/Kconfig
> @@ -192,12 +192,12 @@ config DELL_WMI_DESCRIPTOR
>  config DELL_WMI_DDV
>  	tristate "Dell WMI sensors Support"
>  	default m
> -	depends on ACPI_BATTERY
>  	depends on ACPI_WMI
> +	depends on ACPI_BATTERY || HWMON
>  	help
> -	  This option adds support for WMI-based sensors like
> -	  battery temperature sensors found on some Dell notebooks.
> -	  It also supports reading of the battery ePPID.
> +	  This option adds support for WMI-based fan and thermal sensors
> +	  found on some Dell notebooks. It also supports various WMI-based battery
> +	  extras like reading of the battery temperature and ePPID.
> 
>  	  To compile this drivers as a module, choose M here: the module will
>  	  be called dell-wmi-ddv.
> diff --git a/drivers/platform/x86/dell/dell-wmi-ddv.c b/drivers/platform/x86/dell/dell-wmi-ddv.c
> index 9695bf493ea6..b7ac483eff12 100644
> --- a/drivers/platform/x86/dell/dell-wmi-ddv.c
> +++ b/drivers/platform/x86/dell/dell-wmi-ddv.c
> @@ -12,19 +12,26 @@
>  #include <linux/device.h>
>  #include <linux/dev_printk.h>
>  #include <linux/errno.h>
> +#include <linux/kconfig.h>
>  #include <linux/kernel.h>
> +#include <linux/hwmon.h>
>  #include <linux/kstrtox.h>
>  #include <linux/math.h>
> +#include <linux/math64.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/limits.h>
>  #include <linux/power_supply.h>
>  #include <linux/printk.h>
>  #include <linux/seq_file.h>
>  #include <linux/sysfs.h>
> +#include <linux/types.h>
>  #include <linux/wmi.h>
> 
>  #include <acpi/battery.h>
> 
> +#include <asm/unaligned.h>
> +
>  #define DRIVER_NAME	"dell-wmi-ddv"
> 
>  #define DELL_DDV_SUPPORTED_VERSION_MIN	2
> @@ -63,13 +70,63 @@ enum dell_ddv_method {
>  	DELL_DDV_THERMAL_SENSOR_INFORMATION	= 0x22,
>  };
> 
> +struct fan_sensor_entry {
> +	u8 type;
> +	__le16 rpm;
> +} __packed;
> +
> +struct thermal_sensor_entry {
> +	u8 type;
> +	s8 now;
> +	s8 min;
> +	s8 max;
> +	u8 unknown;
> +} __packed;
> +
> +struct combined_channel_info {
> +	struct hwmon_channel_info info;
> +	u32 config[];
> +};
> +
> +struct combined_chip_info {
> +	struct hwmon_chip_info chip;
> +	const struct hwmon_channel_info *info[];
> +};
> +
> +struct dell_wmi_ddv_sensors {
> +	struct mutex lock;	/* protect caching */
> +	unsigned long timestamp;
> +	union acpi_object *obj;
> +	u64 entries;
> +};
> +
>  struct dell_wmi_ddv_data {
>  	struct acpi_battery_hook hook;
>  	struct device_attribute temp_attr;
>  	struct device_attribute eppid_attr;
> +	struct dell_wmi_ddv_sensors fans;
> +	struct dell_wmi_ddv_sensors temps;
>  	struct wmi_device *wdev;
>  };
> 
> +static const char * const fan_labels[] = {
> +	"CPU Fan",
> +	"Chassis Motherboard Fan",
> +	"Video Fan",
> +	"Power Supply Fan",
> +	"Chipset Fan",
> +	"Memory Fan",
> +	"PCI Fan",
> +	"HDD Fan",
> +};
> +
> +static const char * const fan_dock_labels[] = {
> +	"Docking Chassis/Motherboard Fan",
> +	"Docking Video Fan",
> +	"Docking Power Supply Fan",
> +	"Docking Chipset Fan",
> +};
> +
>  static int dell_wmi_ddv_query_type(struct wmi_device *wdev, enum dell_ddv_method method, u32 arg,
>  				   union acpi_object **result, acpi_object_type type)
>  {
> @@ -171,6 +228,427 @@ static int dell_wmi_ddv_query_string(struct wmi_device *wdev, enum dell_ddv_meth
>  	return dell_wmi_ddv_query_type(wdev, method, arg, result, ACPI_TYPE_STRING);
>  }
> 
> +/*
> + * Needs to be called with lock held, except during initialization.
> + */
> +static int dell_wmi_ddv_update_sensors(struct wmi_device *wdev, enum dell_ddv_method method,
> +				       struct dell_wmi_ddv_sensors *sensors, size_t entry_size)
> +{
> +	u64 buffer_size, rem, entries;
> +	union acpi_object *obj;
> +	u8 *buffer;
> +	int ret;
> +
> +	if (sensors->obj) {
> +		if (time_before(jiffies, sensors->timestamp + HZ))
> +			return 0;
> +
> +		kfree(sensors->obj);
> +		sensors->obj = NULL;
> +	}
> +
> +	ret = dell_wmi_ddv_query_buffer(wdev, method, 0, &obj);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* buffer format sanity check */
> +	buffer_size = obj->package.elements[0].integer.value;
> +	buffer = obj->package.elements[1].buffer.pointer;
> +	entries = div64_u64_rem(buffer_size, entry_size, &rem);
> +	if (rem != 1 || buffer[buffer_size - 1] != 0xff) {
> +		ret = -ENOMSG;
> +
> +		goto err_free;
> +	}
> +
> +	if (!entries) {
> +		ret = -ENODATA;
> +
> +		goto err_free;
> +	}
> +
> +	sensors->obj = obj;
> +	sensors->entries = entries;
> +	sensors->timestamp = jiffies;
> +
> +	return 0;
> +
> +err_free:
> +	kfree(obj);
> +
> +	return ret;
> +}
> +
> +static umode_t dell_wmi_ddv_is_visible(const void *drvdata, enum hwmon_sensor_types type, u32 attr,
> +				       int channel)
> +{
> +	return 0444;
> +}
> +
> +static int dell_wmi_ddv_fan_read_channel(struct dell_wmi_ddv_data *data, u32 attr, int channel,
> +					 long *val)
> +{
> +	struct fan_sensor_entry *entry;
> +	int ret;
> +
> +	ret = dell_wmi_ddv_update_sensors(data->wdev, DELL_DDV_FAN_SENSOR_INFORMATION,
> +					  &data->fans, sizeof(*entry));
> +	if (ret < 0)
> +		return ret;
> +
> +	if (channel >= data->fans.entries)
> +		return -ENXIO;
> +
> +	entry = (struct fan_sensor_entry *)data->fans.obj->package.elements[1].buffer.pointer;
> +	switch (attr) {
> +	case hwmon_fan_input:
> +		*val = get_unaligned_le16(&entry[channel].rpm);
> +
> +		return 0;
> +	default:
> +		break;
> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static int dell_wmi_ddv_temp_read_channel(struct dell_wmi_ddv_data *data, u32 attr, int channel,
> +					  long *val)
> +{
> +	struct thermal_sensor_entry *entry;
> +	int ret;
> +
> +	ret = dell_wmi_ddv_update_sensors(data->wdev, DELL_DDV_THERMAL_SENSOR_INFORMATION,
> +					  &data->temps, sizeof(*entry));
> +	if (ret < 0)
> +		return ret;
> +
> +	if (channel >= data->temps.entries)
> +		return -ENXIO;
> +
> +	entry = (struct thermal_sensor_entry *)data->temps.obj->package.elements[1].buffer.pointer;
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		*val = entry[channel].now * 1000;
> +
> +		return 0;
> +	case hwmon_temp_min:
> +		*val = entry[channel].min * 1000;
> +
> +		return 0;
> +	case hwmon_temp_max:
> +		*val = entry[channel].max * 1000;
> +
> +		return 0;
> +	default:
> +		break;
> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static int dell_wmi_ddv_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +			     int channel, long *val)
> +{
> +	struct dell_wmi_ddv_data *data = dev_get_drvdata(dev);
> +	int ret;
> +
> +	switch (type) {
> +	case hwmon_fan:
> +		mutex_lock(&data->fans.lock);
> +		ret = dell_wmi_ddv_fan_read_channel(data, attr, channel, val);
> +		mutex_unlock(&data->fans.lock);
> +
> +		return ret;
> +	case hwmon_temp:
> +		mutex_lock(&data->temps.lock);
> +		ret = dell_wmi_ddv_temp_read_channel(data, attr, channel, val);
> +		mutex_unlock(&data->temps.lock);
> +
> +		return ret;
> +	default:
> +		break;
> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static int dell_wmi_ddv_fan_read_string(struct dell_wmi_ddv_data *data, int channel,
> +					const char **str)
> +{
> +	struct fan_sensor_entry *entry;
> +	int ret;
> +	u8 type;
> +
> +	ret = dell_wmi_ddv_update_sensors(data->wdev, DELL_DDV_FAN_SENSOR_INFORMATION,
> +					  &data->fans, sizeof(*entry));
> +	if (ret < 0)
> +		return ret;
> +
> +	if (channel >= data->fans.entries)
> +		return -ENXIO;
> +
> +	entry = (struct fan_sensor_entry *)data->fans.obj->package.elements[1].buffer.pointer;
> +	type = entry[channel].type;
> +	switch (type) {
> +	case 0x00 ... 0x07:
> +		*str = fan_labels[type];
> +
> +		break;
> +	case 0x11 ... 0x14:
> +		*str = fan_dock_labels[type - 0x11];
> +
> +		break;
> +	default:
> +		*str = "Unknown Fan";
> +
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int dell_wmi_ddv_temp_read_string(struct dell_wmi_ddv_data *data, int channel,
> +					 const char **str)
> +{
> +	struct thermal_sensor_entry *entry;
> +	int ret;
> +
> +	ret = dell_wmi_ddv_update_sensors(data->wdev, DELL_DDV_THERMAL_SENSOR_INFORMATION,
> +					  &data->temps, sizeof(*entry));
> +	if (ret < 0)
> +		return ret;
> +
> +	if (channel >= data->temps.entries)
> +		return -ENXIO;
> +
> +	entry = (struct thermal_sensor_entry *)data->temps.obj->package.elements[1].buffer.pointer;
> +	switch (entry[channel].type) {
> +	case 0x00:
> +		*str = "CPU";
> +
> +		break;
> +	case 0x11:
> +		*str = "Video";
> +
> +		break;
> +	case 0x22:
> +		*str = "Memory"; /* sometimes called DIMM */
> +
> +		break;
> +	case 0x33:
> +		*str = "Other";
> +
> +		break;
> +	case 0x44:
> +		*str = "Ambient"; /* sometimes called SKIN */
> +
> +		break;
> +	case 0x52:
> +		*str = "SODIMM";
> +
> +		break;
> +	case 0x55:
> +		*str = "HDD";
> +
> +		break;
> +	case 0x62:
> +		*str = "SODIMM 2";
> +
> +		break;
> +	case 0x73:
> +		*str = "NB";
> +
> +		break;
> +	case 0x83:
> +		*str = "Charger";
> +
> +		break;
> +	case 0xbb:
> +		*str = "Memory 3";
> +
> +		break;
> +	default:
> +		*str = "Unknown";
> +
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int dell_wmi_ddv_read_string(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +				    int channel, const char **str)
> +{
> +	struct dell_wmi_ddv_data *data = dev_get_drvdata(dev);
> +	int ret;
> +
> +	switch (type) {
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_label:
> +			mutex_lock(&data->fans.lock);
> +			ret = dell_wmi_ddv_fan_read_string(data, channel, str);
> +			mutex_unlock(&data->fans.lock);
> +
> +			return ret;
> +		default:
> +			break;
> +		}
> +		break;
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_label:
> +			mutex_lock(&data->temps.lock);
> +			ret = dell_wmi_ddv_temp_read_string(data, channel, str);
> +			mutex_unlock(&data->temps.lock);
> +
> +			return ret;
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
> +static const struct hwmon_ops dell_wmi_ddv_ops = {
> +	.is_visible = dell_wmi_ddv_is_visible,
> +	.read = dell_wmi_ddv_read,
> +	.read_string = dell_wmi_ddv_read_string,
> +};
> +
> +static struct hwmon_channel_info *dell_wmi_ddv_channel_create(struct device *dev, u64 count,
> +							      enum hwmon_sensor_types type,
> +							      u32 config)
> +{
> +	struct combined_channel_info *cinfo;
> +	int i;
> +
> +	cinfo = devm_kzalloc(dev, struct_size(cinfo, config, count + 1), GFP_KERNEL);
> +	if (!cinfo)
> +		return ERR_PTR(-ENOMEM);
> +
> +	cinfo->info.type = type;
> +	cinfo->info.config = cinfo->config;
> +
> +	for (i = 0; i < count; i++)
> +		cinfo->config[i] = config;
> +
> +	return &cinfo->info;
> +}
> +
> +static void dell_wmi_ddv_hwmon_cache_destroy(void *data)
> +{
> +	struct dell_wmi_ddv_sensors *sensors = data;
> +
> +	mutex_destroy(&sensors->lock);
> +	kfree(sensors->obj);
> +}
> +
> +static struct hwmon_channel_info *dell_wmi_ddv_channel_init(struct wmi_device *wdev,
> +							    enum dell_ddv_method method,
> +							    struct dell_wmi_ddv_sensors *sensors,
> +							    size_t entry_size,
> +							    enum hwmon_sensor_types type,
> +							    u32 config)
> +{
> +	struct hwmon_channel_info *info;
> +	int ret;
> +
> +	ret = dell_wmi_ddv_update_sensors(wdev, method, sensors, entry_size);
> +	if (ret < 0)
> +		return ERR_PTR(ret);
> +
> +	mutex_init(&sensors->lock);
> +
> +	ret = devm_add_action_or_reset(&wdev->dev, dell_wmi_ddv_hwmon_cache_destroy, sensors);
> +	if (ret < 0)
> +		return ERR_PTR(ret);
> +
> +	info = dell_wmi_ddv_channel_create(&wdev->dev, sensors->entries, type, config);
> +	if (IS_ERR(info))
> +		devm_release_action(&wdev->dev, dell_wmi_ddv_hwmon_cache_destroy, sensors);
> +
> +	return info;
> +}
> +
> +static int dell_wmi_ddv_hwmon_add(struct dell_wmi_ddv_data *data)
> +{
> +	struct wmi_device *wdev = data->wdev;
> +	struct combined_chip_info *cinfo;
> +	struct hwmon_channel_info *info;
> +	struct device *hdev;
> +	int index = 0;
> +	int ret;
> +
> +	if (!devres_open_group(&wdev->dev, dell_wmi_ddv_hwmon_add, GFP_KERNEL))
> +		return -ENOMEM;
> +
> +	cinfo = devm_kzalloc(&wdev->dev, struct_size(cinfo, info, 4), GFP_KERNEL);
> +	if (!cinfo) {
> +		ret = -ENOMEM;
> +
> +		goto err_release;
> +	}
> +
> +	cinfo->chip.ops = &dell_wmi_ddv_ops;
> +	cinfo->chip.info = cinfo->info;
> +
> +	info = dell_wmi_ddv_channel_create(&wdev->dev, 1, hwmon_chip, HWMON_C_REGISTER_TZ);
> +	if (IS_ERR(info)) {
> +		ret = PTR_ERR(info);
> +
> +		goto err_release;
> +	}
> +
> +	cinfo->info[index] = info;
> +	index++;
> +
> +	info = dell_wmi_ddv_channel_init(wdev, DELL_DDV_FAN_SENSOR_INFORMATION, &data->fans,
> +					 sizeof(struct fan_sensor_entry), hwmon_fan,
> +					 (HWMON_F_INPUT | HWMON_F_LABEL));
> +	if (!IS_ERR(info)) {
> +		cinfo->info[index] = info;
> +		index++;
> +	}
> +
> +	info = dell_wmi_ddv_channel_init(wdev, DELL_DDV_THERMAL_SENSOR_INFORMATION, &data->temps,
> +					 sizeof(struct thermal_sensor_entry), hwmon_temp,
> +					 (HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
> +					 HWMON_T_LABEL));
> +	if (!IS_ERR(info)) {
> +		cinfo->info[index] = info;
> +		index++;
> +	}
> +
> +	if (index < 2) {
> +		ret = -ENODEV;
> +
> +		goto err_release;
> +	}
> +
> +	hdev = devm_hwmon_device_register_with_info(&wdev->dev, "dell_ddv", data, &cinfo->chip,
> +						    NULL);
> +	if (IS_ERR(hdev)) {
> +		ret = PTR_ERR(hdev);
> +
> +		goto err_release;
> +	}
> +
> +	devres_close_group(&wdev->dev, dell_wmi_ddv_hwmon_add);
> +
> +	return 0;
> +
> +err_release:
> +	devres_release_group(&wdev->dev, dell_wmi_ddv_hwmon_add);
> +
> +	return ret;
> +}
> +
>  static int dell_wmi_ddv_battery_index(struct acpi_device *acpi_dev, u32 *index)
>  {
>  	const char *uid_str;
> @@ -370,7 +848,19 @@ static int dell_wmi_ddv_probe(struct wmi_device *wdev, const void *context)
> 
>  	dell_wmi_ddv_debugfs_init(wdev);
> 
> -	return dell_wmi_ddv_battery_add(data);
> +	if (IS_REACHABLE(CONFIG_ACPI_BATTERY)) {
> +		ret = dell_wmi_ddv_battery_add(data);
> +		if (ret < 0 && ret != -ENODEV)
> +			dev_warn(&wdev->dev, "Unable to register ACPI battery hook: %d\n", ret);
> +	}
> +
> +	if (IS_REACHABLE(CONFIG_HWMON)) {
> +		ret = dell_wmi_ddv_hwmon_add(data);
> +		if (ret < 0 && ret != -ENODEV)
> +			dev_warn(&wdev->dev, "Unable to register hwmon interface: %d\n", ret);
> +	}
> +
> +	return 0;
>  }
> 
>  static const struct wmi_device_id dell_wmi_ddv_id_table[] = {
> --
> 2.30.2
> 

