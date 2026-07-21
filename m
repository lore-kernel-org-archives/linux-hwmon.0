Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8059546DFEF;
	Tue, 21 Jul 2026 19:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784661270; cv=none; b=gtNOOMHgMOxVe4T9xSMVlViRbpoN1mOu/O/9DkGns5ntU3RWL4vEv+balONMIz/umE1IwIbSzjZE0pbwOgLqkVHoUpIk72C2/m/euMbj/Sri/UB1QGwgZURdohQ6RvtARIj6xj9yVuEbS5ocpgdtY9PaEtvyYtpYC8d3tkQOIlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784661270; c=relaxed/simple;
	bh=BOA1pfnSfIf1+qI/nUC5O4hbZt8Jwe6hxP7GEQhnTYo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WC/FW93qvyBHfGbrkqbX70RGHM1qCaNeQGIldGe13aIjbrYfKTddvv387Q0g+WbJoMHjj12ciLRDlWqN5+OtE+lWMJxg3MTb4X2OVF1DSo1r8oj1gzbBNFotg76simhIU5QYZ3wuEaWxdVT6x/9d+T8AyNOLvftKYtMqtjG6ptE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KOqtiEiK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KOqtiEiK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA4291F00A3D;
	Tue, 21 Jul 2026 19:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784661269;
	bh=BOA1pfnSfIf1+qI/nUC5O4hbZt8Jwe6hxP7GEQhnTYo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KOqtiEiKYiUo+e6wTW8+tvAOWRT9S1eV06kTTIoby6uK74GWCENshkgvMjRnVFb+d
	 XdThS0X9FMeBeKfSq6QTcH950OixX8FO2zqXy1Dzm8FpLBmH3rbcVY9SRCHV5nrRKu
	 TVhdPauXPARfVy5Oq49R4RhO6qihFYqOqe4JaA1E+Fz1OoVnUz2xtmrO7EzLIS7BYI
	 rWtRQsWZwQyd6m/Ea310lqLLG0NvyR8MGy4cmLcdHJ/FsgkzyvwcWti2VTtfEO4hAJ
	 OIho+4W78P3ohtlzPqBjKZtZw/kioM5M6hxFOk688wFiml/xhrLmzXUOKx9k7Ct+w9
	 LWav7Gv2UGteA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/10] arm64: dts: qcom: pm8350c: Enable BCL sensor
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260722-qcom-bcl-hwmon-v2-5-febe2805e17b@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
 <20260722-qcom-bcl-hwmon-v2-5-febe2805e17b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 19:14:28 +0000
Message-Id: <20260721191428.CA4291F00A3D@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-qcom-bcl-h=
wmon-v2-0-febe2805e17b@oss.qualcomm.com?part=3D5

