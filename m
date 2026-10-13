Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317B530C606
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Oct 2026 14:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900735; cv=none; b=ZNMXboZDrXvhBaFx5SZXhoSXTF8xqHU4NXoYDwMNLmag58/hzn9zey6mXT9IqUy9Oj1OwF9WWHvylNYRvRHgV1tcc8N8yNnR8YyLak5Qzzm3F/4CsLPdPG0KQOQOWwdaKz5vvsYgpmmk9tZsO12+4n97AMz/UvVuwRnKIvEJNik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900735; c=relaxed/simple;
	bh=/xB0uGKdVs0ZW8Vx+2oNR6BXuvpDPkHGbdw0uEbdL0Q=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=JDi3nBRObfqC2Rr07d1e6lWnwBkevBRDIv9oOHgMtfqzEVnRNuz5gwo2yd0kQapLedo2zo14hCve1bapXP5wS4dqHZfN47Su4OMJFPb5nKQr4f3az/CpYl5txTXZUBHjG/WHMe29Z27sgjWYULRoxbbr72wVuiIOX4aMIJPhA3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lryoQgwW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lryoQgwW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D77E01F000FF;
	Tue, 13 Oct 2026 14:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791900734;
	bh=/xB0uGKdVs0ZW8Vx+2oNR6BXuvpDPkHGbdw0uEbdL0Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lryoQgwW28lyPBXczqwH/vaxYodEhiLAlrCnokqBaPUrcf8QIQBXr8P8a7JQFW35l
	 3r6USDq9Qkt1r3NT8Ry4abHQ4Y5Oev0Y+1fQCfSYFZqgu/f0HwkUV/Jjk+XwF3t0IA
	 nTFQ7XZkj3x4cobudIIe5dDd+OBCZWOTHqRFuYzz6pjLHZFHH7iNP8HpmFRt/yLnlW
	 lWHQghOhOk95Y6GhH6ulv1Y1G2KvL6DM3+jeVN+rNeVUqyH52twsl/ekBIrjqVk/gT
	 YGjnZd2Nh4bnRgV2UdFzUo9+L78bgbLrVRURYCvNLEKUYQO5BdGfv5DlYIWgTPQPDT
	 AKH+QwD8d7NvA==
Message-ID: <sashiko-outbox-169888@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: iio: add: document the MAX34417
 Four-Channel High Dynamic Range Power Accumulator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261013-topic-sm8x50-iio-max34417-adc-v3-1-d3604ae4a229@linaro.org>
References: <20261013-topic-sm8x50-iio-max34417-adc-v3-0-d3604ae4a229@linaro.org>
 <20261013-topic-sm8x50-iio-max34417-adc-v3-1-d3604ae4a229@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 14:12:13 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Document the Maxim MAX34417 Four-Channel High Dynamic Range Power
> Accumulator used to monitor power consumption of portable systems.
>=20
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-topic-sm8x=
50-iio-max34417-adc-v3-0-d3604ae4a229@linaro.org?part=3D1

