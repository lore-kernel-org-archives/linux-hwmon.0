Received: from sender3-op-o15.zoho.com (sender3-op-o15.zoho.com [136.143.184.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098BE32E156;
	Mon, 24 Nov 2025 20:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764015210; cv=pass; b=j4wCFSfknmsCcQ/SvvvqRCS3Euv5XwGJGK20IK0m4cZ8MLrqn1CU78CEqCIrrPVNRYeaIeRKae4RM3CnJOvmHuITdUg62WACRUyLCXZZXYl5D5Vbc3MJCcQpUGfA5bE6prM0q/qoEB/GMr09Lj3DewtnFI9BlVZcnbdUOxwUxQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764015210; c=relaxed/simple;
	bh=ilTUX8csTb2QRwWmmqJWN464t/iF377qOMehV6cRJPg=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=sy6+zWMrLfmmP5QuGgFKkXDKh2k1XuN2sD3qoa8mMCI3u2kawsG6m0lu/wBsyCF9wLubMxgZ7uSlVzXGE0JRcvtEUlGqfpKqXQgvC6+Tr8+WTG8q/50fjK0LNMKVsuw+h5g36Zm1yE/FcS4D8BETzeFSJ4N6k36KAAzbe9r70fA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b=QQMzcP0T; arc=pass smtp.client-ip=136.143.184.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b="QQMzcP0T"
ARC-Seal: i=1; a=rsa-sha256; t=1764015171; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EWUsxq+/H4/Z1u0d4monNuv7yZkahNPwx6Ds1ZdRkZ6V9uohvyGwraTjlLY9EI7YAhsPbDxKCsdsjCous1SjRPEWvh7zxOHnPon5l+VM6aJwoNjdVnWV6WnXWu4JQ7ErDPVDHsfRC6suPy5uYce0f5+MZCCPlDSwJA31/f3haRQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764015171; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zrLKIeqLA1O3P/YXPqDCLrsS/7NCrm3/YR2PnA9YdAo=; 
	b=jh6xAcTLS+Prh0SOWXBwhbrWgTxEUuhuBxjM1wvnbbi13jq2EpAaaLfoST9I/hmOsQs8K5Ob5CnKCo0XcUSkvtWY13HSgL8wuIbdbYjKFLsLeg2D3pH/d5b0PhJwwjEJVQqF59zZAFM5Quajtblmj2AY2rbM1TNsa7zth8r4msU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764015171;
	s=zmail; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=zrLKIeqLA1O3P/YXPqDCLrsS/7NCrm3/YR2PnA9YdAo=;
	b=QQMzcP0T7BbkVxpAuK3SfMvJQlrIV9HVjVv8Gj7KJg+rOVSEQLScdZFh3KxMGuv7
	wjRBOlr5ls2QWwEe+B6ppLjA1MB4/KIER34PnOF0UqdV2CsqNfaNCQEmc458b5lxlQI
	q7Oy1wfoM0/i+loqklXcJX79CfSmZVFeX8iA1Lqg=
Received: by mx.zohomail.com with SMTPS id 1764015169211598.6079782050205;
	Mon, 24 Nov 2025 12:12:49 -0800 (PST)
Message-ID: <c13b6614d2ad4a3c4b938cdb04e6ebcc8f5bd95c.camel@rong.moe>
Subject: Re: [PATCH v6 5/7] platform/x86: lenovo-wmi-capdata: Add support
 for Fan Test Data
From: Rong Zhang <i@rong.moe>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Rong Zhang <i@rong.moe>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, Armin Wolf <W_Armin@gmx.de>,
 Hans de Goede <hansg@kernel.org>,  Guenter Roeck <linux@roeck-us.net>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	linux-hwmon@vger.kernel.org
In-Reply-To: <1efe99d4-95ae-d76c-71f5-0a1f98292dd4@linux.intel.com>
References: <20251122184522.18677-1-i@rong.moe>
	 <20251122184522.18677-6-i@rong.moe>
	 <1efe99d4-95ae-d76c-71f5-0a1f98292dd4@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Nov 2025 04:07:17 +0800
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

On Mon, 2025-11-24 at 18:45 +0200, Ilpo J=C3=A4rvinen wrote:
> On Sun, 23 Nov 2025, Rong Zhang wrote:
>=20
> > Add support for LENOVO_FAN_TEST_DATA WMI data block. Provides an
> > interface for querying the min/max fan speed RPM (reference data) of a
> > given fan ID.
> >=20
> > This interface is optional. Hence, it does not bind to lenovo-wmi-other
> > and is not registered as a component for the moment. Appropriate bindin=
g
> > will be implemented in the subsequent patch.
> >=20
> > Signed-off-by: Rong Zhang <i@rong.moe>
> > Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > ---
> > Changes in v4:
> > - Rebase on top of changes made to [PATCH v4 3/7]
> > - Do not register it as a component until [PATCH v4 6/7]
> >=20
> > Changes in v2:
> > - Reword documentation
> > ---
> >  .../wmi/devices/lenovo-wmi-other.rst          |  17 +++
> >  drivers/platform/x86/lenovo/wmi-capdata.c     | 102 ++++++++++++++++++
> >  drivers/platform/x86/lenovo/wmi-capdata.h     |   7 ++
> >  3 files changed, 126 insertions(+)
> >=20
> > diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documenta=
tion/wmi/devices/lenovo-wmi-other.rst
> > index fcad595d49af..821282e07d93 100644
> > --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> > +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> > @@ -62,6 +62,13 @@ The following firmware-attributes are implemented:
> >   - ppt_pl2_sppt: Platform Profile Tracking Slow Package Power Tracking
> >   - ppt_pl3_fppt: Platform Profile Tracking Fast Package Power Tracking
> > =20
> > +LENOVO_FAN_TEST_DATA
> > +-------------------------
> > +
> > +WMI GUID ``B642801B-3D21-45DE-90AE-6E86F164FB21``
> > +
> > +The LENOVO_FAN_TEST_DATA interface provides reference data for self-te=
st of
> > +cooling fans.
> > =20
> >  WMI interface description
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > @@ -115,3 +122,13 @@ data using the `bmfdec <https://github.com/pali/bm=
fdec>`_ utility:
> >      [WmiDataId(3), read, Description("Data Size.")] uint32 DataSize;
> >      [WmiDataId(4), read, Description("Default Value"), WmiSizeIs("Data=
Size")] uint8 DefaultValue[];
> >    };
> > +
> > +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description=
("Definition of Fan Test Data"), guid("{B642801B-3D21-45DE-90AE-6E86F164FB2=
1}")]
> > +  class LENOVO_FAN_TEST_DATA {
> > +    [key, read] string InstanceName;
> > +    [read] boolean Active;
> > +    [WmiDataId(1), read, Description("Mode.")] uint32 NumOfFans;
> > +    [WmiDataId(2), read, Description("Fan ID."), WmiSizeIs("NumOfFans"=
)] uint32 FanId[];
> > +    [WmiDataId(3), read, Description("Maximum Fan Speed."), WmiSizeIs(=
"NumOfFans")] uint32 FanMaxSpeed[];
> > +    [WmiDataId(4), read, Description("Minumum Fan Speed."), WmiSizeIs(=
"NumOfFans")] uint32 FanMinSpeed[];
> > +  };
> > diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platfo=
rm/x86/lenovo/wmi-capdata.c
> > index 29267c373ab3..e6392357395c 100644
> > --- a/drivers/platform/x86/lenovo/wmi-capdata.c
> > +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
> > @@ -13,6 +13,10 @@
> >   * attribute has multiple pages, one for each of the thermal modes man=
aged by
> >   * the Gamezone interface.
> >   *
> > + * Fan Test Data includes the max/min fan speed RPM for each fan. This=
 is
> > + * reference data for self-test. If the fan is in good condition, it i=
s capable
> > + * to spin faster than max RPM or slower than min RPM.
> > + *
> >   * Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> >   *   - Initial implementation (formerly named lenovo-wmi-capdata01)
> >   *
> > @@ -41,6 +45,7 @@
> > =20
> >  #define LENOVO_CAPABILITY_DATA_00_GUID "362A3AFE-3D96-4665-8530-96DAD5=
BB300E"
> >  #define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3BE=
018154"
> > +#define LENOVO_FAN_TEST_DATA_GUID "B642801B-3D21-45DE-90AE-6E86F164FB2=
1"
> > =20
> >  #define ACPI_AC_CLASS "ac_adapter"
> >  #define ACPI_AC_NOTIFY_STATUS 0x80
> > @@ -48,6 +53,7 @@
> >  enum lwmi_cd_type {
> >  	LENOVO_CAPABILITY_DATA_00,
> >  	LENOVO_CAPABILITY_DATA_01,
> > +	LENOVO_FAN_TEST_DATA,
> >  };
> > =20
> >  #define LWMI_CD_TABLE_ITEM(_type)		\
> > @@ -62,6 +68,7 @@ static const struct lwmi_cd_info {
> >  } lwmi_cd_table[] =3D {
> >  	LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_00),
> >  	LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_01),
> > +	LWMI_CD_TABLE_ITEM(LENOVO_FAN_TEST_DATA),
> >  };
> > =20
> >  struct lwmi_cd_priv {
> > @@ -78,6 +85,7 @@ struct cd_list {
> >  	union {
> >  		DECLARE_FLEX_ARRAY(struct capdata00, cd00);
> >  		DECLARE_FLEX_ARRAY(struct capdata01, cd01);
> > +		DECLARE_FLEX_ARRAY(struct capdata_fan, cd_fan);
> >  	};
> >  };
> > =20
> > @@ -117,6 +125,10 @@ void lwmi_cd_match_add_all(struct device *master, =
struct component_match **match
> >  		return;
> > =20
> >  	for (i =3D 0; i < ARRAY_SIZE(lwmi_cd_table); i++) {
> > +		/* Skip optional interfaces. */
> > +		if (lwmi_cd_table[i].type =3D=3D LENOVO_FAN_TEST_DATA)
> > +			continue;
> > +
> >  		component_match_add(master, matchptr, lwmi_cd_match,
> >  				    (void *)&lwmi_cd_table[i].type);
> >  		if (IS_ERR(*matchptr))
> > @@ -194,6 +206,9 @@ EXPORT_SYMBOL_NS_GPL(lwmi_cd00_get_data, "LENOVO_WM=
I_CD");
> >  DEF_LWMI_CDXX_GET_DATA(cd01, LENOVO_CAPABILITY_DATA_01, struct capdata=
01);
> >  EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_WMI_CD");
> > =20
> > +DEF_LWMI_CDXX_GET_DATA(cd_fan, LENOVO_FAN_TEST_DATA, struct capdata_fa=
n);
> > +EXPORT_SYMBOL_NS_GPL(lwmi_cd_fan_get_data, "LENOVO_WMI_CD");
> > +
> >  /**
> >   * lwmi_cd_cache() - Cache all WMI data block information
> >   * @priv: lenovo-wmi-capdata driver data.
> > @@ -217,6 +232,9 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
> >  		p =3D &priv->list->cd01[0];
> >  		size =3D sizeof(priv->list->cd01[0]);
> >  		break;
> > +	case LENOVO_FAN_TEST_DATA:
> > +		/* Done by lwmi_cd_alloc() =3D> lwmi_cd_fan_list_alloc_cache(). */
> > +		return 0;
> >  	default:
> >  		return -EINVAL;
> >  	}
> > @@ -239,6 +257,78 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv=
)
> >  	return 0;
> >  }
> > =20
> > +/**
> > + * lwmi_cd_fan_list_alloc_cache() - Alloc and cache Fan Test Data list
> > + * @priv: lenovo-wmi-capdata driver data.
> > + * @listptr: Pointer to returned cd_list pointer.
> > + *
> > + * Return: count of fans found, or an error.
> > + */
> > +static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv, str=
uct cd_list **listptr)
> > +{
> > +	u32 count, *fan_ids, *fan_min_rpms, *fan_max_rpms;
> > +	union acpi_object *ret_obj __free(kfree) =3D NULL;
>=20
> Since you're using __free(), please move this to where you assign the=20
> value. This is to create a pattern with cleanup helpers. The cleanup=20
> order depends on the order the variables are introduced which in some=20
> other cases may be significant.

Make sense. Will move it to the last declaration lines with its
assignment. Thanks.

> > +	struct block { u32 nr; u32 data[]; } *block;
>=20
> This is the first time I see this style anywhere in the kernel's context,=
=20
> has there been some general discussion about this style somewhere?
>=20
> At least it seems immediately obvious to me that this style will have a=
=20
> negative impact on documentability due to (too) concise use of space.

Make sense. Will break it into multiple lines. Thanks.

> > +	struct cd_list *list;
> > +	size_t size;
> > +	int idx;
> > +
> > +	ret_obj =3D wmidev_block_query(priv->wdev, 0);
> > +	if (!ret_obj)
> > +		return -ENODEV;
> > +
> > +	/*
> > +	 * This is usually caused by a dummy ACPI method. Do not return an er=
ror
> > +	 * as failing to probe this device will result in master driver being
> > +	 * unbound - this behavior aligns with lwmi_cd_cache().
> > +	 */
> > +	if (ret_obj->type !=3D ACPI_TYPE_BUFFER) {
> > +		count =3D 0;
> > +		goto alloc;
> > +	}
> > +
> > +	size =3D ret_obj->buffer.length;
> > +	block =3D (struct block *)ret_obj->buffer.pointer;
>=20
> void * can be cast implicitly.

`ret_obj->buffer.pointer' is a `u8 *' pointer so the cast is mandatory.

Hmmm, this reminds me that `struct block' probably needs a `__packed'
to generate unaligned access to it.

> > +
> > +	count =3D size >=3D sizeof(*block) ? block->nr : 0;
> > +	if (size < struct_size(block, data, count * 3)) {
> > +		dev_warn(&priv->wdev->dev,
> > +			 "incomplete fan test data block: %zu < %zu, ignoring\n",
> > +			 size, struct_size(block, data, count * 3));
> > +		count =3D 0;
> > +	}
> > +
> > +	if (count =3D=3D 0)
> > +		goto alloc;
> > +
> > +	if (count > U8_MAX) {
> > +		dev_warn(&priv->wdev->dev,
> > +			 "too many fans reported: %u > %u, truncating\n",
> > +			 count, U8_MAX);
> > +		count =3D U8_MAX;
> > +	}
> > +
> > +	fan_ids =3D &block->data[0];
> > +	fan_max_rpms =3D &block->data[count];
> > +	fan_min_rpms =3D &block->data[count * 2];
>=20
> Please rearrange so you can remove the goto:
>=20
> 	1. limit count
> 	if (count) {
> 		...
> 	}

Nice catch! Will rearrange. Thanks.

Thanks,
Rong

> > +
> > +alloc:
> > +	list =3D devm_kzalloc(&priv->wdev->dev, struct_size(list, cd_fan, cou=
nt), GFP_KERNEL);
> > +	if (!list)
> > +		return -ENOMEM;
> > +
> > +	for (idx =3D 0; idx < count; idx++) {
> > +		list->cd_fan[idx] =3D (struct capdata_fan) {
> > +			.id =3D fan_ids[idx],
> > +			.min_rpm =3D fan_min_rpms[idx],
> > +			.max_rpm =3D fan_max_rpms[idx],
> > +		};
> > +	}
> > +
> > +	*listptr =3D list;
> > +	return count;
> > +}
> > +
> >  /**
> >   * lwmi_cd_alloc() - Allocate a cd_list struct in drvdata
> >   * @priv: lenovo-wmi-capdata driver data.
> > @@ -264,6 +354,12 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv=
, enum lwmi_cd_type type)
> >  	case LENOVO_CAPABILITY_DATA_01:
> >  		list_size =3D struct_size(list, cd01, count);
> >  		break;
> > +	case LENOVO_FAN_TEST_DATA:
> > +		count =3D lwmi_cd_fan_list_alloc_cache(priv, &list);
> > +		if (count < 0)
> > +			return count;
> > +
> > +		goto got_list;
> >  	default:
> >  		return -EINVAL;
> >  	}
> > @@ -272,6 +368,7 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv,=
 enum lwmi_cd_type type)
> >  	if (!list)
> >  		return -ENOMEM;
> > =20
> > +got_list:
> >  	ret =3D devm_mutex_init(&priv->wdev->dev, &list->list_mutex);
> >  	if (ret)
> >  		return ret;
> > @@ -390,6 +487,8 @@ static int lwmi_cd_probe(struct wmi_device *wdev, c=
onst void *context)
> > =20
> >  		ret =3D component_add(&wdev->dev, &lwmi_cd_component_ops);
> >  		goto out;
> > +	case LENOVO_FAN_TEST_DATA:
> > +		goto out;
> >  	default:
> >  		return -EINVAL;
> >  	}
> > @@ -413,6 +512,8 @@ static void lwmi_cd_remove(struct wmi_device *wdev)
> >  	case LENOVO_CAPABILITY_DATA_01:
> >  		component_del(&wdev->dev, &lwmi_cd_component_ops);
> >  		break;
> > +	case LENOVO_FAN_TEST_DATA:
> > +		break;
> >  	default:
> >  		WARN_ON(1);
> >  	}
> > @@ -425,6 +526,7 @@ static void lwmi_cd_remove(struct wmi_device *wdev)
> >  static const struct wmi_device_id lwmi_cd_id_table[] =3D {
> >  	{ LWMI_CD_WDEV_ID(LENOVO_CAPABILITY_DATA_00) },
> >  	{ LWMI_CD_WDEV_ID(LENOVO_CAPABILITY_DATA_01) },
> > +	{ LWMI_CD_WDEV_ID(LENOVO_FAN_TEST_DATA) },
> >  	{}
> >  };
> > =20
> > diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platfo=
rm/x86/lenovo/wmi-capdata.h
> > index a6d006ef458f..38af4c4e4ef4 100644
> > --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> > +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> > @@ -26,6 +26,12 @@ struct capdata01 {
> >  	u32 max_value;
> >  };
> > =20
> > +struct capdata_fan {
> > +	u32 id;
> > +	u32 min_rpm;
> > +	u32 max_rpm;
> > +};
> > +
> >  struct lwmi_cd_binder {
> >  	struct cd_list *cd00_list;
> >  	struct cd_list *cd01_list;
> > @@ -34,5 +40,6 @@ struct lwmi_cd_binder {
> >  void lwmi_cd_match_add_all(struct device *master, struct component_mat=
ch **matchptr);
> >  int lwmi_cd00_get_data(struct cd_list *list, u32 attribute_id, struct =
capdata00 *output);
> >  int lwmi_cd01_get_data(struct cd_list *list, u32 attribute_id, struct =
capdata01 *output);
> > +int lwmi_cd_fan_get_data(struct cd_list *list, u32 attribute_id, struc=
t capdata_fan *output);
> > =20
> >  #endif /* !_LENOVO_WMI_CAPDATA_H_ */
> >=20
