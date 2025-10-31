Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D08126E6FD
	for <linux-hwmon@vger.kernel.org>; Fri, 31 Oct 2025 01:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761875912; cv=none; b=ZLIUVtYZDtYKuAkVKJR//dgyEeXE8axm+9ywqeWYYj0RXf1Np9tEA4R8bplJ5Ku9iZmGQP7hFWc2nBr8ORgTAP7GEJzgFTw6pVmnlH0YWBWWGBtX4coS3Kh0VxCs/TsKFaSYQbZgT4mxMmYPk0gczisrAT4PHLdgL5W4pcz7fdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761875912; c=relaxed/simple;
	bh=qoLOLJ8CghwzAKD1P8AgatCrUQWPeocUhlHkDqWseAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t7xWAKjkUjO23j84IbjMe0fRaJ4xhBLtdnsdszOqIQXty5oLeid+CExj3mOofM+WJ+KoRfbYgzvbaagbcr4AcJ98u3js/T1cq2tzrTqHCj0uzSK0wGR2s78xTuN7yBiACzk3wi2M2lge1BolPhRUg1TCIhxJHU6IzIlcogF6n54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LpewS+py; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LpewS+py"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4e89de04d62so14130831cf.0
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Oct 2025 18:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761875909; x=1762480709; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdzsK5YWfwrx5m88qzgoweuH/29p0dfJPHsfsCuX24c=;
        b=LpewS+pyCBFY5+qXsDua/l2zHp69vVLZMICj4QSr/sHEUjP37Xn6U2e72rXWSl8lcG
         ptQUOOX48DVVnn/O7K33rtjvKgxv1cCea8U14yVlmEUatwFx2UM6MOwlgzUGbk5BsmKJ
         jx0VGVqvipC6YstdP1gDqS9259WUdjYHARK6w0KVtfkdMmWj8kq2MIX+PWjgsKqp3Mxi
         4iQsQLcEcNQpTD2iH0A4lA4yVU1ISHQ8fIymwE8xpoWGYYmYx6vLlhCNKnEFA95ntT/p
         xCMB0wWseEAyXidULSsyQFGok/68Ecq3qEkuThKzQG0xovVhxnnzWNCuvARTcaG+L50L
         0XnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761875909; x=1762480709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bdzsK5YWfwrx5m88qzgoweuH/29p0dfJPHsfsCuX24c=;
        b=svoHO+vUoDoJFYw7VxN1hBCqS/U2V0suJkHTBCnpnMFyrgag7Pg3yzRZ8IX6LUyXQC
         b9iXoboy0Am1PSXiLELzk8FSMRIx/AHZMlELg7p2Y8hFnBgDmnP2h6P+VH8m0J/+Jnz5
         /DE5WdHFKyab+Fplbw9x6fuUcTIh/kX7RBxbcM+Hj0Yx5RPH6R63DCpkMG6dsqwTOLks
         KWVClrJqEERo5wYPQBQ91ehwytJJPoXyHx2UpByCm0VcOxJIyUneQwVrnPCKVBQcIrox
         NyN4TFUJ9H5txuzHKbaQ6rsNV9lzBhVic8xS9hVN60KJ8+v5r5qXCyxkSX4RCYl2cNq2
         YdiA==
X-Forwarded-Encrypted: i=1; AJvYcCVWkhw9YerukbLUIWK/ex//rxJ03ZEOrKnha9I8StURi4G2cRLOqpqF4TxAsIFwRItGkIguOQr6vwvv9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWYZxL/oHuFUXaeO4LjewuKdZJNFWQjrF9BOBolZRsuxSClSc2
	46SmMsbPWPBrWUBQ7uV2rHlzRnFxEnoXWhwSPcgX7MTobGBvn4WWuYl9l3q+c/1s6AO2MhuEdgC
	8CbfJXlMMm1N27P91xGhWvJ3iJgNt6/g=
