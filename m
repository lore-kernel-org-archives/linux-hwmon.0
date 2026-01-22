Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A4536683E;
	Thu, 22 Jan 2026 18:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769107929; cv=none; b=dA3oB1F3hEEkoIeC0GSuWej1YzchiKvH/Axo2/RfN/Mm6ec32qmyos2BoJQa0Nqi9DTMt/ZHIMn5kH6AmHaJba110KCzgVDtYPZHxe2uuXz/R8nL2iaAbs/a/AGy/rkirF5qPF6ip99nl3PuBsamzjE7WacQPbhY8bCgLqEBFyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769107929; c=relaxed/simple;
	bh=LlwYK8bHjPf4a80hRtJZvSlIaE6qzEZdgzujmgK/EZQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=gFeTjIEm1DsVcQQHft5Jght8yO2zV/8XRgL69SW2/SzLdQza+AhLDyo8iC2TKsB44qM91GMpCFJ9kisNR92uc3zUfRH3XS6gBHF4oCxLtSapOJAFccj/LxtXhoejPlg5/DLr4v8VmHjRBRlVZguiVfd184PqS2iW6h9dcoiT4IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=jwXJ4GG2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UpMaE3Qy; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="jwXJ4GG2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UpMaE3Qy"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 89D0B1D00045;
	Thu, 22 Jan 2026 13:51:58 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Thu, 22 Jan 2026 13:51:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1769107918;
	 x=1769194318; bh=YVDbT4/bLwmPT56kKTeYWItT8pVK8uR3plaZMvquZGs=; b=
	jwXJ4GG26g3To+vsUMjEzpjWomMxLq2S5wGRSS4LuQo9JhPeIzRGACT5MVCKIqX/
	s9HUIJy90En8PP+6GtkD5V/CGa7pJ4mQ7MU2k5GFh4kY6sPx+drsK3+gJ26DfjNR
	OYkU5DB7steTaZg4kjE12ZJRt3SqyvUQVbeoUHtFpv43Fm/Ejim7uB4qx0xKh05H
	eDVEJYVbrfD6JPQvy9VbimX0XH7W/LrLAs/DOV/rNhSuFhDuieu3f8CSjqQtZSy8
	6ANoGlRcAhjij+5db4c4IyKEy9ttKJtHoN7U1u6/3qv9ephVtsN4Y7/XZT5U442E
	OH+2VDGL+eDMs/ZcuRyE3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1769107918; x=
	1769194318; bh=YVDbT4/bLwmPT56kKTeYWItT8pVK8uR3plaZMvquZGs=; b=U
	pMaE3QyxsRI98838wuvjI8hIa0q9Cri9w3aSMxRMXcJT0gpsa0E76joNvivuELIr
	uvhSAR567qNrMjWU6qJWq/DTyrq+EfcmZjyaBk+zz5couhucGP/OCocI9ftu7f8g
	mjNOazn8OR0G+ohRyz1lqRsfaIpz7sWcy52zqjHv4H8ShVPGtgRrwd/leT0lESyt
	U21v6vvSLdoe91XIuHh+/RmO/Wo2l4grPGm0VnRlUQu/C2zG7qNV8M0zRnzAx/89
	1H7/IyXxjSVRSOZ6f/G3w8Ni3kdfJQs3mbP4SID7ij69yBgJWxkff6ZWfut/ffkP
	xc6DyeMjxogXLAjgz087Q==
X-ME-Sender: <xms:znFyafvFGiQlvK7_XKpYU15w6UsmqDofiqGjVuMCAdrmAJe2O-EFCQ>
    <xme:znFyabShOHYobnym9syCfe4gI7XU2Xh9CYJPUTpPDVh6j0OIDfoEa2E9badz1c4Gl
    ZqmUQMuwTU5-YbikJSj2qQ-NWXLmIWlb2EzokrC91EYOhFIDnb_SQk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeeiledvucetufdoteggodetrf
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
X-ME-Proxy: <xmx:znFyaXY36VkIhmM3hPPrC4-P0DDXnhQSi9cAqvKZaVN6-9CohYcNOA>
    <xmx:znFyaUonYadAhNkopCThR9ZuvCkebmFEz1w4igFpIRxiIBPjKVJ99Q>
    <xmx:znFyaTR6MOn0cWr2S128FHckOfLgv5DLJ3p0LQ7ErCnLSeye4qRJrQ>
    <xmx:znFyaQqTQ47e-hz1Ul7cmv8iaelKPithC0czejQ4Bn86fsRfKE7ISg>
    <xmx:znFyaW0yBwgMHK_ul_Yp30E0CoJH1MJ1DMT9SfH_pOHC0SVOBfqn0_Rh>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3F46D2CE0072; Thu, 22 Jan 2026 13:51:58 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AhOEez_mznuN
