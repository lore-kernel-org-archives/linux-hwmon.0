Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A78158D8B;
	Mon, 27 Jan 2025 07:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737961624; cv=none; b=VoBXXLkHypCmNIMuQxhf9In/1u84wSr64q09y5W+dOjuP5EcJXUwT7XC9gmcktCVAjJjSVfXAf34uSaPBpJOHVz3Hum9xudzVHDHrcVq5glVC+2ASD+v2LRKkx5U9JdYFNAUTSVDr/9Tgbh6Vkx9RrLapwU+oXZRRr9NjYpFYXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737961624; c=relaxed/simple;
	bh=SXLE3cmMuWINy43LKTXWstgV4xMtgKx6sfC4zQfb4ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0G9piK4YVYqNdlpEailGELQUARS4ecGcWbj9emF3RbU/5Urm/zxjhCefWPoI3L2o6BUsRBGaicgWvSCZcXc5s3urIF4BNUAI3MHTmWhs4eoHQ/gBO3+mEUxvk2kypFDNuyU4P39UAam/6sDvnUe46lvyy+SH7II97UcwhY8gC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r+3BmUfI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r+3BmUfI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33637C4CED2;
	Mon, 27 Jan 2025 07:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737961623;
	bh=SXLE3cmMuWINy43LKTXWstgV4xMtgKx6sfC4zQfb4ns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r+3BmUfId+5EzWYPMSv+Abd3atUyloU65bg/KimTcv3tYLr6q7deNaM9zpsBfRKVz
	 9BO6PAbXuR6CrWVDdhbW6biROn0RNHKecMFXbeKXABSXJmYyeUKCPyLhCqGjAZDrv8
	 XWHbvxkq8BnR81QmkbVnM4B82IufmSM60GW57fGZATJMSenwIe3KH5AVvW5SMZ4dmc
	 gsboJzRTrBMZ9zm5mXkU/cqsnk+SxDhyTlzwGJnStTWbIsMXjEgjwL+wQeVgDqHyP5
	 KTlSJqnUt6tTic7M3am1wMtrt2qUpqYzBYgCZ9+JcGA9i4zWajrXjGCL71DJzLWfGP
	 Tvf/Xpu+ZBvRw==
Date: Mon, 27 Jan 2025 08:07:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrei Lalaev <andrey.lalaev@gmail.com>
Cc: jdelvare@suse.com, linux@roeck-us.net, conor+dt@kernel.org, 
	robh@kernel.org, christophe.jaillet@wanadoo.fr, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: hwmon: Add description for sensor HTU31
Message-ID: <20250127-agate-mouflon-of-promotion-6df8ee@krzk-bin>
References: <20250126144155.430263-1-andrey.lalaev@gmail.com>
 <20250126144155.430263-3-andrey.lalaev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250126144155.430263-3-andrey.lalaev@gmail.com>

On Sun, Jan 26, 2025 at 03:40:56PM +0100, Andrei Lalaev wrote:
> Add trivial binding for HTU31 Temperature and Humidity sensor.
> 
> Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Please version your patchsets correctly. `git format-patch -v2` or b4.

This is not v1 and you could not get my ack on v1.

Best regards,
Krzysztof

