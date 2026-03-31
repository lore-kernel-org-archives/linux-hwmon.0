Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAC83DDDD3;
	Tue, 31 Mar 2026 15:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774972369; cv=none; b=De3LoNHdP0Q2rRASX9ygdDtYOD9mUl5ecjv7fYmUxkkq30NkvsMVOR0qqTAEni+mKhQc1rpNT6FFRO/fw/v2/YxfXgeqRRzOokOp2gYsZMWTBKC9YzJBFYdcR2CMDCT+WPrtUk8EWqHNcnWBqECjlTcjIpSw8KEoze1Zn2KcP2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774972369; c=relaxed/simple;
	bh=t7dys0idtZz5iiBj3wpm6z9RBDMS3qpP5+1QDLupV00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z06x1NdDwM61P8jFzW8EOVb9x0XaFIAHeIc7XW+0lv9qS+FaqqnLLTjhE7LsamUClIf5LPxFVGwFAaIOCea9abVGij8xnIYzEWvWuPVGZr4qZ2mhb5eaE5x0Xs6KahO8QJmOCRu+ppNJ0XgEOJwwR5dIlkudW3V8rk6vXzYVQ6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QpfPxYWB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QpfPxYWB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54AC5C19423;
	Tue, 31 Mar 2026 15:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774972369;
	bh=t7dys0idtZz5iiBj3wpm6z9RBDMS3qpP5+1QDLupV00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QpfPxYWBYJxWlgo8o4HxIoYrbcUvDQ/xXrSJHk3WD1ZxPxG96ghZTQWboTFM9hOt0
	 ss+ryxHNKyTKRfDPnhCV78vp6eaFC+v1CB3zoZDkRXFMr6RggAOKFnjGSN/Q273ZlD
	 jU4dEle40OcAGBvnxmVbXYpF2yXzTvphadtD0RaFIAs7jy3vNM/GnNjAYT5VZd5AD4
	 mPO5ReRANcxqEBT09MXbuaPNX6kloUSUAEpmD4f2MnYGd3RvGYcDVf6LNAzkd/ow0K
	 ux5AKKI+EhB91FYF6UTOwCxabrP0XUxKrHnjK4DEfM50ywZ8npXvslnkCjDS+f2Lre
	 OwQSqtN8y22IQ==
Date: Tue, 31 Mar 2026 10:52:46 -0500
From: Rob Herring <robh@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>,
	Alexey Charkov <alchark@flipper.net>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/2] Add support for Texas Instruments INA4230 power
 monitor
Message-ID: <20260331155246.GA1299761-robh@kernel.org>
References: <20260330-ina4230-v5-0-eeb322d95b3a@flipper.net>
 <67a5d1c1-a9c5-47fb-a0ec-5b69a991b01e@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67a5d1c1-a9c5-47fb-a0ec-5b69a991b01e@roeck-us.net>

On Mon, Mar 30, 2026 at 09:07:32AM -0700, Guenter Roeck wrote:
> On 3/30/26 08:14, Alexey Charkov wrote:
> > TI INA4230 is a 4-channel power monitor with I2C interface, similar in
> > operation to INA3221 (3-channel) and INA219 (single-channel) but with
> > a different register layout, different alerting mechanism and slightly
> > different support for directly reading calculated current/power/energy
> > values (pre-multiplied by the device itself and needing only to be scaled
> > by the driver depending on its selected LSB unit values).
> > 
> > In this initial implementation, the driver supports reading voltage,
> > current, power and energy values, but does not yet support alerts, which
> > can be added separately if needed. Also the overflows during hardware
> > calculations are not yet handled, nor is the support for the device's
> > internal 32-bit energy counter reset.
> > 
> > An example device tree using this binding and driver is available at [1]
> > (not currently upstreamed, as the device in question is in engineering
> > phase and not yet publicly available)
> > 
> > [1] https://github.com/flipperdevices/flipper-linux-kernel/blob/flipper-devel/arch/arm64/boot/dts/rockchip/rk3576-flipper-one-rev-f0b0c1.dts
> > 
> > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> > ---
> > Changes in v5:
> > - Reworded per-channel subnodes description in the binding for clarity (Sashiko)
> > - NB: Sashiko's suggestion to allow interrupts in the binding sounds premature,
> >    as the alerts mechanism is not implemented yet and there are no known users
> >    to test it. If anyone has hardware with the alert pins wired to an interrupt
> >    line - please shout and we can test/extend it together
> 
> The bindings are supposed to be complete, even if not implemented, so I am not sure
> if the DT maintainers will agree here. We'll see.

Given ti,alert-polarity-active-high is added seems like the interrupt 
should be too. And the interrupt can specify the polarity, so is that 
property really needed? There's alway the possibility that you have some 
inverter on the board too and the interrupt polarity is not enough, but 
solve that problem when it actually exists.

Rob
