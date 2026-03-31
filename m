Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0165920B810;
	Tue, 31 Mar 2026 09:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774950297; cv=none; b=il6ZALYfh3NyAbVklwTh+gED5FDaUOKe0wu6hKfqvulcZzZMq97vD6ZKEovMbqaHLn0pTrhYQHL3GDTaoAGma5F4srjISs45b09CcBedAMfBFOe8FSzsDmIJLIXIw+48cP5e7dpbM5YyiJZHBMhM31nMX4Tu82PmtyGf/QO14gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774950297; c=relaxed/simple;
	bh=iFHT9Wu2zi74tZqHzvNKUpazcO4RImsrzlv1E0bQZ78=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bGKhNoX1kU1pGc09NYjzzcViEtIv86VKbnxOQwdZPWzOO7WnJlsIywKjPnNCLsLwfJ4s9MP1bpYf5Vbb9R8WWyCtvlYsHplgJ/QLxk0Gc4OMmXvnlGMcGt9qkuL4CBcTGKWeUZr7mJn0aa0cylcD5EdLD4xhvxjHi9gyxq8RUNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DjDMnHbm; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DjDMnHbm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774950296; x=1806486296;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=iFHT9Wu2zi74tZqHzvNKUpazcO4RImsrzlv1E0bQZ78=;
  b=DjDMnHbmqiQkMx+pWx/5iC5DmCGSAhskNGocnaNTvzjhSZ3zp5/fq1x3
   H/AdDp2o6tTfGFuYZC/mTxVCjZIqX6xcG7CGTHoUW8dyZpEWu8YpPQ3cz
   2kfuwkgzWfMtnXCpZlDA+2UxqqEz6DtVMtDFwVSakRjUNx1LnV0+owz8H
   YU6uWBRSzesVawzZJM8+eMusehYs6LIAabj4zPrtTT2RJ8/pjwcMqgaMj
   ru23wNt4/uKyuCZUOWZgY4sFG0fyYg5n99/dDYmN+lWB5LnzzQJ5+LRdw
   CmCDG3FwsRd+xROW9aonrvaa6FRvSAWx/B9XU//z1om4Vx2h9iQu372hO
   w==;
X-CSE-ConnectionGUID: NyLNjWldR36PCrln30XRIw==
X-CSE-MsgGUID: ALLbOitMQwKz0gjdbsGlGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="93344723"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="93344723"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 02:44:55 -0700
X-CSE-ConnectionGUID: h6QIev9TReqmlvZHTODclQ==
X-CSE-MsgGUID: xeRSjrIbQa+s2RWWGgrhqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="225315334"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.6])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 02:44:51 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 31 Mar 2026 12:44:45 +0300 (EEST)
To: Armin Wolf <W_Armin@gmx.de>
cc: Dell.Client.Kernel@dell.com, pali@kernel.org, mjg59@srcf.ucam.org, 
    soyer@irl.hu, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux@roeck-us.net, linux-hwmon@vger.kernel.org, mario.limonciello@amd.com
Subject: Re: [PATCH v3 1/9] platform/x86: dell-descriptor: Use new buffer-based
 WMI API
In-Reply-To: <20260314175249.16040-2-W_Armin@gmx.de>
Message-ID: <658006e6-bbfe-03b4-f788-8f041adda03d@linux.intel.com>
References: <20260314175249.16040-1-W_Armin@gmx.de> <20260314175249.16040-2-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 14 Mar 2026, Armin Wolf wrote:

