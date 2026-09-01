Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C433A48D893;
	Tue,  1 Sep 2026 17:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788285190; cv=none; b=PC9z9X8NDHWx4MkjpVIoAe4Zsbz9A6HMjRwetG30PQ9RWytMZfA+bJYD473pUcm9cHVjYd5QhY65PIHEi/Xm63g+fl/Kg7Jf4OBOCosRHkBHHNpbQ714lTZv2jGZuetq4nAy10akCiTfYxNpmuFWsLYp5kalZi49r2Ekp/TUvYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788285190; c=relaxed/simple;
	bh=UYj206OH6SCFOzH3p+E9676j+1yHN1ebXr/XjxLjn38=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iAowQzI68XXPLPCNfGb0e6LXwg0suP3ugn0esH4HFcsjcSB5G2Y6MvCR29wQhnDv5xcpifB2xz7ie1goVgLNDDkptlOadGfUmXcFwdNVC2EjVcyTL9l1mspbKyJdjDH8pJDhuCNnvM6+aZ4ge5gQW7Rf9qlhyNQKlDuRe3wGm4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l+AsyzEC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l+AsyzEC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ACF91F000E9;
	Tue,  1 Sep 2026 17:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788285188;
	bh=UYj206OH6SCFOzH3p+E9676j+1yHN1ebXr/XjxLjn38=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l+AsyzECMA6u0ETBIJdpDJ90Tb3KcoXvhqezj5fkw8Th7JlgS0tpQMLTEITZy702y
	 xvHlQjnNIfejAzRyJP0LL7IaGboSRRkZqfCXkiGyp9MReMSqIy170f+gPxYMe7On+w
	 khPkE7Ol7yGxQqqCALDo4KN+SXscqplCLh9a/N/6lEFJemtc+BDtQxKKGXxzI5oYiE
	 0HYrygExE6fhDcquWiyPc/6cKjqVF6TQM6Kp+awfJlRKCKsDSer7XNxjH1Y3oZR2YQ
	 nYF19pQlKvea+RvDo0345/8oGgKPxxxcN7ZBOedFA4GiQ+59+DbaAuxi43m1D7N1Iz
	 OW2sH489D0P2g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: hwmon: tmp102: Document TMP113
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260901174847.97261-2-marex@nabladev.com>
References: <20260901174847.97261-1-marex@nabladev.com>
 <20260901174847.97261-2-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 17:53:07 +0000
Message-Id: <20260901175308.0ACF91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The TMP113 temperature sensor part is register compatible with TMP102,
> document it using a fallback compatible. Unlike TMP102 and TMP110, the
> TMP113 does have additional unique ID registers, it is up to the driver
> to handle those.
>=20
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901174847.9726=
1-1-marex@nabladev.com?part=3D2

