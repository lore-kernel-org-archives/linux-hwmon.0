Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C88E4E431A;
	Fri, 18 Sep 2026 11:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731265; cv=none; b=CnO3UFvIdNhkGojOKLn+HfD8FDrmJcyiFIKxGhlBf/P1dborW6GpOk7uPsCIcoElAP4bY13Hc8rQfIiUZx/O6gfe3kmu3UtjOAzC2cEDI4L1muQnD2Bm9K1ec0YgjLW/eONNsCylXmeGUNYmXjs7zm1brmYj4e0YqU17qXW2Y0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731265; c=relaxed/simple;
	bh=J3lPXImYU2UIwUOcDVZj1rGwN/DxgkRQcb3WcY1cz34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VYCylEoxNnB6MqE+yjQrpSL8PEZx5a1UxAiZIMfkRze7a6lZgWjLhyjbUFmKaQRw51kngyqRMM/7tdKTGLhnSVpEO1cub8IO9Nt6aQ1RnbAoqO4b/UxOv+f6hi4MyAyIaVxoTdBYmw5Q+LlWglpjBpDYzF5P8iq9OTGzLUqYuqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bDS+6eJE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bDS+6eJE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F19E1F000FF;
	Fri, 18 Sep 2026 11:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789731263;
	bh=jV+FC+IzfkYCIGgnnqfim3+fqQvmpl2ImrFQ0AS3jTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bDS+6eJEkTut1YNljtaVKe/e2fKHUVx4B4BNBNUJwG5fLMcCz54TaTWMuwR1mkKnC
	 duM21rcB73au+sLBUQhzAESK2ZfOcJw+Kw8ACr4QqMbfJlBRFfmt+V1qS7RBQJ7ikI
	 7PXkAyoG3rtorPWa19XOhl9p7tqo3LdjW1C0OObYtSEC9O+7P/4EQpxmmDwopFBicB
	 HZ+dfS420AzQamDWd9woNVnsuB4g1HJMffmf3aeEI9ZpIG7VFVQycVlPp/yYRlcdNJ
	 W4heTEWojcXqB+KtlIcPsZLLLSHgJn1XtJMpBGpLa0p6rcpu/gYG8QKdTYh3wkK3It
	 hCk5yCptos0hg==
Date: Fri, 18 Sep 2026 13:34:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Guenter Roeck <linux@roeck-us.net>, 
	Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] dt-bindings: embedded-controller: Add ASUS Zenbook
 A16 EC
Message-ID: <20260918-objective-okapi-from-neptune-cbcabd@quoll>
References: <20260917-topic-asus_ec-v1-0-373516d347ae@oss.qualcomm.com>
 <20260917-topic-asus_ec-v1-1-373516d347ae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260917-topic-asus_ec-v1-1-373516d347ae@oss.qualcomm.com>

On Thu, Sep 17, 2026 at 12:54:56PM +0200, Konrad Dybcio wrote:
> +description:
> +  The Qualcomm Snapdragon X2 series-based ASUS Zenbook A16 (and similar
> +  machines) come with a custom EC firmware, loosely based on the
> +  Qualcomm reference ("Hamoa CRD EC") implementation, with a lot of
> +  customization.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - asus,zenbook-a14-ux3407na-ec
> +      - asus,zenbook-a16-ux3607oa-ec
> +
> +  reg:
> +    const: 0x76
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#thermal-sensor-cells":
> +    const: 1
> +
> +  wakeup-source: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - '#thermal-sensor-cells'
> +  - wakeup-source

Wakeup source should not be required. If it is, then it is completely
implied by compatible and there is no need for DT property, right?

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        embedded-controller@76 {
> +          compatible = "asus,zenbook-a16-ux3607oa-ec";

Messed/mixed up indentation. Use 4 spaces.

Best regards,
Krzysztof

