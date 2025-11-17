Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5764C238D5A;
	Mon, 17 Nov 2025 06:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763361234; cv=none; b=GdLOj4FmfIUYBGGXxiFHTA3c1wD5/UdBOyPWMgVufildq5STJkZsV0bHCeFkmEcFKQ70983QBJOQZ/7oDi0MTe2arvX22NJpZ97LMTbqZkD0npBubQ30c0tmX/x0EFeLAgE+8jaEmzQ8XzdFCAwnY3MgVPM9Uqt+DJ8yX4J3u9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763361234; c=relaxed/simple;
	bh=eLUYYzV/U5npmmYY0BZrsCysoN1We9wuLhehVZxMcn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H1WotkNC/ITPD2qImGgUuzKEFZPbxJrfD28ydrbHaumhe6WC9NpwcFccPURoJiuN9FCMGoeiqyMmADyU0sV/FJjEKlDmeMQrTbrDbd4FHcEBIuXTY+DArAxYh2/27RkpJuDDFkgWRAK8/w3FmqRpKubt4lqh7GDUEKcZKCD+qX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=fxEzL3GC; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="fxEzL3GC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763361229; x=1763966029; i=w_armin@gmx.de;
	bh=Wtt8CdUOfG7Uq+rnH5gmnj/AnIrSV10r6SH1XyV0QDU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=fxEzL3GCcCijLP/wXBA+Iak51+7JU3Uc7x9ZUXwRzZUDre9f0gkyA4aQFSFCex8K
	 cRibcY3ZDn1iMghFeo7vgmY97K28f3HrbwB6eFCIeShnIfYi8BcYxrMHPDHum3pcu
	 eTIbmJHGfApq/loHeNW38xsIK+rYy6JVaefEH6vtTm4QWA6BPxrBTsLrAJzkau2QV
	 Ps6qH/uzhgMv8pLNE5iAgXrCY0a8Ah+VDZ4sfkUzdMB1jft0TiT7B58hMfGvg6skX
	 QBQ2w5UN1Vx/paInKeKPorELsUklP4NPy3WeC4jvzscWwPu5Uz7+lDxC5cbctyMU9
	 D8gx3WwB8KTj5E+1sA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Ml6mE-1w1gob0O5M-00ZtIf; Mon, 17
 Nov 2025 07:33:49 +0100
Message-ID: <6910e59e-4ae6-4bd1-a432-70e1db4e94ac@gmx.de>
Date: Mon, 17 Nov 2025 07:33:46 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] platform/x86: lenovo-wmi-capdata: Wire up Fan Test
 Data
To: Rong Zhang <i@rong.moe>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20251114175927.52533-1-i@rong.moe>
 <20251114175927.52533-7-i@rong.moe>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20251114175927.52533-7-i@rong.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Tlt36/mg7wb6JEl2/cGznLRzl5F9No40GMNoxTTUAjOblIfrR1A
 bVssv73acablcbKgik3RkP1D5zvIXP1vrEoe5Hw3LWo0vzq1HmuPsN9klLHAB0TM4Ip1KeM
 WrUg5OgDT5b1bLJOEBG4vgQf1fyVdpCL/QB3Ly1kuat2IYu5vz3e+/MRcsYsPIL1+9f+F66
 XGH4ecKvhDcYwvutEsyyg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:I05crM9CSvI=;zI34Yt2JkNvmiNveYUqIdHTD78o
 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

Am 14.11.25 um 18:59 schrieb Rong Zhang:

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
> This scheme is essential to solve four issues:
> - The component framework only supports one aggregation per master
> - A binding is only established until all components are found
> - The Fan Test Data interface may be missing on some devices
> - To get rid of queries for the presense of WMI GUIDs
>
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
> Changes in v5:
> - Fix missing include (thanks kernel test robot)
>
> Changes in v4:
> - New patch in the series (thanks Armin Wolf's inspiration)
>    - Get rid of wmi_has_guid() (see also [PATCH v4 3/7])
> ---
>   drivers/platform/x86/lenovo/wmi-capdata.c | 262 +++++++++++++++++++++-
>   drivers/platform/x86/lenovo/wmi-capdata.h |  20 ++
>   drivers/platform/x86/lenovo/wmi-other.c   |   5 -
>   3 files changed, 280 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platfor=
m/x86/lenovo/wmi-capdata.c
> index a40b2ed4bd0a..464374d5823c 100644
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
> @@ -470,9 +708,25 @@ static int lwmi_cd_probe(struct wmi_device *wdev, c=
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
>   		goto out;

Why not simply registering the component for the master inside the bind ca=
llback
of the submaster? If fan test data is present, then you simply register th=
e submaster
and register the component inside the bind callback of the submaster. If n=
o fan test
data is present, then you skip registration of the submaster and register =
the component
directly.

The basic idea however seems fine to me.

Thanks,
Armin Wolf

> +	}
>   	case LENOVO_CAPABILITY_DATA_01:
>   		priv->acpi_nb.notifier_call =3D lwmi_cd01_notifier_call;
>  =20
> @@ -488,6 +742,7 @@ static int lwmi_cd_probe(struct wmi_device *wdev, co=
nst void *context)
>   		ret =3D component_add(&wdev->dev, &lwmi_cd_component_ops);
>   		goto out;
>   	case LENOVO_FAN_TEST_DATA:
> +		ret =3D component_add(&wdev->dev, &lwmi_cd_sub_component_ops);
>   		goto out;
>   	default:
>   		return -EINVAL;
> @@ -509,10 +764,13 @@ static void lwmi_cd_remove(struct wmi_device *wdev=
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
