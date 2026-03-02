Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18C738BF6E
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Mar 2026 08:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772441717; cv=pass; b=JK/2TgSBc8j3rmV9cDVdTlZSXxHhjA7hK1XyHimIeqrdl2dBulKqltNg1EWnO2wHmUrm0itP2RM7u7nlSl8FhUFthrco14SX3tNgeDLRKoMvbjzRnSVaN4LVaE2RSVGvrxnE3RhKEVLr48N+ZEIU4CVhKwr+LgvVZHHwGdNGTkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772441717; c=relaxed/simple;
	bh=bFpTLNONMCtq/hflXyzdrakhOOHzGsAXXxv5XUvHc6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=omlGl3uUBU23rS+L/mtz9soes7TCZfmA/UlbQpNrOP2HWSj1oJGV9dxQ9fN0ebnmQGMKAEpqo4Dfe/LD4HkIEf564ptF2oc6Y7qnxbhk6KDsoWfPW7L1EWjwRs8DVi0EVTw9lmwFsucegCllA21B9ePIs8rE22eCheCPuND7jyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PLcp4fjs; arc=pass smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PLcp4fjs"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7d4c65d772cso3782987a34.1
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Mar 2026 00:55:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772441715; cv=none;
        d=google.com; s=arc-20240605;
        b=VpzdWTkZ5iRS2ntVLcx8eQ9mNJOAag25yV/2OGIVma1RYCUGiHupAJlNkIu1V1MunN
         PWQvXqf1K0kdgrXesSR4LgwaEn+vhanFzQrrufbZqBtgk6EMfQ3yhfHklls0Umt2hyM/
         /oNeI3jq8XbOkvVLe5ku/qUy1zI7D6fZc2Y6vZP1H3z7Xz1caxMxbAMbHjWPY44d/pNp
         RnUtBu3oc1yogl3B8iToNFCTeXGpqK/Ee/qD2JRZilpp8kweFpIA0KZntvbiniiue1yc
         pLYxqBUDsUh7bu8+gUwKj9oZFNf+hmVODukGoPKTgI1HMIRmsiVFqPTUatmqOiHMEsJA
         rFyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ePit+T4AFW9LmVvwSqNQ9rEOMAXI8L897EaFC+SIDkg=;
        fh=zkQ+kE7GkBzsm/VfpUxGkkjqm0fWRffmex6LiZM6Yos=;
        b=LWjD+03lDgz+EPC3s+ZoqECigVog3kDFkt5GxIV4d5fLQME+SGX+/0uF5U7BLyqFH9
         rRsz+lDJ8NlJGR7fvPyc6HwA12CFDSr/Jp5Lupi+0jG05drDn5m0yL4b3dptJgzkKFjG
         kgHGv6//yTDeDa6ieYwZOYhgtLcYo/oav1vmjVz6zUPz/F9pxUsdQgFI7AoZ/v2sEc4U
         LlUZRzaWhIPy0mQbmdQZcDcNZe78HK7vaWVyCdZqYJvWKCmHlpPxxOBAiPwIAKXZIYIe
         zA5kAs55wtdeGKoDMaKTQtMmEIVyKt79GrqWfBmyJpbqH7KYJZ4urJl/fs09J498m6ki
         fbEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772441715; x=1773046515; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ePit+T4AFW9LmVvwSqNQ9rEOMAXI8L897EaFC+SIDkg=;
        b=PLcp4fjs+mIqjl/yN0Ko9QvKE7iPRmNGo8QohIukOXiu/PTvlxChDMi5rZ/MPygrsG
         U8lSQQJOQjuxVcghG6DkxEicrqP4W6F6Ak2RIHFX5+ZYq43WBILPPEm+JXcLxr8qhx3s
         fYVPSPdAGr03YjfS9E+tIGI2DmNLqFfI7/la8N1bYOER7fEA84B2boMW687Dyb6dsE+j
         ZWa3UQHg0Bkvyzjoyjd4dYFnSmuSfjmZ85JNHFVN9kTIKx+hQcuJlsxdAduLCMjQTWX5
         DGEvs6Ca0TL+ApoIvgnux4AL6FTOmHF++hWRB1Uz6bj1ll1diD4aJ66Afexena3bRUZc
         wucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772441715; x=1773046515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ePit+T4AFW9LmVvwSqNQ9rEOMAXI8L897EaFC+SIDkg=;
        b=TyK0U/Fp4567UB2Zj+t4Deji8nlQ2tcYe9OfS3/iilir84MGrFl+s9lZGLAF68VeUt
         OgFc7PujxHewomAUZ47JJRRTMmL1edeVzYPURzvumTi/OsEk1fo9+iQQ+XhVllNQI8Uv
         d7/MQcpLAtxh0XpMF3/Bu9YjHcndtUR/cN6Giiut0FxygAkF0d74ea7870ib4b5iwCi0
         02DG/N9TtPUqxA7hKBep+OCi74vTSl7frCqRnf+ZQA5YLNCHsj+jlFxEJnjw/lVvYvRm
         kutjatBDOSrnAlldvVEanO3HPyORPZWUPNi3mh47smgSbYj/uhPI0r+j/YMK8V3YUQKY
         MsFA==
