Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873375;
	b=igEfviKs5Yp0zw3gbXLZ6GJzRtdnRz93ohADcIPXhNwIiUZLwR25bvCzi1d2/puTWE/r
	 LuP+vLye90/ajTIHy6klJW1ZnGJ7OHbPsMhQJW3XKeeR+k7/rsRNRJVLQJX35Ro+F+ERi
	 IN21Af9dwRmzQzT3DFZ1WhtP4+ofU4uZYd6b+I2+3h1YGSFqaeHY6ZfkpAKrfqOIjt12L
	 tUbxQ/GpwTqRHLRY6e2oYsumfVf+KKLkGCR8Yu9V0aEvaAa3lN2qZzqZ6GcJj/kqPgiSF
	 FswlHEWaFwtNQkr3xjnLxKs8+OTrJ9czgZhO345raXYnQLwiSxmbWbejsDN9Pv2YO9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873375;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qguxMvBRT74W+KgwTKeeLVtpYG6Mlu99zyyaibfU9XQ=;
	b=ftcChYm4Njiktsa8c67kDqpf4KKgqTmPOIld/LCmskj1OT87qA4RjvBKPeVkzhyM0FwR
	 SJOuPdQ643MIZ7fvOhe6BpCfcRMb41b1iVPfjlg0+XLTLB2F9SY7KEk7E1F1hCqoXGMrU
	 r/IQrf2AGyGqoQuhRr3JJBhRzHm3ekfvC6xK+kCmnGI6O1/f10/IjH0OPKpGdQ2pp3jyg
	 qpaOT8iooopqmtf1WOH7zm9xBkKP72/lvr2v/eKblwRBmYzZjdHxtdwoXo6nWhEf7NSqz
	 99C9InEDk3+xby0D4JfJ0ffEoW3d7/SUOafLhfj/kYJyJoSogvjq4WZsa3O3gAOkheA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UxVD7PZU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1978A606A32F;
	Mon, 16 Nov 2026 23:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UxVD7PZU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FB1D1F000C5;
	Mon, 16 Nov 2026 23:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794873374;
	bh=qguxMvBRT74W+KgwTKeeLVtpYG6Mlu99zyyaibfU9XQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UxVD7PZU4ECklIYtBgGaHLLGryJIP9a/lYGhwpXCBq+di6OhYikhKPFeSzLZkssEe
	 lIsKzGnncIr76j9mT/0+1mNlu26z+z9Q0FNAA4Td63xCWfbIZuGdi32T7nz9ouOkxx
	 O2XX2dbQzd3NIamEbdEGDh5cCTCYijebYT4YPXV8vwz3ep5bz09FKGwoMOm7MDMciS
	 JkPQl3Sq8e50CDL7mmMC2T3H2tSQoBvy2gAocz9M4Ugf3WdG8F4W1FuLEE6zfeBN/g
	 1YnOk8b+OEPQ19aloaAXbs5dlb6/JtYmeclzcgtxVfxDA1hwS4X8vjGu85iee90PdI
	 bfaipmL04amHQ==
Message-ID: <sashiko-outbox-217945@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/6] pmdomain: bcm: Add BCMBCA PMB power domains
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, linux-hwmon@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261117-xg6846b-bcmbca-xrdp-reset-v5-3-f584e8b8e696@kernel.org>
References: <20261117-xg6846b-bcmbca-xrdp-reset-v5-0-f584e8b8e696@kernel.org>
 <20261117-xg6846b-bcmbca-xrdp-reset-v5-3-f584e8b8e696@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 23:56:13 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-xg6846b-bc=
mbca-xrdp-reset-v5-0-f584e8b8e696@kernel.org?part=3D3

