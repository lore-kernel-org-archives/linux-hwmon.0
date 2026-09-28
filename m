Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C84A497391;
	Mon, 28 Sep 2026 10:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591834; cv=none; b=DKynTpRyYF45Op4P1TG5s+z4TW61VD1TtnNB27/XvZ0TCREnua7GT1EZOOVtReICBg4Sq34mlPAhF0ma6QLyGenfce6o9o/vr2U25MgaBywrp7M/ENToBIx3Rf0VayoS7muDPWwRuPOg4aqp7cmcSB+624pEWu9GXDsinsLihns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591834; c=relaxed/simple;
	bh=ljV2kENip2Jn+BCNZxVV5V5WkDRGmh/P8NY+wm23J7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qq8rZJMslNiG5/nkSJFutfGt4/E8sxS/B4aCc8GKLYi+rn9utToQl4Cs9/F4ImM6HDsr3eyPHG2G+p0yn9N93T3r8uiDjdXCw4MtQ67OORGVPNai6jJy/f2Otnl/P7A9NHIPzZDhKR2eVLl2rleT/PMjN5tyJ6+y1SaK+dauVWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H4nQVKJ8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H4nQVKJ8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFF051F000FF;
	Mon, 28 Sep 2026 10:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790591832;
	bh=GEFDwP232FyUdz85KGmfq6sYsFS8X1mJ+FDlSpNLi3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H4nQVKJ8u4dc+kt5wYGxKwjoPNSl69ZN6KWtjNztz8yIhTcZFnsRt/KzT/iKsOuux
	 SuPGxOpOVwAKXqLFvBywODUWWxVJnrwGYin1n2Mo5d6nZNtATAEV3HsTTlgBqXKoDf
	 tF19+uBKGd7oBk4UnB9B2dk+HxBrCPPRFIewY8mHzPyvrzYY+hWgpexmI15ZubLtUy
	 K33u4L0KxL2Vi07rZKlEEThMF7ErAmr5KtGlzyhe0gmu9NDSmwgf5RsV0wRKHNRKkA
	 q3cG/i7EdvmPHICQYl1i2lnO6mH2fjXoB8X5kxXKSFrSFFvMib117sTy8AlXcNWu5j
	 qGvD3gKxK6dxg==
Date: Mon, 28 Sep 2026 12:37:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Guenter Roeck <linux@roeck-us.net>, 
	Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: embedded-controller: Add ASUS
 Zenbook A16 EC
Message-ID: <20260928-miniature-orthodox-ibex-d5b97f@quoll>
References: <20260923-topic-asus_ec-v3-0-2bf3bb9da879@oss.qualcomm.com>
 <20260923-topic-asus_ec-v3-1-2bf3bb9da879@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260923-topic-asus_ec-v3-1-2bf3bb9da879@oss.qualcomm.com>

On Wed, Sep 23, 2026 at 12:14:13PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Some Qualcomm Snapdragon X2 Elite (Extreme)-based ASUS laptops (at
> least the Zenbook A14 and A16) expose a custom, somewhat
> Qualcomm reference-derived EC interface. It allows for fan speed
> reporting, keyboard backlight setting and receiving of a number of
> miscellaneous sideband events.
> 
> Introduce a binding for that class of devices.
> 
> Two separate compatibles are maintained since the two laptops' ECs seem
> to be generally alike, however assuming full compatibility with the
> limited available information does not spark confidence.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  .../asus,zenbook-a16-ux3607oa-ec.yaml              | 64 ++++++++++++++++++++++
>  1 file changed, 64 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

