Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111093;
	b=mmDBrzeQ9uvjXTOfBkRHJPTVrGdUg0PebKb/myUht4b011zLRwisA4bGxvNWpJzeUU0R
	 6w8izcyMFqQ7jQShDofxFE2VYNaSGv3yabWs5EPElL+pAAyRqZD7wegMoDHuJ3fcVsJhR
	 2kyyEqHvTtffBCOvbg3yvfWC6zkcLTWIGDLTP5XuNjl1FE3BTytfXmnCP8XMPQOI//vOu
	 Lnndiup8/UVrm4UfeUe42MEZZeY5DnU0Ma5FDP1VTzYtoyYd04MZIszwtu+DnqlRMohzu
	 vDoNthE5Oj+fecKSnMSCnzDsMg4oaTwJxaTu70fkOAIIo9ogFrLO5/lIEVAhgrQUy1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111093;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OYIZdQ98ASA6JMPPGRPKiV+fnnrYBTfppReE6+76NwU=;
	b=yftCTqtykV90q36ZLe5OSXlCeuS037rDJufPkTxPe+5bK8rCBK71FOOBS1cRaNzx1DsR
	 659tG/BGLts9dULeav56QFn2uqLAQWhOcihpT0YmyzfKZCLtxR+sm5ngWbSkRhEFbJW4c
	 qR1yY3x+XEq2uLyTPSAJVgJfvsfoVdN6a2pebLUwptbivQKFgBJpugMJ6p2v93UFkxaJN
	 9TEkPUbGKz7dEJchEiLQQScOlewahBcCijsdPCElU2JDAGRAtgg4+NYeaE8BWtrg1iPFr
	 7+DAN1DPUc+4dHEuAdgcq6kH4IbvDWehXtN4gmg7Y4X9DnJ/02VG571Qg601QOjOOpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g4YRCVbQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECE9606A320
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 17:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g4YRCVbQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E17971F000C6;
	Thu, 19 Nov 2026 17:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795111093;
	bh=OYIZdQ98ASA6JMPPGRPKiV+fnnrYBTfppReE6+76NwU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g4YRCVbQtlhkPheBv+2WuEjPfMH3bTmMORnA/bJn8NQ2h7v1PS8rP3A3LXUegqFLY
	 qPR75+OQmcvHhhAagqYGhBN4PxAbhFnE0gRDbu8HDUWJLqzSwMKeTYFwSOApb9yp+v
	 ybb9LMsRP+tUuRC1YV/kevWlWDpi2mNb7c0mMhtoBlLxHIEUR2UE6LdyRMBOOBZWBG
	 5ycqz263JRYrS5lq4JFWUnxBcnvAinTrQG+2xq32ajltxhqz3e28jVFdiPH4lR5oa+
	 cctSvBGGcrMoRbGMaHycGk8QAwQHz2P1J3imV0asOl7tMz4Wj4rJExog6gLidFRR5B
	 +JL++Hm7/vXWA==
Message-ID: <sashiko-outbox-223740@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] hwmon: simatic-ipc-ec-sensors: add BX-54A EC
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Benedikt Niedermayr" <benedikt.niedermayr@siemens.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261119174548.1324539-2-benedikt.niedermayr@siemens.com>
References: <20261119174548.1324539-1-benedikt.niedermayr@siemens.com>
 <20261119174548.1324539-2-benedikt.niedermayr@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 17:58:12 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Add a hardware monitoring driver for the embedded controller on
> Siemens SIMATIC IPC BX-54A systems.
>=20
> The driver binds to ACPI devices with HID prefix "110A" which is
> currently a registered PCI ID for Siemens [1].
>=20
> Looking at Dell, HP, Lenovo and ASUS this seems to be a common pattern
> where vendors define custom ACPI tables for platform-specific features
> that are not covered by standard ACPI tables (used by the ACPI EC
> driver at drivers/acpi/ec.c).
>=20
> [1] https://admin.pci-ids.ucw.cz/read/PC/110a
>=20
> Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119174548.1324=
539-1-benedikt.niedermayr@siemens.com?part=3D1

