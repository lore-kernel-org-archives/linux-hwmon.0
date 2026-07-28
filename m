Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0AA3F5BEF;
	Tue, 28 Jul 2026 07:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223975; cv=none; b=IoUWDOp8GE9KlTC6lwpqzSa7AYPoxmLIULz91iCi23ANWiF4y50YndU7aLwwavODyNoWcEVkN+0/eqgeabUa0XKWriqCbXSXkWi4mXr1mIpHJVfI8rm3mu0fgIe/MUJMVDIrLWl8TKxWzdP7PGY51Q/AGe53gGXnDenJt6NjeK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223975; c=relaxed/simple;
	bh=Tr1yk5M/1ibVUSlaQQlbBDhATqYoOLL3gJFQ801csDc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oPsrV+WHsqvW6zU8Rd7K3FVBCbgYvEG9J0nCc2tMu3UpznLe1XIgUBJCepKrT85mELfNgXZgiXAcUx8p/QFYyQ3oVBCwkJiiqz9FFbu+4gQx2CS5X+ASRyZYdbuHGgpLwb2h2GJginfB/zcTDdglsTC9A0iFErcNwgJzFzwdCtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hM/7tnj/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hM/7tnj/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20D781F000E9;
	Tue, 28 Jul 2026 07:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785223974;
	bh=Tr1yk5M/1ibVUSlaQQlbBDhATqYoOLL3gJFQ801csDc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hM/7tnj/2FNoT+jLg+RIGOejkPQH5m44Qws6XLmtMLE5pgNoyrO7x5Jmmma8aQDHe
	 osk1NNL0xsGJ+5gb8TnAWn4D3AxtvaUQt+3GPqFD2JnMMwH7DF1DVVIIpYJnZi2nRH
	 hGOk5uRhh5zwhRS3AcA2rzrWsGbdPcK4BcPaWlyxUWiDN+uMKKNJFewzje7JKBYjlT
	 8ET36qExiOGoTfY0ANJCYCrF2bT7qPaJy8D/oj2ZU92hry/b7HbiYv+xTjR6u7gQO+
	 FgK72yKh1tGWucTKvvOrVMWyZHMhAHzMFFkr9J6M52Axux3Z95Xq8f+3ZdWjIzHLR4
	 CmyMDjZQQjZgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 11/12] hwmon: spd5118: Add I3C support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, Frank.Li@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org
In-Reply-To: <20260728065955.809445-12-akhilrajeev@nvidia.com>
References: <20260728065955.809445-1-akhilrajeev@nvidia.com>
 <20260728065955.809445-12-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 07:32:53 +0000
Message-Id: <20260728073254.20D781F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add a regmap config and a probe function to support I3C-based
> communication with SPD5118 devices.
>=20
> On an I3C bus, SPD5118 devices are enumerated via SETAASA and always
> require an ACPI or device tree entry. Device matching is hence through
> the OF match tables only and does not need an I3C class match table. The
> device identity is verified in the type registers before proceeding to
> the common probe function.
>=20
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728065955.8094=
45-1-akhilrajeev@nvidia.com?part=3D11

