Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E383793D3
	for <linux-hwmon@vger.kernel.org>; Fri,  5 Jun 2026 21:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780693603; cv=none; b=h2HNNt7nMSspiKukcSAm57aC0EkDO74ZKpDCL5drKg8REaEgE0mvERjwsgU9XcTdL5f09pw9p95PEuE4j+HubpGqfz+Cg/x1igzTkSl6X0LjUFNj8PltI/tC/N/nlX8tu53ORHVBGBzfHmx+gDhHIRtQYXAPQxjt6PwIsYy4w7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780693603; c=relaxed/simple;
	bh=NBbwJQYXMHGGkDpfUEtq0VLXWHIfKkBzRknrCV8+8gs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZoQr1oLVvJNHHAFipnFBedypKYJgMpaqBFTnv4l5MFm4Z4a5VSvUM5iaVVSnWbOG7LV9B7GyO69SvPPD7hkiQBqJuQE1K3G1V9U7Bh3tTT5e10otzDkEZ70Lmj0i+hriIiLj0q59g9LPoPSNxK/foTZoVJnVbBt/5TAk03mFkNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YN/VGjjR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YN/VGjjR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC931F00893;
	Fri,  5 Jun 2026 21:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780693602;
	bh=NBbwJQYXMHGGkDpfUEtq0VLXWHIfKkBzRknrCV8+8gs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YN/VGjjRTM7o+CXdJD+0z/75UCFRyneRvNmA6ZKNhXma1G7OYnoabxCPfQneZe1iJ
	 3U6uKVN1dLDE6DkjGMzfJ/b4eKphGcQmEMro0CBJ4MxjFYRfKcUcR0WF+dyyvFqEvQ
	 A4VBPqgs9ywYkmjmFooIuutobdqwvACGqyJF7Li+m2Ka4+q6T308hoHALHyBvc1AGy
	 iMfEBUw5ZJfWxp5vs/vq3+3PqoW8tjNUlOmDAFbWEKL33SDajhe9Mkj+SgEBubX7PH
	 UdiINQ2gcRFLfTWPJ7/Fm4YZvDXQW7IUAnTBKvKO7gVQbT81l9DuiLiD7QFtWk9WIk
	 zhy+X2O+Cu4Ow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/9] platform/x86: dell-descriptor: Use new
 buffer-based WMI API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260605205937.530897-2-W_Armin@gmx.de>
References: <20260605205937.530897-2-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 21:06:41 +0000
Message-Id: <20260605210642.2EC931F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Use the new buffer-based WMI API to also support ACPI firmware
> implementations that do not use ACPI buffers for the descriptor.
>=20
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605205937.5308=
97-1-W_Armin@gmx.de?part=3D1

