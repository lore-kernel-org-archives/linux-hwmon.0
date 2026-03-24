Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD9C35838E;
	Tue, 24 Mar 2026 21:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774388216; cv=none; b=rismi5CAxEZcRlF30FyKH9mZsrRlk9eM8kymM6WRLQfta//caBjukbrBGPn/+5IL4/5589+eUaD9jQ3GwMUmWswP3ydBfDy72Mr25h1/B+K/+cTCo2jfdg83OnwhXPM2yVuvjGeDsEp4jNvBNyrFuWn9qOiJFiB6j+Z3dYkH3x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774388216; c=relaxed/simple;
	bh=8ghUnBBVxBJ7ck76EO+UtIcQyZsizBJb6Z7wn0+pkGA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ruBm8eOg0Rk6uE4RIynOxVHBPjxewMUqD54izKmBATrItg2Nhg3MGC8INSvaq3VswVAMSU9cqS1Vs7K2uwUIqr+U10gyd7cvYZ93lPiLycS7qkzmx6K27z/ifig3I3xslNXa8kRNtfB624VpQaZqHEe6ISjXm8v6QL4o45Rx/xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=byEhI6Uv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="byEhI6Uv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1472C19424;
	Tue, 24 Mar 2026 21:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774388216;
	bh=8ghUnBBVxBJ7ck76EO+UtIcQyZsizBJb6Z7wn0+pkGA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=byEhI6Uv3OQMf5idcmrN4ZfWfSU6p3OiQuBzoz2HMFxIYv0P4NQw4vADTyEVUETvJ
	 6fT9TZA69gZ7Em3XSyyx0lYP68tm2HC52UqRIszLD76Uxv0pvJ249PiMLb+4Bq/LvR
	 /hjJOgqIIoI+t+MHkd/mjjKPYyN1oeJBu4jYDycz1YkYhIvLWKDwD79cIulBWS/Hd8
	 H/f2gQWAJPPrUJ01jwpHI78VeWoRxYgn8Hwxr6xZyYw2Y1mEBB35sVCjCAg/Rhnpmd
	 3rIP+Ant1ddu91OH2uaFRsqFD4P2YSKOKr2KQpVWnPUpgdeq6vThiotB/zzpD6IpNt
	 vaeiRBO454x2Q==
Date: Tue, 24 Mar 2026 14:36:54 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Ivan Vecera <ivecera@redhat.com>
Cc: Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, Arkadiusz
 Kubalewski <arkadiusz.kubalewski@intel.com>, Jiri Pirko <jiri@resnulli.us>,
 Prathosh Satish <Prathosh.Satish@microchip.com>, Vadim Fedorenko
 <vadim.fedorenko@linux.dev>, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, Michal Schmidt <mschmidt@redhat.com>, Petr
 Oros <poros@redhat.com>, Simon Horman <horms@kernel.org>, Guenter Roeck
 <linux@roeck-us.net>
Subject: Re: [PATCH net-next 3/3] dpll: zl3073x: add hwmon support for input
 reference frequencies
Message-ID: <20260324143654.4dcec5a0@kernel.org>
In-Reply-To: <8486ce6e-ad2a-493d-b734-b40e8db9213e@redhat.com>
References: <20260320105915.149068-1-ivecera@redhat.com>
	<20260320105915.149068-4-ivecera@redhat.com>
	<964752ec-8e6d-444a-aad0-80da3acb2dab@roeck-us.net>
	<7dbb5130-72cf-49d2-bfac-3439deb1b2e3@redhat.com>
	<20260323154825.1a2320c4@kernel.org>
	<50a1671c-9901-426a-97ed-bf36400fe9a7@roeck-us.net>
	<6f1e98b3-4b86-4b7f-8c91-d8d5721aeb25@redhat.com>
	<8486ce6e-ad2a-493d-b734-b40e8db9213e@redhat.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 24 Mar 2026 13:59:19 +0100 Ivan Vecera wrote:
> >> In the hardware monitoring world one would have min/max attributes and
> >> one or more alarm attributes. I never heard about the idea of reporting
> >> deviations, and for typical hardware monitoring attributes it does not
> >> really make sense. What would be a "deviation" of a temperature/
> >> voltage/current/power/humidity sensor ? Such attributes typically have
> >> an operational range, and they are allowed and even expected to
> >> fluctuate within that range.  
> > 
> > Ivan, my take on all the above is that using the HWmon interface here is
> > stretching it too much. I think it would be better to move debugfs
> > and/or netlink events.  
> 
> I'd rather avoid debugfs... My proposal is to expose absolute measured
> frequency attribute of dpll-pin and follow phase-offset-monitor
> functionality:
> 
> So:
> * add real-frequency attribute to dpll pin
> * add real-frequency-monitor attribute dpll device
> * user will be able to enable/disable monitoring by enabling/disabling
>    real-frequency-monitor feature (similarly to phase-offset-monitor)
> 
> Thoughts?

I don't have a strong opinion. IDK where to draw the line between DPLL
and "random functionality some devices may have". We have 3 DPLL
maintainers, let's see what their majority opinion is..
