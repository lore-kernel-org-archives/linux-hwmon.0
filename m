Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5884B2E7BD3;
	Tue,  9 Jun 2026 10:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002708; cv=none; b=AgA1MzFztJKjZZCECssnMen7mfScV0ADmwDIIl8qNkLfPKb2euvpWp2saNDfbN8HjueJTImH5Bz9+76HyXdbVik6HxVPaRNJ+dLAF4xa9Q7jVt8L65nA8+rGU/9tV+X3FB5C7VL19kPiqlEWX1culoW7Vh7/JVeC40bnSRLFKwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002708; c=relaxed/simple;
	bh=++4+KxcMjGGzEoSnNSLStRQBkWqUUWOHqXXD7awHZig=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MkhcVSCStl1NjN6/zdVNd8xfWf+eAE+S3RA5Rf8TpQdlZLze/kF6zWDiaO0EWeZMz+ArkNDnw+HPAheuaas/hzEs8dvjl3L/yZsUFxi9ib6TOQMQA+V/bBhHD7Mg7MFkOlHaOw1ZpM3AHSqyZcB9wyUgrXGN4g+f5H6vWB32BH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n5GFleue; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n5GFleue"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781002707; x=1812538707;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=++4+KxcMjGGzEoSnNSLStRQBkWqUUWOHqXXD7awHZig=;
  b=n5GFleue4FljzExPDP276su9t2YCvmUjNSNOP2H270nbNahEaum9/dbW
   g/x9dDkFStVTzE6pXuS4W1eXSOTc0sPsQEqC7QdUtGM3PzU7LQbXWjHGz
   WKDFHQdaln5oChmS4MSHuJirUsH6gRX/M58P0qVOIERnW7FWHU6NM0HxW
   rzHTg5CIupY6w6JVyoUxxMOKto7PrCP+eAD1p53b92mfv6K8A3CwPFEcm
   tnd4Ov70PJAvbieXzVta18WJ87NB5+K98SfZJGC7sq1Zf+RJGx71YZ3qE
   18Oy+K13O0i596sqLrobEOLOO2qHeYkn5O0wh8Lq8G9x3iWFxRquByKIS
   g==;
X-CSE-ConnectionGUID: 3d9footaSz+LbcsFwh0wTw==
X-CSE-MsgGUID: yjyzcG4oS/Ka3hoPJlwXcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="85382182"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="85382182"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 03:58:26 -0700
X-CSE-ConnectionGUID: 93QqFGlQT3CFncaGgCTKyQ==
X-CSE-MsgGUID: /cX+F6J0QjCuVh8xtpwmQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="269849655"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.81])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 03:58:20 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 9 Jun 2026 13:58:14 +0300 (EEST)
To: Armin Wolf <W_Armin@gmx.de>
cc: Dell.Client.Kernel@dell.com, pali@kernel.org, mjg59@srcf.ucam.org, 
    soyer@irl.hu, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux@roeck-us.net, linux-hwmon@vger.kernel.org, mario.limonciello@amd.com
Subject: Re: [PATCH v5 1/9] platform/x86: dell-descriptor: Use new buffer-based
 WMI API
In-Reply-To: <20260605205937.530897-2-W_Armin@gmx.de>
Message-ID: <c87a0403-6339-7ac3-9a90-3b5bca87bb7d@linux.intel.com>
References: <20260605205937.530897-1-W_Armin@gmx.de> <20260605205937.530897-2-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Jun 2026, Armin Wolf wrote:

