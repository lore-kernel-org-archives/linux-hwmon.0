Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783F0364E87;
	Mon, 12 Jan 2026 17:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768238725; cv=none; b=ahZyxfgzh034cVJouvDoT5NWvMXAmuMytXoATHVzty5k01asMMlMpBUeoODEo0LY7k2CAabPJBfVc5sd7zb1TTdmIbSNjbKrTpesGhJQ2lfXyAoushDb9FL/D1R3FHs5RsrICcTCwSYDpDLa/9Ys9mclsxTsbY0V6159IjNErCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768238725; c=relaxed/simple;
	bh=QVnU8ndV4X5BJ/myVlXmIlKSbhPB4GakGfTXyL7GW1E=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=CWRM5WdX2lOVClu1qx6mtMZ0i/W5NqeFcwZQN6jIEiMvWMGL3hlmK768dmdo+IFv6581kn7X2sODquW+xwFUBvN1p5xxJTekl2wVxsxRAwr85rK6lkDzOD6woylwPQ7gMUDYqv+Tkp2FD3DNkE1+Gqa5CfL23stipWsZraz04n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bFO5D7c6; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bFO5D7c6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768238723; x=1799774723;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=QVnU8ndV4X5BJ/myVlXmIlKSbhPB4GakGfTXyL7GW1E=;
  b=bFO5D7c6JAGtXvrfdcNRt0ZhaYuB6HIimiFZg2v1RUYnULkxPyLEzpg7
   XxVdnqx+ORXHwLNGESRaezBvHn54jHjfn57auq1umQ+9T3xAH+5G26FTw
   qbSSVLydK6X8pHrGnnXA7USAaNo64uRXwxr1ptwZXqzWgVv76k7RfLDEm
   CHEkdDtiHifvH8MSn4p/Do3+Hr/ExTxJRysZYzQsFnNLyCy0fg1bpZw6c
   Pz0au1tFrFCm0TCCKN6WA7IDgRfBGStTkzMh1Y0t2beTkB8f9VzTLxJR7
   aMCxdefryDACkJlbE+4PXLmlFLfnq+q4P/l/m946t7oQYaUX22dxVjXK8
   A==;
X-CSE-ConnectionGUID: dneGd9zmQCmsn1T3ikE/DQ==
X-CSE-MsgGUID: V43G6NkmRbOlZYdGfih6FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80239267"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="80239267"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 09:25:22 -0800
X-CSE-ConnectionGUID: 5rGmMs1xRnue0NevFXKHZw==
X-CSE-MsgGUID: Ir/Esw3JSg+2xchGX1TfbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="234852921"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.111])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 09:25:19 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 12 Jan 2026 19:25:15 +0200 (EET)
To: Rong Zhang <i@rong.moe>
cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Derek J. Clark" <derekjohn.clark@gmail.com>, Armin Wolf <W_Armin@gmx.de>, 
    Hans de Goede <hansg@kernel.org>, 
    =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
    Guenter Roeck <linux@roeck-us.net>, platform-driver-x86@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v7 5/7] platform/x86: lenovo-wmi-capdata: Add support
 for Fan Test Data
In-Reply-To: <20251125194959.157524-6-i@rong.moe>
Message-ID: <64d3f499-baa3-5039-dc87-c3581623ce8c@linux.intel.com>
References: <20251125194959.157524-1-i@rong.moe> <20251125194959.157524-6-i@rong.moe>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1045187270-1768238715=:1026"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1045187270-1768238715=:1026
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 26 Nov 2025, Rong Zhang wrote:

