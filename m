Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BE23876C7;
	Thu,  4 Jun 2026 08:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780560626; cv=none; b=Mzf1XMeSsbfRV0HM7xeGKFDU3lmYLdrNXqwJopO+sn1uVBdYkh3r56kRsui0XKdvHGqBQ2ogefDFA1ZTJm+v1waRRi2WM2A/FggykH9NCVZUK8senleoHO4zB1E4Vf7qoW1ufVqxVI3TWOI6Z8M0+NujCXu5TVfL0P1ORRtf5hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780560626; c=relaxed/simple;
	bh=EJrr8yiQmlcdEyukp0qCLFb+ItXDayFqyUQGSTpHzSM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Iv1MGl5vNy6O2XmpzKra2n2MmyQh7rRsHtSvNH89KAXmoqGkBO+ECykyij4JdCjr7+m4Yc27IGVN9NBq5byXczvAVm7VEvIAkcx6/j80mmci3ejC+DKOE99Ua/GZBt4Qyx4lPSiH8VD13BmCedXgCZHTT5PAxKF3Mv4CFjLMosU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bwKTpipN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bwKTpipN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0C341F00893;
	Thu,  4 Jun 2026 08:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780560625;
	bh=EJrr8yiQmlcdEyukp0qCLFb+ItXDayFqyUQGSTpHzSM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bwKTpipN97g+d2CLZOlA1zacyF0QlqJKw7wGObR6167HH3EpFlpRuSExVOEBd7LXS
	 A/kHkdUSazIhnpgebv/zUIAPuorBpk/7/3FLAKRQP3NSQiowMMBCI1r7pgUVaMd11s
	 OPYO1JMKrFR4n2Suh1TYfJqZ6EHpksTgLcoz2dz1BnCNvBILdCue+8sSz84Tv6jvwE
	 epeTuZkDJhc0nvCyuLGSnSOtQTGzF/+DhqYhc8CzyuG1ykYl6aAAJsyEPp2LFme5c6
	 YvGLohtFpvIcDtSTE6jA9J7Eroog/LIpjzIkDJ1eUdIdG6uqIOLFeK7Y/guV/Abo4h
	 ybLPHkc4duKwQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: hwmon: Add Eswin EIC7700 PVT sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: hehuan1@eswincomputing.com
Cc: robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260604080525.152-1-hehuan1@eswincomputing.com>
References: <20260604080525.152-1-hehuan1@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 08:10:24 +0000
Message-Id: <20260604081024.E0C341F00893@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604080430.126-=
1-hehuan1@eswincomputing.com?part=3D1

