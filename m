Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153D93438BB;
	Tue, 28 Jul 2026 03:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785209979; cv=none; b=il6O9TuPdUL17kOpkaNqLSGpsA/bmCZjD/wnMuoKetQ5lnUU+iRa5zfKk4TQMvo9/W4BF8n2ranbvcQOhdT6n8N2sAWc98Y5Gn5OU1M2WE/O0CFGPnUr5ox1wrbVCmfpNc3MWLaVNitcVowbCsOItbDF8fuZq7yCoOkA87nIA+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785209979; c=relaxed/simple;
	bh=6ZTu3cQRdrXk2OaLWr8RR8FYe1HLnYXELf4Bd29x5Cs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bGHPq4TBW+3BW900lY+OR2YZFc+EEGT5azHxTQrGhRG2/hk+KSK1DsAMzAfUGwglhDsu8LT2uIgnx4wlCW+UvWx72r6Z9mZXdEqeuRpn3YVn/kF+ChDcktXKahiDS+AWyes+kQizwTG9qt2ut4grORFWzm5C3Ur0CVqykGMM9ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qrvm7LOP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qrvm7LOP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A337A1F000E9;
	Tue, 28 Jul 2026 03:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785209977;
	bh=6ZTu3cQRdrXk2OaLWr8RR8FYe1HLnYXELf4Bd29x5Cs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qrvm7LOPDav0QP71lhZlrqGAqjQWdZKY6ROVKcdfqe2JCVyFXyX3NYqVqU37BlPsC
	 15yMUYEGx7U0QjAy3lT8kRcm+etMun6wgtAPIF+6F5yXMcswp+f0h6DBwXCBUnckYc
	 EMsA0wq65bAoqvth/ou/bmeRNmJg0ZhfQRFmIibQUAltpyxADnC0kP+n4g2zpsUVt5
	 SHlG9UBnVEfjhza6Bht7SURuu8zWV8p0kgPgNo2NxwFNoKK9shdyHL0bPoI+xUtpOo
	 BRAoB5I5Dqj1elpgLz21oKqbytLJemSrvIe4qOY25rKInUq7JNf75m6ZziCWyFTfH0
	 AlKbzFkOBrhCg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: hwmon: (pmbus/max20830): add VOUT
 feedback resistor properties and complete examples
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260728-dev-max20830c-v4-1-cec034298535@analog.com>
References: <20260728-dev-max20830c-v4-0-cec034298535@analog.com>
 <20260728-dev-max20830c-v4-1-cec034298535@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 03:39:37 +0000
Message-Id: <20260728033937.A337A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add adi,vout-rfb1-ohms and adi,vout-rfb2-ohms properties to support
> external voltage divider configuration for VOUT sensing. When the
> desired output voltage is higher than VREF, a resistor divider (RFB1
> and RFB2) is required to reach the intended value.
>=20
> The properties use a dependency constraint to ensure both resistors
> are specified together, or neither. This prevents misconfiguration
> where only one resistor value is provided.
>=20
> This patch also added missing entries in the examples.
>=20
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-dev-max208=
30c-v4-0-cec034298535@analog.com?part=3D1

