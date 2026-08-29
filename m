Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715C22C11F3
	for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 22:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788041666; cv=none; b=qvkzs6BKBEMdFUqWPlTMmBKx51afI3o6pDdaduf4s3Ws3gYM3NYZkeOBHgvu+ZtBxn22OGlqcJswQudLQlMd6VX/gXjknmUKHRusFIZGlnROT4mAAvQqfCtJ9MXvZF5/ouZoxa9438xz5CRHV+UK2ye9zjIjIcsgBzWRpVB+ucU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788041666; c=relaxed/simple;
	bh=mepG3tcMNB60aOljR51sEoORChu9tM1itEGNbQc1Li8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Am3kgk428/QXy9PKhh0HVdCykdzfVZJR0j7nJ/L7V5b/8Qybk4ymBF52BLXzGOgPbQH2XDp+L5Dvp5r/bLFbp1xDb363TbM3JkTq1XRKWkHKljMbq+KdyzHqTKRssEt9H7qRBByJyqeVTmjAC1gZRwKuIlh23m166ybrRdvjHC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ciSBRE6A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ciSBRE6A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD8351F000E9;
	Sat, 29 Aug 2026 22:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788041665;
	bh=mepG3tcMNB60aOljR51sEoORChu9tM1itEGNbQc1Li8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ciSBRE6Ax59DK3HAui373ASq2xSrm/XCrHwkJcURMc2dgnNJxo8Ibq7wosQ1gJSFw
	 QUokmxSJFal2GE0Nkky8BMKd25oUat8XzLWDrJfsXzXXtQIyNhYpD+KlIJ3RmiS4NM
	 8IodEYgxAbzNlsTH8L4klwqrPZRlLzTVgowrsQJIEq8IPZDZdzU0ibZvCSK6btDPSJ
	 YmvuC/qh0Y+KzNY0uk5BjVB2/Z/PVTALnizGkQd6Xzlk3/1QeaYk6OqmJaq8/b4PqR
	 Y3DriB4P+8oFyktOlEYL+PbjEudCSS2AkW6Jd8RdF405W95GeB+VbhIvkKDW1jCPOz
	 Pz7sUnErKoHPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/3] hwmon: it87: prepare for extended PWM temp maps
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Tollet" <jerome.tollet@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <7b4f2befc3d214b646c0582e6410f17e78748b4e.1788040385.git.jerome.tollet@gmail.com>
References: <cover.1788040385.git.jerome.tollet@gmail.com>
 <7b4f2befc3d214b646c0582e6410f17e78748b4e.1788040385.git.jerome.tollet@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Aug 2026 22:14:24 +0000
Message-Id: <20260829221424.DD8351F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: "benoit.masson" <yahoo@perenite.com>
>=20
> Introduce helper logic for PWM-to-temperature mappings so newer
> register layouts can be supported while retaining the legacy two groups
> of three temperature sources.
>=20
> Honor the four global temperature sources on IT8603E and IT8622E instead
> of applying the legacy grouping to those chips. Use per-chip masks and
> shifts for newer extended mappings.
>=20
> Newer controllers keep the duty cycle in a separate register, so write
> their temperature mapping in both manual and automatic mode. This keeps
> the selected mapping across cache refreshes and mode changes.
>=20
> On older controllers, defer mapping writes while in manual mode and apply
> the cached mapping when switching to automatic mode.
>=20
> Signed-off-by: benoit.masson <yahoo@perenite.com>
> Signed-off-by: Jerome Tollet <jerome.tollet@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1788040385.gi=
t.jerome.tollet@gmail.com?part=3D2