X-Forwarded-Encrypted: i=1; AJvYcCWHJ1Zq+vl3f5oxBmih8+g248ojaRImony4nqNz+tHWtYZLIBue8iEoa3jlFpoBBP28pl2qlJeftBBV9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsNGcZKa/vvpQE3P/wxkIvGY1T4PM8wncwI4Hvq7wYGzogQ5LE
	QxgOr9zuepUs6ZzhmqDNYFH99Ajt4QyeDBg49dM0gj1sjqBh8AG8LGGJKt/3P+thfv2ZgXNp1LK
	rZNncJvR+vkRNrVBKNtOnPrOWaVOHvLc=
X-Gm-Gg: ATEYQzzxW7qeenFrnTmuXFNQi9vDJT0GQm2mEzLifCk+nkMwj7bVokz1qqigbl+8Xxa
	2xgM8NgJNNRovOhqcU/Xh0/HxPC4QW3kG5ciqpsdlHLUHHUddKgT80HLOFjicmvyviyGgRkwMGe
	k31gW6YkhkBkFFXw0YudizATxzTY6T8qi+e7y5QedNddYzZ9h3h2s9N8S7W3ab78bV79rxYQMdW
	WMOoHWHGiqjJyZX2L+ecvha4qem0yNCuW1XijIwb08bNIK0gjo90Zqm5E/gDu51KYfVWGr4kiXf
	mVsKgT3VVpI0OjS3ZhapZhYeUSaU55eHtkZ4JPVPzaE0AW88ptBwnAGsRgDmlMbcBGZ2E6btgoI
	=
X-Received: by 2002:a05:6870:330b:b0:3d3:d18f:8920 with SMTP id
 586e51a60fabf-41626fba307mr7800002fac.31.1772441714550; Mon, 02 Mar 2026
 00:55:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302002729.19438-1-dakr@kernel.org> <20260302002729.19438-4-dakr@kernel.org>
In-Reply-To: <20260302002729.19438-4-dakr@kernel.org>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Mon, 2 Mar 2026 16:55:04 +0800
X-Gm-Features: AaiRm51xUTuS6Qp9H7dqDZ552mwa44_EA1IClTLmHMV7GPVb6Uir69uksp6caw0
Message-ID: <CALbr=LbNE+aviHf+EwZNohzm86skWJu=adQsHaM98vQyKUAyvQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] driver core: platform: use generic driver_override infrastructure
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, abelvesa@kernel.org, 
	srini@kernel.org, s.nawrocki@samsung.com, nuno.sa@analog.com, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sh@vger.kernel.org, Wang Jiayue <akaieurus@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 2, 2026 at 8:28=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> When a driver is probed through __driver_attach(), the bus' match()