> Use the new buffer-based WMI API to also support ACPI firmware
> implementations that do not use ACPI buffers for the descriptor.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  .../platform/x86/dell/dell-wmi-descriptor.c   | 94 +++++++++----------
>  1 file changed, 47 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-wmi-descriptor.c b/drivers/platform/x86/dell/dell-wmi-descriptor.c
> index c2a180202719..fe42eb8bbd79 100644
> --- a/drivers/platform/x86/dell/dell-wmi-descriptor.c
> +++ b/drivers/platform/x86/dell/dell-wmi-descriptor.c
> @@ -7,7 +7,7 @@
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
> -#include <linux/acpi.h>
> +#include <linux/compiler_attributes.h>
>  #include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/wmi.h>
> @@ -15,6 +15,24 @@
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
> +	__le32 interface_version;
> +	__le32 buffer_length;
> +	__le32 hotfix_number;
> +} __packed;
> +
>  struct descriptor_priv {
>  	struct list_head list;
>  	u32 interface_version;
> @@ -88,76 +106,58 @@ bool dell_wmi_get_hotfix(u32 *hotfix)
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
>  	struct descriptor_priv *priv;
> -	u32 *buffer;
> +	struct wmi_buffer buffer;
> +	struct descriptor *desc;
>  	int ret;
>  
> -	obj = wmidev_block_query(wdev, 0);
> -	if (!obj) {
> -		dev_err(&wdev->dev, "failed to read Dell WMI descriptor\n");
> -		ret = -EIO;
> -		goto out;
> -	}
> +	ret = wmidev_query_block(wdev, 0, &buffer);
> +	if (ret < 0)
> +		return ret;
>  
> -	if (obj->type != ACPI_TYPE_BUFFER) {
> -		dev_err(&wdev->dev, "Dell descriptor has wrong type\n");
> +	if (buffer.length < sizeof(*desc)) {

Hi again,

Thinking some more of this...

Since many of these drivers will need to do this size check and assign 
into some variable that is different from the one passed to 
wmidev_query_block(), would it make sense to move those into generic code? 
It probably requires a macro so you'd have access to type information.

-- 
 i.

> +		dev_err(&wdev->dev,
> +			"Dell descriptor buffer contains not enough data (%zu)\n",
> +			buffer.length);
>  		ret = -EINVAL;
>  		descriptor_valid = ret;
>  		goto out;
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
> +	desc = buffer.data;
> +
> +	if (strncmp(desc->vendor_signature, "DELL", sizeof(desc->vendor_signature))) {
> +		dev_err(&wdev->dev, "Dell descriptor buffer has invalid vendor signature (%4ph)\n",
> +			desc->vendor_signature);
> +		ret = -ENOMSG;
>  		descriptor_valid = ret;
>  		goto out;
>  	}
>  
> -	buffer = (u32 *)obj->buffer.pointer;
> -
> -	if (strncmp(obj->string.pointer, "DELL WMI", 8) != 0) {
> -		dev_err(&wdev->dev, "Dell descriptor buffer has invalid signature (%8ph)\n",
> -			buffer);
> -		ret = -EINVAL;
> +	if (strncmp(desc->object_signature, " WMI", sizeof(desc->vendor_signature))) {
> +		dev_err(&wdev->dev, "Dell descriptor buffer has invalid object signature (%4ph)\n",
> +			desc->object_signature);
> +		ret = -ENOMSG;
>  		descriptor_valid = ret;
>  		goto out;
>  	}
>  	descriptor_valid = 0;
>  
> -	if (buffer[2] != 0 && buffer[2] != 1)
> -		dev_warn(&wdev->dev, "Dell descriptor buffer has unknown version (%lu)\n",
> -			(unsigned long) buffer[2]);
> -
> -	priv = devm_kzalloc(&wdev->dev, sizeof(struct descriptor_priv),
> -	GFP_KERNEL);
> +	if (le32_to_cpu(desc->interface_version) > 2)
> +		dev_warn(&wdev->dev, "Dell descriptor buffer has unknown version (%u)\n",
> +			 le32_to_cpu(desc->interface_version));
>  
> +	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv) {
>  		ret = -ENOMEM;
>  		goto out;
>  	}
>  
> -	priv->interface_version = buffer[2];
> -	priv->size = buffer[3];
> -	priv->hotfix = buffer[4];
> +	priv->interface_version = le32_to_cpu(desc->interface_version);
> +	priv->size = le32_to_cpu(desc->buffer_length);
> +	priv->hotfix = le32_to_cpu(desc->hotfix_number);
>  	ret = 0;
>  	dev_set_drvdata(&wdev->dev, priv);
>  	mutex_lock(&list_mutex);
> @@ -170,7 +170,7 @@ static int dell_wmi_descriptor_probe(struct wmi_device *wdev,
>  		(unsigned long) priv->hotfix);
>  
>  out:
> -	kfree(obj);
> +	kfree(buffer.data);
>  	return ret;
>  }
>  
> 
