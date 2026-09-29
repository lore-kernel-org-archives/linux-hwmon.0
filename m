Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539822F7EE9;
	Tue, 29 Sep 2026 13:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688176; cv=none; b=P8fkFGjg7KkgPQVyLXByDbu/yjhc3ejeijtbToPnkSjsU+BuIVJnb1Mlz6viMENOrurDorL4MG/3tXCNxOuvlMzmHIbncfgvM5W8lcy049lFgyTST+ISxJ3NK0I1Xgx35TnivkjNNqLgmuyzwMXfhxU4bXxJlNK3XtPFYnf0nOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688176; c=relaxed/simple;
	bh=jr5mgi+ILXe+DKS2sJV/n16Jl/mOPwZY/G2xf5lUpAs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KuLUZGm4lX8msrNVjD1A3glaUg2RM867gOrky7Le6iaxiqtqEb0U43DkCtHKa3YO6trbF8d7zK4szYSjtW/nYM1L2HxoT44xq41n9TdTmdRsZA2B1iW7Cp0hWefoGuqp+fYUQ2H9Vuoe+9BTPV4yXrCnj3mKkFblPH4HYRVkdF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P/k8ko6/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P/k8ko6/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F8F1F000FF;
	Tue, 29 Sep 2026 13:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790688175;
	bh=jr5mgi+ILXe+DKS2sJV/n16Jl/mOPwZY/G2xf5lUpAs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P/k8ko6/anwMzY8HKVquLnCOot+PfqrZBiCZPNa4azX2zM0+p3ekiw//2V/1Qaj3w
	 hUBVNCRmEWpLo6rtgZBvPSgHOT/zoxBDoSYXNGXpiJlWIAAAMefv2PzEUHmeHrn8HI
	 ifW2y8mgaEt+AZOYnX1tbE29RT9BQvudoFU/5/BISJeruIQd7h1iIgR/Mkt/5EmA7R
	 PpUBMr9PUgeQ1UHlLvamvH5dpGCDOklQah775MzFmRbEuaP6wRGHKyiS3vOc+hij+8
	 ijXdEBhG1z0Z75FrACHKeabZXjYBdlIto27B77OIhuNfpD7WfeZcjXUE46lHcSp5uI
	 8yNXxBI7PmlvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 07/12] arm64: dts: qcom: pm8350c: Enable BCL sensor
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, lee@kernel.org
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-7-f5ca00889cf7@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-7-f5ca00889cf7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 13:22:53 +0000
Message-Id: <20260929132254.99F8F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add Battery Current Limiting (BCL) hardware monitor node for pm8350c
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
>=20
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qua=
lcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929-qcom-bcl-h=
wmon-v3-0-f5ca00889cf7@oss.qualcomm.com?part=3D7

