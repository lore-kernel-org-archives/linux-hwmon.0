Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF6E1DDC37;
	Tue,  1 Sep 2026 21:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788297632; cv=none; b=j2IlYS90xSOPhPYWi3sfmvgLE5mHuxGavGDYDvCrWOj72ADu3wR/UbQd7+RFKqq5r+rV7jpzS7umv8PLwBeQsuRGgwIHdRAFzB7Q+k7Px9c9gEkQzyzK+E2XHAE8KK/dtbs1GhRQmkInu4TNVRDvzTxKW+ANxfUR2CF52aoL/S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788297632; c=relaxed/simple;
	bh=RFXvNY8VCaKFue5P0rYSn4CtT6Gzb8MTlsmOy9NbU/M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tFxllxcRYepvuJ7g28RVgS7+1O5ypUcpWg/181f+s62qp1AR2WvVGoKfOsspeVwyxIHklUFHOdPJo+iZfYJGWOIDxMlKc2QUNm3tYG7eNQB4xqk7Ynv6BoFNZ8R2CQotU2Q3ljO9xtORM/QaLXzjSP+kph4lQ5vYr1g5pZa6iw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bhd0kKOR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bhd0kKOR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D5A71F000E9;
	Tue,  1 Sep 2026 21:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788297631;
	bh=RFXvNY8VCaKFue5P0rYSn4CtT6Gzb8MTlsmOy9NbU/M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bhd0kKORIzd68OLoAuUw0Na4Kkcr0EAwU8CEotQqNDVrCV2Xs/4eiplyzNKcPqxfn
	 hXUVBnQNCR+/LdWSsLzwu+65wXA50yLhOX5n66v+52UYDniPvSVgC+q8rmAUyb0jOu
	 ajxEY1HBKwfE6qCw+PqaHCI59i2WBpWYGfYzMPDb6OLUuet4D3i5wZ1tp5Q1Fnz+up
	 a0s3xT7NC0jONx2zUs3+Z1z5EQT0hhnILR4+XBBHNTVrF50onxNC+Zt2joF0s/FZ5T
	 3miyW7Ek9HOqgQcQyUXERhQ8KLLLeAqFuwSyDGyJRWCFduvFgcIKCtjB7yPkCUYviB
	 4hzKtD+nR81Zg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (pmbus/tps53679) Add support for TPS53622
 and TPS53659
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UHJhZGhhbiwgU2FubWFu?= <sanman.pradhan@hpe.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260901211129.360792-3-sanman.pradhan@hpe.com>
References: <20260901211129.360792-1-sanman.pradhan@hpe.com>
 <20260901211129.360792-3-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 21:20:30 +0000
Message-Id: <20260901212031.4D5A71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Sanman Pradhan <psanman@juniper.net>
>=20
> TPS53622 and TPS53659 are dual-channel D-CAP+ step-down controllers that
> use the VID VOUT format and VOUT_MODE identification like the existing
> TPS53679/TPS53688, so they reuse tps53679_identify().
>=20
> Shorten the Kconfig prompt to the family name and list the supported
> chips in the help text instead; this also adds TPS53685, which is already
> supported by the driver but was missing from the list. Update the driver
> documentation, including the per-attribute lists, and fix an existing
> "TPS53588" typo (should be TPS53688) in those lists.
>=20
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901211129.3607=
92-1-sanman.pradhan@hpe.com?part=3D2

