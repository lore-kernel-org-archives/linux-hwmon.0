Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8214254BD4
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Sep 2024 09:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726220775; cv=none; b=QIFgqVxmkiCksON7V9stVli4AtOBKveXaT5ng/onD9HSQvynZ3BXeUXVV85KklOjCLKKxT8c8DYRcCK+cIIV/46XDej23QYasZiCdBoSvXPvPnIZugO/JPnhRiZBj18D530eRP6qiufLlHUo1lXwetc+spylNw619igFz/OM9xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726220775; c=relaxed/simple;
	bh=ISwSCHYkXDb6Th83WAS8dgoZ4YDbI4MwUzDiPaxo5qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pdst/drB6jeggLRGBBAKLEmnDyzu0urIkJ3qLLzG+SqGe81R6Jgpjjl+bRxlpAfAGHoESIG1I0TyrZYXjBGMQm48Z2FaZpby9lfrdVUwOCY5KlGA8oXSwFN2ld13gzuwHsEiiMM+/h1HSFA0sT0dqLaOKUoWGs+isOggOyTxBDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sc0KWXyC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sc0KWXyC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C2B1C4CEC0;
	Fri, 13 Sep 2024 09:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726220775;
	bh=ISwSCHYkXDb6Th83WAS8dgoZ4YDbI4MwUzDiPaxo5qc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sc0KWXyCvO/dVw9q7eg7H3BtMnOLa9t+tfrduo72dHbiVjdOdmmIpEHtAzMr3gzqV
	 bmpLuTm3wAAxbHzF98UHTRcnjpQjIPhpKGXr3kWqZJ5tQjkoyolpDmbvffrvi64ECN
	 +HL3QZSrifPQVrozSs71gNxkCVxlFudkS/YEkKRhuGtbBsEA4jXlvuf2hwcFqe2oZB
	 DJupsqIomQTzlcdLFP52WtJG/BYjQQeBH04t3KiXV6rk4oNrEfAPcg9tHYpBkQMkqo
	 oHMq03C5KRyPye/wAYHVCogAQW0Z6XTNaCkNiB1qJxk3S86XtRgozInnooVXf/m82w
	 ornCqAyh/1lPw==
Date: Fri, 13 Sep 2024 11:46:10 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Raag Jadav <raag.jadav@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>, andi.shyti@linux.intel.com, 
	jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, 
	tursulin@ursulin.net, linux@roeck-us.net, andriy.shevchenko@linux.intel.com, 
	intel-gfx@lists.freedesktop.org, linux-hwmon@vger.kernel.org, anshuman.gupta@intel.com, 
	badal.nilawar@intel.com, ashutosh.dixit@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v3] drm/i915/hwmon: expose package temperature
Message-ID: <go5gwihnfslcmcxpqiajxg35pniov4pjlpkkb33bp5o3wftk7s@6kodd3ugl7wc>
References: <20240910105242.3357276-1-raag.jadav@intel.com>
 <b0eb87b5-e42d-4ab0-9d48-7ca07ef80708@intel.com>
 <ZuP9Cvd_LfJS_Yir@black.fi.intel.com>
 <htzuvg2nupr6glndudxywz7uzbbjmgpecge4krll4fz2e35bdq@c7ague67qzx6>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <htzuvg2nupr6glndudxywz7uzbbjmgpecge4krll4fz2e35bdq@c7ague67qzx6>

Hi Raag,

On Fri, Sep 13, 2024 at 10:57:00AM GMT, Andi Shyti wrote:
> On Fri, Sep 13, 2024 at 11:51:22AM GMT, Raag Jadav wrote:
> > On Fri, Sep 13, 2024 at 11:14:22AM +0530, Riana Tauro wrote:
> > > On 9/10/2024 4:22 PM, Raag Jadav wrote:
> > > > Add hwmon support for temp1_input attribute, which will expose package
> > > > temperature in millidegree Celsius. With this in place we can monitor
> > > > package temperature using lm-sensors tool.
> > > > 
> > > > $ sensors
> > > > i915-pci-0300
> > > > Adapter: PCI adapter
> > > > in0:         990.00 mV
> > > > fan1:        1260 RPM
> > > > temp1:        +45.0°C
> > > > power1:           N/A  (max =  35.00 W)
> > > > energy1:      12.62 kJ
> > > > 
> > > > v2: Use switch case (Anshuman)
> > > > v3: Comment adjustment (Riana)
> > > > 
> > > > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11276
> > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > > > Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> > > Looks good to me
> > > Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> > 
> > Thank you :)
> > 
> > Andi, can you pick this one up? Anshuman's machine is down.
> 
> Sure!

merged to drm-intel-next.

Thanks,
Andi
