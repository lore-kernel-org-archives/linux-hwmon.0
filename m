Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792806477;
	b=XCfZ/3iWftQy+X6dqX6sipuTO+BO1JXkSxo2MTZm6T92xeQxaErnoN4bAbztYXK0MaVT
	 AzhgTOG2kGj2ZIGn3ZDrFgM8UlN1ibrtxJ1cZW2NZS9uZ2vGGUW2cUQA8wUjVckqr0DrX
	 MoEdS7Z7ER3a7tX4Ofvk39BhXYZBM+u+aGGrxSjxiOn3vsWVqXiH9vfDFAhDkdkDsgH3K
	 hjmjZtJNY/K618DTXcViQmiBCibV/fJt+5Dlym5zPhiZU5RCd+ygirn+DV+ReXKZJQAwF
	 A6hjHB1lD3sKZ1HRe1IqbmagTnUF0XGkbaVMuBDQAm5xKkib25/pPqm72AG9QelUA0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792806477;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1mEN4iza+FuDEaG7u6aUDxTcq/0s5ilmewf5uomvi5g=;
	b=hHCxn85bs0P1aqI+/c2Ez16273X84FBRszaFTmwei9Di2YybF4roqPhJPFPkRPsZffED
	 ZjHIhVgO+656130k8bHjiBow4aD16iBrkKLooe21P9xv3BtnEWDYdgCrz/wuctbEWF7oi
	 1NiZHZGNtLPVxtlV/B30rMUPSQIlXuO+4sO1bGy4hpv2nGwl6hYJl0FfO7pgsPH2yHvGO
	 EhS/9aX4MRI/Qprm6H/c8oFVtF+V+76lo7uxLPRwjRifDAfLA3ZVjQXOOzkVRGAq8id1N
	 BmK4Dzj7lB/nW6TmkorJo6Jby1bE08dWD+wknum7wTtxegRe02BM0w8Fn0fzmpVHijQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BjUIbcJd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0CE606A31A
	for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 01:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BjUIbcJd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B3DE1F01825;
	Sat, 24 Oct 2026 01:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792806476;
	bh=1mEN4iza+FuDEaG7u6aUDxTcq/0s5ilmewf5uomvi5g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BjUIbcJd0B5EoG46vGlV+SWkeHI4Ss9iL0KF3LNETaIfEpskRw2m/VmE0UyF/8UME
	 jR0iK3PuR1LOsgLz37VOp/McRANXzH3Ahdu34Iyc3hwGuWeByQc6hOr3YDCDYuJdbF
	 pXMjjp12UFkIRaCiq3CKHfO/WoFKS515GuqXQkyBDvds6bPVm6vq/0v47h8GrH69Mz
	 VROVoulHPmfYLrKm2vQAcO0qY8Jwzv3sbXILkzfq61abufhsGov3u+D5TnrYsK7rhY
	 JgTV/0whQyudWXHR49EdaxL9pV1mzlUveadpRlvrpBYNNpsL6aSzm8Poyf3JJ9lDSD
	 EDknwuXcvYsHg==
Message-ID: <sashiko-outbox-183492@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] hwmon: (sht15) Stop deferred work before releasing
 its resources
Reply-To: sashiko-reviews@lists.linux.dev
To: "Myeonghun Pak" <mhun512@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261024014044.27853-1-mhun512@gmail.com>
References: <20261024014044.27853-1-mhun512@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Oct 2026 01:47:56 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The IRQ handler and regulator notifier can leave work pending after a
> measurement or notification completes. Neither work item is drained before
> its resources are released on removal or probe failure.
>=20
> Disable read_work before freeing the IRQ, since the worker can re-enable
> it. Use request_irq()/free_irq() for explicit teardown. Unregister the
> regulator notifier before cancelling update_supply_work and disabling the
> regulator. Apply the same ordering to probe failures.
>=20
> Fixes: 251eb40f5ccd ("hwmon: sht15 humidity sensor driver")
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024014044.2785=
3-1-mhun512@gmail.com?part=3D1

