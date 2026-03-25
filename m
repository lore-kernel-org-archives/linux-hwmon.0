Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4533534AB1E;
	Wed, 25 Mar 2026 21:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774475792; cv=none; b=AjXJNx6MVuKM5D0KYGxrXqOwPUWisJTN0CuBebbEKbqzDvtXlVdxQ5/RYddt4EZtApp6MawDljKYD1rAGP3RsG0lgoEU7xuL/bAQSqRIelos+/LJ60ApXSedwIZfpfah0IYn+2WKwmr5a0JMxOP5zwdG3XDI/zzRUPVQfJcGmks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774475792; c=relaxed/simple;
	bh=cDsofzUExbaRruhadQQdIGevP2H5+i7XAF8lJ7eU7k0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I0kbT6L+6tikblAGh+SpTJBT7VyhJ3F3EeU2KDNgyO6tbqauq0io+YYfWA8eZaFd966Ta8A8W8mrQcPDFDssvYxULEeCi8nRQBFoyrAZ5Sqw75P4vUDLbnqNDqAhzO2RK13hx09R6DS7ZQhsV+Ua8+RLwKq8zle/1mzdzaoPThc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pNuh3pJP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pNuh3pJP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B268CC4CEF7;
	Wed, 25 Mar 2026 21:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774475792;
	bh=cDsofzUExbaRruhadQQdIGevP2H5+i7XAF8lJ7eU7k0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pNuh3pJPrMQV1aXwLfXOsQdPoh0jfs/9+LKenDgbmzr2ascfU/cuPw92VYPa6n72V
	 QDN96c2K2UnHjRiOwJnyab/LwQfqq8oAmhaPAPR6/thcW6EVeTd6kFTdZj0jMHe8jo
	 EJn622al9O3VhzblYDbAq7vHzWqY3JdbfJ9DXw8/Q/lBjeQVqnSvfgumYrEJi18ZnP
	 H8zopvZ4spCuUK/7QPYMiWMAKhD101LLND52r5KNE1+5DJdCzyqCBOI283h4TegEKp
	 7fz43EYMfYpcuMXF8MzZ8W6VhRj2NuF0l2gkVN9h9H0OqPRA3moCuAwGCeRd6EH8W7
	 CV1EjpVBNPg1g==
Date: Wed, 25 Mar 2026 16:56:30 -0500
From: Rob Herring <robh@kernel.org>
To: florin.leotescu@oss.nxp.com
Cc: Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, viorel.suman@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: emc2305: Add
 fan-shutdown-percent property
Message-ID: <20260325215630.GA6513-robh@kernel.org>
References: <20260320152959.1575978-1-florin.leotescu@oss.nxp.com>
 <20260320152959.1575978-2-florin.leotescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320152959.1575978-2-florin.leotescu@oss.nxp.com>

On Fri, Mar 20, 2026 at 05:29:58PM +0200, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> The EMC2305 fan controller supports multiple independent PWM fan
> outputs. Some systems require fans to enter a defined safe state
> during system shutdown or reboot handoff, until firmware or the next
> boot stage reconfigures the controller.
> 
> Add an optional "fan-shutdown-percent" property to fan child nodes
> allowing the shutdown fan speed to be configured per fan output.

Why not a common fan property in fan-common.yaml?

We generally specify fan speeds in RPM (and then map RPMs to duty cycle 
for PWM).

Also, we have (or can have) cooling levels defined. Perhaps we should 
define the cooling level for shutdown? Maybe other things with cooling 
levels need a shutdown level too?

Rob
