Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6450919DF62;
	Fri, 29 May 2026 00:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780015809; cv=none; b=ekd2AvI/8Nn788COf3IKMEznePknqMj0rLs5QpI2VO8nnoNbNtKo/OhaMmz850PR6AOJmEHU30eE2TPK+59/iucKPQKXb8v2pWRwJPtjEJPLfiyWWFXL3pKaozWGkl6x1/1pHuv3/QFzR01QQAshGy0TxyMbfb5wD1GUxkoOg7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780015809; c=relaxed/simple;
	bh=tWGoIh7nGvFw1IPIkpAOjC7JqI8OoSHP0arTGd81M8g=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I+yYLzY0a4MRg66sY43IdH/ycpp/UAiot32/lzBnf9EEMUKPZJ7pR4hKjiXlBmlwGGwVHP2hwytRM9pNsrJ0e8VLPePr//+PBXqDUYEaClx2Xcaxq8Po8HQINh1NvgxYSIpi0TMglsB+Nva2N86Jgb4IaFPfW7lkNDj//ze4oqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HRahPaWe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HRahPaWe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCA3C1F00A3A;
	Fri, 29 May 2026 00:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780015808;
	bh=tWGoIh7nGvFw1IPIkpAOjC7JqI8OoSHP0arTGd81M8g=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=HRahPaWeSnwKyEtBI99MjXolhAxID5S3vWbXDijXbhZev5oiDD3Mqx5ytBm+M9hkk
	 YsC5GNC/CMQaFBISlPfWFobqZ8wWZ8lnMEAHKoMVF8oZqT8ghbs45h3muqiUkZnjTo
	 JhZo7CxMAAeNSnjJKp1gu4iagrWeSFj/dX2+T7TTutuzirU3ZaBFcnRE2EKZq/Bhg2
	 wGa3ZZ1BZGiJihxq9WiXs7du303a5idBvkW1mjZdbA2GLbY5pl01/Wd7PrmcXqReHB
	 gcvafUfguhW0vRK+GQggckbfaANMpxdHmMkxvZHPd1GD+UhkrA3YK1eQdgZ9K+gjgU
	 HXRIb+sBelL2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus/max20860a) Add driver for Analog
 Devices MAX20860A
Reply-To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260529001903.625737-3-sanman.pradhan@hpe.com>
References: <20260529001903.625737-3-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 00:50:07 +0000
Message-Id: <20260529005007.BCA3C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Syed Arif <arif.syed@hpe.com>
>=20
> Add a PMBus driver for the Analog Devices MAX20860A step-down DC-DC
> switching regulator. The MAX20860A provides monitoring of input/output
> voltage, output current, and temperature via the PMBus interface using
> linear data format.
>=20
> Signed-off-by: Syed Arif <arif.syed@hpe.com>
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529001903.6257=
37-1-sanman.pradhan@hpe.com?part=3D2

