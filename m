Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FFE472789;
	Wed, 30 Sep 2026 13:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790776101; cv=none; b=QRnCxQmonmuNkvBkR1e2kcJaFyiXkea4wHAnqgBupNZqi06qeAzWmuHZh0Sk+uAdFxxGIZ8eoKkIpPEk4U/irqqRqcbBCwtJCcMdsGvqYnQk8eGdMgVmcArSV8XiJwqmtb4oepiejthvvdBl7oMDVfdIpOy5qzTTzpT1cUg0d6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790776101; c=relaxed/simple;
	bh=u/LoaNmYIq2FSJ6GS9uwdTMfcd0T08wk2j1R5vUoYUY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NDjJ0jpkncfTfEY+PTXEiC2PEtzDDEQOYYQL6lD4NNtJbgzM4yHY01OejkXiFu3S5A5GLL/bmINTkaZ+bf+kSkoM56W0GdJcQZ+Gh023PjvtPNBNn/jsRai0Db7EoIwbgBh/MNyuktoqLQbT2+W2zycM6pXNAGqx2mYehnDPDMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KCmf8FRd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KCmf8FRd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D043B1F000FF;
	Wed, 30 Sep 2026 13:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790776077;
	bh=4bNGertqICOEQjMDTlCmr5cNsLvg8dIcx3gsFMsjYjc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KCmf8FRdgLEKB2YtD6FT2JN/Iah4GDX9Yddg8PwYi0FhD5GJ9r5FDSk2Paa9DJitj
	 Ae0n/mvm1kSx0sbs0N7Lo9FMCHdAudCVmxhMtKspmX1yU15rftTFNrsWKMt3ZnsmfO
	 gatvCkVPxKpbZeI/Mf21UsztftLnyT/rTzvb0sjku+TGi/eYyqsfJ2dA90RmtXQM47
	 Mx34ADrZCrcmFrrKQOHyJcn0ZAHByk/3inLS0osbx3ATSopT/tdPtjRFdWdLkl1y/P
	 NfSHF+EfPsRkwPyIVXP0dMAjvhBDUR8j1jjSbAG0/RQLzGaeSLpMA52I2VJ75fDfEc
	 VuH0z3RHUsPwA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: hwmon: jedec,jc42: add
 #thermal-sensor-cells
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260930-for-upstream-dt-jc42-thermal-sensor-cells-v1-1-ef6365cae23e@free.fr>
References: <20260930-for-upstream-dt-jc42-thermal-sensor-cells-v1-1-ef6365cae23e@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 13:47:56 +0000
Message-Id: <20260930134756.D043B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Vincent Jardin <vjardin@free.fr>
>=20
> Since the commit
>   032c1623c9de ("hwmon: (jc42) add HWMON_C_TZ_REGISTER")
> the driver sets HWMON_C_REGISTER_TZ, so the hwmon core calls
> devm_thermal_of_zone_register() for its temperature channel and the
> device can be referenced as a thermal sensor.
>=20
> The chip has a single temperature channel, registered as sensor 0, so
> no cell is needed.
>=20
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-for-upstre=
am-dt-jc42-thermal-sensor-cells-v1-1-ef6365cae23e@free.fr?part=3D1

