Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630852;
	b=PcYMAoeEZtjUdY8Y6Sn2BBCvttk2x+v6RQtLBFJIW8/rJgDV6zPASYjWuBTXjf8W3BH4
	 hTGFV0nN7dGDg+Nv2hzj9se7YggS8Y2FkCAb5tlMWdsWWl5EhUa7SfI/YCm4R4nScIgC3
	 F3MVaRsLfYfKAFRNjplCCDhhAdU0GGGZoWUTKj0w/FihFiT9vFObU5w3RFZ0F4RfB3t2L
	 drtbldkiU1iqrPpaEfzK4cpzud5k/26RLy6rCAFwevXko08NcaQLR8fwklBFV0TvchWjw
	 icZYsmuPW0jMTi0p9QrYmhpZOIYOLKu65ru6eH+KZswrntGO+YaRDrxeR5QWDf9VVHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630852;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fAJq7EXcyVYcRu9A7PzZNeE9d/HTpqy+w3O9IhEr+bM=;
	b=nq8GO4IrypWgZQ/uq7V6ejFblpfeXZ74aL8g6vwUc4vQLhBw6bZyeOqBwYkLpX++265B
	 61f6tD6+K+66UdxHHpfu6gPW8sOrxr0kKup9jez3UMqSTcthJsQgZMueFdHDailePQAn8
	 QnBkHZVe9AwE9Hw1emeeumUjS1RpjuqHHm28ckg8rS5P1P+Sw8Sl55+EHStdA7PUJzKcV
	 pc4qLxmyyIjD5WXWEzTORawHJ9YysCWbA7oDaeS8Tg5OSMY3A3ipbeIdTURNtVCfVTGJ3
	 P9UMN2Z4og+PUrCGhZW4bnzmJHxcV8FXUmZaB+cnuCRUL7bOUuF86NOpxnyu5P32wcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UmKRDow3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0AD606A321
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Nov 2026 18:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UmKRDow3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D8231F000E0;
	Wed, 25 Nov 2026 18:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630852;
	bh=fAJq7EXcyVYcRu9A7PzZNeE9d/HTpqy+w3O9IhEr+bM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UmKRDow3tXMvX1aDiBykT2JoZN44WSpwEIwoalae5Z28uKImRgZ0d8l2+PoEa26H5
	 yhKc85Hkra/MH7ULTTWXwydkvfxfAYT8/UU1UTjxkey/IrFYhxoYGXcSEOaLbT01MG
	 PHOtITtFZxfpi5SbXe9SSSvKo1XQWw0YAK9N8p0tVQ+738RnMXVgs9J1iTBJIDw1sE
	 h0nfpmJ4Mw6qHxrA43muU7s+d4RVIc5J0B1zA4D4kFrmmgpLgOLUTJ7HiMfYB5VFGR
	 TKmZgwbZjyEytNqKD5cY1G3bDBL/M1J0szdlm1fpocnEOcndRCjhgk5jRgVflXvho+
	 uNsrZNn9C+73A==
Message-ID: <sashiko-outbox-233970@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (pmbus) Fall back to CLEAR_FAULTS when
 STATUS_CML is read-only
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arthur Korn" <akorn@google.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261125181336.3298961-1-akorn@google.com>
References: <20261125181336.3298961-1-akorn@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 18:20:51 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Some PMBus 1.2 devices (such as ADI ADM1273 and ADM1281) report
> PMBUS_REVISION =3D 0x22 and implement STATUS_CML (0x7e) as read-only:
> they ACK SMBus byte writes to PMBUS_STATUS_CML without clearing latched
> fault bits, and only clear STATUS_CML via CLEAR_FAULTS (0x03).
>=20
> During pmbus_init_common(), probing an unsupported register such as
> PMBUS_WRITE_PROTECT (0x10) latches PB_CML_FAULT_INVALID_COMMAND in
> STATUS_CML. When pmbus_clear_cml_fault() writes to PMBUS_STATUS_CML and
> sees ret =3D=3D 0, PB_CML_FAULT_INVALID_COMMAND remains latched, causing
> subsequent pmbus_check_status_cml() calls during attribute discovery to
> fail with -EIO.
>=20
> Verify on non-write-protected devices that PB_CML_FAULT_INVALID_COMMAND
> and PB_CML_FAULT_INVALID_DATA actually cleared when a CML fault is
> expected or cleared unconditionally. If the write succeeds and either
> [ ... ]
> and VSA), Renesas RAA228234 (isl68137), Infineon XDPE1A2G5B (tda38740),
> ADI ADM1266, and factory write-protected converters.
>=20
> Fixes: d9d30e1cb9ca ("hwmon: (pmbus) Clear only CML command and data faul=
ts during probe")
> Signed-off-by: Arthur Korn <akorn@google.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125181336.3298=
961-1-akorn@google.com?part=3D1
