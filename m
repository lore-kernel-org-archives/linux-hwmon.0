Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FF1439F99
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Jul 2026 19:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784748350; cv=none; b=qAKB/ZkvuV42YvjcLYQ274L51xrz8DNmQ5LsSMDn+UY0a8YkdDbUXBWWYlr5wOO2k+i4hC74tSAnzgW6l/GatXb6Wk9lul0J2SNLBt6k84WZ0I6u43lHD6Sqf/5kPEfEm/1eS0ON1hhwY3+53SS4YM2ZIg+dDh0oID1WfGSEGeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784748350; c=relaxed/simple;
	bh=3FvSf276oAq6eJVi/GTbTUit9MIOwrIWCM08HR3jTuo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jc9bLKP05W/68EbMzvvAmgK3REXVaPOIT+U67BEPjyP025Bn5WViR21S+1YOilAko/N7UYrpusxraXRfhw1IU9+6eBIwD4VaaSx6LzwcEhgQRorfntm4xBzlcn6905Y+EUSA4jAe6J/xs9g055zPcwP2NlIuT8EC6mLeJsV/anM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jP02cx/g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jP02cx/g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 619281F000E9;
	Wed, 22 Jul 2026 19:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784748347;
	bh=3FvSf276oAq6eJVi/GTbTUit9MIOwrIWCM08HR3jTuo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jP02cx/g8+zIpQrpuD3dYLYhUtij43xavN7n5azsKSIY0QH4Pru8D081/7FsQqO6t
	 UJjCCuwSJCUpPfvlmKxOBBeRnqSUzl8tezss05pvzWELNZLa9CkRDFiynE3MPO24Py
	 y7ab+oIQsQ02i4VZ5Dm8YTV33JbB9adt6tWifPfvBWfGWaQMcYD12pLKr7HHfFQSNX
	 QwunsGCAWM1xFOqU3MD9QZKer8sg6kGzoq+8Yh0byLl1Yeo9jLdw88FalfTjpSI9PO
	 8nt7wfblvNBXG6qpooj/08m9f2hNFFO+g9dB9CmEiWndSW7agNuokpGH6Uy5z5VwcY
	 Ne6nms2rLkXfg==
From: sashiko-bot@kernel.org
Subject: Re: [RFT PATCH v2] hwmon: Add support for currX_emergency and
 inX_emergency attributes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260722192024.2314973-1-linux@roeck-us.net>
References: <20260722192024.2314973-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 19:25:46 +0000
Message-Id: <20260722192547.619281F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Some hardware monitoring chips support three alarm levels for current and
> voltage measurements. Add support for currX_emergency and inX_emergency
> attributes to support such chips.
>=20
> Cc: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722192024.2314=
973-1-linux@roeck-us.net?part=3D1

