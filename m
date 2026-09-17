Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E174A92CB;
	Thu, 17 Sep 2026 11:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789642811; cv=none; b=lS5GDRrlj/LRM5SP6e7+jIFKfVfUy3QISEywtcIrpkSX0daOFMrdhdsKKLbbul9i1IRh8F1VIgF/e8hjyIrhkK2zZD5cT/BqY9KHdEAo1Y7gB7vfcYJreBXfHbrQ255bzb0lYI2xfv6NXQULA3tSEvLrXePBzxKwLEcfvOL8hRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789642811; c=relaxed/simple;
	bh=4TME8gvN+e7gw9FU1deuVg8dIU7RfW5Tj66jI3a+puM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uODMuwEW2tLhSRdqxikc1j7bhTlyjgzvvUItNCW6gncl5VgXmmv2/Nm86d7ZqijjYFQjpTRjYyZribuOGZKQLzxtlfz3tn2V55L+Jue+wB9j1qFQ5XhbSIiiwW7GHmOLybyi0aPgakBSRWyBJAog6X7t9Ak5CtW2GYcJhTBbnRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xr0RvziO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xr0RvziO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F3121F000FF;
	Thu, 17 Sep 2026 10:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789642798;
	bh=4TME8gvN+e7gw9FU1deuVg8dIU7RfW5Tj66jI3a+puM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xr0RvziO/WQ5/GXph5FPozpFl8vw86aIQ9XhvtGExxJ0rfqk6SA/xdU0aXwMStHyD
	 Xq6FK9KtfkF8f8f3e7gsnv/XyH053zPaIQyKWIodGwoOFbG4DPs1v0yTvlfEDTJtCM
	 qyqBs35V1GAznavXqX4tAsSdRA2s3mgQQa424TlueptdDiHHIxXUXmsXCsIFMYJhr9
	 Apzi1S/wtnsR4NoIABL9gXm/LRl4z0TwhGIeaEQJ2a1OGx3KbLdOLzibulUsjTWKMQ
	 dMzho/vFK5B5mYFHMxfH5YffbxmvKfZINEpr8kyGyEOqiTKUz298LxoYPsAagNUnpq
	 RrPNmB7YB0fbA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: glymur-zenbook-a16: Add Embedded
 Controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260917-topic-asus_ec-v1-3-373516d347ae@oss.qualcomm.com>
References: <20260917-topic-asus_ec-v1-0-373516d347ae@oss.qualcomm.com>
 <20260917-topic-asus_ec-v1-3-373516d347ae@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 10:59:57 +0000
Message-Id: <20260917105958.5F3121F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>=20
> The Glymur-based Zenbook A16 features an Embedded Controller running
> custom ASUS firmware (which is loosely based on the reference Qualcomm
> Hamoa EC one with a lot of modifications). It provides keyboard
> backlight control, additional temperature sensor readouts, fan speed
> monitoring and a number of miscellaneous functions.
>=20
> Describe it.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-topic-asus=
_ec-v1-0-373516d347ae@oss.qualcomm.com?part=3D3

