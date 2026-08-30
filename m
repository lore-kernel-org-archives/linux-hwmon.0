Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A389B3806BD;
	Sun, 30 Aug 2026 09:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788083626; cv=none; b=L8IuCAoUCy0z5L4xurJrsCC+fnswaNSDhykVpeDggymsaTjykc23s7iWhhMFufa1Yabr+V6AOESuEvqQOdAauDhkvZRlrWpGzisRVjq/Ki9jT2VSsk2z5T7W1kWpSYCViv0LXHMFXUggl/eawIAhcTFX0uRPkq50sryXSNkEOh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788083626; c=relaxed/simple;
	bh=ZchydP8QjD4yV+Zk9hB5b2DfbGXCpkqqoaj3x6dvggM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LQR+EZSP9hNkuxpkd5mxnO9EG9dQwT8LVZbysSfGjFJ39ULMYJMLMdqgiQ6bwbeWaQKv5VVmz4yLP+s//FxGO59cyJH6gNoh/roqGjiaezuDEyU441fv4xSnKVVt1Fexv07wosu56W+XrtuutnMw8hxeH2BZf9RjoPurisz9lG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O8PdxOQw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O8PdxOQw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04A341F000E9;
	Sun, 30 Aug 2026 09:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788083623;
	bh=V7GiyyeYtymPDpp0Kz+/T1xEheO8ntFtb7p/uSGB400=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O8PdxOQwutK/bpxrGU7cZckHsp/V/h1BkecByM1NCrRxDGKB3sRBgST0Gzdv6KZXI
	 zSeFOszM4/xWqgQTiO3Tirwl71iQEZYFzI7UE7q2zmLTYSGNaT8q/M3qV1XWc1G2tq
	 KMSNIDrWB6o3KbOwclQIt0tcxe6SYR6i0aldSZlvkh2answ/KqSxCBgSHKMSeD4kA2
	 8aJ3Y2/3abeqRtt6FP1WDAstgrJiSaD//h7cML1pjM5AAsc4a+rg8nyXKZ2+xxQMGt
	 HcxTJHKRbkriFcNht8KCRPTHNGPLFOYzru4MBdlZmdhl9UHKjn8nH/Y3C7yGiAwRr9
	 F9jsBwkILRGSw==
Date: Sun, 30 Aug 2026 11:53:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Wensheng Wang <wenswang@yeah.net>, Cosmo Chou <chou.cosmo@gmail.com>, 
	Colin Huang <u8813345@gmail.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Dixit Parmar <dixitparmar19@gmail.com>, Antoni Pokusinski <apokusinski01@gmail.com>, 
	Eddie James <eajames@linux.ibm.com>, Thorsten Blum <thorsten.blum@linux.dev>, 
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: hwmon: tmp102: move ti,tmp103 out of
 trivial-devices.yaml
Message-ID: <20260830-alluring-goldfish-of-cubism-eef6db@quoll>
References: <20260826211422.3299728-1-Frank.Li@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260826211422.3299728-1-Frank.Li@oss.nxp.com>

On Wed, Aug 26, 2026 at 05:14:19PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Move ti,tmp103 binding from trivial-devices.yaml to ti,tmp102.yaml. Both
> devices are single temperature sensors and update "#thermal-sensor-cells"
> property to accept values 0 and 1 (passing no argument is equivalent to
> passing 0 as the first argument)

Why updating the property? If there are single sensors, then what is the
cell for?

> 
> Fix below CHECK_DTBS warnings:
> arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dtb: temperature-sensor@70 (ti,tmp103): '#thermal-sensor-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml | 5 +++--
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 --
>  2 files changed, 3 insertions(+), 4 deletions(-)

Best regards,
Krzysztof

