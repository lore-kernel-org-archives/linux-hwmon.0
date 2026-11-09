Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217706;
	b=uTlXoS2rqo/FVuSQVzC1PqAYtgQUWaAOjo2uiAKI/Nyv9vZZZVstUm0mM4eewta+/gD4
	 lrW5C1feUoozVwWIEpvuyPq7uWEBSsS/tuNNVVAZyEHyZxFMtGDPEpYW053MGL6YdBExq
	 7xk/dVoDqJPGZaaImax3IX2K4Kpnarm2QFOEbC+jgDIC4f6JSNC5AJF9VCofSBNh7sI3F
	 vOLPMu/IKsYZV4COmX/n88toX3lxPrWQxXGe9Dc4N79AUaTEcncq5wJ8Oo7UnQcGkQpnb
	 Ylyf4SJV5tLVN6q0sK6nnO8Wlu4NB4yoOQuv1rAFhbujYmHuni/HY5N22++ibVDOmVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217706;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5SxcTFS6cyCSADdfx2yGCLigreliTaUpkg3kH6tCrBU=;
	b=W3CgIKdhxMWU8ymPvaiWsDmbrv9FBsoCer3aoTgFwxe0JrMYNJmhErbFrv+nIchCJPPQ
	 h9rMTyIrzuto/XEg0Puwa8hE9n3pmphRATFuNpCKjQa3pY/b2X8jvruzDiLFSXcTflk6E
	 Rd/MQV4vBYCkLH+fGN0FCRbyi2G+eDfMkE0TazaFg49vhjeXJUPtZWWyHwBHHky5Ji0rB
	 5v6HWmqlmcMzu6GB5n88PnEhg5RYhIReg2PVsXkluGH3/mneSihN7H72eW/fZm4TGDE1N
	 FF9KrZ1qeJnbtGlDCKADAyMee6CtfNQ21QNleEWE4LQBnDz5RJlYuKyk8OFSQzCWRew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BS5PosR+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54E4606A31C
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 09:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BS5PosR+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0545D1F0089F;
	Mon,  9 Nov 2026 09:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794217705;
	bh=5SxcTFS6cyCSADdfx2yGCLigreliTaUpkg3kH6tCrBU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BS5PosR+TDmsGXcpMHcaiCRJXT1Obnwf1JcETtULY1AjHR6mz4FM88etcmrf+LQ2R
	 aIz9nH/76R+EhSsYagkN6AOR8IfZWdE5fc+xzXjVkq5Z/To4fy1kVmEU14uB6m3LJc
	 QTN6+rvE/vgOEUHPWUchuEgLxTMjVBh4qTFWTF6/Rm/MCF7eMpQzS08UIcRq7CQTQ3
	 M8+wkPm63QJKObc4Qn7eantcl6EW3/H8RwjyshUjyy8K9XO9JCtRtVhfb4JXHMM0K3
	 wzrrs0K6o1RjAecic+cUs0GMKet2WDn/msUoo6GU+vGN2aPKuDlq9gTpAXhoa8vHcV
	 //+YdRS4Offow==
Message-ID: <sashiko-outbox-204743@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (w83793) Clamp fan control times before rounding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261109093534.5447-1-zhujun2@cmss.chinamobile.com>
References: <20261109093534.5447-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 09:48:24 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> From: zhujun <zhujun2@cmss.chinamobile.com>
>=20
> TIME_TO_REG() adds 50 to an unsigned long before applying its upper
> bound. Writing ULONG_MAX to pwm1_stop_time therefore wraps and selects
> zero instead of the maximum duration.
>=20
> Clamp the duration to 25500 ms before rounding to the 100 ms register
> units.
>=20
> Fixes: 6800c3d027b4 ("hwmon: New Winbond W83793 hardware monitoring drive=
r")

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109093534.5447=
-1-zhujun2@cmss.chinamobile.com?part=3D1

