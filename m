Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBA22BCF5D;
	Wed, 26 Nov 2025 07:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764143094; cv=none; b=acgxpO8ORQR4esZSmQIfNKy8JBsUKaQ2gE+rYOBErK1KSL5Vticd0JGhRYuI1ljhXOxNlufjks4y0RXNk34JHy4hpD1xicuLmi+4/eFlGXCi68CMMsyli6YoE9xHMyrD1Dqt1UpcdRTA7DFAdTN6kEoKDwoG/neNzDcSdyKSfME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764143094; c=relaxed/simple;
	bh=AFpIBoHAAb4e2OfJ84HqeZPO3Dm1xm5/CCdxucyHBpo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=U02YgLWy5xbC+nVEsoJwdhoD/zJjWCcTwqoLB9WKJ5nmPWC/rQZOBjqS1pY11HmgHHAa+M+1NWC3nM4H3x8tfSS7OYSTjUDo9cI73uCzpf1jN6jswdEqqS2ENZMAcxITBei1ZMJ6pwxSWMjSVsNoYcBRd4daZRKlqANXbPBfl7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lQPOxIaS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lQPOxIaS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764143093; x=1795679093;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=AFpIBoHAAb4e2OfJ84HqeZPO3Dm1xm5/CCdxucyHBpo=;
  b=lQPOxIaSeGlSOdMJEt8XZImBFvDY8z2mt9jD1+l6/nb7nNTAfirURP2Z
   /DppcyskauMCzlREygaHhi73Ityd/jA5CK/P6nNfdz6J3dXX17DS46j7t
   IrXjn8+UBgwucgD0NF+6pJS93SJk/7a0+47lJjCVS8JKPnBPnr/8Vhq3r
   WMPlB+qpwfvHPRs6bniyGCCJUnwZXe1SQ5pyUw2DdcysfPBH3iNKokZ2D
   jRUHbLEZF28Af5//Q6zxaV34qsnk8wbC9KPlUS1L19kTaLVbA85DqLaPl
   EC8lQ+Ru9Rr4ay5C1LebZTAN52xI05en2bTV2NKF0YKK/4U+MJqiYI4Rr
   w==;
X-CSE-ConnectionGUID: k21oj2/jRH6RYjv7t93+hw==
X-CSE-MsgGUID: QDxwYIWZRQyUF0EIBgZTvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="65174731"
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; 
   d="scan'208";a="65174731"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 23:44:52 -0800
X-CSE-ConnectionGUID: ESw8DwbKQHytfETJjP9yXA==
X-CSE-MsgGUID: SMUwjhIWRBWI1JbMH/oXVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; 
   d="scan'208";a="197187051"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.97])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 23:44:48 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 26 Nov 2025 09:44:45 +0200 (EET)
To: Rong Zhang <i@rong.moe>
cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Derek J. Clark" <derekjohn.clark@gmail.com>, Armin Wolf <W_Armin@gmx.de>, 
    Hans de Goede <hansg@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v6 5/7] platform/x86: lenovo-wmi-capdata: Add support
 for Fan Test Data
In-Reply-To: <c13b6614d2ad4a3c4b938cdb04e6ebcc8f5bd95c.camel@rong.moe>
Message-ID: <79934289-cdb4-385d-8042-e96ec37fdb55@linux.intel.com>
References: <20251122184522.18677-1-i@rong.moe>  <20251122184522.18677-6-i@rong.moe>  <1efe99d4-95ae-d76c-71f5-0a1f98292dd4@linux.intel.com> <c13b6614d2ad4a3c4b938cdb04e6ebcc8f5bd95c.camel@rong.moe>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1263511143-1764142940=:968"
Content-ID: <2d2abe91-a351-d32d-1f87-657c07a76576@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1263511143-1764142940=:968
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <6be551c0-a5b2-2715-c458-46f4931ae5c0@linux.intel.com>

