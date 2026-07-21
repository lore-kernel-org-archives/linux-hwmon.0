Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E86439347;
	Tue, 21 Jul 2026 06:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784615677; cv=none; b=UKvItHFQUrY24Bt6i63WtLhaqy5YPhzHH8n/oqPa2rChkMkWK7lCFsqdH7R98MVaYTOI8S7MwIgB4fGskcgr5RBYFT5vkqBlC66394lDzU8fxZ+2Fcr7wu+pNY0Rk5A/o5gT2FXMGsHngs7mTMnYZZ+B16ADrCOze1tw3AiTw0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784615677; c=relaxed/simple;
	bh=wFV9yXbKdTlOzgAffEDNv4SaUusrxvc9cEVSIz6pG6E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OX7sSZpq9jmiAnKg2V4xF/WMuDJ8uW/m6unzQkJvqZXACj1MRr0rst3hsAPRuRgqWawhkRgTQEllcVwdjX1wbdKnSOJAFhPVdjbuYktsHo7x2BSuwVsqtSRaQt1L5OvdkG8ZhWP0yJBJnI2XNe5A8Sb2y1FIJ+DIoqqL6Vq9R7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SeiCETkS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SeiCETkS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 285AA1F00A3A;
	Tue, 21 Jul 2026 06:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784615670;
	bh=wFV9yXbKdTlOzgAffEDNv4SaUusrxvc9cEVSIz6pG6E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SeiCETkSPi7/6oE0WMJyl5GctXMn493SnXTAoeIm4msTXaVTSY1qntFpTQYTWOf9g
	 K9PWuEHNf2uBvzX6GXo6y0faOmPAc/JczTfBMcLZwldMHE5T89TCdCF7guWsKXHWZr
	 0VLXcHs5QKkBczts8CLwB8jft3QyCma9oBCLwB0BHIGBzGm6UoZ8NH5NGPcp09Lhmz
	 5Hr6vPVJtLbJj1jtKQ8L2MJFRLAjMSFr66SrqR95zXCQvRZGTMnWqQjoSe3PF+rkge
	 XPh+RkG7idf6+WGgnn8eo+Xr5MbKHZkFOGBTplVQ+QMLE+1dJzJQAJIj47yxCZBKfT
	 xlxCQ3DkcNMAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: Add vendor prefix for Kandou
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andy Chung" <Andy.Chung@amd.com>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721-kb9002-upstream-v3-1-70563922be8d@amd.com>
References: <20260721-kb9002-upstream-v3-0-70563922be8d@amd.com>
 <20260721-kb9002-upstream-v3-1-70563922be8d@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 06:34:29 +0000
Message-Id: <20260721063430.285AA1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Andy Chung <Andy.Chung@amd.com>
>=20
> Kandou Bus, S.A. is the vendor of the KB9002 PCIe retimer.
>=20
> Signed-off-by: Andy Chung <Andy.Chung@amd.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-kb9002-ups=
tream-v3-0-70563922be8d@amd.com?part=3D1

