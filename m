Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3709305053;
	Mon, 24 Nov 2025 16:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764002959; cv=none; b=sCKLtP00zGEfm1JOnZP5Cgi9YOi1bmjbLVZ/hOEriycMAEB3Ga3DsItXIGlkANuma7XIbHIAonCEqrQ1ISDs8oyVCqPLimZUiSjAyq5EzGIqXyFQkW7dRLE4NSEhmVe2KbTwv6igzVlYa9nQLtR8f0M6T2O73GYtilZg1Jp+XDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764002959; c=relaxed/simple;
	bh=KLqqI6t/Q4iY8lwu42vN7pZxfFqvmOWKELwxxPGnGcw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ItnBczEhQpiqG6C4vE29ziySwerDeHZv+8r8xvug7yYI+/LQ+8kDdF0eK4UBt0L8eIyve68tpLWwIwa2y1mlL+7TLubzJ70YtECuYBO2NHGdP7mQN0TPlT4jYEo0pJxumM6MV/9UEHwltAtRWYRIxpzQtTff+Ns8JsHHylZm6J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hKnDwEiD; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hKnDwEiD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764002957; x=1795538957;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=KLqqI6t/Q4iY8lwu42vN7pZxfFqvmOWKELwxxPGnGcw=;
  b=hKnDwEiDggX3bkAMP74K7JzyZOX+SVmKpL1HYRMh5Gz5MDQkeQ7ipagy
   AXlfZxj6pqq/fk17yQU61/gYCT97WwLK0FlqXNTfLDIdrlogcsi2P4NX4
   3siHxMwbjKMUv0+GJYDVLUXW9/SZ0xr9ZO2+YfnsAcXuVfy4ipLdlejH8
   KRWE8glQljHkvuZlenjY3MWdBOhXnZi3olE+6Guea0eYi30mC3diT/Sq5
   uls7uW5vadTst0ESynW9mhwhWJ3rWAvwNVzpw95rqeZNTKR6xNXXMdA6U
   FUlyC1SE73HrnOrLk2f5/cP9hjTZeSPb6oIqfCXDch1g+iQY5fTU4pazn
   w==;
X-CSE-ConnectionGUID: NpOS74tGROiQIFZGvCqD0A==
X-CSE-MsgGUID: 5cvlJnCJTmuDuGHLJ/9wvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="77369080"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="77369080"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 08:49:16 -0800
X-CSE-ConnectionGUID: d13GFEYDSbKTerRRMT4ETA==
X-CSE-MsgGUID: R0CP7aLBRCaphc8X2Ifz3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="191654733"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.97])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 08:49:12 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 24 Nov 2025 18:49:08 +0200 (EET)
To: Rong Zhang <i@rong.moe>
cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Derek J. Clark" <derekjohn.clark@gmail.com>, Armin Wolf <W_Armin@gmx.de>, 
    Hans de Goede <hansg@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v6 6/7] platform/x86: lenovo-wmi-capdata: Wire up Fan
 Test Data
In-Reply-To: <20251122184522.18677-7-i@rong.moe>
Message-ID: <e5b29e04-4ac8-311f-bcf2-b6f93aa5eeb4@linux.intel.com>
References: <20251122184522.18677-1-i@rong.moe> <20251122184522.18677-7-i@rong.moe>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 23 Nov 2025, Rong Zhang wrote:

