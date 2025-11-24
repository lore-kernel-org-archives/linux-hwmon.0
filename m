Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C333161BF;
	Mon, 24 Nov 2025 16:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764002716; cv=none; b=CMQTpWJWnExjZS6xVNKA+KCARNID2QJmbulhL6q2gjE9+NShZ867K2QSZ1b8L6s7+cTN4clG0+07+XHSmoEhVLe4a3adr33L0K/ckETW3B2Ovqasp1lalY6Q7UbaM2IoYCvXkHp4hxoMUQWfMXfRJ1Fy3jx9QsLFCSE9NvwTOHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764002716; c=relaxed/simple;
	bh=AGg4x8Zqjx/0TN8BMcahAnqR9eCGbFbNwU4/rY56fHE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=W3vvqjfWOJ2qR7GXcYDp1muuI7hyp+7dehOJdag3lain8q6Soa6NEHEIh6Qy1lJ4b+yWKc0LCRcyYBcdf1MnRip9LPfZcBV7g3Q5qUQBOgVQnrbESG5KabT/+PPmj/reQVJzPQoEC4xqmx8yBdzNq7+zqgAqXMkblrdNwQGnjTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CGzs2DZA; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CGzs2DZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764002714; x=1795538714;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=AGg4x8Zqjx/0TN8BMcahAnqR9eCGbFbNwU4/rY56fHE=;
  b=CGzs2DZArAq4wOrOjsWmKsfBE9zbSfC8WJfN//WsVaaZ99qQpE2hDA7q
   rPtDXJ4SS1JXnAwPzPqvGUmbI9zSHOMlzDUJY5zWYIxaLu03nLbu0xGv3
   0jCybSwplhAyj1iyYNdjgj7c7KmGCiZRYJp570okokW28R8FxPfgo5x3X
   FinMccI7jt+Cl4XbG9trHCDZkVnvwIdsnsxfu080t7+sbyWC7nJYiqbav
   UoIC1LK3bbz5Scb/raaJPrY2dOyNHiMemt0oybU19/lGGw2jfhoJABQ9R
   3XA1gdC9AoJdprOjNImIJcRUZkiG05aGOfJCQmfJYhi/BQns5uEVz0YhE
   A==;
X-CSE-ConnectionGUID: CT+OSc5ySGeQdBgRcICCIQ==
X-CSE-MsgGUID: KUVILwZdQtSnax+iDnOkWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="76621087"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="76621087"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 08:45:12 -0800
X-CSE-ConnectionGUID: K+cNNQ7QRDOkmCDKCgFOmw==
X-CSE-MsgGUID: 3Q6aEZYuQwOGp/AFqRm8qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="192468296"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.97])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 08:45:09 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 24 Nov 2025 18:45:05 +0200 (EET)
To: Rong Zhang <i@rong.moe>
cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Derek J. Clark" <derekjohn.clark@gmail.com>, Armin Wolf <W_Armin@gmx.de>, 
    Hans de Goede <hansg@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v6 5/7] platform/x86: lenovo-wmi-capdata: Add support
 for Fan Test Data
In-Reply-To: <20251122184522.18677-6-i@rong.moe>
Message-ID: <1efe99d4-95ae-d76c-71f5-0a1f98292dd4@linux.intel.com>
References: <20251122184522.18677-1-i@rong.moe> <20251122184522.18677-6-i@rong.moe>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 23 Nov 2025, Rong Zhang wrote:

