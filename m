Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795024147;
	b=CuSUt7t2aFfgXeXYmFmUzmoaEPOcdH1lZIIvtXXZ3E7W9hzmP55HVf3nECzzRPpMdr1A
	 lVQBYL5jeP36nGNpiMgvQtjmN83by2rMWfUztDjFCHD8UTGX8+iu6bSHGlDymANXBDoQX
	 nbe5H+bLOu7gyZp2pZ74VzkPNo8rEvmkSO6+h1KP1G+Pk5Gn+P6sutHnntLCu0s4HGQk+
	 GJ6oEFEV3Swr2ByTsQzZQNWSKoDMNK0zG/aaEzluUESBCxHdS7Kwx2zIedUEFeVfqKSkz
	 mFtCgah8ABGSzLcnJAVaB9y30MvLcW1rzoHCJtBCGTxXbjlJBD5nr/eBVKx1UkCwQ7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795024147;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4aqVs0eI2VrQC00mQMWRYCFyXd+ZBI+uElqC8w43DQ8=;
	b=CezfNmBTremdE5dzqJ/IvgQpoSQjbRZxunnCa6tZdBw9ErJbtOPX0Ak3aovG/G0cd+/K
	 eGUhc+q/ykMhBs+VXFrSX/VdKMzrVwYUD5iG2muU0qqMuKZNL/VOhh5oJCFLKatfiytMH
	 KJ8OOHhRLqY+JOfHLIuq/Lb9Y3VUPHpKnGY4rTaSyYj4WDXsNGYc4+X8bOAdRQiKIKQlv
	 m2whG0OQ6fSkajpfxskRqrFfdLnyOLwkc3JYGxdHs2kaQtBE2Xmd3vAFkudUs/bCcA+Zp
	 NU0G1NKRrHnD6KoZKDt1qlyeeSwiRrarZC3GUOj0NtvUbDGFiQHqgmtFGXGR/OPcAdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gLyczW9a;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA42D606A31C
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Nov 2026 17:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gLyczW9a
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FAC41F000C5;
	Wed, 18 Nov 2026 17:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795024147;
	bh=4aqVs0eI2VrQC00mQMWRYCFyXd+ZBI+uElqC8w43DQ8=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=gLyczW9adgkKlLypBm9IMnnt4pYrfeW0F5QxPCljZ5XvMrKIK33p/sMVVOuoqFvAd
	 NHaNVl7Ta7GutN85WXez5xZ3U/BrGMjDMYjzJxqS2HGFuL1y5ZLmv7OLNBk4bipd5/
	 n33Y1sD5ymZUQNS7PZmkPMPjgZ6xRmavr1TThYINpYfrbnNLlqlOHz/XyoojJQxv3u
	 bnSn4zmghXi2qz1SJEoewm94XOmPHAaqIQkMzUotiCcmS5I03OcELr6x1AVxQ+XM3Q
	 Hk1SF1TSQZUuqOK1zBw6Px8Rl/2AbQ7SLDZkFbhuYdylvbCB3m7HKM9J6pJ1FahEok
	 H685aRwrkqfRA==
Message-ID: <sashiko-outbox-221694@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: ti,tmp401: Add channel nodes
 with label property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bruno Thomsen" <bruno.thomsen@gmail.com>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261118174334.18759-1-bruno.thomsen@gmail.com>
References: <20261118174334.18759-1-bruno.thomsen@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 17:49:07 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> TMP401, TMP411, TMP431 and TMP435 have one local and one remote
> temperature channel; TMP432 has two remote channels. The local channel
> measures the board where the chip sits and a remote channel measures
> whatever diode is wired to it, so only the board design says what each
> channel is.
>=20
> kam,am335x-emperor-mini fits a TMP431 in place of the NXP SA56004 on
> kam,am335x-emperor, at the same I2C address. On both boards the local
> channel measures the baseboard and the remote channel the FPGA's
> thermal diode. national,lm90.yaml already lets the SA56004 name its
> channels through channel nodes with a label property; add the same
> nodes to ti,tmp401 so the TMP431 channels get the same names.
>=20
> Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118174334.1875=
9-1-bruno.thomsen@gmail.com?part=3D1

