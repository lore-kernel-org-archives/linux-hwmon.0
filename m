Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971E137A485;
	Tue,  9 Jun 2026 11:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781003827; cv=none; b=GKvoszZ36FixN3Sr4tWkCBa7LYo70+PPvjbUKYplCVoILEttiC/1dwiDHmiJPBnQ8lEj6ANv8YelLbtZvrJwAfnE891Sx9kDZaO4f3vUG+crnXUIHphlZZBzZfltnBhWCcDEeWS6S34wrNbw0Evb1wE9jphjvA9XgnotYhPrWBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781003827; c=relaxed/simple;
	bh=5GSSbb18+iB4i3b56S1MM8UIPAGDM8KOFiQUqVboJZA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JWvlPR7CYZkfk3BmYnqOrVaER0iLE2+EqfPLw/QhGhw5U7XTYHyBN/YB/KMbQ+/JRard31hzYjBx8XGd8Z/0wEDN92xWhzdYWeF35dK8D2JQErMxpEb2IzCbAl00po8iADTabxVbpUqlUyXbHFN1Ezr+jo1T4ye/e1pq62WE+PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mvCqGyi+; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mvCqGyi+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781003825; x=1812539825;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=5GSSbb18+iB4i3b56S1MM8UIPAGDM8KOFiQUqVboJZA=;
  b=mvCqGyi+iepnEQNSPsqdS2kxei+9jV3gIY4kzKgR/7w9EVcvNaScaiHv
   PVMzHdWekixDsr6iislUfwbGWPR75EuV4/PvyUaQRCU5w36OqC4XlbtrT
   cwy8iiVenPvPuIpCBu9WHP+Sy5pUjc8Dmm1rHGpMAL3VojsI/tbxull4d
   6paV6FbSMb1BM8QSw6i/6N3t4bqkoFHYilINUo0BplaEfjneMhsnM70AW
   oJR5YGtbvJLiKnGuoQ4hwJGvhjm8m3XPmR6+nBxpQWMLyUgVN0d/B9zMz
   Jinp0Kg38K/omYU0tTfVlx/UKLED5hyvRaUHgZiOUzfvJ+3w/g83sWqe+
   w==;
X-CSE-ConnectionGUID: w46RjAhsTO+qL1Ca+Ex3Pg==
X-CSE-MsgGUID: 7V4q7QyXQ/ehYoqi5XPfDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81766691"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="81766691"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 04:17:05 -0700
X-CSE-ConnectionGUID: UkHP7n64SVi3MsdeY4N8dw==
X-CSE-MsgGUID: QJdCP2LqT0eB6Aan8L8UbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="276024396"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.81])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 04:17:02 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 9 Jun 2026 14:16:58 +0300 (EEST)
To: Armin Wolf <W_Armin@gmx.de>
cc: Dell.Client.Kernel@dell.com, pali@kernel.org, mjg59@srcf.ucam.org, 
    soyer@irl.hu, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux@roeck-us.net, linux-hwmon@vger.kernel.org, mario.limonciello@amd.com
Subject: Re: [PATCH v5 4/9] platform/x86: dell-wmi-base: Use new buffer-based
 WMI API
In-Reply-To: <20260605205937.530897-5-W_Armin@gmx.de>
Message-ID: <a669374c-2c00-f7f2-2dda-321e58024a31@linux.intel.com>
References: <20260605205937.530897-1-W_Armin@gmx.de> <20260605205937.530897-5-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Jun 2026, Armin Wolf wrote:

