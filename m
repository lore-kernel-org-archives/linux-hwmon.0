Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890B53DEACB;
	Tue, 31 Mar 2026 09:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774947824; cv=none; b=UuVqyjh/URoJjJH4rKM91tAdep9AWHChv5yLfe/qNaptp3YZOMi9i3OI0jD75rraxNAJLHbxTSIJmUptq22sABax26XNikiidbftEIwSDzN3dTS8l8A7NFYDmZxZZLsas3ZA+Abde9KZnsPPtxkSrng7UtBOEEuNiHF3J1/jq3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774947824; c=relaxed/simple;
	bh=FxgtPoKq6yGPxKiwXfInBuPUONwqh+Bl8+kH4Plr580=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=S+I0MWMmHd1Mxya3OuW6reWOlYT9wcBvJYLEVtdU94j+6qJ9Bdfwbl9o0vVAIU88hfU7MwV0pHYkUYLMxVsitJo6Jz1ehqgB5uDBqP03VIYaxl8ExGnWyme/edvRGm1lVgHYFzhMBQwtRhfU9vL4eMBD5mI1cWWH1IhpllK06n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oJI9kgRg; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oJI9kgRg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774947822; x=1806483822;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=FxgtPoKq6yGPxKiwXfInBuPUONwqh+Bl8+kH4Plr580=;
  b=oJI9kgRgzmiOOS/pEovRLB4Ayn1Bm0vATzoF/h85JfJRy5aMDpDk36ri
   ijUztaotVsvC0JjNqiWiV+otbqxS91NZSlDbvWpNn63fPpUhC+wv+9dxC
   1YALeg1fp4/y4ZudOaBd/rTa9juBa7RmFrHY1sH1NCDzNzEBC5EXMCz4W
   LyezEmK8uRAQl8sZHYPKrqXrVtwM1V3OdG1+alzxMeVoNNIXFKpXEmjMZ
   aQ1RthKNHg6FlMOvElm0vZ8pjG7cdnynXCSti2bcpzN7Wfrw66LHB8w6x
   adlKJBd4ABZXd3fB/0liwnhnz99t2ftVqTWVnkJ2loYnht/pRcb8dauez
   g==;
X-CSE-ConnectionGUID: J2ntLnJoSouRuzt5PqeHbQ==
X-CSE-MsgGUID: eGDVL3HeRE2o9t1tnLRx8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="63505927"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="63505927"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 02:03:41 -0700
X-CSE-ConnectionGUID: LgDsWM6MQS6M6MnGFgF0dQ==
X-CSE-MsgGUID: 1PBCkdouRuuEI2EglhyVKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="249514299"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.6])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 02:03:36 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 31 Mar 2026 12:03:33 +0300 (EEST)
To: Armin Wolf <W_Armin@gmx.de>
cc: Dell.Client.Kernel@dell.com, pali@kernel.org, mjg59@srcf.ucam.org, 
    soyer@irl.hu, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux@roeck-us.net, linux-hwmon@vger.kernel.org, mario.limonciello@amd.com
Subject: Re: [PATCH v3 2/9] platform/x86: dell-privacy: Use new buffer-based
 WMI API
In-Reply-To: <20260314175249.16040-3-W_Armin@gmx.de>
Message-ID: <24ece1a8-dc6e-64db-0171-7e9a0ea4bacd@linux.intel.com>
References: <20260314175249.16040-1-W_Armin@gmx.de> <20260314175249.16040-3-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 14 Mar 2026, Armin Wolf wrote:

