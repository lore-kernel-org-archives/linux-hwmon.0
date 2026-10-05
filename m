Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9346147ECFD;
	Mon,  5 Oct 2026 12:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791204243; cv=none; b=hzkNHw+CsrYVTlHEOP6ENnXk31PKD8J141frJUGgwqkLugrIG/asrhF7g2mA+bKLcdb8f5xAiW5Tc3L5cno0acIm9fzYsFUKaWmIiYs7xZRZjyKvnpx4haA9w3ztXY7lHg4KQEDf7swY9yOKW79FzOVnJFiR2XqQCYhQpu6vlM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791204243; c=relaxed/simple;
	bh=LGKOD8h4LqaKyXZDr5pYBUkt6cd20P7/qWcy+dXVkzY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CWnKHGptjpzdogIbVEL6zsAtvq8cUImndexRGYBmcW6riU9t9zqC9ZDFNvOhNkWHUaqJAlVUIoyI/kkQwj5tdg+uT1TnKbkSO212fOuVzntzmkYQ58tjXdwfN4U84kuOfTvFBvJ6xZgoAucame+F6bjGA07BSpW6QqU3JUyppLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xwc+JulV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xwc+JulV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D93AD1F000FF;
	Mon,  5 Oct 2026 12:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791204242;
	bh=LGKOD8h4LqaKyXZDr5pYBUkt6cd20P7/qWcy+dXVkzY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xwc+JulVjIfzv0TVUVoSTBj/Nmlf2s+Es+bh/A/gka7bmC2u6k0rcqdbITpNcOKn+
	 /jsTCqvR0An2SerVeMNJlFKRO+j4B1BwQ0yQ/WEgrb9rrfQzhEq4CgMJ6fskrJzXLA
	 iny6mVe6cJdkqxV95aKwRkP8aUnP7ioqX9AB2Y9XZd8837iZTYjoAOzQojp7bA6Osq
	 b4x0xVAaTxFThzAXve6z0pbsmWvNZXW0QAN3G1wO4tvAW5ZPL+rCRtxRlY/3p1NZ0J
	 yc4VijHW0D96rXYeKe4QlxmUHPpvB88s0KkMgP61IplstNTq8Z++Xc09rreknfd1Nu
	 A5JgSV6IX8LRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 10/12] arm64: dts: qcom: pmih0108-kaanapali: Enable
 BCL sensor node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, lee@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-10-50b9a8c730b7@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-10-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 12:44:01 +0000
Message-Id: <20261005124401.D93AD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
>=20
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qua=
lcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-qcom-bcl-h=
wmon-v4-0-50b9a8c730b7@oss.qualcomm.com?part=3D10

