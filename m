Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4B53515D7
	for <linux-hwmon@vger.kernel.org>; Sat, 26 Sep 2026 20:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790453944; cv=none; b=Bio7FL511/R2mLR7JIltHRRbeHDPzCoojrrB7I7Uz6p2N2laWtzm2K7UBHVzAfvhPsugIi3nX+aWuocwHGy7SXusxJevy4M9tbi6TN2Dg7lHWnFFGtpVeAfcWjaLv3fN2rKqcuVf9lruhFlsKsR2rjutDyoB3OswE3WhBaN51g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790453944; c=relaxed/simple;
	bh=0YEyJ1ewOo5NRSbw1lecRcSemGPtP7hjo89sIKaJBSU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=enUq5wDV3ItO+sYVRAAIq/vg3aYQMrVT5UFz5PZ/uO9FmCENDoYhn6CyUB4FOWiCguGzdF5Yghp6IcZMZPqRia//aLRxnhi6/gdGFuDOnixYIf7vYsekeWzD895nl0gUOoCz+pM1RAX5Q3p8+mpQNfP2fyPSbJV2OvHB+BI7U9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mm3nmnf1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mm3nmnf1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1B691F000FF;
	Sat, 26 Sep 2026 20:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790453942;
	bh=0YEyJ1ewOo5NRSbw1lecRcSemGPtP7hjo89sIKaJBSU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mm3nmnf1VvroesSL/QEQ/5/0Encc64Do9heoqf8vLMN4KRQVgrb3XvO5KfyX4Y6f5
	 9u/vQqlKGAIFXIjT/0Ap8oPfoG0IGvFDbJ30JW1lrROao1Lo4D4qDa3adRKdTWoKYx
	 dhSBWPbfGX1bzysJQeWrM2ky79yTJagm6++/vgLjY7+drYhFhw0jCq4eR7bN3kApB1
	 4T2eBUuMxZq1CqCnhdOebWpj2yzFkvs7/YsJZfOVXK6uLXL9MxbGm0t1bshtPfYnix
	 9TOPEItxAXsFlklepF2z3V1INceQJc77kd7Ahj/IyBbAK/PZEsGT6H6nIzW+rxJzgu
	 4pOHpsUnLBGNQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] hwmon: (gpd-fan) Reset both fans to automatic on
 duo boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexei Solcanu" <alexei.solcanu@pm.me>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260926-gpd-fan-duo-auto-v2-1-0a2ea41ee3b5@pm.me>
References: <20260926-gpd-fan-duo-auto-v2-0-0a2ea41ee3b5@pm.me>
 <20260926-gpd-fan-duo-auto-v2-1-0a2ea41ee3b5@pm.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 20:19:02 +0000
Message-Id: <20260926201902.B1B691F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Alexei Solcanu <alexei.solcanu@pm.me>
>=20
> On boards using gpd_duo_drvdata (GPD Duo, GPD Win 5), writing
> pwm1_enable=3D2 only returns the first fan to EC control. The second fan
> keeps its last manual duty cycle, e.g. full speed after pwm1=3D255, so a
> fan control tool that exits leaves it running at that speed.
>=20
> gpd_duo_write_pwm() writes both fan registers (pwm_write and
> pwm_write + 1), but switching to automatic only clears pwm_write.
> Also clear pwm_write + 1, so both fans return to EC control.
>=20
> Tested on a GPD Win 5 (G1618-05). Not tested on the GPD Duo.
>=20
> Fixes: 0ab88e239439 ("hwmon: add GPD devices sensor driver")
> Assisted-by: LLM
> Signed-off-by: Alexei Solcanu <alexei.solcanu@pm.me>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926-gpd-fan-du=
o-auto-v2-0-0a2ea41ee3b5@pm.me?part=3D1

