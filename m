Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61A03B993A
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 18:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789066005; cv=none; b=cQPEE/Q00QPjPyY8WZpj5DZgP0RkPAO3xqyfXVWgCDYOPvdnb0qayu4IFcey8LMC3jw/5VxrM4K/yJIzgznBoki6kCW54WafAQwT5Fq3FluQo9OsCHhCrpioafSG0kLZh7bNGZuwq1pTNQLwWFdKy9GT4lM1Zjx72gMwN4GUUrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789066005; c=relaxed/simple;
	bh=ea37eSY8UMTeej1DjKnFFcpv5Ewer3HYOf31GatXJwE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cUyUu7GB9GpNSpbdbbM16mivtrzkXRoBJtwPAx56PE6qV1CIAAI6dViW50Vpt4I1bPNmibxHOgTjfHzFrNIJEcNkORTAq0EDSXiJMJETwRsWH9gvF0lzJXblW1LBBUjftUvMUGm38iltbHZT6JkU67BlIuSrfl8AQb8xlXyYmRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e25P/0nt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e25P/0nt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 471CC1F000FF;
	Thu, 10 Sep 2026 18:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789066004;
	bh=ea37eSY8UMTeej1DjKnFFcpv5Ewer3HYOf31GatXJwE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e25P/0nt75vW2Q1jCiHyhYV9/+d6iGsOFLzNN8qK2JBRcXCiVYokwKCHsv07mBRX1
	 Z8q8inp9JVLq0qiZcXz5JoJpqri1wNYrv+SJBU2mQVvDuZBSnbWxHnJFqy1PrWHtrM
	 QOU8jVy1CIC9TTCGB3cDF+6A9N+TiX6bCNKXw/qwc/OyY1OxiAuwpfBJI1lUeaEjc7
	 BQp4iYPAD2s1bDVF0c9Or3pg2N/JZVQz8g/LKJTP3kBpXXNPUlVDiWWwPmtba1XviM
	 tJeV8RRl5OlTXEempAUQHCpGoQSQm5zx31ivdhSqdhYr70VwPOLPNbzIW54fVbeyIV
	 EI7h6feFH+BSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] Documentation: hwmon: (yogafan) Update model
 reference table and contributors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sergio Melas" <sergiomelas@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260910184322.1816996-1-sergiomelas@gmail.com>
References: <20260910184322.1816996-1-sergiomelas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 18:46:43 +0000
Message-Id: <20260910184644.471CC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add the new IdeaPad 3 15ALC6 Ub model and Yoga 740-15IML, update existing
> model entries, include corresponding contributors, and adjust the
> reStructuredText table layout and column separators to accommodate the
> longer strings and prevent Sphinx build warnings.
>=20
> Signed-off-by: Sergio Melas <sergiomelas@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910184322.1816=
996-1-sergiomelas@gmail.com?part=3D1

