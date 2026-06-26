Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212573E16BD;
	Fri, 26 Jun 2026 07:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782459068; cv=none; b=S18aClcQIZqalFvxlOYxCF3YxdZ/Zle8hy2ucLcbV//QMDNG1ctiXjiKIvpqHtvyq/3qfmD0bVPq3WdAoXx9jrXU3e4pjpIZ+eMRwbJFNq9lWACe216pprnr3gI8vCTpjY0ibFUet6UZpnkHgMBki2bVw/c13UGnQNJrwkeBkio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782459068; c=relaxed/simple;
	bh=MtVsuGt6ifJPmneb/OnjhYMrUd58A02hW5yWeCCVwqs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jiAPjNDCaRqs5s8NOQqvQ0WNoUYyhqmpK1cPA+5OmSbq+mH7TmSXFEs7cyMBm/BbvXNxH8BUDpWMhEs/g3ItsuWM7hHa6fZrelzzkNcxu2tS1Z9AnKQiPddoeqOmm5T5O23nhuYoF3OKzUx3zJ22iQMU/0I0iwJpCaOrTsKupqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iq2ixJw+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iq2ixJw+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D6281F000E9;
	Fri, 26 Jun 2026 07:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782459065;
	bh=MtVsuGt6ifJPmneb/OnjhYMrUd58A02hW5yWeCCVwqs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iq2ixJw+5tNwrFohcPQpop9wa2AyoqXAtsnpMQjpNJITtIVVUZbixL+t4GSKlVMpY
	 CytPKGQPUQT4sO18Kme84u6QeFeFV/5rWSLUT5zSGkdS45H9mKa6pRHdJrxHquxEn0
	 Wygpyf9A07fgyUOOGjRsbrsmoaZ7e6TAV2fwgdpiu60wCZ1nVJGijkGL7HxrUif6Tl
	 6+xit+i0jcKVu2r1kJBHSzFPACOP07XItzX66hm3Qzfu6f1GkTq2NgkrloM1/KfS7E
	 vGcEyLv8gO2O1XH5FuOPX9IUx6sinFitKyQiwXRm8lYSgoFcFOMspM6ZpN0U+lAEwd
	 lJjD+JLBnq/sQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/9] dt-bindings: adm1275: ROHM BD12780 hot-swap
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matti Vaittinen" <matti.vaittinen@linux.dev>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <2b7d5bb8cba773d0bba1d6779f0e6daa6a40eed4.1782458224.git.mazziesaccount@gmail.com>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
 <2b7d5bb8cba773d0bba1d6779f0e6daa6a40eed4.1782458224.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 07:31:04 +0000
Message-Id: <20260626073105.0D6281F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Matti Vaittinen <mazziesaccount@gmail.com>
>=20
> Support ROHM BD12780 and BD12780A hot-swap controllers, which are largely
> compatible with the Analog Devices adm1278. Main difference between
> the BD12780 and the BD12780A is, that the BD12780 has one I2C address
> configuration pin more (ADDR3) than the BD12780A.
>=20
> Introduce own compatibles for both variants but require the BD12780A to
> always have the BD12780 as a fall-back.
>=20
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1782458224.gi=
t.mazziesaccount@gmail.com?part=3D1

