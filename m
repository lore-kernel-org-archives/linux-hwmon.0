Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF36849AA46
	for <linux-hwmon@vger.kernel.org>; Thu, 17 Sep 2026 22:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789683012; cv=none; b=MsNwL8a1CcuHuRgDU4I7NYNWxIZOvBLAl1fLT8e1MEhIgTQNvtUHVSLvptJVabEdrA8r7ZFH1dRgvbFiGqsAIO087OZajREzgZNCYBpRDEc/ONXKTbwl/lAd+VBpNyMFn6c5240CP67MaoN2qU7ghNbppZGz9rdIfiWT6fDKX1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789683012; c=relaxed/simple;
	bh=12ZdNO7zSI97z1JPZ+K2FUDIbHGKQ4ykZe7DLc4rB7k=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EUTSYBk3+Sx6sQfNEipf1JIGDzQCJNvLgGbFCLQkRXqynaC/5t2E7dkqtCOkfTXAKYcT9zlS4Xc1EzFoqLHdYh2SoiZn0VCYxf9SByA5UHwJ0KdTWvhtl+J/5OVv2QDZl70TpN3B16OFl6Xoh3aCsuAKUjpgI+EWr4m4dF528g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yu0T3zI2; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=NTMfz2lS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yu0T3zI2";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="NTMfz2lS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789683009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8z7jGkncFvYX44ONKGgmNu9yUifGbhbRMAl3u7dsO+Y=;
	b=Yu0T3zI2kaVbKBqcjdHKigmTqHbDV2kSwdUY6dg+ZquyB8+ECWYpTR7qXhTgQ8wSWN6ncH
	iI6DNk+5TyNxEeYlZICIvk4p9hVXuUmpIGBqSA9KNMlbskqm2jmG6PuJ4/v7XnK7IFXH7F
	xgNgh0cIAL4FuYLkvbZiMj1f58I2mRk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-Zy138QnuNi692bCD9_7dxA-1; Thu, 17 Sep 2026 18:10:08 -0400
X-MC-Unique: Zy138QnuNi692bCD9_7dxA-1
X-Mimecast-MFC-AGG-ID: Zy138QnuNi692bCD9_7dxA_1789683008
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9102f07f2fdso28487766d6.0
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Sep 2026 15:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789683008; x=1790287808; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8z7jGkncFvYX44ONKGgmNu9yUifGbhbRMAl3u7dsO+Y=;
        b=NTMfz2lSR7X+hkySfNi6kz6ecEFL/BowIfKAsz+TM2DlFCfK19iF/XaUx/tBnc0a6r
         2yXKAPn+kPcJqha8Zuolr4FBeGGNQITsj5liDmUmG5YzXXCO7L1OdUGFFSt3pgRzqQ2u
         6hYBXaN+sDA7shpKu4wWgEV+4zjvbh0MGWheUeiJcU7t+A7N6V6Z1XfDiMw1IADYTBvb
         8KIo40L4m8ultqCOZwdt5gpdtabOlJYwmbqiFsjuP5NzvreX3Yfi+GmuxtCqLk/7PZkb
         9m6PU3ZU+ZSiGnrFHiwb6BVMr2Cc2U0/9n3DW3s//5vrgYoCr+ezIsGMqgkoxzXiWpE9
         IwPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789683008; x=1790287808;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8z7jGkncFvYX44ONKGgmNu9yUifGbhbRMAl3u7dsO+Y=;
        b=n+4Or3e2qu1ypTghO2fAzRao1IvW1d122CXy+wrZh0Cj1vZOG8Ptx4qDb/3JtIv3EB
         2bNDSGyZnKNX6oYJTdjZORacMojmCloA2vcWgS2zp4OPRCHX9b8FPDSSguk96Brm0enp
         vuYT2eQtmgge9NHwB/nNyajkTEYsiBRZre8xQiKSoL4eOYtSUmOExt9ocyy30y6c/trs
         /z3+bQBhoVTZNF8kuey0+ytp4V0Xx3XBRTIwFREBVv4XDMQLOFt6TGpoNTr4WpHjMGXb
         6SJzk6GYy01FQ7FpUKrkiprkUpNPe4XgpQhc17P34OkXaRlejQbvVDDSlSTWgib9HJtI
         GWIQ==
X-Forwarded-Encrypted: i=1; AKwUvByq+VGzgwZVZQ15RFBQ/INbpXnDuelogyLejzrnK9L7V1YcbGup3IgaKWuY5yi4r+SphxY20yJX2/Zvnw==@vger.kernel.org
X-Gm-Message-State: AFuF++njLXOv0N4tFgdgTGkxv3Tax/gagljs1cEet76HHNkRU/t+AZsV
	XX65L3/FTbqSIGJDQ2KpRwMhmhh15LYsD0pOFc89sA5/VlZmF2yuLubETVwzvmrq6m9avJKVgKs
	FgdF1VQUadtDat6nJRheTjrD2mxZazHdkkAHNIx8jJXb5Lvd44MnLDQE+uLdDJoXV
