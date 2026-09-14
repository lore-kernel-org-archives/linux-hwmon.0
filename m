Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350763563FB;
	Mon, 14 Sep 2026 08:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374912; cv=none; b=puo9C+iAruE4rS9ZwUJ86Bd1Yh1JyneC/9fUYXFhlIGHDg9OhaIFpDtvdaF13elINTIoOfvV1cnx4G+/Z31h1b0rKRf02mb25MFCPLIJ21r5Y+2lU1l8nXhh0GS8qQT9OOj2Cm8o2GUuiwCUuHDWpV62ke1w4FTAqWiicSQrFOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374912; c=relaxed/simple;
	bh=B5OnFVQ8DTOhxeWJM4/Q69+6NosGQ1UUxiubovOqJ7I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LX6et54mqkpBwhBeTw0NMOv/NQ5SU1XCHuTFYYbdjS15l+NndwKlkA2NwpxQv7WwQaandvJTnf2YwzRo2tSbA5VDa7Zl7PHXZY28EYdpGIPFDmE8+bKWz0vOrTI1wYcMmoS1iqjC4qgsLm4AUxkxnvfkogTyzSbcm4U/4HHcUJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VkQrs9CD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VkQrs9CD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 633521F000FF;
	Mon, 14 Sep 2026 08:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789374910;
	bh=B5OnFVQ8DTOhxeWJM4/Q69+6NosGQ1UUxiubovOqJ7I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VkQrs9CDSK/nYHZbdcGg/MdGoU2I8rZtqd3TinHdOd1I23H7yx2VvFPT2jPDz6J1h
	 f50rDhVzia+esH6feq4A5oyTRmij91LP+V/IzDHYSlruXYReyQ2YhC5THOO6xod0aG
	 RBHtbelt3aK2Z4YGh5+gYGhIKO+x/HEAOmTSk2BsrijvMRv8EnSkSifP7BY6FPZQwD
	 AxLVy8f7w6Xjqx83qeiqcyk/9NGu+PR4xHR57kgQyiNbUb2jJKL5USYJbRh/OjhmUt
	 E1uftHGQCLNj84Xd7Q6omwyH0i7jkqUtB27cz2gKWkBI5npxm1sG5vV0yPMEzZIK17
	 0Bo5FGPcG7tsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/6] hwmon: (lm63) Add Sensylink CTF2301 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Troy Mitchell" <troy.mitchell@linux.dev>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260914-ctl2301-v5-4-522def70acb4@linux.dev>
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
 <20260914-ctl2301-v5-4-522def70acb4@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 08:35:09 +0000
Message-Id: <20260914083510.633521F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add Sensylink CTF2301 support to the LM63 driver. CTF2301 follows
> the LM63-style temperature, tachometer, and PWM register layout,
> while using a 12-bit local temperature register and requiring the
> ALERT/TACH pin to be configured for tachometer input.
>=20
> Register an optional thermal cooling device when the device tree
> node provides #cooling-cells, allowing thermal zones to control
> the fan through the existing PWM path without changing behavior
> for existing LM63-family users.
>=20
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-ctl2301-v5=
-0-b44b81cd2c3c@linux.dev?part=3D4

