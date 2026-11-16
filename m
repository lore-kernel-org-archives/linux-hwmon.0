Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873381;
	b=kQpUnOYvhEbXq0WaQZhAequ0bsuRAv0ELgGA2l5m+qwSCb4LKesbmsbOIZL7EsYCIhA/
	 iVfzJ2/uWyEBTV8DJvJA4Wf3Rh6vufDPBr9/9TUiQURF9UZoBGKLf31h6E87gUgW0ObC0
	 DWLxP1ok43qJAaRvmmdjoaSv/ZzL1/fPkT+x+sgZfjh+Uy6/3zJvbpJGYDd0/u8wjDGue
	 OpXTsxYo+7ERg7RG1XXu6gfrEelCaPL+Vmmx2jF2nNjS8Hri+0N4A9bSCBpqh1ngHVLJj
	 0Is+InVuzzQhVBgwDpuanJk1g2aTiBy0bpYjaZtCPc3R2SWxfk7K6G8alUtN5W9atvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873381;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/Jvj7fr0cFatHAXeq3ec2EWzn2i9W6gzq6/eqlnlhzU=;
	b=3gJD5LvLSOsnfO4lnVYnuw0xazBhXIH6vGwLPaZ3LpO8589hwDZM+54faWnrZVXrNg9V
	 sjIgr0Z0eJr+gIqCDpeve73XRS/vlb9afmCh0EuxYDg/K12479nrPbzc0GC51aqhQEr4H
	 aXF+BH+Qs9lmjjZoIcrtUHF41PH9V7ngkLVJ9n372Nwu6VW0TEellvpwH8BdXdL6+7iAn
	 MyuLNC6R+koZ7MkHbklFt2VO76/n1Hg1m6LRJ89C816Axrk9p0uxAEDxrPkoN+weHGwC9
	 NcQIjYe8xj+PUPhyPbJkyROyaaNjrJcKrr1MQRt0umokhM4XUH3VOlXJmtNardfYvEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D0aPvT1E;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774B3606A31C;
	Mon, 16 Nov 2026 23:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D0aPvT1E
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFE441F000C7;
	Mon, 16 Nov 2026 23:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794873381;
	bh=/Jvj7fr0cFatHAXeq3ec2EWzn2i9W6gzq6/eqlnlhzU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D0aPvT1Eq4adfbpjFvjg+ElOlVWV/Ps7kB21E4i4eHe8OlACLBDJFFzodrdOnKvoY
	 fod1rYuOCEixY8zkEuVYTITWY2AULijydukzG7TwDgl+RCIkmfI2lzAfRJtOftM2SS
	 gA25mtseV61MYNQowhF4SloytU3GXmuNscHJKho58mrquMDST3+gaXWviGaucMwduG
	 4dTNFiundzJZ/jnKdS7ENaEtQBd5XXv8R1HrG8tf0N7nFRi9oiVGK+NA2o+uH3uxKA
	 KG7ze1cploQbZbPpW67IH9GSduvwouVcJ7VqGuiWpKV4ausCZv7l21hRZ3sx5SDvFF
	 +W5SlCttT+zpA==
Message-ID: <sashiko-outbox-217947@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/6] clk: bcm: Add BCMBCA PMB clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, linux-hwmon@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261117-xg6846b-bcmbca-xrdp-reset-v5-5-f584e8b8e696@kernel.org>
References: <20261117-xg6846b-bcmbca-xrdp-reset-v5-0-f584e8b8e696@kernel.org>
 <20261117-xg6846b-bcmbca-xrdp-reset-v5-5-f584e8b8e696@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 23:56:20 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Add a BCM6846 clock provider for the Power Management Bus (PMB) MFD
> cell. Expose six outputs from each of the RDP and BIU PLLs, the Runner
> clock divided from RDP PLL channel 1, the crystal output, PVTMON and
> block-zone clock gates.
>=20
> PVTMON and zone clocks provide gate control only.
>=20
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-xg6846b-bc=
mbca-xrdp-reset-v5-0-f584e8b8e696@kernel.org?part=3D5