> Add support for LENOVO_FAN_TEST_DATA WMI data block. Provides an
> interface for querying the min/max fan speed RPM (reference data) of a
> given fan ID.
> 
> This interface is optional. Hence, it does not bind to lenovo-wmi-other
> and is not registered as a component for the moment. Appropriate binding
> will be implemented in the subsequent patch.
> 
> Signed-off-by: Rong Zhang <i@rong.moe>
> Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> Changes in v4:
> - Rebase on top of changes made to [PATCH v4 3/7]
> - Do not register it as a component until [PATCH v4 6/7]
> 
> Changes in v2:
> - Reword documentation
> ---
>  .../wmi/devices/lenovo-wmi-other.rst          |  17 +++
>  drivers/platform/x86/lenovo/wmi-capdata.c     | 102 ++++++++++++++++++
>  drivers/platform/x86/lenovo/wmi-capdata.h     |   7 ++
>  3 files changed, 126 insertions(+)
> 
> diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentation/wmi/devices/lenovo-wmi-other.rst
> index fcad595d49af..821282e07d93 100644
> --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> @@ -62,6 +62,13 @@ The following firmware-attributes are implemented:
>   - ppt_pl2_sppt: Platform Profile Tracking Slow Package Power Tracking
>   - ppt_pl3_fppt: Platform Profile Tracking Fast Package Power Tracking
>  
> +LENOVO_FAN_TEST_DATA
> +-------------------------
> +
> +WMI GUID ``B642801B-3D21-45DE-90AE-6E86F164FB21``
> +
> +The LENOVO_FAN_TEST_DATA interface provides reference data for self-test of
> +cooling fans.
>  
>  WMI interface description
>  =========================
> @@ -115,3 +122,13 @@ data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
>      [WmiDataId(3), read, Description("Data Size.")] uint32 DataSize;
>      [WmiDataId(4), read, Description("Default Value"), WmiSizeIs("DataSize")] uint8 DefaultValue[];
>    };
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("Definition of Fan Test Data"), guid("{B642801B-3D21-45DE-90AE-6E86F164FB21}")]
> +  class LENOVO_FAN_TEST_DATA {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +    [WmiDataId(1), read, Description("Mode.")] uint32 NumOfFans;
> +    [WmiDataId(2), read, Description("Fan ID."), WmiSizeIs("NumOfFans")] uint32 FanId[];
> +    [WmiDataId(3), read, Description("Maximum Fan Speed."), WmiSizeIs("NumOfFans")] uint32 FanMaxSpeed[];
> +    [WmiDataId(4), read, Description("Minumum Fan Speed."), WmiSizeIs("NumOfFans")] uint32 FanMinSpeed[];
> +  };
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
> index 29267c373ab3..e6392357395c 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.c
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
> @@ -13,6 +13,10 @@
>   * attribute has multiple pages, one for each of the thermal modes managed by
>   * the Gamezone interface.
>   *
> + * Fan Test Data includes the max/min fan speed RPM for each fan. This is
> + * reference data for self-test. If the fan is in good condition, it is capable
> + * to spin faster than max RPM or slower than min RPM.
> + *
>   * Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
>   *   - Initial implementation (formerly named lenovo-wmi-capdata01)
>   *
> @@ -41,6 +45,7 @@
>  
>  #define LENOVO_CAPABILITY_DATA_00_GUID "362A3AFE-3D96-4665-8530-96DAD5BB300E"
>  #define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3BE018154"
> +#define LENOVO_FAN_TEST_DATA_GUID "B642801B-3D21-45DE-90AE-6E86F164FB21"
>  
>  #define ACPI_AC_CLASS "ac_adapter"
>  #define ACPI_AC_NOTIFY_STATUS 0x80
> @@ -48,6 +53,7 @@
>  enum lwmi_cd_type {
>  	LENOVO_CAPABILITY_DATA_00,
>  	LENOVO_CAPABILITY_DATA_01,
> +	LENOVO_FAN_TEST_DATA,
>  };
>  
>  #define LWMI_CD_TABLE_ITEM(_type)		\
> @@ -62,6 +68,7 @@ static const struct lwmi_cd_info {
>  } lwmi_cd_table[] = {
>  	LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_00),
>  	LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_01),
> +	LWMI_CD_TABLE_ITEM(LENOVO_FAN_TEST_DATA),
>  };
>  
>  struct lwmi_cd_priv {
> @@ -78,6 +85,7 @@ struct cd_list {
>  	union {
>  		DECLARE_FLEX_ARRAY(struct capdata00, cd00);
>  		DECLARE_FLEX_ARRAY(struct capdata01, cd01);
> +		DECLARE_FLEX_ARRAY(struct capdata_fan, cd_fan);
>  	};
>  };
>  
> @@ -117,6 +125,10 @@ void lwmi_cd_match_add_all(struct device *master, struct component_match **match
>  		return;
>  
>  	for (i = 0; i < ARRAY_SIZE(lwmi_cd_table); i++) {
> +		/* Skip optional interfaces. */
> +		if (lwmi_cd_table[i].type == LENOVO_FAN_TEST_DATA)
> +			continue;
> +
>  		component_match_add(master, matchptr, lwmi_cd_match,
>  				    (void *)&lwmi_cd_table[i].type);
>  		if (IS_ERR(*matchptr))
> @@ -194,6 +206,9 @@ EXPORT_SYMBOL_NS_GPL(lwmi_cd00_get_data, "LENOVO_WMI_CD");
>  DEF_LWMI_CDXX_GET_DATA(cd01, LENOVO_CAPABILITY_DATA_01, struct capdata01);
>  EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_WMI_CD");
>  
> +DEF_LWMI_CDXX_GET_DATA(cd_fan, LENOVO_FAN_TEST_DATA, struct capdata_fan);
> +EXPORT_SYMBOL_NS_GPL(lwmi_cd_fan_get_data, "LENOVO_WMI_CD");
> +
>  /**
>   * lwmi_cd_cache() - Cache all WMI data block information
>   * @priv: lenovo-wmi-capdata driver data.
> @@ -217,6 +232,9 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
>  		p = &priv->list->cd01[0];
>  		size = sizeof(priv->list->cd01[0]);
>  		break;
> +	case LENOVO_FAN_TEST_DATA:
> +		/* Done by lwmi_cd_alloc() => lwmi_cd_fan_list_alloc_cache(). */
> +		return 0;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -239,6 +257,78 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
>  	return 0;
>  }
>  
> +/**
> + * lwmi_cd_fan_list_alloc_cache() - Alloc and cache Fan Test Data list
> + * @priv: lenovo-wmi-capdata driver data.
> + * @listptr: Pointer to returned cd_list pointer.
> + *
> + * Return: count of fans found, or an error.
> + */
> +static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv, struct cd_list **listptr)
> +{
> +	u32 count, *fan_ids, *fan_min_rpms, *fan_max_rpms;
> +	union acpi_object *ret_obj __free(kfree) = NULL;

Since you're using __free(), please move this to where you assign the 
value. This is to create a pattern with cleanup helpers. The cleanup 
order depends on the order the variables are introduced which in some 
other cases may be significant.

> +	struct block { u32 nr; u32 data[]; } *block;

This is the first time I see this style anywhere in the kernel's context, 
has there been some general discussion about this style somewhere?

At least it seems immediately obvious to me that this style will have a 
negative impact on documentability due to (too) concise use of space.

> +	struct cd_list *list;
> +	size_t size;
> +	int idx;
> +
> +	ret_obj = wmidev_block_query(priv->wdev, 0);
> +	if (!ret_obj)
> +		return -ENODEV;
> +
> +	/*
> +	 * This is usually caused by a dummy ACPI method. Do not return an error
> +	 * as failing to probe this device will result in master driver being
> +	 * unbound - this behavior aligns with lwmi_cd_cache().
> +	 */
> +	if (ret_obj->type != ACPI_TYPE_BUFFER) {
> +		count = 0;
> +		goto alloc;
> +	}
> +
> +	size = ret_obj->buffer.length;
> +	block = (struct block *)ret_obj->buffer.pointer;

void * can be cast implicitly.

> +
> +	count = size >= sizeof(*block) ? block->nr : 0;
> +	if (size < struct_size(block, data, count * 3)) {
> +		dev_warn(&priv->wdev->dev,
> +			 "incomplete fan test data block: %zu < %zu, ignoring\n",
> +			 size, struct_size(block, data, count * 3));
> +		count = 0;
> +	}
> +
> +	if (count == 0)
> +		goto alloc;
> +
> +	if (count > U8_MAX) {
> +		dev_warn(&priv->wdev->dev,
> +			 "too many fans reported: %u > %u, truncating\n",
> +			 count, U8_MAX);
> +		count = U8_MAX;
> +	}
> +
> +	fan_ids = &block->data[0];
> +	fan_max_rpms = &block->data[count];
> +	fan_min_rpms = &block->data[count * 2];

Please rearrange so you can remove the goto:

	1. limit count
	if (count) {
		...
	}


> +
> +alloc:
> +	list = devm_kzalloc(&priv->wdev->dev, struct_size(list, cd_fan, count), GFP_KERNEL);
> +	if (!list)
> +		return -ENOMEM;
> +
> +	for (idx = 0; idx < count; idx++) {
> +		list->cd_fan[idx] = (struct capdata_fan) {
> +			.id = fan_ids[idx],
> +			.min_rpm = fan_min_rpms[idx],
> +			.max_rpm = fan_max_rpms[idx],
> +		};
> +	}
> +
> +	*listptr = list;
> +	return count;
> +}
> +
>  /**
>   * lwmi_cd_alloc() - Allocate a cd_list struct in drvdata
>   * @priv: lenovo-wmi-capdata driver data.
> @@ -264,6 +354,12 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv, enum lwmi_cd_type type)
>  	case LENOVO_CAPABILITY_DATA_01:
>  		list_size = struct_size(list, cd01, count);
>  		break;
> +	case LENOVO_FAN_TEST_DATA:
> +		count = lwmi_cd_fan_list_alloc_cache(priv, &list);
> +		if (count < 0)
> +			return count;
> +
> +		goto got_list;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -272,6 +368,7 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv, enum lwmi_cd_type type)
>  	if (!list)
>  		return -ENOMEM;
>  
> +got_list:
>  	ret = devm_mutex_init(&priv->wdev->dev, &list->list_mutex);
>  	if (ret)
>  		return ret;
> @@ -390,6 +487,8 @@ static int lwmi_cd_probe(struct wmi_device *wdev, const void *context)
>  
>  		ret = component_add(&wdev->dev, &lwmi_cd_component_ops);
>  		goto out;
> +	case LENOVO_FAN_TEST_DATA:
> +		goto out;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -413,6 +512,8 @@ static void lwmi_cd_remove(struct wmi_device *wdev)
>  	case LENOVO_CAPABILITY_DATA_01:
>  		component_del(&wdev->dev, &lwmi_cd_component_ops);
>  		break;
> +	case LENOVO_FAN_TEST_DATA:
> +		break;
>  	default:
>  		WARN_ON(1);
>  	}
> @@ -425,6 +526,7 @@ static void lwmi_cd_remove(struct wmi_device *wdev)
>  static const struct wmi_device_id lwmi_cd_id_table[] = {
>  	{ LWMI_CD_WDEV_ID(LENOVO_CAPABILITY_DATA_00) },
>  	{ LWMI_CD_WDEV_ID(LENOVO_CAPABILITY_DATA_01) },
> +	{ LWMI_CD_WDEV_ID(LENOVO_FAN_TEST_DATA) },
>  	{}
>  };
>  
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform/x86/lenovo/wmi-capdata.h
> index a6d006ef458f..38af4c4e4ef4 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> @@ -26,6 +26,12 @@ struct capdata01 {
>  	u32 max_value;
>  };
>  
> +struct capdata_fan {
> +	u32 id;
> +	u32 min_rpm;
> +	u32 max_rpm;
> +};
> +
>  struct lwmi_cd_binder {
>  	struct cd_list *cd00_list;
>  	struct cd_list *cd01_list;
> @@ -34,5 +40,6 @@ struct lwmi_cd_binder {
>  void lwmi_cd_match_add_all(struct device *master, struct component_match **matchptr);
>  int lwmi_cd00_get_data(struct cd_list *list, u32 attribute_id, struct capdata00 *output);
>  int lwmi_cd01_get_data(struct cd_list *list, u32 attribute_id, struct capdata01 *output);
> +int lwmi_cd_fan_get_data(struct cd_list *list, u32 attribute_id, struct capdata_fan *output);
>  
>  #endif /* !_LENOVO_WMI_CAPDATA_H_ */
> 

-- 
 i.

