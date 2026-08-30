Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0981F2D2381;
	Sun, 30 Aug 2026 03:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788062302; cv=none; b=D3iVzxM9LhCbQhcj58bXtU/jLlKCJ5VlCFvVly12PsmA49hbyntipYdSNFz4OiTBK4aaEiUgciCHZLTd5p7AbrvqO/5g2WlyWfmJMm9aYl6vpCV2gYxF0vpGKZRIYGNnopIPfzoC65VUkzvZVFRbKAKAosg2aADaPYCMmNtBk+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788062302; c=relaxed/simple;
	bh=gr4rkTVBhpmeE6wnE/L2E/biYEOB5gLrbBa5K3eF+yI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aSAef5Pcq16OJKfyUrD/DKRS6X5LrN/QRAK9HEtR4/TU1pT8Zqp3b8gFO2WqpqwxaYTR5jIzRaY7ypthLCDDXOmF5dryBTGAIMW9HQWUDvE2KvJkCEvj8wSPIit28VJszCDEiHTGogWLNrf0IeQbOWyyUGEInPCIZFVazc4v0v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aVc1Fgs2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aVc1Fgs2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FEBC1F000E9;
	Sun, 30 Aug 2026 03:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788062300;
	bh=+1NZ66F2sSS5uUWPunN0r3qNkTgzPwN0HdeieRwtEnk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aVc1Fgs2c1qivGA7Wz77Q/ZvtLWFdiqeH+c+aKEKbi0WTxKn8wSEJ1AO4V1XwN2A6
	 jLml+SyuOa8z/CbudVP/7cG8wQZSn8MYgG5A+/zws4BhgDVVVZh1Cb0GZONmIhRWbt
	 W0+9pJ1jNc1XmLAZknTXbJ3nNmlyVfgVsWKF2U68+/wyJ3HAcXmqAyJo1LdfZxR+1x
	 m7wU+PNsG4zmiOu+I3iyhybqswdLhS4xshxa+eXNefQkmhFQuhda8vpoopVg5NTM+g
	 vxQhYP0tB9zErPhJM2vac1Ll2O19JkWlNOKKH5VJIOVBaTbmdWDZT/QU9PUvBK2Nkl
	 ii7lVY08ZIv0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] hwmon: (starfive-fan-tach) Add fan tach driver
 for StarFive JHB100
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260830011941.40199-3-changhuang.liang@starfivetech.com>
References: <20260830011941.40199-1-changhuang.liang@starfivetech.com>
 <20260830011941.40199-3-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 03:58:20 +0000
Message-Id: <20260830035820.9FEBC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add fan tach driver for StarFive JHB100 SoC.
>=20
> The controller supports up to 16 independent fan tachometer inputs and
> reports fan speed in RPM through the hwmon sysfs interface, along with
> stall and low-speed alarms.
>=20
> For this controller, the special clock and reset operation sequence is:
>   probe: clk_prepare_enable() then reset_control_deassert()
>   remove: clk_disable_unprepare() then reset_control_assert()
>=20
> Co-developed-by: William Qiu <william.qiu@starfivetech.com>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260830011941.4019=
9-1-changhuang.liang@starfivetech.com?part=3D2

