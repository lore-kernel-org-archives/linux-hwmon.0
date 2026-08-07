Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42617439911
	for <linux-hwmon@vger.kernel.org>; Fri,  7 Aug 2026 05:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786080900; cv=none; b=iYdQ1WIwHRxDNKMekIvAgI3eWpxv8o29r/6nIEpEfCDJ0dDLmbIyQKtTkMgcTZm07YwOWLSDI1jXcojIYx4mXaH1XL5ShnKziveygvsK59j+R98th7xZV29VurZeW8tBEuCqisZMmGhlFVUNq+326jRbxyPFrKTNCS2kMk70CtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786080900; c=relaxed/simple;
	bh=uFZxIQ+nRmh9hSn0XKCI5sWKWqStZ3hERncPS6UWwtg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kq77dVOZzdCDPEWjMIQTsg7Y7QE+8duhW3RZ0b1hbvZkwK08qhNNT+NjUaqXXAxWGRkXmA5hUkkbieISKAnAiSLvj4GyuGbH1t6IhkYIxl0sQun1sFuIfaw/TELYv2EVJxFzYkbPhIheRw/sfXFZOgQZDoIMAXC1/e2iDOFk1tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dcbrfPgx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dcbrfPgx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E52B1F000E9;
	Fri,  7 Aug 2026 05:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786080896;
	bh=uFZxIQ+nRmh9hSn0XKCI5sWKWqStZ3hERncPS6UWwtg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dcbrfPgxvohzITTFCXHsm4fPqIOKdmePgeKtoKiiP2JbtWZPRcBUiSeXjY922u2wA
	 MBBNDz98cNi1SKRFkoFdbWBYNaC9RgPBw4fojJdlMnM3qUGzdH6QsaYXcIvyDbVsTp
	 ZX8DIiqfpiF2Bm8DfvVtzwZxtnVtCaNETRXrX6jM7efmFP8R6JKHO34NoYo9hk7fkg
	 LZbtS1SFr1mx4crICobyBeMTZGsH/7wcYjIDLEzs8DDUY19WVgCVaql14p6zsa7ytm
	 ebdlYNKuZaVXB7RXYTfWpog6XQVu1f25MJQCMkz57K4LmMiORfh+nB66MMUkK3iEJo
	 ECpnzbJL7+LBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: corsair-psu: update documentation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wilken Gottwalt" <wilken.gottwalt@posteo.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <anVuBd8Bb7T66OUO@monster.localdomain>
References: <anVuBd8Bb7T66OUO@monster.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 05:34:55 +0000
Message-Id: <20260807053456.5E52B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add information about the HX1500i 2025 series and fix the missing
> HX1500i in Kbuild.
>=20
> Signed-off-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/anVuBd8Bb7T66OUO@mo=
nster.localdomain?part=3D1