> callback is called without the device lock held, thus accessing the
> driver_override field without a lock, which can cause a UAF.
>
> Fix this by using the driver-core driver_override infrastructure taking
> care of proper locking internally.
>
> Note that calling match() from __driver_attach() without the device lock
> held is intentional. [1]
>
> Link: https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@kern=
el.org/ [1]
> Reported-by: Gui-Dong Han <hanguidong02@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D220789
> Fixes: 3d713e0e382e ("driver core: platform: add device binding path 'dri=
ver_override'")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Looks good to me.

One minor note for the commit message: this UAF can also be triggered
from the bind_store path, not just __driver_attach(). It would be good
to mention this as well.

Reviewed-by: Gui-Dong Han <hanguidong02@gmail.com>

> ---
>  arch/sh/drivers/platform_early.c |  6 ++++--
>  drivers/base/platform.c          | 35 +++++---------------------------
>  drivers/bus/simple-pm-bus.c      |  4 ++--
>  drivers/clk/imx/clk-scu.c        |  3 +--
>  drivers/slimbus/qcom-ngd-ctrl.c  |  6 ++----
>  include/linux/platform_device.h  |  5 -----
>  sound/soc/samsung/i2s.c          |  6 +++---
>  7 files changed, 17 insertions(+), 48 deletions(-)
>
> diff --git a/arch/sh/drivers/platform_early.c b/arch/sh/drivers/platform_=
early.c
> index 143747c45206..3cd17bb0be67 100644
> --- a/arch/sh/drivers/platform_early.c
> +++ b/arch/sh/drivers/platform_early.c
> @@ -25,10 +25,12 @@ static int platform_match(struct device *dev, struct =
device_driver *drv)
>  {
>         struct platform_device *pdev =3D to_platform_device(dev);
>         struct platform_driver *pdrv =3D to_platform_driver(drv);
> +       int ret;
>
>         /* When driver_override is set, only bind to the matching driver =
*/
> -       if (pdev->driver_override)
> -               return !strcmp(pdev->driver_override, drv->name);
> +       ret =3D device_match_driver_override(dev, drv);
> +       if (ret >=3D 0)
> +               return ret;
>
>         /* Then try to match against the id table */
>         if (pdrv->id_table)
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index b45d41b018ca..22ae87921a7a 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -603,7 +603,6 @@ static void platform_device_release(struct device *de=
v)
>         kfree(pa->pdev.dev.platform_data);
>         kfree(pa->pdev.mfd_cell);
>         kfree(pa->pdev.resource);
> -       kfree(pa->pdev.driver_override);
>         kfree(pa);
>  }
>
> @@ -1306,33 +1305,7 @@ static ssize_t numa_node_show(struct device *dev,
>  }
>  static DEVICE_ATTR_RO(numa_node);
>
> -static ssize_t driver_override_show(struct device *dev,
> -                                   struct device_attribute *attr, char *=
buf)
> -{
> -       struct platform_device *pdev =3D to_platform_device(dev);
> -       ssize_t len;
> -
> -       device_lock(dev);
> -       len =3D sysfs_emit(buf, "%s\n", pdev->driver_override);
> -       device_unlock(dev);
> -
> -       return len;
> -}
> -
> -static ssize_t driver_override_store(struct device *dev,
> -                                    struct device_attribute *attr,
> -                                    const char *buf, size_t count)
> -{
> -       struct platform_device *pdev =3D to_platform_device(dev);
> -       int ret;
> -
> -       ret =3D driver_set_override(dev, &pdev->driver_override, buf, cou=
nt);
> -       if (ret)
> -               return ret;
> -
> -       return count;
> -}
> -static DEVICE_ATTR_RW(driver_override);
> +DEVICE_ATTR_DRIVER_OVERRIDE();
>
>  static struct attribute *platform_dev_attrs[] =3D {
>         &dev_attr_modalias.attr,
> @@ -1377,10 +1350,12 @@ static int platform_match(struct device *dev, con=
st struct device_driver *drv)
>  {
>         struct platform_device *pdev =3D to_platform_device(dev);
>         struct platform_driver *pdrv =3D to_platform_driver(drv);
> +       int ret;
>
>         /* When driver_override is set, only bind to the matching driver =
*/
> -       if (pdev->driver_override)
> -               return !strcmp(pdev->driver_override, drv->name);
> +       ret =3D device_match_driver_override(dev, drv);
> +       if (ret >=3D 0)
> +               return ret;
>
>         /* Attempt an OF style match first */
>         if (of_driver_match_device(dev, drv))
> diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
> index 3f00d953fb9a..c920bd6fbaaf 100644
> --- a/drivers/bus/simple-pm-bus.c
> +++ b/drivers/bus/simple-pm-bus.c
> @@ -36,7 +36,7 @@ static int simple_pm_bus_probe(struct platform_device *=
pdev)
>          * that's not listed in simple_pm_bus_of_match. We don't want to =
do any
>          * of the simple-pm-bus tasks for these devices, so return early.
>          */
> -       if (pdev->driver_override)
> +       if (device_has_driver_override(&pdev->dev))
>                 return 0;
>
>         match =3D of_match_device(dev->driver->of_match_table, dev);
> @@ -78,7 +78,7 @@ static void simple_pm_bus_remove(struct platform_device=
 *pdev)
>  {
>         const void *data =3D of_device_get_match_data(&pdev->dev);
>
> -       if (pdev->driver_override || data)
> +       if (device_has_driver_override(&pdev->dev) || data)
>                 return;
>
>         dev_dbg(&pdev->dev, "%s\n", __func__);
> diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
> index a85ec48a798b..9b33df9967ec 100644
> --- a/drivers/clk/imx/clk-scu.c
> +++ b/drivers/clk/imx/clk-scu.c
> @@ -706,8 +706,7 @@ struct clk_hw *imx_clk_scu_alloc_dev(const char *name=
,
>         if (ret)
>                 goto put_device;
>
> -       ret =3D driver_set_override(&pdev->dev, &pdev->driver_override,
> -                                 "imx-scu-clk", strlen("imx-scu-clk"));
> +       ret =3D device_set_driver_override(&pdev->dev, "imx-scu-clk");
>         if (ret)
>                 goto put_device;
>
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-c=
trl.c
> index 9aa7218b4e8d..1ed6be6e85d2 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -1535,10 +1535,8 @@ static int of_qcom_slim_ngd_register(struct device=
 *parent,
>                 ngd->id =3D id;
>                 ngd->pdev->dev.parent =3D parent;
>
> -               ret =3D driver_set_override(&ngd->pdev->dev,
> -                                         &ngd->pdev->driver_override,
> -                                         QCOM_SLIM_NGD_DRV_NAME,
> -                                         strlen(QCOM_SLIM_NGD_DRV_NAME))=
;
> +               ret =3D device_set_driver_override(&ngd->pdev->dev,
> +                                                QCOM_SLIM_NGD_DRV_NAME);
>                 if (ret) {
>                         platform_device_put(ngd->pdev);
>                         kfree(ngd);
> diff --git a/include/linux/platform_device.h b/include/linux/platform_dev=
ice.h
> index 813da101b5bf..ed1d50d1c3c1 100644
> --- a/include/linux/platform_device.h
> +++ b/include/linux/platform_device.h
> @@ -31,11 +31,6 @@ struct platform_device {
>         struct resource *resource;
>
>         const struct platform_device_id *id_entry;
> -       /*
> -        * Driver name to force a match.  Do not set directly, because co=
re
> -        * frees it.  Use driver_set_override() to set or clear it.
> -        */
> -       const char *driver_override;
>
>         /* MFD cell pointer */
>         struct mfd_cell *mfd_cell;
> diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
> index e9964f0e010a..140907a41a70 100644
> --- a/sound/soc/samsung/i2s.c
> +++ b/sound/soc/samsung/i2s.c
> @@ -1360,10 +1360,10 @@ static int i2s_create_secondary_device(struct sam=
sung_i2s_priv *priv)
>         if (!pdev_sec)
>                 return -ENOMEM;
>
> -       pdev_sec->driver_override =3D kstrdup("samsung-i2s", GFP_KERNEL);
> -       if (!pdev_sec->driver_override) {
> +       ret =3D device_set_driver_override(&pdev_sec->dev, "samsung-i2s")=
;
> +       if (ret) {
>                 platform_device_put(pdev_sec);
> -               return -ENOMEM;
> +               return ret;
>         }
>
>         ret =3D platform_device_add(pdev_sec);
> --
> 2.53.0
>