> A capdata00 attribute (0x04050000) describes the presence of Fan Test
> Data. Query it, and bind Fan Test Data as a component of capdata00
> accordingly. The component master of capdata00 may pass a callback while
> binding to retrieve fan info from Fan Test Data.
> 
> Summarizing this scheme:
> 
> 	lenovo-wmi-other <-> capdata00 <-> capdata_fan
> 	|- master            |- component
> 	                     |- sub-master
> 	                                   |- sub-component
> 
> The callback will be called once both the master and the sub-component
> are bound to the sub-master (component).
> 
> This scheme is essential to solve these issues:
> - The component framework only supports one aggregation per master
> - A binding is only established until all components are found
> - The Fan Test Data interface may be missing on some devices
> - To get rid of queries for the presense of WMI GUIDs
> 
> capdata00 is registered as a component and a sub-master on probe,
> instead of chaining the registerations in one's bind callback. This is
> because calling (un)registration methods of the component framework
> causes deadlock in (un)bind callbacks, i.e., it's impossible to register
> capdata00 as a sub-master/component in its component/sub-master bind
> callback, and vice versa.
> 
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
> Changes in v6:
> - Fix the error path of component_add(capdata00)
> - Elaborate the design in commit message
> 
> Changes in v5:
> - Fix missing include (thanks kernel test robot)
> 
> Changes in v4:
> - New patch in the series (thanks Armin Wolf's inspiration)
>   - Get rid of wmi_has_guid() (see also [PATCH v4 3/7])
> ---
>  drivers/platform/x86/lenovo/wmi-capdata.c | 265 +++++++++++++++++++++-
>  drivers/platform/x86/lenovo/wmi-capdata.h |  20 ++
>  drivers/platform/x86/lenovo/wmi-other.c   |   5 -
>  3 files changed, 283 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
> index e6392357395c..8760f8c071ca 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.c
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
> @@ -27,6 +27,7 @@
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
>  #include <linux/acpi.h>
> +#include <linux/bitfield.h>
>  #include <linux/cleanup.h>
>  #include <linux/component.h>
>  #include <linux/container_of.h>
> @@ -50,10 +51,17 @@
>  #define ACPI_AC_CLASS "ac_adapter"
>  #define ACPI_AC_NOTIFY_STATUS 0x80
>  
> +#define LWMI_FEATURE_ID_FAN_TEST 0x05
> +
> +#define LWMI_ATTR_ID_FAN_TEST							\
> +	(FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, LWMI_DEVICE_ID_FAN) |		\
> +	 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, LWMI_FEATURE_ID_FAN_TEST))
> +
>  enum lwmi_cd_type {
>  	LENOVO_CAPABILITY_DATA_00,
>  	LENOVO_CAPABILITY_DATA_01,
>  	LENOVO_FAN_TEST_DATA,
> +	CD_TYPE_NONE = -1,
>  };
>  
>  #define LWMI_CD_TABLE_ITEM(_type)		\
> @@ -75,6 +83,20 @@ struct lwmi_cd_priv {
>  	struct notifier_block acpi_nb; /* ACPI events */
>  	struct wmi_device *wdev;
>  	struct cd_list *list;
> +
> +	/*
> +	 * A capdata device may be a component master of another capdata device.
> +	 * E.g., lenovo-wmi-other <-> capdata00 <-> capdata_fan
> +	 *       |- master            |- component
> +	 *                            |- sub-master
> +	 *                                          |- sub-component
> +	 */
> +	struct lwmi_cd_sub_master_priv {
> +		struct device *master_dev;
> +		cd_list_cb_t master_cb;
> +		struct cd_list *sub_component_list; /* ERR_PTR(-ENODEV) implies no sub-component. */
> +		bool registered;                    /* Has the sub-master been registered? */
> +	} *sub_master;
>  };
>  
>  struct cd_list {
> @@ -125,7 +147,7 @@ void lwmi_cd_match_add_all(struct device *master, struct component_match **match
>  		return;
>  
>  	for (i = 0; i < ARRAY_SIZE(lwmi_cd_table); i++) {
> -		/* Skip optional interfaces. */
> +		/* Skip sub-components. */

Didn't you just introduce it? If that's the case, please try to avoid such 
back-and-forth changes within the series.

>  		if (lwmi_cd_table[i].type == LENOVO_FAN_TEST_DATA)
>  			continue;
>  
> @@ -137,6 +159,56 @@ void lwmi_cd_match_add_all(struct device *master, struct component_match **match
>  }
>  EXPORT_SYMBOL_NS_GPL(lwmi_cd_match_add_all, "LENOVO_WMI_CD");
>  
> +/**
> + * lwmi_cd_call_master_cb() - Call the master callback for the sub-component.
> + * @priv: Pointer to the capability data private data.
> + *
> + * Call the master callback and pass the sub-component list to it if the
> + * dependency chain (master <-> sub-master <-> sub-component) is complete.
> + */
> +static void lwmi_cd_call_master_cb(struct lwmi_cd_priv *priv)
> +{
> +	struct cd_list *sub_component_list = priv->sub_master->sub_component_list;
> +
> +	/*
> +	 * Call the callback only if the dependency chain is ready:
> +	 * - Binding between master and sub-master: fills master_dev and master_cb
> +	 * - Binding between sub-master and sub-component: fills sub_component_list
> +	 *
> +	 * If a binding has been unbound before the other binding is bound, the
> +	 * corresponding members filled by the former are guaranteed to be cleared.
> +	 *
> +	 * This function is only called in bind callbacks, and the component
> +	 * framework guarantees bind/unbind callbacks may never execute
> +	 * simultaneously, which implies that it's impossible to have a race
> +	 * condition.
> +	 *
> +	 * Hence, this check is sufficient to ensure that the callback is called
> +	 * at most once and with the correct state, without relying on a specific
> +	 * sequence of binding establishment.
> +	 */
> +	if (!sub_component_list ||
> +	    !priv->sub_master->master_dev ||
> +	    !priv->sub_master->master_cb)
> +		return;
> +
> +	if (PTR_ERR(sub_component_list) == -ENODEV)

Include?

> +		sub_component_list = NULL;
> +	else if (WARN_ON(IS_ERR(sub_component_list)))

Include?

(Some earlier patch may already need to add these, it probably was 
relevant there already)

> +		return;
> +
> +	priv->sub_master->master_cb(priv->sub_master->master_dev,
> +				    sub_component_list);
> +
> +	/*
> +	 * Prevent "unbind and rebind" sequences from userspace from calling the
> +	 * callback twice.
> +	 */
> +	priv->sub_master->master_cb = NULL;
> +	priv->sub_master->master_dev = NULL;
> +	priv->sub_master->sub_component_list = NULL;
> +}
> +
>  /**
>   * lwmi_cd_component_bind() - Bind component to master device.
>   * @cd_dev: Pointer to the lenovo-wmi-capdata driver parent device.
> @@ -147,6 +219,8 @@ EXPORT_SYMBOL_NS_GPL(lwmi_cd_match_add_all, "LENOVO_WMI_CD");
>   * list. This is used to call lwmi_cd*_get_data to look up attribute data
>   * from the lenovo-wmi-other driver.
>   *
> + * If cd_dev is a sub-master, try to call the master callback.
> + *
>   * Return: 0
>   */
>  static int lwmi_cd_component_bind(struct device *cd_dev,
> @@ -158,6 +232,11 @@ static int lwmi_cd_component_bind(struct device *cd_dev,
>  	switch (priv->list->type) {
>  	case LENOVO_CAPABILITY_DATA_00:
>  		binder->cd00_list = priv->list;
> +
> +		priv->sub_master->master_dev = om_dev;
> +		priv->sub_master->master_cb = binder->cd_fan_list_cb;
> +		lwmi_cd_call_master_cb(priv);
> +
>  		break;
>  	case LENOVO_CAPABILITY_DATA_01:
>  		binder->cd01_list = priv->list;
> @@ -169,8 +248,167 @@ static int lwmi_cd_component_bind(struct device *cd_dev,
>  	return 0;
>  }
>  
> +/**
> + * lwmi_cd_component_unbind() - Unbind component to master device.
> + * @cd_dev: Pointer to the lenovo-wmi-capdata driver parent device.
> + * @om_dev: Pointer to the lenovo-wmi-other driver parent device.
> + * @data: Unused.
> + *
> + * If cd_dev is a sub-master, clear the collected data from the master device to
> + * prevent the binding establishment between the sub-master and the sub-
> + * component (if it's about to happen) from calling the master callback.
> + */
> +static void lwmi_cd_component_unbind(struct device *cd_dev,
> +				     struct device *om_dev, void *data)
> +{
> +	struct lwmi_cd_priv *priv = dev_get_drvdata(cd_dev);
> +
> +	switch (priv->list->type) {
> +	case LENOVO_CAPABILITY_DATA_00:
> +		priv->sub_master->master_dev = NULL;
> +		priv->sub_master->master_cb = NULL;
> +		return;
> +	default:
> +		return;
> +	}
> +}
> +
>  static const struct component_ops lwmi_cd_component_ops = {
>  	.bind = lwmi_cd_component_bind,
> +	.unbind = lwmi_cd_component_unbind,
> +};
> +
> +/**
> + * lwmi_cd_sub_master_bind() - Bind sub-component of sub-master device
> + * @dev: The sub-master capdata basic device.
> + *
> + * Call component_bind_all to bind the sub-component device to the sub-master
> + * device. On success, collect the pointer to the sub-component list and try
> + * to call the master callback.
> + *
> + * Return: 0 on success, or an error code.
> + */
> +static int lwmi_cd_sub_master_bind(struct device *dev)
> +{
> +	struct lwmi_cd_priv *priv = dev_get_drvdata(dev);
> +	struct cd_list *sub_component_list;
> +	int ret;
> +
> +	ret = component_bind_all(dev, &sub_component_list);
> +	if (ret)
> +		return ret;
> +
> +	priv->sub_master->sub_component_list = sub_component_list;
> +	lwmi_cd_call_master_cb(priv);
> +
> +	return 0;
> +}
> +
> +/**
> + * lwmi_cd_sub_master_unbind() - Unbind sub-component of sub-master device
> + * @dev: The sub-master capdata basic device
> + *
> + * Clear the collected pointer to the sub-component list to prevent the binding
> + * establishment between the sub-master and the sub-component (if it's about to
> + * happen) from calling the master callback. Then, call component_unbind_all to
> + * unbind the sub-component device from the sub-master device.
> + */
> +static void lwmi_cd_sub_master_unbind(struct device *dev)
> +{
> +	struct lwmi_cd_priv *priv = dev_get_drvdata(dev);
> +
> +	priv->sub_master->sub_component_list = NULL;
> +
> +	component_unbind_all(dev, NULL);
> +}
> +
> +static const struct component_master_ops lwmi_cd_sub_master_ops = {
> +	.bind = lwmi_cd_sub_master_bind,
> +	.unbind = lwmi_cd_sub_master_unbind,
> +};
> +
> +/**
> + * lwmi_cd_sub_master_add() - Register a sub-master with its sub-component
> + * @priv: Pointer to the sub-master capdata device private data.
> + * @sub_component_type: Type of the sub-component.
> + *
> + * Match the sub-component type and register the current capdata device as a
> + * sub-master. If the given sub-component type is CD_TYPE_NONE, mark the sub-
> + * component as non-existent without registering sub-master.
> + *
> + * Return: 0 on success, or an error code.
> + */
> +static int lwmi_cd_sub_master_add(struct lwmi_cd_priv *priv,
> +				  enum lwmi_cd_type sub_component_type)
> +{
> +	struct component_match *master_match = NULL;
> +	int ret;
> +
> +	priv->sub_master = devm_kzalloc(&priv->wdev->dev, sizeof(*priv->sub_master), GFP_KERNEL);
> +	if (!priv->sub_master)
> +		return -ENOMEM;
> +
> +	if (sub_component_type == CD_TYPE_NONE) {
> +		/* The master callback will be called with NULL on bind. */
> +		priv->sub_master->sub_component_list = ERR_PTR(-ENODEV);
> +		priv->sub_master->registered = false;
> +		return 0;
> +	}
> +
> +	/*
> +	 * lwmi_cd_match() needs a pointer to enum lwmi_cd_type, but on-stack
> +	 * data cannot be used here. Steal one from lwmi_cd_table.
> +	 */
> +	component_match_add(&priv->wdev->dev, &master_match, lwmi_cd_match,
> +			    (void *)&lwmi_cd_table[sub_component_type].type);

Is void * cast required?

> +	if (IS_ERR(master_match))
> +		return PTR_ERR(master_match);
> +
> +	ret = component_master_add_with_match(&priv->wdev->dev, &lwmi_cd_sub_master_ops,
> +					      master_match);
> +	if (ret)
> +		return ret;
> +
> +	priv->sub_master->registered = true;
> +	return 0;
> +}
> +
> +/**
> + * lwmi_cd_sub_master_del() - Unregister a sub-master if it's registered
> + * @priv: Pointer to the sub-master capdata device private data.
> + */
> +static void lwmi_cd_sub_master_del(struct lwmi_cd_priv *priv)
> +{
> +	if (priv->sub_master->registered) {

Reverse the logic and return early instead.

> +		component_master_del(&priv->wdev->dev, &lwmi_cd_sub_master_ops);
> +		priv->sub_master->registered = false;
> +	}
> +}
> +
> +/**
> + * lwmi_cd_sub_component_bind() - Bind sub-component to sub-master device.
> + * @sc_dev: Pointer to the sub-component capdata parent device.
> + * @sm_dev: Pointer to the sub-master capdata parent device.
> + * @data: Pointer used to return the capability data list pointer.
> + *
> + * On sub-master's bind, provide a pointer to the local capdata list.
> + * This is used by the sub-master to call the master callback.
> + *
> + * Return: 0
> + */
> +static int lwmi_cd_sub_component_bind(struct device *sc_dev,
> +				      struct device *sm_dev, void *data)
> +{
> +	struct lwmi_cd_priv *priv = dev_get_drvdata(sc_dev);
> +	struct cd_list **listp = data;
> +
> +	*listp = priv->list;
> +
> +	return 0;
> +}
> +
> +static const struct component_ops lwmi_cd_sub_component_ops = {
> +	.bind = lwmi_cd_sub_component_bind,
>  };
>  
>  /**
> @@ -470,9 +708,28 @@ static int lwmi_cd_probe(struct wmi_device *wdev, const void *context)
>  		goto out;
>  
>  	switch (info->type) {
> -	case LENOVO_CAPABILITY_DATA_00:
> +	case LENOVO_CAPABILITY_DATA_00: {
> +		enum lwmi_cd_type sub_component_type = LENOVO_FAN_TEST_DATA;
> +		struct capdata00 capdata00;
> +
> +		ret = lwmi_cd00_get_data(priv->list, LWMI_ATTR_ID_FAN_TEST, &capdata00);
> +		if (ret || !(capdata00.supported & LWMI_SUPP_VALID)) {
> +			dev_dbg(&wdev->dev, "capdata00 declares no fan test support\n");
> +			sub_component_type = CD_TYPE_NONE;
> +		}
> +
> +		/* Sub-master (capdata00) <-> sub-component (capdata_fan) */
> +		ret = lwmi_cd_sub_master_add(priv, sub_component_type);
> +		if (ret)
> +			goto out;
> +
> +		/* Master (lenovo-wmi-other) <-> sub-master (capdata00) */
>  		ret = component_add(&wdev->dev, &lwmi_cd_component_ops);
> +		if (ret)
> +			lwmi_cd_sub_master_del(priv);
> +
>  		goto out;
> +	}
>  	case LENOVO_CAPABILITY_DATA_01:
>  		priv->acpi_nb.notifier_call = lwmi_cd01_notifier_call;
>  
> @@ -488,6 +745,7 @@ static int lwmi_cd_probe(struct wmi_device *wdev, const void *context)
>  		ret = component_add(&wdev->dev, &lwmi_cd_component_ops);
>  		goto out;
>  	case LENOVO_FAN_TEST_DATA:
> +		ret = component_add(&wdev->dev, &lwmi_cd_sub_component_ops);
>  		goto out;
>  	default:
>  		return -EINVAL;
> @@ -509,10 +767,13 @@ static void lwmi_cd_remove(struct wmi_device *wdev)
>  
>  	switch (priv->list->type) {
>  	case LENOVO_CAPABILITY_DATA_00:
> +		lwmi_cd_sub_master_del(priv);
> +		fallthrough;
>  	case LENOVO_CAPABILITY_DATA_01:
>  		component_del(&wdev->dev, &lwmi_cd_component_ops);
>  		break;
>  	case LENOVO_FAN_TEST_DATA:
> +		component_del(&wdev->dev, &lwmi_cd_sub_component_ops);
>  		break;
>  	default:
>  		WARN_ON(1);
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform/x86/lenovo/wmi-capdata.h
> index 38af4c4e4ef4..59ca3b3e5760 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> @@ -5,8 +5,20 @@
>  #ifndef _LENOVO_WMI_CAPDATA_H_
>  #define _LENOVO_WMI_CAPDATA_H_
>  
> +#include <linux/bits.h>
>  #include <linux/types.h>
>  
> +#define LWMI_SUPP_VALID		BIT(0)
> +#define LWMI_SUPP_MAY_GET	(LWMI_SUPP_VALID | BIT(1))
> +#define LWMI_SUPP_MAY_SET	(LWMI_SUPP_VALID | BIT(2))
> +
> +#define LWMI_ATTR_DEV_ID_MASK	GENMASK(31, 24)
> +#define LWMI_ATTR_FEAT_ID_MASK	GENMASK(23, 16)
> +#define LWMI_ATTR_MODE_ID_MASK	GENMASK(15, 8)
> +#define LWMI_ATTR_TYPE_ID_MASK	GENMASK(7, 0)
> +
> +#define LWMI_DEVICE_ID_FAN	0x04
> +
>  struct component_match;
>  struct device;
>  struct cd_list;
> @@ -32,9 +44,17 @@ struct capdata_fan {
>  	u32 max_rpm;
>  };
>  
> +typedef void (*cd_list_cb_t)(struct device *master_dev, struct cd_list *cd_list);
> +
>  struct lwmi_cd_binder {
>  	struct cd_list *cd00_list;
>  	struct cd_list *cd01_list;
> +	/*
> +	 * May be called during or after the bind callback.
> +	 * Will be called with NULL if capdata_fan does not exist.
> +	 * The pointer is only valid in the callback; never keep it for later use!
> +	 */
> +	cd_list_cb_t cd_fan_list_cb;
>  };
>  
>  void lwmi_cd_match_add_all(struct device *master, struct component_match **matchptr);
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
> index f2e1e34d58a9..b3adcc2804fa 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -54,11 +54,6 @@
>  #define LWMI_FEATURE_VALUE_GET 17
>  #define LWMI_FEATURE_VALUE_SET 18
>  
> -#define LWMI_ATTR_DEV_ID_MASK GENMASK(31, 24)
> -#define LWMI_ATTR_FEAT_ID_MASK GENMASK(23, 16)
> -#define LWMI_ATTR_MODE_ID_MASK GENMASK(15, 8)
> -#define LWMI_ATTR_TYPE_ID_MASK GENMASK(7, 0)
> -
>  #define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
>  
>  static BLOCKING_NOTIFIER_HEAD(om_chain_head);
> 

-- 
 i.

