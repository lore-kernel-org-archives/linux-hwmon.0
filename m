Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794185999;
	b=0rab36PbyuQYGwvnSwqy4uKWgccPU/xjmDe8RSSgcNj/G2P2WFuEVwP7W/2LReYqcUbH
	 Nd5JpTWP+CPl5zMXy649Qn66TfWqJJHPYRha5Sw+b5iLY2Edb+VnD5TASnZrfUXepbx8Z
	 XgkNnrlbLmbEkfuRDwTSZK2412yXZ0pfnamiFC2N9xHFGvExvvW45Xo5OycPA6+TLUxtm
	 siCunBwd4cxYsaUW7Rz3sx20NaD5H5mFSMFTvvBW4AXZs2O4yoNnHWTIXs6oODU19WbtD
	 WwRMgln4/aep99FTH8fvNVC+leWjvl+/87S1t39S9OmEGG3ySt47hJ9MTFw2PujYOyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794185999;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UQE22G0ZqqQdSqI0nn+B52/xHkSlMuUJncBzY46mLeI=;
	b=QhSs9jiu5zuVTMnsvKMacuziIvemJ1np4tD5G6zAhI6ygkN/1w7qhlureY7znDhT1899
	 5UJJ7NxtP09mxHmkS5OVE+7JflvHtSfMmC/3C4sx2Tx2LikmUEvYDcuAn/9iiv6qi5/53
	 qVAG5EWiI1CXVX+1WN+Q/z/smV8Eu6ROROpTY4AP9iGA7gVTs7o03kHT9JDFT0y+qth1e
	 4IgAVDBeZugcCaba9so6BqCyJRNVxCe6BkLTBwnaljxJIidW6XSprbIWmGGljPpMi4PR/
	 ip5T7w9kLF9B/8ySlxyl1gEzfbB4I5ZYhX5Rc2b844Cyq3NMcNWGnv9ycgaPc/fXELA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LQz9eRRz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5306D606A31C
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 00:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LQz9eRRz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC9D61F0089F;
	Mon,  9 Nov 2026 00:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794185998;
	bh=UQE22G0ZqqQdSqI0nn+B52/xHkSlMuUJncBzY46mLeI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LQz9eRRzw962hgfM+hN/rXQHJM947JGAvc0G03CgNrgNHOsK/tQxwIoo6ZzlQQe1z
	 SW8Fp1nYlxkjE9L2ICCE/87DdR3NahGOm0w7QxkvNVhlTJq8TJPcHr0cSeJbZOKBnX
	 5JOEpDtKmfv1aTgv4B0XmDFzDuLinExkJwoM1f+7IqN6MMWE2f60skg32YydYx6Zdk
	 v1Gzi+9swgj9aw1zqF4YWD0E/44ixNgnQuujSziWAJHl7IwmcjQCju4GItvfF4fgua
	 5Od8KlXo0tyLbQT3oHkQv94cSGGaUhQhyl/FZN61hcqrcXlvTpcJ+0vlCocbulSeAt
	 87GYFd7NHGL/w==
Message-ID: <sashiko-outbox-204271@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] gpio: gpio-ltc4283: Add support for the LTC4284
 Swap Controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261109-staging-ltc4284-v2-3-14a270a38f7b@analog.com>
References: <20261109-staging-ltc4284-v2-0-14a270a38f7b@analog.com>
 <20261109-staging-ltc4284-v2-3-14a270a38f7b@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 00:59:58 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> LTC4284 shares the same GPIO hardware as LTC4283 =E2=80=94 same pin count=
, names,
> and registers. It is already handled by the existing gpio-ltc4283 driver.
> Updates Kconfig description to reflect this.
>=20
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-staging-lt=
c4284-v2-0-14a270a38f7b@analog.com?part=3D3

