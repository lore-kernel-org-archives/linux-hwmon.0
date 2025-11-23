Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9251C695;
	Sun, 23 Nov 2025 03:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763869015; cv=none; b=ZQDWZRQ7xlErEkYLiPedwqxKW/LZPvjgb4EACZMT5Nh9PuHRhgDwPHJtiKE/Z0QOL2uo8bIXjUCwB+/jQ0t2QQXDjbP2KmtRT1hgYYDl1iebhjfMEydtxdYwmAzxf8TrIp5ZgyIhED7YM37jVoMkHsMzrycfp+cOaRFwAygWrYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763869015; c=relaxed/simple;
	bh=kRuOTFGLVyYTukiLE0FEOciJ8tONlr2yZ8HqVZzeqGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oCYXchoNmB0SlgHrd/lnaoFGndiQYioQshI9IMZr3FaWm6r1a/NBfX/1jneqxzIq649G04r3hnlZLnscPnrzyhKUVV3lBgHAJc0xeU8d2LEomEqZm4zYhTq0cxplxmClU4X4N2qYth8aoiVYGtoaIAsL9HDX8jAE0XN2yJJOXAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=FbHhttFA; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="FbHhttFA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763868985; x=1764473785; i=w_armin@gmx.de;
	bh=epV/J1z5gx1AmidMKjYWT3wQqSfhTaCp5TpemjyFOEY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=FbHhttFAedhfNIdueGDxfxcMEbG3gLYbsmd/dhQLPaFpiI6dyRze1DXJS4RnKPNi
	 BbLj6GK4NcQy4LPYOcC1kSb3pFJF5IjOH36V/ZKg0KhRPh41s+77JHlr6pwei8EPg
	 7kb8VJmrAMZZURzAaic/dk5TOlCWRsRcs21pjXrbDKqTpBzON5fHeG5Y+HeFGsbaa
	 Tv0YTbTfGND2K4smLV88FneKODSbAzEXlylkBephBt4fmO4wEb36BJNokmXxlpYk9
	 LSTNiscWId6Z3Wn+iZk0TFJKG4uJEu/wWlMb+QQUCtACQezGStYVt9yLKlN3nf0Sx
	 DrC7/fArTjQ1YwMoPQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3siG-1w4ydN0Fhw-014twv; Sun, 23
 Nov 2025 04:36:25 +0100
Message-ID: <9340b459-2d25-4767-8a47-765a71477d8f@gmx.de>
Date: Sun, 23 Nov 2025 04:36:19 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/7] platform/x86: lenovo-wmi-capdata: Wire up Fan Test
 Data
To: Rong Zhang <i@rong.moe>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20251122184522.18677-1-i@rong.moe>
 <20251122184522.18677-7-i@rong.moe>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20251122184522.18677-7-i@rong.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:o3lf+K89GB67TKKJSWzbsfgl8DPVrar2Ec8HmgMfhLiSREmnISb
 kQhQwOpOedqPDovvH5psLxvlSSLvbRXsbi2m8Vz2UJwyT5DV5jZwy27Vkz3pUodMDUV8ivu
 sZ/Y4Tuy7ZfsNE6HhFwZsBqPUsyBZ7gsUl6HUjsg34uGzsNT6W8NjkxNnoyPrBD9VEvo4t2
 ZoB0WJcse+JWFC5fPvVcg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hS8//R8BU4k=;Iz18YULtguDeQK5mwCYnhOwnG+b
 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

Am 22.11.25 um 19:44 schrieb Rong Zhang:

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

I spend some time trying to understand all of this, and i have come to the=
 conclusion
that while passing a callback between both component masters, it still is =
not exactly
clean.

Can you instead use devm_lwmi_om_register_notifier() and define another ev=
ent for querying
the fan data? This way we could ditch the component submaster with all of =
the callback madness.
Sorry for being the one for suggesting the submaster approach in the first=
 place, i did not
know that the component framework is so limited when it comes to nested co=
mponent masters :/

If Mark is OK with using the submaster approach then you can ignore the ab=
ove suggestion.

