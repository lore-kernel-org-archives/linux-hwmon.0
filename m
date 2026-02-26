Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC48B38F92F;
	Thu, 26 Feb 2026 07:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772091919; cv=none; b=ak7plGgS8EATpwPfb/C3gVlZXsHolmDUCUS0F4RyCqN7ljzT5iGQupQ1wuwdaikatNzZjOQB/u+o453w5yhsbGJeE0G/dzKcoCKxWyOWZuYTpnwUUWv2BvMe3bQVqETIBCm8EY70qRu6CS/CkYnd9nDJCa84O2jfIbuLrhWssDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772091919; c=relaxed/simple;
	bh=kpB+IveM2XfE1pklW0YcjfK+5dQWoZnJ2yvXZFNrEq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ztrg2DWmoaohMlTxgIW+nRbk1pLJll86MhV9XCCEZlOAgoBvXiU1igvbrjZKaixGg1drIcWd+vi69tppRtpoha+PcGpTAJDcaD67r54o7w2B1tZ/5n6zJcehuKfJvFO6BfOZO9nW8Y4V0lsGo1DhOxhPz7FrFUGVzrBt4Ds+sQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZqLwscnI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZqLwscnI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0A96C19422;
	Thu, 26 Feb 2026 07:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772091919;
	bh=kpB+IveM2XfE1pklW0YcjfK+5dQWoZnJ2yvXZFNrEq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZqLwscnI1AQzC/Y0WEBwuHUnzQJhRdp+Urr+zENGEOnzE+ELIPXlf4xGT1Bx4wmRv
	 sgQxgB+J0AM5hNZyVRXuu/wWSA20dVM3jX/SPr6c+31FNmoCMozdf1BbZNkARW4ckA
	 WynfwEPr2mQz+Muj82XWzG8Z5SVPuk+K7Clr+QXmsnZUkz7T5kgfc7ig0tjvjiyXiR
	 iBHqWxchBf8S+yz0CXSb4eyRBjUPVVvXcRCbHiJbO9S0HRF77W5mUMKwRL7o7X37UK
	 +5jmT9v9gh709ufsd4meLZ3WFvBJyF1O+FyakXAvi7qSd/ZsqdUQ21Q6Gt5LLs/X2G
	 yCF6TVl5nzmog==
Date: Thu, 26 Feb 2026 08:45:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: wenswang@yeah.net
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux@roeck-us.net, corbet@lwn.net, skhan@linuxfoundation.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add MPS mp2845
Message-ID: <20260226-glorious-coral-coati-2de584@quoll>
References: <20260225085501.164819-1-wenswang@yeah.net>
 <20260225085631.165106-1-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260225085631.165106-1-wenswang@yeah.net>

On Wed, Feb 25, 2026 at 04:56:30PM +0800, wenswang@yeah.net wrote:
> From: Wensheng Wang <wenswang@yeah.net>
> 
> Add support for MPS mp2845 controller.
> 
> Signed-off-by: Wensheng Wang <wenswang@yeah.net>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index a482aeadcd44..2c6c84185bb3 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -303,6 +303,8 @@ properties:
>            - miramems,da280
>              # MiraMEMS DA311 3-axis 12-bit digital accelerometer
>            - miramems,da311
> +          # Monolithic Power Systems Inc. multi-phase controller mp2845

Broken alignment.

Best regards,
Krzysztof

