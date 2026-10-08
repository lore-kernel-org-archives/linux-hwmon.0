Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930E03DB314
	for <linux-hwmon@vger.kernel.org>; Thu,  8 Oct 2026 21:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791495951; cv=none; b=hHRAJh9LAD1UsHaYxkUft5PurHTVjejFzlyJbX5ba4WxTMkISODViEVmUsID754pcxbpvIU+tu2P+gsWOKZQ6X7IQ3fDK6p8UAX46sdepaNqK+ZoG+MO44PgbT0F/j/85PJkQ5TO2usN1k1cx8tMxuBHuNilJCSboLP15r63WD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791495951; c=relaxed/simple;
	bh=4C6+wulytzT9gybkb7TNEm83oK7id/pFcB3QGIg+MP4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=vGdAOoaZSI68ZWuUbomNP6HpareKpt+JY+vsO0hV68zrDtrDvds7KwRo+wZL87pZJeohy7vsW0H/IYMgA+Tdzm9kGMfEna3qPCGQ7UTlA7xihPFFjh+RmrxwI7pciB6W3rbX1F9V/y3xU/S/PieOy98mdFSe9G16EBcRLItcWqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QvZyPKwY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gbNP6oGt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QvZyPKwY";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="gbNP6oGt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791495948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JS+En9JyGsTr3AjbcaJ6blNY5U2s+JVwhjESLMBOqZQ=;
	b=QvZyPKwY3dhmSxWUCmvSTCJK2w8qbjoaCPBU/V9D632gUML0YVK1DTwqTypzI3tUHPg5oq
	JAzDtyghfiCei1fe2oTk1zj3OcsrzbMQ9gVbkDlNYxg7+yEY9SFvOPurBQTiJQbr5yF5ML
	xK2g1WbTy6p/NjT/yZeSUxX1iDNHf5Y=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-Z9hKFOPyNu6bGMNkjluDyA-1; Thu, 8 Oct 2026 21:45:47 +0000
X-MC-Unique: Z9hKFOPyNu6bGMNkjluDyA-1
X-Mimecast-MFC-AGG-ID: Z9hKFOPyNu6bGMNkjluDyA_1791495946
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-917b7dd3f1dso97122566d6.3
        for <linux-hwmon@vger.kernel.org>; Thu, 08 Oct 2026 14:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791495946; x=1792100746; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JS+En9JyGsTr3AjbcaJ6blNY5U2s+JVwhjESLMBOqZQ=;
        b=gbNP6oGtcXTKFFg5VPTYSgOafoosD+HoNdYvRdM03lOGg7SdyM/diznkEAolsNxWXL
         4BO5N1NccfecYdUNRbAdagRq0lZgr5RBugdhaxLIRTQ+3aIuezBIramRcor8ScxVMqkM
         QA6csvn8T9qUFt7euelc3z301Ao67RNyFeaM6ni8ZYLrGJXCNpTDI09dFZPCy4X6iKY3
         gqRY/tZOElG2Y8UJXC73KLrkQDXFvmWQ8H0CY+3T5Jrqomr56tU+G2VNcQ+71BqXItX3
         taGyVdGxElDtwqNV6WpECulHBuSjx5uk0/MJVMsUO4R4M42Gko9qZLIC3Z5XQwLnktYD
         teQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791495946; x=1792100746;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JS+En9JyGsTr3AjbcaJ6blNY5U2s+JVwhjESLMBOqZQ=;
        b=R7iN+QYU8FrzsHKpR+gHFpXEqFKpoenuzQNyDlX0hlFpP3T1ELAyN9UESxq6AEcR8M
         2qyt3sE2tNmbO1Nd07CxzAMwwjppGgt67tyTZ0xr/jCcvYGV6xAYpQtl86SJ85BA0vm4
         feyfCTMHsWbkKzj0+V7O+1zwi++KKr1/f+gk1UqDtjctqTGq4hs8WjkSwOYJrLn2gZrA
         WS8sUCl70kL9TygRf9Ciuiy0eXwPAkHQn4R+LTwQ1J4l25RKEBhpVM/RQ7QqQUMwpNgX
         ULWW4w+1JGsfhQsaAhNs7xJiMjnLrhUTum7F6QAkuT8G3hj2ffGsmze3L10wsOB0ScRs
         k5ig==
