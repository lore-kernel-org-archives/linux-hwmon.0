Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7EF443C18
	for <linux-hwmon@vger.kernel.org>; Wed, 23 Sep 2026 10:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790157729; cv=none; b=DBHpnCfJfto8NOjKs3En4jRCxHKFKbmyw1gz8MpYtYBDCseX+KiwUcdKme5cKS6ZAdLHH/bRbUskLRoidNRzMccbPPbX/aSLrM4yuudPU9/TPaLb1Xhh1Ju6l+486gA+80OgSy82NUzt760EHUHC6Ok9r3LKabivAi3dOwzckZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790157729; c=relaxed/simple;
	bh=Usnb5AZUJ9hGsl2u21Beej89Xux2mpEvnlK2Z8TKcf0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=alYmDh5CBIto3ZC3ul/hPi3wskdfeAfcMYzjWAMIAnm6n/MoYr4W60qKSINaKOvyWipiXDSCFI8ozLjlvoD7B98x1kKcoSjJ0LAzNKTpPxIXmIrEEkAGfkmCr9dptKHUxCAtLo8JakW0It7l+0I2Urz30qswotURFkt7DLGddy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CyPCPjH1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CyPCPjH1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A3541F000FF;
	Wed, 23 Sep 2026 10:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790157728;
	bh=Usnb5AZUJ9hGsl2u21Beej89Xux2mpEvnlK2Z8TKcf0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CyPCPjH1nZ3M39aKquKMeG2saWDjaXdA81SRGrrX4U8BHoA8AM6C5Vk4QT3Gjd3G4
	 oUcwK7Wc8WOPRcaVNZ8DlDG0uXwYC3EQXynl4ODe2DzN7t3BRKDILrRz6nYRvQmtA4
	 5Q9y4t59n2IA/mhvKMt4rXBc4//dX6FyAlfZnPRTrBEo9KIwO1gZdTfRXHVnSYpz2m
	 R92RNxN3/HYNKlxGChiLAoeV50mVtVMW0fiakcqJoB2/1w3O0PCHJO9R1XiSpOEF75
	 xObhEHkB07usz2kofNLrUkIwhBeEX4i9DWkC+lDSKVFZ4XRdeKGnMcFUdKj4ShR/8J
	 2FcbsTxOAaPLg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: axiado-pwm-fan: Add missing documentation and
 MAINTAINERS entries
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260923-axiado-pwm-fan-doc-fix-new-v1-1-8c8c2ce58a21@axiado.com>
References: <20260923-axiado-pwm-fan-doc-fix-new-v1-1-8c8c2ce58a21@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 10:02:07 +0000
Message-Id: <20260923100208.1A3541F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The axiado-pwm-fan entry was added to the hwmon documentation index, but
> the corresponding Documentation/hwmon/axiado-pwm-fan.rst file is missing.
>=20
> The MAINTAINERS entry also only lists the devicetree binding and is missi=
ng
> entries for the hwmon documentation and driver.
>=20
> Add the missing documentation file and MAINTAINERS entries.
>=20
> Fixes: 2d52742f408f ("hwmon: add Axiado AX3000 and AX3005 PWM fan control=
ler driver")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202609230904.aIWyLsSt-lkp@i=
ntel.com/
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-axiado-pwm=
-fan-doc-fix-new-v1-1-8c8c2ce58a21@axiado.com?part=3D1

