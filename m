Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E7F3FADFC;
	Wed,  5 Aug 2026 09:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785922336; cv=none; b=qQVa9XWpKV4u0s43hzot3gZIDmk7JCJkSbG1cYO7962Murvjq5a1kICbZYacQsB/hquJMP0I8h0WBEgxjoCioJoXPWmcuWK1TUanMd+EBKKTKTGmz2RhhzhOVXa0lJoYf2PdU1IM1WFO2xhZlw2L7F9rWXotv75QEDTAnehXglg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785922336; c=relaxed/simple;
	bh=QdfCNqyyyLMXzNDTaMtRolf/iimyFBbjnziRN2BsyR4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VXF9h8gwE1CzLspfy8G+Gyba612ZIpuqiKBRHKhhvJgBRc0+pilHdP72ZzUmVLSBDLd4F5ABlvSulYAGHOqEwbZ5do26em5Ggp7RFFIz5vA7BXM59kGofhZPx2iKCSVU23NxtTXd6Xk6asdFs3NEaaZyBLMjMnm0w+XtzNZrAws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y2sHehpt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y2sHehpt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04F171F00A3A;
	Wed,  5 Aug 2026 09:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785922335;
	bh=QdfCNqyyyLMXzNDTaMtRolf/iimyFBbjnziRN2BsyR4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y2sHehptTKkcQXYhWE4WPiveSqTxIwuT6P65sycjflXYl3vgsoFiznHEoVjrY1V3m
	 gi3e/Yyl77THdkmYqhfrtHcH40ggObJEPMAEc1QRHfFMR89x/ALvJuf/qtuxmTiUSo
	 ZuxX3dVf/B2aEi4pH8zNQxaeYziJYKc14j1H4PPImF4M4tcdYYUcH+tWE2jRIOGHEF
	 2xch6/Gfpz728bIkIeRpONNrGvRQVxFF9cZs0vdenwtoWUr2c8yTh0in6RRKwZxpzb
	 kmSoLOlF6A5OxLH/6KjazPT7bVrWR8rY8w4uKQCgX7k/i2DTsspU8bpEtnNr9kbjRD
	 U3zCzRlDDnQxg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/6] riscv: dts: spacemit: Add K3 I2C6 pinctrl state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Troy Mitchell" <troy.mitchell@linux.dev>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805-ctl2301-v3-5-b86c75d1c552@linux.dev>
References: <20260805-ctl2301-v3-0-fd4b8ffb5b0d@linux.dev>
 <20260805-ctl2301-v3-5-b86c75d1c552@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 09:32:14 +0000
Message-Id: <20260805093215.04F171F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add the K3 I2C6 pinctrl state used by boards that route I2C6 to pads 7
> and 8. Use a 25 mA drive strength, which is supported for both K3 IO
> voltage domains, and leave board-specific IO voltage selection to board
> files.
>=20
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-ctl2301-v3=
-0-fd4b8ffb5b0d@linux.dev?part=3D5

