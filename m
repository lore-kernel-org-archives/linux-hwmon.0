Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BE21791EB
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Sep 2024 22:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725920840; cv=none; b=QvVyzU0+SiBA1OSuICwgQp0cvG2FGJYaBMjm3lGx6Z4OUI4deWUmJUGuWFRWpclo1Wemr7fGg3GbcFU3QOyhafddzMU83QXa5FgPhmgrUoBOKDHkQ/VRmsW9DVuzpqiRK56COjgxCncCAhXhS3Fmgm0kpdrAaWW8jpFBPOFm9M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725920840; c=relaxed/simple;
	bh=9aYvYwKGp5TvRAOVrAIm4Sf65Os0O/j1yXgKtTYXNvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CBtwGy3D4tsU0E4IM09m4oz7phIcjGf/GsULYtl0bAI/xPguNvK4dyZUl/7TESvvAeHmkjPNChLBgCLdFfYpZ0Pl7957z5A8mEmeAiuIaDvl3VSk6V511tSsfSqGsBHFgePYNQ+ShfxDY8C6hXKMlABGLQP8pZqw1+U069gpBeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wq2x2i3M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wq2x2i3M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 899D6C4CEC5;
	Mon,  9 Sep 2024 22:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725920840;
	bh=9aYvYwKGp5TvRAOVrAIm4Sf65Os0O/j1yXgKtTYXNvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wq2x2i3MX4Qw7xNaL4eFEasIO/1Ld5gjCVRT1Ix4wgqYj3kv9QhFhXIU2QlxNkdfF
	 cQzMl0ZEFZF8SRo50tsSuAmg06V4D7u7/q1VNBspxQO+39wr2qF8gAZN5pia+W6jPk
	 k7tRqsQH9m1rg2Uop+H8jRTp5E0S+qS3I6ZYyX/tF5d9gEnVkAVBoKn6u4ilfSKLYu
	 p4vytrPe0eCkklsRYKynMjb1KBYoJS+mTgH5AK0/YRgxX2jOdi15Ti6OeYwwvntW9D
	 d48O33AcqdvhCc0QDQ0rBp00XkoYrFZKwWzZ1iYiiWnupNXvFeHjvdss4IIjZPt0mT
	 n+/SHtQS/2Dcg==
Date: Tue, 10 Sep 2024 00:27:16 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Raag Jadav <raag.jadav@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>, jani.nikula@linux.intel.com, 
	joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, tursulin@ursulin.net, linux@roeck-us.net, 
	andi.shyti@linux.intel.com, andriy.shevchenko@linux.intel.com, 
	intel-gfx@lists.freedesktop.org, linux-hwmon@vger.kernel.org, anshuman.gupta@intel.com, 
	badal.nilawar@intel.com, ashutosh.dixit@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v2] drm/i915/hwmon: expose package temperature
Message-ID: <4nlwj725xkrb3zsulbehgqc7mpjjysnra3ep543ux5ewn7po4h@72psjd3dnw4v>
References: <20240906093118.3068732-1-raag.jadav@intel.com>
 <ec2f4b09-03f7-4866-ae50-2f3b5d093a0d@intel.com>
 <Ztw4JIWCpsDpMHN0@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ztw4JIWCpsDpMHN0@black.fi.intel.com>

Hi Raag,

> > > +	case hwmon_temp_input:
> > > +		with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
> > > +			reg_val = intel_uncore_read(ddat->uncore, hwmon->rg.pkg_temp);
> > > +
> > > +		/* HW register value is in degrees, convert to millidegrees. */
> > use millidegree Celsius here
> 
> The intent here is to signify the conversion rather than the unit.
> But okay, will add if we have another version.

is Riana asking to improve the comment here? Then please do, if
someone asks to make better comments it means that he is asking
to answer to an open question that someone might have in the
future.

Sending a v3 is not much of a work but improving the comment
later is not trivial.

Besides you need to retrigger tests anyway because you got a
BAT test failure :-)

Thanks,
Andi
