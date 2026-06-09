Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D62C3F1AB6;
	Tue,  9 Jun 2026 11:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781004894; cv=none; b=dA846JZVODNNHyFMhEbnrxUK7gTPCpo36JIa5+r5ah9uzBpxpBHlQnvfwFjhJyzSzm1HQRw64HO2x1AhDGwJr9yVDzk25wbm3z2nuyKv0nJTY0JawdJMc8GkVvxdP2dAW5zmTLwRWHBrr1njBCAArnNahssywIK+6yxcN6Yy+wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781004894; c=relaxed/simple;
	bh=pPyGpgXsZf3gFAFIclIGV0Yu7pXLy5PefT8vpJs7cwY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fZn6SXP0bU5s8A7zwXGoe8tHDirBR9LzsxBJd9T6p9DDIy4mgWC8XiTSKZbdiWaQp/e0ISLfV/V5wh1y31kWKY9kwLgs8m8oVczB9MGM3hbL0xAlSokMWzZPow67ulE2SgAsVvdm+PpqmVhZZ2PGghlag8WH/r+sIJZRVhncWy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NcTKJZTq; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NcTKJZTq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781004893; x=1812540893;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=pPyGpgXsZf3gFAFIclIGV0Yu7pXLy5PefT8vpJs7cwY=;
  b=NcTKJZTq96acmAIXX+nyhhMbXLnpW2kEmz4MQ/LLY0rGKHzCApG1D1Y5
   ABHRB0od2vfw/JDFwzlllirYWHNpiPMhdr3ZvhHAdLZ4X7I95NREeHuGp
   im9fWlDPvFJIpJX4bt6Es8lVPTdBXtauGWOmqBZHiRaRMQWRoDuRsY0UE
   iY9rG+MsZSYgbjew3QZhPUbWE66B2N/w9WinTDAaZPQ+p2ary1matozWV
   bLg0Bn8sn0jaUhl8zPK/Ct1xn2nzxrhA+3jHLS6rA4qA+xmkx1IRNq7to
   rN61xMm55PjkvuJQ/tMn+wvOLOH3qYVmY8H9tI44AkKFEAozLFNT8U3Ow
   A==;
X-CSE-ConnectionGUID: 2fudrWorRLWm0uCtc/cbug==
X-CSE-MsgGUID: ncr+6cciRSmnIMWRj4lzoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="99179502"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="99179502"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 04:34:53 -0700
X-CSE-ConnectionGUID: DNWTS0U6StmiRVbM99a0ow==
X-CSE-MsgGUID: GZVzQXl8T3+bMp2SVaK/Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="243394388"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.81])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 04:34:47 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 9 Jun 2026 14:34:42 +0300 (EEST)
To: Armin Wolf <W_Armin@gmx.de>
cc: Dell.Client.Kernel@dell.com, pali@kernel.org, mjg59@srcf.ucam.org, 
    soyer@irl.hu, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux@roeck-us.net, linux-hwmon@vger.kernel.org, mario.limonciello@amd.com
Subject: Re: [PATCH v5 8/9] platform/wmi: Make sysfs attributes const
In-Reply-To: <20260605205937.530897-9-W_Armin@gmx.de>
Message-ID: <c03b52d5-fe03-06a1-aa17-5e02f76ebf88@linux.intel.com>
References: <20260605205937.530897-1-W_Armin@gmx.de> <20260605205937.530897-9-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-277772511-1781004882=:1206"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-277772511-1781004882=:1206
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 5 Jun 2026, Armin Wolf wrote:

> The sysfs core supports const attributes. Use this to mark all
> sysfs attributes as const so that they can be placed into read-only
> memory for better security.
>=20
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

