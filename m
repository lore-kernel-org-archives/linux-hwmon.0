Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884969;
	b=jt1xNWlvB0tLNYla4LhwA4+YPEoiZzKjd7UCH9xdROaHve38WEsoJGfzxE8Of+QM2UWh
	 DTmoijo3WulPy7jJZi9GngZ7yi7u6RQdCSXo6R8M/6P+Dlqe3lAA0p5YCUWtOFW2nM7vf
	 LqmB4EyFdqhzN3x/Ig+N/nTgD0FDYlELWilmdbF/uZZAc42r7HKKD+yc8vD+l4JuohqIy
	 TRzQzzLTRPcdKrifiiASElPUm4WFr8NQH58V0GI4h+yd7mYJBKSHFOp/KeRnLPOffTTLL
	 1361ZGu1nnTFAFKKqJgfdeAFcTiV/N5M6Hc6IJBPEeQvTdgOVKAw2bRNQWtj8lJUo4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884969;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eCi35NLM7NkRP5JdiP/Tx1yVPmvO2PRs1c3xCJs3VmY=;
	b=yPGCdhMUi7K9yU58yXzCR7gnAE6fz2xvU1heZ7KVRMwVjxnIwRmrNo7+0mty04CBQkah
	 67z/IGWGC9OiXTYq/DsZlHGYN2mX4MaTcvjplg7ElkVBPxCoTqaLQOyQYVJbIpEectPWR
	 /4agZp7lSWaBGdJLiXgHgam+ETggrfNR/YEtWy6hXbbTYHhA8fbuWz/bkI0diFa75K3pD
	 Ng7BBVbicQ/u0GUolhVPpq2VnqCaDIvdZrR4hNxGetHz5E+srCGQ+xXByHBzCz5ZwVmvG
	 OKezvjSKss+ffjHJ1JKBYssiUyXMPuWmBfI1eKB8JzjxUgNXQG/Ffr1Tj2+T1FjFJHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HG+ZbLuP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D7D606A31C
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 03:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HG+ZbLuP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D35451F000C4;
	Tue, 17 Nov 2026 03:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794884969;
	bh=eCi35NLM7NkRP5JdiP/Tx1yVPmvO2PRs1c3xCJs3VmY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HG+ZbLuPmDBhxaByaoW1bUA9qIrn3oA2558Ukx3v75QXgC1F9e2LbZWaJg82bdB6y
	 uc2NteFoKp6bMCM2ebhSbbEYMfwuAhqrMp6cSgzrNz3AsVMf7+MgDsHPJ9MSgCDtjP
	 MTDNhzF3prjVn8NyU4QxRf52RJDz/XZ8K2P+gPu3yTC+tG1A11a1YjHC6CYypKVOuH
	 6+E6UmRgSAsURVngROC5j7kZsr7uiDEPSTllgpD/rgcbvI/+Di+JOKOnShKxPTJyI3
	 UcLd2Vgmfq/EHY7dYh1fuvw9cBjZWFZ6iGkfer3p307oWPZM788jFCG+7bxMxhjH4c
	 OnIDYrNNyPlfQ==
Message-ID: <sashiko-outbox-218127@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/7] hwmon: (marvel-env) Notify userspace of
 environmental events
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matt Turner" <mattst88@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261116-marvel-env-v2-7-ef614eb2e7f1@gmail.com>
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
 <20261116-marvel-env-v2-7-ef614eb2e7f1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 03:09:28 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The firmware reports each change of a sensor's state as a system event
> machine check. On one, reread every node from a workqueue and notify
> userspace of each alarm attribute whose value changed. The notifier runs
> in machine check context, so it only queues an irq_work, which queues
> the work. The work takes the hwmon device lock to serialize the refresh
> with the sysfs callbacks.
>=20
> Signed-off-by: Matt Turner <mattst88@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-marvel-env=
-v2-0-ef614eb2e7f1@gmail.com?part=3D7

