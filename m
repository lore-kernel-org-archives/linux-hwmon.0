Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11659471D1C;
	Mon,  5 Oct 2026 12:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791204291; cv=none; b=hvZqAHQBy5rcJNARYf/7McQzKaHPlf1HR9KQVYHuSFDzsFzNyCtG9r19XeFwl6nHteflK9DAB2H3+CHkdn1mEDidwvQazEWWYQ0jgGGLGl/9z5IuCW9CL6AWu5pldBau13Ryt4NBr8UApyA2kLOz1ZxfeSOR3A9FBYxg9ev687Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791204291; c=relaxed/simple;
	bh=n/H9d854rnqD/1rApjn4YlgADg7K0p2t/FnikJKzNYg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Qf8IKupgrkSEyKxSwiHR3NLSI40Joznh2UK4puJQ//aykoMivUFZhqxVG0M4yd1D8hzoKaxFEgm9Wg2XZOEGRAhOJA0njmXg++lhFHn45b9/U+h8LBR6XvGBFxQdgfyo1CSlhHyM45NlptKZGscBY/kc+WESjC2aEdr7p0Sm3gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DjgH0kl1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DjgH0kl1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 475A71F000FF;
	Mon,  5 Oct 2026 12:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791204289;
	bh=n/H9d854rnqD/1rApjn4YlgADg7K0p2t/FnikJKzNYg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DjgH0kl1IVpAM2805YZsJCQywhnxMRmdTWZ4C+8oDumJML0g+68Jk/mTah6GtQb1m
	 5r4I+2MBGjYTfu+WIzhXwffO5WPMh+2fB9SpsPNMf5DI5CbQ83VLK35BjK0l67x91g
	 /s80lWT3g+MnibJlWY/e2CKzHQIlXzr5OTxwhqOTk2Pzo7aft9+2HBRjKDAUVhQv1H
	 WYz/nz1DseGKUGR6VDSiYZvYBfvWCX5/T/12tiw2yGeEHAHTZURjTUOesr7aliHz4g
	 nvZJ4WcxKjNpuxW0tfQlnf8RjeIVDSJj084OHaNUqB9gD3XQcixSnePJ+yzmZEwL+8
	 Yszb7F98D9Ppw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 11/12] arm64: dts: qcom: pmih0108: Enable BCL sensor
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org, robh@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-11-50b9a8c730b7@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-11-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 12:44:48 +0000
Message-Id: <20261005124449.475A71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
>=20
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qua=
lcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-qcom-bcl-h=
wmon-v4-0-50b9a8c730b7@oss.qualcomm.com?part=3D11

