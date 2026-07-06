Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3689A1419A4;
	Mon,  6 Jul 2026 02:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783304214; cv=none; b=VLNWEIQWfy4UPJ3tJta1byxnxeUrspPIbBJPmfc+wb9g1Cj9p+M+EN0OekTnKF9bQnr8F4arLT+vShtXSQWhw/d9jPFdOKXNsYr2NbOfFnYfEkLWSup5VJvXofpv51GlRb+8Bdu6zlFVN7Z72Zoe/zS2XXQV9NTHnibXloD7khY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783304214; c=relaxed/simple;
	bh=gq3t1xGdtybexj9Bd+Dyq7PvcA+eUfgNMGnI/tutgWg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jvdofwhMRonkClSoA5knq3P39poawJ3Uqbc1eUSWroQ3vvw9OrDaFYXoHHNhAGWoNm8sw5YrhF5xlkjb7EweJe/43fQWRqmBJpIOA8OT5XrMKXtTtraJk1nfUWMLn0kxWaw37vCwzp/5/VnU+I+TIr/55OtigpMlji7zygLABoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hdU5NrPU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hdU5NrPU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14F911F000E9;
	Mon,  6 Jul 2026 02:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783304212;
	bh=gq3t1xGdtybexj9Bd+Dyq7PvcA+eUfgNMGnI/tutgWg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hdU5NrPU5FsBzBO1aXzE4sA1vpnLVzmexJJ/Sbtdj38skWhOHt+tfx5Np3jTeV+BZ
	 jvmSnRFXKmEtuLrkNN8QVP3zTdAJ9YQAiBx1jSLmbNoq/3F12xA4dPF6wSRTqW23jR
	 QoRiykghBBD4bMt+OGvq/X7xBmhxCeKSPPV/Dbe2+trm1EjZmtQvBS5VUpIhuYzfVs
	 1P7oRCYYUAzxRfD87n1n0+WRa9WlMFgzciuhEbSG89tDULFYxD0vg5CLISzQk+sAkj
	 IKk758R981+iF91kG7iiAbO56glGhaKD4twcj/XCClIHhnY+ltTuL0UtVAb8c4TWIz
	 aTTE5zlufOBkA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: hwmon: (pmbus/max20830): add
 enable-gpios property and complete examples
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260706-dev-max20830c-v2-1-37761e89bb5f@analog.com>
References: <20260706-dev-max20830c-v2-0-37761e89bb5f@analog.com>
 <20260706-dev-max20830c-v2-1-37761e89bb5f@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 02:16:50 +0000
Message-Id: <20260706021652.14F911F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Adding an entry for the MAX20830 EN (enable) pin. This pin exist but
> was not included before. Also edited examples entry to be more complete.
>=20
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-dev-max208=
30c-v2-0-37761e89bb5f@analog.com?part=3D1