X-Forwarded-Encrypted: i=1; AKwUvBx9RWvf2Usj7J3yWJbp/XC4xR1Eiit7GgquQfCqJq61EGv8Ut+Vm5LMp6MzX7npGdqPOFRQVP4SNNyOcQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIBK4G8MetTiTtgVshB5Tu9IQkdT+of63ZAP2e5wgcgoMahlyK4
	ocpvTOAha4qKwPb7YeJIQqi7w2EoxE1Uy3DstkdNBw45BRdpuOLY66DUZKC1zZHG7NKvJpxxcts
	2UeZzEnv1IXzHJEmyaA4scwsd4MQNRqOR01NcwrbCDcX0LdrdwUqg0K+z4UzmQQBs
X-Gm-Gg: AYBFou04Ydj+61lPSY4ydu95AsUDttizVtwKZealdn2WSxBTSNkaF7uSp/a59ZCGefM
	aVERMVyptvdh5iyyTgAu8J98Sle6TPYt5fHJ4eRZnkWH2+zXoY9pfisCRnWpo6Dik654HKmzwia
	PerFzJa2IuDZLw4VsWnzDqsIl9+u5wp38TZ9NhGWs/RavvpaGvLvWEF06skkz2LjWyBKE+L46l+
	txnHCD2az2F7GO9+VOxpq6CHqhvVXXRG2dQbPAApKte6/piRboZ98lmvK9otajz1/NxE/bW6scG
	WkQpP8c2los711vu660e5wHoS19lwqOkmudWIpP+z81bX0jDT355hnZwjBib7166ps7tCSo=
X-Received: by 2002:a05:6214:1d0d:b0:918:d743:fd92 with SMTP id 6a1803df08f44-91b555354f7mr894296d6.24.1791495946458;
        Thu, 08 Oct 2026 14:45:46 -0700 (PDT)
X-Received: by 2002:a05:6214:1d0d:b0:918:d743:fd92 with SMTP id 6a1803df08f44-91b555354f7mr893776d6.24.1791495945817;
        Thu, 08 Oct 2026 14:45:45 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b550ca9a7sm949466d6.38.2026.10.08.14.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 14:45:45 -0700 (PDT)
Message-ID: <ea9a1d374cf3127e5047bc73807ce821022e026e.camel@redhat.com>
Subject: Re: [PATCH v2] drm/nouveau: Fix memory leaks in debugfs and hwmon
 init error paths
From: lyude@redhat.com
To: liupeng <liupeng01@kylinos.cn>, dakr@kernel.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, 	airlied@gmail.com, simona@ffwll.ch,
 linux@roeck-us.net, nouveau@karolherbst.de, 	bskeggs@redhat.com,
 dri-devel@lists.freedesktop.org, 	nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 	linux-hwmon@vger.kernel.org,
 stable@vger.kernel.org
Date: Thu, 08 Oct 2026 17:45:44 -0400
In-Reply-To: <20260922044044.21442-1-liupeng01@kylinos.cn>
References: <ff3015a1c4b08088b0638b00670e86d612a27978.camel@redhat.com>
	 <20260922044044.21442-1-liupeng01@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

One nit-pick below:

On Tue, 2026-09-22 at 12:40 +0800, liupeng wrote:
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
> Fixes: b126a200e9db ("drm/nouveau/debugfs: we need a ctrl object for
> debugfs")
> Fixes: b9ed919f1c8f ("drm/nouveau/drm/pm: remove everything except
> the hwmon interfaces to THERM")
> Cc: stable@vger.kernel.org
> Signed-off-by: liupeng <liupeng01@kylinos.cn>
> ---
> Changes in v2:
> - Add Fixes: tags for the commits that introduced the leaks
> - Add Cc: stable@vger.kernel.org=C2=A0for stable backporting
>=20
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

^ We could get rid of this extra return=E2=80=A6

> +	}
> +
> +	return 0;

=E2=80=A6and just return ret here

With that fixed:

Reviewed-by: Lyude Paul <lyude@redhat.com>
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

