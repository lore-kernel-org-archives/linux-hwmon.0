Received: from sender3-op-o15.zoho.com (sender3-op-o15.zoho.com [136.143.184.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FA632E14C;
	Mon, 24 Nov 2025 20:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764014946; cv=pass; b=tbuY813N/vIu7lrQXpYDATSh6O+g/vnY1DtY9P1mvdMCKTjvkQ1kLt7oSor9qIh5lHuRamKDqAmS+AeCBk5nhZ5CTFDsb5JjAEeaNqJkus9v63uxD1XXawovAGC4fZ18n4SGWHsbWomxoeCmqstwa6yk44yNog/RRhPjm2VB85U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764014946; c=relaxed/simple;
	bh=LLVzT8ybTCCSFgtLUAwAGgqkpgPbZB6kyONt1S5WUAc=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Am4H0UsZurufzh7eZkP60FYuN6o6hX7J63HMgoWDiKsU5zyQR38YjveNrDtgpkSkbRd1zmqlBUoQFBIbsYqos5976Ktf7Evkc6H3Ybk9BWXbqxqdmgCy5U02LIYA0aU1KnyFUX9V7dyltdAs5iTpE4I+zM4J8VrNKAUdEpyWQKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b=MYA+FTTg; arc=pass smtp.client-ip=136.143.184.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b="MYA+FTTg"
ARC-Seal: i=1; a=rsa-sha256; t=1764014922; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=i3pa74hrg2xiwyOzEW59NgwYDu1eTM1fFRmSf9kpYTflRAa/D9UB3JE/XJ/8w6/llKc2lsy05IWaDdOM6igq/pwbUIurYaI2onEzM8cWsN+DtNgrPTSXmnoGNIlPCqWTdra+zLfQBKfebQb+nuHyOxmCb1beng7/r2ytiH5jON4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764014922; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ql/aUvVF9oTKKrxNvh90kiGHsGNEGi5OgVkc3pBXilQ=; 
	b=OHhcb8ATsNWAGtbiGOTJ8ecq1GUGkheRdsbfs8RgwMcV/WM1fxjagl49s3j4Z8mh73f0ccAv7E+ibvdIkwDUgsRi653s7YzhbYR9rD1JHceXLZ5hRptlN6/UUr9VUik22nXxx9oOqnRdh9WFTpwO/siccH8ilZPfAU3pydc4/nE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764014922;
	s=zmail; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=Ql/aUvVF9oTKKrxNvh90kiGHsGNEGi5OgVkc3pBXilQ=;
	b=MYA+FTTgPcgjJNtdY/VK4ZVBxg9Qy33UxqCRereqCX7yoOsEpDfy+sbLLfo3unc7
	zgzhjZRz+3Yb1udhEH7Wpy+eR7zU4mBQlZyuWTjjA/ziEOA5c5O/Ys14MiL37ymmoZo
	reOY05gIvjdNCHEvFeOv8tJ5Q7NtOtQijzl+YJfg=
Received: by mx.zohomail.com with SMTPS id 1764014919719531.3972484889521;
	Mon, 24 Nov 2025 12:08:39 -0800 (PST)
Message-ID: <c4fb31c20154780008473f90e5bfa4399ef2db7c.camel@rong.moe>
Subject: Re: [PATCH v6 3/7] platform/x86: lenovo-wmi-{capdata,other}:
 Support multiple Capability Data
From: Rong Zhang <i@rong.moe>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Rong Zhang <i@rong.moe>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, Armin Wolf <W_Armin@gmx.de>,
 Hans de Goede <hansg@kernel.org>,  Guenter Roeck <linux@roeck-us.net>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	linux-hwmon@vger.kernel.org
In-Reply-To: <f3956fab-04b5-c86d-2625-4e8bdf81b697@linux.intel.com>
References: <20251122184522.18677-1-i@rong.moe>
	 <20251122184522.18677-4-i@rong.moe>
	 <f3956fab-04b5-c86d-2625-4e8bdf81b697@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Nov 2025 04:03:34 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-7 
X-ZohoMailClient: External

Hi Ilpo,

Thanks for your review.

On Mon, 2025-11-24 at 18:30 +0200, Ilpo J=C3=A4rvinen wrote:
> On Sun, 23 Nov 2025, Rong Zhang wrote:
>=20
> > The current implementation are heavily bound to capdata01. Rewrite it s=
o
> > that it is suitable to utilize other Capability Data as well.
> >=20
> > No functional change intended.
> >=20
> > Signed-off-by: Rong Zhang <i@rong.moe>
> > Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > ---
> > Changes in v6:
> > - Fix the error path of lwmi_cd_match_add_all()
> >   - IS_ERR(matchptr) =3D> IS_ERR(*matchptr)
> >=20
> > Changes in v5:
> > - Do not cast pointer to non-pointer or vice versa (thanks kernel test
> >   robot)
> >=20
> > Changes in v4:
> > - Get rid of wmi_has_guid() (thanks Armin Wolf)
> >   - More changes in [PATCH v4 6/7]
> > - Prepare for [PATCH v4 6/7]
> >   - Move lwmi_cd_match*() forward
> >   - Use switch-case in lwmi_cd_remove()
> >=20
> > Changes in v2:
> > - Fix function parameter 'type' not described in 'lwmi_cd_match' (thank=
s
> >   kernel test bot)
> > ---
> >  drivers/platform/x86/lenovo/wmi-capdata.c | 225 +++++++++++++++++-----
> >  drivers/platform/x86/lenovo/wmi-capdata.h |   7 +-
> >  drivers/platform/x86/lenovo/wmi-other.c   |  16 +-
> >  3 files changed, 189 insertions(+), 59 deletions(-)
> >=20
> > diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platfo=
rm/x86/lenovo/wmi-capdata.c
> > index c5e74b2bfeb3..e0710354278a 100644
> > --- a/drivers/platform/x86/lenovo/wmi-capdata.c
> > +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
> > @@ -12,8 +12,13 @@
> >   *
> >   * Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> >   *   - Initial implementation (formerly named lenovo-wmi-capdata01)
> > + *
> > + * Copyright (C) 2025 Rong Zhang <i@rong.moe>
> > + *   - Unified implementation
> >   */
> > =20
> > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > +
> >  #include <linux/acpi.h>
> >  #include <linux/cleanup.h>
> >  #include <linux/component.h>
> > @@ -36,6 +41,23 @@
> >  #define ACPI_AC_CLASS "ac_adapter"
> >  #define ACPI_AC_NOTIFY_STATUS 0x80
> > =20
> > +enum lwmi_cd_type {
> > +	LENOVO_CAPABILITY_DATA_01,
> > +};
> > +
> > +#define LWMI_CD_TABLE_ITEM(_type)		\
> > +	[_type] =3D {				\
> > +		.name =3D #_type,			\
> > +		.type =3D _type,			\
> > +	}
> > +
> > +static const struct lwmi_cd_info {
> > +	const char *name;
> > +	enum lwmi_cd_type type;
> > +} lwmi_cd_table[] =3D {
> > +	LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_01),
> > +};
> > +
> >  struct lwmi_cd_priv {
> >  	struct notifier_block acpi_nb; /* ACPI events */
> >  	struct wmi_device *wdev;
> > @@ -44,15 +66,63 @@ struct lwmi_cd_priv {
> > =20
> >  struct cd_list {
> >  	struct mutex list_mutex; /* list R/W mutex */
> > +	enum lwmi_cd_type type;
> >  	u8 count;
> > -	struct capdata01 data[];
> > +
> > +	union {
> > +		DECLARE_FLEX_ARRAY(struct capdata01, cd01);
>=20
> Add #include

It's embarrassing that I always forget #include... Sorry for that.

Will fix this and the following missing #include. Thanks.

> > +	};
> >  };
> > =20
> > +static struct wmi_driver lwmi_cd_driver;
> > +
> > +/**
> > + * lwmi_cd_match() - Match rule for the master driver.
> > + * @dev: Pointer to the capability data parent device.
> > + * @type: Pointer to capability data type (enum lwmi_cd_type *) to mat=
ch.
> > + *
> > + * Return: int.
> > + */
> > +static int lwmi_cd_match(struct device *dev, void *type)
> > +{
> > +	struct lwmi_cd_priv *priv;
> > +
> > +	if (dev->driver !=3D &lwmi_cd_driver.driver)
> > +		return false;
> > +
> > +	priv =3D dev_get_drvdata(dev);
> > +	return priv->list->type =3D=3D *(enum lwmi_cd_type *)type;
> > +}
> > +
> > +/**
> > + * lwmi_cd_match_add_all() - Add all match rule for the master driver.
> > + * @master: Pointer to the master device.
> > + * @matchptr: Pointer to the returned component_match pointer.
> > + *
> > + * Adds all component matches to the list stored in @matchptr for the =
@master
> > + * device. @matchptr must be initialized to NULL.
> > + */
> > +void lwmi_cd_match_add_all(struct device *master, struct component_mat=
ch **matchptr)
> > +{
> > +	int i;
> > +
> > +	if (WARN_ON(*matchptr))
>=20
> Add #include
>=20
> > +		return;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(lwmi_cd_table); i++) {
> > +		component_match_add(master, matchptr, lwmi_cd_match,
> > +				    (void *)&lwmi_cd_table[i].type);
>=20
> As the cast to void pointer necessary here? Usually pointer can be cast t=
o=20
> void * implicitly (but I'm not sure about this case type seems enum).

lwmi_cd_table is a const array, its const qualifier infects the
pointer. The cast here is to drop the const qualifier from `const enum
lwmi_cd_type *' as component_match_add() expects plain `void *'.

   warning: passing argument 4 of =E2=80=98component_match_add=E2=80=99 dis=
cards =E2=80=98const=E2=80=99
   qualifier from pointer target type [-Wdiscarded-qualifiers]
  =20
   note: expected =E2=80=98void *=E2=80=99 but argument is of type =E2=80=
=98const enum
   lwmi_cd_type *=E2=80=99

> > +		if (IS_ERR(*matchptr))
>=20
> Add #include
>=20
> > +			return;
> > +	}
> > +}
> > +EXPORT_SYMBOL_NS_GPL(lwmi_cd_match_add_all, "LENOVO_WMI_CD");
> > +
> >  /**
> >   * lwmi_cd_component_bind() - Bind component to master device.
> >   * @cd_dev: Pointer to the lenovo-wmi-capdata driver parent device.
> >   * @om_dev: Pointer to the lenovo-wmi-other driver parent device.
> > - * @data: cd_list object pointer used to return the capability data.
> > + * @data: lwmi_cd_binder object pointer used to return the capability =
data.
> >   *
> >   * On lenovo-wmi-other's master bind, provide a pointer to the local c=
apdata
> >   * list. This is used to call lwmi_cd*_get_data to look up attribute d=
ata
> > @@ -64,9 +134,15 @@ static int lwmi_cd_component_bind(struct device *cd=
_dev,
> >  				  struct device *om_dev, void *data)
> >  {
> >  	struct lwmi_cd_priv *priv =3D dev_get_drvdata(cd_dev);
> > -	struct cd_list **cd_list =3D data;
> > +	struct lwmi_cd_binder *binder =3D data;
> > =20
> > -	*cd_list =3D priv->list;
> > +	switch (priv->list->type) {
> > +	case LENOVO_CAPABILITY_DATA_01:
> > +		binder->cd01_list =3D priv->list;
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > =20
> >  	return 0;
> >  }
> > @@ -76,30 +152,33 @@ static const struct component_ops lwmi_cd_componen=
t_ops =3D {
> >  };
> > =20
> >  /**
> > - * lwmi_cd01_get_data - Get the data of the specified attribute
> > + * lwmi_cd*_get_data - Get the data of the specified attribute
> >   * @list: The lenovo-wmi-capdata pointer to its cd_list struct.
> >   * @attribute_id: The capdata attribute ID to be found.
> > - * @output: Pointer to a capdata01 struct to return the data.
> > + * @output: Pointer to a capdata* struct to return the data.
> >   *
> > - * Retrieves the capability data 01 struct pointer for the given
> > - * attribute for its specified thermal mode.
> > + * Retrieves the capability data struct pointer for the given
> > + * attribute.
> >   *
> >   * Return: 0 on success, or -EINVAL.
> >   */
> > -int lwmi_cd01_get_data(struct cd_list *list, u32 attribute_id, struct =
capdata01 *output)
> > -{
> > -	u8 idx;
> > -
> > -	guard(mutex)(&list->list_mutex);
> > -	for (idx =3D 0; idx < list->count; idx++) {
> > -		if (list->data[idx].id !=3D attribute_id)
> > -			continue;
> > -		memcpy(output, &list->data[idx], sizeof(list->data[idx]));
> > -		return 0;
> > +#define DEF_LWMI_CDXX_GET_DATA(_cdxx, _cd_type, _output_t)					\
> > +	int lwmi_##_cdxx##_get_data(struct cd_list *list, u32 attribute_id, _=
output_t *output)	\
> > +	{											\
> > +		u8 idx;										\
>=20
> Please follow the normal conversions, so add an empty line here (with the
> backslash contination, obviusly).

Will fix this and the following formatting issues (empty line, comma,
{0} =3D> {}). Thanks.

> > +		if (WARN_ON(list->type !=3D _cd_type))						\
> > +			return -EINVAL;								\
>=20
> Empty line here too to help readability?
>=20
> > +		guard(mutex)(&list->list_mutex);						\
> > +		for (idx =3D 0; idx < list->count; idx++) {					\
> > +			if (list->_cdxx[idx].id !=3D attribute_id)				\
> > +				continue;							\
> > +			memcpy(output, &list->_cdxx[idx], sizeof(list->_cdxx[idx]));		\
> > +			return 0;								\
> > +		}										\
> > +		return -EINVAL;									\
> >  	}
> > =20
> > -	return -EINVAL;
> > -}
> > +DEF_LWMI_CDXX_GET_DATA(cd01, LENOVO_CAPABILITY_DATA_01, struct capdata=
01);
> >  EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_WMI_CD");
> > =20
> >  /**
> > @@ -112,10 +191,21 @@ EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_=
WMI_CD");
> >   */
> >  static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
> >  {
> > +	size_t size;
> >  	int idx;
> > +	void *p;
> > +
> > +	switch (priv->list->type) {
> > +	case LENOVO_CAPABILITY_DATA_01:
> > +		p =3D &priv->list->cd01[0];
> > +		size =3D sizeof(priv->list->cd01[0]);
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > =20
> >  	guard(mutex)(&priv->list->list_mutex);
> > -	for (idx =3D 0; idx < priv->list->count; idx++) {
> > +	for (idx =3D 0; idx < priv->list->count; idx++, p +=3D size) {
> >  		union acpi_object *ret_obj __free(kfree) =3D NULL;
> > =20
> >  		ret_obj =3D wmidev_block_query(priv->wdev, idx);
> > @@ -123,11 +213,10 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *pri=
v)
> >  			return -ENODEV;
> > =20
> >  		if (ret_obj->type !=3D ACPI_TYPE_BUFFER ||
> > -		    ret_obj->buffer.length < sizeof(priv->list->data[idx]))
> > +		    ret_obj->buffer.length < size)
> >  			continue;
> > =20
> > -		memcpy(&priv->list->data[idx], ret_obj->buffer.pointer,
> > -		       ret_obj->buffer.length);
> > +		memcpy(p, ret_obj->buffer.pointer, size);
> >  	}
> > =20
> >  	return 0;
> > @@ -136,20 +225,28 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *pri=
v)
> >  /**
> >   * lwmi_cd_alloc() - Allocate a cd_list struct in drvdata
> >   * @priv: lenovo-wmi-capdata driver data.
> > + * @type: The type of capability data.
> >   *
> >   * Allocate a cd_list struct large enough to contain data from all WMI=
 data
> >   * blocks provided by the interface.
> >   *
> >   * Return: 0 on success, or an error.
> >   */
> > -static int lwmi_cd_alloc(struct lwmi_cd_priv *priv)
> > +static int lwmi_cd_alloc(struct lwmi_cd_priv *priv, enum lwmi_cd_type =
type)
> >  {
> >  	struct cd_list *list;
> >  	size_t list_size;
> >  	int count, ret;
> > =20
> >  	count =3D wmidev_instance_count(priv->wdev);
> > -	list_size =3D struct_size(list, data, count);
> > +
> > +	switch (type) {
> > +	case LENOVO_CAPABILITY_DATA_01:
> > +		list_size =3D struct_size(list, cd01, count);
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > =20
> >  	list =3D devm_kzalloc(&priv->wdev->dev, list_size, GFP_KERNEL);
> >  	if (!list)
> > @@ -159,6 +256,7 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv)
> >  	if (ret)
> >  		return ret;
> > =20
> > +	list->type =3D type;
> >  	list->count =3D count;
> >  	priv->list =3D list;
> > =20
> > @@ -168,6 +266,7 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv)
> >  /**
> >   * lwmi_cd_setup() - Cache all WMI data block information
> >   * @priv: lenovo-wmi-capdata driver data.
> > + * @type: The type of capability data.
> >   *
> >   * Allocate a cd_list struct large enough to contain data from all WMI=
 data
> >   * blocks provided by the interface. Then loop through each data block=
 and
> > @@ -175,11 +274,11 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *pri=
v)
> >   *
> >   * Return: 0 on success, or an error code.
> >   */
> > -static int lwmi_cd_setup(struct lwmi_cd_priv *priv)
> > +static int lwmi_cd_setup(struct lwmi_cd_priv *priv, enum lwmi_cd_type =
type)
> >  {
> >  	int ret;
> > =20
> > -	ret =3D lwmi_cd_alloc(priv);
> > +	ret =3D lwmi_cd_alloc(priv, type);
> >  	if (ret)
> >  		return ret;
> > =20
> > @@ -235,9 +334,13 @@ static void lwmi_cd01_unregister(void *data)
> > =20
> >  static int lwmi_cd_probe(struct wmi_device *wdev, const void *context)
> >  {
> > +	const struct lwmi_cd_info *info =3D context;
> >  	struct lwmi_cd_priv *priv;
> >  	int ret;
> > =20
> > +	if (!info)
> > +		return -EINVAL;
> > +
> >  	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> >  	if (!priv)
> >  		return -ENOMEM;
> > @@ -245,30 +348,58 @@ static int lwmi_cd_probe(struct wmi_device *wdev,=
 const void *context)
> >  	priv->wdev =3D wdev;
> >  	dev_set_drvdata(&wdev->dev, priv);
> > =20
> > -	ret =3D lwmi_cd_setup(priv);
> > +	ret =3D lwmi_cd_setup(priv, info->type);
> >  	if (ret)
> > -		return ret;
> > +		goto out;
> > =20
> > -	priv->acpi_nb.notifier_call =3D lwmi_cd01_notifier_call;
> > +	switch (info->type) {
> > +	case LENOVO_CAPABILITY_DATA_01:
> > +		priv->acpi_nb.notifier_call =3D lwmi_cd01_notifier_call;
> > =20
> > -	ret =3D register_acpi_notifier(&priv->acpi_nb);
> > -	if (ret)
> > -		return ret;
> > +		ret =3D register_acpi_notifier(&priv->acpi_nb);
> > +		if (ret)
> > +			goto out;
> > =20
> > -	ret =3D devm_add_action_or_reset(&wdev->dev, lwmi_cd01_unregister, &p=
riv->acpi_nb);
> > -	if (ret)
> > -		return ret;
> > +		ret =3D devm_add_action_or_reset(&wdev->dev, lwmi_cd01_unregister,
> > +					       &priv->acpi_nb);
> > +		if (ret)
> > +			goto out;
> > =20
> > -	return component_add(&wdev->dev, &lwmi_cd_component_ops);
> > +		ret =3D component_add(&wdev->dev, &lwmi_cd_component_ops);
> > +		goto out;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +out:
> > +	if (ret) {
> > +		dev_err(&wdev->dev, "failed to register %s: %d\n",
>=20
> Include?
>=20
> > +			info->name, ret);
> > +	} else {
> > +		dev_info(&wdev->dev, "registered %s with %u items\n",
> > +			 info->name, priv->list->count);
>=20
> Success path should be quiet.

Will turn it into dev_dbg(). Thanks.

Thanks,
Rong

> > +	}
> > +	return ret;
> >  }
> > =20
> >  static void lwmi_cd_remove(struct wmi_device *wdev)
> >  {
> > -	component_del(&wdev->dev, &lwmi_cd_component_ops);
> > +	struct lwmi_cd_priv *priv =3D dev_get_drvdata(&wdev->dev);
> > +
> > +	switch (priv->list->type) {
> > +	case LENOVO_CAPABILITY_DATA_01:
> > +		component_del(&wdev->dev, &lwmi_cd_component_ops);
> > +		break;
> > +	default:
> > +		WARN_ON(1);
> > +	}
> >  }
> > =20
> > +#define LWMI_CD_WDEV_ID(_type)				\
> > +	.guid_string =3D _type##_GUID,			\
> > +	.context =3D &lwmi_cd_table[_type]
>=20
> Add comma.
>=20
> > +
> >  static const struct wmi_device_id lwmi_cd_id_table[] =3D {
> > -	{ LENOVO_CAPABILITY_DATA_01_GUID, NULL },
> > +	{ LWMI_CD_WDEV_ID(LENOVO_CAPABILITY_DATA_01) },
> >  	{}
> >  };
> > =20
> > @@ -283,22 +414,10 @@ static struct wmi_driver lwmi_cd_driver =3D {
> >  	.no_singleton =3D true,
> >  };
> > =20
> > -/**
> > - * lwmi_cd01_match() - Match rule for the master driver.
> > - * @dev: Pointer to the capability data 01 parent device.
> > - * @data: Unused void pointer for passing match criteria.
> > - *
> > - * Return: int.
> > - */
> > -int lwmi_cd01_match(struct device *dev, void *data)
> > -{
> > -	return dev->driver =3D=3D &lwmi_cd_driver.driver;
> > -}
> > -EXPORT_SYMBOL_NS_GPL(lwmi_cd01_match, "LENOVO_WMI_CD");
> > -
> >  module_wmi_driver(lwmi_cd_driver);
> > =20
> >  MODULE_DEVICE_TABLE(wmi, lwmi_cd_id_table);
> >  MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> > +MODULE_AUTHOR("Rong Zhang <i@rong.moe>");
> >  MODULE_DESCRIPTION("Lenovo Capability Data WMI Driver");
> >  MODULE_LICENSE("GPL");
> > diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platfo=
rm/x86/lenovo/wmi-capdata.h
> > index 2a4746e38ad4..d326f9d2d165 100644
> > --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> > +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> > @@ -7,6 +7,7 @@
> > =20
> >  #include <linux/types.h>
> > =20
> > +struct component_match;
> >  struct device;
> >  struct cd_list;
> > =20
> > @@ -19,7 +20,11 @@ struct capdata01 {
> >  	u32 max_value;
> >  };
> > =20
> > +struct lwmi_cd_binder {
> > +	struct cd_list *cd01_list;
> > +};
> > +
> > +void lwmi_cd_match_add_all(struct device *master, struct component_mat=
ch **matchptr);
> >  int lwmi_cd01_get_data(struct cd_list *list, u32 attribute_id, struct =
capdata01 *output);
> > -int lwmi_cd01_match(struct device *dev, void *data);
> > =20
> >  #endif /* !_LENOVO_WMI_CAPDATA_H_ */
> > diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform=
/x86/lenovo/wmi-other.c
> > index c6dc1b4cff84..f2e1e34d58a9 100644
> > --- a/drivers/platform/x86/lenovo/wmi-other.c
> > +++ b/drivers/platform/x86/lenovo/wmi-other.c
> > @@ -579,14 +579,14 @@ static void lwmi_om_fw_attr_remove(struct lwmi_om=
_priv *priv)
> >  static int lwmi_om_master_bind(struct device *dev)
> >  {
> >  	struct lwmi_om_priv *priv =3D dev_get_drvdata(dev);
> > -	struct cd_list *tmp_list;
> > +	struct lwmi_cd_binder binder =3D { 0 };
>=20
> =3D {} is enough to initialize to default values.
>=20
> >  	int ret;
> > =20
> > -	ret =3D component_bind_all(dev, &tmp_list);
> > +	ret =3D component_bind_all(dev, &binder);
> >  	if (ret)
> >  		return ret;
> > =20
> > -	priv->cd01_list =3D tmp_list;
> > +	priv->cd01_list =3D binder.cd01_list;
> >  	if (!priv->cd01_list)
> >  		return -ENODEV;
> > =20
> > @@ -623,10 +623,13 @@ static int lwmi_other_probe(struct wmi_device *wd=
ev, const void *context)
> >  	if (!priv)
> >  		return -ENOMEM;
> > =20
> > +	/* Sentinel for on-demand ida_free(). */
> > +	priv->ida_id =3D -EIDRM;
> > +
> >  	priv->wdev =3D wdev;
> >  	dev_set_drvdata(&wdev->dev, priv);
> > =20
> > -	component_match_add(&wdev->dev, &master_match, lwmi_cd01_match, NULL)=
;
> > +	lwmi_cd_match_add_all(&wdev->dev, &master_match);
> >  	if (IS_ERR(master_match))
> >  		return PTR_ERR(master_match);
> > =20
> > @@ -639,7 +642,10 @@ static void lwmi_other_remove(struct wmi_device *w=
dev)
> >  	struct lwmi_om_priv *priv =3D dev_get_drvdata(&wdev->dev);
> > =20
> >  	component_master_del(&wdev->dev, &lwmi_om_master_ops);
> > -	ida_free(&lwmi_om_ida, priv->ida_id);
> > +
> > +	/* No IDA to free if the driver is never bound to its components. */
> > +	if (priv->ida_id >=3D 0)
> > +		ida_free(&lwmi_om_ida, priv->ida_id);
> >  }
> > =20
> >  static const struct wmi_device_id lwmi_other_id_table[] =3D {
> >=20
