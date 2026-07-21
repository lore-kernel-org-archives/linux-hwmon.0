Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC683EEAC7;
	Tue, 21 Jul 2026 19:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784661449; cv=none; b=UdYRcXtH/7X51dXbG8cWlnoHdlnklYVqpH61MwpL9Xtq5FNjZWf2/j/1tu/EIwdJxlcF407RF4ysC/lf28hsyXxUAZ66haYAtpnNmte5VZ/TtIPPmDy7f+cG8MgzsHHfYgOiEPj8/6PYHpUajUt4Z3yrpEh1IGph4zbVawTMjGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784661449; c=relaxed/simple;
	bh=58MgnNTj0uU6VKgFLJhyM+uc+sqqesOBiLndBnqN6ok=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r713Ytm2vjVigLqEC22picz8Gg0d6kBuwWXjeE4s0mHeMr6//ZvtGMz0BuIZJzT6RvKzXBGYrQwrOQksZuPl+xH3ZgmVrpj69nVEzRxll+mEY4Ls4TC9Coc8SCThacZw514nFGy/EoIFPPdmy6bOppIrmUCB0dyDWAs9Hukkr/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iF/0935C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iF/0935C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E57F81F00A3A;
	Tue, 21 Jul 2026 19:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784661448;
	bh=58MgnNTj0uU6VKgFLJhyM+uc+sqqesOBiLndBnqN6ok=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iF/0935CNME7Uv9HdaX/yJkiyPRXyhcl/Q11vUzM/1frLOvUNIxwn/Lptapz00FWc
	 yIbqmj9rNt2f7dOjx8ULr5UW4j0vIFH2W1RhtinD/5euNcp1UQUx6eCssYSeCEYR2w
	 KVWSKnLJEhgSC0HZlmWLo8ZChF0DZcsTSej1h/uSGebMZ3hTOMENhj6tEACJ3NOufY
	 OjmlLorHrQUJpSc6chhDyu4O+V7dnHoOucbl+iDcdjbUFQ8OiH1zrjR3enMjTSXfxV
	 udG3NRJeqcOP5+4gHFGlihU1uNtJYk8Kc+St7rfpUj59lk2S3ixjCwQ8aPkNBcapAQ
	 vfTZPYY81NNTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/10] arm64: dts: qcom: pmh0101: Enable BCL sensor
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260722-qcom-bcl-hwmon-v2-6-febe2805e17b@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
 <20260722-qcom-bcl-hwmon-v2-6-febe2805e17b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 19:17:27 +0000
Message-Id: <20260721191727.E57F81F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add Battery Current Limiting (BCL) hardware monitor node for pmh0101
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
>=20
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qua=
lcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-qcom-bcl-h=
wmon-v2-0-febe2805e17b@oss.qualcomm.com?part=3D6