X-Gm-Gg: ASbGncvkCUWJjRQ0jvsup/qWCucYLYn/OeOlFY1FSZ5gw5VLOSKyJPvU21QChXP2yHl
	pfhZySWL3ha4r450OiNzsdIRfh1ADD8uDR62NprHHDP2CUwo/r1cXSkLO8oCD0hX2V0gE4HimQv
	jb8K5oBII2rc3/JfpSlbp8xNtQKR7n+FvCDWNmZJyDNnoReEmt7L08JUlmG8Ex77qGwmBekG6YH
	LFGUSUPirGPvdoeVqzkkEUSq0xUw+wlRaluMhXK3YxfHutyh+jYrpGkNQRp3kZRhx8xGjLI
X-Google-Smtp-Source: AGHT+IFRHV5MyeEMU+rr0VowwH5Pr0w1ilg/JQkRhiBeRexrq9HNDOOWm+yQF/vsSy2r2tbJfcy9F+Rm0j3QEsvHz8Y=
X-Received: by 2002:a05:622a:5408:b0:4e8:acea:6c86 with SMTP id
 d75a77b69052e-4ed30d514abmr21883291cf.14.1761875908851; Thu, 30 Oct 2025
 18:58:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251030193955.107148-1-i@rong.moe> <20251030193955.107148-6-i@rong.moe>
In-Reply-To: <20251030193955.107148-6-i@rong.moe>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Thu, 30 Oct 2025 18:58:18 -0700
X-Gm-Features: AWmQ_bmmxyOUrDhs21Q8LkgwgF9C9DC8QxD5a3cyHLJJ9H0KTHwj9LCCNvyHdVc
Message-ID: <CAFqHKTmCfk2zfMvNavOqEuT7NfvQG2ZCOmEpjfAChCkY3ztrzw@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] platform/x86: lenovo-wmi-capdata: Add support for
 Fan Test Data
To: Rong Zhang <i@rong.moe>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Guenter Roeck <linux@roeck-us.net>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 12:40=E2=80=AFPM Rong Zhang <i@rong.moe> wrote:
>
> Add support for LENOVO_FAN_TEST_DATA WMI data block. Provides an
> interface for querying the min/max fan speed RPM (reference data) of a
> given fan ID.
>
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
> Changes in v2:
> - Reword documentation
> ---
>  .../wmi/devices/lenovo-wmi-other.rst          |  17 +++
>  drivers/platform/x86/lenovo/wmi-capdata.c     | 102 ++++++++++++++++++
>  drivers/platform/x86/lenovo/wmi-capdata.h     |   8 ++
>  3 files changed, 127 insertions(+)
>
> diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentati=
on/wmi/devices/lenovo-wmi-other.rst
> index fcad595d49af2..821282e07d93c 100644
> --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> @@ -62,6 +62,13 @@ The following firmware-attributes are implemented:
>   - ppt_pl2_sppt: Platform Profile Tracking Slow Package Power Tracking
>   - ppt_pl3_fppt: Platform Profile Tracking Fast Package Power Tracking
>
> +LENOVO_FAN_TEST_DATA
> +-------------------------
> +
> +WMI GUID ``B642801B-3D21-45DE-90AE-6E86F164FB21``
> +
> +The LENOVO_FAN_TEST_DATA interface provides reference data for self-test=
 of
