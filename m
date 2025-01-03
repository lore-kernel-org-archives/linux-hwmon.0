Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01ECA189902;
	Fri,  3 Jan 2025 19:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735934293; cv=none; b=Nw3p+pTRRpH5AEABXau7l9RNlGSjEPMHIDJFd7PWep8khY59cKZWQAlGctC+HJAc1jDzS+WRMYiPUE8wHdKkKQgmywpHNdPYXf3MT8Ay7JKV0Bb2/ukGouJvREqj1ndm2ntdpQnsqTX45EERZZidKosz5kd+dPu9u2+kDcSDZxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735934293; c=relaxed/simple;
	bh=lGPnrXHxFhfBvnTyCxyAN/xgZ2X50cGOh+K5F3Vexs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kfnq8Z6PDRaoBRTTvPjWUW2x9AiES5OucYa11RwemR8Z/HpkAMfBbh30tjguPnbT0K15R1l46ZMAneJUmIlZQA+6Q38Aux9AGvvTWzKnrYPcBJS/+qtbj3rED+reWvRP+PiL3jyulY3tT1ymKPn4qFGKU/kk3angE2+RifxjcDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NTbzFPgh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NTbzFPgh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F685C4CECE;
	Fri,  3 Jan 2025 19:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735934292;
	bh=lGPnrXHxFhfBvnTyCxyAN/xgZ2X50cGOh+K5F3Vexs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NTbzFPghW/NCYs1toFb1P7vTfDQsTx3PxppPRd/CWO6ymqJyYF8u9w8i7dObH54GR
	 iucUcfFEFS06Lrghdi+puU98PSJPQ6JmN/3dudFss5TRlUuXNwu1Bo6RlMc1ZrciMR
	 juqvh89vZhVMh1QQEcQKH6PU1dbnZqRkC5O2lJ3wvx+rn3qVQ0KXtGGcehLBTF8X0e
	 U+EB3pPEkvTS8UhuMbGfnAgOZLmXJtAYlZYxDNQluQoTdh1SGMfPh7g2hW+x7aHGis
	 LuKhFYo6DF53uI6NHMA0kNVOQUiSY3WnoYNQ3Wh4jq/Ubft+cwrrLD8ALiQFoQqNad
	 dHNtVzTTkz/3w==
Date: Fri, 3 Jan 2025 13:58:10 -0600
From: Rob Herring <robh@kernel.org>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: pwm-fan: Document default-pwm
 property
Message-ID: <20250103195810.GA2624225-robh@kernel.org>
References: <20250103101448.890946-1-peter@korsgaard.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103101448.890946-1-peter@korsgaard.com>

On Fri, Jan 03, 2025 at 11:14:47AM +0100, Peter Korsgaard wrote:
> The pwm-fan driver uses full PWM (255) duty cycle at startup, which may not
> always be desirable because of noise or power consumption peaks, so add an
> optional "default-pwm" property that can be used to specify a custom default
> PWM duty cycle (0..255).
> 
> This is somewhat similar to target-rpm from fan-common.yaml, but that cannot
> be used here as target-rpm specifies the target fan speed, whereas this is
> the default pwm to set when the device is instantiated - And the resulting
> fan RPM resulting from a given PWM duty cycle is fan dependent.

I still don't agree. Quoting Guenter:

> The two values are also orthogonal. The fan rpm is fan dependent.
> Each fan will require a different pwm value to reach the target speed.
> Trying to use target-rpm to set a default pwm value would really
> not make much if any sense.

But RPM is ultimately what you care about and is the fan parameter 
that's universal yet independent of the underlying control. RPM is what 
determines noise and power consumption.

There's 2 cases to consider: you have a tach signal and know the fan RPM 
or you don't know the RPM. If you have a tach signal, we probably 
wouldn't be discussing this because target-rpm would be enough. So I'm 
assuming this is the case and you have no idea what RPM the fan runs at. 
The fan-common.yaml binding is a bit incomplete for this. What you need 
is some map of fan speed to PWM duty cycle as most likely it is not 
linear response. I think there are 2 options here:

Use the 'cooling-levels' property. Fan "speed" is the index of the 
array. So you just need a 'default-cooling-level' property that's the 
default index.

The other option is define an array of (fan RPM, PWM duty cycle) tuples. 
Then target-rpm can be used to select the entry. We already have 
something like this with 'gpio-fan,speed-map'.

There's also no definition of the minimum RPM or duty cycle in the 
pwm-fan binding. We have min-rpm in fan-common, but that doesn't work 
without a tach. A map would help here as well

This problem to me is similar to LEDs. Ultimately it's brightness that 
you care about, not the current or PWM duty cycle to get there.

Finally, whatever we end up with, it should go in fan-common.yaml. That 
supports PWMs too, so whatever we end up with is applicable to any PWM 
controlled fan.

Rob
