Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269942;
	b=Ri5tZ2k+MBNtiSlBOPFXAPM2XCTZ5Cp+f4PtYcGD3EapF4GJB6k8Fvy+rC5n+q85k5k1
	 iCYtOVkHOTHCGk/DxiJdFzWxYo9Hgc7U5KH6BuABaITMofh7lpxsRvgco5JxdMBZklxG9
	 yvs6hfoQmQyod1ObLmBziB/cuue/8I1WL/qlfKhnzTWTeK5HEnsj6rnYTS848uDBId/D8
	 RrHklGGTTT0PwJ6kMSI/kv8ZAIKUWP+SoObeKEl+OXLV0Ds7ajuOjdiAnA7gGCVfFrI4e
	 d96v9Jx6tsRvy/Cxbsz3WFLNX9j56H0rk0bPvy4nto2fsFPImyIsawQaJoC1ygl4siA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269942;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=nysLrwzoQAe2qw/VpKL+Q2ul7kXLQN9mYGdMAz8BYVU=;
	b=404zQP05g7taUiKVDHCS5kZwGp/s5ImcITqrfnVYZqNqUFVVN6Ej4DvGU6JlrObwGUxd
	 Nobh1jEHznA9kmTIP88vg9G9E/7tMpSWF2/GXQeqytoo/xy9PBK4q50Jvzz2GDvFqEfHr
	 6Zlub1PLZtVvALoUfaq0JcZOIWQbhkmWT/9Hwt6EqMPF9KpyR+75MKgCGKguDcOOzlSLR
	 NjZsQIjvMR4GCztr6EraBomNUjjRA5LXbjr/yDJUh+ar1odhpsImuhUiLkO0fXDvtd3QT
	 2oiI6ld6LNJbOIYDr3nLTs8jOhSDS+RDgbNBIaOoN/M8utWRf1pVrOd+g/TviTn7VqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TVQDjg7p;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC40606A333;
	Tue, 10 Nov 2026 00:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TVQDjg7p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 929A51F008A3;
	Tue, 10 Nov 2026 00:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794269941;
	bh=nysLrwzoQAe2qw/VpKL+Q2ul7kXLQN9mYGdMAz8BYVU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TVQDjg7pbClHUDJ/j+YKSQ+slS8aD19hQ8/hBTOCnK4pvJJGU8NERUg9JZRmAu6if
	 8eHt/MXF/7GH7ZGnWiB9tFbzfTRnyioW++FE0wjg5WJKyuC5fbHLD2w5ttQYWO9c35
	 B1tqyUcR3ypOnP7+Sh/a759mKfdeAaZJz0NJhTYsJO+P3AK6rCUc1+ic1GfS1L2f0L
	 3d21sopk9eQ0RJhDJYIT6G13dMVj7XvfKXRsAFnfI2YhEA9MtBA2jyU6PJGe3EAagd
	 1PQzYPMFlTnTOCQfODHmG1nrBlRNKxEgZqNZ6JTOvk44OXLPE7SuA2vTWyrNFHItfV
	 ZAk31ZBeq0egQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Abel Vesa <abelvesa@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/4] Asus Zenbook A16/A14 (UX3607OA/UX3407NA) EC driver
Date: Mon,  9 Nov 2026 18:18:53 -0600
Message-ID: <179426970779.877162.914179721642251304.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 15 Oct 2026 10:55:28 +0200, Konrad Dybcio wrote:
> The Snapdragon X2 series-based Zenbooks come with a bespoke embedded
> controller firmware, bearing some resemblence to the reference Qualcomm
> implementation (qcom-hamoa-ec.c), albeit with too many changes made to
> consider them anywhere near "compatible".
> 
> This series introduces a new driver to let the user retrieve current
> RPM of the two fans, the temperature readouts from 2 temperature
> sensors and get/let keyboard brightness levels. The driver also
> notifies the EC of system suspend entry/exit.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: embedded-controller: Add ASUS Zenbook A16 EC
      commit: c9970526e61a968381399cf556789123fe67ea5b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
