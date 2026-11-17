Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794877515;
	b=Qyh+aSTl8sdHToYaZSw+YMyCAn2CRxcYvKuQQJa31H+yAuGJB7Xi8m8nKRfR/4kbD6Kv
	 sROrrcXwZhcFi3XWmHEjjlg8NBsbOckB1mKZpHlF0WDfie7tLPJv3dYFW7r5S2NkvE7IQ
	 UveMdTLocYLvKagK0CHUHoiMjOyB1HDY59qEAONLi0jfS0jjG4wscLHk88dkOzbQ8q0DK
	 rnYe96jXxWUkll0k1HfzIaFd6lWslXSxH7Lf8BdbqK5DPNupyxSFH+0pWgIrC/Ff8InsO
	 a3ZoEY11N7vGUKLWtPW5mhZtBy9bV1+P4GxwdBj7bW2Lx8Rg1bi4DYEu3PXMbsPpE2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794877515;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=lHhPx45EzMrHgV7McmNCL88bK4Z2K8BRykVtkSy5gkA=;
	b=lOuMveeZuDkm3VltHAdLfbCt+1SGffxPIYAu10SjG4wovTrX/psezItuqoHuqJpMDrAI
	 S72IHGEi8LG43BDWtijlx3HrbmpL1WN+PzrcGz7LPt9F61gjZ08XEM3yVV4O8RmA37I5I
	 ty7VkqH6sILiZ1xBnFxvwiV1UP5as0IoiesyW3qp2wQvaC9Csgw/HZnb+eX0148AytksN
	 szrPMNm3pS/v277B7nkE46hesLSGGawh0KgWc570go+mA5BH7dRJ45JJLlOZ/g/ROQdkP
	 HUQU4u+9QGFhUNesrVN+bidtXJ5ua/s1onLFWrkUxvYWSbT86qH9BYkjFpalWD1sJ7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UpHI11Gz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAA260A2620;
	Tue, 17 Nov 2026 01:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UpHI11Gz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B18391F000C6;
	Tue, 17 Nov 2026 01:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794877515;
	bh=lHhPx45EzMrHgV7McmNCL88bK4Z2K8BRykVtkSy5gkA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UpHI11Gz5lGa8oZjNxbsZaO0jSPDd2nrqjnWp0BekzOTz4UVw/NHcvyuYfCoOWj5S
	 nsNvtxWb6Yv1WjvhN7/un+G5ohWnpvzkarNC2e+8FcI6saGk47uCg0/3+LAy6LvZDq
	 7C7Zzs07ubmzzlwvd00RtBrNRHrsOINYR1upCr0ooa4t204YPg1ShR50izJKwUkHu+
	 PWkycck1Ay1lcLRFPjogt2qO1BlJ6qZ1fOsgjV7H1Ac90u2tWRfO8X/vdT3HeYaCOf
	 6HfsZ//gUASXgv7N9UOT3jvQbdFjgC+O/9QaSnN7aQZJFhokWgVuyhX9u1+pue/tY7
	 q1EwTBsxDC4jg==
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
Date: Mon, 16 Nov 2026 19:04:47 -0600
Message-ID: <179487749308.432567.16654659744519848527.b4-ty@b4>
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

[3/4] arm64: dts: qcom: glymur-zenbook-a16: Add Embedded Controller
      commit: 9947a8980a94319aa4546407b656eb588c9dfcd5
[4/4] arm64: dts: qcom: glymur-zenbook-a14: Add Embedded Controller
      commit: 2622886dcb5fcc519cd8e697e35c476c1b46392f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
