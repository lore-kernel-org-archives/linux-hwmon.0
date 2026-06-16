Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D02635AC32
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 13:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781614837; cv=none; b=BHiOFx3CVbIl2VmLgRzBYXgNCJny+97n8Us+RYBNj32RSHimk3SVa2fVLh8O8ATrdKzTYl6Arw77BPXYYSuURuTH8qPJ7m+1vYbLk3xu0/v1dJ2A+rzVVDeXmG8FhKudLaSmRr191PQdRnodD4UajqNj9EBtbVgoHU2Ke3syzXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781614837; c=relaxed/simple;
	bh=ps832KOE0U1o2yF8eLKtzPzypObO8x6O/kZnGAg+q/A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AH2y/JVFX+rydYQN1PJGA1LRiZOcPY1SWCUhorsGHwSrryAICaYTdl4V3+CUoc3fWHw4/F1+d5EQk1Gq2l3CNF8L7hxFucuj/x1nEO2uO1JDctG6r49IZHifGVaoeAOUqmSVFII70FU4BrqRptttEwwBg0jhqnTbwfdywN09zSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mF9PtZMX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mF9PtZMX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 836831F00A3A;
	Tue, 16 Jun 2026 13:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781614835;
	bh=ps832KOE0U1o2yF8eLKtzPzypObO8x6O/kZnGAg+q/A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mF9PtZMXHan7IHJ6bhGL5DdUAAjr0vwqmsCRgzev+azZH2RDF0XFyYRwTX6j3R6Wm
	 wxxBuuLTvHTiTfTaq4xHVeU6VYzPEmO6I9JUymbucYCmseTtvaNwLOEU8nQ3cSsIkj
	 OpgKjD8wd6SvLGCavW8fMguVUrHd596Pw/+VjnjYBECGkJnlhRNZMwd6hqw6ChKOqv
	 FIFgs2qjuMHmEOtGt1Yt8NFFlusI+uniuQZvtpqhOjxTFtcGIDAYj0HiVoYkBD5dmk
	 zXqU5CJXhfQOHUHWfF920WccVj5dIXMR90ESjsLcgt9ct7kMw9AwGBDvVWhMKrlZmb
	 99AyMw+jy0mWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (coretemp) Clarify attr_size comment
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ximing Zhang" <xzhangjr@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260616125631.35537-1-xzhangjr@gmail.com>
References: <20260616125631.35537-1-xzhangjr@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 13:00:34 +0000
Message-Id: <20260616130035.836831F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The attr_size field stores the number of sysfs attributes created for a
> temperature data group. Clarify the comment to describe the field directl=
y.
>=20
> No functional change intended.
>=20
> Signed-off-by: Ximing Zhang <xzhangjr@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616125631.3553=
7-1-xzhangjr@gmail.com?part=3D1

