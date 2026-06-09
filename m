Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2882029B77E;
	Tue,  9 Jun 2026 11:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781004769; cv=none; b=L159Q6gCb9pZnsixxvTgUng2WQGjiVkY7MCoO6B/0JXpomgCKscGEIFHSNkT8ZKyRgmX2G5tUTim9rO/jCFGja+eZMrRXBYCutxeqBoT1LJYLTnu5U/eC9LCuquth/Ct7GSH9SnZovM8++JZImDXDWgjFBB6IhOONI+Hl8Et7+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781004769; c=relaxed/simple;
	bh=cgKvrnVS4XvdEmYLv4WKPFgfQHbrWZt1RKIhgj/Rwm8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=A2wdR70KBPGsSNGaSDJY01Cb6h/vJQWu2y+vf2QIF20DkqVzp+SDanT/9T6gF53Eonj30VZT46sVfVbUsbdxD3VDfW+zDDuFvHfdZ3SY6YNVWd/g5p5YQcLLyPxzJjSL8/a1WvMdA63dSG1mTlnI8Pyu+kSa6v+zajdUNsqBSZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HaLUGFOo; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HaLUGFOo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781004767; x=1812540767;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=cgKvrnVS4XvdEmYLv4WKPFgfQHbrWZt1RKIhgj/Rwm8=;
  b=HaLUGFOoqKpGPvgwbsc+6K8D7Z9KJUjt+a2/76ZFARtAnYrXUGRG37Kt
   jhMgAG4z+mda5j+rbA5CjPH93dkJt28sEQ1xaeFuWFsx7NxAlJc0AY3MM
   lcxgXgy4LIqF6veSArXwrLoI4DCnnNXb8h5F9tt1tGf/bRarN1lEvg02K
   daoX5FQX7WWt5i56NpkjZhiykD9nCzHU4+y2mlXrwQIGbaGTM80EdAWXZ
   Ih/ujbSd1xKykiijulRujoI0Pw9iDoeD7qshGY2ef7Cpa9pVfM5cToKQx
   o5FBaPsfC9mzlQ2rKz1pN30S2MJnTrI6Kfdq2kuIMdd7JDnUeMUtblMN7
   w==;
X-CSE-ConnectionGUID: ebwJ0DaOS2Kk6acjnFtOhg==
X-CSE-MsgGUID: dsOrn45sSaKui/yx4j914Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81947655"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="81947655"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 04:32:46 -0700
X-CSE-ConnectionGUID: V7flNUTQTJaTCPKMW7/0qg==
X-CSE-MsgGUID: iI0vOUYxQHeUXZbDEzlDxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="269531480"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.81])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 04:32:43 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 9 Jun 2026 14:32:40 +0300 (EEST)
To: Armin Wolf <W_Armin@gmx.de>
cc: Dell.Client.Kernel@dell.com, pali@kernel.org, mjg59@srcf.ucam.org, 
    soyer@irl.hu, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux@roeck-us.net, linux-hwmon@vger.kernel.org, mario.limonciello@amd.com
Subject: Re: [PATCH v5 6/9] hwmon: (dell-smm) Use new buffer-based WMI API
In-Reply-To: <20260605205937.530897-7-W_Armin@gmx.de>
Message-ID: <668d1484-e516-ce17-b4cb-dc69aa5372d3@linux.intel.com>
References: <20260605205937.530897-1-W_Armin@gmx.de> <20260605205937.530897-7-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Jun 2026, Armin Wolf wrote:

