Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C5646EC8B;
	Tue, 21 Jul 2026 19:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784661255; cv=none; b=VumXOEjn0s+0hVXSEAcoal0bzPUw7Jyty3Xb+DjRCKqxlADv3fU4EfokRNO3cW8Kk4TM4tpHrsbxUqZba+8hhFcAOH5P8s7OUa2DIa5J6ureoXi7H1I7rnmi2kAlbwivsaRfVoEs1+mtxWex8/xR+WcsjIP3onMyMUjhV8s/SOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784661255; c=relaxed/simple;
	bh=ZnHEHCpYrwteVnG0tn0q0FVGiYLM30vZpjwTIiUn7sA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TXepeG7VIcAL7AnIxLvsM4VWVCkyuoJjM5C3TbXLY7uMYAA7o2VGatEE5JIoKWBk1pMmA28Oprg0+IcyBrZrunvBn45UJ9HgQhp0Ag6yxxr+7NcdUHY83AWCE+X+NyEMl0PhOdYMUtlYmXS7VqVEP2oVbH1HAQghInnUqIOYioE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JTv3+3IY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JTv3+3IY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E67951F00A3D;
	Tue, 21 Jul 2026 19:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784661253;
	bh=ZnHEHCpYrwteVnG0tn0q0FVGiYLM30vZpjwTIiUn7sA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JTv3+3IYt1buttmvj0kQy510a8GgLHPy09BleCkx+cURdtiGDh82kzitKaO7A/RBx
	 ByvdruZqvMsFEZ9HJKxy77+pK/rM1cXyVgm5mivUFs1+uJTezZSC30pRYV2Viev4X+
	 xVyfXliqEb87zXByw+z0S5FOsZTfyp42A1aRdhCq4dwldQWywLORuTVG6kWCjSyTx1
	 qPdibjcxcWd6PSE1epCmAyIHgqwyKwOGrsyfbR2/ZmqNOXLXR/4MqwvynJi3q1tzX8
	 UKcS47e0ylmmT8VctVnT2lygEiiX6uHiGmNft38wKGemLUe48LLcLKGL8sDUuF3qkF
	 GTu8xI9TJlj4Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/10] arm64: dts: qcom: pm8550: Enable BCL sensor
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260722-qcom-bcl-hwmon-v2-7-febe2805e17b@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
 <20260722-qcom-bcl-hwmon-v2-7-febe2805e17b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 19:14:12 +0000
Message-Id: <20260721191412.E67951F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add Battery Current Limiting (BCL) hardware monitor node for pm8550
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
>=20
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qua=
lcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-qcom-bcl-h=
wmon-v2-0-febe2805e17b@oss.qualcomm.com?part=3D7

