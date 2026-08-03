Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43FE3A9623
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Aug 2026 19:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785786536; cv=none; b=gTvwX4YiryyMtm5u7sdy52D1VUNr/u6YBZ9grQCMiyMjwWR9Rl4l9V9p9pRIb2F5g9HWf90F7G8yx2EZvb8xWslv6a1BOsp1JNLSmAqQK3LVMCqvR5pni6ORhw1SY+kux9w7LKOslkwXD9eNtmZLziWtnnOd5oLjCFpu7JOPDVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785786536; c=relaxed/simple;
	bh=W9YGV/U8PEJDGthkvpgsOs5CcstuTPyO7r5d2aRFRQ4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RE2Yjv0pkEwzCgGZpCzGFgKI+yMdpiNWKbnNmewqvM25APd/GfRbbxjaQ9KWrgVTrjlL2sw7gS3GVRmGtxMr/ZdC0IWuLfIbEoyCvlheEeNaa1qNICrRXeRmo8rJhofwmAE/oXTrraahiiwZN2iHcEnFR1xQ0+GT5fXSlpCQ24g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oZY9otty; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oZY9otty"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D32C1F00A3A;
	Mon,  3 Aug 2026 19:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785786535;
	bh=W9YGV/U8PEJDGthkvpgsOs5CcstuTPyO7r5d2aRFRQ4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oZY9ottywgLSXIT6+jaqqMGhv0RbO30VsKxhUfW1/EzrMC+tnKtm6FW2TDg60/CuY
	 JTG4AtaKTsxFhLKGSKgMZAXymQBhwtolL2fUkybXrQdhnagtNkv0lwomE2BxXqAmOh
	 9A/axKXb/XNsD2uUhM2yB+X9M3ENXj+qL9YVWVn4fhta3GHgFN7Et+/aEvKvwrF3aL
	 Lf9Z6NxEIz9M8BA5rLlzB2+QSg+eYx5WStryGjAYKylXy7uD++EBEgTohqZfJjvLxP
	 U1gCK9mWKAm56FfqL4gCxZUQgreFeXCOmqHYTF4djnNJLf2uH0FwwhbGKAg14j1az1
	 7dTPAVSbhcW9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] hwmon: (pmbus/adm1275) Use
 pmbus_read_smbus_i2c_block_data for block commands
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260803193535.2286578-3-linux@roeck-us.net>
References: <20260803193535.2286578-1-linux@roeck-us.net>
 <20260803193535.2286578-3-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 19:48:54 +0000
Message-Id: <20260803194855.5D32C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The driver uses i2c_smbus_read_block_data() for PMBus block commands.
> Use pmbus_read_smbus_i2c_block_data() instead to enable the driver to work
> with I2C controllers which do not support i2c_smbus_read_block_data().
>=20
> Drop the functionality check to get an explicit error message if the
> required SMBus commands are not supported.
>=20
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803193535.2286=
578-1-linux@roeck-us.net?part=3D2

