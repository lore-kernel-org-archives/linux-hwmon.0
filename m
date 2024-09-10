Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF81A140E5F
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Sep 2024 09:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725959412; cv=none; b=gmIWnGN6gLKJ/TQM5viw3JEH13TLbJhepaMGz6tXw8+H4A8nJFlyTeOi4ovIw0RKyAHFTXvsvXB78sH0CPqsZtvfGywmz0NI/RDWXgvmHwQXGxZ5rRStLK6cMQG0IfKIUIAaTHtTP1qwQ7vAA5q11PWV05LX8N/bSs9NZ0OVniM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725959412; c=relaxed/simple;
	bh=WoutYSJf4p4TVUN4tnhGTf7NBveG7svGQnp0PTwJJLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jvegLwn6LI8mbJP4bV71t7zoIk1B7PizdaDOSITSnQWwGsIlFk/I5b6L8zFCkYvY1lsjvv8iZ+QSjcG0a/sI/YPbk9uMNsKrGme/Ai5Zhk3a76l/QJvFdYRg8ilnFrjujM77rz9FVdtkyKj1/p1NgLnWSpbWLzMokomv6xxinLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YBgeYJ2+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YBgeYJ2+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAFA3C4CEC3;
	Tue, 10 Sep 2024 09:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725959411;
	bh=WoutYSJf4p4TVUN4tnhGTf7NBveG7svGQnp0PTwJJLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YBgeYJ2+ocrmA2YYAiK8NMGTbcIzfYI78pQfjhCf0Es/yZxGi24Am3SiDH5M6NARf
	 Y4d132kqp1JA/PKdMbUyuhXPcX9/uSzCQnZTHsa3z2k2sbEVvlS/HAyTCgKQUgNCGW
	 j+Saf5KokawnbTStymwgQWwpY9m4Nn7fl3WYdaLUFILsBrU1fxW1pSHffsYOzEXNNx
	 EED9c9q8dwVup0xE0X+PvM7BrADXD81ZJ7iyfBjqTv5kTsAVbEHlgWesccL5jDh6CI
	 qwfxgpEQ4S2J1I6vemsLh6+OUN+iQ69aC7+vFRx4F8Pj1862shGZvXA8DK3J8rqeaV
	 y3FTy4/UHkNhw==
Date: Tue, 10 Sep 2024 11:10:07 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
Cc: "Gupta, Anshuman" <anshuman.gupta@intel.com>, 
	"Jadav, Raag" <raag.jadav@intel.com>, "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>, 
	"joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
	"tursulin@ursulin.net" <tursulin@ursulin.net>, "linux@roeck-us.net" <linux@roeck-us.net>, 
	"andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>, 
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, 
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, 
	"Tauro, Riana" <riana.tauro@intel.com>, "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, 
	"Poosa, Karthik" <karthik.poosa@intel.com>
Subject: Re: [PATCH v2] drm/i915/hwmon: expose package temperature
Message-ID: <fsh2semsflyxqghmkxb2rk4xtnz5wdcxud73ghepchxkf55p3u@xgbz5o3dp3p2>
References: <20240906093118.3068732-1-raag.jadav@intel.com>
 <sd5g4sj6t373wu5jfdfaujh73t4uehcri4aqtu7dln4p4huyoh@sa4nivkflc47>
 <CY5PR11MB6211D25D522F6044554B84F7959A2@CY5PR11MB6211.namprd11.prod.outlook.com>
 <6683448a-aeb4-4ab1-9520-c83f70100583@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6683448a-aeb4-4ab1-9520-c83f70100583@intel.com>

Hi,

> > > > +static int
> > > > +hwm_temp_read(struct hwm_drvdata *ddat, u32 attr, long *val) {
> > > > +	struct i915_hwmon *hwmon = ddat->hwmon;
> > > > +	intel_wakeref_t wakeref;
> > > > +	u32 reg_val;
> > > > +
> > > > +	switch (attr) {
> > > > +	case hwmon_temp_input:
> > > > +		with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
> > > > +			reg_val = intel_uncore_read(ddat->uncore, hwmon-
> > > > rg.pkg_temp);
> > > > +
> > > > +		/* HW register value is in degrees, convert to millidegrees. */
> > > > +		*val = REG_FIELD_GET(TEMP_MASK, reg_val) *
> > > MILLIDEGREE_PER_DEGREE;
> > > > +		return 0;
> > > > +	default:
> > > > +		return -EOPNOTSUPP;
> > > > +	}
> > > 
> > > I don't understand this love for single case switches.
> > IMHO this is kept to keep symmetry in this file to make it more readable.
> > Also it readable to return error using default case, which is followed in this entire file.
> I agree on this. Let’s stick to file-wide approach and ensure it is applied
> to the fan_input attribute as well.

Yes, that's why I'm giving the r-b. I don't like it, but that's
how you guys have decided to do it.

Thanks,
Andi
