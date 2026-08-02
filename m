Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20BF2AE76
	for <linux-hwmon@vger.kernel.org>; Sun,  2 Aug 2026 21:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785704706; cv=none; b=CujhSirdWlX2VR6heYY01vtdeQWwJ8nmnemJkzbtrFNyo0bSqOea4mPfcKerOHwMXYmI13MlJNQu/gZpIBx5vcxSqiWo55mNUwDA6zXMMN0BnE5hBXrkuH5s5ImDC7PZrHKirpQSUALReDwSacjbGEHfiowxNojXhS0SEAZabu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785704706; c=relaxed/simple;
	bh=ncw7Bu57UHCyN5qvFb7DT7szp+V3ubWkmY2uToEMQZA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gfzJZhtbo8owdQSuQHsr6I5UJPua706KTxa3aSyDON80FuxYCT3zKN0GWkMbKn2rci4MQ82sW2qxlTk706vk3rqG625eSez8TVk9v0ZIaqiVlln14HXK1ISW3uX2ak04iNLS3nveKpj/BcJrxHxga0Su0+fNSm+k4IhMazDu0HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XrhMEOwp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XrhMEOwp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 486DA1F000E9;
	Sun,  2 Aug 2026 21:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785704705;
	bh=ncw7Bu57UHCyN5qvFb7DT7szp+V3ubWkmY2uToEMQZA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XrhMEOwpxqFNu7bJ8WBoAIE8QUm5Do6ipfWdqAoRN+tYJqDSodpTAIrxOjtRtxFpz
	 e27qJxAZhM0ISzvbPWVtkptY2QRvULGkHej8FvtveLTkeVcfFVJyj2tcWA36KMIrqQ
	 Xk5Rr7L49TKtsfg1IVJug0Nh2PEONJJV4eYi35UZR/z/Bc4YkfAuEAcSgWzOOQfziH
	 CQhZXMLnydfK4BggeHhLEwK3/qSWJCbTz+3WtZ4uVEW9almefLHDm9eCDZq6t00zQ5
	 CRpsaXRhxm5yz6HR4o7Wu4f7GiL9IviOJ79C/bWyxfSisJaELYsRGbU1caTlqD5H1Y
	 8c96P0N5VH7LQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: dell-smm-hwmon: Add fan control for OptiPlex
 Micro 7020
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Haugk" <j.haugk@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260802210318.345995-1-j.haugk@gmx.de>
References: <20260802210318.345995-1-j.haugk@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 21:05:04 +0000
Message-Id: <20260802210505.486DA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add the Dell OptiPlex Micro 7020 to the fan control whitelist using
> the 0x34a3/0x35a3 SMM command pair.
>=20
> Manual fan control was tested successfully with PWM values 64, 128,
> and 255. The fan speed changed accordingly. Restoring automatic BIOS
> fan control through pwm1_enable also worked correctly.
>=20
> Tested on a Dell OptiPlex Micro 7020.
>=20
> Signed-off-by: Jonas Haugk <j.haugk@gmx.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802210318.3459=
95-1-j.haugk@gmx.de?part=3D1

