Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB9F37C902;
	Mon,  6 Jul 2026 02:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783304096; cv=none; b=ZfDYZKZKUvMXawgw90Z51aL8DOHo6MC3N6uKpzPV9LmbrQ6/gquFpMg+XiL7Z1GTjsbgLnXfhMzMXDrFctABvXCZeCdKj36Oe8HFply9PeatJbbLlDGfAcFPDiHUV8WiUkSkrHsEU+r0VbBXmhQsCPDYuvLz3i52khfFI/WWlBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783304096; c=relaxed/simple;
	bh=JlC+aU0+vsAhmSxVH3DcC/KD3mqUUZK1Wsve9wL7oCw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JOsB4O9lhMDuYKpZpJLBByKXYSaobPlXZR2SvmJWeduPtRRR6EDiNm3AxVlC6HURJXvOAgcPiDq08Ju4MnN0c0llMKPJPonQAIQQZbSU5712yHpXXOtuTF1PeacPFaZirLHy4zwyRNHm+xy+NDtEknYE/csni26nrwHOHBvOaSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dqehdJ+7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dqehdJ+7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE35E1F000E9;
	Mon,  6 Jul 2026 02:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783304094;
	bh=JlC+aU0+vsAhmSxVH3DcC/KD3mqUUZK1Wsve9wL7oCw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dqehdJ+7tmxPWU0z3gRxYLTb9Exrdjr6n7GGPfqprMqFYkJSC5NtllGsLbDI/IKeh
	 dVh1XcgA8VQhgXt0fX0r9Pzh/cjReLX7qyDLc1MnWvgrQVNUZHRRNXzMt+lLdSktN7
	 TJvy+GbJEOKPahM9xSHaf1qidc1HzcOPwQU8aH4T4ZdZOQbhK0CH3zbWfWEzeZAKLq
	 X3lga2uhFxHIm+OYq5dcCiNj0HW6Mq+4tYaO6z1nVqCFouUzAxkco4EUPmu4fEoiNL
	 9bzGh9LIr5O/bywJydTOac9m4aOJCwmJmyOJ3HkkUSeOkXPtDmaGy2X7Q1OnMfZyBj
	 zJqKJRPPsRHPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: hwmon: (pmbus/max20830): add VOUT
 feedback resistor properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260706-dev-max20830c-v2-2-37761e89bb5f@analog.com>
References: <20260706-dev-max20830c-v2-0-37761e89bb5f@analog.com>
 <20260706-dev-max20830c-v2-2-37761e89bb5f@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 02:14:53 +0000
Message-Id: <20260706021453.DE35E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add adi,vout-rfb1-ohms and adi,vout-rfb2-ohms properties to support
> external voltage divider configuration for VOUT sensing. When the
> desired output voltage is higher than VREF, a resistor divider (RFB1
> and RFB2) is required to reach the intended value.
>=20
> The properties use a dependency constraint to ensure both resistors
> are specified together, or neither. This prevents misconfiguration
> where only one resistor value is provided.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-dev-max208=
30c-v2-0-37761e89bb5f@analog.com?part=3D2