> Use the new buffer-based WMI API to also support ACPI firmware
> implementations that do not use ACPI buffers for the descriptor.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  .../platform/x86/dell/dell-wmi-descriptor.c   | 108 ++++++++----------
>  1 file changed, 48 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-wmi-descriptor.c b/drivers/platform/x86/dell/dell-wmi-descriptor.c
> index c2a180202719..5f5e9f38988e 100644
> --- a/drivers/platform/x86/dell/dell-wmi-descriptor.c
> +++ b/drivers/platform/x86/dell/dell-wmi-descriptor.c
> @@ -7,14 +7,34 @@
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
> -#include <linux/acpi.h>
> +#include <linux/cleanup.h>
> +#include <linux/compiler_attributes.h>
>  #include <linux/list.h>
>  #include <linux/module.h>
> +#include <linux/types.h>
>  #include <linux/wmi.h>
>  #include "dell-wmi-descriptor.h"
>  
>  #define DELL_WMI_DESCRIPTOR_GUID "8D9DDCBC-A997-11DA-B012-B622A1EF5492"
>  
> +/*
> + * Descriptor buffer is 128 byte long and contains:
> + *
> + *       Name             Offset  Length  Value
> + * Vendor Signature          0       4    "DELL"
> + * Object Signature          4       4    " WMI"
> + * WMI Interface Version     8       4    <version>
> + * WMI buffer length        12       4    <length>
> + * WMI hotfix number        16       4    <hotfix>
> + */
> +struct descriptor {
> +	char vendor_signature[4];
> +	char object_signature[4];

I suggest adding comment that these are not NUL terminated strings, it's 
a bit trappy.

> +	__le32 interface_version;
> +	__le32 buffer_length;
> +	__le32 hotfix_number;
> +} __packed;
> +
>  struct descriptor_priv {
>  	struct list_head list;
>  	u32 interface_version;
> @@ -88,77 +108,47 @@ bool dell_wmi_get_hotfix(u32 *hotfix)
>  }
>  EXPORT_SYMBOL_GPL(dell_wmi_get_hotfix);
>  
> -/*
> - * Descriptor buffer is 128 byte long and contains:
> - *
> - *       Name             Offset  Length  Value
> - * Vendor Signature          0       4    "DELL"
> - * Object Signature          4       4    " WMI"
> - * WMI Interface Version     8       4    <version>
> - * WMI buffer length        12       4    <length>
> - * WMI hotfix number        16       4    <hotfix>
> - */
> -static int dell_wmi_descriptor_probe(struct wmi_device *wdev,
> -				     const void *context)
> +static int dell_wmi_descriptor_probe(struct wmi_device *wdev, const void *context)
>  {
> -	union acpi_object *obj = NULL;
> +	struct descriptor *desc __free(kfree) = NULL;

This should not be here but down where the real assignment is. I'm pretty 
sure the placement of __free() was discussed earlier in the context of the 
wmi refactor patches.

-- 
 i.


>  	struct descriptor_priv *priv;
> -	u32 *buffer;
> +	struct wmi_buffer buffer;
>  	int ret;
>  
> -	obj = wmidev_block_query(wdev, 0);
> -	if (!obj) {
> -		dev_err(&wdev->dev, "failed to read Dell WMI descriptor\n");
> -		ret = -EIO;
> -		goto out;
> -	}
> -
> -	if (obj->type != ACPI_TYPE_BUFFER) {
> -		dev_err(&wdev->dev, "Dell descriptor has wrong type\n");
> -		ret = -EINVAL;
> +	ret = wmidev_query_block(wdev, 0, &buffer, sizeof(*desc));
> +	if (ret < 0) {
>  		descriptor_valid = ret;
> -		goto out;
> +		return ret;
>  	}
>  
> -	/* Although it's not technically a failure, this would lead to
> -	 * unexpected behavior
> -	 */
> -	if (obj->buffer.length != 128) {
> -		dev_err(&wdev->dev,
> -			"Dell descriptor buffer has unexpected length (%d)\n",
> -			obj->buffer.length);
> -		ret = -EINVAL;
> -		descriptor_valid = ret;
> -		goto out;
> -	}
> +	desc = buffer.data;
>  
> -	buffer = (u32 *)obj->buffer.pointer;
> +	if (strncmp(desc->vendor_signature, "DELL", sizeof(desc->vendor_signature))) {
> +		dev_err(&wdev->dev, "Dell descriptor buffer has invalid vendor signature (%4ph)\n",
> +			desc->vendor_signature);
> +		descriptor_valid = -ENOMSG;
> +		return -ENOMSG;
> +	}
>  
> -	if (strncmp(obj->string.pointer, "DELL WMI", 8) != 0) {
> -		dev_err(&wdev->dev, "Dell descriptor buffer has invalid signature (%8ph)\n",
> -			buffer);
> -		ret = -EINVAL;
> -		descriptor_valid = ret;
> -		goto out;
> +	if (strncmp(desc->object_signature, " WMI", sizeof(desc->object_signature))) {
> +		dev_err(&wdev->dev, "Dell descriptor buffer has invalid object signature (%4ph)\n",
> +			desc->object_signature);
> +		descriptor_valid = -ENOMSG;
> +		return -ENOMSG;
>  	}
>  	descriptor_valid = 0;
>  
> -	if (buffer[2] != 0 && buffer[2] != 1)
> -		dev_warn(&wdev->dev, "Dell descriptor buffer has unknown version (%lu)\n",
> -			(unsigned long) buffer[2]);
> -
> -	priv = devm_kzalloc(&wdev->dev, sizeof(struct descriptor_priv),
> -	GFP_KERNEL);
> +	if (le32_to_cpu(desc->interface_version) > 1)
> +		dev_warn(&wdev->dev, "Dell descriptor buffer has unknown version (%u)\n",
> +			 le32_to_cpu(desc->interface_version));
>  
> -	if (!priv) {
> -		ret = -ENOMEM;
> -		goto out;
> -	}
> +	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
>  
> -	priv->interface_version = buffer[2];
> -	priv->size = buffer[3];
> -	priv->hotfix = buffer[4];
> -	ret = 0;
> +	priv->interface_version = le32_to_cpu(desc->interface_version);
> +	priv->size = le32_to_cpu(desc->buffer_length);
> +	priv->hotfix = le32_to_cpu(desc->hotfix_number);
>  	dev_set_drvdata(&wdev->dev, priv);
>  	mutex_lock(&list_mutex);
>  	list_add_tail(&priv->list, &wmi_list);
> @@ -169,8 +159,6 @@ static int dell_wmi_descriptor_probe(struct wmi_device *wdev,
>  		(unsigned long) priv->size,
>  		(unsigned long) priv->hotfix);
>  
> -out:
> -	kfree(obj);
>  	return ret;
>  }
>  
> 
