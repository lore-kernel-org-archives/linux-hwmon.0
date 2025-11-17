Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91F03176E0
	for <linux-hwmon@vger.kernel.org>; Mon, 17 Nov 2025 15:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763391717; cv=pass; b=CSmro0ybeVPZOEOuyV2N+K+61z5M+fITR81BdnULa/CAZalsVk/f3c+x6+7lgciI7EtkWabVz3sOxdmWEKM82LlpWPVOqtZ2EQ4uefrtkVkQskEwX4zQVVv5b/ztHZNl2VbcilX8oYYvYArsY+WkYfm+d+Ku0FI4jpHDAWp+Xb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763391717; c=relaxed/simple;
	bh=p7gftUWEHyFwUaku0vy0VQd6jSo5HSFs3ckuPgHVsxw=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=gcJM0tG9DYW82Itb8QNTOnnr75rZVHQ6N2fzZ79NKcLrCJVtTe/AdJYWXEDlv/LoqXpnNo9dWnLDoyEYha3KgIEN6LapBQdT9TPSx738NjyIWH2WEHv2hHltHtbPTjk3x+J7mkj9LblciCP/AACklOPAzCJx3o9GgBCbT7Pw0XU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b=M0QQMceq; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b="M0QQMceq"
ARC-Seal: i=1; a=rsa-sha256; t=1763391673; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nVAXgHwdmDcwHLdwzTuvnrqi2GWBqOwO0M0QpJIQQF/s9auMronJ5CZjycaYt01f2+VBdbhm8NCHHXKtWUrKnodfJE83vVtd/T+BjA3jHFMs7hE7ujFDKigXr8ewNFpuWnO7N7l6hmLp+wsPd4GuMtFfU+TEIvevGYOhvMbRYA8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763391673; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jXIwVouwKHUwtIOv9ZSnIafVyjqNkDuRygFifDdBKB0=; 
	b=PVthdJBxPc9mB1/iNZH8WNqfbIQo/GniYn7Kj2uQ8Bh06Oxzws0SYYY50AvM7irrSg8xCShA+IxuUnZsXAasTNGXYcxCaqg/1/GV74wuztTh1j9lRhIsDMbOmn8W5+/WRj4aOc2b7oda7HNdP31esIz7EElpkCZYXrE9eevdQEA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763391673;
	s=zmail; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=jXIwVouwKHUwtIOv9ZSnIafVyjqNkDuRygFifDdBKB0=;
	b=M0QQMceqKVXt/nPCVn4jpOQOKcNR2IW5BWlReBfIVICl6eBs0NRjmzT9QYssLTRK
	kJaqKMoo4r/WTfsAhNx6sTfCFy0Ez8pGaUwYvGNyGS0OkZf6Tru0cSLZpKncS/sM+Wa
	0a2NfcaCTMAxreBB3qen0/Dv8zNo/m3WGn37HFa8=
Received: by mx.zohomail.com with SMTPS id 1763391670698829.9164987731707;
	Mon, 17 Nov 2025 07:01:10 -0800 (PST)
Message-ID: <ce6d4c5e29448bffb7fd83a56449c364e57832d8.camel@rong.moe>
Subject: Re: [PATCH v5 6/7] platform/x86: lenovo-wmi-capdata: Wire up Fan
 Test Data
From: Rong Zhang <i@rong.moe>
To: Armin Wolf <W_Armin@gmx.de>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, Hans de Goede
 <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
 platform-driver-x86@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org
In-Reply-To: <6910e59e-4ae6-4bd1-a432-70e1db4e94ac@gmx.de>
References: <20251114175927.52533-1-i@rong.moe>
		 <20251114175927.52533-7-i@rong.moe>
		 <6910e59e-4ae6-4bd1-a432-70e1db4e94ac@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Nov 2025 22:56:04 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-7 
X-ZohoMailClient: External

Hi Armin,