X-Gm-Gg: AYBFou20tm8NhE1IwldgmlOeC13S5+GgczrMK+KDayrUQIJDjLMs4n+aB7CSLNQbfg+
	r+a45wWg3TvzYf2/Ec5DeJ9xWglhxUSs4DxgFcxVYX560bdtLcIsafT21s6kb5/Sd0Bl/rCiNkh
	DiWPC82LmtqRzy3cTNZFzGuHQExUDXgoI9XhJisCq33ny8T8LLQVlXX5BSMb6y86GnR3WbXpVKr
	dMfyKkS9+a5dNDK5QbkQeppCKjQYagUL7IMnazjRqa4ZRVZ0umEsO3jPM14Rcs95Akf2mVLYqfs
	wh+LNB6H4tsG2QPepFeCg5wl2RZy70RzP5BSSdIThpWoeIwu8juLOdjwf1wjfGGYs+4cuWpw
X-Received: by 2002:a05:620a:1a17:b0:93a:1091:e692 with SMTP id af79cd13be357-93bdbaa321dmr92009485a.7.1789683007739;
        Thu, 17 Sep 2026 15:10:07 -0700 (PDT)
X-Received: by 2002:a05:620a:1a17:b0:93a:1091:e692 with SMTP id af79cd13be357-93bdbaa321dmr92006185a.7.1789683007243;
        Thu, 17 Sep 2026 15:10:07 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b781dfde3sm572372785a.12.2026.09.17.15.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:10:06 -0700 (PDT)
Message-ID: <ff3015a1c4b08088b0638b00670e86d612a27978.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: Fix memory leaks in debugfs and hwmon init
 error paths
From: lyude@redhat.com
To: liupeng <liupeng01@kylinos.cn>, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter	 <simona@ffwll.ch>, Guenter Roeck
 <linux@roeck-us.net>, "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
	 <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:HARDWARE 
 ""MONITORING:Keyword:(devm_)?hwmon_device_(un)?register(|_with_groups|_with_info)"
	 <linux-hwmon@vger.kernel.org>
Date: Thu, 17 Sep 2026 18:10:05 -0400
In-Reply-To: <20260824090505.49913-1-liupeng01@kylinos.cn>
References: <20260824090505.49913-1-liupeng01@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Mind adding the proper Fixes: tags and Cc: tags here?

On Mon, 2026-08-24 at 17:05 +0800, liupeng wrote:
> In nouveau_debugfs_init(), if nvif_object_ctor() fails, the
> previously
> allocated drm->debugfs is leaked because the function returns the
> error code directly.
>=20
> In nouveau_hwmon_init(), if hwmon_device_register_with_info() fails,
> the allocated hwmon structure is leaked because the function returns
> the error code directly.
>=20
> Fix both by freeing the allocated memory and clearing the pointer on
> the error paths.
>=20
> Signed-off-by: liupeng <liupeng01@kylinos.cn>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_debugfs.c | 15 ++++++++++++---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_hwmon.c=C2=A0=C2=A0 |=C2=A0 2 ++
> =C2=A02 files changed, 14 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> index 47d5579c568d..88223931f382 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> @@ -295,13 +295,22 @@ nouveau_drm_debugfs_init(struct drm_minor
> *minor)
> =C2=A0int
> =C2=A0nouveau_debugfs_init(struct nouveau_drm *drm)
> =C2=A0{
> +	int ret;
> +
> =C2=A0	drm->debugfs =3D kzalloc_obj(*drm->debugfs);
> =C2=A0	if (!drm->debugfs)
> =C2=A0		return -ENOMEM;
> =C2=A0
> -	return nvif_object_ctor(&drm->client.device.object,
> "debugfsCtrl", 0,
> -				NVIF_CLASS_CONTROL, NULL, 0,
> -				&drm->debugfs->ctrl);
> +	ret =3D nvif_object_ctor(&drm->client.device.object,
> "debugfsCtrl", 0,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NVIF_CLASS_CONTROL, NULL, 0,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &drm->debugfs->ctrl);
> +	if (ret) {
> +		kfree(drm->debugfs);
> +		drm->debugfs =3D NULL;
> +		return ret;
> +	}
> +
> +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0void
> diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> index 726397ab035d..ffbe7f542ab0 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> @@ -697,6 +697,8 @@ nouveau_hwmon_init(struct drm_device *dev)
> =C2=A0	if (IS_ERR(hwmon_dev)) {
> =C2=A0		ret =3D PTR_ERR(hwmon_dev);
> =C2=A0		NV_ERROR(drm, "Unable to register hwmon device:
> %d\n", ret);
> +		drm->hwmon =3D NULL;
> +		kfree(hwmon);
> =C2=A0		return ret;
> =C2=A0	}
> =C2=A0

