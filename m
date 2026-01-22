Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB8534EF09;
	Thu, 22 Jan 2026 18:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769108036; cv=none; b=r7TP03sKIRnix5rXpzfyjlBTeGoCthAvFHjYUvL9UuRQYYmNPY/aF7POeK534hxXeek1sbW49+9Krcpk1MvzM1VsWqDioLDIduCUPW2YS7YTEg9Ec53yRfr8Wn7XYIRgW8pi2ksViKqLTZydIygvp08efKF1qa71yi96M6MgNKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769108036; c=relaxed/simple;
	bh=rqIE/r34lq+yyV2SCcqKECa0MrRl/QWMRR/eKkTmLxs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=rZfSP9oGNTB2Q6mhF1xWIhgEcQdPl8CwpK/1W/iDV0+OSp5uf6/bXr6G1QSuH7TabtiLQOE86vA9NpsiWcezxp8Ws0Wg2u39J3+PUalMjLw3lEt1TqtCE6r5kS4j12sVbIdx2MJ5zO3DQO0yelIRXNl7DjkvIk8uS27afUy685I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=fw7LYMm6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NERhDCWD; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="fw7LYMm6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NERhDCWD"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 1B6F51D00165;
	Thu, 22 Jan 2026 13:53:34 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Thu, 22 Jan 2026 13:53:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1769108013;
	 x=1769194413; bh=/NIuaiW/T7gcgdW3QH4dNL8TQQdqj8GgWorYE/kKZ1U=; b=
	fw7LYMm6QDTj0qHhHlHnQJd7wbZnkMVy0phxUknjD1ZOK9I/LYFOv8sbr3w5aJlA
	V8smbD/CPcwbTny5T4O7RoKg6yIL9ExBYwrjMVM/hLTAKxdu+WZzCgvOBrAQS/g/
	fj4cqmk+J7rLwnnwCLD2Ql0xF90tSBgMEWISq8jsqroCq2HeVN92nBLM2iCw8FqM
	By1heEptTpdmCZ4+2o4DZ0NMqsHq0ijd6oTg6jUNEkf6uHAfsYpihhYEpTjCFyT1
	SHcvX815c7O990qcziPwhkNnD3ffVdJUhhqT8bk15hAgKOYGASSa4BwDe4Vu1s0N
	Gbdm2Jq8l98OTKykdtUMnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1769108013; x=
	1769194413; bh=/NIuaiW/T7gcgdW3QH4dNL8TQQdqj8GgWorYE/kKZ1U=; b=N
	ERhDCWDTfiXH1+1iVc0oGVB4S9orNFwWdp303Ha4Y8JSMTX90ehXXNF4WbhpwBy3
	LhdEzjmatY7FWXliURMszZxGJTSA21Ds1SsC4LuytFPzavYzCUlY/ZEZG3ebO8LN
	Myn2NDxDEvOV2rqamcFwyYxEqSrYpBsry62ORa3KQjt3zyiAbb7YAWDOXCF8Vt43
	s3AJQyUAbWtF42L9ei3Q/S2Mtvz5RrZwzeLZimdZg+qrS5J4BM8zy2fyF1WnO+b5
	r4BDHnL+awC/Uk2TlMCLZnR5sTnSwHGyRvVaeEJooueNs8qn2aH618OcdMduaHhm
	UCE3ePtcmybElcU71BuVA==
