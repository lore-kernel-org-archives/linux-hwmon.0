Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5BC376BC1;
	Thu, 22 Jan 2026 18:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769108019; cv=none; b=iz45kZA7f+jEOS3iAJhpm0pWn6FuqTUkz4D2G1C1DCY5W6AAREn3wY1plEYeXu6lbR+ss43K6ICVmigj8PGp5Y6zBdMSuW5jOPS2Tp2gnE0/LDVTMGbv/CW/lWfMe0wwGW+0FhIOEz0dM139VcwFHUYDSZTi5eTrNoeL9jpRSc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769108019; c=relaxed/simple;
	bh=eCrFB3N68S4znD9oxsV38DGssnmfWXcWHDw2v76Er8Y=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=DFUvElZgqZl9KV4pM4yTlGnL704c5VuIwfOIDIz/1UkraRY/sJ5mKvtDfiIWy55WikdwAYESs2bOjxc4HjkZhXjpIfTZNYX92RITCIG3a6h7DYrJXecGLN1bPxzbuxnBFbafVc4Y5Be7nxDkvhSlnBXmemT4ih4qXYaITwWVJ1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=tjMrlTiH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dUoKPLdO; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="tjMrlTiH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dUoKPLdO"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 04CEB1D00045;
	Thu, 22 Jan 2026 13:53:22 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Thu, 22 Jan 2026 13:53:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1769108002;
	 x=1769194402; bh=1Ij+A4DmwoLPEqJ/nGOp0uUix+A1xdruQafxH38saEw=; b=
	tjMrlTiHA0WJQdgPd95YFU7ai6JccZujEniCH64rAez4n1cpUMUqa9Ty+kUI/vbU
	fNfkrbgUA27kHynL2p127FkO9n1WLAlBx5BpkoXvalw+TbBUmysbWDBSoSqi4F/m
	e/J2WV2ehEA2rB5c35E8A2tB0NSX3PNfjroqdjJIf1AlZMtOZZ14qp7IqekgFYQq
	tKkzurijmkOpAyfpaJnZEQ6MjkASRFMaUdZYT16+9KaQZ+dQ4WQUWlqXm2teURyR
	GFyvlPvFtlKk7X9zOmW9Q/coqN7qj97xnxw/ScfkmEPPS4Wy5OOEtO6BWp6fnIOg
	09VFogULI0/I3WxPn5Pt2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1769108002; x=
	1769194402; bh=1Ij+A4DmwoLPEqJ/nGOp0uUix+A1xdruQafxH38saEw=; b=d
	UoKPLdOnMB/eMhApbIZs2BM/P8Q5BXDIfLY9CCGdfHLDfySf6v58d/HPHouua5A5
	yNGoJD+GSR6FY2kp/S2sT3Yo4/HX/70ZzddcqlH3ycFb/IO2EmiDo7tItxeHuGJZ
	c2D/uEJ2tr2vgWHykHWqCSQrapGB9ZPvA4wLXpFgp5mmmEMoVWo8y6USMp5qggN/
	JbRJKhdhml+B9ilHu1iVNotjt1ul4UaR++1NBUqlnR+0kmwQ25JYDqPCk41PSa4l
	cy/VgQvckO68Rp+oSjxO5pcSSxrSWaIGPmrIse1zmlgb01mo28O/IWp8PXdbVut4
	Haz7MBmf5vQAQHJlSjQJQ==