> Use the new buffer-based WMI API to also support ACPI firmware
> implementations that do not use ACPI buffers for returning the
> results of a SMM call.
> 
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/hwmon/dell-smm-hwmon.c | 47 ++++++++++++----------------------
>  1 file changed, 16 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 038edffc1ac7..0dbee562220b 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -12,8 +12,9 @@
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
> -#include <linux/acpi.h>
> +#include <linux/align.h>
>  #include <linux/capability.h>
> +#include <linux/compiler_attributes.h>
>  #include <linux/cpu.h>
>  #include <linux/ctype.h>
>  #include <linux/delay.h>
> @@ -36,10 +37,10 @@
>  #include <linux/thermal.h>
>  #include <linux/types.h>
>  #include <linux/uaccess.h>
> +#include <linux/unaligned.h>
>  #include <linux/wmi.h>
>  
>  #include <linux/i8k.h>
> -#include <linux/unaligned.h>
>  
>  #define I8K_SMM_FN_STATUS	0x0025
>  #define I8K_SMM_POWER_STATUS	0x0069
> @@ -232,7 +233,7 @@ static const struct dell_smm_ops i8k_smm_ops = {
>  /*
>   * Call the System Management Mode BIOS over WMI.
>   */
> -static ssize_t wmi_parse_register(u8 *buffer, u32 length, unsigned int *reg)
> +static ssize_t wmi_parse_register(u8 *buffer, size_t length, unsigned int *reg)
>  {
>  	__le32 value;
>  	u32 reg_size;
> @@ -253,7 +254,7 @@ static ssize_t wmi_parse_register(u8 *buffer, u32 length, unsigned int *reg)
>  	return reg_size + sizeof(reg_size);
>  }
>  
> -static int wmi_parse_response(u8 *buffer, u32 length, struct smm_regs *regs)
> +static int wmi_parse_response(u8 *buffer, size_t length, struct smm_regs *regs)
>  {
>  	unsigned int *registers[] = {
>  		&regs->eax,
> @@ -261,7 +262,7 @@ static int wmi_parse_response(u8 *buffer, u32 length, struct smm_regs *regs)
>  		&regs->ecx,
>  		&regs->edx
>  	};
> -	u32 offset = 0;
> +	size_t offset = 0;
>  	ssize_t ret;
>  	int i;
>  
> @@ -273,19 +274,16 @@ static int wmi_parse_response(u8 *buffer, u32 length, struct smm_regs *regs)
>  		if (ret < 0)
>  			return ret;
>  
> -		offset += ret;
> +		/* WMI aligns u32 integers on a 4 byte boundary */
> +		offset = ALIGN(offset + ret, 4);
>  	}
>  
> -	if (offset != length)
> -		return -ENOMSG;
> -
>  	return 0;
>  }
>  
>  static int wmi_smm_call(struct device *dev, struct smm_regs *regs)
>  {
>  	struct wmi_device *wdev = container_of(dev, struct wmi_device, dev);
> -	struct acpi_buffer out = { ACPI_ALLOCATE_BUFFER, NULL };
>  	u32 wmi_payload[] = {
>  		sizeof(regs->eax),
>  		regs->eax,
> @@ -296,32 +294,19 @@ static int wmi_smm_call(struct device *dev, struct smm_regs *regs)
>  		sizeof(regs->edx),
>  		regs->edx
>  	};
> -	const struct acpi_buffer in = {
> +	const struct wmi_buffer in = {
>  		.length = sizeof(wmi_payload),
> -		.pointer = &wmi_payload,
> +		.data = &wmi_payload,
>  	};
> -	union acpi_object *obj;
> -	acpi_status status;
> +	struct wmi_buffer out;
>  	int ret;
>  
> -	status = wmidev_evaluate_method(wdev, 0x0, DELL_SMM_LEGACY_EXECUTE, &in, &out);
> -	if (ACPI_FAILURE(status))
> -		return -EIO;
> -
> -	obj = out.pointer;
> -	if (!obj)
> -		return -ENODATA;
> -
> -	if (obj->type != ACPI_TYPE_BUFFER) {
> -		ret = -ENOMSG;
> -
> -		goto err_free;
> -	}
> -
> -	ret = wmi_parse_response(obj->buffer.pointer, obj->buffer.length, regs);
> +	ret = wmidev_invoke_method(wdev, 0x0, DELL_SMM_LEGACY_EXECUTE, &in, &out, sizeof(__le32));
> +	if (ret < 0)
> +		return ret;
>  
> -err_free:
> -	kfree(obj);
> +	ret = wmi_parse_response(out.data, out.length, regs);
> +	kfree(out.data);
>  
>  	return ret;

If you used __free() here, you could do just:

	return wmi_parse_response(out.data, out.length, regs);

>  }
> 

-- 
 i.

