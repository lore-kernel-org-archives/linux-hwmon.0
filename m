Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305A52135AD;
	Tue, 21 Jul 2026 18:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784659044; cv=none; b=pg4q/X0Z1gOeDJ54QygAFjD3G7QX5vFxb6k7huRrKj7U8ozB4R3/dVeEaW0Sxhx5uwOrNjgtuP3JzN4lvIXONTcHr3HPlTYjJFiCQsRm//XSIep0yBS7Ce6AYl9p+kBGl6fwbfjEaGABvy92477JiybjrnZUxzMdJdQV7/ek+A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784659044; c=relaxed/simple;
	bh=s/F3pSo4BLrLmONOQnxf9apNU8zPOjyixvKooq7/He0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=liONJHgFF2yN+2bwvnGVZsCDWDZskqfF7PEOdW++q9aTzqHZRQLs30grdk69kv8NR/AYSOunkCrEYmE7wO9a/93a3Aj8ajPsvofF8w1XkmyjJhcicEE986M1afAZfxuWIlnG1PAViW1D/qapaA8WQzkzDcqurm5bFn7lbo1L1mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z90IIhFh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z90IIhFh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15FC11F00A3D;
	Tue, 21 Jul 2026 18:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784659043;
	bh=s/F3pSo4BLrLmONOQnxf9apNU8zPOjyixvKooq7/He0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z90IIhFhtm77FrSnqwKaXcsg5SiEs+9RWu+ZbTxNNMCRLp0ypPGBa4athYlgC/mLZ
	 tkru6irLzZWZZsD2XVAd5o6kdP3nXoAmz223amlgHDH5tYiwteHw6vmGjauz/+ktKf
	 VNcpHBdPhYVIFVxVuim2noIzJ/vqKCDBfKTRkRhJr6pYNvsT28adyzkmG45C/T9sT8
	 V5b2b7EyXUMVVnWxRzDYH+WS4iJO6YYYiqumg1kut3AUIx1hvn65x6BVLi/RmZ5gbt
	 rKIeFv/tY8o7lfn8GPRUK3jXejDttLRLTHAQb6MMQ6VHyX7jOHpQi/nLvqcczI68Gx
	 hNnjFFik9wO8A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/10] arm64: dts: qcom: hamoa-pmic: Enable BCL
 sensor node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260722-qcom-bcl-hwmon-v2-4-febe2805e17b@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
 <20260722-qcom-bcl-hwmon-v2-4-febe2805e17b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 18:37:21 +0000
Message-Id: <20260721183722.15FC11F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add Battery Current Limiting (BCL) hardware monitor node for
> hamoa-pmic. The BCL monitors battery voltage and current, providing
> hardware interrupts when configurable thresholds are violated.
>=20
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qua=
lcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-qcom-bcl-h=
wmon-v2-0-febe2805e17b@oss.qualcomm.com?part=3D4

