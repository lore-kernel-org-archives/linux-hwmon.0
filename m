Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302242F9D85
	for <linux-hwmon@vger.kernel.org>; Fri,  9 Oct 2026 21:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791582245; cv=none; b=QGwm6U4Qb6tbor1Wk4SfoPWeQ3jstznWvEWqNXgm6s8/T7CFQJkOzBjpVTqVL+/BQBhBazU7XjZoKKkEmNTUl/BdgxAI6+XkwoRVYPP+uS/qHj724Tbc+v0uOCT583h0D5uKJDtavflW4pcjIODiv5Lh8Ieeh50YOVIcOgWAqtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791582245; c=relaxed/simple;
	bh=Zu0HMojq54+g3/8p46ih3C6jdzsLJb9uoo77H+0fS98=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OSd1GqHFNBNWHkWAO4RM2QFdjgsVm0ymq44CAXi4+UNp8T0dFDiVQLIGuh1JpEVqewQXAJKWeJhn8RGlZUhtIms6tIknhrdHYnvHmuTaMz5e1tMP018Ni1erMZ6XpcfXg49CBCxVEjGrS7F0XRM04ZNfZU5Zxt+CFgrzt0E/+yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KDcQwgyp; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FL485xi2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KDcQwgyp";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FL485xi2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791582243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DlNSozwHWelaDwiAeqzmQRLEfEKU54b/1DRu7LW/zDY=;
	b=KDcQwgypJuB1chlM2o3Q6Y20ecfWIc5ZG+EMbyrjZ3DZXXiwyjWK3BMblForvkLuRRVzaC
	vIvuMssjSWxT9MIhq5iKX9Gc3bF5/ggN3JOmlRArnNrhSdkQhFISP0ggix/h0q1JbrHIZo
	930WUAZpRuGOPFaTKfPG3vunylqb8k4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-3YKQN93uOg674Tp-ZTOCTQ-1; Fri, 9 Oct 2026 21:43:56 +0000
X-MC-Unique: 3YKQN93uOg674Tp-ZTOCTQ-1
X-Mimecast-MFC-AGG-ID: 3YKQN93uOg674Tp-ZTOCTQ_1791582235
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5338cfe567eso3312731cf.2
        for <linux-hwmon@vger.kernel.org>; Fri, 09 Oct 2026 14:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791582235; x=1792187035; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DlNSozwHWelaDwiAeqzmQRLEfEKU54b/1DRu7LW/zDY=;
        b=FL485xi2Qn19Ei5tZXhGEBLitif/n1A1c9gzkKOKsfmRj9gzeLl9ptTeOrh7iSzEnX
         VnpIJLZ6hz4W4/u7hSPlSUiYCntq9O3DGRxS0uw4uhShuiaQIgoO43VyL4RZeDm9Yget
         2ViiN1BWIKgekR99aNLPYioonuk1YmE9TITyYvFr382oQwAnqo1MsnCCdjh4RZGTWyic
         ioyP/bxyIqqUMP8cl1hK8cTfAYtMPedAUiG01Ue71AU7gjwftK4gv4+xDc7C38FL0bu7
         /yA33JGTG9LBLbeor7gzuys0js4Srs3Az2F717nurn4WKpQbm8H/IennS38XdDH4L8Rc
         mmcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791582235; x=1792187035;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DlNSozwHWelaDwiAeqzmQRLEfEKU54b/1DRu7LW/zDY=;
        b=WaQdpkZy/5n+ihSen25IlWhwje2zGqvtUtDIqoEi8CBbC5jWnHF4c6qrn7oZdBhEiC
         lcfPpysrWZTZYPyDeFqXWjY24vdlBbMR8HYq42aAvOH7xtxSWhT2K/XOmIoEi1NVnpDt
         /CN5V85KvlKiStSpjQ9dnOklYbWDZfqdUEg6EgVWPUHLk9cBgIV931qTBcobN8LkJmYQ
         +kxZhBoX3sQSPQf4k7DRqb1iZumZ/NwBy9lDAvTgjekVHI9pRypbdj5BzZ7aaH4sdJ3Z
         F8pk+WLtsbcYAFpssCoLTf+a1fGeS6x0UvCCh4HnM5Eo1J7TzQ9KgS3RYqfosSiWh59C
         ekaA==
