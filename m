Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D70818A6AC;
	Mon,  6 Jan 2025 17:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736185087; cv=none; b=DYE+6DbLEEgQceL7ufFhI0dn6dapffGz8H/agLWKXejuDLTopBgUZUpMAtsNQz4H58EBd3+bexr8absbyrSCHmRV8xmeJ0/w6aUyQvBpJ1ElmFNreosQNjUCch+wQEsIKw+ecI98CNoWq7Y7pEySkXQeJykDv1M1YyVOaUEVQhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736185087; c=relaxed/simple;
	bh=TUGWL4hZXBfpX3lvrQj+POWz/WUzBaiqXzE9YDjqdRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=igW9qjB99X/L6QeAjkd4aInHiICx7jrSRRRkQNrWFIGLKrmcIskz9Z9TO15FhQb8EI3n42kOuaFgbNI1ksNtFAIdkUyf7I7e+GJrxqEkfFN8G2YZK78bKflTAjIwqnZuB44/WQWulZqJQS9VqVGCZ5e6jhb7td9JYmL4lJAOqg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KOqF/SSH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KOqF/SSH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 527FBC4CED2;
	Mon,  6 Jan 2025 17:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736185086;
	bh=TUGWL4hZXBfpX3lvrQj+POWz/WUzBaiqXzE9YDjqdRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KOqF/SSHC1x7M/oM4MyCjxMSo8NmvWOSebeiOdEIG3RVuz4XKuW6yF9EAx5niXlVY
	 mtrq/5imQXEjt4ZkOANLA9KcmVbE6eFHNEsSfia6+N8D5c34CiWBvIq2Y9hk6Fr//N
	 /qNfe5hBZEiobD3dLv4GXvp9x6DPCV+zjqXTAOjtN2fm1wbzfwfDlcirytzUK3QsrL
	 p9y/QQM4HZUdvfh0z5jvuDRjQ6LLFc3PDgM/SvU+rjJcPp2aIc/ju+kzeGlhaY3wl2
	 lTOMxxNKgv7SZh/rG/YMHeKIygfRco6kMrtmteU3OhyBiEOumdULOi4oVUmkt5AdVH
	 hzCb59XNq5rhQ==
Date: Mon, 6 Jan 2025 11:38:05 -0600
From: Rob Herring <robh@kernel.org>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: pwm-fan: Document default-pwm
 property
Message-ID: <20250106173805.GA501301-robh@kernel.org>
References: <20250103101448.890946-1-peter@korsgaard.com>
 <20250103195810.GA2624225-robh@kernel.org>
 <dbf7cdd3-c5ab-4801-be85-163124b8a898@korsgaard.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dbf7cdd3-c5ab-4801-be85-163124b8a898@korsgaard.com>

On Sun, Jan 05, 2025 at 05:10:42PM +0100, Peter Korsgaard wrote:
> On 1/3/25 20:58, Rob Herring wrote:
> 
> > I still don't agree. Quoting Guenter:
> > 
> > > The two values are also orthogonal. The fan rpm is fan dependent.
> > > Each fan will require a different pwm value to reach the target speed.
> > > Trying to use target-rpm to set a default pwm value would really
> > > not make much if any sense.
> 
> > But RPM is ultimately what you care about and is the fan parameter
> > that's universal yet independent of the underlying control. RPM is what
> > determines noise and power consumption.
> > 
> > There's 2 cases to consider: you have a tach signal and know the fan RPM
> > or you don't know the RPM. If you have a tach signal, we probably
> > wouldn't be discussing this because target-rpm would be enough. So I'm
> > assuming this is the case and you have no idea what RPM the fan runs at.
> 
> Correct, no tacho.
> 
> 
> > The fan-common.yaml binding is a bit incomplete for this. What you need
> > is some map of fan speed to PWM duty cycle as most likely it is not
> > linear response. I think there are 2 options here:
> > 
> > Use the 'cooling-levels' property. Fan "speed" is the index of the
> > array. So you just need a 'default-cooling-level' property that's the
> > default index.
> 
> I am not sure I what you mean with the RPM reference here? The
> cooling-levels support in the fan-pwm.c driver is a mapping between cooling
> levels and PWM values, NOT RPM value.

Did I say RPM anywhere for this option?

It is the index of the array that is meaningful to anything outside of 
the driver. The values are opaque. They are duty cycle in some cases 
and RPMs in other cases. The thermal subsystem knows nothing about PWM 
duty cycle nor RPMs. 

Defining a default-cooling-level would be useful to anyone, not just 
your usecase.

IOW, you are proposing:

default-pwm = <123>;

I'm proposing doing this instead:

cooling-levels = <0 123 255>;
default-cooling-level = <1>;


> > The other option is define an array of (fan RPM, PWM duty cycle) tuples.
> > Then target-rpm can be used to select the entry. We already have
> > something like this with 'gpio-fan,speed-map'.
> 
> Where should these "invented" RPM values come from when there is no tacho
> signal? That sounds backwards / complicated for the very trivial "what
> should the default PWM value be at driver probe time" use case.

Every fan has at least a maximum RPM spec'ed. Probably a minium too. 
For anything in between, you're correct that you don't know. I guess you 
just assume a linear response. 

> > There's also no definition of the minimum RPM or duty cycle in the
> > pwm-fan binding. We have min-rpm in fan-common, but that doesn't work
> > without a tach. A map would help here as well
> 
> The minimum PWM is presumably 0, E.G. signal always low?

I'm talking about the duty cycle needed to start the fan spinning and to 
keep it spinning. I'm sure that value is not 1 for any fan except one in 
a physics textbook (the only place friction does not exist).

Maybe the minimum is index 0 of cooling-levels? 


> > This problem to me is similar to LEDs. Ultimately it's brightness that
> > you care about, not the current or PWM duty cycle to get there.
> 
> The use case (as described in the commit message) is to drive the fan less
> hard to limit noise and/or power consumption. The input to the fan drive
> control is a PWM setting, so it IMHO makes sense to specify that, as that is
> the interface provided by the fan-pwm driver - E.G. you boot up and tweak
> the pwm1 property in sysfs until you have a value that suits the noise/power
> consumption requirements and stick that value in the dts.

I understand what you want. I'm trying to think ahead about what's the 
next thing someone will want to add to the binding. Just adding 1 
property at a time does not result in the best binding design. There's 
plenty of examples of that. Second, we have these fan bindings like 
pwm-fan which predate coming up with a common binding. Any further 
evolution of these bindings should not further diverge from the 
common binding. 

If your process do this once for a given platform, then having this in 
DT is fine. If the process is every user of the platform does this, then 
I don't think it should be in DT. Having users tweak the DT is not a 
great experience compared to just putting the setting in a file on 
the rootfs.

> > Finally, whatever we end up with, it should go in fan-common.yaml. That
> > supports PWMs too, so whatever we end up with is applicable to any PWM
> > controlled fan.
> 
> What makes this "default-pwm" (or whatever it will be called) more generic
> than E.G. the recently added "fan-stop-to-start-percent" /
> "fan-stop-to-start-usec" properties added to pwm-fan.yaml by commit
> 80bc64201e78 ("dt-bindings: hwmon: pwm-fan: Document start from stopped
> state properties")?

Nothing. Those should probably be moved.

Really, pwm-fan.yaml should reference fan-common.yaml and drop all the 
duplicate properties.

Rob
