Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795456974;
	b=L0wf/QuZrQdtFXgs2QRj6HOeEowkcli/2Ul+2eZ1PW64EdKHydhYYqiZNwPnEj/Qvlnn
	 qprewCDSeizhUj8YErw3bnzDKMTnuJVZAYSs9I6wwqIYviHuHRGbanjBufva696YHHTV5
	 gOOQKJFZEifBmsq7/KY8EfLTR/R5VU8x3lbo7kgoq4Dd+ci/v3G0h+no6jYZE3luef68/
	 zvu5dgBtWjLF6vuiNCfcmOVNCuBjETN4qMQnNO3QFnw1da/u3VWQsFr9kWhRKry7995SK
	 Cnmga8TmU8WW5KT92fbFABF3Uk0/784m8VLWorvEPq9ldhOqFmAi14BviXQPq0sP5gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456974;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=M5iX1YKL2KxCmveOBaVKHN5qG4WwwlYcI2hXyUNoeG0=;
	b=F3Of0T5qY5L3p2KS3YG4QbHZIWnDegAexTelt5fgElqQW5Zef0rVqB7d8ROhf+4krYCc
	 e2revA5y07ouBbcD83PHNxkV4aYUf3ocgj1f9IwD5C063OiuG9lLCBMYW+6rVLn5UGm6l
	 NTmIYQGBK10bhIj7RuP+qSO57pdp6bU1hoaRGq4/Gj5XiDt4u8PI7Zd/P4vb12PYF6bYu
	 D5e2tad8cZJz1TPNIzwT4RN1SUq5GZBXdnW/ziGN8Bt4sOSMYysfnKpGgtVURMCA/qVgc
	 2AVBUG62FUS5dgs+IlujoZJFzdMP6gDpIfFC4GslajT7Du6WKHVwa/oQne5/Z/BeqWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ia8Aa4L6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24065606A32A
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 18:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ia8Aa4L6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1E051F000C4;
	Mon, 23 Nov 2026 18:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795456973;
	bh=M5iX1YKL2KxCmveOBaVKHN5qG4WwwlYcI2hXyUNoeG0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ia8Aa4L6yp4Ov/yfbWJo6r4PeTuk38WDW0tseWOG/+P7/xsB6rYDi9MNbVHB2Qdku
	 OM36k4G0DXlUrzWZyG0PO5qJncUZOnYprL+ZN/Ez5DxI+L8k3WsQFJfIEguSILij8L
	 Qnl6Yf+lhfF/5jCnaANiS6pwRM64UD8eykxvorJHUim1o3uQ6YbwLfQZjA8sPITFqe
	 xfaF51KswkeU+dvW+VYKgFcT5YRKCLS5C9Z3n5sRdmTIcXlj8D+BnkLkd96f5963/v
	 zRk4bh69osMZFICjA4g2iyiS+f5UTIB+kZ58WHnzvc30IIWtUMjD7QsG3/TiI+s4HQ
	 XwMBaRv5/u1ZA==
Message-ID: <sashiko-outbox-229792@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 0/3] iio: adc: add support for the MAX34417
 Four-Channel High Dynamic Range Power Accumulator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261123-topic-sm8x50-iio-max34417-adc-v7-0-d8f87edc5086@linaro.org>
References: <20261123-topic-sm8x50-iio-max34417-adc-v7-0-d8f87edc5086@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 18:02:53 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 3-patch series:

- Patches 1 and 2: no issues found.
- Patch 3 ("iio: adc: add driver for the MAX34417 Four-Channel H..."): 2
  potential issues (2 Medium)

A detailed review has been sent as a separate reply to patch 3.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-topic-sm8x=
50-iio-max34417-adc-v7-0-d8f87edc5086@linaro.org
