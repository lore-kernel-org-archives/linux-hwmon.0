Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8A830D40D;
	Thu,  1 Oct 2026 07:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790840100; cv=none; b=THDo1tjqnV2LqdtpQwANRg1bI5Uvx96NRlMrAtlymxuar+owCle4Q47gTPrghjgOFFPU0yTYk1A5YZvPVqaUdQQF2WHBIPk9uJILaYQB6O3IuXfyv6Koz5qwP/3nxWbaiWEj84YCKx870UDezgwkr+B0szsANQDrnBavzE3Be/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790840100; c=relaxed/simple;
	bh=vbQJhBQK5KRmYCV/Xkf2OycTIMPq7PmN/MrAVWrOwng=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bV4F8qXsrFV7B4PwwcwMXQbsOYyhS353B09ZROvp+1Hw2f/+O3NKvis9C93MI6hbp/n6OMLhJmBZ2GTGubLlhYMDu5D5n+ywIovc9r1CHWVCw3vhoHdmGt1PWhu+QnT2I/t3HgAb3+yXe/cg6Un9czgUX7idIlL/6obhkINN5q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CUPdlrep; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CUPdlrep"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 065391F000FF;
	Thu,  1 Oct 2026 07:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790840099;
	bh=VCVkmQZTcnlhXIOhqzJ3LC8unNpYlTLj55ncJ4UqF8g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CUPdlreprVk0bQwBxoziDFAbvWxNOG5WiVpaPssIpr1Z/k+0VXi+Vmqo5Wgu23Aac
	 lHC9G0XsucAKX2wHiTMt1naVzXUQHDeVCghudDa/K71RZTCLAy7vJHYqqBPYo8rbYn
	 MBXjNbOi+V2/r8PROajY+17Bra0+v9jdnRBCMxUDKF3Ca6e2AdWYEUUa0LnkjmzwSO
	 1w2kPD8BgqGbmIjC78XeabruVvd0Y681Hp5NhadWJFFLoHJdp+JilRVk1uLrWWs+tk
	 Bp3suAFE91Zp3SXa2ByKNhQ66o18SkTFGvlsTsYRreUjZrXIsLwEUWwshljmMjA+5B
	 7tj6D+tFBQU1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] hwmon: (pmbus/core) Register the thermal sensors
 with a 0-based index
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v2-1-07d368dcc662@free.fr>
References: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v2-0-07d368dcc662@free.fr>
 <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v2-1-07d368dcc662@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 07:34:58 +0000
Message-Id: <20261001073459.065391F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Vincent Jardin <vjardin@free.fr>
>=20
> Since commit
>   3aa74796cfd0 ("hwmon: (pmbus) Register with thermal for PSC_TEMPERATURE=
")
> pmbus_core registers each temperature input with the thermal core using
> its hwmon index as the sensor id. That index starts at 1, so temp1 is
> registered as sensor 1.
>=20
> The thermal core expects a 0-based id, which is what the hwmon core
> passes for the drivers that set HWMON_C_REGISTER_TZ:
> thermal_of matches a thermal-sensors phandle without cells as id 0, so a
> PMBus device with a single temperature input cannot
> use #thermal-sensor-cells =3D <0>.
>=20
> Cc: stable+noautosel@kernel.org # changes the DT-visible sensor id, no in=
-tree user
> Fixes: 3aa74796cfd0 ("hwmon: (pmbus) Register with thermal for PSC_TEMPER=
ATURE")
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-for-upstre=
am-dt-mpq8785-thermal-sensor-cells-v2-0-07d368dcc662@free.fr?part=3D1

