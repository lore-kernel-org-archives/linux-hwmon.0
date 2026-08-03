Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32FD30D3F8
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Aug 2026 19:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785786607; cv=none; b=gQDXS9QnnYIAdaB6OsRHyh2nVFDtuf20nh3vPY1P/+snmQgzBSnpvSWz+v3gfNkIUOG57aR1GBQ+PzGTT/fQeNDLouXwqpF1FBnEb+5PORldh8JrGe0mOU6qxBHx6wbjvSbdloYt1J7g3EcHa0xPhwf4eLJc+Wp8FiS0yiZSUr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785786607; c=relaxed/simple;
	bh=4KJYhIaX2C1mcjud7kBhAjj3RJ8lqrxEBZBDZzqp/Yg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O+g5UyFYnSdlH3my8L6Sn8hw5E/H+/p31PeoF/jJ6CrLd304+D6eVGp44kAhNp0pvFYLroL2+sTC6Ryui80V9tAVMe1CDTAlfoUgPvbyiZ2PhSP05hzUgWgn5QfFmL8u3T28NxycljJTt+ItHmz3L1jBT54TtqNSEKlH6Fax730=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f+hmEYH2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f+hmEYH2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54FCD1F000E9;
	Mon,  3 Aug 2026 19:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785786606;
	bh=4KJYhIaX2C1mcjud7kBhAjj3RJ8lqrxEBZBDZzqp/Yg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f+hmEYH2Y5ivYaoPYBZbVSdCncrBJ6EjOBaua/DrBxBGmvBTpLnNBbNnR1s8YRqx4
	 UEG8Am4sy8CbBMLGrGsP2UfdqEm3o/gj2HMnNuZMRz4/UinRSf68MzEYO3pU8aeI7y
	 pTrMAZeRAEvmn4VDlbcK2uyBpuuwlG+vxmuNBDCPQ+H/PrmkQGOQ8pClMZUw3U9K9p
	 AD9czKNRCRrkn5qv8QNsQ4yj92JP8L5b5l/AR7b+6j49fnYchpVRDtJQ3J4jJeWRs8
	 YDIDWfj7VqsiKckfj32A+Hwy54ooI8a2QrQZKM5dmPa9HhkuUlfTUAPpOnbSyz5SAP
	 OTRbGKJddybMw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] hwmon: (pmbus/ltc2978) Use
 pmbus_read_smbus_i2c_block_data for block commands
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260803193535.2286578-4-linux@roeck-us.net>
References: <20260803193535.2286578-1-linux@roeck-us.net>
 <20260803193535.2286578-4-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 19:50:05 +0000
Message-Id: <20260803195006.54FCD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The driver uses a mix of pmbus_read_smbus_i2c_block_data() and
> i2c_smbus_read_i2c_block_data() for PMBus block commands.
>=20
> Use pmbus_read_smbus_i2c_block_data() instead to enable the driver to work
> I2C controllers which do not support both block commands.
>=20
> Drop the functionality check to simplify the code and to trigger a return
> with -EOPNOTSUPP if SMBus block commands are not supported.
>=20
> As part of this patch, rework detection of LT7170 and LT7171. The return
> length of pmbus_read_smbus_i2c_block_data() may be less than the requested
> number of bytes, meaning the return length needs to be checked. Also,
> checking for "LT7170-1" after checking for "LT7170" and checking for
> "LT7171-1" after checking for "LT7171" is pointless since the first check
> will already produce a match, so drop the second part of the check.
>=20
> Cc: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> Cc: Nuno S=C3=A1 <nuno.sa@analog.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803193535.2286=
578-1-linux@roeck-us.net?part=3D3