X-Forwarded-Encrypted: i=1; AKwUvBwZvN/rfG8eRqkodwf7NhVDRzmMByna41+JtlWmegHjrTr0CahwJfr6MBmiyYNPvS4bV2pHlUQelA2+rA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIuYbdTZUpDvm1xZQiXrX4HLXRbXT54e8CKZwAinTfC8CjhFsFJ
	+9yPaF0gj+t0uV3tFzyVyxvpO0t3wW1KqL38nHRuQ+zVIfxvf8O1RlEgY3C1WyaGs+ikyMrsdDi
	oPAeh1w39UbUAY8/+Zlz6TecKtHrXgrtlqAW5Oe+EUYdLWA0TrTDGAl2nXXQ/q2hb
X-Gm-Gg: AYBFou08DxWGdb1q7QE+3FhaNJdFKp7gZ8DmE0K/uzsuitHbHKK4jucO0jQ03o7Au3m
	sqM65ZLFxeNHk+lEi6XqouY3K0SoAlQrOZJjskxBcJ4iA8eoacg5NhZkHRbjrw9uM97qgQOoiZV
	+o82DRbHMucf0EXXWrC9nGrAF6bDcrO3Fm2kJIcrVC1WCa4jCKld25NniX+v6LJdgcXAES84t1D
	IFL4nlCfoHWK9HVDx6oMCPK59hnzLFAfUQ8/51PxKdT0LFpXBvEs2wW0/dUi0fkfy/Y8ajhjPzR
	7MpGdEDebgfdN8M8ceMeAFu7J9XPmU1ujo8Nvgx1iAGTT1SOPnwH1trIc/wXf8VYPYL8zJ0=
X-Received: by 2002:a05:622a:58c4:b0:535:a5fb:67fb with SMTP id d75a77b69052e-535a5fb8494mr34446381cf.71.1791582235452;
        Fri, 09 Oct 2026 14:43:55 -0700 (PDT)
X-Received: by 2002:a05:622a:58c4:b0:535:a5fb:67fb with SMTP id d75a77b69052e-535a5fb8494mr34446061cf.71.1791582234996;
        Fri, 09 Oct 2026 14:43:54 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b55092856sm28672986d6.35.2026.10.09.14.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:43:54 -0700 (PDT)
Message-ID: <b4cd38b48d85298a7a99cf30fbd8cbbdb34a347f.camel@redhat.com>
Subject: Re: [PATCH v3] drm/nouveau: Fix memory leaks in debugfs and hwmon
 init error paths
From: lyude@redhat.com
To: Danilo Krummrich <dakr@kernel.org>
Cc: liupeng <liupeng01@kylinos.cn>, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, 	linux@roeck-us.net, nouveau@karolherbst.de,
 bskeggs@redhat.com, 	dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, 	linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, 	stable@vger.kernel.org
Date: Fri, 09 Oct 2026 17:43:53 -0400
In-Reply-To: <DM0MU0O43EB9.3EEKZ4C2IUP9J@kernel.org>
References: <ea9a1d374cf3127e5047bc73807ce821022e026e.camel@redhat.com>
	 <20261009115151.13877-1-liupeng01@kylinos.cn>
	 <25778dca265f58185917c5948490e76184c778d3.camel@redhat.com>
	 <DM0MU0O43EB9.3EEKZ4C2IUP9J@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-10-09 at 23:40 +0200, Danilo Krummrich wrote:
> On Fri Oct 9, 2026 at 11:35 PM CEST, lyude wrote:
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> >=20
> > Will push to drm-misc-fixes in a moment
>=20
> Please wait, those are two unrelated fixes with two different Fixes:
> tags, so
> those should be two separate patches.

