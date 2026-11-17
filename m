Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900062;
	b=fPxTD8ei+4dF/d+yCVbW/MorzAI9ZX3COUbk87UiYlNMcmsZkJ0fkjURtSx+W6FVEDI1
	 uBbwmXJm3tE5f+IKh2d50KuQirok69h8Yv63IelaRv9Vyne52lOQhdInB6TWZO8e3KaHu
	 xp0l8jZ1E6dt1ThqLSMAlHENirakzikvmrAAGMV3+k1hx6Elp8KxQCU1GFJO+BJtAaQEe
	 UujDxNKHxkl2oHRgFXTKt3zdz1EE8XJefQvQU5aCTMerv1KN9EKfw+KlYCW8Kw/MYSSCD
	 uaN7N/08wq3I4WdahgEmD+UVMLfzYubuDW5K5nHojZt6e0voO2689UWAq688dWWLLrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900062;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Ln+ylMmMN/uulcqWypmFnla6DS0fLMxQNBLZhxsLWcM=;
	b=Kioy3nXPpt8dpIw+ex4fPhXCygpzNzxUycHZKFs3+ynnl3RB/QW2f6P0Grld51z5T0HR
	 b0pVhx0YL62epTa+GWJulI4+ZiKS6+ewMTO5FBp6ouQTY0+hvHgHJwgBWB+S1CiDgOY3Z
	 SmcZVCbMt/vUByFQkTyftxnxi++WScCbO9UnuwJxtQ1DeCsmq3gYqt5LYYOSuKYx4KEQw
	 NQCAbX4aAkcVyiPS2AlthCSCFDKOKY2H80/vQ2YFjggo7wtAMzKHDSr68ErbPS0PcsSja
	 kAx8Y45y+BQqXjmfr+vzJEeGh7L+uO96FXfAhir9xjjjHXK1h2U3HnE3ETln/YIXcew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z823auEv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D120606A323
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 07:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z823auEv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 115401F000C4;
	Tue, 17 Nov 2026 07:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794900062;
	bh=Ln+ylMmMN/uulcqWypmFnla6DS0fLMxQNBLZhxsLWcM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z823auEvKVdyila6Z0Gwhr3iJNcjqdI7daEmSDITnd3FquMVROIqDD15P2w+tc0ak
	 G5DFEAgUk8Kp1YWfuYDChtUYcURii8dj3qp86pcSqjtrNcs4bxGce2QUQRIbUN/mg1
	 go2EIu6VxqN0ILVsr8TNDRgNt31r/un5Xz/QEr+Q0k7tvP1eRq70nAj6ym3B00Xd07
	 6AtI1bqzl7tkOqjZSFmI3R6bIDYgy9aeqhi2MYN+dgObzrsBBI5ssA2C/xfziRrUn5
	 hUuORgmvIXrPiIPFwZxXJeo7ENdXMr0bamYefX2pSgl/FHn8aPf3r3mGNa0Toxk7IC
	 r0yIkwZaH5DQQ==
Message-ID: <sashiko-outbox-218315@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (nct6683) Make pwmN_auto_channels_temp of
 NCT6687D-R writable
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomasz Bojanowski" <tomasz@bojanowski.me>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261117071645.587863-1-tomasz@bojanowski.me>
References: <20261117071645.587863-1-tomasz@bojanowski.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 07:21:01 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Allow selecting the temperature used by a fan curve on MSI boards with
> an NCT6687D-R (customer ID 0x20d), in manual and in automatic mode.
>=20
> On an MSI MAG B850M MORTAR WIFI, the BIOS setup offers four temperature
> sources for the fans: CPU Core, System, MOS and Chipset A. Reading the EC
> before and after selecting them shows that each sets a single bit in the
> lowest byte of the fan's source register, the bit of the monitoring
> channel of temp1, temp2, temp3 and temp4 respectively, and that nothing
> else in the fan curve registers changes. The other bytes were never seen
> in use, and how the EC would combine several bits is not known, so only
> a single temperature reported by the driver on the first eight monitoring
> channels can be selected; other values return -EINVAL. The range can be
> extended if a board needs it.
>=20
> The attribute is writable if, when the driver is loaded, the curve uses
> [ ... ]
> manual mode was still restored. With the driver unloaded during suspend,
> the BIOS restored its own curve but the EC kept the selected source, so
> restoring the source on resume could not be tested on this board.
>=20
> Signed-off-by: Tomasz Bojanowski <tomasz@bojanowski.me>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117071645.5878=
63-1-tomasz@bojanowski.me?part=3D1

