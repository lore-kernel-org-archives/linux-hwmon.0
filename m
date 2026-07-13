Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7AE3932CE;
	Mon, 13 Jul 2026 07:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928873; cv=none; b=pedhKOudexDuR5+WWqvzBXDBz/0vMWX2pvvz2MqpBsHMCb9kx0cjdLanJU4aE5rB1/Y5fOZgqbAEMBsrogOwoclFw3YJpdoFDGw3kjA+D+ynQUFnzp557n5Vi7Fo19LUoCghUv+2LQGZhr5wMpQI0y+98gJSa4PM7iCvuDHz+uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928873; c=relaxed/simple;
	bh=p7j60HNGlQV1622NC0FlOoc/pfLbyzh9GrCDTVfcgc0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EfrF/Nl+4OAENYfdNDCIWqAHCV81+pvjsQtqiZBNxRuojRaDyt9GM2EqGxVt1sxJupNXJX4dbMQjbQaxzbGmZjRZJse0hZ4lmz5N74n7AwM+4krcxIRY4n1Yz9txjuPZZ5ugc2d7WIquL4ME89UvNXgUtXFrwIdfgOWn5IQt1e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aEJ84mT2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aEJ84mT2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3A961F000E9;
	Mon, 13 Jul 2026 07:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783928871;
	bh=p7j60HNGlQV1622NC0FlOoc/pfLbyzh9GrCDTVfcgc0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aEJ84mT2p++8/0FKqBXwG55VoP6z2yDsREfuF+DuHWYCzmckhumsJhc6t7P+jN2Ke
	 zTljAfe3QuNm4nDeCCybBR4h1zP/EgVQ5qFnV+YY+LIiUYaW0i0lg8LvvUw31vGcHj
	 BrRu1iEEykOlO+uASiGBvEHZLsbUB7XmG6i++QyYNLaV4fGA0Cd6G5lZSCaft1JuXS
	 rg1d5D1gYKjOt+JASRhb2NBMwSwHSKm8VYPOQDjrgvtj6qpw49dXAoSd8IYDFqA2h0
	 e5CSNYDEw9SSYuxWD9Q+2vShygKPNFKobFf4+MQV96ez+8L15z2k3YVEzFuFeDLnu9
	 QvMOA/IphEUtw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/4] dt-bindings: vendor-prefixes: Add GXCAS
 Technology
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zaixiang Xu" <zaixiang.xu.dev@gmail.com>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260713074559.12196-2-zaixiang.xu.dev@gmail.com>
References: <20260713074559.12196-1-zaixiang.xu.dev@gmail.com>
 <20260713074559.12196-2-zaixiang.xu.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 07:47:50 +0000
Message-Id: <20260713074750.C3A961F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add vendor prefix for Beijing Galaxy-CAS Technology Co., Ltd. (GXCAS).
> The prefix was confirmed from the manufacturer's website:
> https://www.gxcas.com/en/index.html
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713074559.1219=
6-1-zaixiang.xu.dev@gmail.com?part=3D1

