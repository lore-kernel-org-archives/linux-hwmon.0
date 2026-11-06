Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793954069;
	b=nxcIpduWhQVSlDDqp5D0Iylg8NjNWxPN+A7MfQxwl4ShRPMrGHg90jc6nCzlzCFNU/O8
	 jMCHnyyqOp9f3VIf4knSY0/tjFYMhbjkuWxCP9+bPNlF7jSD4PvYjQic8mY8RxDqtjSUC
	 zEv2GzGLmgVci/xqfM0/39DY1bYO2tnoBzW5bsDjy+pCUug1RIom2IL7UrKpY54jNeSAL
	 sfAqtKDTG+M1ZNr4npWTg0VBNMf/55a+TzjOoQHru35jMNIUYiAR41IyXQ/zWOzjliswI
	 sBN8tb8LyOhdyBNX3VSZ1obHrACdDz2TQoMTJqDlUcnKCC3PBJ6rGSMtNNIzF/vrW5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793954069;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=L5wd8nziQF/hfh+g2Gp9fuLiSPRlW7xnrM4gfwO1E5I=;
	b=ybAEJlMAd2vYJtQGnGEbnTICGBH8CD7JawcGtJZUTdCFO8MpXM9JggWbE51GBPf+FU+Z
	 GjajNc+OYuNbydeYQZJil3hwDXlt2i9pfy8KRfqPqAQuHho0t0BS+mDyVOBP2OQUZH9KB
	 0ePnRV91yVBa0Wk2zar3qk91ExGCTRDoW35H6hY/04OCK3bkyQaM3gyHR2cxL7OAtLQed
	 i7w2iQKY3KU6r+4k5fmxutkYVUdL30zpaZ01dILEDb3oCQDxSeHRCRDfnfRk9yN8ghVTh
	 wPGTnzKxw3r+tcyWKFvm/LBk8zhFkDtUbLv7DnQGmbga6Dc/+053nwzcp8Dw0A5J/2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nmDpn7k0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39683606A32F;
	Fri,  6 Nov 2026 08:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nmDpn7k0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3F361F008A2;
	Fri,  6 Nov 2026 08:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793954069;
	bh=L5wd8nziQF/hfh+g2Gp9fuLiSPRlW7xnrM4gfwO1E5I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nmDpn7k0u2GejhpAjCAON/iSosBJ0szqbI+U9aWvwrYhSnXB+Dh4IRSKZIl8Qf33A
	 LukEyO3syZqzEKZsZigPNcA+5VFsAPBew4RDD9Mh1Er0cnYSg6XD0lZE+1MKF9xYD0
	 KL3EJG2jfGBbh+M2CAz26zofG4c+qKqgkR2yV3r5cpD51b8n7gWq+wHYGg4GBSG+fU
	 IbNLx5hnX0GzC2MYPSfqfsCFvL/ntxVmBY8flQzOALXl1OHrygvUqFN209JQLj0SVM
	 ZMu4RurhSJ6Dn0JY2Uv4b1Td1IU8Gg0/TMeDvYCWsS4rBR7HwyCTCUJ4pph09uSFrN
	 l1YBzdsWKH2vw==
Message-ID: <sashiko-outbox-201068@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/7] pmdomain: bcm: Add BCMBCA PMB power domains
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, linux-hwmon@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261106-xg6846b-bcmbca-xrdp-reset-v3-4-d6adeb71afc9@kernel.org>
References: <20261106-xg6846b-bcmbca-xrdp-reset-v3-0-d6adeb71afc9@kernel.org>
 <20261106-xg6846b-bcmbca-xrdp-reset-v3-4-d6adeb71afc9@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 08:34:28 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Implement BCM6846 BPCM power domains.
>=20
> Group XRDP, its three Runner cores and WAN in vendor xrdp_pmb[] order,
> so consumers can power the complete packet engine before resetting it.
>=20
> Also expose peripheral, memory, USB and PCIe domains. Keep the peripheral
> and memory domains always on; exclude CPU and PLL blocks with different
> register layouts.
>=20
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-xg6846b-bc=
mbca-xrdp-reset-v3-0-d6adeb71afc9@kernel.org?part=3D4