Thanks, I think my brain just glossed over the tags while looking at
this.

liupeng, could you split these patches up?

>=20
> I'm also not sure this is -fixes material. A memory leak in an unwind
> path for
> -rc7 feels wrong.
>=20
> Thanks,
> Danilo
>=20
> > On Fri, 2026-10-09 at 19:51 +0800, liupeng wrote:
> > > In nouveau_debugfs_init(), if nvif_object_ctor() fails, the
> > > previously
> > > allocated drm->debugfs is leaked because the function returns the
> > > error code directly.
> > >=20
> > > In nouveau_hwmon_init(), if hwmon_device_register_with_info()
> > > fails,
> > > the allocated hwmon structure is leaked because the function
> > > returns
> > > the error code directly.
> > >=20
> > > Fix both by freeing the allocated memory and clearing the pointer
> > > on
> > > the error paths.
> > >=20
> > > Fixes: b126a200e9db ("drm/nouveau/debugfs: we need a ctrl object
> > > for
> > > debugfs")
> > > Fixes: b9ed919f1c8f ("drm/nouveau/drm/pm: remove everything
> > > except
> > > the hwmon interfaces to THERM")
> > > Cc: stable@vger.kernel.org
> > > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > > Signed-off-by: liupeng <liupeng01@kylinos.cn>
> > > ---
> > > Changes in v3:
> > > - Drop the extra return in nouveau_debugfs_init() as suggested by
> > > Lyude.
> > > - Add Reviewed-by tag.
> > >=20
> > > =C2=A0drivers/gpu/drm/nouveau/nouveau_debugfs.c | 14 +++++++++++---
> > > =C2=A0drivers/gpu/drm/nouveau/nouveau_hwmon.c=C2=A0=C2=A0 |=C2=A0 2 +=
+
> > > =C2=A02 files changed, 13 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> > > b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> > > index 47d5579c568d..338421e52f69 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> > > @@ -295,13 +295,21 @@ nouveau_drm_debugfs_init(struct drm_minor
> > > *minor)
> > > =C2=A0int
> > > =C2=A0nouveau_debugfs_init(struct nouveau_drm *drm)
> > > =C2=A0{
> > > +	int ret;
> > > +
> > > =C2=A0	drm->debugfs =3D kzalloc_obj(*drm->debugfs);
> > > =C2=A0	if (!drm->debugfs)
> > > =C2=A0		return -ENOMEM;
> > > =C2=A0
> > > -	return nvif_object_ctor(&drm->client.device.object,
> > > "debugfsCtrl", 0,
> > > -				NVIF_CLASS_CONTROL, NULL, 0,
> > > -				&drm->debugfs->ctrl);
> > > +	ret =3D nvif_object_ctor(&drm->client.device.object,
> > > "debugfsCtrl", 0,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NVIF_CLASS_CONTROL, NULL, 0,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &drm->debugfs->ctrl);
> > > +	if (ret) {
> > > +		kfree(drm->debugfs);
> > > +		drm->debugfs =3D NULL;
> > > +	}
> > > +
> > > +	return ret;
> > > =C2=A0}
> > > =C2=A0
> > > =C2=A0void
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> > > b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> > > index 726397ab035d..ffbe7f542ab0 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> > > @@ -697,6 +697,8 @@ nouveau_hwmon_init(struct drm_device *dev)
> > > =C2=A0	if (IS_ERR(hwmon_dev)) {
> > > =C2=A0		ret =3D PTR_ERR(hwmon_dev);
> > > =C2=A0		NV_ERROR(drm, "Unable to register hwmon device:
> > > %d\n", ret);
> > > +		drm->hwmon =3D NULL;
> > > +		kfree(hwmon);
> > > =C2=A0		return ret;
> > > =C2=A0	}
> > > =C2=A0