On Mon, 2025-11-17 at 07:33 +0100, Armin Wolf wrote:
> Am 14.11.25 um 18:59 schrieb Rong Zhang:
>=20
> > A capdata00 attribute (0x04050000) describes the presence of Fan Test
> > Data. Query it, and bind Fan Test Data as a component of capdata00
> > accordingly. The component master of capdata00 may pass a callback whil=
e
> > binding to retrieve fan info from Fan Test Data.
> >=20
> > Summarizing this scheme:
> >=20
> > 	lenovo-wmi-other <-> capdata00 <-> capdata_fan
> > 	|- master            |- component
> > 	                     |- sub-master
> > 	                                   |- sub-component
> >=20
> > The callback will be called once both the master and the sub-component
> > are bound to the sub-master (component).
> >=20
> > This scheme is essential to solve four issues:
> > - The component framework only supports one aggregation per master
> > - A binding is only established until all components are found
> > - The Fan Test Data interface may be missing on some devices
> > - To get rid of queries for the presense of WMI GUIDs
> >=20
> > Signed-off-by: Rong Zhang <i@rong.moe>
> > ---
> > Changes in v5:
> > - Fix missing include (thanks kernel test robot)
> >=20
> > Changes in v4:
> > - New patch in the series (thanks Armin Wolf's inspiration)
> >    - Get rid of wmi_has_guid() (see also [PATCH v4 3/7])
> > ---
> >   drivers/platform/x86/lenovo/wmi-capdata.c | 262 +++++++++++++++++++++=
-
> >   drivers/platform/x86/lenovo/wmi-capdata.h |  20 ++
> >   drivers/platform/x86/lenovo/wmi-other.c   |   5 -
> >   3 files changed, 280 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platfo=
rm/x86/lenovo/wmi-capdata.c
> > index a40b2ed4bd0a..464374d5823c 100644
> > --- a/drivers/platform/x86/lenovo/wmi-capdata.c
> > +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
> > @@ -27,6 +27,7 @@
> >   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> >  =20
> >   #include <linux/acpi.h>
> > +#include <linux/bitfield.h>
> >   #include <linux/cleanup.h>
> >   #include <linux/component.h>
> >   #include <linux/container_of.h>
> > @@ -50,10 +51,17 @@
> >   #define ACPI_AC_CLASS "ac_adapter"
> >   #define ACPI_AC_NOTIFY_STATUS 0x80
> >  =20
> > +#define LWMI_FEATURE_ID_FAN_TEST 0x05
> > +
> > +#define LWMI_ATTR_ID_FAN_TEST							\
> > +	(FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, LWMI_DEVICE_ID_FAN) |		\
> > +	 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, LWMI_FEATURE_ID_FAN_TEST))
> > +
> >   enum lwmi_cd_type {
> >   	LENOVO_CAPABILITY_DATA_00,
> >   	LENOVO_CAPABILITY_DATA_01,
> >   	LENOVO_FAN_TEST_DATA,
> > +	CD_TYPE_NONE =3D -1,
> >   };
> >  =20
> >   #define LWMI_CD_TABLE_ITEM(_type)		\
> > @@ -75,6 +83,20 @@ struct lwmi_cd_priv {
> >   	struct notifier_block acpi_nb; /* ACPI events */
> >   	struct wmi_device *wdev;
> >   	struct cd_list *list;
> > +
> > +	/*
> > +	 * A capdata device may be a component master of another capdata devi=
ce.
> > +	 * E.g., lenovo-wmi-other <-> capdata00 <-> capdata_fan
> > +	 *       |- master            |- component
> > +	 *                            |- sub-master
> > +	 *                                          |- sub-component
> > +	 */
> > +	struct lwmi_cd_sub_master_priv {
> > +		struct device *master_dev;
> > +		cd_list_cb_t master_cb;
> > +		struct cd_list *sub_component_list; /* ERR_PTR(-ENODEV) implies no s=
ub-component. */
> > +		bool registered;                    /* Has the sub-master been regis=
tered? */
> > +	} *sub_master;
> >   };
> >  =20
> >   struct cd_list {
> > @@ -125,7 +147,7 @@ void lwmi_cd_match_add_all(struct device *master, s=
truct component_match **match
> >   		return;
> >  =20
> >   	for (i =3D 0; i < ARRAY_SIZE(lwmi_cd_table); i++) {
> > -		/* Skip optional interfaces. */
> > +		/* Skip sub-components. */
> >   		if (lwmi_cd_table[i].type =3D=3D LENOVO_FAN_TEST_DATA)
> >   			continue;
> >  =20
> > @@ -137,6 +159,56 @@ void lwmi_cd_match_add_all(struct device *master, =
struct component_match **match
> >   }
> >   EXPORT_SYMBOL_NS_GPL(lwmi_cd_match_add_all, "LENOVO_WMI_CD");
> >  =20
> > +/**
> > + * lwmi_cd_call_master_cb() - Call the master callback for the sub-com=
ponent.
> > + * @priv: Pointer to the capability data private data.
> > + *
> > + * Call the master callback and pass the sub-component list to it if t=
he
> > + * dependency chain (master <-> sub-master <-> sub-component) is compl=
ete.
> > + */
> > +static void lwmi_cd_call_master_cb(struct lwmi_cd_priv *priv)
> > +{
> > +	struct cd_list *sub_component_list =3D priv->sub_master->sub_componen=
t_list;
> > +
> > +	/*
> > +	 * Call the callback only if the dependency chain is ready:
> > +	 * - Binding between master and sub-master: fills master_dev and mast=
er_cb
> > +	 * - Binding between sub-master and sub-component: fills sub_componen=
t_list
> > +	 *
> > +	 * If a binding has been unbound before the other binding is bound, t=
he
> > +	 * corresponding members filled by the former are guaranteed to be cl=
eared.
> > +	 *
> > +	 * This function is only called in bind callbacks, and the component
> > +	 * framework guarantees bind/unbind callbacks may never execute
> > +	 * simultaneously, which implies that it's impossible to have a race
> > +	 * condition.
> > +	 *
> > +	 * Hence, this check is sufficient to ensure that the callback is cal=
led
> > +	 * at most once and with the correct state, without relying on a spec=
ific
> > +	 * sequence of binding establishment.
> > +	 */
> > +	if (!sub_component_list ||
> > +	    !priv->sub_master->master_dev ||
> > +	    !priv->sub_master->master_cb)
> > +		return;
> > +
> > +	if (PTR_ERR(sub_component_list) =3D=3D -ENODEV)
> > +		sub_component_list =3D NULL;
> > +	else if (WARN_ON(IS_ERR(sub_component_list)))
> > +		return;
> > +
> > +	priv->sub_master->master_cb(priv->sub_master->master_dev,
> > +				    sub_component_list);
> > +
> > +	/*
> > +	 * Prevent "unbind and rebind" sequences from userspace from calling =
the
> > +	 * callback twice.
> > +	 */
> > +	priv->sub_master->master_cb =3D NULL;
> > +	priv->sub_master->master_dev =3D NULL;
> > +	priv->sub_master->sub_component_list =3D NULL;
> > +}
> > +
> >   /**
> >    * lwmi_cd_component_bind() - Bind component to master device.
> >    * @cd_dev: Pointer to the lenovo-wmi-capdata driver parent device.
> > @@ -147,6 +219,8 @@ EXPORT_SYMBOL_NS_GPL(lwmi_cd_match_add_all, "LENOVO=
_WMI_CD");
> >    * list. This is used to call lwmi_cd*_get_data to look up attribute =
data
> >    * from the lenovo-wmi-other driver.
> >    *
> > + * If cd_dev is a sub-master, try to call the master callback.
> > + *
> >    * Return: 0
> >    */
> >   static int lwmi_cd_component_bind(struct device *cd_dev,
> > @@ -158,6 +232,11 @@ static int lwmi_cd_component_bind(struct device *c=
d_dev,
> >   	switch (priv->list->type) {
> >   	case LENOVO_CAPABILITY_DATA_00:
> >   		binder->cd00_list =3D priv->list;
> > +
> > +		priv->sub_master->master_dev =3D om_dev;
> > +		priv->sub_master->master_cb =3D binder->cd_fan_list_cb;
> > +		lwmi_cd_call_master_cb(priv);
> > +
> >   		break;
> >   	case LENOVO_CAPABILITY_DATA_01:
> >   		binder->cd01_list =3D priv->list;
> > @@ -169,8 +248,167 @@ static int lwmi_cd_component_bind(struct device *=
cd_dev,
> >   	return 0;
> >   }
> >  =20
> > +/**
> > + * lwmi_cd_component_unbind() - Unbind component to master device.
> > + * @cd_dev: Pointer to the lenovo-wmi-capdata driver parent device.
> > + * @om_dev: Pointer to the lenovo-wmi-other driver parent device.
> > + * @data: Unused.
> > + *
> > + * If cd_dev is a sub-master, clear the collected data from the master=
 device to
> > + * prevent the binding establishment between the sub-master and the su=
b-
> > + * component (if it's about to happen) from calling the master callbac=
k.
> > + */
> > +static void lwmi_cd_component_unbind(struct device *cd_dev,
> > +				     struct device *om_dev, void *data)
> > +{
> > +	struct lwmi_cd_priv *priv =3D dev_get_drvdata(cd_dev);
> > +
> > +	switch (priv->list->type) {
> > +	case LENOVO_CAPABILITY_DATA_00:
> > +		priv->sub_master->master_dev =3D NULL;
> > +		priv->sub_master->master_cb =3D NULL;
> > +		return;
> > +	default:
> > +		return;
> > +	}
> > +}
> > +
> >   static const struct component_ops lwmi_cd_component_ops =3D {
> >   	.bind =3D lwmi_cd_component_bind,
> > +	.unbind =3D lwmi_cd_component_unbind,
> > +};
> > +
> > +/**
> > + * lwmi_cd_sub_master_bind() - Bind sub-component of sub-master device
> > + * @dev: The sub-master capdata basic device.
> > + *
> > + * Call component_bind_all to bind the sub-component device to the sub=
-master
> > + * device. On success, collect the pointer to the sub-component list a=
nd try
> > + * to call the master callback.
> > + *
> > + * Return: 0 on success, or an error code.
> > + */
> > +static int lwmi_cd_sub_master_bind(struct device *dev)
> > +{
> > +	struct lwmi_cd_priv *priv =3D dev_get_drvdata(dev);
> > +	struct cd_list *sub_component_list;
> > +	int ret;
> > +
> > +	ret =3D component_bind_all(dev, &sub_component_list);
> > +	if (ret)
> > +		return ret;
> > +
> > +	priv->sub_master->sub_component_list =3D sub_component_list;
> > +	lwmi_cd_call_master_cb(priv);
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * lwmi_cd_sub_master_unbind() - Unbind sub-component of sub-master de=
vice
> > + * @dev: The sub-master capdata basic device
> > + *
> > + * Clear the collected pointer to the sub-component list to prevent th=
e binding
> > + * establishment between the sub-master and the sub-component (if it's=
 about to
> > + * happen) from calling the master callback. Then, call component_unbi=
nd_all to
> > + * unbind the sub-component device from the sub-master device.
> > + */
> > +static void lwmi_cd_sub_master_unbind(struct device *dev)
> > +{
> > +	struct lwmi_cd_priv *priv =3D dev_get_drvdata(dev);
> > +
> > +	priv->sub_master->sub_component_list =3D NULL;
> > +
> > +	component_unbind_all(dev, NULL);
> > +}
> > +
> > +static const struct component_master_ops lwmi_cd_sub_master_ops =3D {
> > +	.bind =3D lwmi_cd_sub_master_bind,
> > +	.unbind =3D lwmi_cd_sub_master_unbind,
> > +};
> > +
> > +/**
> > + * lwmi_cd_sub_master_add() - Register a sub-master with its sub-compo=
nent
> > + * @priv: Pointer to the sub-master capdata device private data.
> > + * @sub_component_type: Type of the sub-component.
> > + *
> > + * Match the sub-component type and register the current capdata devic=
e as a
> > + * sub-master. If the given sub-component type is CD_TYPE_NONE, mark t=
he sub-
> > + * component as non-existent without registering sub-master.
> > + *
> > + * Return: 0 on success, or an error code.
> > + */
> > +static int lwmi_cd_sub_master_add(struct lwmi_cd_priv *priv,
> > +				  enum lwmi_cd_type sub_component_type)
> > +{
> > +	struct component_match *master_match =3D NULL;
> > +	int ret;
> > +
> > +	priv->sub_master =3D devm_kzalloc(&priv->wdev->dev, sizeof(*priv->sub=
_master), GFP_KERNEL);
> > +	if (!priv->sub_master)
> > +		return -ENOMEM;
> > +
> > +	if (sub_component_type =3D=3D CD_TYPE_NONE) {
> > +		/* The master callback will be called with NULL on bind. */
> > +		priv->sub_master->sub_component_list =3D ERR_PTR(-ENODEV);
> > +		priv->sub_master->registered =3D false;
> > +		return 0;
> > +	}
> > +
> > +	/*
> > +	 * lwmi_cd_match() needs a pointer to enum lwmi_cd_type, but on-stack
> > +	 * data cannot be used here. Steal one from lwmi_cd_table.
> > +	 */
> > +	component_match_add(&priv->wdev->dev, &master_match, lwmi_cd_match,
> > +			    (void *)&lwmi_cd_table[sub_component_type].type);
> > +	if (IS_ERR(master_match))
> > +		return PTR_ERR(master_match);
> > +
> > +	ret =3D component_master_add_with_match(&priv->wdev->dev, &lwmi_cd_su=
b_master_ops,
> > +					      master_match);
> > +	if (ret)
> > +		return ret;
> > +
> > +	priv->sub_master->registered =3D true;
> > +	return 0;
> > +}
> > +
> > +/**
> > + * lwmi_cd_sub_master_del() - Unregister a sub-master if it's register=
ed
> > + * @priv: Pointer to the sub-master capdata device private data.
> > + */
> > +static void lwmi_cd_sub_master_del(struct lwmi_cd_priv *priv)
> > +{
> > +	if (priv->sub_master->registered) {
> > +		component_master_del(&priv->wdev->dev, &lwmi_cd_sub_master_ops);
> > +		priv->sub_master->registered =3D false;
> > +	}
> > +}
> > +
> > +/**
> > + * lwmi_cd_sub_component_bind() - Bind sub-component to sub-master dev=
ice.
> > + * @sc_dev: Pointer to the sub-component capdata parent device.
> > + * @sm_dev: Pointer to the sub-master capdata parent device.
> > + * @data: Pointer used to return the capability data list pointer.
> > + *
> > + * On sub-master's bind, provide a pointer to the local capdata list.
> > + * This is used by the sub-master to call the master callback.
> > + *
> > + * Return: 0
> > + */
> > +static int lwmi_cd_sub_component_bind(struct device *sc_dev,
> > +				      struct device *sm_dev, void *data)
> > +{
> > +	struct lwmi_cd_priv *priv =3D dev_get_drvdata(sc_dev);
> > +	struct cd_list **listp =3D data;
> > +
> > +	*listp =3D priv->list;
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct component_ops lwmi_cd_sub_component_ops =3D {
> > +	.bind =3D lwmi_cd_sub_component_bind,
> >   };
> >  =20
> >   /**
> > @@ -470,9 +708,25 @@ static int lwmi_cd_probe(struct wmi_device *wdev, =
const void *context)
> >   		goto out;
> >  =20
> >   	switch (info->type) {
> > -	case LENOVO_CAPABILITY_DATA_00:
> > +	case LENOVO_CAPABILITY_DATA_00: {
> > +		enum lwmi_cd_type sub_component_type =3D LENOVO_FAN_TEST_DATA;
> > +		struct capdata00 capdata00;
> > +
> > +		ret =3D lwmi_cd00_get_data(priv->list, LWMI_ATTR_ID_FAN_TEST, &capda=
ta00);
> > +		if (ret || !(capdata00.supported & LWMI_SUPP_VALID)) {
> > +			dev_dbg(&wdev->dev, "capdata00 declares no fan test support\n");
> > +			sub_component_type =3D CD_TYPE_NONE;
> > +		}
> > +
> > +		/* Sub-master (capdata00) <-> sub-component (capdata_fan) */
> > +		ret =3D lwmi_cd_sub_master_add(priv, sub_component_type);
> > +		if (ret)
> > +			goto out;
> > +
> > +		/* Master (lenovo-wmi-other) <-> sub-master (capdata00) */
> >   		ret =3D component_add(&wdev->dev, &lwmi_cd_component_ops);
> >   		goto out;
>=20
> Why not simply registering the component for the master inside the bind c=
allback
> of the submaster?

Calling=C2=A0component_add()[1] in any bind/unbind callbacks causes deadloc=
k
because the contexts of bind/unbind callbacks are protected by
component_mutex while component_add() acquires it again.

That's why I proposed using a work to call component_add() in my
previous reply[2]. However, even my previous proposal was too fragile
to adopt. It still causes deadlock if component_mutex is already held
by the context of unbind callback before the started work acquires it.
Consider the following execution sequence:

lwmi_cd_sub_master_bind()
- schedule_work(sub_master_add_as_a_component_work)

(CPU 0) sub_master_add_as_a_component_work
- started, about to call mutex_lock(&component_mutex)
  (drivers/base/component.c:745)

(CPU 1) lwmi_cd_sub_master_unbind()
- cancel_work_sync(sub_master_add_as_a_component_work)

Calling cancel_work_sync() on a started work will never return until
the work is finished, but the work will soon be blocked by
mutex_lock(&component_mutex) until the unbind callback is finished.

[1]: As well as component_del(), component_master_add_with_match(),
     component_master_del(), component_master_is_bound().
[2]: https://lore.kernel.org/r/4bcdd4a629b2d46bd4988eb347ce944af9943773.cam=
el@rong.moe/

> If fan test data is present, then you simply register the submaster
> and register the component inside the bind callback of the submaster. If =
no fan test
> data is present, then you skip registration of the submaster and register=
 the component
> directly.

The dilemma on component_mutex made me think: instead of working around
it, why not take advantage of the protection it provides?

This thought inspired me to implement lwmi_cd_call_master_cb() with
proper synchronization provided by the sub-master/component bind/unbind
callbacks, which fill or clear priv->sub_master members accordingly. In
such a scheme, capdata00 can be registered as a master and a component
in any order[3].

If no fan test data is present, lwmi_cd_sub_master_add(priv,
CD_TYPE_NONE) will be called, resulting in priv->sub_master being
allocated without registering capdata00 as a master. Then,
cd_fan_list_cb is called with NULL once capdata00 binds to lenovo-wmi-
other (master).

Embarrassingly, I just realized that I forgot to add a failing path for
component_add(capdata00). I will send out a [PATCH v6] fixing this once
Derek tests the series. Derek, hope you had a refreshing weekend out of
town ;)

[3]: The current implementation calls lwmi_cd_sub_master_add() first to
simplify some code paths (e.g., no need to check priv->sub_master !=3D
NULL afterward).

> The basic idea however seems fine to me.
>=20
> Thanks,
> Armin Wolf

Thanks,
Rong

> > +	}
> >   	case LENOVO_CAPABILITY_DATA_01:
> >   		priv->acpi_nb.notifier_call =3D lwmi_cd01_notifier_call;
> >  =20
> > @@ -488,6 +742,7 @@ static int lwmi_cd_probe(struct wmi_device *wdev, c=
onst void *context)
> >   		ret =3D component_add(&wdev->dev, &lwmi_cd_component_ops);
> >   		goto out;
> >   	case LENOVO_FAN_TEST_DATA:
> > +		ret =3D component_add(&wdev->dev, &lwmi_cd_sub_component_ops);
> >   		goto out;
> >   	default:
> >   		return -EINVAL;
> > @@ -509,10 +764,13 @@ static void lwmi_cd_remove(struct wmi_device *wde=
v)
> >  =20
> >   	switch (priv->list->type) {
> >   	case LENOVO_CAPABILITY_DATA_00:
> > +		lwmi_cd_sub_master_del(priv);
> > +		fallthrough;
> >   	case LENOVO_CAPABILITY_DATA_01:
> >   		component_del(&wdev->dev, &lwmi_cd_component_ops);
> >   		break;
> >   	case LENOVO_FAN_TEST_DATA:
> > +		component_del(&wdev->dev, &lwmi_cd_sub_component_ops);
> >   		break;
> >   	default:
> >   		WARN_ON(1);
> > diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platfo=
rm/x86/lenovo/wmi-capdata.h
> > index 38af4c4e4ef4..59ca3b3e5760 100644
> > --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> > +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> > @@ -5,8 +5,20 @@
> >   #ifndef _LENOVO_WMI_CAPDATA_H_
> >   #define _LENOVO_WMI_CAPDATA_H_
> >  =20
> > +#include <linux/bits.h>
> >   #include <linux/types.h>
> >  =20
> > +#define LWMI_SUPP_VALID		BIT(0)
> > +#define LWMI_SUPP_MAY_GET	(LWMI_SUPP_VALID | BIT(1))
> > +#define LWMI_SUPP_MAY_SET	(LWMI_SUPP_VALID | BIT(2))
> > +
> > +#define LWMI_ATTR_DEV_ID_MASK	GENMASK(31, 24)
> > +#define LWMI_ATTR_FEAT_ID_MASK	GENMASK(23, 16)
> > +#define LWMI_ATTR_MODE_ID_MASK	GENMASK(15, 8)
> > +#define LWMI_ATTR_TYPE_ID_MASK	GENMASK(7, 0)
> > +
> > +#define LWMI_DEVICE_ID_FAN	0x04
> > +
> >   struct component_match;
> >   struct device;
> >   struct cd_list;
> > @@ -32,9 +44,17 @@ struct capdata_fan {
> >   	u32 max_rpm;
> >   };
> >  =20
> > +typedef void (*cd_list_cb_t)(struct device *master_dev, struct cd_list=
 *cd_list);
> > +
> >   struct lwmi_cd_binder {
> >   	struct cd_list *cd00_list;
> >   	struct cd_list *cd01_list;
> > +	/*
> > +	 * May be called during or after the bind callback.
> > +	 * Will be called with NULL if capdata_fan does not exist.
> > +	 * The pointer is only valid in the callback; never keep it for later=
 use!
> > +	 */
> > +	cd_list_cb_t cd_fan_list_cb;
> >   };
> >  =20
> >   void lwmi_cd_match_add_all(struct device *master, struct component_ma=
tch **matchptr);
> > diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform=
/x86/lenovo/wmi-other.c
> > index f2e1e34d58a9..b3adcc2804fa 100644
> > --- a/drivers/platform/x86/lenovo/wmi-other.c
> > +++ b/drivers/platform/x86/lenovo/wmi-other.c
> > @@ -54,11 +54,6 @@
> >   #define LWMI_FEATURE_VALUE_GET 17
> >   #define LWMI_FEATURE_VALUE_SET 18
> >  =20
> > -#define LWMI_ATTR_DEV_ID_MASK GENMASK(31, 24)
> > -#define LWMI_ATTR_FEAT_ID_MASK GENMASK(23, 16)
> > -#define LWMI_ATTR_MODE_ID_MASK GENMASK(15, 8)
> > -#define LWMI_ATTR_TYPE_ID_MASK GENMASK(7, 0)
> > -
> >   #define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
> >  =20
> >   static BLOCKING_NOTIFIER_HEAD(om_chain_head);
