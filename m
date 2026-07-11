Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF75495E5
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 08:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783757203; cv=none; b=dul7cuuU7c4tu/DvnqGSUinm3CjUQ3YTmI3HvN2hb4dFPY8rk+j9m4LZG8wnl4mYCu1oFNpovS72RQwVjkJY9e3uFMfkTJeeUGJnaMyY/Y4VFgWldYETIfs+MnhvfvKfG9rdO2HiInG/1FujSu2LjNi5OeBPuCcOWleS4EBHzuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783757203; c=relaxed/simple;
	bh=tpAntsuH11oskamlovZCar6Pb5syrMQ+4on/aC5uOg8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=n4PZGfXxQzczQ4yfvG8U1lXhohHlBiMOp5FSO5MsT+AL6A5VWHEbVDGrax38lUG0yPTZSTz4WQ+BIBifJJxHadNVjJvy2gK0+nUtIhdsJV/bn+U59/m6uUfCzZiEOfu3q/GJJLhAfWBRbo7RKvb7NDEayLQ0/jCfq2te0+bWbvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WdujfW7z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WdujfW7z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3869E1F000E9;
	Sat, 11 Jul 2026 08:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783757202;
	bh=tpAntsuH11oskamlovZCar6Pb5syrMQ+4on/aC5uOg8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WdujfW7zq0t5ue6cBHZWx2iK3maEYh+EiSKHa4KwqJFqN+iL4NIIeWuAu85dlmTiV
	 m573byAncWUKWybitNYCAZTD5+OyooJBGbMmkA+VsTTrl/6sXgCwsgK6TUERDj0M7H
	 ccbXsqoRh+vAyq4m6t6QyKyzmEQkNiYP6oZRRNIA510HTD8KsFFxUdaG8PA6fkxor6
	 ZnHnXJZZbA9K7aN1gqpwuKxs9Lk/DjOr39kneKG64TBvyJ4JaNDFnjqmJkRqpTkWIF
	 sJhOVlgoRdWgF9MFQgRBtA3419J1P5ZRX2ET88VVIGUojTrpNM7aE/snFaM1MCBYPb
	 Vhwhkbyf+h7MQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/3] hwmon: (applesmc) Cache fan positions during
 register initialization
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shih-Yuan Lee" <fourdollars@debian.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260711075754.11358-2-fourdollars@debian.org>
References: <20260710123236.10508-1-fourdollars@debian.org>
 <20260711075754.11358-1-fourdollars@debian.org>
 <20260711075754.11358-2-fourdollars@debian.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 08:06:41 +0000
Message-Id: <20260711080642.3869E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> To support the read_string callback for fan labels in the modern HWMON
> API, load and cache the fan position names in smcreg.fan_positions
> during register initialization.
>=20
> Pre-pad fallback labels with four spaces to match the "+ 4" pointer
> arithmetic offset used by all fan labels in the read_string callback.
>=20
> Signed-off-by: Shih-Yuan Lee <fourdollars@debian.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711075754.1135=
8-1-fourdollars@debian.org?part=3D1