> Add support for LENOVO_FAN_TEST_DATA WMI data block. Provides an
> interface for querying the min/max fan speed RPM (reference data) of a
> given fan ID.
>=20
> This interface is optional. Hence, it does not bind to lenovo-wmi-other
> and is not registered as a component for the moment. Appropriate binding
> will be implemented in the subsequent patch.
>=20
> Signed-off-by: Rong Zhang <i@rong.moe>
> Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> Changes in v7:
> - Rearrange lwmi_cd_fan_list_alloc_cache() to drop gotos (thanks Ilpo
>   J=C3=A4rvinen)
> - Move the declarations of __free()-managed variablesto where thet are
>   assigned (ditto)
> - Prevent back-and-forth changes (ditto)
> - Improve the readablity of struct definition (ditto)
> - Emit unaligned access to the WMI block
> - Properly calculate array index when we truncate the data
>=20
> Changes in v4:
> - Rebase on top of changes made to [PATCH v4 3/7]
> - Do not register it as a component until [PATCH v4 6/7]
>=20
> Changes in v2:
> - Reword documentation
> ---
>  .../wmi/devices/lenovo-wmi-other.rst          | 17 ++++
>  drivers/platform/x86/lenovo/wmi-capdata.c     | 96 +++++++++++++++++++
>  drivers/platform/x86/lenovo/wmi-capdata.h     |  7 ++
>  3 files changed, 120 insertions(+)
>=20
> diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentati=
on/wmi/devices/lenovo-wmi-other.rst
> index fcad595d49af..821282e07d93 100644
> --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> @@ -62,6 +62,13 @@ The following firmware-attributes are implemented:
>   - ppt_pl2_sppt: Platform Profile Tracking Slow Package Power Tracking
>   - ppt_pl3_fppt: Platform Profile Tracking Fast Package Power Tracking
> =20
> +LENOVO_FAN_TEST_DATA
> +-------------------------
> +
> +WMI GUID ``B642801B-3D21-45DE-90AE-6E86F164FB21``
> +
> +The LENOVO_FAN_TEST_DATA interface provides reference data for self-test=
 of
