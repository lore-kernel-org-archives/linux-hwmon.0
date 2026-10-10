Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51D4383339
	for <linux-hwmon@vger.kernel.org>; Sat, 10 Oct 2026 02:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791599212; cv=none; b=By4/Y7wxdJVUusBncGu6FzZhfhDkxoJjZiZTaYqLHb5uxMa1q1yM81tC/YkIrr42liWDbm/NYPsso9i4lh2BkdwU51d9mRH0S8qEAysMFAagC8uAyAzQYddIs2VOXltqyIi2JLtCVQxYCWVwcYvu5KR1wGyc908NTY7Fr2Xop88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791599212; c=relaxed/simple;
	bh=+2BdXX9pb2cu5Ik6Mw8vmo7JccuGnWYhAvUT6+tnz6Y=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=mnH0OiiboTLYKPMw5lRAcxDyGGEXRAWz6JmGPZPk4ZqHeS+fYrWvolbupn3uAbk9qNcae31X30F5vwQDZ/8Iax6kFT7NrYL1ZynKBxJSe1rtMpYoHHziuuHhYKckENDcN/+MFnZtoqvaG5ugyqzfBSE2YYyZkf+ebuQmz4boBMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L9Q3BivJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L9Q3BivJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB041F000FF;
	Sat, 10 Oct 2026 02:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791599211;
	bh=+2BdXX9pb2cu5Ik6Mw8vmo7JccuGnWYhAvUT6+tnz6Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L9Q3BivJMoC2UMv5pln0GqvpC+H/XAs4+tJllJDgSZESpjlTq+UEPzZJTseJ2kuo9
	 Py/c+DJMxKKtN/CEcuspaMEJ/0QN0yCat/lG8dW6ruVHbAn678Q6n2JybChUxlXS/k
	 34HhMf+HG9Z+ZlWMugeUnS+cMGfoBTXmxgrK8lj3e3vkccPmmBopE//aiE7WN0xZ+y
	 BQmdTuDHQFCVfBxii2pO0BEOClK3aDw5w7FQ8Kq+IelmzMYBEbCfyK2TrUmHr7SCyi
	 qFM8JhpOfJ5rc/l3tdoyDXtSN4Ar7TmY/LewwGOEaaq87MgcLajZjzck5V3uZ1yqnh
	 O7F+72AS0wlpQ==
Message-ID: <sashiko-outbox-166214@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] drm/nouveau: Fix memory leak in debugfs init
 error path
Reply-To: sashiko-reviews@lists.linux.dev
To: liupeng <liupeng01@kylinos.cn>
Cc: linux-hwmon@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20261010022006.28263-1-liupeng01@kylinos.cn>
References: <b4cd38b48d85298a7a99cf30fbd8cbbdb34a347f.camel@redhat.com>
 <20261010022006.28263-1-liupeng01@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 02:26:50 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> In nouveau_debugfs_init(), if nvif_object_ctor() fails, the previously
> allocated drm->debugfs is leaked because the function returns the
> error code directly.
>=20
> Fix this by freeing the allocated memory and clearing the pointer on
> the error path.
>=20
> Fixes: b126a200e9db ("drm/nouveau/debugfs: we need a ctrl object for debu=
gfs")
> Cc: stable@vger.kernel.org
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Signed-off-by: liupeng <liupeng01@kylinos.cn>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010022006.2826=
3-1-liupeng01@kylinos.cn?part=3D1

