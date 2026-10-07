Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F4330C359;
	Wed,  7 Oct 2026 14:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791384598; cv=none; b=pkVVqHz66aoT+8DOtkgIuWQdUguKY0UGKQRHQ97Ph8GM+59OL2ZAUJtpeNLcOSXODazsafQ9mt/UUFlGxN4b7755LLu+gUabRb4HnAr5Y0SttwuIuVQ49sByz20lUl1b7OA884xuQ5osXDsEA3mhZzcNsawnDQnSJDOK1ty/z7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791384598; c=relaxed/simple;
	bh=1asqVrUqXmsLQkCRUeHd3+ps6Wwo3M+rLhrmi2ifUu0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=lnEnfv2sYaN8MFDvAoaBuvjtz8/rKvEMx5vHEN+M31oJi2OGDT2V0uWdt5xtvaFQULhcteC2gp19nijvj93oPId8Yks7XXh+JrC6M/id94aI1oRNQFGJ9VA+X0ZrLByzE2UGAu2PVKEWe5PVJ+oYqdryuzA5LlAG/tDGTSS1xmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=epdr7HP/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="epdr7HP/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA40C1F000FF;
	Wed,  7 Oct 2026 14:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791384592;
	bh=1asqVrUqXmsLQkCRUeHd3+ps6Wwo3M+rLhrmi2ifUu0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=epdr7HP/ane0mcqTlVhxAp2FVkrvQb37ULTK2D/fCXNKskGKkAOIFg0byRNy3Jo9v
	 imIHNMgoDJmC1tWXTCADrilTTbU0lMkFj/gO/ONbhSJwIrb5pegy4bFLn8Ejx0jVRx
	 AILH9uvkYcXlJw9vHUjwAwcOjDa1tbLc/IJPbEOdCZ/DuMLIJT89p3NZytT0dNMCRT
	 wTFfK7yu/qSkgyWSVAyBZaM1X5sc7jg71cYZwhFh862Ok7TTu4SdsIjk0mZRp+72YS
	 qx7hoKYWD86FifgNKs6bbvi7UR0idYbbjfjv23vuWHIHQbER6wcRlYfqvM8+pQGbt6
	 XbP6GFbo7LbjA==
Message-ID: <sashiko-outbox-163120@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] iio: core: add IIO_CHARGE channel type
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ariana Lazar" <ariana.lazar@microchip.com>
Cc: conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261007-pac1711-v4-1-6ef34d7a7947@microchip.com>
References: <20261007-pac1711-v4-0-6ef34d7a7947@microchip.com>
 <20261007-pac1711-v4-1-6ef34d7a7947@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 14:49:51 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add a new channel type for Coulomb counters, which accumulate current
> measurements over time. The sysfs attribute is in_chargeY_raw and after
> applying in_chargeY_scale, the value exposed is in milliCoulombs,
> following the SI convention used by the IIO subsystem.
>=20
> This new channel type will first be used by the pac1711 driver to report
> Coulomb counter measurements.
>=20
> Signed-off-by: Ariana Lazar <ariana.lazar@microchip.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007-pac1711-v4=
-0-6ef34d7a7947@microchip.com?part=3D1

