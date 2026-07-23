Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C78361DB8;
	Thu, 23 Jul 2026 08:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784794300; cv=none; b=fAp/WZJhBzq2JhwKO7+HNNnjHsYYuYo6Nkkwk7LOPni62kKO1IugKG76tVa5ZnLgTHeX1thrqDbKGSMrdpI1QymIK4Qu8a8P7TzQlqNo0ZMKSv/TAUjn6UbXBMn3rOC0rm89FOxh4V28kEqtyQZB98pOMcdNU6rbwFt+xIRSsiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784794300; c=relaxed/simple;
	bh=tbsAfD1LeRKHS0g5kwtvwbaz/gKGtbOq5mgBCqt8awg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uiet1mAjUSvYsLDahRGcZQQSPVInW+SzOoeS5uueyNiXrKGj5+W6QeaLByu7V/XMA3Z/ndUBarovnsdEjXjVTtTyZE/7iWid5kKcAghYOKcM9XWEn5yx533Doxv5YhmEQiPSjBNjXXCrXLzeAdK4nS5f9703Nm1F9j6mzxKBFY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GL3PXPxd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GL3PXPxd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B281F00A3A;
	Thu, 23 Jul 2026 08:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784794299;
	bh=4ZEvR3EwzSZOEHcX1Aaaa5DIzQKxyHgbGZwUMRDqrzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GL3PXPxdNpxF8Vv+isQo1m4KfV2ux5FtHWJR7Lx6YAQU1ySePwfpgYtiAJH/gfcdC
	 /H4BFUCdtqRZqAFofTSDRcDeF/BZg+iJLXAsSQzlug5vfcmwsAzNT7RyYa3kFvsLsH
	 Krb0xfKFDldff2Hy9WkjYc+9RjKmPdAuWjA2ZKGqWfaKDICJvBC7MwQRlNJZyLvEwH
	 unbPKldqmglNPEem2JOIN7Gu4EsmLt77RYffctNyTFdnTm83EcAhpLBg+Ke7VWlqnJ
	 L+5X50YldnC4oKJClSc1SlSykxsma4Qc8fAQEH+K3SFI2maRLqRSQ/u5MFBrWRqOtI
	 e1Ut8frEXZ4wQ==
Date: Thu, 23 Jul 2026 10:11:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, 
	linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH v2 01/10] dt-bindings: hwmon: Describe Qualcomm BCL
 hardware
Message-ID: <20260723-radiant-scorpion-of-hurricane-cbed57@quoll>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
 <20260722-qcom-bcl-hwmon-v2-1-febe2805e17b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260722-qcom-bcl-hwmon-v2-1-febe2805e17b@oss.qualcomm.com>

On Wed, Jul 22, 2026 at 12:00:06AM +0530, Manaf Meethalavalappu Pallikunhi wrote:
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,pm7250b-bcl
> +      - qcom,pm8350c-bcl
> +      - qcom,pm8550-bcl
> +      - qcom,pmh0101-bcl
> +      - qcom,pmih0108-bcl
> +      - qcom,smb2360-bcl
> +      - qcom,smb2370-bcl
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 2
> +
> +  interrupt-names:
> +    items:
> +      - const: max-min
> +      - const: critical
> +

Binding looks in general ok, but feels incomplete. If this is battery
limiting hardware, does it actually need any battery data through
monitored-battery property?

Best regards,
Krzysztof

