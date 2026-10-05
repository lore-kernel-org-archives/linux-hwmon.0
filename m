Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C07B47F3D2;
	Mon,  5 Oct 2026 12:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203611; cv=none; b=MmubZIZiQUwY1k6+5qC+Ua0+1PNLFKN3BuA2eBCGCFbfA+poCKsGCmu1ipDsUOUrdTdju2J5sAtOGrUX10FvdW1RBfBrHAhevpcHiv9EYUL9IaWGqHTVrhV4ej5ARe7rqUWQM/QbK+bR1sxWQhP29ABbv1rD8CNJam1C5dT19Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203611; c=relaxed/simple;
	bh=ROggpUTf0sRg3+DOJSJbdXnv3BwVDfsa1cIFffTMPZ0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X5XQkLlYS9j8A7wmmn4mdD/qkDZAndXiwba5H/FS2gmWQ3/UHvVznWGz8AuBOanJrhXKTpLMKZIJDG70b1h/siKWIhFgcYar3rMvGO2vrKRBrS8UPjjXBl8F4zUm2rjTdTZJJTVf3sDNO/7HZgkefKvMi1vZvWo6EK1y8uEiEHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ea7CX0SK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ea7CX0SK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D45A91F00893;
	Mon,  5 Oct 2026 12:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791203610;
	bh=ROggpUTf0sRg3+DOJSJbdXnv3BwVDfsa1cIFffTMPZ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ea7CX0SKjviBGP7xrSBmjpUK2aYaXdXdudTJacl1n7r7AcmVC38MC077/3YyABfu5
	 Z4h9OfDl1wrd6j/v9W5ZZ9++RLjXjkYTnuPsf1dyuyWb3dGv1JzUzJAMLbgeE8L6D1
	 x93qLugsQMkjduDs96TivbYG4LVVOUA4BXbfEiJH8HrfDneLBlpWq/yE0wJQXI1B91
	 XdB4JTmHX51b9wn1ArqjHsFfKvpynL0kEGce0IAieMMfqyrjwgcS30JGOQSBxo26jq
	 F3ez8e9WaN6k4gaF0Dua3kbejEOBODIgTpgtZy9r4Ikk7vJnSPFMXAdl3cpOcn+9gB
	 XpujTSEcYpB+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 04/12] arm64: dts: qcom: pm7250b: Enable BCL sensor
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, mfd@lists.linux.dev, linux-hwmon@vger.kernel.org
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-4-50b9a8c730b7@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-4-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 12:33:29 +0000
Message-Id: <20261005123329.D45A91F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add Battery Current Limiting (BCL) hardware monitor node for pm7250b
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
>=20
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qua=
lcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-qcom-bcl-h=
wmon-v4-0-50b9a8c730b7@oss.qualcomm.com?part=3D4