> +cooling fans.
>
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
> index e8ec30701d883..e456aace87f24 100644
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
> @@ -41,6 +45,7 @@
>
>  #define LENOVO_CAPABILITY_DATA_00_GUID "362A3AFE-3D96-4665-8530-96DAD5BB=
300E"
>  #define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3BE01=
8154"
> +#define LENOVO_FAN_TEST_DATA_GUID "B642801B-3D21-45DE-90AE-6E86F164FB21"
>
>  #define ACPI_AC_CLASS "ac_adapter"
>  #define ACPI_AC_NOTIFY_STATUS 0x80
> @@ -48,6 +53,7 @@
>  enum lwmi_cd_type {
>         LENOVO_CAPABILITY_DATA_00,
>         LENOVO_CAPABILITY_DATA_01,
> +       LENOVO_FAN_TEST_DATA,
>  };
>
>  #define LWMI_CD_TABLE_ITEM(_type)              \
> @@ -64,6 +70,7 @@ static const struct lwmi_cd_info {
>  } lwmi_cd_table[] =3D {
>         LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_00),
>         LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_01),
> +       LWMI_CD_TABLE_ITEM(LENOVO_FAN_TEST_DATA),
>  };
>
>  struct lwmi_cd_priv {
> @@ -80,6 +87,7 @@ struct cd_list {
>         union {
>                 DECLARE_FLEX_ARRAY(struct capdata00, cd00);
>                 DECLARE_FLEX_ARRAY(struct capdata01, cd01);
> +               DECLARE_FLEX_ARRAY(struct capdata_fan, cd_fan);
>         };
>  };
>
> @@ -108,6 +116,14 @@ static int lwmi_cd_component_bind(struct device *cd_=
dev,
>         case LENOVO_CAPABILITY_DATA_01:
>                 binder->cd01_list =3D priv->list;
>                 break;
> +       case LENOVO_FAN_TEST_DATA:
> +               /*
> +                * Do not expose dummy data.
> +                * See also lwmi_cd_fan_list_alloc_cache().
> +                */
> +               if (priv->list->count)
> +                       binder->cd_fan_list =3D priv->list;
> +               break;
>         default:
>                 return -EINVAL;
>         }
> @@ -152,6 +168,9 @@ EXPORT_SYMBOL_NS_GPL(lwmi_cd00_get_data, "LENOVO_WMI_=
CD");
>  DEF_LWMI_CDXX_GET_DATA(cd01, LENOVO_CAPABILITY_DATA_01, struct capdata01=
);
>  EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_WMI_CD");
>
> +DEF_LWMI_CDXX_GET_DATA(cd_fan, LENOVO_FAN_TEST_DATA, struct capdata_fan)=
;
> +EXPORT_SYMBOL_NS_GPL(lwmi_cd_fan_get_data, "LENOVO_WMI_CD");
> +
>  /**
>   * lwmi_cd_cache() - Cache all WMI data block information
>   * @priv: lenovo-wmi-capdata driver data.
> @@ -175,6 +194,9 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
>                 p =3D &priv->list->cd01[0];
>                 size =3D sizeof(priv->list->cd01[0]);
>                 break;
> +       case LENOVO_FAN_TEST_DATA:
> +               /* Done by lwmi_cd_alloc() =3D> lwmi_cd_fan_list_alloc_ca=
che(). */
> +               return 0;
>         default:
>                 return -EINVAL;
>         }
> @@ -197,6 +219,78 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
>         return 0;
>  }
>
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
> +       u32 count, *fan_ids, *fan_min_rpms, *fan_max_rpms;
> +       union acpi_object *ret_obj __free(kfree) =3D NULL;
> +       struct block { u32 nr; u32 data[]; } *block;
> +       struct cd_list *list;
> +       size_t size;
> +       int idx;
> +
> +       ret_obj =3D wmidev_block_query(priv->wdev, 0);
> +       if (!ret_obj)
> +               return -ENODEV;
> +
> +       /*
> +        * This is usually caused by a dummy ACPI method. Do not return a=
n error
> +        * as failing to probe this device will result in master driver b=
eing
> +        * unbound - this behavior aligns with lwmi_cd_cache().
> +        */
> +       if (ret_obj->type !=3D ACPI_TYPE_BUFFER) {
> +               count =3D 0;
> +               goto alloc;
> +       }
> +
> +       size =3D ret_obj->buffer.length;
> +       block =3D (struct block *)ret_obj->buffer.pointer;
> +
> +       count =3D size >=3D sizeof(*block) ? block->nr : 0;
> +       if (size < struct_size(block, data, count * 3)) {
> +               dev_warn(&priv->wdev->dev,
> +                        "incomplete fan test data block: %zu < %zu, igno=
ring\n",
> +                        size, struct_size(block, data, count * 3));
> +               count =3D 0;
> +       }
> +
> +       if (count =3D=3D 0)
> +               goto alloc;
> +
> +       if (count > U8_MAX) {
> +               dev_warn(&priv->wdev->dev,
> +                        "too many fans reported: %u > %u, truncating\n",
> +                        count, U8_MAX);
> +               count =3D U8_MAX;
> +       }
> +
> +       fan_ids =3D &block->data[0];
> +       fan_max_rpms =3D &block->data[count];
> +       fan_min_rpms =3D &block->data[count * 2];
> +
> +alloc:
> +       list =3D devm_kzalloc(&priv->wdev->dev, struct_size(list, cd_fan,=
 count), GFP_KERNEL);
