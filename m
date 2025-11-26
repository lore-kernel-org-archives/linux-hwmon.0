Received: from sender3-op-o15.zoho.com (sender3-op-o15.zoho.com [136.143.184.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8DE221710;
	Wed, 26 Nov 2025 14:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764165789; cv=pass; b=BJOPn58l6N8/6oBxxv2vKPS0csbWnB7LdhU1L5p0m5G9sx4grOn/sJMnOSnOsvNDbTBB+bclOSlNFyKOvPL/JbC53GH9Pzx7g+NMLYOuxF2n2xWH2ymSQexoP2b6rywxhAzk50MGW8ZdqekuVBVYTwlct9SJWKrMgUsV7FWXh94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764165789; c=relaxed/simple;
	bh=4blZfVusM3wELTXriUbbH0SG9AdSgnCmiIhEB92rERI=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=afRMnCFFZb4UzedmU0Ru5KhNIUBqlEpOXtMOLiSm8+cbL/pFVsjHjDzfZj7Mwx/rb3EvT3ZN1rjes9v59yrkPmZa5aVKGPazccc9vHGmVEjqeAfUaxrqSnN3K332RF80pQTKYJtaxBPUsoXu3IhSGaXet+qlkYVMEN1nWvdGRM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b=AsjorST8; arc=pass smtp.client-ip=136.143.184.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b="AsjorST8"
ARC-Seal: i=1; a=rsa-sha256; t=1764165765; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LC/vbtRhAYzoN5jMKJ83uA/BQAL7+0Bk/aZyXaCTbypCpvVzMRoW8y62THdZWMYF40Hnuo3O4A7Wr5sFyXbxjbiWL2w746P108CNLQffOOx84bkLC3knBD2psw1oNBC/okGIkAeEYxxr9xJiC1fh89UDAeqhUJ78CrmxZh3knFA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764165765; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=q6aW2ZULX62iEb9YOXQWzdTmWT0K4a9TcOBf5w1NmwE=; 
	b=nYHRxwDJslqlpDrNGKxWJwMawKD/vH7vzPEgy+MRlVoZib2Db4Ad2Nm/2emZioQcb8SrVzouKH5Qj3pXv+i69l6GjsPalpusVtRE8xAT/RvMmPmWKRsKThZTVEn+xYHBAE7LLLurnZAa8prSXAknsrL+RMPAXpQDz90xYHnMJ/8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764165765;
	s=zmail; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=q6aW2ZULX62iEb9YOXQWzdTmWT0K4a9TcOBf5w1NmwE=;
	b=AsjorST8IW42UNaEn3Ad0aolrl6qfF+xgaJL2MStRfyXh147xsIBKgceOGkJevQm
	+5SaEwCPwdzLdzT5S/36X0/g9zCnDIMgvzrNGfM8NdYif24rQTFC/v6t0aYN1VoIBH6
	5D0ObLNUIs9kcU+oyjjB3ptDv91exnWXHAxzyke8=
Received: by mx.zohomail.com with SMTPS id 1764165761908120.69087362981679;
	Wed, 26 Nov 2025 06:02:41 -0800 (PST)
Message-ID: <50f70b72a1149f4a17a4098a4e820bcde1069561.camel@rong.moe>
Subject: Re: [PATCH v6 5/7] platform/x86: lenovo-wmi-capdata: Add support
 for Fan Test Data
From: Rong Zhang <i@rong.moe>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Rong Zhang <i@rong.moe>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, Armin Wolf <W_Armin@gmx.de>,
 Hans de Goede <hansg@kernel.org>,  Guenter Roeck <linux@roeck-us.net>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	linux-hwmon@vger.kernel.org
In-Reply-To: <79934289-cdb4-385d-8042-e96ec37fdb55@linux.intel.com>
References: <20251122184522.18677-1-i@rong.moe>
	  <20251122184522.18677-6-i@rong.moe>
	  <1efe99d4-95ae-d76c-71f5-0a1f98292dd4@linux.intel.com>
	 <c13b6614d2ad4a3c4b938cdb04e6ebcc8f5bd95c.camel@rong.moe>
	 <79934289-cdb4-385d-8042-e96ec37fdb55@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Nov 2025 21:57:05 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-7 
X-ZohoMailClient: External

Hi Ilpo,

On Wed, 2025-11-26 at 09:44 +0200, Ilpo J=C3=A4rvinen wrote:
> On Tue, 25 Nov 2025, Rong Zhang wrote:
> > On Mon, 2025-11-24 at 18:45 +0200, Ilpo J=C3=A4rvinen wrote:
> > > On Sun, 23 Nov 2025, Rong Zhang wrote:
> > >=20
> > > > Add support for LENOVO_FAN_TEST_DATA WMI data block. Provides an
> > > > interface for querying the min/max fan speed RPM (reference data) o=
f a
> > > > given fan ID.
> > > >=20
> > > > This interface is optional. Hence, it does not bind to lenovo-wmi-o=
ther
> > > > and is not registered as a component for the moment. Appropriate bi=
nding
> > > > will be implemented in the subsequent patch.
> > > >=20
> > > > Signed-off-by: Rong Zhang <i@rong.moe>
> > > > Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > > > Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > > > ---
> > > > Changes in v4:
> > > > - Rebase on top of changes made to [PATCH v4 3/7]
> > > > - Do not register it as a component until [PATCH v4 6/7]
> > > >=20
> > > > Changes in v2:
> > > > - Reword documentation
> > > > ---
> > > >  .../wmi/devices/lenovo-wmi-other.rst          |  17 +++
> > > >  drivers/platform/x86/lenovo/wmi-capdata.c     | 102 ++++++++++++++=
++++
> > > >  drivers/platform/x86/lenovo/wmi-capdata.h     |   7 ++
> > > >  3 files changed, 126 insertions(+)
> > > >=20
> > > > diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Docum=
entation/wmi/devices/lenovo-wmi-other.rst
> > > > index fcad595d49af..821282e07d93 100644
> > > > --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> > > > +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> > > > @@ -62,6 +62,13 @@ The following firmware-attributes are implemente=
d:
> > > >   - ppt_pl2_sppt: Platform Profile Tracking Slow Package Power Trac=
king
> > > >   - ppt_pl3_fppt: Platform Profile Tracking Fast Package Power Trac=
king
> > > > =20
> > > > +LENOVO_FAN_TEST_DATA
> > > > +-------------------------
> > > > +
> > > > +WMI GUID ``B642801B-3D21-45DE-90AE-6E86F164FB21``
> > > > +
> > > > +The LENOVO_FAN_TEST_DATA interface provides reference data for sel=
f-test of
> > > > +cooling fans.
> > > > =20
> > > >  WMI interface description
> > > >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > > > @@ -115,3 +122,13 @@ data using the `bmfdec <https://github.com/pal=
i/bmfdec>`_ utility:
> > > >      [WmiDataId(3), read, Description("Data Size.")] uint32 DataSiz=
e;
> > > >      [WmiDataId(4), read, Description("Default Value"), WmiSizeIs("=
DataSize")] uint8 DefaultValue[];
> > > >    };
> > > > +
> > > > +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Descrip=
tion("Definition of Fan Test Data"), guid("{B642801B-3D21-45DE-90AE-6E86F16=
4FB21}")]
> > > > +  class LENOVO_FAN_TEST_DATA {
> > > > +    [key, read] string InstanceName;
> > > > +    [read] boolean Active;
> > > > +    [WmiDataId(1), read, Description("Mode.")] uint32 NumOfFans;
> > > > +    [WmiDataId(2), read, Description("Fan ID."), WmiSizeIs("NumOfF=
ans")] uint32 FanId[];
> > > > +    [WmiDataId(3), read, Description("Maximum Fan Speed."), WmiSiz=
eIs("NumOfFans")] uint32 FanMaxSpeed[];
> > > > +    [WmiDataId(4), read, Description("Minumum Fan Speed."), WmiSiz=
eIs("NumOfFans")] uint32 FanMinSpeed[];
> > > > +  };
> > > > diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/pl=
atform/x86/lenovo/wmi-capdata.c
> > > > index 29267c373ab3..e6392357395c 100644
> > > > --- a/drivers/platform/x86/lenovo/wmi-capdata.c
> > > > +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
> > > > @@ -13,6 +13,10 @@
> > > >   * attribute has multiple pages, one for each of the thermal modes=
 managed by
> > > >   * the Gamezone interface.
> > > >   *
> > > > + * Fan Test Data includes the max/min fan speed RPM for each fan. =
This is
> > > > + * reference data for self-test. If the fan is in good condition, =
it is capable
> > > > + * to spin faster than max RPM or slower than min RPM.
> > > > + *
> > > >   * Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> > > >   *   - Initial implementation (formerly named lenovo-wmi-capdata01=
)
> > > >   *
> > > > @@ -41,6 +45,7 @@
> > > > =20
> > > >  #define LENOVO_CAPABILITY_DATA_00_GUID "362A3AFE-3D96-4665-8530-96=
DAD5BB300E"
> > > >  #define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39=
B3BE018154"
> > > > +#define LENOVO_FAN_TEST_DATA_GUID "B642801B-3D21-45DE-90AE-6E86F16=
4FB21"
> > > > =20
> > > >  #define ACPI_AC_CLASS "ac_adapter"
> > > >  #define ACPI_AC_NOTIFY_STATUS 0x80
> > > > @@ -48,6 +53,7 @@
> > > >  enum lwmi_cd_type {
> > > >  	LENOVO_CAPABILITY_DATA_00,
> > > >  	LENOVO_CAPABILITY_DATA_01,
> > > > +	LENOVO_FAN_TEST_DATA,
> > > >  };
> > > > =20
> > > >  #define LWMI_CD_TABLE_ITEM(_type)		\
> > > > @@ -62,6 +68,7 @@ static const struct lwmi_cd_info {
> > > >  } lwmi_cd_table[] =3D {
> > > >  	LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_00),
> > > >  	LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_01),
> > > > +	LWMI_CD_TABLE_ITEM(LENOVO_FAN_TEST_DATA),
> > > >  };
> > > > =20
> > > >  struct lwmi_cd_priv {
> > > > @@ -78,6 +85,7 @@ struct cd_list {
> > > >  	union {
> > > >  		DECLARE_FLEX_ARRAY(struct capdata00, cd00);
> > > >  		DECLARE_FLEX_ARRAY(struct capdata01, cd01);
> > > > +		DECLARE_FLEX_ARRAY(struct capdata_fan, cd_fan);
> > > >  	};
> > > >  };
> > > > =20
> > > > @@ -117,6 +125,10 @@ void lwmi_cd_match_add_all(struct device *mast=
er, struct component_match **match
> > > >  		return;
> > > > =20
> > > >  	for (i =3D 0; i < ARRAY_SIZE(lwmi_cd_table); i++) {
> > > > +		/* Skip optional interfaces. */
> > > > +		if (lwmi_cd_table[i].type =3D=3D LENOVO_FAN_TEST_DATA)
> > > > +			continue;
> > > > +
> > > >  		component_match_add(master, matchptr, lwmi_cd_match,
> > > >  				    (void *)&lwmi_cd_table[i].type);
> > > >  		if (IS_ERR(*matchptr))
> > > > @@ -194,6 +206,9 @@ EXPORT_SYMBOL_NS_GPL(lwmi_cd00_get_data, "LENOV=
O_WMI_CD");
> > > >  DEF_LWMI_CDXX_GET_DATA(cd01, LENOVO_CAPABILITY_DATA_01, struct cap=
data01);
> > > >  EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_WMI_CD");
> > > > =20
> > > > +DEF_LWMI_CDXX_GET_DATA(cd_fan, LENOVO_FAN_TEST_DATA, struct capdat=
a_fan);
> > > > +EXPORT_SYMBOL_NS_GPL(lwmi_cd_fan_get_data, "LENOVO_WMI_CD");
> > > > +
> > > >  /**
> > > >   * lwmi_cd_cache() - Cache all WMI data block information
> > > >   * @priv: lenovo-wmi-capdata driver data.
> > > > @@ -217,6 +232,9 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *p=
riv)
> > > >  		p =3D &priv->list->cd01[0];
> > > >  		size =3D sizeof(priv->list->cd01[0]);
> > > >  		break;
> > > > +	case LENOVO_FAN_TEST_DATA:
> > > > +		/* Done by lwmi_cd_alloc() =3D> lwmi_cd_fan_list_alloc_cache(). =
*/
> > > > +		return 0;
> > > >  	default:
> > > >  		return -EINVAL;
> > > >  	}
> > > > @@ -239,6 +257,78 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *=
priv)
> > > >  	return 0;
> > > >  }
> > > > =20
> > > > +/**
> > > > + * lwmi_cd_fan_list_alloc_cache() - Alloc and cache Fan Test Data =
list
> > > > + * @priv: lenovo-wmi-capdata driver data.
> > > > + * @listptr: Pointer to returned cd_list pointer.
> > > > + *
> > > > + * Return: count of fans found, or an error.
> > > > + */
> > > > +static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv,=
 struct cd_list **listptr)
> > > > +{
> > > > +	u32 count, *fan_ids, *fan_min_rpms, *fan_max_rpms;
> > > > +	union acpi_object *ret_obj __free(kfree) =3D NULL;
> > >=20
> > > Since you're using __free(), please move this to where you assign the=
=20
> > > value. This is to create a pattern with cleanup helpers. The cleanup=
=20
> > > order depends on the order the variables are introduced which in some=
=20
> > > other cases may be significant.
> >=20
> > Make sense. Will move it to the last declaration lines with its
> > assignment. Thanks.
> >=20
> > > > +	struct block { u32 nr; u32 data[]; } *block;
> > >=20
> > > This is the first time I see this style anywhere in the kernel's cont=
ext,=20
> > > has there been some general discussion about this style somewhere?
> > >=20
> > > At least it seems immediately obvious to me that this style will have=
 a=20
> > > negative impact on documentability due to (too) concise use of space.
> >=20
> > Make sense. Will break it into multiple lines. Thanks.
> >=20
> > > > +	struct cd_list *list;
> > > > +	size_t size;
> > > > +	int idx;
> > > > +
> > > > +	ret_obj =3D wmidev_block_query(priv->wdev, 0);
> > > > +	if (!ret_obj)
> > > > +		return -ENODEV;
> > > > +
> > > > +	/*
> > > > +	 * This is usually caused by a dummy ACPI method. Do not return a=
n error
> > > > +	 * as failing to probe this device will result in master driver b=
eing
> > > > +	 * unbound - this behavior aligns with lwmi_cd_cache().
> > > > +	 */
> > > > +	if (ret_obj->type !=3D ACPI_TYPE_BUFFER) {
> > > > +		count =3D 0;
> > > > +		goto alloc;
> > > > +	}
> > > > +
> > > > +	size =3D ret_obj->buffer.length;
> > > > +	block =3D (struct block *)ret_obj->buffer.pointer;
> > >=20
> > > void * can be cast implicitly.
> >=20
> > `ret_obj->buffer.pointer' is a `u8 *' pointer so the cast is mandatory.
>=20
> Ah, right. I think I even tried to check it but probably picked up
> the void *pointer from struct acpi_buffer instead of the correct one.
>=20
> > Hmmm, this reminds me that `struct block' probably needs a `__packed'
> > to generate unaligned access to it.
>=20
> In all u32 struct, I don't think __packed is required. You can use pahole=
=20
> tool to check the layout if you want, but I don't think compiler adds=20
> any gaps with only u32s.

__packed is not used to compact the structure layout here, but to tell
the compiler to emit[1] unaligned access to the ACPI buffer. See also
the change to [PATCH v3 1/6] suggested by Armin:
https://lore.kernel.org/r/a0b6d30b-3cba-4760-81dc-099e8fada7c0@gmx.de/

[1]: If CONFIG_UBSAN_ALIGNMENT=3Dn, the assembly code should be the same
on x86. Otherwise, __packed effectively suppresses the alignment check
as unaligned access is expected.

Thanks,
Rong