> Use the new buffer-based WMI API to also support ACPI firmware
> implementations that do not use ACPI buffers for the device state.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/platform/x86/dell/dell-wmi-privacy.c | 78 ++++++++++----------
>  1 file changed, 38 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-wmi-privacy.c b/drivers/platform/x86/dell/dell-wmi-privacy.c
> index ed099a431ea4..470273cc2fd2 100644
> --- a/drivers/platform/x86/dell/dell-wmi-privacy.c
> +++ b/drivers/platform/x86/dell/dell-wmi-privacy.c
> @@ -9,6 +9,7 @@
>  
>  #include <linux/acpi.h>
>  #include <linux/bitops.h>
> +#include <linux/compiler_attributes.h>
>  #include <linux/input.h>
>  #include <linux/input/sparse-keymap.h>
>  #include <linux/list.h>
> @@ -25,6 +26,26 @@
>  #define DELL_PRIVACY_CAMERA_EVENT 0x2
>  #define led_to_priv(c)       container_of(c, struct privacy_wmi_data, cdev)
>  
> +/*
> + * Describes the Device State class exposed by BIOS which can be consumed by
> + * various applications interested in knowing the Privacy feature capabilities.
> + * class DeviceState
> + * {
> + *  [key, read] string InstanceName;
> + *  [read] boolean ReadOnly;
> + *
> + *  [WmiDataId(1), read] uint32 DevicesSupported;
> + *   0 - None; 0x1 - Microphone; 0x2 - Camera; 0x4 - ePrivacy  Screen
> + *
> + *  [WmiDataId(2), read] uint32 CurrentState;
> + *   0 - Off; 1 - On; Bit0 - Microphone; Bit1 - Camera; Bit2 - ePrivacyScreen
> + * };
> + */
> +struct device_state {
> +	__le32 devices_supported;
> +	__le32 current_state;
> +} __packed;
> +
>  /*
>   * The wmi_list is used to store the privacy_priv struct with mutex protecting
>   */
> @@ -185,59 +206,36 @@ static struct attribute *privacy_attrs[] = {
>  };
>  ATTRIBUTE_GROUPS(privacy);
>  
> -/*
> - * Describes the Device State class exposed by BIOS which can be consumed by
> - * various applications interested in knowing the Privacy feature capabilities.
> - * class DeviceState
> - * {
> - *  [key, read] string InstanceName;
> - *  [read] boolean ReadOnly;
> - *
> - *  [WmiDataId(1), read] uint32 DevicesSupported;
> - *   0 - None; 0x1 - Microphone; 0x2 - Camera; 0x4 - ePrivacy  Screen
> - *
> - *  [WmiDataId(2), read] uint32 CurrentState;
> - *   0 - Off; 1 - On; Bit0 - Microphone; Bit1 - Camera; Bit2 - ePrivacyScreen
> - * };
> - */
>  static int get_current_status(struct wmi_device *wdev)
>  {
>  	struct privacy_wmi_data *priv = dev_get_drvdata(&wdev->dev);
> -	union acpi_object *obj_present;
> -	u32 *buffer;
> -	int ret = 0;
> +	struct device_state *state;
> +	struct wmi_buffer buffer;
> +	int ret;
>  
>  	if (!priv) {
>  		dev_err(&wdev->dev, "dell privacy priv is NULL\n");
>  		return -EINVAL;
>  	}
> +
>  	/* check privacy support features and device states */
> -	obj_present = wmidev_block_query(wdev, 0);
> -	if (!obj_present) {
> -		dev_err(&wdev->dev, "failed to read Binary MOF\n");
> -		return -EIO;
> -	}
> +	ret = wmidev_query_block(wdev, 0, &buffer);
> +	if (ret < 0)
> +		return ret;
>  
> -	if (obj_present->type != ACPI_TYPE_BUFFER) {
> -		dev_err(&wdev->dev, "Binary MOF is not a buffer!\n");
> -		ret = -EIO;
> -		goto obj_free;
> -	}
> -	/*  Although it's not technically a failure, this would lead to
> -	 *  unexpected behavior
> -	 */
> -	if (obj_present->buffer.length != 8) {
> -		dev_err(&wdev->dev, "Dell privacy buffer has unexpected length (%d)!\n",
> -				obj_present->buffer.length);
> +	if (buffer.length < sizeof(*state)) {
> +		dev_err(&wdev->dev, "Dell privacy buffer contains not enough data (%zu)!\n",

Same comment here as with the other patch, perhaps in other patches as 
well if it's copy pasted so please check the rest, I won't comment on 
this with the other patches.

> +			buffer.length);
>  		ret = -EINVAL;
> -		goto obj_free;
> +		goto buffer_free;
>  	}
> -	buffer = (u32 *)obj_present->buffer.pointer;
> -	priv->features_present = buffer[0];
> -	priv->last_status = buffer[1];
>  
> -obj_free:
> -	kfree(obj_present);
> +	state = buffer.data;
> +	priv->features_present = le32_to_cpu(state->devices_supported);
> +	priv->last_status = le32_to_cpu(state->current_state);
> +
> +buffer_free:
> +	kfree(buffer.data);
>  	return ret;
>  }
>  
> 

-- 
 i.