Thanks,
Armin Wolf

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
>    - Get rid of wmi_has_guid() (see also [PATCH v4 3/7])
> ---
>   drivers/platform/x86/lenovo/wmi-capdata.c | 265 +++++++++++++++++++++-
>   drivers/platform/x86/lenovo/wmi-capdata.h |  20 ++
>   drivers/platform/x86/lenovo/wmi-other.c   |   5 -
>   3 files changed, 283 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platfor=
m/x86/lenovo/wmi-capdata.c
> index e6392357395c..8760f8c071ca 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.c
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
> @@ -27,6 +27,7 @@
>   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  =20
>   #include <linux/acpi.h>
> +#include <linux/bitfield.h>
>   #include <linux/cleanup.h>
>   #include <linux/component.h>
>   #include <linux/container_of.h>
> @@ -50,10 +51,17 @@
>   #define ACPI_AC_CLASS "ac_adapter"
>   #define ACPI_AC_NOTIFY_STATUS 0x80
>  =20
> +#define LWMI_FEATURE_ID_FAN_TEST 0x05
> +
> +#define LWMI_ATTR_ID_FAN_TEST							\
> +	(FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, LWMI_DEVICE_ID_FAN) |		\
> +	 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, LWMI_FEATURE_ID_FAN_TEST))
> +
>   enum lwmi_cd_type {
>   	LENOVO_CAPABILITY_DATA_00,
>   	LENOVO_CAPABILITY_DATA_01,
>   	LENOVO_FAN_TEST_DATA,
> +	CD_TYPE_NONE =3D -1,
>   };
>  =20
>   #define LWMI_CD_TABLE_ITEM(_type)		\
> @@ -75,6 +83,20 @@ struct lwmi_cd_priv {
>   	struct notifier_block acpi_nb; /* ACPI events */
>   	struct wmi_device *wdev;
>   	struct cd_list *list;
> +
> +	/*
> +	 * A capdata device may be a component master of another capdata devic=
e.
> +	 * E.g., lenovo-wmi-other <-> capdata00 <-> capdata_fan
> +	 *       |- master            |- component
> +	 *                            |- sub-master
> +	 *                                          |- sub-component
> +	 */
> +	struct lwmi_cd_sub_master_priv {
> +		struct device *master_dev;
> +		cd_list_cb_t master_cb;
> +		struct cd_list *sub_component_list; /* ERR_PTR(-ENODEV) implies no su=
b-component. */
> +		bool registered;                    /* Has the sub-master been regist=
ered? */
> +	} *sub_master;
>   };
>  =20
>   struct cd_list {
> @@ -125,7 +147,7 @@ void lwmi_cd_match_add_all(struct device *master, st=
ruct component_match **match
>   		return;
>  =20
>   	for (i =3D 0; i < ARRAY_SIZE(lwmi_cd_table); i++) {
> -		/* Skip optional interfaces. */
> +		/* Skip sub-components. */
>   		if (lwmi_cd_table[i].type =3D=3D LENOVO_FAN_TEST_DATA)
>   			continue;
>  =20
> @@ -137,6 +159,56 @@ void lwmi_cd_match_add_all(struct device *master, s=
truct component_match **match
>   }
>   EXPORT_SYMBOL_NS_GPL(lwmi_cd_match_add_all, "LENOVO_WMI_CD");
>  =20
> +/**
> + * lwmi_cd_call_master_cb() - Call the master callback for the sub-comp=
onent.
> + * @priv: Pointer to the capability data private data.
> + *
> + * Call the master callback and pass the sub-component list to it if th=
e
> + * dependency chain (master <-> sub-master <-> sub-component) is comple=
te.
> + */
> +static void lwmi_cd_call_master_cb(struct lwmi_cd_priv *priv)
> +{
> +	struct cd_list *sub_component_list =3D priv->sub_master->sub_component=
_list;
> +
> +	/*
> +	 * Call the callback only if the dependency chain is ready:
> +	 * - Binding between master and sub-master: fills master_dev and maste=
r_cb
> +	 * - Binding between sub-master and sub-component: fills sub_component=
_list
> +	 *
> +	 * If a binding has been unbound before the other binding is bound, th=
e
> +	 * corresponding members filled by the former are guaranteed to be cle=
ared.
> +	 *
> +	 * This function is only called in bind callbacks, and the component
> +	 * framework guarantees bind/unbind callbacks may never execute
> +	 * simultaneously, which implies that it's impossible to have a race
> +	 * condition.
> +	 *
> +	 * Hence, this check is sufficient to ensure that the callback is call=
ed
> +	 * at most once and with the correct state, without relying on a speci=
fic
> +	 * sequence of binding establishment.
> +	 */
> +	if (!sub_component_list ||
> +	    !priv->sub_master->master_dev ||
> +	    !priv->sub_master->master_cb)
> +		return;
> +
> +	if (PTR_ERR(sub_component_list) =3D=3D -ENODEV)
> +		sub_component_list =3D NULL;
> +	else if (WARN_ON(IS_ERR(sub_component_list)))
> +		return;
> +
> +	priv->sub_master->master_cb(priv->sub_master->master_dev,
> +				    sub_component_list);
> +
> +	/*
> +	 * Prevent "unbind and rebind" sequences from userspace from calling t=
he
> +	 * callback twice.
> +	 */
> +	priv->sub_master->master_cb =3D NULL;
> +	priv->sub_master->master_dev =3D NULL;
> +	priv->sub_master->sub_component_list =3D NULL;
> +}
> +
>   /**
>    * lwmi_cd_component_bind() - Bind component to master device.
>    * @cd_dev: Pointer to the lenovo-wmi-capdata driver parent device.
> @@ -147,6 +219,8 @@ EXPORT_SYMBOL_NS_GPL(lwmi_cd_match_add_all, "LENOVO_=
WMI_CD");
>    * list. This is used to call lwmi_cd*_get_data to look up attribute d=
ata
>    * from the lenovo-wmi-other driver.
>    *
> + * If cd_dev is a sub-master, try to call the master callback.
> + *
>    * Return: 0
>    */
>   static int lwmi_cd_component_bind(struct device *cd_dev,
> @@ -158,6 +232,11 @@ static int lwmi_cd_component_bind(struct device *cd=
_dev,
>   	switch (priv->list->type) {
>   	case LENOVO_CAPABILITY_DATA_00:
>   		binder->cd00_list =3D priv->list;
> +
> +		priv->sub_master->master_dev =3D om_dev;
> +		priv->sub_master->master_cb =3D binder->cd_fan_list_cb;
> +		lwmi_cd_call_master_cb(priv);
> +
>   		break;
>   	case LENOVO_CAPABILITY_DATA_01:
>   		binder->cd01_list =3D priv->list;
> @@ -169,8 +248,167 @@ static int lwmi_cd_component_bind(struct device *c=
d_dev,
>   	return 0;
>   }
>  =20
> +/**
> + * lwmi_cd_component_unbind() - Unbind component to master device.
> + * @cd_dev: Pointer to the lenovo-wmi-capdata driver parent device.
> + * @om_dev: Pointer to the lenovo-wmi-other driver parent device.
> + * @data: Unused.
> + *
> + * If cd_dev is a sub-master, clear the collected data from the master =
device to
> + * prevent the binding establishment between the sub-master and the sub=
-
> + * component (if it's about to happen) from calling the master callback=
.
> + */
> +static void lwmi_cd_component_unbind(struct device *cd_dev,
> +				     struct device *om_dev, void *data)
> +{
> +	struct lwmi_cd_priv *priv =3D dev_get_drvdata(cd_dev);
> +
> +	switch (priv->list->type) {
> +	case LENOVO_CAPABILITY_DATA_00:
> +		priv->sub_master->master_dev =3D NULL;
> +		priv->sub_master->master_cb =3D NULL;
> +		return;
> +	default:
> +		return;
> +	}
> +}
> +
>   static const struct component_ops lwmi_cd_component_ops =3D {
>   	.bind =3D lwmi_cd_component_bind,
> +	.unbind =3D lwmi_cd_component_unbind,
> +};
> +
> +/**
> + * lwmi_cd_sub_master_bind() - Bind sub-component of sub-master device
> + * @dev: The sub-master capdata basic device.
> + *
> + * Call component_bind_all to bind the sub-component device to the sub-=
master
> + * device. On success, collect the pointer to the sub-component list an=
d try
> + * to call the master callback.
> + *
> + * Return: 0 on success, or an error code.
> + */
> +static int lwmi_cd_sub_master_bind(struct device *dev)
> +{
> +	struct lwmi_cd_priv *priv =3D dev_get_drvdata(dev);
> +	struct cd_list *sub_component_list;
> +	int ret;
> +
> +	ret =3D component_bind_all(dev, &sub_component_list);
> +	if (ret)
> +		return ret;
> +
> +	priv->sub_master->sub_component_list =3D sub_component_list;
> +	lwmi_cd_call_master_cb(priv);
> +
> +	return 0;
> +}
> +
> +/**
> + * lwmi_cd_sub_master_unbind() - Unbind sub-component of sub-master dev=
ice
> + * @dev: The sub-master capdata basic device
> + *
> + * Clear the collected pointer to the sub-component list to prevent the=
 binding
> + * establishment between the sub-master and the sub-component (if it's =
about to
> + * happen) from calling the master callback. Then, call component_unbin=
d_all to
> + * unbind the sub-component device from the sub-master device.
> + */
> +static void lwmi_cd_sub_master_unbind(struct device *dev)
> +{
> +	struct lwmi_cd_priv *priv =3D dev_get_drvdata(dev);
> +
> +	priv->sub_master->sub_component_list =3D NULL;
> +
> +	component_unbind_all(dev, NULL);
> +}
> +
> +static const struct component_master_ops lwmi_cd_sub_master_ops =3D {
> +	.bind =3D lwmi_cd_sub_master_bind,
> +	.unbind =3D lwmi_cd_sub_master_unbind,
> +};
> +
> +/**
> + * lwmi_cd_sub_master_add() - Register a sub-master with its sub-compon=
ent
> + * @priv: Pointer to the sub-master capdata device private data.
> + * @sub_component_type: Type of the sub-component.
> + *
> + * Match the sub-component type and register the current capdata device=
 as a
> + * sub-master. If the given sub-component type is CD_TYPE_NONE, mark th=
e sub-
> + * component as non-existent without registering sub-master.
> + *
> + * Return: 0 on success, or an error code.
> + */
> +static int lwmi_cd_sub_master_add(struct lwmi_cd_priv *priv,
> +				  enum lwmi_cd_type sub_component_type)
> +{
> +	struct component_match *master_match =3D NULL;
> +	int ret;
> +
> +	priv->sub_master =3D devm_kzalloc(&priv->wdev->dev, sizeof(*priv->sub_=
master), GFP_KERNEL);
> +	if (!priv->sub_master)
> +		return -ENOMEM;
> +
> +	if (sub_component_type =3D=3D CD_TYPE_NONE) {
> +		/* The master callback will be called with NULL on bind. */
> +		priv->sub_master->sub_component_list =3D ERR_PTR(-ENODEV);
> +		priv->sub_master->registered =3D false;
> +		return 0;
> +	}
> +
> +	/*
> +	 * lwmi_cd_match() needs a pointer to enum lwmi_cd_type, but on-stack
> +	 * data cannot be used here. Steal one from lwmi_cd_table.
> +	 */
> +	component_match_add(&priv->wdev->dev, &master_match, lwmi_cd_match,
> +			    (void *)&lwmi_cd_table[sub_component_type].type);
> +	if (IS_ERR(master_match))
> +		return PTR_ERR(master_match);
> +
> +	ret =3D component_master_add_with_match(&priv->wdev->dev, &lwmi_cd_sub=
_master_ops,
> +					      master_match);
> +	if (ret)
> +		return ret;
> +
> +	priv->sub_master->registered =3D true;
> +	return 0;
> +}
> +
> +/**
> + * lwmi_cd_sub_master_del() - Unregister a sub-master if it's registere=
d
> + * @priv: Pointer to the sub-master capdata device private data.
> + */
> +static void lwmi_cd_sub_master_del(struct lwmi_cd_priv *priv)
> +{
> +	if (priv->sub_master->registered) {
> +		component_master_del(&priv->wdev->dev, &lwmi_cd_sub_master_ops);
> +		priv->sub_master->registered =3D false;
> +	}
> +}
> +
> +/**
> + * lwmi_cd_sub_component_bind() - Bind sub-component to sub-master devi=
ce.
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
> +	struct lwmi_cd_priv *priv =3D dev_get_drvdata(sc_dev);
> +	struct cd_list **listp =3D data;
> +
> +	*listp =3D priv->list;
> +
> +	return 0;
> +}
> +
> +static const struct component_ops lwmi_cd_sub_component_ops =3D {
> +	.bind =3D lwmi_cd_sub_component_bind,
>   };
>  =20
>   /**
> @@ -470,9 +708,28 @@ static int lwmi_cd_probe(struct wmi_device *wdev, c=
onst void *context)
>   		goto out;
>  =20
>   	switch (info->type) {
> -	case LENOVO_CAPABILITY_DATA_00:
> +	case LENOVO_CAPABILITY_DATA_00: {
> +		enum lwmi_cd_type sub_component_type =3D LENOVO_FAN_TEST_DATA;
> +		struct capdata00 capdata00;
> +
> +		ret =3D lwmi_cd00_get_data(priv->list, LWMI_ATTR_ID_FAN_TEST, &capdat=
a00);
> +		if (ret || !(capdata00.supported & LWMI_SUPP_VALID)) {
> +			dev_dbg(&wdev->dev, "capdata00 declares no fan test support\n");
> +			sub_component_type =3D CD_TYPE_NONE;
> +		}
> +
> +		/* Sub-master (capdata00) <-> sub-component (capdata_fan) */
> +		ret =3D lwmi_cd_sub_master_add(priv, sub_component_type);
> +		if (ret)
> +			goto out;
> +
> +		/* Master (lenovo-wmi-other) <-> sub-master (capdata00) */
>   		ret =3D component_add(&wdev->dev, &lwmi_cd_component_ops);
> +		if (ret)
> +			lwmi_cd_sub_master_del(priv);
> +
>   		goto out;
> +	}
>   	case LENOVO_CAPABILITY_DATA_01:
>   		priv->acpi_nb.notifier_call =3D lwmi_cd01_notifier_call;
>  =20
> @@ -488,6 +745,7 @@ static int lwmi_cd_probe(struct wmi_device *wdev, co=
nst void *context)
>   		ret =3D component_add(&wdev->dev, &lwmi_cd_component_ops);
>   		goto out;
>   	case LENOVO_FAN_TEST_DATA:
> +		ret =3D component_add(&wdev->dev, &lwmi_cd_sub_component_ops);
>   		goto out;
>   	default:
>   		return -EINVAL;
> @@ -509,10 +767,13 @@ static void lwmi_cd_remove(struct wmi_device *wdev=
)
>  =20
>   	switch (priv->list->type) {
>   	case LENOVO_CAPABILITY_DATA_00:
> +		lwmi_cd_sub_master_del(priv);
> +		fallthrough;
>   	case LENOVO_CAPABILITY_DATA_01:
>   		component_del(&wdev->dev, &lwmi_cd_component_ops);
>   		break;
>   	case LENOVO_FAN_TEST_DATA:
> +		component_del(&wdev->dev, &lwmi_cd_sub_component_ops);
>   		break;
>   	default:
>   		WARN_ON(1);
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platfor=
m/x86/lenovo/wmi-capdata.h
> index 38af4c4e4ef4..59ca3b3e5760 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> @@ -5,8 +5,20 @@
>   #ifndef _LENOVO_WMI_CAPDATA_H_
>   #define _LENOVO_WMI_CAPDATA_H_
>  =20
> +#include <linux/bits.h>
>   #include <linux/types.h>
>  =20
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
>   struct component_match;
>   struct device;
>   struct cd_list;
> @@ -32,9 +44,17 @@ struct capdata_fan {
>   	u32 max_rpm;
>   };
>  =20
> +typedef void (*cd_list_cb_t)(struct device *master_dev, struct cd_list =
*cd_list);
> +
>   struct lwmi_cd_binder {
>   	struct cd_list *cd00_list;
>   	struct cd_list *cd01_list;
> +	/*
> +	 * May be called during or after the bind callback.
> +	 * Will be called with NULL if capdata_fan does not exist.
> +	 * The pointer is only valid in the callback; never keep it for later =
use!
> +	 */
> +	cd_list_cb_t cd_fan_list_cb;
>   };
>  =20
>   void lwmi_cd_match_add_all(struct device *master, struct component_mat=
ch **matchptr);
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/=
x86/lenovo/wmi-other.c
> index f2e1e34d58a9..b3adcc2804fa 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -54,11 +54,6 @@
>   #define LWMI_FEATURE_VALUE_GET 17
>   #define LWMI_FEATURE_VALUE_SET 18
>  =20
> -#define LWMI_ATTR_DEV_ID_MASK GENMASK(31, 24)
> -#define LWMI_ATTR_FEAT_ID_MASK GENMASK(23, 16)
> -#define LWMI_ATTR_MODE_ID_MASK GENMASK(15, 8)
> -#define LWMI_ATTR_TYPE_ID_MASK GENMASK(7, 0)
> -
>   #define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
>  =20
>   static BLOCKING_NOTIFIER_HEAD(om_chain_head);
