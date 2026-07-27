Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80303DB333;
	Mon, 27 Jul 2026 07:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785136475; cv=none; b=n7kcVdsYu9c3RHEEthbS4EqOPHxJJqnCqef3z1g+Mq+Ens+xszOv2248Li2wwpjNN7tfq5gxOiRPUNAWBkMd2SGpyUrI2ozPxbz6WDurU0h61ne7kumhIXm2u7GxsIhU5m9Lhu1ICStXwdAAKRcLI7xJiv+f0MeJeRfFIe6dY5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785136475; c=relaxed/simple;
	bh=Gx/6v/wwTiL9ipHOQL8NVq8oK0c4Ye7Krnzn3sWPVlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B2pxxbXu3fQiK0JBuOeCzrOha9P57f0aBN4Ecclr8InFWFgSGUj1Ic+174Zcdo0WMvtQdnpBYJsZXkPWPYLJLpEd9iadLEDkvAaTkZBiDoYlGKIlfTp9XXRbsd+IwCg5bGuiKG0GZJI9QpIJiycUvZG9nEQCcTZkFtIYKtQ11Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oizi4npP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oizi4npP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28C0B1F00ACA;
	Mon, 27 Jul 2026 07:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785136474;
	bh=MC4sDKdeGivtH6bnm+aKKRpOIXAyTa+BQpMBWFaJ5tw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oizi4npPZPn2BxHKK+YuJpGslepdPl4cFTQ1woVg4rdOgxSdh080l2XjJa9Rc04s5
	 ingWBIQPbi+HZqqJoNNiSeYuYyav0k4NSc8O7NQZTmtfOY0XMqOG8O4fMhnGPu/Z3a
	 svFKM4oUjzypU/WQhuUHAtNy8lAxHecMsmOC03JibsxHNWAmwyWuoqewL1Xfj4d2ac
	 EAfrjeMu0DlzRZdxamSeeTdDnygfX4t7rwizXuCEzMcWDNSVQjhv8ceiYxLgYxpwf7
	 TS7KZon9P8GDcRiZoXzj1LLwlxAuMhM+Lcg5e80mI/RiQeQfOEDFUyEW9GyphE39PN
	 0Dq5o8EkIpArQ==
Date: Mon, 27 Jul 2026 09:14:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy Chung <Andy.Chung@amd.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 2/4] dt-bindings: trivial-devices: Add Kandou KB9002
Message-ID: <20260727-benign-wapiti-from-hell-28d3fe@quoll>
References: <20260724-kb9002-upstream-v5-0-9523c3ffe83a@amd.com>
 <20260724-kb9002-upstream-v5-2-9523c3ffe83a@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260724-kb9002-upstream-v5-2-9523c3ffe83a@amd.com>

On Fri, Jul 24, 2026 at 12:47:38PM +0800, Andy Chung wrote:
> The Kandou KB9002 is an 8-lane PCIe 5.0 retimer exposing an SMBus target
> that reports an aggregated die temperature. It needs no device-specific
> device tree properties beyond its address, so add it to trivial-devices.
> 
> Signed-off-by: Andy Chung <Andy.Chung@amd.com>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

