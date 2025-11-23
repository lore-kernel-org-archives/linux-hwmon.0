Received: from sender3-op-o15.zoho.com (sender3-op-o15.zoho.com [136.143.184.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE17145355;
	Sun, 23 Nov 2025 15:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763910465; cv=pass; b=hPvGq+ov5F5RSqlAXp8e6iAXoj62dADq5ovJ5FUY4G3P91L1ubocT75pzLClvFGpgS2IzYvUKXtQ+B9ksXFuQpSenPGRGRZrgH6M7x9yEw19yPfMXzOnVRPil0IWaMKWZBTcIa/dS234rebh85D70muBEjL7abWcdW5jgsUL6eo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763910465; c=relaxed/simple;
	bh=i0yAOL2NfFf9v3aKlkdyW3mh0+1j9hMdYq3DGBTD09Y=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=WJdk2YkJ6Tur8tMVjyxmoSaGD7gRl+4NR/CU8yyXmC9STqW9ALopZ3KOvVntre2a2IYFUM3Bs3ptIF147T6608WSUAlcsa1ZaBbb/0cJXTASFM2cmacOIbx0lA9KIgp/LsHHbYhJb8MB0aqwWaWCepPovGtuUzb1zujqABCCcTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b=eH1y7y03; arc=pass smtp.client-ip=136.143.184.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b="eH1y7y03"
ARC-Seal: i=1; a=rsa-sha256; t=1763910436; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Skw0rzLXIqSgeSKbisApxKAJtoAenL53x0xva82snwfi3k0IkoPWTdRjRmpSxb5RPKdg8HVZMkmfwmWidUKCoB0ihOdyrGIZisqjX9F1/4I4Hc7brjDT08ZMv7OdGbCh7uz269rT8Auwbx6k/9F7DI6HFFYhMmzkHZ48B7Gf7oo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763910436; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jv4Mv5Ezm4orw5FehJ1phpdw9hCLfrcVW8gxSKjRpgk=; 
	b=E9R4/AaL7TLFEraVdJUkOlYlmL8iEMv4V4BPP8YtoiqQqPlsBdODIZlNm76Qp9WyoVaVwpZAMr+7T21vtdX9RvLZa2eiZPyj2ST3E3/C4to+mkbkJ1Z8sagGDsSnJsKcPd2zIxdjCmzwvNCR1sE450+SZDparwULA7+egwxGiGA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763910436;
	s=zmail; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=jv4Mv5Ezm4orw5FehJ1phpdw9hCLfrcVW8gxSKjRpgk=;
	b=eH1y7y03xoUvfLyJ5gvQbljhhMcfr8hkUkV5P8hJATVSFQH13SkJCJ+90Opq2wJG
	t0ByJ5pUue5e8Qt0Bcw/N725UmMq4q7aayStjtv61PpJDmi+NMUAl0eDkCTk7Ri6VBw
	X9mqlyRNT9lZxduVRJBbpO9BL9pw4M1pQavacTqw=
Received: by mx.zohomail.com with SMTPS id 1763910434403714.9911802366428;
	Sun, 23 Nov 2025 07:07:14 -0800 (PST)
Message-ID: <667b29838d39f7bac2a754c4f0720e33ead556f8.camel@rong.moe>
Subject: Re: [PATCH v6 6/7] platform/x86: lenovo-wmi-capdata: Wire up Fan
 Test Data
From: Rong Zhang <i@rong.moe>
To: Armin Wolf <W_Armin@gmx.de>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, Hans de Goede
 <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
 platform-driver-x86@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org
In-Reply-To: <9340b459-2d25-4767-8a47-765a71477d8f@gmx.de>
References: <20251122184522.18677-1-i@rong.moe>
	 <20251122184522.18677-7-i@rong.moe>
	 <9340b459-2d25-4767-8a47-765a71477d8f@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 23 Nov 2025 23:02:04 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-7 
X-ZohoMailClient: External

Hi Armin,

On Sun, 2025-11-23 at 04:36 +0100, Armin Wolf wrote:
> Am 22.11.25 um 19:44 schrieb Rong Zhang:
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
> > This scheme is essential to solve these issues:
> > - The component framework only supports one aggregation per master
> > - A binding is only established until all components are found
> > - The Fan Test Data interface may be missing on some devices
> > - To get rid of queries for the presense of WMI GUIDs
> >=20
> > capdata00 is registered as a component and a sub-master on probe,
> > instead of chaining the registerations in one's bind callback. This is
> > because calling (un)registration methods of the component framework
> > causes deadlock in (un)bind callbacks, i.e., it's impossible to registe=
r
> > capdata00 as a sub-master/component in its component/sub-master bind
> > callback, and vice versa.
>=20
> I spend some time trying to understand all of this, and i have come to th=
e conclusion
> that while passing a callback between both component masters, it still is=
 not exactly
> clean.

Could you elaborate? Thanks.

> Can you instead use devm_lwmi_om_register_notifier() and define another e=
vent for querying
> the fan data? This way we could ditch the component submaster with all of=
 the callback madness.

Thanks for your review and suggestion.

At first I thought the notifier approach was nice, however...

There are two directions to use the notifier framework:
(1) lenovo-wmi-other calls blocking_notifier_call_chain() to query
    capdata_fan
(2) capdata_fan calls blocking_notifier_call_chain() to provide data
    to lenovo-wmi-other

Both requires some assumptions on probing/binding sequence:
(1) capdata_fan must be probed before lenovo-wmi-other calling
    blocking_notifier_call_chain(), otherwise lenovo-wmi-other will
    mistakenly believe capdata_fan is missing
(2) lenovo-wmi-other must be probed before capdata_fan calling
    blocking_notifier_call_chain(), otherwise lenovo-wmi-other will
    wait for fan info forever

So eventually we need *both directions* to break the assumptions on
probing/binding sequence. Moreover, some extra synchronization
primitives may be required to make sure the binding between lenovo-wmi-
other and capdata00&01 won't be unbind while registering the HWMON
device.

> Sorry for being the one for suggesting the submaster approach in the firs=
t place, i did not
> know that the component framework is so limited when it comes to nested c=
omponent masters :/

I'd say the sub-master approach is still the least ugly one.

The callback is always called in a bind callback. Hence, the component
framework protects our sanity, so we don't need to worry about the
other side of our component chain being messed up while handling one
side. The approach doesn't need any assumption on binding sequence as
the corresponding bind/unbind callbacks effectively create a state
machine.

> If Mark is OK with using the submaster approach then you can ignore the a=
bove suggestion.
>=20
> Thanks,
> Armin Wolf

Thanks,
Rong

> > Signed-off-by: Rong Zhang <i@rong.moe>
> > ---
> > Changes in v6:
> > - Fix the error path of component_add(capdata00)
> > - Elaborate the design in commit message
> >=20
> > Changes in v5:
> > - Fix missing include (thanks kernel test robot)
> >=20
> > Changes in v4:
> > - New patch in the series (thanks Armin Wolf's inspiration)
> >    - Get rid of wmi_has_guid() (see also [PATCH v4 3/7])
> > ---
> >   drivers/platform/x86/lenovo/wmi-capdata.c | 265 +++++++++++++++++++++=
-
> >   drivers/platform/x86/lenovo/wmi-capdata.h |  20 ++
> >   drivers/platform/x86/lenovo/wmi-other.c   |   5 -
> >   3 files changed, 283 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platfo=
rm/x86/lenovo/wmi-capdata.c
> > index e6392357395c..8760f8c071ca 100644
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
> > @@ -470,9 +708,28 @@ static int lwmi_cd_probe(struct wmi_device *wdev, =
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
> > +		if (ret)
> > +			lwmi_cd_sub_master_del(priv);
> > +
> >   		goto out;
> > +	}
> >   	case LENOVO_CAPABILITY_DATA_01:
> >   		priv->acpi_nb.notifier_call =3D lwmi_cd01_notifier_call;
> >  =20
> > @@ -488,6 +745,7 @@ static int lwmi_cd_probe(struct wmi_device *wdev, c=
onst void *context)
> >   		ret =3D component_add(&wdev->dev, &lwmi_cd_component_ops);
> >   		goto out;
> >   	case LENOVO_FAN_TEST_DATA:
> > +		ret =3D component_add(&wdev->dev, &lwmi_cd_sub_component_ops);
> >   		goto out;
> >   	default:
> >   		return -EINVAL;
> > @@ -509,10 +767,13 @@ static void lwmi_cd_remove(struct wmi_device *wde=
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
