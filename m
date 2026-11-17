Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884616;
	b=5Y8Jja43sA/9eqNA5V0VCktsFvSB9JEITbV9vGPQo/qN6QBiQ/rfIVpsxKmzUMXbPpqk
	 Ns1vSQ+Oodi4Xu7mb3l+SePqIb55Nybh6M6pbHf57y5Yzan/DDjp4PHR4Ft5Kz+wt1r1p
	 JHxOc+qylLsKL2dK3CE6Jj7EuDHIo/eIufey/X37SA+SlCITR9PDMzXRAKGNt9O7H03W2
	 unQth5pxrTs8KVoabz0gBD8GHQ2Ts0EIf7XhOTa0qcuBn6EEz6vCdlTyLbi307zG3BM0R
	 i8zJg+nfq2Q+LLh3REV0d41+a+BYS/ewIiHA95/FFZ+8RFk7c38ETGb9apTQONIzmdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884616;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hkgNANFqo/sWawUMuvOxSSH37a9Vpmns1WeewVZY/LE=;
	b=zs+2ZvfW7WBH1sjPTUHyfdRt35Yw28jm+UwYqPBZqDAZ5pJxsjJNit6E4wVEvs5cYr5f
	 NmRGAQ5PS13VJhYsqlir7ToUxL5P6P6x9UxSWZ2YXUxgrxsBBDcN6rVweiXRqXqMTXLsM
	 QcXGc5ohZess8sXSz9OOjm7eTK33/szAWUcM9+UrTvXhstebNxNmSCHWjvNEQP27ZPKWc
	 0spMA/kQa628l4eUbQfGcrmUZFBcGJa84036Wl6UxH75NJ56wyDukLaBZCJ8fw20TUFb0
	 UfqBVAvqUeNmoMhnmj+piq8zwkNCLwUjeYWRPIw+Zt+E5o4IEcfmdy9UddRhGGoW/mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CIlJca+e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C14606A31C
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 03:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CIlJca+e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E3D1F000C4;
	Tue, 17 Nov 2026 03:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794884616;
	bh=hkgNANFqo/sWawUMuvOxSSH37a9Vpmns1WeewVZY/LE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CIlJca+e/FuewNrMJpOocZIRGpSsTyDVSS2oDeNNkvpaFCzWehXlaJiHi2J21h7Rv
	 sumlfRvrgLJcax2aKQeZx1MQEqHG2YkWNRvO+tlfRnF6pSAP3wvOWWAckdC4mpoYgi
	 hDgv4JB7paQummvLCPhuhD6BBQslPHERm4M73yWU/9bbE9/xdOTuUn6Ci5LIaCBNRR
	 bOuIxhzRGxk7Tp8Px3508+RMLj0TPhMHSn7wXvvO4KYatv4rKwoIgucXSEJOlxgUYy
	 1YwnLDcQ1Y35RCSuqTFWddSJhAGWTGAGeDizUMGtwY31nEPyJXxG/WnuYLQIHQOmWG
	 T34bMaG/5i3mQ==
Message-ID: <sashiko-outbox-218114@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/7] alpha: marvel: report environmental events
 without VERBOSE_MCHECK
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matt Turner" <mattst88@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261116-marvel-env-v2-2-ef614eb2e7f1@gmail.com>
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
 <20261116-marvel-env-v2-2-ef614eb2e7f1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 03:03:35 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The service processors report temperature, fan, voltage and power supply
> alarms as system event (0x680) logout frames. The frame is already
> classified as reportable, but without CONFIG_VERBOSE_MCHECK only the
> header line reaches the log, which does not say which sensor or what
> happened. Print the subpackets unconditionally.
>=20
> Signed-off-by: Matt Turner <mattst88@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-marvel-env=
-v2-0-ef614eb2e7f1@gmail.com?part=3D2

