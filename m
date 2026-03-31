Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C08E3EC2F4;
	Tue, 31 Mar 2026 09:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948831; cv=none; b=Yy/yC27+ZjUHquK5I1CDunkbG0MnDeS/ySVdzGzyziRbfUz1MZi5xMO3pPInlBBxA/tBbjy2qFjatY6/z02BzsHIo9PmrJhhRLmdT0c+/ca7IMNTAllBH8cTrTIodusy1CvhxKvAD3IQFVltQERy9ahpyAximRUN+z+il1DJbhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948831; c=relaxed/simple;
	bh=U1hTWPEDShf4k0dUlNCYLh55dCggz27q5v+LrCiT3ss=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=temc27c/r5fR/7tynpjPdWgbqn1f/Ca54e2/nFg/tGhc5QG4m9BdTXcqhUc1sOH/yJl11q1xnz/plzVYJ/lkZeCuF+I1XXOin0AGj/BpPY/nrCzt4ZhKhNPqf3cRZ7EHh+3KlOb7ayi7Y2gcFJCEn3snEFyfrhvsjre1d0mNqx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jfUS05Mq; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jfUS05Mq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774948828; x=1806484828;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=U1hTWPEDShf4k0dUlNCYLh55dCggz27q5v+LrCiT3ss=;
  b=jfUS05MqbNMOHK4DqXNrjnBGZx/3GF2bADt0stkaKrpTyENXL+woozMq
   gQfoI8I8XHO3+X79WbvY8DY5qI76bPUtAfFc3K2LUmvsBtY1F+TbPIBsk
   a+7C2DK9GZeu0kGHOCI0g8LuSF4AQa/v6ZtI+N1McXmbNmzzGZRGhAZ66
   eazNv+CWUfwtAhj1biG2hxo7qkaA/Zfc8qf/Ba/3rJI3q1njp6VUxLaNo
   El3LwPXz0sLhxqvRQLfFyKDJ0SsDdz3XVhJ+jPG2aC3hfre7w8Gy7n4N5
   aRNAPMc1wIoINRRNYKS4+1cNQu2SfPemGbbH9Ou47U52ix8rMwy6H/TV9
   A==;
X-CSE-ConnectionGUID: Lt0euiKlQt2o0xs9d2st+Q==
X-CSE-MsgGUID: 3kONkJzaTIGf20FSKTrllA==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="74988446"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="74988446"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 02:20:27 -0700
X-CSE-ConnectionGUID: F1dIu9urQo6eEBPr6Q020Q==
X-CSE-MsgGUID: JEMf/spjStKGICsPbKpceQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="226288369"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.6])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 02:20:24 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 31 Mar 2026 12:20:18 +0300 (EEST)
To: Armin Wolf <W_Armin@gmx.de>
cc: Dell.Client.Kernel@dell.com, pali@kernel.org, mjg59@srcf.ucam.org, 
    soyer@irl.hu, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux@roeck-us.net, linux-hwmon@vger.kernel.org, mario.limonciello@amd.com
Subject: Re: [PATCH v3 4/9] platform/x86: dell-wmi-base: Use new buffer-based
 WMI API
In-Reply-To: <20260314175249.16040-5-W_Armin@gmx.de>
Message-ID: <8ae04cbe-7e94-9cbf-0067-e1150e728e90@linux.intel.com>
References: <20260314175249.16040-1-W_Armin@gmx.de> <20260314175249.16040-5-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 14 Mar 2026, Armin Wolf wrote:

> Use the new buffer-based WMI API to also support ACPI firmware
> implementations that do not use ACPI buffers for the event data.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/platform/x86/dell/dell-wmi-base.c | 68 ++++++++++++-----------
>  1 file changed, 35 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-wmi-base.c b/drivers/platform/x86/dell/dell-wmi-base.c
> index 4eefbade2f5e..4a7ab9fb3f81 100644
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
> @@ -408,7 +409,8 @@ static void dell_wmi_switch_event(struct input_dev **subdev,
>  	input_sync(*subdev);
>  }
>  
> -static int dell_wmi_process_key(struct wmi_device *wdev, int type, int code, u16 *buffer, int remaining)
> +static int dell_wmi_process_key(struct wmi_device *wdev, int type, int code, __le16 *buffer,
> +				int remaining)
>  {
>  	struct dell_wmi_priv *priv = dev_get_drvdata(&wdev->dev);
>  	const struct key_entry *key;
> @@ -440,15 +442,15 @@ static int dell_wmi_process_key(struct wmi_device *wdev, int type, int code, u16
>  	} else if (type == 0x0011 && code == 0xe070 && remaining > 0) {
>  		dell_wmi_switch_event(&priv->tabletswitch_dev,
>  				      "Dell tablet mode switch",
> -				      SW_TABLET_MODE, !buffer[0]);
> +				      SW_TABLET_MODE, !le16_to_cpu(buffer[0]));

__le* comes from types.h which this file already has (but the files in 
some of the other patches might be lacking it so please check those).

Should there be some header added for le16_to_cpu()? Probably relevant to 
some other patches as well.

-- 
 i.

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
> @@ -457,24 +459,17 @@ static int dell_wmi_process_key(struct wmi_device *wdev, int type, int code, u16
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
> @@ -490,12 +485,12 @@ static void dell_wmi_notify(struct wmi_device *wdev,
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
> @@ -508,11 +503,11 @@ static void dell_wmi_notify(struct wmi_device *wdev,
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
> @@ -520,22 +515,29 @@ static void dell_wmi_notify(struct wmi_device *wdev,
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
> @@ -821,7 +823,7 @@ static struct wmi_driver dell_wmi_driver = {
>  	.id_table = dell_wmi_id_table,
>  	.probe = dell_wmi_probe,
>  	.remove = dell_wmi_remove,
> -	.notify = dell_wmi_notify,
> +	.notify_new = dell_wmi_notify,
>  };
>  
>  static int __init dell_wmi_init(void)
> 
