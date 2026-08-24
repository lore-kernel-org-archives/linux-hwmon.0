Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CB43F0AAC
	for <linux-hwmon@vger.kernel.org>; Mon, 24 Aug 2026 09:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562743; cv=none; b=dnPolACBWlE4LDkEuiSx6KyOOkh5kOPbEoEgAi/WnY3kTB2wiJGs6U04gTqrYK74Kr1CayL5JlMSTzb+Hq2npsy+uGjO3zv2Ojkg7PM5Hd8q1rlJNoWGI2rRWmjxFjIkIk4sjs33d9CpJ3tQzmTeC1Xi8tLVKx3lJMhats5z+L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562743; c=relaxed/simple;
	bh=IJlPPqlU4MJdh9gSm2efnh8oSpYQLGtxOWNmZuY+SBE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YyRgVHQNVnh7lB46tUSrqj2VLr39SJ+YRJgelz5t1KkG1IziOXuOX02A9DtC8wRN6u/U+Cpp8JE4Rs9IvtKS5IwiOy4So+eh2cqbedPfaat6pGG9lx8RE65x8U7gdwH+yR7iqStxooHswtbgn5B3D1WDOk9ZWFiSGcCl3uIw5Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jhfieyff; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jhfieyff"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C5B31F000E9;
	Mon, 24 Aug 2026 09:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787562739;
	bh=IJlPPqlU4MJdh9gSm2efnh8oSpYQLGtxOWNmZuY+SBE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jhfieyff2S9wnhr74JfrvL8sscPxvoswgMeJ+KrLvmiCZB4C7aEbsQOLQAe3rBWeA
	 Nom4grWpHXATk01oBh1WxOG3d+9mfk2JmaGBXyxANd75s3wzOBxcKRmYjAjYkXYjWZ
	 TLVG6eXTbPHYgP5Mp4LklpWMDJ98FxQHK1xsUqxb5ZCzm4IvMhnB2EHSnejNWIo06s
	 ArwUkSH8e/imAuZhNXIKG2TZC13O9szG7jFYMAQq6eFF85Apb7mPWDGwp68XA3NvKn
	 Bo3Ps1rhr3rkUdZ9KovV6ElR5eHyUaajtOX5Nfykzsv/wPEJm0WOKgVFFBNNfSCUrT
	 WhJ9XVDXh/a/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/nouveau: Fix memory leaks in debugfs and hwmon init
 error paths
Reply-To: sashiko-reviews@lists.linux.dev
To: liupeng <liupeng01@kylinos.cn>
Cc: linux-hwmon@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260824090505.49913-1-liupeng01@kylinos.cn>
References: <20260824090505.49913-1-liupeng01@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 09:12:19 +0000
Message-Id: <20260824091219.7C5B31F000E9@smtp.kernel.org>
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
> Signed-off-by: liupeng <liupeng01@kylinos.cn>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824090505.4991=
3-1-liupeng01@kylinos.cn?part=3D1

