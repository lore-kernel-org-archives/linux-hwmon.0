Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830893;
	b=HaY+COFW6lt7QGY8MIAxGAR1GIakLbOvQkAGdJkSYdtq3nFHEqpO2gemHwiW8OVI5E0E
	 Lcni2kPeXWBpqWdLEGK79hCyZNY5TZTqLq4LH12b0WXr/kihWCafSUDnKH6dq+OhM9gzP
	 cztbqhqJIxUUGxUqy52IlQnrNbsq8ETYwCZF8tFE8xrepP8vwWqrQRg8xLI11C8kw/fCw
	 WTjP158JeH2eYX1MSTVTD38maHVTY9i4PoVhKnvDynyCwAJVQ/2zAwAOOn82qWzTfLwyu
	 ZI6tGcEYInXNLIq/IsXYlR2/hmeFOjbA2LkUKQlaKjb3Urd7RK2luNi9T4JBmNNunJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830893;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=99mTtJippeOdVaJV2hmWbj/S2aL0yD0mptCysRBkdvc=;
	b=qI0VV23BWqbqYbI3tbgIl7gb/XXC4ys2pko4PBC0L5Y2H+RLq0TiezmxeO25GBq7Y/G7
	 /R+W6Xx321pxVT1/cw5M/Kbao16DPCFx/yQsz7x7HAsLX+ctuq/dX28kRn7n+lYoED2Vx
	 J8She2qhhJHPMAI+YG2QZzbBYqf2Y12t9U0LW8d3ioQ8sFMtg0UohPwe2jkXod+IlRCVo
	 juyKorCN4btPnf4hTAfxXBCOdosE+DzcyXJpu6a5TWLRGW9OYn9LsIhUSEjyTR0PXrj3q
	 otos6akHg0+1+MQsWGE4tZTMrf5icj20LdYhVNIGS0TwK9Rwgq2CvsFZT8BEcIhi+ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BQL9mE2R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CCC606A32F
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Nov 2026 12:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BQL9mE2R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 465F81F000C6;
	Mon, 16 Nov 2026 12:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794830892;
	bh=99mTtJippeOdVaJV2hmWbj/S2aL0yD0mptCysRBkdvc=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=BQL9mE2RYYh4adc/ATF8gjDmKoTWltYo3Ai2SMbrBmgcmC60rdJtIZjJh2x68Qbks
	 znEecywuUn1m0bRw5CCh4FICMc57BJ+SRETa46rpFJZgSLsf89HZEzuG0n6OVPjAs/
	 HdOIGBssRq/avr0p+4hk6xKqBmWzJPw+NurIEmcB9JP/4iC74kOQDSF6z8lP7uyXqA
	 I9tqEMJlgZ/r3vm5iaws+M7mDCGZWdwAj8/A9sEhGXejth7SxFQ3ijRU1Cf6W0p1G2
	 7iJoFAzVmvNUUnzMRDCU+o2czHO4GhIsoOs0GtY96z77VUtoWEmNEEAQNuFXmgXwpT
	 rMVbzU0/ybdvw==
Message-ID: <sashiko-outbox-216983@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 4/4] Documentation: hwmon: document DIMM thermal
 sensor channels
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akshay Gupta" <Akshay.Gupta@amd.com>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261116120228.865196-5-Akshay.Gupta@amd.com>
References: <20261116120228.865196-1-Akshay.Gupta@amd.com>
 <20261116120228.865196-5-Akshay.Gupta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 12:08:11 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> From: Prathima Lk <Prathima.Lk@amd.com>
>=20
> sbrmi.rst described only the power1_* attributes. Document the
> tempX_input and tempX_label attributes for the DIMM thermal sensors,
> the DIMM to temp index mapping for one and two DIMMs per channel, the
> DIMM_TS<t>_UMC<n> labels and the effect of amd,dimm-ids, and add a
> sysfs read example.
>=20
> Also point to it from the SB-RMI section of
> Documentation/misc-devices/amd-sbi.rst, which listed only the power
> attributes.
>=20
> Signed-off-by: Prathima Lk <Prathima.Lk@amd.com>
> Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116120228.8651=
96-1-Akshay.Gupta@amd.com?part=3D4