On Tue, 25 Nov 2025, Rong Zhang wrote:
> On Mon, 2025-11-24 at 18:45 +0200, Ilpo J=E4rvinen wrote:
> > On Sun, 23 Nov 2025, Rong Zhang wrote:
> >=20
> > > Add support for LENOVO_FAN_TEST_DATA WMI data block. Provides an
> > > interface for querying the min/max fan speed RPM (reference data) of =
a
> > > given fan ID.
> > >=20
> > > This interface is optional. Hence, it does not bind to lenovo-wmi-oth=
er
> > > and is not registered as a component for the moment. Appropriate bind=
ing
> > > will be implemented in the subsequent patch.
> > >=20
> > > Signed-off-by: Rong Zhang <i@rong.moe>
> > > Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > > Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > > ---
> > > Changes in v4:
> > > - Rebase on top of changes made to [PATCH v4 3/7]
> > > - Do not register it as a component until [PATCH v4 6/7]
> > >=20
> > > Changes in v2:
> > > - Reword documentation
> > > ---
> > >  .../wmi/devices/lenovo-wmi-other.rst          |  17 +++
> > >  drivers/platform/x86/lenovo/wmi-capdata.c     | 102 ++++++++++++++++=
++
> > >  drivers/platform/x86/lenovo/wmi-capdata.h     |   7 ++
> > >  3 files changed, 126 insertions(+)
> > >=20
> > > diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documen=
tation/wmi/devices/lenovo-wmi-other.rst
> > > index fcad595d49af..821282e07d93 100644
> > > --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> > > +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> > > @@ -62,6 +62,13 @@ The following firmware-attributes are implemented:
> > >   - ppt_pl2_sppt: Platform Profile Tracking Slow Package Power Tracki=
ng
> > >   - ppt_pl3_fppt: Platform Profile Tracking Fast Package Power Tracki=
ng
> > > =20
> > > +LENOVO_FAN_TEST_DATA
> > > +-------------------------
> > > +
> > > +WMI GUID ``B642801B-3D21-45DE-90AE-6E86F164FB21``
> > > +
> > > +The LENOVO_FAN_TEST_DATA interface provides reference data for self-=
test of
> > > +cooling fans.
> > > =20
> > >  WMI interface description
> > >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > > @@ -115,3 +122,13 @@ data using the `bmfdec <https://github.com/pali/=
bmfdec>`_ utility:
> > >      [WmiDataId(3), read, Description("Data Size.")] uint32 DataSize;
> > >      [WmiDataId(4), read, Description("Default Value"), WmiSizeIs("Da=
taSize")] uint8 DefaultValue[];
> > >    };
> > > +
> > > +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Descripti=
on("Definition of Fan Test Data"), guid("{B642801B-3D21-45DE-90AE-6E86F164F=
B21}")]
> > > +  class LENOVO_FAN_TEST_DATA {
> > > +    [key, read] string InstanceName;
> > > +    [read] boolean Active;
> > > +    [WmiDataId(1), read, Description("Mode.")] uint32 NumOfFans;
> > > +    [WmiDataId(2), read, Description("Fan ID."), WmiSizeIs("NumOfFan=
s")] uint32 FanId[];
> > > +    [WmiDataId(3), read, Description("Maximum Fan Speed."), WmiSizeI=
s("NumOfFans")] uint32 FanMaxSpeed[];
> > > +    [WmiDataId(4), read, Description("Minumum Fan Speed."), WmiSizeI=
s("NumOfFans")] uint32 FanMinSpeed[];
> > > +  };
> > > diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/plat=
form/x86/lenovo/wmi-capdata.c
> > > index 29267c373ab3..e6392357395c 100644
> > > --- a/drivers/platform/x86/lenovo/wmi-capdata.c
> > > +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
> > > @@ -13,6 +13,10 @@
> > >   * attribute has multiple pages, one for each of the thermal modes m=
anaged by
> > >   * the Gamezone interface.
> > >   *
> > > + * Fan Test Data includes the max/min fan speed RPM for each fan. Th=
is is
> > > + * reference data for self-test. If the fan is in good condition, it=
 is capable
> > > + * to spin faster than max RPM or slower than min RPM.
> > > + *
> > >   * Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> > >   *   - Initial implementation (formerly named lenovo-wmi-capdata01)
> > >   *
> > > @@ -41,6 +45,7 @@
> > > =20
> > >  #define LENOVO_CAPABILITY_DATA_00_GUID "362A3AFE-3D96-4665-8530-96DA=
D5BB300E"
> > >  #define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3=
BE018154"
> > > +#define LENOVO_FAN_TEST_DATA_GUID "B642801B-3D21-45DE-90AE-6E86F164F=
B21"
> > > =20
> > >  #define ACPI_AC_CLASS "ac_adapter"
> > >  #define ACPI_AC_NOTIFY_STATUS 0x80
> > > @@ -48,6 +53,7 @@
> > >  enum lwmi_cd_type {
> > >  =09LENOVO_CAPABILITY_DATA_00,
> > >  =09LENOVO_CAPABILITY_DATA_01,
> > > +=09LENOVO_FAN_TEST_DATA,
> > >  };
> > > =20
> > >  #define LWMI_CD_TABLE_ITEM(_type)=09=09\
> > > @@ -62,6 +68,7 @@ static const struct lwmi_cd_info {
> > >  } lwmi_cd_table[] =3D {
> > >  =09LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_00),
> > >  =09LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_01),
> > > +=09LWMI_CD_TABLE_ITEM(LENOVO_FAN_TEST_DATA),
> > >  };
> > > =20
> > >  struct lwmi_cd_priv {
> > > @@ -78,6 +85,7 @@ struct cd_list {
> > >  =09union {
> > >  =09=09DECLARE_FLEX_ARRAY(struct capdata00, cd00);
> > >  =09=09DECLARE_FLEX_ARRAY(struct capdata01, cd01);
> > > +=09=09DECLARE_FLEX_ARRAY(struct capdata_fan, cd_fan);
> > >  =09};
> > >  };
> > > =20
> > > @@ -117,6 +125,10 @@ void lwmi_cd_match_add_all(struct device *master=
, struct component_match **match
> > >  =09=09return;
> > > =20
> > >  =09for (i =3D 0; i < ARRAY_SIZE(lwmi_cd_table); i++) {
> > > +=09=09/* Skip optional interfaces. */
> > > +=09=09if (lwmi_cd_table[i].type =3D=3D LENOVO_FAN_TEST_DATA)
> > > +=09=09=09continue;
> > > +
> > >  =09=09component_match_add(master, matchptr, lwmi_cd_match,
> > >  =09=09=09=09    (void *)&lwmi_cd_table[i].type);
> > >  =09=09if (IS_ERR(*matchptr))
> > > @@ -194,6 +206,9 @@ EXPORT_SYMBOL_NS_GPL(lwmi_cd00_get_data, "LENOVO_=
WMI_CD");
> > >  DEF_LWMI_CDXX_GET_DATA(cd01, LENOVO_CAPABILITY_DATA_01, struct capda=
ta01);
> > >  EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_WMI_CD");
> > > =20
> > > +DEF_LWMI_CDXX_GET_DATA(cd_fan, LENOVO_FAN_TEST_DATA, struct capdata_=
fan);
> > > +EXPORT_SYMBOL_NS_GPL(lwmi_cd_fan_get_data, "LENOVO_WMI_CD");
> > > +
> > >  /**
> > >   * lwmi_cd_cache() - Cache all WMI data block information
> > >   * @priv: lenovo-wmi-capdata driver data.
> > > @@ -217,6 +232,9 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *pri=
v)
> > >  =09=09p =3D &priv->list->cd01[0];
> > >  =09=09size =3D sizeof(priv->list->cd01[0]);
> > >  =09=09break;
> > > +=09case LENOVO_FAN_TEST_DATA:
> > > +=09=09/* Done by lwmi_cd_alloc() =3D> lwmi_cd_fan_list_alloc_cache()=
=2E */
> > > +=09=09return 0;
> > >  =09default:
> > >  =09=09return -EINVAL;
> > >  =09}
> > > @@ -239,6 +257,78 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *pr=
iv)
> > >  =09return 0;
> > >  }
> > > =20
> > > +/**
> > > + * lwmi_cd_fan_list_alloc_cache() - Alloc and cache Fan Test Data li=
st
> > > + * @priv: lenovo-wmi-capdata driver data.
> > > + * @listptr: Pointer to returned cd_list pointer.
> > > + *
> > > + * Return: count of fans found, or an error.
> > > + */
> > > +static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv, s=
truct cd_list **listptr)
> > > +{
> > > +=09u32 count, *fan_ids, *fan_min_rpms, *fan_max_rpms;
> > > +=09union acpi_object *ret_obj __free(kfree) =3D NULL;
> >=20
> > Since you're using __free(), please move this to where you assign the=
=20
> > value. This is to create a pattern with cleanup helpers. The cleanup=20
> > order depends on the order the variables are introduced which in some=
=20
> > other cases may be significant.
>=20
> Make sense. Will move it to the last declaration lines with its
> assignment. Thanks.
>=20
> > > +=09struct block { u32 nr; u32 data[]; } *block;
> >
> > This is the first time I see this style anywhere in the kernel's contex=
t,=20
> > has there been some general discussion about this style somewhere?
> >=20
> > At least it seems immediately obvious to me that this style will have a=
=20
> > negative impact on documentability due to (too) concise use of space.
>=20
> Make sense. Will break it into multiple lines. Thanks.
>=20
> > > +=09struct cd_list *list;
> > > +=09size_t size;
> > > +=09int idx;
> > > +
> > > +=09ret_obj =3D wmidev_block_query(priv->wdev, 0);
> > > +=09if (!ret_obj)
> > > +=09=09return -ENODEV;
> > > +
> > > +=09/*
> > > +=09 * This is usually caused by a dummy ACPI method. Do not return a=
n error
> > > +=09 * as failing to probe this device will result in master driver b=
eing
> > > +=09 * unbound - this behavior aligns with lwmi_cd_cache().
> > > +=09 */
> > > +=09if (ret_obj->type !=3D ACPI_TYPE_BUFFER) {
> > > +=09=09count =3D 0;
> > > +=09=09goto alloc;
> > > +=09}
> > > +
> > > +=09size =3D ret_obj->buffer.length;
> > > +=09block =3D (struct block *)ret_obj->buffer.pointer;
> >=20
> > void * can be cast implicitly.
>=20
> `ret_obj->buffer.pointer' is a `u8 *' pointer so the cast is mandatory.

Ah, right. I think I even tried to check it but probably picked up
the void *pointer from struct acpi_buffer instead of the correct one.

> Hmmm, this reminds me that `struct block' probably needs a `__packed'
> to generate unaligned access to it.

In all u32 struct, I don't think __packed is required. You can use pahole=
=20
tool to check the layout if you want, but I don't think compiler adds=20
any gaps with only u32s.

--=20
 i.
--8323328-1263511143-1764142940=:968--
