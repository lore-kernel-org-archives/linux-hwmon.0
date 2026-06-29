Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2632EFD95
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 19:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782760917; cv=none; b=bfsGkWaQwKvra1IlqjcznhobdsUFyGkxUaaNyyepZcrdziRo+te2Bp3TqLLHJOfz/ndkYalNS8blYywliaxCuu5sHGR7HN/+3z/FaheeSiIbD1SuWtBE0FCEmkpSN0DJUEECzvT4yP3yWxmiY/yKxKQbAq0ZixllKsiE7xI4kwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782760917; c=relaxed/simple;
	bh=buDP2d0RToWDluWFdve++Ue/UOACphadfhW24eC0wYw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SDb0TwLf1dLWo3HqDnEp6M+/4CQ6xbu0JicpqRnzFd3F68OYAJt6bjggWKZBIMe1LqfIla+PQLuRCReZl9YkGs08KNdKkGvArO7fsyvtum6/IaEsHZ2mkgjjr5s0/S/h2NwzYn20bEREdXtV9EIBgCGaUuMgWIRmVqLpm5Jsmmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eXqOI0Li; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eXqOI0Li"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 814371F000E9;
	Mon, 29 Jun 2026 19:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782760916;
	bh=buDP2d0RToWDluWFdve++Ue/UOACphadfhW24eC0wYw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eXqOI0Li/CdL82U3VKiAF+jOt53dZkdHy2TeQFIYBbT25JttwX8UYA9AQtFRDzpug
	 lESumGrFqFbif5CQco/EhWAo7KhlrPNPSCOLPwQmeHd2yqXOAyClJoO//Ov303U3qm
	 R1Pn1zmeMROcFFYMy3/30umG5i0pphhhsxUR7URTn9Z2okEvNxCYR/tHrAVRAVs/je
	 lK1sYazheMBTKRCRq2iwbIhZadOYYbHGMTgTsDZqjUGEDMhBeMavQZM00ybzwKPsN5
	 6xyrY13KkhJRXj/U3jjg+crTuxK18nKlhKIeztOSNae2lNwro9wwtVALm6TsdudDC5
	 m3FmX2y3HfXNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] hwmon: (ltc2992) add missing 'select REGMAP_I2C' to
 Kconfig
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Crofts" <joshua.crofts1@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260629-add-kconfig-deps-v1-2-8104df929b1a@gmail.com>
References: <20260629-add-kconfig-deps-v1-0-8104df929b1a@gmail.com>
 <20260629-add-kconfig-deps-v1-2-8104df929b1a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 19:21:55 +0000
Message-Id: <20260629192156.814371F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The Kconfig entry for the LTC2992 sensor doesn't contain a
> `select REGMAP_I2C` parameter, causing build failures if regmap
> isn't selected previously during the build process.
>=20
> Fixes: b0bd407e94b0 ("hwmon: (ltc2992) Add support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-add-kconfi=
g-deps-v1-0-8104df929b1a@gmail.com?part=3D2

