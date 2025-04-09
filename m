Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC08A433AD;
	Wed,  9 Apr 2025 16:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744214574; cv=none; b=I70tyR2TvmRsPguZZFDWm3h6hWvnkafzoEIjM5GR0avJjRiRyg9KuU7XcAv/PF5cQCznBx7YCWxOCkMXfIlrC/Ki47Wm6zkRJjydnuAf7fv/5VQeqkzIMvAi937bEDgC1/sptx2OBp51TY16SNFLg+knGnpJhjI5FVEC85oHQYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744214574; c=relaxed/simple;
	bh=2qo1Y58HB0HlDfZeaRFstN/RgYrK+ABbyaG9iqpeA2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FxRu8XNl3hT0ag/FxhkykyNTAWJahy4Bt2EFhN0NWT5nOgCEmpMsaX96qEOiIs5C/OBsSDLFzUzdonYbPC+hBmhDxvT2YP1WOo3exc7xchGVHUgoaFHhgLm0jEeYQQDjEDJTYO9AT0Sxj8hHAOmFpzGCDwXg2cpSmGovtT5N+mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GkeyoRuD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GkeyoRuD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51441C4CEE2;
	Wed,  9 Apr 2025 16:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744214574;
	bh=2qo1Y58HB0HlDfZeaRFstN/RgYrK+ABbyaG9iqpeA2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GkeyoRuDDZk1C3a+mpSdozRBNmbajFjIaL4QG6HlOJW6NWJMdM2MUB2VcOiJ2NhAW
	 TM7Um9wJ4hAg85pYNygnWLHLntulrmoaLQ1MUAb7EwnjPdhF6+vUbq0OlzrdmFKYx6
	 QUX1d9mD36iGNnGEG1FNf2wKQdTeZ7ApTZd2rx73ZPVOnvU/T5l9HUc+Ci5o8jLPzo
	 4BRFwhTuJKZPIUoXkpFUmcOuiiH92QmjfX9hyCw9CeQ7iS6nrGVPW6z6lHqR4wVkCf
	 EwteDM1TvbXF6tfjrbL23nx/qeaCTgon+ugj7iQmZ54pbxS9iqX+At5tCp7Hjxhi6L
	 ELdbXajDXhicg==
Date: Wed, 9 Apr 2025 09:02:50 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: kernel test robot <lkp@intel.com>, Guenter Roeck <linux@roeck-us.net>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-hwmon@vger.kernel.org
Subject: Re: [groeck-staging:hwmon-next 13/13]
 drivers/hwmon/gpio-fan.c:250:6: warning: variable 'ret' is used
 uninitialized whenever 'if' condition is false
Message-ID: <20250409160250.GB1506425@ax162>
References: <202504091047.biuX8Kl2-lkp@intel.com>
 <82d98804-e9b6-458e-bb39-3a48c10e9f70@roeck-us.net>
 <2368483.ElGaqSPkdT@steina-w>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2368483.ElGaqSPkdT@steina-w>

On Wed, Apr 09, 2025 at 08:50:14AM +0200, Alexander Stein wrote:
> Am Mittwoch, 9. April 2025, 04:51:35 CEST schrieb Guenter Roeck:
> > On 4/8/25 19:11, kernel test robot wrote:
> > > All warnings (new ones prefixed by >>):
> > > 
> > >>> drivers/hwmon/gpio-fan.c:250:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
> > >       250 |         if (val == 0)
> > >           |             ^~~~~~~~
> > >     drivers/hwmon/gpio-fan.c:255:9: note: uninitialized use occurs here
> > >       255 |         return ret ? ret : count;
> > >           |                ^~~
> > >     drivers/hwmon/gpio-fan.c:250:2: note: remove the 'if' if its condition is always true
> > >       250 |         if (val == 0)
> > >           |         ^~~~~~~~~~~~~
> > >       251 |                 ret = set_fan_speed(fan_data, fan_data->num_speed - 1);
> > >     drivers/hwmon/gpio-fan.c:237:9: note: initialize the variable 'ret' to silence this warning
> > >       237 |         int ret;
> > >           |                ^
> > >           |                 = 0
> > >     1 warning generated.
> > > 
> > 
> > I dropped the patch from linux-next. Please fix and make sure there are no
> > such problems before resubmitting.
> 
> Oh, surprising. A W=1 build on my machine doesn't raise this warning. I'm not
> sure if this is specific to riscv or clang. Nevertheless this is correct and
> I'll send a fixed one.

Unfortunately, the kernel disabled GCC's version, -Wmaybe-uninitialized,
several years ago in commit 78a5255ffb6a ("Stop the ad-hoc games with
-Wno-maybe-initialized"), so you either need to add it yourself via
KCFLAGS or just do a quick pass with Clang's slightly weaker but more
reliable -Wsometimes-uninitialized. I have fast versions of clang
available on kernel.org to make doing this testing a little easier:
https://mirrors.edge.kernel.org/pub/tools/llvm/

Cheers,
Nathan
