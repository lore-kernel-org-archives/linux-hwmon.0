Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08EA27707;
	Thu, 25 Jun 2026 06:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782368256; cv=none; b=DyJfkZqQ61HnyacefbZ7a/SxBbg2oqlo8DOdQeFYVR98LOV0+ddya3ohlRL1BwmU2qmeOZx5bYz9ZnWbgfy/205jDzEtOuFq3Ww5J4bKMOSYB5Xdks2fLLAIHtDsF8housn3owfwHDzifX+eaJXBUEiTcw9jVHX6hB78OYIPQFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782368256; c=relaxed/simple;
	bh=EY/cfTRVvk6FjLb+IHXbl340YqvBda8DpZiXIEOGK8Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M6oBh53on+NBCdIwdtQjaAisaXy68JAQ96sEPmcHHQyF7A+KNmEMv80jn+iOWJGiLzhl615irbCDMDT/AJm8ID3dj8aDBnhr0gTOcOyJbCpZhoU5zWOKLIh3tzuNjRIo6f7pjdROqo+AhS2EDEwWdbuFvSE8iCgIO/RBLUohpEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LZZpdQZT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LZZpdQZT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FCC91F00A3A;
	Thu, 25 Jun 2026 06:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782368255;
	bh=EY/cfTRVvk6FjLb+IHXbl340YqvBda8DpZiXIEOGK8Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LZZpdQZTjTtskADT3GfNalQslIsEtgW3PKv5hKPSzgP0JFneP+xDlj+rRJsd/MT40
	 HH0EyrPVA50sp6ol1eNeXIN4p+iiBk66ltoR5kKmBVKG4TDMl/HcuMojDoMW7o8x1d
	 ANOzCGH57mcNUzBuEx+CbmZYD+Hgw7q8HJkYFyclXVQCcUkdAvt0jzmGBU9C+thnKv
	 LBU6UZF+N1eRM01Jhds5mXX+qYKnObyz4PE0l2boDa0bykb7hMupflO4cZJ4uvkKfT
	 yGRtagGn9UB1zGWpLbV54C3Vavw30tuVgiAJam59DL6UmRw6vbsTqs7IzGeekigmxJ
	 0qrNMz0IEz3Wg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/2] dt-bindings: hwmon: Add Eswin EIC7700 PVT sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: hehuan1@eswincomputing.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260625061147.1631-1-hehuan1@eswincomputing.com>
References: <20260625061049.1614-1-hehuan1@eswincomputing.com>
 <20260625061147.1631-1-hehuan1@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 06:17:34 +0000
Message-Id: <20260625061735.2FCC91F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Huan He <hehuan1@eswincomputing.com>
>=20
> Add device tree binding documentation for ESWIN EIC7700 Voltage and
> Temperature sensor.
>=20
> The EIC7700 SoC integrates two PVT instances for monitoring SoC and DDR
> power domains respectively.
>=20
> Signed-off-by: Yulin Lu <luyulin@eswincomputing.com>
> Signed-off-by: Huan He <hehuan1@eswincomputing.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625061049.1614=
-1-hehuan1@eswincomputing.com?part=3D1

