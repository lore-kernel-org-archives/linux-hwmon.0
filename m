Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E2A43C06F;
	Tue, 30 Jun 2026 14:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831559; cv=none; b=hM/jvhXvfRB97oJMSduaKK3jCEe+hQc/W1+Hu8VTm3rMr+SeUIG0p2UvkRDzwaXteLeoSm898gHQhZ1rmfNdOK4pxZ+cNmvqte6EjRlKZSBNSqjVxeTA13oy3sWr7ThvOrTKao0u7q0FYbEJnwv1BjtNBWfUXXY8rHfRlRyDiUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831559; c=relaxed/simple;
	bh=C5edbb/3pw/BRiZLovFsP6kqx0LqRjezqB3g42MdQPE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KT8hwE1hqUMkVKtTRfuzLqk325si+ezTyK1WHIqPj46h+3B6M0uL8/xx1lVrZx/DGVuf1nrXvpEzxQfY0Cy+USoxt1U66+3Br5os54r8lnQ9NBIOuS0ZnMSfzkZ+lHCI9BLp74Psd3Tc9eWi8BPZ9U3LNEC3TUHnBENuiLlNtdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NxyVTTIk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NxyVTTIk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99A611F000E9;
	Tue, 30 Jun 2026 14:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782831558;
	bh=C5edbb/3pw/BRiZLovFsP6kqx0LqRjezqB3g42MdQPE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NxyVTTIkJQW/sdYLjXQ/vrja3e8udc970cNP7hZQ2uB7Tu4ZtcT8DCQDSmbNha7Yg
	 nObEtYsz2zOvjOJoezMrsw4eXhSYtjNC4UqB4ZujgowUKoQSMgcCSZprpzK048y12y
	 Q05QUU6BpLx85ioLrpou/0BJ2NMPHDXciyFd9G1vmVR6cqF/PGe4zC/eXZtwpl2YNp
	 XUUx3YEpTQKjprOeFQWTPdMB+WXvnBPa4L444vqmzFQN1c8Go/+vq/Z2GqHx6eQXsX
	 ZfiWDn8UuathpxYWx5PTzDnADKNJ85H+MoEdke4jqO0glhtlPNxOBO9j4uWGts66LQ
	 TnqTknSFB0WXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: x1e78100-t14s: Add thermal
 zones for keyboard skin and charging sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260630145307.10745-4-daniel.lezcano@oss.qualcomm.com>
References: <20260630145307.10745-1-daniel.lezcano@oss.qualcomm.com>
 <20260630145307.10745-4-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 14:59:18 +0000
Message-Id: <20260630145918.99A611F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The Lenovo ThinkPad T14s embedded controller exposes several platform
> temperature sensors that are already used by the firmware for thermal
> management.
>=20
> Expose the EC as a thermal sensor provider and describe the keyboard
> skin and charging circuitry sensors as thermal zones in the device
> tree.
>=20
> The keyboard thermal zone defines passive and hot trip points, while
> the charging thermal zone also associates a cooling map with the CPU
> clusters, allowing the generic thermal framework to apply CPU
> throttling when the charging circuitry temperature exceeds the passive
> threshold.
>=20
> This integrates the EC temperature sensors with the Linux thermal
> [ ... ]
>=20
> Without this change the platform reaches a critical thermal condition
> and resets under heavy load.
>=20
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630145307.1074=
5-1-daniel.lezcano@oss.qualcomm.com?part=3D3

