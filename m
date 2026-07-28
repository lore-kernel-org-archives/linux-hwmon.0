Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477DE3E025C;
	Tue, 28 Jul 2026 07:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223480; cv=none; b=LBltX7a5UR3g61XjMWimJU320H4c6vRp/NZ/gExe1Klrtm/MlnanRTyml2K4B38DothglaaOQNACcvxG9lxfvSkb845OiOpbS3K1kRXAbiBUizH+QO7IUHf2WS/frDz8Flj2L4SOAHnp9iuvS2BuHgOr0/Kha4KDeiKtDRvqkVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223480; c=relaxed/simple;
	bh=3JrtV3KN/UgQ91pgkMuzvCTjKjiM2JKJnuhw3hCQRFA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=efOKtn4W0u8b0EBM7d9deGMClnuQB4//xYZTbMhR/OBTwR6vEsnkyZvVgmmq24K/FD4aZpdiQk7yq/gL+diResoZPss4G/JDA+xm9NEwKdNXpa0EX3+WHz3YE7UZUoBN3Vmvm+F8yRJPVXMGQjjdia8Yc2e5Wh1ztJKQuiz7U7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jtlyvNMQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jtlyvNMQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B48091F000E9;
	Tue, 28 Jul 2026 07:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785223477;
	bh=3JrtV3KN/UgQ91pgkMuzvCTjKjiM2JKJnuhw3hCQRFA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jtlyvNMQ54dTMyJUSaIR9ykMsMCGc2xdgRGKBYeU1SlHLSZlgNCh9iXcf9XThnv8g
	 JHGu+2m5Wq9IL9J2ScsDypF33flGbHIF+0+HBth0YXtjgEVjLwWXX7eWL2jM/DVPhn
	 rKk+cJvW/KyBaTeJNxByc8YNOuikAg5K8MGI7zrxdesw9lt30RZyAftmH6ivlCn2As
	 0emVIExmTHlTZnqrS7YidbHJQS3tofGYsDQtwGhzv7+8g8YDQ2Qh7GUIRkOoMdcSjb
	 veJNCgHgMpSQisffnOn/gL8JPNYnoAz2r30RywpJM8/QGI/SWxsGhMROL42AP0uHJN
	 ZUeITt1/1j0uA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 12/12] arm64: defconfig: Enable I3C and SPD5118 hwmon
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org, conor+dt@kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <20260728065955.809445-13-akhilrajeev@nvidia.com>
References: <20260728065955.809445-1-akhilrajeev@nvidia.com>
 <20260728065955.809445-13-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 07:24:36 +0000
Message-Id: <20260728072436.B48091F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Enable I3C subsystem (I3C), Synopsys DesignWare I3C master controller
> (DW_I3C_MASTER), and SPD5118 hwmon temperature sensor (SENSORS_SPD5118)
> as modules.
>=20
> The NVIDIA Vera CPU uses SOCAMM LPDDR5X memory module, which contains
> SPD5118 (JEDEC JESD300) compliant temperature sensor. This sensor is
> accessible over the I3C bus through the DesignWare I3C controller present
> on the SoC. Enabling these configs allows monitoring memory module
> temperatures on platforms such as Vera Rubin. Vera is an ACPI-based
> platform and does not use device tree.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728065955.8094=
45-1-akhilrajeev@nvidia.com?part=3D12

