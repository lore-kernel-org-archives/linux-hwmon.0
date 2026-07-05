Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA382C08CF
	for <linux-hwmon@vger.kernel.org>; Sun,  5 Jul 2026 11:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783251437; cv=none; b=qjGi5933pxioExF3TX8YLSzpRfHP+pYS6rhw/eWLyKrLorwOaPGp7/cbzHD2CZSoRkCnq82xnpds5zNHcPIouthu6IHys3jfnN6XV5XBpt11iX8FUJ+UC1/DzBw8P53dhJ4NB4kVqjGbGcpFfHTViHstw+BpMxXpSNvmtBXL7Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783251437; c=relaxed/simple;
	bh=4CJwV1SRxn2Pd7T0x15LMgrxFov+klFnCQUGNYgT9+0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G9Cc82RhpFJ84vYz98tswIIL8R/z04SIYVKTMJVBDLmSfC7WrMQFLI41EGwnslJBvHbsHm9RGPtjZ4DvpifE41N5QKKH+ZSgfWNRfmF7ecjaay28HS0UzdkV7nvXVINtGY5bDSpZmUrsqaiyeoCJ4Uk+l93ERbxDX2rK5ukDCcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DffWPyTL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DffWPyTL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE6111F000E9;
	Sun,  5 Jul 2026 11:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783251436;
	bh=4CJwV1SRxn2Pd7T0x15LMgrxFov+klFnCQUGNYgT9+0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DffWPyTLtg/JY+2sqrDE0FfoUGqjhPOvcI7In/THFsMvNHYKvacHPcdM2oLwT9Roz
	 RSxWAjRByAFlhY0nYgqupCQXB7bhGCoIRDVrQBpBPickj85XaAVxIafIBcXTXlXJyT
	 cnGOLRI+xW8kyTGNHRhvG5vCqyoAKOwPxwhdWguHA5gS97Dm4hmttR4igWmrlXjP02
	 0AmePS0wWXVX2OukwCBAceRgfM+mtSl17kL2vuYkRCecnqWGqSGKSNiUYky2JDtwOT
	 aQBi037QXsFtvpSXLZy0n89Gp/Ug6qb+AhPPx/Jf743CoNsRGq/J1QgoOkZLQoe0ZE
	 ig6Dks6fAv34A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG CROSSHAIR X870E HERO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eugene Shalygin" <eugene.shalygin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260705113246.812500-1-eugene.shalygin@gmail.com>
References: <20260705113246.812500-1-eugene.shalygin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Jul 2026 11:37:15 +0000
Message-Id: <20260705113715.EE6111F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Miska H=C3=A4m=C3=A4l=C3=A4inen <miska.hamalainen@hotmail.com>
>=20
> Add support for ROG CROSSHAIR X870E HERO
>=20
> Signed-off-by: Miska H=C3=A4m=C3=A4l=C3=A4inen <miska.hamalainen@hotmail.=
com>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705113246.8125=
00-1-eugene.shalygin@gmail.com?part=3D1