X-ME-Sender: <xms:InJyaSV6ZEsC_BF1RkMM56LYPiPI_Id2BKXc-vRDP5b5ILMFUwpdUg>
    <xme:InJyaZYTMOuA8ytWbkhuwIBY2Dvs1qSLavFWNMxwTxtmoVGK1W89ZdrSWNKrrJ_xx
    gUBYbI9y1WxGOusRyZZLCgoyJHbcq1gBkmZUQ9XV72WwDVBfyKoVNk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeeileefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedfofgrrhhk
    ucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtg
    grqeenucggtffrrghtthgvrhhnpefhveekjeeuueekfefhleeljeehuedugfetffdvteek
    ffejudelffdvjeekfeehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhn
    sggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuggvrh
    gvkhhjohhhnhdrtghlrghrkhesghhmrghilhdrtghomhdprhgtphhtthhopehkuhhurhht
    sgesghhmrghilhdrtghomhdprhgtphhtthhopeifpggrrhhmihhnsehgmhigrdguvgdprh
    gtphhtthhopehhrghnshhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehilhhpohdr
    jhgrrhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinh
    hugiesrhhovggtkhdquhhsrdhnvghtpdhrtghpthhtohepihesrhhonhhgrdhmohgvpdhr
    tghpthhtoheplhhinhhugidqhhifmhhonhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:InJyaVBEMsa9ji40ashlZLhdmgBYCWGTtMGl1DxTgBm76pCwQeClvA>
    <xmx:InJyaRx8_0ioP6xnf7Q_741PZH2A8rfhqD491gMOwqGjuK_scEGNzQ>
    <xmx:InJyaZ5DZ0ebyVn4FndJx53FPcwOh_PDRqexs6JroQ7GAbtJ5584TQ>
    <xmx:InJyaSyRRH4x18Qc5eXlX4d3uYhXMV45twLSZfeuG58viIvis7OcFQ>
    <xmx:InJyaa_UKgHGV1BjTwtI8QZNU65TiXaR4OHyFtvxA1VdhJw_QljdOUA8>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8381A2CE0072; Thu, 22 Jan 2026 13:53:22 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Aiscfdiu_31w
Date: Thu, 22 Jan 2026 13:53:02 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Rong Zhang" <i@rong.moe>, "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Armin Wolf" <W_Armin@gmx.de>, "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Guenter Roeck" <linux@roeck-us.net>, "Kurt Borja" <kuurtb@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Message-Id: <d712d51c-9168-46fd-bd35-4b3633729b51@app.fastmail.com>
In-Reply-To: <20260120182104.163424-4-i@rong.moe>
References: <20260120182104.163424-1-i@rong.moe>
 <20260120182104.163424-4-i@rong.moe>
