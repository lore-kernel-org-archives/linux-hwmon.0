Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165813D565B;
	Thu,  6 Aug 2026 08:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786003357; cv=none; b=CqS4+DwEDIdLGN3K+Zvj+74zML0j0RV0MfFuvahltv2dQQFAXVXyRXv7pAaA/TuzJsGM5N44TYZAxri5GBzNlTpt+lMXlQ2g2qYNNkIdNIKJnnJWq9NarZxdC9PC53bKe5frHVmDPeiQaxM700pu/fKN1VxOkS3oiO9VZ8wMErU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786003357; c=relaxed/simple;
	bh=j6PhW6PY5n4zqaAr8T7SDxJ8+N7jAopqx4x7Fwvcjqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iamIiV6EBE07pSmjHdqa63UgJ3v38Vg0Qwg3ZkDWAT69vcVjLwmeerSV8pDdJrO+GFYvlV9RUlVOmkWZEj9weWFe1FYc4cbNdYn93L+FfPZ6U0APFCbgT5UX6ik9Ftl4J2OEDTzun9VLhJVrfoK7Y8NIv04oPFpYHfGtASBh9m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VObp9xbG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VObp9xbG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF2A41F00A3A;
	Thu,  6 Aug 2026 08:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786003355;
	bh=M8jb/1pcJb8SYMFFRFHCA5u79FyRrSRWCSvu7jFWqgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VObp9xbGjaGK9xAGOZ4m6TodTE/89fC1vGZHBE3eiburmZ9aYruGBjS16xZYXD6w/
	 Tdy5wzcW5sz+f+7ltbD3KtUhdd7IUFVYNe+qqpxpNK1yCJRDr8s6O2tcNxRDbpFur1
	 R6Y59+uf5FGCoFFTWH1ZcVW9nhuHeK//RpJUEjlccK1d7LTsilryliTsGFXGJkTVtI
	 suu8fyl1jL2SmRZY6sT+7OZoVQHUOaS/r7IAy5IgcscuhVz6YTDhbUSsB6IJtH3Akv
	 RZsV8U84HNOHvWphrBrsRcSqs0paekjacTAi7pv/hrHQj5tFdAjgsFFGTM1V2itmQN
	 TeSOP+CFtv/XA==
Date: Thu, 6 Aug 2026 10:02:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 2/6] dt-bindings: hwmon: Move LM63 family to a
 dedicated binding
Message-ID: <20260806-pastoral-splendid-fennec-b7dda8@quoll>
References: <20260805-ctl2301-v3-0-fd4b8ffb5b0d@linux.dev>
 <20260805-ctl2301-v3-2-b86c75d1c552@linux.dev>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260805-ctl2301-v3-2-b86c75d1c552@linux.dev>

On Wed, Aug 05, 2026 at 02:00:52AM -0700, Troy Mitchell wrote:
> Move the National Semiconductor LM63, LM64, and LM96163 compatibles out
> of trivial-devices.yaml and into a dedicated binding. Describe their
> integrated fan control and preserve the optional interrupt used by the
> ALERT output. Permit use as thermal cooling devices via #cooling-cells.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
> ---
>  .../devicetree/bindings/hwmon/national,lm63.yaml   | 53 ++++++++++++++++++++++
>  .../devicetree/bindings/trivial-devices.yaml       |  6 ---
>  2 files changed, 53 insertions(+), 6 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

