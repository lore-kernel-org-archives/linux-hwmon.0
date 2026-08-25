Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BDA345EC0
	for <linux-hwmon@vger.kernel.org>; Tue, 25 Aug 2026 17:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787680285; cv=none; b=f3DSkY2szhpOV6YwmpB2xOaIq3R+SXo1jeG71LDwPgkLY0vmcdnqgrD+n4nqfXWIF8rt3qb+Y2BDCTDTHvPVQ+g8Po5oj1RptFQ25s2BEAvBVKO6TZx7Wk5nclGH67nrEEHzKRSh5mLI7wcsCYnGkwz91O8S+Vjhv1vs87XmoAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787680285; c=relaxed/simple;
	bh=WlLavIAVdXJbo/pH9OaQE1pG29viU7asqI0H8jt41K8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EAizRMzKbsY/Czq9UAwkFSUbVIzuer/eIaZbKK014aFbgy6jmEmHO8ewowzGCNsq4oXqI0jJtxXoAttYD/LhP4/kw2PkO42iFSzQJLrg8afGf9gUS0F7YQ6jpu+Ssk5ZDVNHaxFl5FjuKFIEwVz9402lngMgQPSEJWXQNQdQa6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XazdgrAR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XazdgrAR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8BF31F00A3A;
	Tue, 25 Aug 2026 17:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787680284;
	bh=WlLavIAVdXJbo/pH9OaQE1pG29viU7asqI0H8jt41K8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XazdgrARueqn0rRqh7ysn8Susu45+16na4VxdwQFPGwB5nVkItAEV6aed8QvlB1V6
	 wCLkD84W6VeA33z2+vNvMBqYqXN7/SJ06gJgye9O/CStI9xJz1vqFiNIUEslZy7WX3
	 Wr/N3juwDmVFCNA3SUnO0ydAUb5FFAHEFtN8N2KclcWBb2HWHiLBYnrbUQtvSRb+/1
	 4zRJWvGZm0s8O7UYqP7wkfXx5Ib6e92zz/1RUDqT/stZ6IUxmKfIt1lHALOOrFdoHh
	 QtakcvUUfZYbqxOOF9BEILeB0G2IE/qSHj8xv32e5G54SX7U+0F1cMlYfNuoljmI+V
	 K0uinP9qM5JLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 2/6] eth: fbnic: expose all hwmon attributes
 unconditionally as read-only
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zinc Lim" <limzhineng2@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260824175059.2485048-3-limzhineng2@gmail.com>
References: <20260824175059.2485048-1-limzhineng2@gmail.com>
 <20260824175059.2485048-3-limzhineng2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 17:51:23 +0000
Message-Id: <20260825175123.E8BF31F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> All fbnic hwmon attributes are read-only and always present, so
> fbnic_hwmon_is_visible() can simply return 0444 for everything
> instead of matching on the sensor type and attribute. This also
> prepares for the threshold and alarm attributes added in the
> following patches: they are exposed unconditionally and reads
> return attribute values.
>=20
> Signed-off-by: Zinc Lim <limzhineng2@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824175059.2485=
048-1-limzhineng2@gmail.com?part=3D2

