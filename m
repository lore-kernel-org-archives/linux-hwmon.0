Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB8A279903
	for <linux-hwmon@vger.kernel.org>; Fri, 29 May 2026 21:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780088446; cv=none; b=VQAdqldlneOl0x7OPSvepM1HWunqasJUr5S623HZlq6iTTt2j5MFteJPHzVhGCYxqmOu7spihj0MMWNbTunTKYjIfhQCalNhP3lcQUxUo3NPquCUptaqNQysZ7ix2S9obA2ALQKCz/+h63xhj3cl4QZACKspUW+tu9Vm6PGDLWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780088446; c=relaxed/simple;
	bh=WL0TzdIAky+9ZigyBppq45xMymJShrfsw59h8Eb0ZK0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YMbvnR+KdD8qp6UpQgwEp6cXTjXZKGaeJhxkqkoTLI+jE1RCX+Fu/7s75V/BErc0qW4JEtzKGK2AbYShqbCyTqQp8iuWCmGvo5vv4vYNO9Zb/NM1UA7W/3RHUkSKfjcY7gR4vuMtlaSWfh84aYlpaAxKtA8a2+mBF6II4jvZUV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eLyvxYra; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eLyvxYra"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D778B1F00893;
	Fri, 29 May 2026 21:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780088445;
	bh=WL0TzdIAky+9ZigyBppq45xMymJShrfsw59h8Eb0ZK0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eLyvxYrasessW9McadtN7MU/DRaLzQLF1LJ1wwyi1pw+LkvZr2Xp1bqyyhsJqiq+J
	 md1hrM3k6az2/aj8N/l+eTvU3sMAmnBb6OYvaLUzOSp2AUXvfFKvpiXNyk3GBF2/Sv
	 VttKS6cGh/iGDC5dpN0IKH4ONNrQZsLOUB/jsKqGeZI4afAgynTMc5mtWcxENH4e1Q
	 Smco7g3h+H9jtbe3/njAqbIXyksu99bgFLN9VMcpxmDHeSDbUc8/pIUhhLU1kp/Ps5
	 IXMPBSJ1z07x8I4+Apyb9vFY/o3P1h5YoQDxGXg+4lmJoWppAp09FkM6051mPQTbyD
	 7tYBKpgnEwO7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] hwmon: (cros_ec) Split out
 cros_ec_hwmon_get_thermal_config()
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFdlacOfc2NodWg=?= <linux@weissschuh.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260529-cros_ec-hwmon-fan-curve-v1-3-da6792b3830f@weissschuh.net>
References: <20260529-cros_ec-hwmon-fan-curve-v1-3-da6792b3830f@weissschuh.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 21:00:44 +0000
Message-Id: <20260529210044.D778B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Some upcoming changes require access to the raw
> 'struct ec_thermal_config'.
>=20
> Split out the logic to get it from the EC into a new helper.
>=20
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-cros_ec-hw=
mon-fan-curve-v1-0-da6792b3830f@weissschuh.net?part=3D3

