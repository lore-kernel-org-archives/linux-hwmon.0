Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793954163;
	b=kThQbqGCYf6jhgHfbSX2s9nIB/qoWTRzQFLch+S4w9BQ3PGlD5ErfZ2oOoW7u93Pa/Bo
	 JZcOaFWGS1wRDL0+ufx7Gm4XBi+veRpOlTnAVnTlvAcxzNMzUDSUojmTxIHZRhaIgQJ+W
	 Bh53ffqkjAGGuxX8oGZx6CGI746qlv86x3UDXdngLsKINRniWbrNVuDa7U9p00KIVF6d5
	 kiDi4q641ATVElxth4aZPQlaGIr5DKvNETccl6HVucYdOKyG2NA4K1yN1c4dovFonjnY9
	 pl6j906kX8tGgg182x/2mhP6dpnUmEEMoEzxKbI23II18zGJ9nlcV4CZwHc2yMXL1SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793954163;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YOps/qj2heqskiZH5WiXvO+tsI/yHIN6yKEwJrh8rL0=;
	b=kMXc8nZG9NqqDM9W+kScCH412nThPstUG8t7iWO5uIaAvU6Gpxm/1QXMYVoHpIBlo/9M
	 J0vXGCLUv9EQbN9jPrDIdjYcV0DaCHNjAIJHZ6VRje3jpyXSAGzj+G6YvUifgr7Sssd6w
	 08Wj6mvDK4lNebndCCdgb6Z0taxScctAUaSUPuqVvPGWtMsQp7koqpLGo6MFpvrxM+fCK
	 2FT/Ka7uyisavlcVLASO0VrtCrnL+6yn40QSIK0KPTFgRcrZsglQWk1ErgS43LYN65wH2
	 CtIwUiqcHEJ69JCZEYTkH+lah0j2w/PXqZdOOBnf7bTGyoYXQ4fux5Z+pXHc0EaoOiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bYPnekuB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51763606A326;
	Fri,  6 Nov 2026 08:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bYPnekuB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDD521F008A1;
	Fri,  6 Nov 2026 08:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793954163;
	bh=YOps/qj2heqskiZH5WiXvO+tsI/yHIN6yKEwJrh8rL0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bYPnekuBKzA5vOjxI/uPm2XlhLH+QErX7bkAPqZ5PsVvozMMGuTYRw0+pZGZe4h6i
	 FQd3Y+bmdti6jzH52GRtxflBl3zu/dW49LxXPhkzKYvmc86QqUBd3J9oGjH3wr+pzj
	 q/qiCX4zOazG+vU4QNfjP71lH8WybRIkwr70owKcd2yfZiA5/xoFPoADMx9Zzvk2r5
	 B9R1Dh0RVnlSrvF14WoyBbeXbSxfenQ5k7LMbYEFpfQc/gyKp70J9y3UUzyY91lIPL
	 YCcA+OjasBAjsL7iFVJautgIsgl+vY+WCr9U3LM7iKglScLNw1tWGtJ8uqBeyuvD6s
	 YKVYW52mice5A==
Message-ID: <sashiko-outbox-201073@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/7] clk: bcm: Add BCMBCA PMB clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, linux-hwmon@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261106-xg6846b-bcmbca-xrdp-reset-v3-6-d6adeb71afc9@kernel.org>
References: <20261106-xg6846b-bcmbca-xrdp-reset-v3-0-d6adeb71afc9@kernel.org>
 <20261106-xg6846b-bcmbca-xrdp-reset-v3-6-d6adeb71afc9@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 08:36:02 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Add a BCM6846 clock provider for the Processor Monitor Bus (PMB) MFD
> cell. Expose six outputs from each of the RDP and BIU PLLs, the Runner
> clock divided from RDP PLL channel 1, the crystal output, PVTMON and
> block-zone clock gates.
>=20
> PVTMON and zone clocks provide gate control only.
>=20
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-xg6846b-bc=
mbca-xrdp-reset-v3-0-d6adeb71afc9@kernel.org?part=3D6