> Use the new buffer-based WMI API to also support ACPI firmware
> implementations that do not use ACPI buffers for the event data.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/platform/x86/dell/dell-wmi-base.c | 70 ++++++++++++-----------
>  1 file changed, 36 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-wmi-base.c b/drivers/platform/x86/dell/dell-wmi-base.c
> index 2a5804efd3ea..1070df065807 100644
> --- a/drivers/platform/x86/dell/dell-wmi-base.c
> +++ b/drivers/platform/x86/dell/dell-wmi-base.c
> @@ -13,6 +13,7 @@
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
> +#include <linux/compiler_attributes.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/init.h>
> @@ -414,7 +415,8 @@ static void dell_wmi_switch_event(struct input_dev **subdev,
>  	input_sync(*subdev);
>  }
>  
> -static int dell_wmi_process_key(struct wmi_device *wdev, int type, int code, u16 *buffer, int remaining)
> +static int dell_wmi_process_key(struct wmi_device *wdev, int type, int code, __le16 *buffer,
> +				int remaining)
>  {
>  	struct dell_wmi_priv *priv = dev_get_drvdata(&wdev->dev);
>  	const struct key_entry *key;
> @@ -446,15 +448,15 @@ static int dell_wmi_process_key(struct wmi_device *wdev, int type, int code, u16
>  	} else if (type == 0x0011 && code == 0xe070 && remaining > 0) {
>  		dell_wmi_switch_event(&priv->tabletswitch_dev,
>  				      "Dell tablet mode switch",
> -				      SW_TABLET_MODE, !buffer[0]);
> +				      SW_TABLET_MODE, !le16_to_cpu(buffer[0]));
>  		return 1;
>  	} else if (type == 0x0012 && code == 0x000c && remaining > 0) {
>  		/* Eprivacy toggle, switch to "on" key entry for on events */
> -		if (buffer[0] == 2)
> +		if (le16_to_cpu(buffer[0]) == 2)
>  			key++;
>  		used = 1;
>  	} else if (type == 0x0012 && code == 0x000d && remaining > 0) {
> -		value = (buffer[2] == 2);
> +		value = (le16_to_cpu(buffer[2]) == 2);
>  		used = 1;
>  	}
>  
> @@ -463,24 +465,17 @@ static int dell_wmi_process_key(struct wmi_device *wdev, int type, int code, u16
>  	return used;
>  }
>  
> -static void dell_wmi_notify(struct wmi_device *wdev,
> -			    union acpi_object *obj)
> +static void dell_wmi_notify(struct wmi_device *wdev, const struct wmi_buffer *buffer)
>  {
>  	struct dell_wmi_priv *priv = dev_get_drvdata(&wdev->dev);
> -	u16 *buffer_entry, *buffer_end;
> -	acpi_size buffer_size;
> +	__le16 *buffer_entry, *buffer_end;
> +	size_t buffer_size;
>  	int len, i;
>  
> -	if (obj->type != ACPI_TYPE_BUFFER) {
> -		pr_warn("bad response type %x\n", obj->type);
> -		return;
> -	}
> +	pr_debug("Received WMI event (%*ph)\n", (int)buffer->length, buffer->data);
>  
> -	pr_debug("Received WMI event (%*ph)\n",
> -		obj->buffer.length, obj->buffer.pointer);
> -
> -	buffer_entry = (u16 *)obj->buffer.pointer;
> -	buffer_size = obj->buffer.length/2;
> +	buffer_entry = buffer->data;
> +	buffer_size = buffer->length / 2;
>  	buffer_end = buffer_entry + buffer_size;
>  
>  	/*
> @@ -496,12 +491,12 @@ static void dell_wmi_notify(struct wmi_device *wdev,
>  	 * one event on devices with WMI interface version 0.
>  	 */
>  	if (priv->interface_version == 0 && buffer_entry < buffer_end)
> -		if (buffer_end > buffer_entry + buffer_entry[0] + 1)
> -			buffer_end = buffer_entry + buffer_entry[0] + 1;
> +		if (buffer_end > buffer_entry + le16_to_cpu(buffer_entry[0]) + 1)
> +			buffer_end = buffer_entry + le16_to_cpu(buffer_entry[0]) + 1;
>  
>  	while (buffer_entry < buffer_end) {
>  
> -		len = buffer_entry[0];
> +		len = le16_to_cpu(buffer_entry[0]);
>  		if (len == 0)
>  			break;
>  
> @@ -514,11 +509,11 @@ static void dell_wmi_notify(struct wmi_device *wdev,
>  
>  		pr_debug("Process buffer (%*ph)\n", len*2, buffer_entry);
>  
> -		switch (buffer_entry[1]) {
> +		switch (le16_to_cpu(buffer_entry[1])) {
>  		case 0x0000: /* One key pressed or event occurred */
>  			if (len > 2)
> -				dell_wmi_process_key(wdev, buffer_entry[1],
> -						     buffer_entry[2],
> +				dell_wmi_process_key(wdev, le16_to_cpu(buffer_entry[1]),
> +						     le16_to_cpu(buffer_entry[2]),
>  						     buffer_entry + 3,
>  						     len - 3);
>  			/* Extended data is currently ignored */
> @@ -526,22 +521,29 @@ static void dell_wmi_notify(struct wmi_device *wdev,
>  		case 0x0010: /* Sequence of keys pressed */
>  		case 0x0011: /* Sequence of events occurred */
>  			for (i = 2; i < len; ++i)
> -				i += dell_wmi_process_key(wdev, buffer_entry[1],
> -							  buffer_entry[i],
> +				i += dell_wmi_process_key(wdev, le16_to_cpu(buffer_entry[1]),
> +							  le16_to_cpu(buffer_entry[i]),
>  							  buffer_entry + i,
>  							  len - i - 1);
>  			break;
>  		case 0x0012:
> -			if ((len > 4) && dell_privacy_process_event(buffer_entry[1], buffer_entry[3],
> -								    buffer_entry[4]))
> -				/* dell_privacy_process_event has handled the event */;
> -			else if (len > 2)
> -				dell_wmi_process_key(wdev, buffer_entry[1], buffer_entry[2],
> +			if (len > 4) {
> +				if (dell_privacy_process_event(le16_to_cpu(buffer_entry[1]),
> +							       le16_to_cpu(buffer_entry[3]),
> +							       le16_to_cpu(buffer_entry[4])))
> +					break;
> +			}
> +
> +			/* dell_privacy_process_event has not handled the event */
> +
> +			if (len > 2)

Please refactor the logic in separate patch.

> +				dell_wmi_process_key(wdev, le16_to_cpu(buffer_entry[1]),
> +						     le16_to_cpu(buffer_entry[2]),
>  						     buffer_entry + 3, len - 3);
> +
>  			break;
>  		default: /* Unknown event */
> -			pr_info("Unknown WMI event type 0x%x\n",
> -				(int)buffer_entry[1]);
> +			pr_info("Unknown WMI event type 0x%x\n", le16_to_cpu(buffer_entry[1]));
>  			break;
>  		}
>  
> @@ -825,10 +827,10 @@ static struct wmi_driver dell_wmi_driver = {
>  		.name = "dell-wmi",
>  	},
>  	.id_table = dell_wmi_id_table,
> -	.min_event_size = sizeof(u16),
> +	.min_event_size = sizeof(__le16),
>  	.probe = dell_wmi_probe,
>  	.remove = dell_wmi_remove,
> -	.notify = dell_wmi_notify,
> +	.notify_new = dell_wmi_notify,
>  };
>  
>  static int __init dell_wmi_init(void)
> 

-- 
 i.