> +       if (!list)
> +               return -ENOMEM;
> +
> +       for (idx =3D 0; idx < count; idx++) {
> +               list->cd_fan[idx] =3D (struct capdata_fan) {
> +                       .id =3D fan_ids[idx],
> +                       .min_rpm =3D fan_min_rpms[idx],
> +                       .max_rpm =3D fan_max_rpms[idx],
> +               };
> +       }
> +
> +       *listptr =3D list;
> +       return count;
> +}
> +
>  /**
>   * lwmi_cd_alloc() - Allocate a cd_list struct in drvdata
>   * @priv: lenovo-wmi-capdata driver data.
> @@ -222,6 +316,12 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv, =
enum lwmi_cd_type type)
>         case LENOVO_CAPABILITY_DATA_01:
>                 list_size =3D struct_size(list, cd01, count);
>                 break;
> +       case LENOVO_FAN_TEST_DATA:
> +               count =3D lwmi_cd_fan_list_alloc_cache(priv, &list);
> +               if (count < 0)
> +                       return count;
> +
> +               goto got_list;
>         default:
>                 return -EINVAL;
>         }
> @@ -230,6 +330,7 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv, e=
num lwmi_cd_type type)
>         if (!list)
>                 return -ENOMEM;
>
> +got_list:
>         ret =3D devm_mutex_init(&priv->wdev->dev, &list->list_mutex);
>         if (ret)
>                 return ret;
> @@ -368,6 +469,7 @@ static void lwmi_cd_remove(struct wmi_device *wdev)
>  static const struct wmi_device_id lwmi_cd_id_table[] =3D {
>         { LWMI_CD_WDEV_ID(LENOVO_CAPABILITY_DATA_00) },
>         { LWMI_CD_WDEV_ID(LENOVO_CAPABILITY_DATA_01) },
> +       { LWMI_CD_WDEV_ID(LENOVO_FAN_TEST_DATA) },
>         {}
>  };
>
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform=
/x86/lenovo/wmi-capdata.h
> index a6f0cb006e745..52bc215ac43d8 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> @@ -26,13 +26,21 @@ struct capdata01 {
>         u32 max_value;
>  };
>
> +struct capdata_fan {
> +       u32 id;
> +       u32 min_rpm;
> +       u32 max_rpm;
> +};
> +
>  struct lwmi_cd_binder {
>         struct cd_list *cd00_list;
>         struct cd_list *cd01_list;
> +       struct cd_list *cd_fan_list;
>  };
>
>  int lwmi_cd00_get_data(struct cd_list *list, u32 attribute_id, struct ca=
pdata00 *output);
>  int lwmi_cd01_get_data(struct cd_list *list, u32 attribute_id, struct ca=
pdata01 *output);
> +int lwmi_cd_fan_get_data(struct cd_list *list, u32 attribute_id, struct =
capdata_fan *output);
>  void lwmi_cd_match_add_all(struct device *master, struct component_match=
 **matchptr);
>
>  #endif /* !_LENOVO_WMI_CAPDATA_H_ */
> --
> 2.51.0
>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>

Thanks,
Derek
