Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A54399892
	for <linux-hwmon@vger.kernel.org>; Mon, 22 Jun 2026 14:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782137532; cv=none; b=f6HDHn/N+1cVUahWhjQwG2i1lXp0Qcz1xXZru19eu/5MPBY+qLj1UKiReNCwKeYsiSHRinn5puhlAyqw29g6ht94z4KkD2Vd8BCG4c//SdeoMEQ0lcOf2rxVV2VoB6Ztf8L4nEdYg9KQ3Gvuv/6D1w4Nro6JcBdLcK7OcaJKk7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782137532; c=relaxed/simple;
	bh=4txBWuShIxBR4j4ZoKo1Nzl//fJMrVZUlWmQKK+dLeA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d0ritGyDlToEu/linFTLByWSGICEF2X4blfTLoLjY2eWX07FpjhVk97CVdEjcaY7ZzuEcG6doNjBFXMMBnXi80WTdQDcSb7Rrf9OstfWPVlfD47N9XVE3jlmaz/aIWyE8U5d5/jsxcYq9qSriIcI3n7sDU0aJSNpidnlcOdHlok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ESEAFLFw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ESEAFLFw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A771F00A3A;
	Mon, 22 Jun 2026 14:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782137531;
	bh=LWLv6f7r8MxLIe+UlK9w3qbOSFvyCSXXWY+QroQ0XbQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ESEAFLFw4NlqGACme8cgVlzWqOqMDVnFFYNdk+f5mWYXBTKByBkgFeCvOB1fSN5Lk
	 bZnL8iR0W3ruIElpQ/lit3ptDbs90RF4h+nNE6lQddc5axsfRXkut7NebdWZ1jMOvd
	 CRsCRpNW9u/9/UaBpHy1HU/LgG1O3hYwkZuESiXTIgm4CiopJQhB3FQpgHhw34rYi2
	 UD0OB5/TnlgJK0HH5VKjej8EvCvvXCtzD0zSu96/XmlhN7yeCu6zTrCNhltAohZb5f
	 BiwAX+M34Lcji4EB1Qvat2RUfZvWVt7pJC80An+vnbJFvTwBF0QFKhdzmfwp3tyKx+
	 hqbfJP1y/rHJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 8/8] docs: misc: amd-sbi: Document SBTSI userspace
 interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akshay Gupta" <Akshay.Gupta@amd.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260622135821.2190260-9-Akshay.Gupta@amd.com>
References: <20260622135821.2190260-1-Akshay.Gupta@amd.com>
 <20260622135821.2190260-9-Akshay.Gupta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Jun 2026 14:12:11 +0000
Message-Id: <20260622141211.83A771F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Prathima <Prathima.Lk@amd.com>
>=20
> - Document AMD sideband IOCTL description defined
>   for SBTSI and its usage.
>   User space C-APIs are made available by esmi_oob_library [1],
>   which is provided by the E-SMS project [2].
>=20
>   Link: https://github.com/amd/esmi_oob_library [1]
>   Link: https://www.amd.com/en/developer/e-sms.html [2]
>=20
> Include a user-space open example for /dev/sbtsi-* and list auxiliary
> bus sysfs paths.
>=20
> Reviewed-by: Akshay Gupta <Akshay.Gupta@amd.com>
> Signed-off-by: Prathima <Prathima.Lk@amd.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260622135821.2190=
260-1-Akshay.Gupta@amd.com?part=3D8

