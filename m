Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25917328B77
	for <linux-hwmon@vger.kernel.org>; Thu, 13 Aug 2026 08:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786610939; cv=none; b=LUuBL/Igx4pOp+QAU0/o4GKZz6uqBE3XNL5MqTeswGZS4Q/M/h4cGQvIpEwUftVTZfaR7EIia4ZmyMnwK42vEhwCgPc6Uh4hjeroHJ2nxgHK8wvdvd8a/WKOFGGVYw8LHZKhiKCu79S4ga+WITh9evPR4uwGRg0RzeyZOLcF/SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786610939; c=relaxed/simple;
	bh=6ggXijQ2Q2lsax7R8FTnn0UhqPJ1stDWyMP8RSL5DVE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cdC2JWv3WeKT/+2iNZQwu5AKslgqDzJNjWxU7Qu387/7EOH52F5+ZoAX7LWCQODLyrU3X3tk1++y6R4PiQh+8j81vkp/pXzbfR0Mswx7aUZfMgZ+tV9C8+1bIva8+AAeSxAS5GEGQz5bCr3IRlGzmAnFquKr3dpBKDpzaI1S1qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ikxkDn/G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ikxkDn/G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A064E1F000E9;
	Thu, 13 Aug 2026 08:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786610937;
	bh=6ggXijQ2Q2lsax7R8FTnn0UhqPJ1stDWyMP8RSL5DVE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ikxkDn/GAGqI2TUlQ7CmdVu8tqv7UpvYTwIYv71X80DTrvWOVO8nAY7S6Dcb7KzGD
	 swMJFqsSSFkj+ft+RY4IXEv9NjmmGIEFJA3jklJ8alFCXz55f+M2GtDCuN2bYaCNRh
	 0xapK0f7oW8i2sQIEuZm7qcwchYGaqi0la2Q6L2vx9DOmVuiRrxdf0nxsO6Qxn2Mf8
	 f2K3nDk2eK2wExUIUlFMHizcoIl3LnAZaXG1/Xxyaqr5+TimuP7ePGi7AYY0nWRlcd
	 +kuOfMGS2BxaHA6oppWnt9sxLQWDmaLE69e4l65IK9Pe/KQHs82S8WdhdEWE5lPVh1
	 YaipQAoYlzmVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: temperature: (EMC1403) fix hysteresis for low
 limit temperature
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marius Cristea" <marius.cristea@microchip.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260813-emc1403_remove_min_hyst-v1-1-43a0d05d9f49@microchip.com>
References: <20260813-emc1403_remove_min_hyst-v1-1-43a0d05d9f49@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 08:48:57 +0000
Message-Id: <20260813084857.A064E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Remove the hysteresis for low temperature limit, in hardware
> the hysteresis is applied only to the maxim limit and the
> critical limit temperature.
>=20
> Signed-off-by: Marius Cristea <marius.cristea@microchip.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-emc1403_re=
move_min_hyst-v1-1-43a0d05d9f49@microchip.com?part=3D1