X-ME-Sender: <xms:LXJyaU58uXm7oXyGT3DkR5D0n5RmE-v6FcTwkeqJd6uQXWQ2r6lmsw>
    <xme:LXJyaQvVHpFRHVubx3_2Ub7unAHWD-QJvSRcsWOwJ9vyl8bRcHsxOEKEYKHy8Y5Aq
    3Qs3TVYjUL8N5iIUi9ST3w_Zz0AGjlazKMy9fH1FoMqJur0JZ41RnEv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeeileefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedfofgrrhhk
    ucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtg
    grqeenucggtffrrghtthgvrhhnpefhveekjeeuueekfefhleeljeehuedugfetffdvteek
    ffejudelffdvjeekfeehvdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmh
    grihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhn
    sggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuggvrh
    gvkhhjohhhnhdrtghlrghrkhesghhmrghilhdrtghomhdprhgtphhtthhopehkuhhurhht
    sgesghhmrghilhdrtghomhdprhgtphhtthhopeifpggrrhhmihhnsehgmhigrdguvgdprh
    gtphhtthhopehhrghnshhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehilhhpohdr
    jhgrrhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinh
    hugiesrhhovggtkhdquhhsrdhnvghtpdhrtghpthhtohepihesrhhonhhgrdhmohgvpdhr
    tghpthhtoheplhhinhhugidqhhifmhhonhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:LXJyaTFmreMVuPSxLoHFcYm5kAmXuAqGbleexdaRf7xDEcwIyj1iWA>
    <xmx:LXJyaekOSdCU8aWHsxrPHqevzOrj1f0XvIqgVRyq85YFGVnKhrg82Q>
    <xmx:LXJyaefymhYyYioLyAvZ4hl6rkEuagNeyM1S_NG-8yIWsd9t6Gta2w>
    <xmx:LXJyaUHJDQwO7UQV_CkRgsBrbaHUr3k-1K-eAI9V5sL4bBc3vSQALA>
    <xmx:LXJyaRQzr9Omp5jy4lkrcUYYGYnLMazbXp5aEBMj-WYN6AifPPIF6nes>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C03BD2CE0072; Thu, 22 Jan 2026 13:53:33 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: APKY_JiscSF7
Date: Thu, 22 Jan 2026 13:53:13 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Rong Zhang" <i@rong.moe>, "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Armin Wolf" <W_Armin@gmx.de>, "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Guenter Roeck" <linux@roeck-us.net>, "Kurt Borja" <kuurtb@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Message-Id: <b5674df1-5cf0-4a7d-8b4c-601d5080483e@app.fastmail.com>
In-Reply-To: <20260120182104.163424-5-i@rong.moe>
References: <20260120182104.163424-1-i@rong.moe>
 <20260120182104.163424-5-i@rong.moe>
