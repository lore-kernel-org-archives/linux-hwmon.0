Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4048E3603EB
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 19:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778959326; cv=none; b=AKcwiJlKEG5UJ/pV3gaxx8APRG7GUC4rqA4cFT1IhKtBWG+GliL+1Uvp3oKMk45HTzdUH+/geODQGlAq4C9EFHaGFGkuOvG9vBNcz0SUro+8z07DhBMCK4v0x5n1mQhWZgQnSPWCElz5sBQxTnr32weaN6h5N+vSoZ4zUZGxnsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778959326; c=relaxed/simple;
	bh=gqPqBn52s1E31sJdk8uwpM4SLAWvKo64siXI3XhcCvM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YNhvkSUlxSMlrSQM0z0bdz59j0fTR8zsXBkEhQOHh6U64ke4y/hL0qVKqztxBuPY/Kex7TxY16YY81qZBhzhJ8H7IlurFHplv978K3WXGXARgNGQrkN80ryIJKgKEUKRPST8p664UHSFz3ousQKfhxy7s/1z81Zn6YiMdDj9g8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VMa3PgN+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VMa3PgN+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE79BC19425;
	Sat, 16 May 2026 19:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778959325;
	bh=gqPqBn52s1E31sJdk8uwpM4SLAWvKo64siXI3XhcCvM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=VMa3PgN+3AoP1CgjKKOosrczk/IAXhYJvDWH15YAR8pD2Bfw3iK4i/JhB2e1/GmSy
	 GlfJB0mqKWM5mLcF/ScGM42ixGhOi8yIB1q943M0l94wk9k2szzBHqG0Y317+UBO70
	 4bD/sMCEejL3TqfVdtXwr8VAU42RoTe46zF2reLmwrb1nMQpHIMmXPfMuAQcfcOTbQ
	 k+I2HbTGJbkJpyu/mXU/yR1hwdp/vRTSXXBTJJojV+XGaqAtwhDoCAqt1TgoW+dHSu
	 gmo8lX5+bKfzv7HjimmePccZLk3ZXFJ3CuTy0iyUaHr3kblFUJpN9xfX42uyUNUdW8
	 5InWHfHnQEcjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] soc: bcm2835: raspberrypi-firmware: Add voltage
 domain IDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shubham Chakraborty" <chakrabortyshubham66@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260516191555.17978-2-chakrabortyshubham66@gmail.com>
References: <20260516191555.17978-2-chakrabortyshubham66@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 May 2026 19:22:05 +0000
Message-Id: <20260516192205.BE79BC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The voltage domain IDs for SDRAM_I and SDRAM_P are swapped, violat=
ing the Raspberry Pi firmware mailbox property interface.
--

commit 55efe0976ecb0653da890b61d597ee771424aed8
Author: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

soc: bcm2835: raspberrypi-firmware: Add voltage domain IDs

This commit adds firmware voltage domain identifiers for the Raspberry Pi
mailbox property interface. Firmware clients use these IDs to query voltage
rails via the RPI_FIRMWARE_GET_VOLTAGE property.

> diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm=
2835/raspberrypi-firmware.h
> index e1f87fbfe5542..fd2e051ce05b7 100644
> --- a/include/soc/bcm2835/raspberrypi-firmware.h
> +++ b/include/soc/bcm2835/raspberrypi-firmware.h

[ ... ]

> +enum rpi_firmware_volt_id {
> +	RPI_FIRMWARE_VOLT_ID_RESERVED =3D 0,
> +	RPI_FIRMWARE_VOLT_ID_CORE =3D 1,
> +	RPI_FIRMWARE_VOLT_ID_SDRAM_C =3D 2,
> +	RPI_FIRMWARE_VOLT_ID_SDRAM_I =3D 3,
> +	RPI_FIRMWARE_VOLT_ID_SDRAM_P =3D 4,

Are the IDs for SDRAM_I and SDRAM_P swapped here?

According to the official Raspberry Pi mailbox property interface, the
voltage domain IDs are defined as SDRAM_P (PHY) =3D 3 and SDRAM_I (I/O) =3D=
 4.

If these values are inverted, could it cause firmware clients that query or
modify these domains to access the wrong voltage rails? This might lead
to incorrect voltage reporting or hardware instability if used by scaling
drivers.

> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516191555.1797=
8-1-chakrabortyshubham66@gmail.com?part=3D1
