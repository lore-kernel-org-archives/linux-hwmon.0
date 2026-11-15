Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794729979;
	b=dScbwuk14kBQkWF2sJv23pxUJfg0EbO8uRgXI2GZ0sV2R9R8jb8aQFB84JhrSle1Dvo8
	 nyiQ95+Upmg/TXdM9T9msVGztIJYcuoPqcroqLs6YDOI2Y1ULfbntDf9XFJjigw0SOvxx
	 uQep1ZGROhqDIP/Z1RKh71t1tLshUrfwRGDR6YkW3d/ksIae/S89k86QL64ZNc0kZfdkv
	 VlqTaAPawI7D2y/KHj7f9mQ1gdw1bTY327yIOAjDmQswcpwsSy0veXTYuLMZ69/Je1vuU
	 rHh/7vM2E6KjZUaVKk0H5CVELExnv39nJJxhaF1MPVEjcfObaAKzOYm+cULj+qqItOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794729979;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gfy9RwEk7FmfbsINLpdxzcmcIG8s7J1Lsm7IGz+A8OQ=;
	b=rWDflNXcqz3Wluhrysoq9jOFqdJ54ARCt62srOmu5a4ldVdFY4RUIOQ1T8NHALJHuFKA
	 HS6qcN/57VbuuH2gBxktO1b8YvdcO+n7by8+Wv59RvvyZSE4jZz63UD88qSQZlc97bJHF
	 /3go9W4MOP0h0VrnazvMl5Lz85hLLoOAOyXxHQQ9tBwvbFmuj1VpjGuUtHE+hd/JhOd5y
	 IKNZ/VHUD3krQxv3XXgCFGOZXmQ3Yb4fdEZVWpmysT1BTrvZEuUVGcEDkBfSF8yewbMv0
	 MDUYjOriwqisu2uUXAqdq5tA5cgtXeVThiS6BPgMQxhwH+2eNs7HS5SnXsWvFFAdAdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d9vTXOwO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07395606A31A
	for <linux-hwmon@vger.kernel.org>; Sun, 15 Nov 2026 08:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d9vTXOwO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B6571F000C4;
	Sun, 15 Nov 2026 08:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794729978;
	bh=gfy9RwEk7FmfbsINLpdxzcmcIG8s7J1Lsm7IGz+A8OQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d9vTXOwOwbAlMRAi+UCB+Ay2s87RsbUi4QNu4zANajOAQJbFyda4jJXhT8bVVn7T/
	 ZVo3c/tKzsjqGBPEAmIZg1GfE7qeptsSFqy0WSG08+gvvogXnb9CcGxFsvDyesDBPY
	 GdQeMG4eFmBIc06YxV9RN0PihYj1uN8nMlNenieBpo1L6w2BFuY2xSZXq+jzMyRUgt
	 VcldXDt47RBmd52plZ7kwmoKTCRO5RPIzhs83Bz9hXneS3MMuTPccw1aEODMLwywkj
	 WaN7aADx+v+IM+se7d5XAB/Gg+RKG+UOqL18OmdbFSdbYz6/A7HDmLZ4hz2zstEJ1o
	 exXmGqaoqyzFQ==
Message-ID: <sashiko-outbox-215282@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] hwmon: (w83792d) Fix incorrect struct cast in
 show_temp1() and store_temp1()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ziheng Wei" <zihengw03@163.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261115080203.910033-4-zihengw03@163.com>
References: <20261115080203.910033-1-zihengw03@163.com>
 <20261115080203.910033-4-zihengw03@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 08:06:18 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> On big-endian architectures, accessing the temp1_max and temp1_max_hyst
> sysfs attributes in the w83792d hardware monitoring driver uses a huge
> out-of-bounds index, because show_temp1() and store_temp1() downcast the
> attribute to the wrong struct.
>=20
> The driver defines the temp1_* attributes with SENSOR_DEVICE_ATTR_2(),
> which initializes them as struct sensor_device_attribute_2 (where the
> index is an 8-bit u8). The temp1_input attribute has index 0, temp1_max
> has index 1 and temp1_max_hyst has index 2. However, show_temp1() and
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
> Fixes: 1f8dae31fe8d ("[PATCH] hwmon: w83792d use arrays of attributes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ziheng Wei <zihengw03@163.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115080203.9100=
33-1-zihengw03@163.com?part=3D3

