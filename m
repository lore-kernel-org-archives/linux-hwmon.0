Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A904D37D10D;
	Mon,  4 May 2026 10:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777890640; cv=none; b=od8skJkiytosxnR7fg61vyykt/Sx/6JJdoD1jbj9zA13MltQCjnRphCz+bwwx32htJIkdHgFCtIeVA6hSFvv/shL9nNN+sF+15RcslLB75+bEZEMvYlT6wQpIChMS+0o2JFoTHjPcu2v1pZCTzwpkfgIhqj1yHxlou+xeKYXom0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777890640; c=relaxed/simple;
	bh=NVtgSg2o+BzU/RT1CHS8FMi/42ypoa2Nbhfw9Htot2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RfdAYR8S9CHSxTZABt0SqTRV99vV0oL86SloFOOVztXHQDwCx4isIhHEEmNBMEf4UZ6Pzygoo6vLGlLVKQ5aeC1UgkyW5cF4MYRLbRq1eH42kieY/dnC+OQz1Joa6KkkJGL4B/sQB2Vq8K8bnOh2YqukY0YF6LJjmx4yrlclO7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XIQufZN5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XIQufZN5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF50BC2BCB8;
	Mon,  4 May 2026 10:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777890640;
	bh=NVtgSg2o+BzU/RT1CHS8FMi/42ypoa2Nbhfw9Htot2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XIQufZN5GJ50VHvxRiwfrlny/KZcL1Wvr+iQEuAtjVdaBQaSI9h4pVMp/XWwYJLMG
	 y/7r0kroUaG3q2OgAsnWdVdbY9BeuvDESvBqHSEUpuj3eDX+qhVjNyZ1sFRVb86hHX
	 aHOOXf02wQMs0pcWEO26YEuI5XQEUoaL30YGEcTkUJrdEHCSCgjzyvUr3iJnx16A4d
	 z3ZDNK2w+mjMR278gZOimAIqIXLfbYuqQiIoXYnOR7TuXJZz+zmZwAx3J/SAyyq4gF
	 7YE177PA+YXqHhCOO0m9cohEj2FuawuBF0oGB6wo12Sj9+ao+w/Ni+QmvCIpe3pUHm
	 3pk/ZOEka9nIA==
Date: Mon, 4 May 2026 12:30:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Manish Baing <manishbaing2789@gmail.com>
Cc: linux@roeck-us.net, linux@baker-net.org.uk, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: hwmon: zyxel,nsa320-mcu: convert to DT
 schema
Message-ID: <20260504-nippy-saluki-of-admiration-f9f984@quoll>
References: <20260501102116.8275-1-manishbaing2789@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260501102116.8275-1-manishbaing2789@gmail.com>

On Fri, May 01, 2026 at 10:21:16AM +0000, Manish Baing wrote:
> Convert the ZyXEL NSA320 MCU bindings from text format to YAML schema.
> 
> Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
> ---
>  .../devicetree/bindings/hwmon/nsa320-mcu.txt  | 20 -------
>  .../bindings/hwmon/zyxel,nsa320-mcu.yaml      | 54 +++++++++++++++++++
>  2 files changed, 54 insertions(+), 20 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/hwmon/nsa320-mcu.txt
>  create mode 100644 Documentation/devicetree/bindings/hwmon/zyxel,nsa320-mcu.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

