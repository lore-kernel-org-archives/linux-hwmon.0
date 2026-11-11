Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484183;
	b=kz55Hp9aszLHoYcUGVnr+MBg2iFX9aQBzSaJRfobBJGPUOvNUIRVJU/usFTmOqUnlB8P
	 qVDWchA07hi3m6fdxJPj7NYk7e4yr3oSvW7YvzV5Lj6m2+4hDULHep6vLhZgQMsArxPNt
	 6xsjOC3hzPMNOKupJgjh/loReKO8DoZaKJOPat9/hh85zYzMduYPHMWm1d+fRnIvWRyXa
	 k60SOaCpndIqV5zMmuoawfQv7qpftHuTwF0KiO2PQEvEOmqqu/LxLC8LVRkNevk9peghL
	 E9RcWnT2J/QlrrxJliAgQLe+qxobsFcL8XepPjvBZP6CYJEmS4xCWBlnw79H0Ad3fQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484183;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=kH63A4Q8NhJGmF9dCXy668pUMjIxPVBUhCn9NoDFJ2o=;
	b=3yAVdRUn6crF/TPWsqYPNIeR4OM8B+Cl9TOnXDZ0Pe7/2BEnQxevavMPcGeGIpaYGub5
	 hrvv7AEGsMHCh2UC1oE0R9jTPoMDXjBVIDd4KluCdykUcFINReIzdFLaNiScJjMvTsccs
	 Kj0t9u0d6uLQVaKvImNuc5tPS6gAdmgH+NvbVhkvcgQ9Z8U//q5d4yoIyAnERqD+GM47R
	 s5z34Liu/AYtl8tgDA5WOC4qlLbV4zPiGScyk0gjouj7vdCJyJjaywwWD4V2i4QSHhpPt
	 ImymF0omiISF6MZylQP6TGpC7lzx4keFNys7CMQmPVKchwxp3kXzUTQgV+NK7TpBm+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NQ3K80Qo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D02F606A31C;
	Thu, 12 Nov 2026 11:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NQ3K80Qo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E76A1F00A0C;
	Thu, 12 Nov 2026 11:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794484182;
	bh=kH63A4Q8NhJGmF9dCXy668pUMjIxPVBUhCn9NoDFJ2o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NQ3K80Qo2q3BL07IZpeFRUivMoPaMOVcJYxjzGx0tcJcgm4EeEH9gcDfaqOxphkNG
	 4+MxAWdn6B9irz24jPAXNdMZgvvfY9Mri6qErqmu3AGnL7j0gh0X/HkWISiJ77x/NM
	 wcdmBa/hLp3GhTX76C1yEdSp4g2h3EBgYXqBfaElrfMw0iZAAW3E4dGW0KXI772XJE
	 7QIGZfetbzPSgYuMCtQOp+9MDnU+GWsMwJ0I8ybv8J5YBXFpy+E1Rq638+Mbf4pleY
	 e5c2eixsB8gfI7s3Prz/9CAG4EPzNONXb9s7DHQGbPIv6muRUVHMWCIVnE55pwwora
	 OyznJ7ojj6RUg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Guenter Roeck <linux@roeck-us.net>, 
 Lee Jones <lee@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Pablo Mazzini <pmazzini@gmail.com>
Cc: Alistair Francis <alistair@alistair23.me>, 
 Andreas Kemnade <andreas@kemnade.info>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, linux-hwmon@vger.kernel.org, 
 mfd@lists.linux.dev, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261108093602.329554-1-pmazzini@gmail.com>
References: <20261108093602.329554-1-pmazzini@gmail.com>
Subject: Re: (subset) [PATCH v3 0/5] sy7636a: power the panel only during
 updates
Message-Id: <179441948592.393238.163548015139580869.b4-ty@b4>
Date: Wed, 11 Nov 2026 17:51:25 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1560; i=broonie@kernel.org;
 h=from:subject:message-id; bh=tAX4JPP5kVuvXSOIYyzrfdqHyXORq/eq+6a96LBatXo=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLK+Lr/kpG5TctlIuGON9dnug+cdZdn2r5yv8u8uD+u/P
 UIVCpJ1HaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZhI1xOGf7oO+4suV7VltqyV
 WM/wbt7dvlchVRr7TXWOrDzf4PaGT56R4WiCdLdg4W51W4b/Ejt/xk/af+lqgsDUPVtnzNuZXNL
 LwwUA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 08 Nov 2026 09:35:57 +0000, Pablo Mazzini wrote:
> sy7636a: power the panel only during updates
> 
> The SY7636A hwmon driver keeps VCOM on from probe, so a display driver
> can not power the panel only during updates.
> 
> Read the temperature only while the rails are on instead, and bind the
> regulator to the I2C device directly, with the hwmon driver as its
> auxiliary driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.5

Thanks!

[1/5] regulator: sy7636a: don't wait for power good if already on
      https://git.kernel.org/broonie/regulator/c/7d9a62b7e554
[3/5] regulator: sy7636a: bind to the I2C device directly
      https://git.kernel.org/broonie/regulator/c/5f828ac25ef9

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

