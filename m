Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF8743B3D8;
	Sat,  3 Oct 2026 20:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791059244; cv=none; b=YKiphNJH4epKoi/oPAaSI132qktKbyjKiwFQiW+a4TpoAEyEb7KgG0XgdeahPNGjhO69uHlJ2Vn5KHNAitlTC0wC9ckD2rfbDHv7pM/+1XwpE3Vd5+7/+Yv1aIETtRlv2Ues0pF0c4hosHXZrYhQcMunCbtG+kSnqDQ4I+zjD9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791059244; c=relaxed/simple;
	bh=tUDVbdATe14w6J7quMFYqr17VgJltheJG1vcGYgkxMA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LhJvoeK/yq2gz+e1P07edPzcS58doTiM53xCeqVeMEvsr2oQULU+Eo7KrnXqKyHeutIY1equCc0WIbCbQuLasST+0RDVI5hgUIxxIAjQBMw8CqOC4b6eCV6yn1Ez7cIR6etCHJJOZo6MXQli9/pV0f3R9CGvxgW8NcdJf3i78qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UItJVW1h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UItJVW1h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39FAF1F0089B;
	Sat,  3 Oct 2026 20:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791059243;
	bh=tUDVbdATe14w6J7quMFYqr17VgJltheJG1vcGYgkxMA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UItJVW1hDB1x5ZXau+cNaONCts37/81cJI0/WA+NYz0X37ZE6AFB1WQ0lFEmv++uo
	 aoLdvClMPs6Vrj0+88jpJ/gT3OSBFL+mpMdWbDwbjEVxU8hmHwaEsmqP0XdLEajX07
	 wwmw/zFUILLZPleRRKJNu5a+8Va52mR8+PrHBvxytsn2uRGDAbSno8NjaSDJOZw73C
	 K1ix/JrdCP12bDUDORQ2aiHoNXzaI7rj/xDCFzxg2tCiU3tI+zFk1c70IIOJyy48cC
	 Ftiua+95FkXVK8c3aor5pibIFdq0nuU4OWuetlNPdp9vrOf9DItoH2++7ROPSI7u0V
	 778aGq+B1rXtg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: embedded-controller: add Lenovo
 Yoga Slim 7x Gen 11 EC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleg Keri" <okerixx@gmail.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261003202143.4697-2-okerixx@gmail.com>
References: <20261003202143.4697-1-okerixx@gmail.com>
 <20261003202143.4697-2-okerixx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 03 Oct 2026 20:27:22 +0000
Message-Id: <20261003202723.39FAF1F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Document the Compal embedded controller found on the Lenovo Yoga Slim 7x
> Gen 11, a Qualcomm Snapdragon X2 Elite (glymur) laptop. It sits on I2C at
> address 0x70 and is distinct from the Qualcomm reference EC that the
> reference designs place at 0x76.
>=20
> Signed-off-by: Oleg Keri <okerixx@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261003202143.4697=
-1-okerixx@gmail.com?part=3D1

