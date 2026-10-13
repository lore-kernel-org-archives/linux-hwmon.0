Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70583C1991
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Oct 2026 14:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900671; cv=none; b=e0w15zozkN57u9vePc0B9M/alO2lHbQCgQvi+Ol1t2PyruS/Lb18U31FoHCxdHGeqHV3O7+Cp2iSffk7L0Mu5AxYbj7c+ptZMdfO6QMLHrccqHM5SIx++k0GK3mUC1XWyt/XwfpQyR14LMHJEy/BZmnOuKD4H7MV+FU9dndIX0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900671; c=relaxed/simple;
	bh=PGetYChAvCQbRbRSwK5qT05jKeUIWmuvAOw3wnE3XV8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=CPHNKPs8POioIO/BEhPN3efxy1Zd1Y9hQAB5g3i2P/d3nb/phlbhsW2HAtlljnt+IAWjXx+bVsQWix6ptxIti56f7dZZT8QCc1TezEuI7J661KHGJ2LOgRaRQzP0OcX3T5YnRdoJIQjNHiaOxEVGIv1NxdR3H+iZ5ubyxIMJ+1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ECopFd9y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ECopFd9y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E1BD1F000FF;
	Tue, 13 Oct 2026 14:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791900668;
	bh=PGetYChAvCQbRbRSwK5qT05jKeUIWmuvAOw3wnE3XV8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ECopFd9y733uUQz3xaRjUppJ65Xkq65XZj2DIi1kIP2RNr/14yA7Qn0Veoo3INnjx
	 Tf4ElNccMOpWpAMMFfa8PmTO8wXIhhfyu//CRnGN6en9z5LymDYoFc9l7lXvMYY5HO
	 LS6sKjUx2kp1mmaxhzlKkFUHm2SdPuJowCss01yH++ol+ppFiLN71+3sEqcsE+DodF
	 5xdHknMSZj0uThDRmXOJ2Ht4WbKlnbKROPih0bNkfEWDV57EcxaTa7tzudSZ+F/Fjq
	 k8sJ6aTZUWVPrYwPIpUpgXd3wgX9BP8ahYEk4Cvhl3uQ7xuhLCjIkYe8d8eEuwqWpV
	 oTc5AxYBNvEgg==
Message-ID: <sashiko-outbox-169887@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] unaligned: introduce be56 unaligned accessors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261013-topic-sm8x50-iio-max34417-adc-v3-2-d3604ae4a229@linaro.org>
References: <20261013-topic-sm8x50-iio-max34417-adc-v3-0-d3604ae4a229@linaro.org>
 <20261013-topic-sm8x50-iio-max34417-adc-v3-2-d3604ae4a229@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 14:11:07 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Marius Cristea <marius.cristea@microchip.com>
>=20
> The MAX34417, IIO driver, is using some unaligned 56 bit registers.
> Provide some helper accessors in preparation for the new driver.
>=20
> Signed-off-by: Marius Cristea <marius.cristea@microchip.com>
> [narmstrong: update commit message and move to include/linux/unaligned.h]
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-topic-sm8x=
50-iio-max34417-adc-v3-0-d3604ae4a229@linaro.org?part=3D2

