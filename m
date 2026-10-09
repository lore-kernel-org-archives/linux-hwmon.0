Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA0C4DA9C2
	for <linux-hwmon@vger.kernel.org>; Fri,  9 Oct 2026 12:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791547246; cv=none; b=lPfWQRy2LjAOYq8y3CegtVpCRexdxMnwS//xPkv+3Fwsyi5eBwz/6LcLbn8IJTq533NEOhXXL/RtDCXmq2bV/hsIRJR3q6Kl+wtjSoh32dMOB7eVziY6/Yzq6XQ3JS7ohGJFBFgqwcI70E9oPR00Iqt2WZLYmrPwJ6CT0WyZBRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791547246; c=relaxed/simple;
	bh=OX3YUHatPcL3Kz3o3unLGo9ozOKPQHAwI4BjyvNipr4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=DOSarEpc4L+KCFVagaAVUI0/u1JCOV/hsyQEahb5bfxz3rMPPrgE3xOiFK11b2TbSTvWqI7R6MBxW2AJFfQ0J1AH6m415u/X1H53JtS7kHExUkaJrLJJ1+T7nASriRgwURJ3scybKO5+//ggFtuv62fzLbjE9oa2RmpgW7SnXyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nan+1v9G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nan+1v9G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D18E1F000FF;
	Fri,  9 Oct 2026 12:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791547240;
	bh=OX3YUHatPcL3Kz3o3unLGo9ozOKPQHAwI4BjyvNipr4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nan+1v9GfcDzwbjKkKvdZpLuxZZI5nvplgjMolY5AAMavE4APwElO7iuLj9QRD34y
	 f2t7sEz58ls5rAdhx/HOjwMVJCJdt3SZOEswcXnZhnNr6PokY9EOEjGcoq6K7VktFJ
	 /OJ2zRTMvO5QXKknmR+Ul2cyUo5VY/WmRdNIH86Lbv3/SWJu1BdLla35p1BzMmEt3B
	 2shR1sUwhkWfRTdVlrPLrfzRKS5xPSkUCSP8Qeulj3ot7m3qFgX/aOiUxUcnH4zoqf
	 EoRMsiTKVZenJffrUPpqKapS5SJVkTvGpTnVd0gcj7nutrxFtmtvWKkWxzxLnJYT6m
	 t3+wwe4LcDWaw==
Message-ID: <sashiko-outbox-165460@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] drm/nouveau: Fix memory leaks in debugfs and hwmon
 init error paths
Reply-To: sashiko-reviews@lists.linux.dev
To: liupeng <liupeng01@kylinos.cn>
Cc: dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20261009115151.13877-1-liupeng01@kylinos.cn>
References: <ea9a1d374cf3127e5047bc73807ce821022e026e.camel@redhat.com>
 <20261009115151.13877-1-liupeng01@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 12:00:40 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> In nouveau_debugfs_init(), if nvif_object_ctor() fails, the previously
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
> Fixes: b126a200e9db ("drm/nouveau/debugfs: we need a ctrl object for debu=
gfs")
> Fixes: b9ed919f1c8f ("drm/nouveau/drm/pm: remove everything except the hw=
mon interfaces to THERM")
> Cc: stable@vger.kernel.org
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Signed-off-by: liupeng <liupeng01@kylinos.cn>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009115151.1387=
7-1-liupeng01@kylinos.cn?part=3D1

