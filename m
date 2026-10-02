Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA4B3B47D0;
	Fri,  2 Oct 2026 09:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932433; cv=none; b=DgP4DzTdAG2pVd0boi1IloJ7NE7RQmbZ/XAs4y+n1KaRNRdu/jAle0VZ46//hqIqwgkm50lL73C/wfISD4M5NZMxA/iqaVQl7Ef+TX+xmHsh1nydw0LVhPK/vCHNyElvXmYWwVW+vVGswYkTeA1HM7kDdB1wB5OUolmTPZyEda0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932433; c=relaxed/simple;
	bh=XYuaJYmaEmMWB4tr6hPNcjJpOG3OV0xjNoHYEN+ObW8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Uu25VzMp10JWwVNCRBKfp2MMnb5vTAMbdLOcVJDiU11kD6jQqVrgtoDKmiQdigiTZ605f4nOL9cq4MbduJ9sN7ghs0KXGQ96/cMsEveoZjRkKgV8899fV+TpK0vBjHnAxpuRRxzNtLZI1AQyXST9FeEG5Gge6QN3u8KvGvHLmYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WdMbal1N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WdMbal1N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F2C91F00893;
	Fri,  2 Oct 2026 09:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932432;
	bh=vYkSvWbrOGcSsJr8qcVWbljP0MAC8c2WhSemx+z62q4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WdMbal1NrGYUiZ+n08vixfk/Xa64FyO7ESUAR89RWbrS32Ss4rBNtCdsURZesHita
	 qJM45zfqAAytSeR1qdIFkyD685Epl1FGXvWefeweb94duJx8DC88Y9pDj/pBEdEdZQ
	 7+r0on46oXJcyY4hi5xZtoAq++XUUUzow4PQ/g0xeYQURmRlHjsrRD3anVLVaiLsr2
	 4CrE31e0y+eyvrDrAUhvFoR6x7mAHdnzv5t1MPzAMxmq7H0cTRrVlCJF7Z7nNbwSRv
	 NIZgtER3uFpinUu8z1NtTfgU9oJ9x1xjIdlEC8S/myesv5MS6TcCBYtNzFh8A2ljrz
	 sbxMQ4SSs9RUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] hwmon: (pmbus/core) Register the thermal sensors
 with a 0-based index
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-1-bfafba9fcc95@free.fr>
References: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-0-bfafba9fcc95@free.fr>
 <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-1-bfafba9fcc95@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 09:13:51 +0000
Message-Id: <20261002091352.3F2C91F00893@smtp.kernel.org>
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
am-dt-mpq8785-thermal-sensor-cells-v3-0-bfafba9fcc95@free.fr?part=3D1