Date: Thu, 22 Jan 2026 13:51:38 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Rong Zhang" <i@rong.moe>, "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Armin Wolf" <W_Armin@gmx.de>, "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Guenter Roeck" <linux@roeck-us.net>, "Kurt Borja" <kuurtb@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Message-Id: <cdd15ede-fba3-4d88-b3fc-ea90cadf2353@app.fastmail.com>
In-Reply-To: <20260120182104.163424-3-i@rong.moe>
References: <20260120182104.163424-1-i@rong.moe>
 <20260120182104.163424-3-i@rong.moe>
Subject: Re: [PATCH v11 2/7] platform/x86: Rename lenovo-wmi-capdata01 to
 lenovo-wmi-capdata
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Tue, Jan 20, 2026, at 1:20 PM, Rong Zhang wrote:
> Prepare for the upcoming changes to make it suitable to retrieve
> and provide other Capability Data as well.
>
> Signed-off-by: Rong Zhang <i@rong.moe>
> Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> Changes in v11:
> - Adopt a unified name (lenovo_wmi_capdata) for kmod, Kconfig, export
>   namespace and driver (thanks Ilpo J=C3=A4rvinen)
> ---
>  drivers/platform/x86/lenovo/Kconfig           |   4 +-
>  drivers/platform/x86/lenovo/Makefile          |   2 +-
>  .../lenovo/{wmi-capdata01.c =3D> wmi-capdata.c} | 124 +++++++++------=
---
>  .../lenovo/{wmi-capdata01.h =3D> wmi-capdata.h} |  10 +-
>  drivers/platform/x86/lenovo/wmi-other.c       |  11 +-
>  5 files changed, 78 insertions(+), 73 deletions(-)
>  rename drivers/platform/x86/lenovo/{wmi-capdata01.c =3D> wmi-capdata.=
c} (60%)
>  rename drivers/platform/x86/lenovo/{wmi-capdata01.h =3D> wmi-capdata.=
h} (60%)
>
> diff --git a/drivers/platform/x86/lenovo/Kconfig=20
> b/drivers/platform/x86/lenovo/Kconfig
> index d22b774e0236f..587da1c602ca0 100644
> --- a/drivers/platform/x86/lenovo/Kconfig
> +++ b/drivers/platform/x86/lenovo/Kconfig
> @@ -233,7 +233,7 @@ config YT2_1380
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called lenovo-yogabook.
>=20
> -config LENOVO_WMI_DATA01
> +config LENOVO_WMI_CAPDATA
>  	tristate
>  	depends on ACPI_WMI
>=20
> @@ -264,7 +264,7 @@ config LENOVO_WMI_TUNING
>  	tristate "Lenovo Other Mode WMI Driver"
>  	depends on ACPI_WMI
>  	select FW_ATTR_CLASS
> -	select LENOVO_WMI_DATA01
> +	select LENOVO_WMI_CAPDATA
>  	select LENOVO_WMI_EVENTS
>  	select LENOVO_WMI_HELPERS
>  	help
> diff --git a/drivers/platform/x86/lenovo/Makefile=20
> b/drivers/platform/x86/lenovo/Makefile
> index 7b2128e3a2142..91a9370f11b3a 100644
> --- a/drivers/platform/x86/lenovo/Makefile
> +++ b/drivers/platform/x86/lenovo/Makefile
> @@ -12,7 +12,7 @@ lenovo-target-$(CONFIG_LENOVO_YMC)	+=3D ymc.o
>  lenovo-target-$(CONFIG_YOGABOOK)	+=3D yogabook.o
>  lenovo-target-$(CONFIG_YT2_1380)	+=3D yoga-tab2-pro-1380-fastcharger.o
>  lenovo-target-$(CONFIG_LENOVO_WMI_CAMERA)	+=3D wmi-camera.o
> -lenovo-target-$(CONFIG_LENOVO_WMI_DATA01)	+=3D wmi-capdata01.o
> +lenovo-target-$(CONFIG_LENOVO_WMI_CAPDATA)	+=3D wmi-capdata.o
>  lenovo-target-$(CONFIG_LENOVO_WMI_EVENTS)	+=3D wmi-events.o
>  lenovo-target-$(CONFIG_LENOVO_WMI_HELPERS)	+=3D wmi-helpers.o
>  lenovo-target-$(CONFIG_LENOVO_WMI_GAMEZONE)	+=3D wmi-gamezone.o
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata01.c=20
> b/drivers/platform/x86/lenovo/wmi-capdata.c
> similarity index 60%
> rename from drivers/platform/x86/lenovo/wmi-capdata01.c
> rename to drivers/platform/x86/lenovo/wmi-capdata.c
> index fc7e3454e71dc..ba843b6604b06 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata01.c
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
> @@ -1,14 +1,17 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  /*
> - * Lenovo Capability Data 01 WMI Data Block driver.
> + * Lenovo Capability Data WMI Data Block driver.
>   *
> - * Lenovo Capability Data 01 provides information on tunable=20
> attributes used by
> - * the "Other Mode" WMI interface. The data includes if the attribute=20
> is
> - * supported by the hardware, the default_value, max_value, min_value=
,=20
> and step
> - * increment. Each attribute has multiple pages, one for each of the=20
> thermal
> - * modes managed by the Gamezone interface.
> + * Lenovo Capability Data provides information on tunable attributes=20
> used by
> + * the "Other Mode" WMI interface.
> + *
> + * Capability Data 01 includes if the attribute is supported by the=20
> hardware,
> + * and the default_value, max_value, min_value, and step increment.=20
> Each
> + * attribute has multiple pages, one for each of the thermal modes=20
> managed by
> + * the Gamezone interface.
>   *
>   * Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> + *   - Initial implementation (formerly named lenovo-wmi-capdata01)
>   */
>=20
>  #include <linux/acpi.h>
> @@ -26,55 +29,55 @@
>  #include <linux/types.h>
>  #include <linux/wmi.h>
>=20
> -#include "wmi-capdata01.h"
> +#include "wmi-capdata.h"
>=20
>  #define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3B=
E018154"
>=20
>  #define ACPI_AC_CLASS "ac_adapter"
>  #define ACPI_AC_NOTIFY_STATUS 0x80
>=20
> -struct lwmi_cd01_priv {
> +struct lwmi_cd_priv {
>  	struct notifier_block acpi_nb; /* ACPI events */
>  	struct wmi_device *wdev;
> -	struct cd01_list *list;
> +	struct cd_list *list;
>  };
>=20
> -struct cd01_list {
> +struct cd_list {
>  	struct mutex list_mutex; /* list R/W mutex */
>  	u8 count;
>  	struct capdata01 data[];
>  };
>=20
>  /**
> - * lwmi_cd01_component_bind() - Bind component to master device.
> - * @cd01_dev: Pointer to the lenovo-wmi-capdata01 driver parent devic=
e.
> + * lwmi_cd_component_bind() - Bind component to master device.
> + * @cd_dev: Pointer to the lenovo-wmi-capdata driver parent device.
>   * @om_dev: Pointer to the lenovo-wmi-other driver parent device.
> - * @data: capdata01_list object pointer used to return the capability=
 data.
> + * @data: cd_list object pointer used to return the capability data.
>   *
> - * On lenovo-wmi-other's master bind, provide a pointer to the local =
capdata01
> - * list. This is used to call lwmi_cd01_get_data to look up attribute=
 data
> + * On lenovo-wmi-other's master bind, provide a pointer to the local =
capdata
> + * list. This is used to call lwmi_cd*_get_data to look up attribute =
data
>   * from the lenovo-wmi-other driver.
>   *
>   * Return: 0
>   */
> -static int lwmi_cd01_component_bind(struct device *cd01_dev,
> -				    struct device *om_dev, void *data)
> +static int lwmi_cd_component_bind(struct device *cd_dev,
> +				  struct device *om_dev, void *data)
>  {
> -	struct lwmi_cd01_priv *priv =3D dev_get_drvdata(cd01_dev);
> -	struct cd01_list **cd01_list =3D data;
> +	struct lwmi_cd_priv *priv =3D dev_get_drvdata(cd_dev);
> +	struct cd_list **cd_list =3D data;
>=20
> -	*cd01_list =3D priv->list;
> +	*cd_list =3D priv->list;
>=20
>  	return 0;
>  }
>=20
> -static const struct component_ops lwmi_cd01_component_ops =3D {
> -	.bind =3D lwmi_cd01_component_bind,
> +static const struct component_ops lwmi_cd_component_ops =3D {
> +	.bind =3D lwmi_cd_component_bind,
>  };
>=20
>  /**
>   * lwmi_cd01_get_data - Get the data of the specified attribute
> - * @list: The lenovo-wmi-capdata01 pointer to its cd01_list struct.
> + * @list: The lenovo-wmi-capdata pointer to its cd_list struct.
>   * @attribute_id: The capdata attribute ID to be found.
>   * @output: Pointer to a capdata01 struct to return the data.
>   *
> @@ -83,7 +86,7 @@ static const struct component_ops=20
> lwmi_cd01_component_ops =3D {
>   *
>   * Return: 0 on success, or -EINVAL.
>   */
> -int lwmi_cd01_get_data(struct cd01_list *list, u32 attribute_id,=20
> struct capdata01 *output)
> +int lwmi_cd01_get_data(struct cd_list *list, u32 attribute_id, struct=20
> capdata01 *output)
>  {
>  	u8 idx;
>=20
> @@ -97,17 +100,17 @@ int lwmi_cd01_get_data(struct cd01_list *list, u3=
2=20
> attribute_id, struct capdata0
>=20
>  	return -EINVAL;
>  }
> -EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_WMI_CD01");
> +EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_WMI_CAPDATA");
>=20
>  /**
> - * lwmi_cd01_cache() - Cache all WMI data block information
> - * @priv: lenovo-wmi-capdata01 driver data.
> + * lwmi_cd_cache() - Cache all WMI data block information
> + * @priv: lenovo-wmi-capdata driver data.
>   *
>   * Loop through each WMI data block and cache the data.
>   *
>   * Return: 0 on success, or an error.
>   */
> -static int lwmi_cd01_cache(struct lwmi_cd01_priv *priv)
> +static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
>  {
>  	int idx;
>=20
> @@ -131,17 +134,17 @@ static int lwmi_cd01_cache(struct lwmi_cd01_priv=
 *priv)
>  }
>=20
>  /**
> - * lwmi_cd01_alloc() - Allocate a cd01_list struct in drvdata
> - * @priv: lenovo-wmi-capdata01 driver data.
> + * lwmi_cd_alloc() - Allocate a cd_list struct in drvdata
> + * @priv: lenovo-wmi-capdata driver data.
>   *
> - * Allocate a cd01_list struct large enough to contain data from all =
WMI data
> + * Allocate a cd_list struct large enough to contain data from all WM=
I data
>   * blocks provided by the interface.
>   *
>   * Return: 0 on success, or an error.
>   */
> -static int lwmi_cd01_alloc(struct lwmi_cd01_priv *priv)
> +static int lwmi_cd_alloc(struct lwmi_cd_priv *priv)
>  {
> -	struct cd01_list *list;
> +	struct cd_list *list;
>  	size_t list_size;
>  	int count, ret;
>=20
> @@ -163,28 +166,28 @@ static int lwmi_cd01_alloc(struct lwmi_cd01_priv=
 *priv)
>  }
>=20
>  /**
> - * lwmi_cd01_setup() - Cache all WMI data block information
> - * @priv: lenovo-wmi-capdata01 driver data.
> + * lwmi_cd_setup() - Cache all WMI data block information
> + * @priv: lenovo-wmi-capdata driver data.
>   *
> - * Allocate a cd01_list struct large enough to contain data from all =
WMI data
> + * Allocate a cd_list struct large enough to contain data from all WM=
I data
>   * blocks provided by the interface. Then loop through each data bloc=
k and
>   * cache the data.
>   *
>   * Return: 0 on success, or an error code.
>   */
> -static int lwmi_cd01_setup(struct lwmi_cd01_priv *priv)
> +static int lwmi_cd_setup(struct lwmi_cd_priv *priv)
>  {
>  	int ret;
>=20
> -	ret =3D lwmi_cd01_alloc(priv);
> +	ret =3D lwmi_cd_alloc(priv);
>  	if (ret)
>  		return ret;
>=20
> -	return lwmi_cd01_cache(priv);
> +	return lwmi_cd_cache(priv);
>  }
>=20
>  /**
> - * lwmi_cd01_notifier_call() - Call method for lenovo-wmi-capdata01=20
> driver notifier.
> + * lwmi_cd01_notifier_call() - Call method for cd01 notifier.
>   * block call chain.
>   * @nb: The notifier_block registered to lenovo-wmi-events driver.
>   * @action: Unused.
> @@ -199,17 +202,17 @@ static int lwmi_cd01_notifier_call(struct=20
> notifier_block *nb, unsigned long acti
>  				   void *data)
>  {
>  	struct acpi_bus_event *event =3D data;
> -	struct lwmi_cd01_priv *priv;
> +	struct lwmi_cd_priv *priv;
>  	int ret;
>=20
>  	if (strcmp(event->device_class, ACPI_AC_CLASS) !=3D 0)
>  		return NOTIFY_DONE;
>=20
> -	priv =3D container_of(nb, struct lwmi_cd01_priv, acpi_nb);
> +	priv =3D container_of(nb, struct lwmi_cd_priv, acpi_nb);
>=20
>  	switch (event->type) {
>  	case ACPI_AC_NOTIFY_STATUS:
> -		ret =3D lwmi_cd01_cache(priv);
> +		ret =3D lwmi_cd_cache(priv);
>  		if (ret)
>  			return NOTIFY_BAD;
>=20
> @@ -230,10 +233,9 @@ static void lwmi_cd01_unregister(void *data)
>  	unregister_acpi_notifier(acpi_nb);
>  }
>=20
> -static int lwmi_cd01_probe(struct wmi_device *wdev, const void *conte=
xt)
> -
> +static int lwmi_cd_probe(struct wmi_device *wdev, const void *context)
>  {
> -	struct lwmi_cd01_priv *priv;
> +	struct lwmi_cd_priv *priv;
>  	int ret;
>=20
>  	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> @@ -243,7 +245,7 @@ static int lwmi_cd01_probe(struct wmi_device *wdev=
,=20
> const void *context)
>  	priv->wdev =3D wdev;
>  	dev_set_drvdata(&wdev->dev, priv);
>=20
> -	ret =3D lwmi_cd01_setup(priv);
> +	ret =3D lwmi_cd_setup(priv);
>  	if (ret)
>  		return ret;
>=20
> @@ -257,27 +259,27 @@ static int lwmi_cd01_probe(struct wmi_device=20
> *wdev, const void *context)
>  	if (ret)
>  		return ret;
>=20
> -	return component_add(&wdev->dev, &lwmi_cd01_component_ops);
> +	return component_add(&wdev->dev, &lwmi_cd_component_ops);
>  }
>=20
> -static void lwmi_cd01_remove(struct wmi_device *wdev)
> +static void lwmi_cd_remove(struct wmi_device *wdev)
>  {
> -	component_del(&wdev->dev, &lwmi_cd01_component_ops);
> +	component_del(&wdev->dev, &lwmi_cd_component_ops);
>  }
>=20
> -static const struct wmi_device_id lwmi_cd01_id_table[] =3D {
> +static const struct wmi_device_id lwmi_cd_id_table[] =3D {
>  	{ LENOVO_CAPABILITY_DATA_01_GUID, NULL },
>  	{}
>  };
>=20
> -static struct wmi_driver lwmi_cd01_driver =3D {
> +static struct wmi_driver lwmi_cd_driver =3D {
>  	.driver =3D {
> -		.name =3D "lenovo_wmi_cd01",
> +		.name =3D "lenovo_wmi_capdata",
>  		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
>  	},
> -	.id_table =3D lwmi_cd01_id_table,
> -	.probe =3D lwmi_cd01_probe,
> -	.remove =3D lwmi_cd01_remove,
> +	.id_table =3D lwmi_cd_id_table,
> +	.probe =3D lwmi_cd_probe,
> +	.remove =3D lwmi_cd_remove,
>  	.no_singleton =3D true,
>  };
>=20
> @@ -290,13 +292,13 @@ static struct wmi_driver lwmi_cd01_driver =3D {
>   */
>  int lwmi_cd01_match(struct device *dev, void *data)
>  {
> -	return dev->driver =3D=3D &lwmi_cd01_driver.driver;
> +	return dev->driver =3D=3D &lwmi_cd_driver.driver;
>  }
> -EXPORT_SYMBOL_NS_GPL(lwmi_cd01_match, "LENOVO_WMI_CD01");
> +EXPORT_SYMBOL_NS_GPL(lwmi_cd01_match, "LENOVO_WMI_CAPDATA");
>=20
> -module_wmi_driver(lwmi_cd01_driver);
> +module_wmi_driver(lwmi_cd_driver);
>=20
> -MODULE_DEVICE_TABLE(wmi, lwmi_cd01_id_table);
> +MODULE_DEVICE_TABLE(wmi, lwmi_cd_id_table);
>  MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> -MODULE_DESCRIPTION("Lenovo Capability Data 01 WMI Driver");
> +MODULE_DESCRIPTION("Lenovo Capability Data WMI Driver");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata01.h=20
> b/drivers/platform/x86/lenovo/wmi-capdata.h
> similarity index 60%
> rename from drivers/platform/x86/lenovo/wmi-capdata01.h
> rename to drivers/platform/x86/lenovo/wmi-capdata.h
> index bd06c5751f68b..2a4746e38ad43 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata01.h
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> @@ -2,13 +2,13 @@
>=20
>  /* Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com> */
>=20
> -#ifndef _LENOVO_WMI_CAPDATA01_H_
> -#define _LENOVO_WMI_CAPDATA01_H_
> +#ifndef _LENOVO_WMI_CAPDATA_H_
> +#define _LENOVO_WMI_CAPDATA_H_
>=20
>  #include <linux/types.h>
>=20
>  struct device;
> -struct cd01_list;
> +struct cd_list;
>=20
>  struct capdata01 {
>  	u32 id;
> @@ -19,7 +19,7 @@ struct capdata01 {
>  	u32 max_value;
>  };
>=20
> -int lwmi_cd01_get_data(struct cd01_list *list, u32 attribute_id,=20
> struct capdata01 *output);
> +int lwmi_cd01_get_data(struct cd_list *list, u32 attribute_id, struct=20
> capdata01 *output);
>  int lwmi_cd01_match(struct device *dev, void *data);
>=20
> -#endif /* !_LENOVO_WMI_CAPDATA01_H_ */
> +#endif /* !_LENOVO_WMI_CAPDATA_H_ */
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c=20
> b/drivers/platform/x86/lenovo/wmi-other.c
> index 2a960b278f117..ef34ea742d1ac 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -34,7 +34,7 @@
>  #include <linux/types.h>
>  #include <linux/wmi.h>
>=20
> -#include "wmi-capdata01.h"
> +#include "wmi-capdata.h"
>  #include "wmi-events.h"
>  #include "wmi-gamezone.h"
>  #include "wmi-helpers.h"
> @@ -74,7 +74,10 @@ enum attribute_property {
>=20
>  struct lwmi_om_priv {
>  	struct component_master_ops *ops;
> -	struct cd01_list *cd01_list; /* only valid after capdata01 bind */
> +
> +	/* only valid after capdata bind */
> +	struct cd_list *cd01_list;
> +
>  	struct device *fw_attr_dev;
>  	struct kset *fw_attr_kset;
>  	struct notifier_block nb;
> @@ -576,7 +579,7 @@ static void lwmi_om_fw_attr_remove(struct=20
> lwmi_om_priv *priv)
>  static int lwmi_om_master_bind(struct device *dev)
>  {
>  	struct lwmi_om_priv *priv =3D dev_get_drvdata(dev);
> -	struct cd01_list *tmp_list;
> +	struct cd_list *tmp_list;
>  	int ret;
>=20
>  	ret =3D component_bind_all(dev, &tmp_list);
> @@ -657,7 +660,7 @@ static struct wmi_driver lwmi_other_driver =3D {
>=20
>  module_wmi_driver(lwmi_other_driver);
>=20
> -MODULE_IMPORT_NS("LENOVO_WMI_CD01");
> +MODULE_IMPORT_NS("LENOVO_WMI_CAPDATA");
>  MODULE_IMPORT_NS("LENOVO_WMI_HELPERS");
>  MODULE_DEVICE_TABLE(wmi, lwmi_other_id_table);
>  MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> --=20
> 2.51.0

Looks good to me.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Mark
