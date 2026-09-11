Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B994915A2;
	Fri, 11 Sep 2026 13:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789135194; cv=none; b=kMgZjY5sFupa897dFPckjIV7rQPTaXdH6vkG284rwc/VZVNKyiD5aqRK7OGEybb7f3y8aBNY36rNdwDSqUUVvAPVsiMVqlZJK2/f+ceYFEEPecTCxih3tOMHdRMczMw9DFTuiW4vzue9xCIxpjSQ1bX8jHFGkU1jkjGyi4z5XY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789135194; c=relaxed/simple;
	bh=ZpWRz/+Tc9xhHy79grLwWJbkxQL/aqbkdYdZJ1mHVJA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FR25uIocM/7NsijlWVhqCbublX3heYaN/cjQYklxHRPMk3o+RXgHOVlj67mC+bFOer7ibQBDT60Ph63z/w8+PPjX/ZFn4XykXCBWH3LFyOcGVKoF2P71Ui3MAACnF6owpZJdAxNTvhcRaOfW8csuxGHZlEz/ZGKeTyIIypSSUbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g4j2llbc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g4j2llbc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 631F11F00893;
	Fri, 11 Sep 2026 13:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789135187;
	bh=ZpWRz/+Tc9xhHy79grLwWJbkxQL/aqbkdYdZJ1mHVJA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g4j2llbchArqLojHIUaQcX7OoaEceCux5OWo7FY2XQJtRbhbwqaR4ya75VCXkKpIl
	 eDvGQ0RsgyusaxoWB+e6OIcYArA8VgeTQsueNFcCc/MaQvX71Ey4Lwupmi7MdHMDcW
	 Y8L8nv2G9XWhgA/Uz/IgFjp5D97spHuydJn7wpvNuIyKAthF47csdiA+8Ukk09ecaE
	 H10pg5e3t1qFVUiQ15jm0hgXf2/3tek/CUBpcovYS4Vvk10WI0i77Ub7LyRo67ExHU
	 UmGSLpfaNqDBvpNFMzgliO6hAd546wjJcgMTBA3tL+PiK8B0PGeYzUJzU6hXVmgk+Q
	 wtUeawr5vEX7A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] hwmon: (pmbus/core) Add mapping function to
 pmbus_read_block_data()
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260911-hwmon-max20826-support-v2-2-5e30cbd97d84@analog.com>
References: <20260911-hwmon-max20826-support-v2-0-5e30cbd97d84@analog.com>
 <20260911-hwmon-max20826-support-v2-2-5e30cbd97d84@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 13:59:46 +0000
Message-Id: <20260911135947.631F11F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> This is in preparation for adding support to a device which needs to
> use it's own read_block implementation.
>=20
> The MAX20826 family is one such device. When not in PMBus page mode, each
> of its two rails sits at a different I2C address, so selecting the rail
> cannot be done through pmbus_set_page() and has to be handled by the
> driver.
>=20
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-hwmon-max2=
0826-support-v2-0-5e30cbd97d84@analog.com?part=3D2