Subject: Re: [PATCH v11 3/7] platform/x86: lenovo-wmi-{capdata,other}: Support multiple
 Capability Data
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Tue, Jan 20, 2026, at 1:20 PM, Rong Zhang wrote:
> The current implementation are heavily bound to capdata01. Rewrite it =
so
> that it is suitable to utilize other Capability Data as well.
>
> No functional change intended.
>
> Signed-off-by: Rong Zhang <i@rong.moe>
> Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> Changes in v11:
> - Adopt a unified name (lenovo_wmi_capdata) for kmod, Kconfig, export
>   namespace and driver (thanks Ilpo J=C3=A4rvinen)
>
> Changes in v9:
> - Make kernel-doc.py happy (thanks Ilpo J=C3=A4rvinen, kernel test rob=
ot)
>
> Changes in v7:
> - Fix missing #include (thanks Ilpo J=C3=A4rvinen)
> - Fix formatting issues (ditto)
> - dev_dbg() instead of dev_info() on probe success (ditto)
>
> Changes in v6:
> - Fix the error path of lwmi_cd_match_add_all()
>   - IS_ERR(matchptr) =3D> IS_ERR(*matchptr)
>
> Changes in v5:
> - Do not cast pointer to non-pointer or vice versa (thanks kernel test
>   robot)
>
> Changes in v4:
> - Get rid of wmi_has_guid() (thanks Armin Wolf)
>   - More changes in [PATCH v4 6/7]
> - Prepare for [PATCH v4 6/7]
>   - Move lwmi_cd_match*() forward
>   - Use switch-case in lwmi_cd_remove()
>
> Changes in v2:
> - Fix function parameter 'type' not described in 'lwmi_cd_match' (than=
ks
>   kernel test bot)
> ---
>  drivers/platform/x86/lenovo/wmi-capdata.c | 233 +++++++++++++++++-----
>  drivers/platform/x86/lenovo/wmi-capdata.h |   7 +-
>  drivers/platform/x86/lenovo/wmi-other.c   |  16 +-
>  3 files changed, 196 insertions(+), 60 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c=20
> b/drivers/platform/x86/lenovo/wmi-capdata.c
> index ba843b6604b06..93ecb49c4c73a 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.c
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
> @@ -12,13 +12,21 @@
>   *
>   * Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
>   *   - Initial implementation (formerly named lenovo-wmi-capdata01)
> + *
> + * Copyright (C) 2025 Rong Zhang <i@rong.moe>
> + *   - Unified implementation
>   */
>=20
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
>  #include <linux/acpi.h>
> +#include <linux/bug.h>
>  #include <linux/cleanup.h>
>  #include <linux/component.h>
>  #include <linux/container_of.h>
>  #include <linux/device.h>
> +#include <linux/dev_printk.h>
> +#include <linux/err.h>
>  #include <linux/export.h>
>  #include <linux/gfp_types.h>
>  #include <linux/module.h>
> @@ -26,6 +34,7 @@
>  #include <linux/mutex_types.h>
>  #include <linux/notifier.h>
>  #include <linux/overflow.h>
> +#include <linux/stddef.h>
>  #include <linux/types.h>
>  #include <linux/wmi.h>
>=20
> @@ -36,6 +45,23 @@
>  #define ACPI_AC_CLASS "ac_adapter"
>  #define ACPI_AC_NOTIFY_STATUS 0x80
>=20
> +enum lwmi_cd_type {
> +	LENOVO_CAPABILITY_DATA_01,
> +};
> +
> +#define LWMI_CD_TABLE_ITEM(_type)		\
> +	[_type] =3D {				\
> +		.name =3D #_type,			\
> +		.type =3D _type,			\
> +	}
> +
> +static const struct lwmi_cd_info {
> +	const char *name;
> +	enum lwmi_cd_type type;
> +} lwmi_cd_table[] =3D {
> +	LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_01),
> +};
> +
>  struct lwmi_cd_priv {
>  	struct notifier_block acpi_nb; /* ACPI events */
>  	struct wmi_device *wdev;
> @@ -44,15 +70,63 @@ struct lwmi_cd_priv {
>=20
>  struct cd_list {
>  	struct mutex list_mutex; /* list R/W mutex */
> +	enum lwmi_cd_type type;
>  	u8 count;
> -	struct capdata01 data[];
> +
> +	union {
> +		DECLARE_FLEX_ARRAY(struct capdata01, cd01);
> +	};
>  };
>=20
> +static struct wmi_driver lwmi_cd_driver;
> +
> +/**
> + * lwmi_cd_match() - Match rule for the master driver.
> + * @dev: Pointer to the capability data parent device.
> + * @type: Pointer to capability data type (enum lwmi_cd_type *) to=20
> match.
> + *
> + * Return: int.
> + */
> +static int lwmi_cd_match(struct device *dev, void *type)
> +{
> +	struct lwmi_cd_priv *priv;
> +
> +	if (dev->driver !=3D &lwmi_cd_driver.driver)
> +		return false;
> +
> +	priv =3D dev_get_drvdata(dev);
> +	return priv->list->type =3D=3D *(enum lwmi_cd_type *)type;
> +}
> +
> +/**
> + * lwmi_cd_match_add_all() - Add all match rule for the master driver.
> + * @master: Pointer to the master device.
> + * @matchptr: Pointer to the returned component_match pointer.
> + *
> + * Adds all component matches to the list stored in @matchptr for the=20
> @master
> + * device. @matchptr must be initialized to NULL.
> + */
> +void lwmi_cd_match_add_all(struct device *master, struct=20
> component_match **matchptr)
> +{
> +	int i;
> +
> +	if (WARN_ON(*matchptr))
> +		return;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(lwmi_cd_table); i++) {
> +		component_match_add(master, matchptr, lwmi_cd_match,
> +				    (void *)&lwmi_cd_table[i].type);
> +		if (IS_ERR(*matchptr))
> +			return;
> +	}
> +}
> +EXPORT_SYMBOL_NS_GPL(lwmi_cd_match_add_all, "LENOVO_WMI_CAPDATA");
> +
>  /**
>   * lwmi_cd_component_bind() - Bind component to master device.
>   * @cd_dev: Pointer to the lenovo-wmi-capdata driver parent device.
>   * @om_dev: Pointer to the lenovo-wmi-other driver parent device.
> - * @data: cd_list object pointer used to return the capability data.
> + * @data: lwmi_cd_binder object pointer used to return the capability=20
> data.
>   *
>   * On lenovo-wmi-other's master bind, provide a pointer to the local=20
> capdata
>   * list. This is used to call lwmi_cd*_get_data to look up attribute=20
> data
> @@ -64,9 +138,15 @@ static int lwmi_cd_component_bind(struct device=20
> *cd_dev,
>  				  struct device *om_dev, void *data)
>  {
>  	struct lwmi_cd_priv *priv =3D dev_get_drvdata(cd_dev);
> -	struct cd_list **cd_list =3D data;
> +	struct lwmi_cd_binder *binder =3D data;
>=20
> -	*cd_list =3D priv->list;
> +	switch (priv->list->type) {
> +	case LENOVO_CAPABILITY_DATA_01:
> +		binder->cd01_list =3D priv->list;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
>=20
>  	return 0;
>  }
> @@ -75,31 +155,36 @@ static const struct component_ops lwmi_cd_compone=
nt_ops =3D {
>  	.bind =3D lwmi_cd_component_bind,
>  };
>=20
> -/**
> - * lwmi_cd01_get_data - Get the data of the specified attribute
> +/*
> + * lwmi_cd*_get_data - Get the data of the specified attribute
>   * @list: The lenovo-wmi-capdata pointer to its cd_list struct.
>   * @attribute_id: The capdata attribute ID to be found.
> - * @output: Pointer to a capdata01 struct to return the data.
> + * @output: Pointer to a capdata* struct to return the data.
>   *
> - * Retrieves the capability data 01 struct pointer for the given
> - * attribute for its specified thermal mode.
> + * Retrieves the capability data struct pointer for the given
> + * attribute.
>   *
>   * Return: 0 on success, or -EINVAL.
>   */
> -int lwmi_cd01_get_data(struct cd_list *list, u32 attribute_id, struct=20
> capdata01 *output)
> -{
> -	u8 idx;
> -
> -	guard(mutex)(&list->list_mutex);
> -	for (idx =3D 0; idx < list->count; idx++) {
> -		if (list->data[idx].id !=3D attribute_id)
> -			continue;
> -		memcpy(output, &list->data[idx], sizeof(list->data[idx]));
> -		return 0;
> +#define DEF_LWMI_CDXX_GET_DATA(_cdxx, _cd_type, _output_t)					\
> +	int lwmi_##_cdxx##_get_data(struct cd_list *list, u32 attribute_id,=20
> _output_t *output)	\
> +	{											\
> +		u8 idx;										\
> +												\
> +		if (WARN_ON(list->type !=3D _cd_type))						\
> +			return -EINVAL;								\
> +												\
> +		guard(mutex)(&list->list_mutex);						\
> +		for (idx =3D 0; idx < list->count; idx++) {					\
> +			if (list->_cdxx[idx].id !=3D attribute_id)				\
> +				continue;							\
> +			memcpy(output, &list->_cdxx[idx], sizeof(list->_cdxx[idx]));		\
> +			return 0;								\
> +		}										\
> +		return -EINVAL;									\
>  	}
>=20
> -	return -EINVAL;
> -}
> +DEF_LWMI_CDXX_GET_DATA(cd01, LENOVO_CAPABILITY_DATA_01, struct capdat=
a01);
>  EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_WMI_CAPDATA");
>=20
>  /**
> @@ -112,10 +197,21 @@ EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data,=20
> "LENOVO_WMI_CAPDATA");
>   */
>  static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
>  {
> +	size_t size;
>  	int idx;
> +	void *p;
> +
> +	switch (priv->list->type) {
> +	case LENOVO_CAPABILITY_DATA_01:
> +		p =3D &priv->list->cd01[0];
> +		size =3D sizeof(priv->list->cd01[0]);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
>=20
>  	guard(mutex)(&priv->list->list_mutex);
> -	for (idx =3D 0; idx < priv->list->count; idx++) {
> +	for (idx =3D 0; idx < priv->list->count; idx++, p +=3D size) {
>  		union acpi_object *ret_obj __free(kfree) =3D NULL;
>=20
>  		ret_obj =3D wmidev_block_query(priv->wdev, idx);
> @@ -123,11 +219,10 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *pr=
iv)
>  			return -ENODEV;
>=20
>  		if (ret_obj->type !=3D ACPI_TYPE_BUFFER ||
> -		    ret_obj->buffer.length < sizeof(priv->list->data[idx]))
> +		    ret_obj->buffer.length < size)
>  			continue;
>=20
> -		memcpy(&priv->list->data[idx], ret_obj->buffer.pointer,
> -		       ret_obj->buffer.length);
> +		memcpy(p, ret_obj->buffer.pointer, size);
>  	}
>=20
>  	return 0;
> @@ -136,20 +231,28 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *pr=
iv)
>  /**
>   * lwmi_cd_alloc() - Allocate a cd_list struct in drvdata
>   * @priv: lenovo-wmi-capdata driver data.
> + * @type: The type of capability data.
>   *
>   * Allocate a cd_list struct large enough to contain data from all WM=
I data
>   * blocks provided by the interface.
>   *
>   * Return: 0 on success, or an error.
>   */
> -static int lwmi_cd_alloc(struct lwmi_cd_priv *priv)
> +static int lwmi_cd_alloc(struct lwmi_cd_priv *priv, enum lwmi_cd_type=
 type)
>  {
>  	struct cd_list *list;
>  	size_t list_size;
>  	int count, ret;
>=20
>  	count =3D wmidev_instance_count(priv->wdev);
> -	list_size =3D struct_size(list, data, count);
> +
> +	switch (type) {
> +	case LENOVO_CAPABILITY_DATA_01:
> +		list_size =3D struct_size(list, cd01, count);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
>=20
>  	list =3D devm_kzalloc(&priv->wdev->dev, list_size, GFP_KERNEL);
>  	if (!list)
> @@ -159,6 +262,7 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv)
>  	if (ret)
>  		return ret;
>=20
> +	list->type =3D type;
>  	list->count =3D count;
>  	priv->list =3D list;
>=20
> @@ -168,6 +272,7 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv)
>  /**
>   * lwmi_cd_setup() - Cache all WMI data block information
>   * @priv: lenovo-wmi-capdata driver data.
> + * @type: The type of capability data.
>   *
>   * Allocate a cd_list struct large enough to contain data from all WM=
I data
>   * blocks provided by the interface. Then loop through each data bloc=
k and
> @@ -175,11 +280,11 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *pr=
iv)
>   *
>   * Return: 0 on success, or an error code.
>   */
> -static int lwmi_cd_setup(struct lwmi_cd_priv *priv)
> +static int lwmi_cd_setup(struct lwmi_cd_priv *priv, enum lwmi_cd_type=
 type)
>  {
>  	int ret;
>=20
> -	ret =3D lwmi_cd_alloc(priv);
> +	ret =3D lwmi_cd_alloc(priv, type);
>  	if (ret)
>  		return ret;
>=20
> @@ -235,9 +340,13 @@ static void lwmi_cd01_unregister(void *data)
>=20
>  static int lwmi_cd_probe(struct wmi_device *wdev, const void *context)
>  {
> +	const struct lwmi_cd_info *info =3D context;
>  	struct lwmi_cd_priv *priv;
>  	int ret;
>=20
> +	if (!info)
> +		return -EINVAL;
> +
>  	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
>  		return -ENOMEM;
> @@ -245,30 +354,58 @@ static int lwmi_cd_probe(struct wmi_device *wdev=
,=20
> const void *context)
>  	priv->wdev =3D wdev;
>  	dev_set_drvdata(&wdev->dev, priv);
>=20
> -	ret =3D lwmi_cd_setup(priv);
> +	ret =3D lwmi_cd_setup(priv, info->type);
>  	if (ret)
> -		return ret;
> +		goto out;
>=20
> -	priv->acpi_nb.notifier_call =3D lwmi_cd01_notifier_call;
> +	switch (info->type) {
> +	case LENOVO_CAPABILITY_DATA_01:
> +		priv->acpi_nb.notifier_call =3D lwmi_cd01_notifier_call;
>=20
> -	ret =3D register_acpi_notifier(&priv->acpi_nb);
> -	if (ret)
> -		return ret;
> +		ret =3D register_acpi_notifier(&priv->acpi_nb);
> +		if (ret)
> +			goto out;
>=20
> -	ret =3D devm_add_action_or_reset(&wdev->dev, lwmi_cd01_unregister,=20
> &priv->acpi_nb);
> -	if (ret)
> -		return ret;
> +		ret =3D devm_add_action_or_reset(&wdev->dev, lwmi_cd01_unregister,
> +					       &priv->acpi_nb);
> +		if (ret)
> +			goto out;
>=20
> -	return component_add(&wdev->dev, &lwmi_cd_component_ops);
> +		ret =3D component_add(&wdev->dev, &lwmi_cd_component_ops);
> +		goto out;
> +	default:
> +		return -EINVAL;
> +	}
> +out:
> +	if (ret) {
> +		dev_err(&wdev->dev, "failed to register %s: %d\n",
> +			info->name, ret);
> +	} else {
> +		dev_dbg(&wdev->dev, "registered %s with %u items\n",
> +			info->name, priv->list->count);
> +	}
> +	return ret;
>  }
>=20
>  static void lwmi_cd_remove(struct wmi_device *wdev)
>  {
> -	component_del(&wdev->dev, &lwmi_cd_component_ops);
> +	struct lwmi_cd_priv *priv =3D dev_get_drvdata(&wdev->dev);
> +
> +	switch (priv->list->type) {
> +	case LENOVO_CAPABILITY_DATA_01:
> +		component_del(&wdev->dev, &lwmi_cd_component_ops);
> +		break;
> +	default:
> +		WARN_ON(1);
> +	}
>  }
>=20
> +#define LWMI_CD_WDEV_ID(_type)				\
> +	.guid_string =3D _type##_GUID,			\
> +	.context =3D &lwmi_cd_table[_type],
> +
>  static const struct wmi_device_id lwmi_cd_id_table[] =3D {
> -	{ LENOVO_CAPABILITY_DATA_01_GUID, NULL },
> +	{ LWMI_CD_WDEV_ID(LENOVO_CAPABILITY_DATA_01) },
>  	{}
>  };
>=20
> @@ -283,22 +420,10 @@ static struct wmi_driver lwmi_cd_driver =3D {
>  	.no_singleton =3D true,
>  };
>=20
> -/**
> - * lwmi_cd01_match() - Match rule for the master driver.
> - * @dev: Pointer to the capability data 01 parent device.
> - * @data: Unused void pointer for passing match criteria.
> - *
> - * Return: int.
> - */
> -int lwmi_cd01_match(struct device *dev, void *data)
> -{
> -	return dev->driver =3D=3D &lwmi_cd_driver.driver;
> -}
> -EXPORT_SYMBOL_NS_GPL(lwmi_cd01_match, "LENOVO_WMI_CAPDATA");
> -
>  module_wmi_driver(lwmi_cd_driver);
>=20
>  MODULE_DEVICE_TABLE(wmi, lwmi_cd_id_table);
>  MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> +MODULE_AUTHOR("Rong Zhang <i@rong.moe>");
>  MODULE_DESCRIPTION("Lenovo Capability Data WMI Driver");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h=20
> b/drivers/platform/x86/lenovo/wmi-capdata.h
> index 2a4746e38ad43..d326f9d2d1659 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> @@ -7,6 +7,7 @@
>=20
>  #include <linux/types.h>
>=20
> +struct component_match;
>  struct device;
>  struct cd_list;
>=20
> @@ -19,7 +20,11 @@ struct capdata01 {
>  	u32 max_value;
>  };
>=20
> +struct lwmi_cd_binder {
> +	struct cd_list *cd01_list;
> +};
> +
> +void lwmi_cd_match_add_all(struct device *master, struct=20
> component_match **matchptr);
>  int lwmi_cd01_get_data(struct cd_list *list, u32 attribute_id, struct=20
> capdata01 *output);
> -int lwmi_cd01_match(struct device *dev, void *data);
>=20
>  #endif /* !_LENOVO_WMI_CAPDATA_H_ */
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c=20
> b/drivers/platform/x86/lenovo/wmi-other.c
> index ef34ea742d1ac..73191dedc029f 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -579,14 +579,14 @@ static void lwmi_om_fw_attr_remove(struct=20
> lwmi_om_priv *priv)
>  static int lwmi_om_master_bind(struct device *dev)
>  {
>  	struct lwmi_om_priv *priv =3D dev_get_drvdata(dev);
> -	struct cd_list *tmp_list;
> +	struct lwmi_cd_binder binder =3D {};
>  	int ret;
>=20
> -	ret =3D component_bind_all(dev, &tmp_list);
> +	ret =3D component_bind_all(dev, &binder);
>  	if (ret)
>  		return ret;
>=20
> -	priv->cd01_list =3D tmp_list;
> +	priv->cd01_list =3D binder.cd01_list;
>  	if (!priv->cd01_list)
>  		return -ENODEV;
>=20
> @@ -623,10 +623,13 @@ static int lwmi_other_probe(struct wmi_device=20
> *wdev, const void *context)
>  	if (!priv)
>  		return -ENOMEM;
>=20
> +	/* Sentinel for on-demand ida_free(). */
> +	priv->ida_id =3D -EIDRM;
> +
>  	priv->wdev =3D wdev;
>  	dev_set_drvdata(&wdev->dev, priv);
>=20
> -	component_match_add(&wdev->dev, &master_match, lwmi_cd01_match, NULL=
);
> +	lwmi_cd_match_add_all(&wdev->dev, &master_match);
>  	if (IS_ERR(master_match))
>  		return PTR_ERR(master_match);
>=20
> @@ -639,7 +642,10 @@ static void lwmi_other_remove(struct wmi_device *=
wdev)
>  	struct lwmi_om_priv *priv =3D dev_get_drvdata(&wdev->dev);
>=20
>  	component_master_del(&wdev->dev, &lwmi_om_master_ops);
> -	ida_free(&lwmi_om_ida, priv->ida_id);
> +
> +	/* No IDA to free if the driver is never bound to its components. */
> +	if (priv->ida_id >=3D 0)
> +		ida_free(&lwmi_om_ida, priv->ida_id);
>  }
>=20
>  static const struct wmi_device_id lwmi_other_id_table[] =3D {
> --=20
> 2.51.0

Looks good to me. I think what you've done might be useful for something=
 else I'm working on too, so thank you!

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Mark
