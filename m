Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939490;
	b=yf2K0mkzQp61jQWysoqGsD/OjdO1zDvVAMe7iDWC65nv4bD79olW6NnuCL6vs+GZvxi2
	 xlI2ATdF1BDn+F2EbYZ6QP7qIyIQpPYQUrvk2RhTNmmdjmry3m9ph/TF0ZHwKEEMlS1IE
	 edufH2wcxf4H013n4g+I7fAFbiJ8cCQxHTq2qGRxLlIqhp3Q7S9KKjbtCPnIaZam2OqSW
	 2kUQ2EFrelGiqG94KPKgpKHEwUzA43bJlqLa9PsKhnzb/TlKlooJQXUkgzxZSo577nuPZ
	 wF33eB2Ab4aojczyh2BbaWape3imOHE1TJLwb/b4B6PcM7E66+4DmDmSkoxpWprWqaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939490;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gFqB+p8eU+ZLROM+OEBJ79FaMUsB4/xery1hgREUT1Q=;
	b=RA9InEzqZtaIivGrHjXP1PFqgQWgRaI8u92597wZCco38BcOcLRs+X9xiW6Gz2lneWgp
	 37ckltt9xk3kiR3W5JTDUbOJgJUhR4TRptpEcphzBp1QWz7h9iF3hc/oYBK1fdxgUBLAB
	 DPpIrv5+V+iNDWH1n0u8SZFN0VwJPC3u8Fzxq4JTdevGOnvewaM2lrihwijB1+70t1e3A
	 fg1NQmOc8kenq6SeSMeT1O0sdOyHtLAts5Kkvv3fYRPxtRP0tMF+ZNi6SOmZTmB+IHL4J
	 H5Z540G1heAPY83U/qSVAiGgH2+j+Jb4NEsfaSdxbldiWtEoLJwrCAODeowjC89dHgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eIAcQZ92;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7637F606A31C
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 18:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eIAcQZ92
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E96241F000C6;
	Tue, 17 Nov 2026 18:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794939490;
	bh=gFqB+p8eU+ZLROM+OEBJ79FaMUsB4/xery1hgREUT1Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eIAcQZ925ojpUxHai7B1oG/K3Z2HiaePF+17cgHgokt0YRo1qHxf4/j5C0cm9i980
	 baOJKjaS+HY2H6WDAKDK1cLmVdjulGESDNh2FFKzQUY97FCVbMUKojyjthiwrS+LW2
	 bkFH8mou9dghCtolz68E2FnmUExzUjjJE3UYLBY44X26H82Mf1AWIuVkPaLlnk7fad
	 XRooiy8rMa8I8IfREQX8qMhnk4559qNWM3M4y0oZW2px5xwiWEbL8otWGctG1n8Pm2
	 V1/FZFb+4MPSx7FWYcA/7ygOboWPQBcTbqBCCbuy7Bv5cw9vLXh8CHRwXm0bJmm4L6
	 DrJTNXPBpKeQQ==
Message-ID: <sashiko-outbox-219326@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/7] alpha: marvel: report environmental events
 without VERBOSE_MCHECK
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matt Turner" <mattst88@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261117-marvel-env-v3-2-0edc370fdca9@gmail.com>
References: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com>
 <20261117-marvel-env-v3-2-0edc370fdca9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 18:18:09 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-marvel-env=
-v3-0-0edc370fdca9@gmail.com?part=3D2