Subject: Re: [PATCH v11 4/7] platform/x86: lenovo-wmi-capdata: Add support for
 Capability Data 00
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Tue, Jan 20, 2026, at 1:20 PM, Rong Zhang wrote:
> Add support for LENOVO_CAPABILITY_DATA_00 WMI data block that comes on
> "Other Mode" enabled hardware. Provides an interface for querying if a
> given attribute is supported by the hardware, as well as its default
> value.
>
> capdata00 always presents on devices with capdata01. lenovo-wmi-other
> now binds to both (no functional change intended).
>
> Signed-off-by: Rong Zhang <i@rong.moe>
> Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> Changes in v11:
> - Adopt a unified name (lenovo_wmi_capdata) for kmod, Kconfig, export
>   namespace and driver (thanks Ilpo J=C3=A4rvinen)
>
> Changes in v4:
> - Rebase on top of changes made to [PATCH v4 3/7]
>
> Changes in v2:
> - Reword documentation (thanks Derek J. Clark)
> ---
>  .../wmi/devices/lenovo-wmi-other.rst          | 15 ++++++++---
>  drivers/platform/x86/lenovo/wmi-capdata.c     | 25 +++++++++++++++++++
>  drivers/platform/x86/lenovo/wmi-capdata.h     |  8 ++++++
>  3 files changed, 45 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst=20
> b/Documentation/wmi/devices/lenovo-wmi-other.rst
> index d7928b8dfb4b5..fcad595d49af2 100644
> --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> @@ -31,13 +31,22 @@ under the following path:
>=20
>    /sys/class/firmware-attributes/lenovo-wmi-other/attributes/<attribu=
te>/
>=20
> +LENOVO_CAPABILITY_DATA_00
> +-------------------------
> +
> +WMI GUID ``362A3AFE-3D96-4665-8530-96DAD5BB300E``
> +
> +The LENOVO_CAPABILITY_DATA_00 interface provides various information =
that
> +does not rely on the gamezone thermal mode.
> +
>  LENOVO_CAPABILITY_DATA_01
>  -------------------------
>=20
>  WMI GUID ``7A8F5407-CB67-4D6E-B547-39B3BE018154``
>=20
> -The LENOVO_CAPABILITY_DATA_01 interface provides information on vario=
us
> -power limits of integrated CPU and GPU components.
> +The LENOVO_CAPABILITY_DATA_01 interface provides various information =
that
> +relies on the gamezone thermal mode, including power limits of integr=
ated
> +CPU and GPU components.
>=20
>  Each attribute has the following properties:
>   - current_value
> @@ -48,7 +57,7 @@ Each attribute has the following properties:
>   - scalar_increment
>   - type
>=20
> -The following attributes are implemented:
> +The following firmware-attributes are implemented:
>   - ppt_pl1_spl: Platform Profile Tracking Sustained Power Limit
>   - ppt_pl2_sppt: Platform Profile Tracking Slow Package Power Tracking
>   - ppt_pl3_fppt: Platform Profile Tracking Fast Package Power Tracking
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c=20
> b/drivers/platform/x86/lenovo/wmi-capdata.c
> index 93ecb49c4c73a..4ed5b73d430dc 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.c
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
> @@ -5,6 +5,9 @@
>   * Lenovo Capability Data provides information on tunable attributes=20
> used by
>   * the "Other Mode" WMI interface.
>   *
> + * Capability Data 00 includes if the attribute is supported by the=20
> hardware,
> + * and the default_value. All attributes are independent of thermal=20
> modes.
> + *
>   * Capability Data 01 includes if the attribute is supported by the=20
> hardware,
>   * and the default_value, max_value, min_value, and step increment.=20
> Each
>   * attribute has multiple pages, one for each of the thermal modes=20
> managed by
> @@ -40,12 +43,14 @@
>=20
>  #include "wmi-capdata.h"
>=20
> +#define LENOVO_CAPABILITY_DATA_00_GUID "362A3AFE-3D96-4665-8530-96DAD=
5BB300E"
>  #define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3B=
E018154"
>=20
>  #define ACPI_AC_CLASS "ac_adapter"
>  #define ACPI_AC_NOTIFY_STATUS 0x80
>=20
>  enum lwmi_cd_type {
> +	LENOVO_CAPABILITY_DATA_00,
>  	LENOVO_CAPABILITY_DATA_01,
>  };
>=20
> @@ -59,6 +64,7 @@ static const struct lwmi_cd_info {
>  	const char *name;
>  	enum lwmi_cd_type type;
>  } lwmi_cd_table[] =3D {
> +	LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_00),
>  	LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_01),
>  };
>=20
> @@ -74,6 +80,7 @@ struct cd_list {
>  	u8 count;
>=20
>  	union {
> +		DECLARE_FLEX_ARRAY(struct capdata00, cd00);
>  		DECLARE_FLEX_ARRAY(struct capdata01, cd01);
>  	};
>  };
> @@ -141,6 +148,9 @@ static int lwmi_cd_component_bind(struct device *c=
d_dev,
>  	struct lwmi_cd_binder *binder =3D data;
>=20
>  	switch (priv->list->type) {
> +	case LENOVO_CAPABILITY_DATA_00:
> +		binder->cd00_list =3D priv->list;
> +		break;
>  	case LENOVO_CAPABILITY_DATA_01:
>  		binder->cd01_list =3D priv->list;
>  		break;
> @@ -184,6 +194,9 @@ static const struct component_ops lwmi_cd_componen=
t_ops =3D {
>  		return -EINVAL;									\
>  	}
>=20
> +DEF_LWMI_CDXX_GET_DATA(cd00, LENOVO_CAPABILITY_DATA_00, struct capdat=
a00);
> +EXPORT_SYMBOL_NS_GPL(lwmi_cd00_get_data, "LENOVO_WMI_CAPDATA");
> +
>  DEF_LWMI_CDXX_GET_DATA(cd01, LENOVO_CAPABILITY_DATA_01, struct capdat=
a01);
>  EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_WMI_CAPDATA");
>=20
> @@ -202,6 +215,10 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *pri=
v)
>  	void *p;
>=20
>  	switch (priv->list->type) {
> +	case LENOVO_CAPABILITY_DATA_00:
> +		p =3D &priv->list->cd00[0];
> +		size =3D sizeof(priv->list->cd00[0]);
> +		break;
>  	case LENOVO_CAPABILITY_DATA_01:
>  		p =3D &priv->list->cd01[0];
>  		size =3D sizeof(priv->list->cd01[0]);
> @@ -247,6 +264,9 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv=
,=20
> enum lwmi_cd_type type)
>  	count =3D wmidev_instance_count(priv->wdev);
>=20
>  	switch (type) {
> +	case LENOVO_CAPABILITY_DATA_00:
> +		list_size =3D struct_size(list, cd00, count);
> +		break;
>  	case LENOVO_CAPABILITY_DATA_01:
>  		list_size =3D struct_size(list, cd01, count);
>  		break;
> @@ -359,6 +379,9 @@ static int lwmi_cd_probe(struct wmi_device *wdev,=20
> const void *context)
>  		goto out;
>=20
>  	switch (info->type) {
> +	case LENOVO_CAPABILITY_DATA_00:
> +		ret =3D component_add(&wdev->dev, &lwmi_cd_component_ops);
> +		goto out;
>  	case LENOVO_CAPABILITY_DATA_01:
>  		priv->acpi_nb.notifier_call =3D lwmi_cd01_notifier_call;
>=20
> @@ -392,6 +415,7 @@ static void lwmi_cd_remove(struct wmi_device *wdev)
>  	struct lwmi_cd_priv *priv =3D dev_get_drvdata(&wdev->dev);
>=20
>  	switch (priv->list->type) {
> +	case LENOVO_CAPABILITY_DATA_00:
>  	case LENOVO_CAPABILITY_DATA_01:
>  		component_del(&wdev->dev, &lwmi_cd_component_ops);
>  		break;
> @@ -405,6 +429,7 @@ static void lwmi_cd_remove(struct wmi_device *wdev)
>  	.context =3D &lwmi_cd_table[_type],
>=20
>  static const struct wmi_device_id lwmi_cd_id_table[] =3D {
> +	{ LWMI_CD_WDEV_ID(LENOVO_CAPABILITY_DATA_00) },
>  	{ LWMI_CD_WDEV_ID(LENOVO_CAPABILITY_DATA_01) },
>  	{}
>  };
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h=20
> b/drivers/platform/x86/lenovo/wmi-capdata.h
> index d326f9d2d1659..a6d006ef458f6 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> @@ -11,6 +11,12 @@ struct component_match;
>  struct device;
>  struct cd_list;
>=20
> +struct capdata00 {
> +	u32 id;
> +	u32 supported;
> +	u32 default_value;
> +};
> +
>  struct capdata01 {
>  	u32 id;
>  	u32 supported;
> @@ -21,10 +27,12 @@ struct capdata01 {
>  };
>=20
>  struct lwmi_cd_binder {
> +	struct cd_list *cd00_list;
>  	struct cd_list *cd01_list;
>  };
>=20
>  void lwmi_cd_match_add_all(struct device *master, struct=20
> component_match **matchptr);
> +int lwmi_cd00_get_data(struct cd_list *list, u32 attribute_id, struct=20
> capdata00 *output);
>  int lwmi_cd01_get_data(struct cd_list *list, u32 attribute_id, struct=20
> capdata01 *output);
>=20
>  #endif /* !_LENOVO_WMI_CAPDATA_H_ */
> --=20
> 2.51.0

Looks good to me.
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
