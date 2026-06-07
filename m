Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B71D4071C4
	for <linux-hwmon@vger.kernel.org>; Sun,  7 Jun 2026 12:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780836096; cv=none; b=N+8XOw2ANv+kdlcbU1D9Mvn1m1o49Vk09MJh7fU0wBfTw5VbEltRKYC7F2kd9ULZtBtPIK5fqoMhta1oydNU6wWVMw1G3KqbnQ6g5+fsyCCjYLivJpa4jdCMjOwckWD2/zgARnyPGmilaZUojdBgGZdoOonNIcLZHJd5ZT55B94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780836096; c=relaxed/simple;
	bh=OxzhitTKiOo6WOdyvarpEsENyYnsAZfljwBbBRAP+JE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I2Xf/g2Xw+gE9zLp7B3mP+cZxAoTqcf7Hgf2Tnk3habl1dRIWG6IoFT6ojyUCHQizYodWDlpwQ2FuVxBRW3dasellk+VxW+L+LMx6WwjZuDp53EABNMwychOTKK/KL2XOK/4FNql04yB8oaCEzDU+Y36AVZ7tVrT2GQIl3EXlJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JQpKZAUZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JQpKZAUZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D55C61F00893;
	Sun,  7 Jun 2026 12:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780836095;
	bh=OxzhitTKiOo6WOdyvarpEsENyYnsAZfljwBbBRAP+JE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JQpKZAUZdmGaLeXVyjGkudtMC/FNj1RNUGQ+vSsyzbnL6D6SZLMWncxCd1IVS+3kr
	 UKhXho3zCT0PpxGwDBhES9rOO+Boh1qICOdABBBxXV669mL1yf3Da6RURQuq+QB2G6
	 Ul3QZmOnzJhVz3wB0U45kJIUBUVcIlhp4zwfxsED78SfpFwI5KvCUtZTLHsxcRJwZq
	 0VALrZ2G6BRjK+AYrkhImJNGTw4RcrYl3AIpHNTI3bCeewCHrIPbz3nSWBNbmFJFGs
	 VzT14o7rnFtobtJavNRwCAo8ERbgZshIrFqmd+ulPYhI0xk8NTeqpPTWp/qBXY7dSz
	 LMdyCHvtkTfDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX B850-E GAMING
 WIFI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eugene Shalygin" <eugene.shalygin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260607123626.100630-1-eugene.shalygin@gmail.com>
References: <20260607123626.100630-1-eugene.shalygin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 07 Jun 2026 12:41:34 +0000
Message-Id: <20260607124134.D55C61F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The board has a similar sensor configuration to the
> ROG STRIX B850-I GAMING WIFI, but includes an additional
> T-Sensor header. The patch was provided via GitHub [1].
>=20
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260607123626.1006=
30-1-eugene.shalygin@gmail.com?part=3D1