> ---
>  drivers/platform/wmi/core.c | 29 ++++++++++++++++++-----------
>  1 file changed, 18 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/platform/wmi/core.c b/drivers/platform/wmi/core.c
> index 0782ebc33c00..529825dcfbfe 100644
> --- a/drivers/platform/wmi/core.c
> +++ b/drivers/platform/wmi/core.c
> @@ -858,7 +858,8 @@ static ssize_t modalias_show(struct device *dev, stru=
ct device_attribute *attr,
> =20
>  =09return sysfs_emit(buf, "wmi:%pUL\n", &wblock->gblock.guid);
>  }
> -static DEVICE_ATTR_RO(modalias);
> +
> +static const DEVICE_ATTR_RO(modalias);
> =20
>  static ssize_t guid_show(struct device *dev, struct device_attribute *at=
tr,
>  =09=09=09 char *buf)
> @@ -867,7 +868,8 @@ static ssize_t guid_show(struct device *dev, struct d=
evice_attribute *attr,
> =20
>  =09return sysfs_emit(buf, "%pUL\n", &wblock->gblock.guid);
>  }
> -static DEVICE_ATTR_RO(guid);
> +
> +static const DEVICE_ATTR_RO(guid);
> =20
>  static ssize_t instance_count_show(struct device *dev,
>  =09=09=09=09   struct device_attribute *attr, char *buf)
> @@ -876,7 +878,8 @@ static ssize_t instance_count_show(struct device *dev=
,
> =20
>  =09return sysfs_emit(buf, "%d\n", (int)wblock->gblock.instance_count);
>  }
> -static DEVICE_ATTR_RO(instance_count);
> +
> +static const DEVICE_ATTR_RO(instance_count);
> =20
>  static ssize_t expensive_show(struct device *dev,
>  =09=09=09      struct device_attribute *attr, char *buf)
> @@ -886,9 +889,10 @@ static ssize_t expensive_show(struct device *dev,
>  =09return sysfs_emit(buf, "%d\n",
>  =09=09=09  (wblock->gblock.flags & ACPI_WMI_EXPENSIVE) !=3D 0);
>  }
> -static DEVICE_ATTR_RO(expensive);
> =20
> -static struct attribute *wmi_attrs[] =3D {
> +static const DEVICE_ATTR_RO(expensive);
> +
> +static const struct attribute * const wmi_attrs[] =3D {
>  =09&dev_attr_modalias.attr,
>  =09&dev_attr_guid.attr,
>  =09&dev_attr_instance_count.attr,
> @@ -904,9 +908,10 @@ static ssize_t notify_id_show(struct device *dev, st=
ruct device_attribute *attr,
> =20
>  =09return sysfs_emit(buf, "%02X\n", (unsigned int)wblock->gblock.notify_=
id);
>  }
> -static DEVICE_ATTR_RO(notify_id);
> =20
> -static struct attribute *wmi_event_attrs[] =3D {
> +static const DEVICE_ATTR_RO(notify_id);
> +
> +static const struct attribute * const wmi_event_attrs[] =3D {
>  =09&dev_attr_notify_id.attr,
>  =09NULL
>  };
> @@ -920,7 +925,8 @@ static ssize_t object_id_show(struct device *dev, str=
uct device_attribute *attr,
>  =09return sysfs_emit(buf, "%c%c\n", wblock->gblock.object_id[0],
>  =09=09=09  wblock->gblock.object_id[1]);
>  }
> -static DEVICE_ATTR_RO(object_id);
> +
> +static const DEVICE_ATTR_RO(object_id);
> =20
>  static ssize_t setable_show(struct device *dev, struct device_attribute =
*attr,
>  =09=09=09    char *buf)
> @@ -929,16 +935,17 @@ static ssize_t setable_show(struct device *dev, str=
uct device_attribute *attr,
> =20
>  =09return sysfs_emit(buf, "%d\n", (int)wdev->setable);
>  }
> -static DEVICE_ATTR_RO(setable);
> =20
> -static struct attribute *wmi_data_attrs[] =3D {
> +static const DEVICE_ATTR_RO(setable);
> +
> +static const struct attribute * const wmi_data_attrs[] =3D {
>  =09&dev_attr_object_id.attr,
>  =09&dev_attr_setable.attr,
>  =09NULL
>  };
>  ATTRIBUTE_GROUPS(wmi_data);
> =20
> -static struct attribute *wmi_method_attrs[] =3D {
> +static const struct attribute * const wmi_method_attrs[] =3D {
>  =09&dev_attr_object_id.attr,
>  =09NULL
>  };
>=20
--8323328-277772511-1781004882=:1206--