> +cooling fans.
> =20
>  WMI interface description
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> @@ -115,3 +122,13 @@ data using the `bmfdec <https://github.com/pali/bmfd=
ec>`_ utility:
>      [WmiDataId(3), read, Description("Data Size.")] uint32 DataSize;
>      [WmiDataId(4), read, Description("Default Value"), WmiSizeIs("DataSi=
ze")] uint8 DefaultValue[];
>    };
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("=
Definition of Fan Test Data"), guid("{B642801B-3D21-45DE-90AE-6E86F164FB21}=
")]
> +  class LENOVO_FAN_TEST_DATA {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +    [WmiDataId(1), read, Description("Mode.")] uint32 NumOfFans;
> +    [WmiDataId(2), read, Description("Fan ID."), WmiSizeIs("NumOfFans")]=
 uint32 FanId[];
> +    [WmiDataId(3), read, Description("Maximum Fan Speed."), WmiSizeIs("N=
umOfFans")] uint32 FanMaxSpeed[];
> +    [WmiDataId(4), read, Description("Minumum Fan Speed."), WmiSizeIs("N=
umOfFans")] uint32 FanMinSpeed[];
> +  };
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform=
/x86/lenovo/wmi-capdata.c
> index 08a78dc490f6..9fed162abd17 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.c
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
> @@ -13,6 +13,10 @@
>   * attribute has multiple pages, one for each of the thermal modes manag=
ed by
>   * the Gamezone interface.
>   *
> + * Fan Test Data includes the max/min fan speed RPM for each fan. This i=
s
> + * reference data for self-test. If the fan is in good condition, it is =
capable
> + * to spin faster than max RPM or slower than min RPM.
> + *
>   * Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
>   *   - Initial implementation (formerly named lenovo-wmi-capdata01)
>   *
> @@ -45,6 +49,7 @@
> =20
>  #define LENOVO_CAPABILITY_DATA_00_GUID "362A3AFE-3D96-4665-8530-96DAD5BB=
300E"
>  #define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3BE01=
8154"
> +#define LENOVO_FAN_TEST_DATA_GUID "B642801B-3D21-45DE-90AE-6E86F164FB21"
> =20
>  #define ACPI_AC_CLASS "ac_adapter"
>  #define ACPI_AC_NOTIFY_STATUS 0x80
> @@ -52,6 +57,7 @@
>  enum lwmi_cd_type {
>  =09LENOVO_CAPABILITY_DATA_00,
>  =09LENOVO_CAPABILITY_DATA_01,
> +=09LENOVO_FAN_TEST_DATA,
>  };
> =20
>  #define LWMI_CD_TABLE_ITEM(_type)=09=09\
> @@ -66,6 +72,7 @@ static const struct lwmi_cd_info {
>  } lwmi_cd_table[] =3D {
>  =09LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_00),
>  =09LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_01),
> +=09LWMI_CD_TABLE_ITEM(LENOVO_FAN_TEST_DATA),
>  };
> =20
>  struct lwmi_cd_priv {
> @@ -82,6 +89,7 @@ struct cd_list {
>  =09union {
>  =09=09DECLARE_FLEX_ARRAY(struct capdata00, cd00);
>  =09=09DECLARE_FLEX_ARRAY(struct capdata01, cd01);
> +=09=09DECLARE_FLEX_ARRAY(struct capdata_fan, cd_fan);
>  =09};
>  };
> =20
> @@ -121,6 +129,10 @@ void lwmi_cd_match_add_all(struct device *master, st=
ruct component_match **match
>  =09=09return;
> =20
>  =09for (i =3D 0; i < ARRAY_SIZE(lwmi_cd_table); i++) {
> +=09=09/* Skip sub-components. */
> +=09=09if (lwmi_cd_table[i].type =3D=3D LENOVO_FAN_TEST_DATA)
> +=09=09=09continue;
> +
>  =09=09component_match_add(master, matchptr, lwmi_cd_match,
>  =09=09=09=09    (void *)&lwmi_cd_table[i].type);
>  =09=09if (IS_ERR(*matchptr))
> @@ -200,6 +212,9 @@ EXPORT_SYMBOL_NS_GPL(lwmi_cd00_get_data, "LENOVO_WMI_=
CD");
>  DEF_LWMI_CDXX_GET_DATA(cd01, LENOVO_CAPABILITY_DATA_01, struct capdata01=
);
>  EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_WMI_CD");
> =20
> +DEF_LWMI_CDXX_GET_DATA(cd_fan, LENOVO_FAN_TEST_DATA, struct capdata_fan)=
;
> +EXPORT_SYMBOL_NS_GPL(lwmi_cd_fan_get_data, "LENOVO_WMI_CD");
> +
>  /**
>   * lwmi_cd_cache() - Cache all WMI data block information
>   * @priv: lenovo-wmi-capdata driver data.
> @@ -223,6 +238,9 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
>  =09=09p =3D &priv->list->cd01[0];
>  =09=09size =3D sizeof(priv->list->cd01[0]);
>  =09=09break;
> +=09case LENOVO_FAN_TEST_DATA:
> +=09=09/* Done by lwmi_cd_alloc() =3D> lwmi_cd_fan_list_alloc_cache(). */
> +=09=09return 0;
>  =09default:
>  =09=09return -EINVAL;
>  =09}
> @@ -245,6 +263,72 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
>  =09return 0;
>  }
> =20
> +/**
> + * lwmi_cd_fan_list_alloc_cache() - Alloc and cache Fan Test Data list
> + * @priv: lenovo-wmi-capdata driver data.
> + * @listptr: Pointer to returned cd_list pointer.
> + *
> + * Return: count of fans found, or an error.
> + */
> +static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv, struc=
t cd_list **listptr)
> +{
> +=09struct cd_list *list;
> +=09size_t size;
> +=09u32 count;
> +=09int idx;
> +
> +=09/* Emit unaligned access to u8 buffer with __packed. */
> +=09struct cd_fan_block {
> +=09=09u32 nr;
> +=09=09u32 data[]; /* id[nr], max_rpm[nr], min_rpm[nr] */
> +=09} __packed * block;
> +
> +=09union acpi_object *ret_obj __free(kfree) =3D wmidev_block_query(priv-=
>wdev, 0);
> +=09if (!ret_obj)
> +=09=09return -ENODEV;
> +
> +=09if (ret_obj->type =3D=3D ACPI_TYPE_BUFFER) {
> +=09=09block =3D (struct cd_fan_block *)ret_obj->buffer.pointer;
> +=09=09size =3D ret_obj->buffer.length;
> +
> +=09=09count =3D size >=3D sizeof(*block) ? block->nr : 0;
> +=09=09if (size < struct_size(block, data, count * 3)) {
> +=09=09=09dev_warn(&priv->wdev->dev,
> +=09=09=09=09 "incomplete fan test data block: %zu < %zu, ignoring\n",
> +=09=09=09=09 size, struct_size(block, data, count * 3));
> +=09=09=09count =3D 0;
> +=09=09} else if (count > U8_MAX) {

+ limits.h

--=20
 i.

> +=09=09=09dev_warn(&priv->wdev->dev,
> +=09=09=09=09 "too many fans reported: %u > %u, truncating\n",
> +=09=09=09=09 count, U8_MAX);
> +=09=09=09count =3D U8_MAX;
> +=09=09}
> +=09} else {
> +=09=09/*
> +=09=09 * This is usually caused by a dummy ACPI method. Do not return an=
 error
> +=09=09 * as failing to probe this device will result in sub-master devic=
e being
> +=09=09 * unbound. This behavior aligns with lwmi_cd_cache().
> +=09=09 */
> +=09=09count =3D 0;
> +=09}
> +
> +=09list =3D devm_kzalloc(&priv->wdev->dev, struct_size(list, cd_fan, cou=
nt), GFP_KERNEL);
> +=09if (!list)
> +=09=09return -ENOMEM;
> +
> +=09for (idx =3D 0; idx < count; idx++) {
> +=09=09/* Do not calculate array index using count, as it may be truncate=
d. */
> +=09=09list->cd_fan[idx] =3D (struct capdata_fan) {
> +=09=09=09.id      =3D block->data[idx],
> +=09=09=09.max_rpm =3D block->data[idx + block->nr],
> +=09=09=09.min_rpm =3D block->data[idx + (2 * block->nr)],
> +=09=09};
> +=09}
> +
> +=09*listptr =3D list;
> +=09return count;
> +}
> +
>  /**
>   * lwmi_cd_alloc() - Allocate a cd_list struct in drvdata
>   * @priv: lenovo-wmi-capdata driver data.
> @@ -270,6 +354,12 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv, =
enum lwmi_cd_type type)
>  =09case LENOVO_CAPABILITY_DATA_01:
>  =09=09list_size =3D struct_size(list, cd01, count);
>  =09=09break;
> +=09case LENOVO_FAN_TEST_DATA:
> +=09=09count =3D lwmi_cd_fan_list_alloc_cache(priv, &list);
> +=09=09if (count < 0)
> +=09=09=09return count;
> +
> +=09=09goto got_list;
>  =09default:
>  =09=09return -EINVAL;
>  =09}
> @@ -278,6 +368,7 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv, e=
num lwmi_cd_type type)
>  =09if (!list)
>  =09=09return -ENOMEM;
> =20
> +got_list:
>  =09ret =3D devm_mutex_init(&priv->wdev->dev, &list->list_mutex);
>  =09if (ret)
>  =09=09return ret;
> @@ -396,6 +487,8 @@ static int lwmi_cd_probe(struct wmi_device *wdev, con=
st void *context)
> =20
>  =09=09ret =3D component_add(&wdev->dev, &lwmi_cd_component_ops);
>  =09=09goto out;
> +=09case LENOVO_FAN_TEST_DATA:
> +=09=09goto out;
>  =09default:
>  =09=09return -EINVAL;
>  =09}
> @@ -419,6 +512,8 @@ static void lwmi_cd_remove(struct wmi_device *wdev)
>  =09case LENOVO_CAPABILITY_DATA_01:
>  =09=09component_del(&wdev->dev, &lwmi_cd_component_ops);
>  =09=09break;
> +=09case LENOVO_FAN_TEST_DATA:
> +=09=09break;
>  =09default:
>  =09=09WARN_ON(1);
>  =09}
> @@ -431,6 +526,7 @@ static void lwmi_cd_remove(struct wmi_device *wdev)
>  static const struct wmi_device_id lwmi_cd_id_table[] =3D {
>  =09{ LWMI_CD_WDEV_ID(LENOVO_CAPABILITY_DATA_00) },
>  =09{ LWMI_CD_WDEV_ID(LENOVO_CAPABILITY_DATA_01) },
> +=09{ LWMI_CD_WDEV_ID(LENOVO_FAN_TEST_DATA) },
>  =09{}
>  };
> =20
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform=
/x86/lenovo/wmi-capdata.h
> index a6d006ef458f..38af4c4e4ef4 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> @@ -26,6 +26,12 @@ struct capdata01 {
>  =09u32 max_value;
>  };
> =20
> +struct capdata_fan {
> +=09u32 id;
> +=09u32 min_rpm;
> +=09u32 max_rpm;
> +};
> +
>  struct lwmi_cd_binder {
>  =09struct cd_list *cd00_list;
>  =09struct cd_list *cd01_list;
> @@ -34,5 +40,6 @@ struct lwmi_cd_binder {
>  void lwmi_cd_match_add_all(struct device *master, struct component_match=
 **matchptr);
>  int lwmi_cd00_get_data(struct cd_list *list, u32 attribute_id, struct ca=
pdata00 *output);
>  int lwmi_cd01_get_data(struct cd_list *list, u32 attribute_id, struct ca=
pdata01 *output);
> +int lwmi_cd_fan_get_data(struct cd_list *list, u32 attribute_id, struct =
capdata_fan *output);
> =20
>  #endif /* !_LENOVO_WMI_CAPDATA_H_ */
>=20

--8323328-1045187270-1768238715=:1026--
