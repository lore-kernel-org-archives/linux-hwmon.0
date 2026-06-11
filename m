Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C4F3CAE7F;
	Thu, 11 Jun 2026 13:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781185207; cv=none; b=enArTeCv29HGuFa6y+EdkLUQhEU4CApwnwSEO3iLWDjSbioHre9oTEq5ELkuvqAI+k96946yertyApYPYLEDSug2aeGIwVlKlgQTW5QFbHCAiGtT1hHZ6inhLEDru6hOd6iIBISZdyUF9YGALSKaZ5ygcFGi9dFEa08NRpRgabA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781185207; c=relaxed/simple;
	bh=EDfZjUwLPtHk9Da/3k5nYUO3YVcfcP5vkTLxj+jtvXY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=T5mOP2Bvc8ajILnJf7JSjDurlZgQ+oSmLKn0BkBgO1kluzbx+mttaSzzKox5UJjZASnPFXW/xyTf8fckVLRknHFI5YCLLDMd0JuW07DmF11j8hYxFBESZV0NGr1f5YpuVopItd/HMS0BqI2an4+jwMWzVa7a+AnSyqN8WCVlXJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eg/ElI+h; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eg/ElI+h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781185205; x=1812721205;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=EDfZjUwLPtHk9Da/3k5nYUO3YVcfcP5vkTLxj+jtvXY=;
  b=eg/ElI+hkB1YiawwA6GGV76M/fsRAyNe2iMOVRkMHCCP+1hCkmb97UGo
   3OkNc/ijQEPlC8mZD3pffPLpXiX/vg+Cb4kCuVKR9Q9drPpy0L4NUfXEW
   4bVUarC0SU3XYAWZ3KNvIeE2Gi0sMBAdY9DeV+nFy2q/3kgQhtAXpbmfK
   /EpwZS8O3bZNJa+2glagNU0BzIBw6erNBxueGtghrNhBY3T5XmQyY02Bt
   s++3skgmxtPHMpss6p6ZoP88uLRVK2vS7MmNyXWJoOEITf7ryBv4q3j1w
   x0etEnW+ZsoSHVeDb7CNKxG+xyW9LItmq9Z87wmOBOhN2lYlQ+8zRU5LC
   w==;
X-CSE-ConnectionGUID: 3ChDG76OTI624ilJl0sxyA==
X-CSE-MsgGUID: MyprM9cyQR6/8ro2N7XRyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82003504"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="82003504"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 06:40:04 -0700
X-CSE-ConnectionGUID: rTH5eBMWSv6lafjMxun2yA==
X-CSE-MsgGUID: z3ZfaMEnQdmhMa2iqT7dWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="251569494"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.157])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 06:39:59 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 11 Jun 2026 16:39:55 +0300 (EEST)
To: Armin Wolf <W_Armin@gmx.de>
cc: Dell.Client.Kernel@dell.com, pali@kernel.org, mjg59@srcf.ucam.org, 
    soyer@irl.hu, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux@roeck-us.net, linux-hwmon@vger.kernel.org, mario.limonciello@amd.com
Subject: Re: [PATCH v6 5/9] platform/x86: dell-ddv: Use new buffer-based WMI
 API
In-Reply-To: <20260610203453.816254-6-W_Armin@gmx.de>
Message-ID: <a283a0a2-f897-ae2e-7588-819583edc1d3@linux.intel.com>
References: <20260610203453.816254-1-W_Armin@gmx.de> <20260610203453.816254-6-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 10 Jun 2026, Armin Wolf wrote:

> Use the new buffer-based WMI API to also support ACPI firmware
> implementations that do not use ACPI intergers/strings/packages
> for exchanging data.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/platform/x86/dell/dell-wmi-ddv.c | 179 +++++++++++------------
>  1 file changed, 85 insertions(+), 94 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-wmi-ddv.c b/drivers/platform/x86/dell/dell-wmi-ddv.c
> index 62e3d060f038..736d9b1fdcfb 100644
> --- a/drivers/platform/x86/dell/dell-wmi-ddv.c
> +++ b/drivers/platform/x86/dell/dell-wmi-ddv.c
> @@ -7,8 +7,9 @@
>  
>  #define pr_format(fmt) KBUILD_MODNAME ": " fmt
>  
> -#include <linux/acpi.h>
>  #include <linux/bitfield.h>
> +#include <linux/cleanup.h>
> +#include <linux/compiler_attributes.h>
>  #include <linux/debugfs.h>
>  #include <linux/device.h>
>  #include <linux/device/driver.h>
> @@ -99,6 +100,11 @@ enum dell_ddv_method {
>  	DELL_DDV_THERMAL_SENSOR_INFORMATION	= 0x22,
>  };
>  
> +struct dell_wmi_buffer {
> +	__le32 raw_size;
> +	u8 raw_data[];
> +} __packed;
> +
>  struct fan_sensor_entry {
>  	u8 type;
>  	__le16 rpm;
> @@ -126,7 +132,7 @@ struct dell_wmi_ddv_sensors {
>  	bool active;
>  	struct mutex lock;	/* protect caching */
>  	unsigned long timestamp;
> -	union acpi_object *obj;
> +	struct dell_wmi_buffer *buffer;
>  	u64 entries;
>  };
>  
> @@ -158,105 +164,96 @@ static const char * const fan_dock_labels[] = {
>  	"Docking Chipset Fan",
>  };
>  
> -static int dell_wmi_ddv_query_type(struct wmi_device *wdev, enum dell_ddv_method method, u32 arg,
> -				   union acpi_object **result, acpi_object_type type)
> +static int dell_wmi_ddv_query(struct wmi_device *wdev, enum dell_ddv_method method, u32 arg,
> +			      struct wmi_buffer *output, size_t min_size)
>  {
> -	struct acpi_buffer out = { ACPI_ALLOCATE_BUFFER, NULL };
> -	const struct acpi_buffer in = {
> -		.length = sizeof(arg),
> -		.pointer = &arg,
> +	__le32 arg2 = cpu_to_le32(arg);
> +	const struct wmi_buffer input = {
> +		.length = sizeof(arg2),
> +		.data = &arg2,
>  	};
> -	union acpi_object *obj;
> -	acpi_status ret;
> -
> -	ret = wmidev_evaluate_method(wdev, 0x0, method, &in, &out);
> -	if (ACPI_FAILURE(ret))
> -		return -EIO;
> -
> -	obj = out.pointer;
> -	if (!obj)
> -		return -ENODATA;
> -
> -	if (obj->type != type) {
> -		kfree(obj);
> -		return -ENOMSG;
> -	}
> -
> -	*result = obj;
>  
> -	return 0;
> +	return wmidev_invoke_method(wdev, 0x0, method, &input, output, min_size);
>  }
>  
>  static int dell_wmi_ddv_query_integer(struct wmi_device *wdev, enum dell_ddv_method method,
>  				      u32 arg, u32 *res)
>  {
> -	union acpi_object *obj;
> +	struct wmi_buffer output;
>  	int ret;
>  
> -	ret = dell_wmi_ddv_query_type(wdev, method, arg, &obj, ACPI_TYPE_INTEGER);
> +	ret = dell_wmi_ddv_query(wdev, method, arg, &output, sizeof(__le32));
>  	if (ret < 0)
>  		return ret;
>  
> -	if (obj->integer.value <= U32_MAX)
> -		*res = (u32)obj->integer.value;
> -	else
> -		ret = -ERANGE;
> +	__le32 *argr __free(kfree) = output.data;
>  
> -	kfree(obj);
> +	*res = le32_to_cpu(*argr);
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static int dell_wmi_ddv_query_buffer(struct wmi_device *wdev, enum dell_ddv_method method,
> -				     u32 arg, union acpi_object **result)
> +				     u32 arg, struct dell_wmi_buffer **result)
>  {
> -	union acpi_object *obj;
> -	u64 buffer_size;
> +	struct dell_wmi_buffer *buffer;
> +	struct wmi_buffer output;
> +	size_t buffer_size;
>  	int ret;
>  
> -	ret = dell_wmi_ddv_query_type(wdev, method, arg, &obj, ACPI_TYPE_PACKAGE);
> +	ret = dell_wmi_ddv_query(wdev, method, arg, &output, sizeof(*buffer));
>  	if (ret < 0)
>  		return ret;
>  
> -	if (obj->package.count != 2 ||
> -	    obj->package.elements[0].type != ACPI_TYPE_INTEGER ||
> -	    obj->package.elements[1].type != ACPI_TYPE_BUFFER) {
> -		ret = -ENOMSG;
> -
> -		goto err_free;
> -	}
> -
> -	buffer_size = obj->package.elements[0].integer.value;
> -
> -	if (!buffer_size) {
> +	buffer = output.data;
> +	if (!le32_to_cpu(buffer->raw_size)) {
>  		ret = -ENODATA;
>  
>  		goto err_free;
>  	}
>  
> -	if (buffer_size > obj->package.elements[1].buffer.length) {
> +	buffer_size = struct_size(buffer, raw_data, le32_to_cpu(buffer->raw_size));
> +	if (buffer_size > output.length) {
>  		dev_warn(&wdev->dev,
> -			 FW_WARN "WMI buffer size (%llu) exceeds ACPI buffer size (%d)\n",
> -			 buffer_size, obj->package.elements[1].buffer.length);
> +			 FW_WARN "Dell WMI buffer size (%zu) exceeds WMI buffer size (%zu)\n",
> +			 buffer_size, output.length);
>  		ret = -EMSGSIZE;
>  
>  		goto err_free;
>  	}
>  
> -	*result = obj;
> +	*result = buffer;

This could use __free() and no_free_ptr() to simplify the code flow.

>  
>  	return 0;
>  
>  err_free:
> -	kfree(obj);
> +	kfree(output.data);
>  
>  	return ret;
>  }
>  
> -static int dell_wmi_ddv_query_string(struct wmi_device *wdev, enum dell_ddv_method method,
> -				     u32 arg, union acpi_object **result)
> +static ssize_t dell_wmi_ddv_query_string(struct wmi_device *wdev, enum dell_ddv_method method,
> +					 u32 arg, char *buf, size_t length)
>  {
> -	return dell_wmi_ddv_query_type(wdev, method, arg, result, ACPI_TYPE_STRING);
> +	struct wmi_buffer output;
> +	size_t str_size;
> +	int ret;
> +
> +	ret = dell_wmi_ddv_query(wdev, method, arg, &output, sizeof(struct wmi_string));
> +	if (ret < 0)
> +		return ret;
> +
> +	struct wmi_string *str __free(kfree) = output.data;
> +
> +	str_size = sizeof(*str) + le16_to_cpu(str->length);
> +	if (str_size > output.length) {
> +		dev_warn(&wdev->dev,
> +			 FW_WARN "WMI string size (%zu) exceeds WMI buffer size (%zu)\n",
> +			 str_size, output.length);
> +		return -EMSGSIZE;
> +	}
> +
> +	return wmi_string_to_utf8s(str, buf, length);
>  }
>  
>  /*
> @@ -265,28 +262,26 @@ static int dell_wmi_ddv_query_string(struct wmi_device *wdev, enum dell_ddv_meth
>  static int dell_wmi_ddv_update_sensors(struct wmi_device *wdev, enum dell_ddv_method method,
>  				       struct dell_wmi_ddv_sensors *sensors, size_t entry_size)
>  {
> +	struct dell_wmi_buffer *buffer;
>  	u64 buffer_size, rem, entries;
> -	union acpi_object *obj;
> -	u8 *buffer;
>  	int ret;
>  
> -	if (sensors->obj) {
> +	if (sensors->buffer) {
>  		if (time_before(jiffies, sensors->timestamp + HZ))
>  			return 0;
>  
> -		kfree(sensors->obj);
> -		sensors->obj = NULL;
> +		kfree(sensors->buffer);
> +		sensors->buffer = NULL;
>  	}
>  
> -	ret = dell_wmi_ddv_query_buffer(wdev, method, 0, &obj);
> +	ret = dell_wmi_ddv_query_buffer(wdev, method, 0, &buffer);
>  	if (ret < 0)
>  		return ret;
>  
>  	/* buffer format sanity check */
> -	buffer_size = obj->package.elements[0].integer.value;
> -	buffer = obj->package.elements[1].buffer.pointer;
> +	buffer_size = le32_to_cpu(buffer->raw_size);
>  	entries = div64_u64_rem(buffer_size, entry_size, &rem);
> -	if (rem != 1 || buffer[buffer_size - 1] != 0xff) {
> +	if (rem != 1 || buffer->raw_data[buffer_size - 1] != 0xff) {
>  		ret = -ENOMSG;
>  		goto err_free;
>  	}
> @@ -296,14 +291,14 @@ static int dell_wmi_ddv_update_sensors(struct wmi_device *wdev, enum dell_ddv_me
>  		goto err_free;
>  	}
>  
> -	sensors->obj = obj;
> +	sensors->buffer = buffer;
>  	sensors->entries = entries;
>  	sensors->timestamp = jiffies;
>  
>  	return 0;
>  
>  err_free:
> -	kfree(obj);
> +	kfree(buffer);
>  
>  	return ret;
>  }
> @@ -328,7 +323,7 @@ static int dell_wmi_ddv_fan_read_channel(struct dell_wmi_ddv_data *data, u32 att
>  	if (channel >= data->fans.entries)
>  		return -ENXIO;
>  
> -	entry = (struct fan_sensor_entry *)data->fans.obj->package.elements[1].buffer.pointer;
> +	entry = (struct fan_sensor_entry *)data->fans.buffer->raw_data;
>  	switch (attr) {
>  	case hwmon_fan_input:
>  		*val = get_unaligned_le16(&entry[channel].rpm);
> @@ -354,7 +349,7 @@ static int dell_wmi_ddv_temp_read_channel(struct dell_wmi_ddv_data *data, u32 at
>  	if (channel >= data->temps.entries)
>  		return -ENXIO;
>  
> -	entry = (struct thermal_sensor_entry *)data->temps.obj->package.elements[1].buffer.pointer;
> +	entry = (struct thermal_sensor_entry *)data->temps.buffer->raw_data;
>  	switch (attr) {
>  	case hwmon_temp_input:
>  		*val = entry[channel].now * 1000;
> @@ -411,7 +406,7 @@ static int dell_wmi_ddv_fan_read_string(struct dell_wmi_ddv_data *data, int chan
>  	if (channel >= data->fans.entries)
>  		return -ENXIO;
>  
> -	entry = (struct fan_sensor_entry *)data->fans.obj->package.elements[1].buffer.pointer;
> +	entry = (struct fan_sensor_entry *)data->fans.buffer->raw_data;
>  	type = entry[channel].type;
>  	switch (type) {
>  	case 0x00 ... 0x07:
> @@ -442,7 +437,7 @@ static int dell_wmi_ddv_temp_read_string(struct dell_wmi_ddv_data *data, int cha
>  	if (channel >= data->temps.entries)
>  		return -ENXIO;
>  
> -	entry = (struct thermal_sensor_entry *)data->temps.obj->package.elements[1].buffer.pointer;
> +	entry = (struct thermal_sensor_entry *)data->temps.buffer->raw_data;
>  	switch (entry[channel].type) {
>  	case 0x00:
>  		*str = "CPU";
> @@ -553,8 +548,8 @@ static void dell_wmi_ddv_hwmon_cache_invalidate(struct dell_wmi_ddv_sensors *sen
>  		return;
>  
>  	mutex_lock(&sensors->lock);
> -	kfree(sensors->obj);
> -	sensors->obj = NULL;
> +	kfree(sensors->buffer);
> +	sensors->buffer = NULL;
>  	mutex_unlock(&sensors->lock);
>  }
>  
> @@ -564,7 +559,7 @@ static void dell_wmi_ddv_hwmon_cache_destroy(void *data)
>  
>  	sensors->active = false;
>  	mutex_destroy(&sensors->lock);
> -	kfree(sensors->obj);
> +	kfree(sensors->buffer);
>  }
>  
>  static struct hwmon_channel_info *dell_wmi_ddv_channel_init(struct wmi_device *wdev,
> @@ -750,7 +745,7 @@ static void dell_wmi_battery_invalidate(struct dell_wmi_ddv_data *data,
>  static ssize_t eppid_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
>  	struct dell_wmi_ddv_data *data = container_of(attr, struct dell_wmi_ddv_data, eppid_attr);
> -	union acpi_object *obj;
> +	ssize_t count;
>  	u32 index;
>  	int ret;
>  
> @@ -758,19 +753,19 @@ static ssize_t eppid_show(struct device *dev, struct device_attribute *attr, cha
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = dell_wmi_ddv_query_string(data->wdev, DELL_DDV_BATTERY_EPPID, index, &obj);
> -	if (ret < 0)
> -		return ret;
> -
> -	if (obj->string.length != DELL_EPPID_LENGTH && obj->string.length != DELL_EPPID_EXT_LENGTH)
> -		dev_info_once(&data->wdev->dev, FW_INFO "Suspicious ePPID length (%d)\n",
> -			      obj->string.length);
> +	count = dell_wmi_ddv_query_string(data->wdev, DELL_DDV_BATTERY_EPPID, index, buf,
> +					  PAGE_SIZE);
> +	if (count < 0)
> +		return count;
>  
> -	ret = sysfs_emit(buf, "%s\n", obj->string.pointer);
> +	if (count != DELL_EPPID_LENGTH && count != DELL_EPPID_EXT_LENGTH)
> +		dev_info_once(&data->wdev->dev, FW_INFO "Suspicious ePPID length (%zd)\n", count);
>  
> -	kfree(obj);
> +	ret = sysfs_emit_at(buf, count, "\n");

What's going on with this change? I see it printing nothing but a newline 
character anymore?

--
 i.

> +	if (ret < 0)
> +		return ret;
>  
> -	return ret;
> +	return count + ret;
>  }
>  
>  static int dell_wmi_ddv_get_health(struct dell_wmi_ddv_data *data, u32 index,
> @@ -994,19 +989,15 @@ static int dell_wmi_ddv_buffer_read(struct seq_file *seq, enum dell_ddv_method m
>  {
>  	struct device *dev = seq->private;
>  	struct dell_wmi_ddv_data *data = dev_get_drvdata(dev);
> -	union acpi_object *obj;
> -	u64 size;
> -	u8 *buf;
> +	struct dell_wmi_buffer *buffer;
>  	int ret;
>  
> -	ret = dell_wmi_ddv_query_buffer(data->wdev, method, 0, &obj);
> +	ret = dell_wmi_ddv_query_buffer(data->wdev, method, 0, &buffer);
>  	if (ret < 0)
>  		return ret;
>  
> -	size = obj->package.elements[0].integer.value;
> -	buf = obj->package.elements[1].buffer.pointer;
> -	ret = seq_write(seq, buf, size);
> -	kfree(obj);
> +	ret = seq_write(seq, buffer->raw_data, le32_to_cpu(buffer->raw_size));
> +	kfree(buffer);
>  
>  	return ret;
>  }
> 
