Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0B4480DEB;
	Mon,  5 Oct 2026 12:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791204269; cv=none; b=u08/MnguJx4t82GaTcKabyJY0pmwYdEOt+IPaFWZX+uI3UI6AQD9yoxJtDYfCJVYFqQP6PXBF5ybE5GKo67MLpHbTvGrqLWW1tBap3WAg/0LoeV+2ChEZkV7q1Mhz93qKYjzoLZKrmb1UU0G83VeVDytkkX7CyWt03kM6JbTnnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791204269; c=relaxed/simple;
	bh=CjyhT6uAT/zfhYv2M72tNWfa4qHOBMfA52ySEjvinAc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=n0ZJ9A//AUUzvhHSg8fRpfCA4S3stuCpzXEGzAWS8rjz5gBCZ3xrYaa8fc5BLPN01015AQ5bU2jdB/Y1Ad/bx66CF8mF9sFpGl17khCcUQhsft/ZjO/OH+c/hEKB/A2SRDfx22T7bT6P4qDgGsDkTYNbEd5NnQSjlK+2A7q4Fw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F8jgaMFM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F8jgaMFM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A49371F000FF;
	Mon,  5 Oct 2026 12:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791204268;
	bh=CjyhT6uAT/zfhYv2M72tNWfa4qHOBMfA52ySEjvinAc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F8jgaMFMkHJqt1uW/TiXe54aATGybS/N2SeMz+ef3X/eURAMJhrvjL8zJ4mgmSE38
	 fi9ZjHrkiQ7cUPZZ+CirK4m2VqHoUVq//jIctVyqR6+lUCrfp44mQfmGskF1k3hGB+
	 tGdRxqJoh+YsmvPFQtgKbAv05bZGrn0i24ZX4UZdk81iuiPB1GSDfiyNSPdByft5Fs
	 K6vhSiy6G0n1mtoiBvwwdn/K+2fcs0YWFIxSSThC8QFDbtOpa8ksrjCtwDyw9oyaQb
	 q2FnMeRtIprBtk6U9zblZOPmO1LCRs5GHGOXPYk+LZP2BSlU73c4e3vIy1idO1Hqxm
	 uaiWteXpZHA6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 08/12] arm64: dts: qcom: pm8550: Enable BCL sensor
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: conor+dt@kernel.org, mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-8-50b9a8c730b7@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-8-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 12:44:27 +0000
Message-Id: <20261005124427.A49371F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add Battery Current Limiting (BCL) hardware monitor node for pm8550
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
>=20
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qua=
lcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-qcom-bcl-h=
wmon-v4-0-50b9a8c730b7@oss.qualcomm.com?part=3D8

