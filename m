Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792901809;
	b=ImEY1kHRPXeROt/KMkz3MVOmQ9cf+/85DT6BMQShtzhflqur5bjtr827C87jwNTaZeb4
	 Lo4tTHiQKO7cu8OSrF+jSWGgKTr7lPBPjqDkUOpbiF1CBVT15HRZdzfSq5I5HXV6LW8Ay
	 hn+GKkkrMKN5DaTepUEEegrFZSad5D7LQgPKKt0SfoneQUtiODCqLro7290vwBB4hmmoB
	 A3AE4qDTcR2MuCCyL22MBq/37U0XD6x0kl3wFWoWBvhVBfF9GYVN4Lu90ND1gfBRs6RL8
	 cOSIDVatjU6WRA4nWRGhXjugyhxOA+Zpb9TjgdelMDJNMa2DFPYY028I4lV4sMsND2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792901809;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NfLHM1OOoKQ59ToOOSJNMdj8uKmm9FRZZwvxW4nbmwE=;
	b=pyP3vvSszZ6cx8pRxghVCBnpxjj/nOr6pnQOlYazXXMdPnWj57NJUPKYd/rgogr18Z7S
	 iXdRmq9L8nUdUek+zrgB4QF7uAMBqBsM2OUnC3ktcZ0f0+w1PWTGo7oE0Vb8raVn0bJjk
	 uRD/FaRbw209nDqtXN3wZBX3xnvJVt5clQhd+CEHKZMRIeQMmzXHzPBSjzKT5tCbKacAC
	 u0/WZN9bkYR3XZpRQLaOoM8CKAT2LcJ8ozjxJ1CjgFPWSQGWlOKLLViFL8aWciDh0zba4
	 hCUKzv8vAuJfJWw1PxpvU4dpzisPq/Mor++NXsiB0B6nfkSIP0Clp8f6GbranyQZbBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XKj+5e0f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F862606A327
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 04:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XKj+5e0f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C74491F031E0;
	Sun, 25 Oct 2026 04:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792901809;
	bh=NfLHM1OOoKQ59ToOOSJNMdj8uKmm9FRZZwvxW4nbmwE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XKj+5e0fe2grI7JLWrykwlTuwWcqyu61oOB+llEOsPVC+Lv6ZuG+9EOQxhHo9wJET
	 z9QhrkGUKnXrzPaZ4VUSPZIIB+6re/d85ChSG3JNDQAgIb0AgdIAIcCfkoqQ/vtCMR
	 H4N8kJMNdGuO+fYUpdQ7Zf0QmXkqK1Mx6axAfUUEYdIC4jWbnl3D0q7JUJNn+g8ahh
	 kN4enG4nLU3qrDKo55KOu6A1Vb5SlKayi8jny94cSgdsEqNVCDr0UV2AUCJFvYdbuw
	 U7zCYXPBTB354uCRfrHoJd46pdraxQupUeRbNBlVvhOJQntXi2VMly+veDyzhbJ0Je
	 WBubii4F1vKLw==
Message-ID: <sashiko-outbox-184036@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 19/31] hwmon: (pmbus/max15301) use 4-argument
 i2c_smbus_read_block_data()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-19-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
 <20261024-hwmon-i2c-smbus-read-block-data-v1-19-e81941ad0cd3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 04:16:48 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Pass the buffer capacity reserving space for a trailing NUL byte to
> i2c_smbus_read_block_data(), and ensure the device ID buffer is
> NUL-terminated before comparison.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-hwmon-i2c-=
smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com?part=3D19

