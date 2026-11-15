Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794729941;
	b=LvvuY/vozFzCmau43pfpfHk/jb/83HKBwA/fYXiTuqPCZj7nrLC7JwU7EosgM2K1VP2u
	 KNCAudpvrTwXKjdPTLGWm7MoqR9UDXBnB5/HPkapddWd1MbJ01R5aVm8Uv1fg2SJK+A58
	 pfbaKmkRMkFjBNIPze7MSMlR+qvqKYSXujZbTsGM8N9ojNAqx62z47l9IEvDOcJFlOPlf
	 yIc4fTx2lkiWkokL1JP3SNPEzoUIomCJmuHesotg2PT+fD6vYblhWWn4UoxZowKUAESNf
	 mogq4eHS9RulMBioh49LMFL0qaJlPF+Ajj0wyl6fo1176TBWePGRKiABjLbwhFG9nUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794729941;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WTbpzdG4ZOQBIeOw4pj1neF+dBvXdTlFJrTpbXlGGP4=;
	b=Ww48EUdIoPHMAhoF3EMIIX+VRhtJVykxzynMt/aM0Qwi3QSdE8ImTiuHosxI/J1rM3jA
	 H388W5ce0JxBVQvLWTKM63CBLsA6tj9XvBA0BWEO3iZRLOrZqZBJGk8Qm5n5gGR/Oal+f
	 iSrBtiYjnM3RHbwgMpwS3GnFd8cas2rImFIDAQo1cUAtg6fbgM27z1FwF/n/w9l4YBv2j
	 /x7RKrHkYHVE+zzGVNzjAOzVz9MQKDpsN4eZaGRQfdkYZWcZEnRa8O9fDR8YECcRzNoN4
	 jgInO3i5fmgQKCZAwzNqKBwSC/5sp7E+7f9q8u7i7I8jxBWBoP7v0wY76864oYAGNLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BRJ7tnli;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F7F606A331
	for <linux-hwmon@vger.kernel.org>; Sun, 15 Nov 2026 08:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BRJ7tnli
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDF671F000C4;
	Sun, 15 Nov 2026 08:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794729941;
	bh=WTbpzdG4ZOQBIeOw4pj1neF+dBvXdTlFJrTpbXlGGP4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BRJ7tnliXTC9mq32X12O+14Z6M0GXtRn3Oxt6vWPFnhrTFdeGkl8/L6rKTi+hWreg
	 z6aI4YSG59CY5lC8E+evhi6MkFTG+HlGuY/puDu0I+Rsy/da0wDC4oWhB+muOTHehx
	 3G0oprLPmfqEQqGz4ZRJH97TUOsxdaFOf4LS+4b3UpxI9Ui4Mmbz9XshrFl6vBTogA
	 Lv8SKGGCbZ0i+ShQVw2+LYTlmTgq+tOdzarVTXM9td2x/WqHlISfJQoXI0PYYjx2/h
	 bNjU+u9Vjy42JvY+ZxpsP0dDjwntakMiLiaiRcaYzsn7yF+6kj2L0ADmteP3WaGjLK
	 hUMkU0m7p78iQ==
Message-ID: <sashiko-outbox-215280@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] hwmon: (w83791d) Fix incorrect struct cast in
 show_temp1() and store_temp1()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ziheng Wei" <zihengw03@163.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261115080203.910033-3-zihengw03@163.com>
References: <20261115080203.910033-1-zihengw03@163.com>
 <20261115080203.910033-3-zihengw03@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 08:05:40 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> On big-endian architectures, accessing the temp1_max and temp1_max_hyst
> sysfs attributes in the w83791d hardware monitoring driver uses a huge
> out-of-bounds index, because show_temp1() and store_temp1() downcast the
> attribute to the wrong struct.
>=20
> The driver defines the temp1_* attributes with SENSOR_ATTR_2(), which
> initializes them as struct sensor_device_attribute_2 (where the index is
> an 8-bit u8). The temp1_input attribute has index 0, temp1_max has
> index 1 and temp1_max_hyst has index 2. However, show_temp1() and
> store_temp1() downcast the attribute to struct sensor_device_attribute
> (where the index is a 32-bit int) and use it to index data->temp1[].
>=20
> Because both structs start with struct device_attribute, container_of()
> resolves to the same base address, but the field widths differ. On
> big-endian architectures, reading the 32-bit int from the memory layout
> of the two u8 fields yields index << 24: 0x01000000 for temp1_max and
> 0x02000000 for temp1_max_hyst, instead of 1 and 2. data->temp1[] has
> only 3 elements, so the access runs off the end of the array by up to
> 32 MiB.
>=20
> Fix the type casts in show_temp1() and store_temp1().
>=20
> Confirmed on a big-endian s390x QEMU guest with the driver bound to an
> emulated chip: temp1_max and temp1_max_hyst read 0 instead of the
> register values. Not tested on real hardware.
>=20
> Fixes: 9873964d6eb2 ("[PATCH] HWMON: w83791d: New hardware monitoring dri=
ver for the Winbond W83791D")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ziheng Wei <zihengw03@163.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115080203.9100=
33-1-zihengw03@163.com?part=3D2

