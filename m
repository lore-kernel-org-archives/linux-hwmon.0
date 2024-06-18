Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D56F73467
	for <linux-hwmon@vger.kernel.org>; Tue, 18 Jun 2024 12:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718713677; cv=none; b=bBVHlqiu8PXclN7Q2xPbmFa+GSmYanqDJ6nACM2mmENs9lf9t6MnKSyFc0KkgxTOaOE54rJ6VGzGXfQaSfovV9pbXjtftukm5zdaZYG/7CoRFnKMS4FbzhoUkxEW/txSgoFbR0id/FnGeZaJ+aRyVBsEVmWamDVK4eZXmDZiXFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718713677; c=relaxed/simple;
	bh=atH244BK2bEDImAtYnMC1q1A3GAJrnthGs4GMjNkN+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=feGe2edKvDOlqXPqmNyDc5z/150/cwwFFQmOziKP/3kbmeYglxI2aui2zC40FKC/5szdT/G4Uzx5cD7Vy10qwAlu+TQhREz4+KmbZvLIf+iT6iYO3wwnM4TVZnq26ZOdBiTdalVOSTDaBkV7jUwIKlCW5t4OSTrnjW4lVdhNpC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y61w47Vx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y61w47Vx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86240C3277B;
	Tue, 18 Jun 2024 12:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718713677;
	bh=atH244BK2bEDImAtYnMC1q1A3GAJrnthGs4GMjNkN+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y61w47VxG3444ObprlgOydnSQGb5SY+jn3fhGJcLnQiasOpVasutoVcTqVnefHMze
	 0VFV3QESGBf8xF/q16cRT63NmaI5tQeYnt6FFbBK/oJriuqydwf1ddHNq13KawNEva
	 WrUHf4cpaH9BNMeDB+qhs75AvVGKHoVeYRqbFOcDyfZ2X+Xl9qOSKv+CsCOL4QJV+c
	 M04/SQIv3/V+LUkhoI14iA0DA01X97zOmBAoyUm+pHhhZ2VrHsAmN8imYq2CYeo2Ho
	 8ryiUYsZlhsTxk8xys0JSUziVzzCtdShyVysmfON30cfw9KK3Aj0thI8kofAEGFeR0
	 mhqamdBMJVX9w==
Date: Tue, 18 Jun 2024 13:27:52 +0100
From: Lee Jones <lee@kernel.org>
To: "Chatradhi, Naveen Krishna" <naveenkrishna.chatradhi@amd.com>
Cc: linux-hwmon@vger.kernel.org, inux-kernel@vger.kernel.org,
	linux@roeck-us.net, gregkh@linuxfoundation.org, arnd@arndb.de,
	Akshay Gupta <akshay.gupta@amd.com>
Subject: Re: [PATCH 0/5] mfd: add amd side-band functionality
Message-ID: <20240618122752.GX3029315@google.com>
References: <20240530112307.3089696-1-naveenkrishna.chatradhi@amd.com>
 <20240613170514.GQ2561462@google.com>
 <e37f0503-0ae2-4651-8e32-1e6444e852c2@amd.com>
 <20240614144930.GJ3029315@google.com>
 <19708a93-be04-4163-b111-68d5f71487ef@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19708a93-be04-4163-b111-68d5f71487ef@amd.com>

On Tue, 18 Jun 2024, Chatradhi, Naveen Krishna wrote:

> 
> On 6/14/2024 8:19 PM, Lee Jones wrote:
> > Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> > 
> > 
> > On Fri, 14 Jun 2024, Chatradhi, Naveen Krishna wrote:
> > 
> > > On 6/13/2024 10:35 PM, Lee Jones wrote:
> > > > Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> > > > 
> > > > 
> > > > On Thu, 30 May 2024, Naveen Krishna Chatradhi wrote:
> > > > 
> > > > > From: Akshay Gupta <akshay.gupta@amd.com>
> > > > > 
> > > > > At present, sbrmi under hwmon subsystem is probed as an i2c
> > > > > driver and reports power.
> > > > > 
> > > > > However, APML interface defines few other protocols to support
> > > > > OOB system management functionality.
> > > > > 
> > > > > This patchset the following
> > > > > 1. Based on hwmon maintainers feedback, move the i2c client
> > > > >      probe and sbrmi core functionality to drivers/mfd/
> > > > > 2. Add an MFD cell, which probes the hwmon/sbrmi and continues to
> > > > >      report power using the symbol exported by the mfd/sbrmi-core.
> > > > > 3. Convert i2c to regmap which provides multiple benefits
> > > > >      over direct smbus APIs.
> > > > > 4. Register a misc device which provides
> > > > >       a. An ioctl interface through node /dev/sbrmiX
> > > > >       b. Open-sourced and widely used https://github.com/amd/esmi_oob_library
> > > > >          will continue to provide user-space programmable API for the following
> > > > >         - Mailbox xfer (already defined in sbrmi_mailbox_xfer())
> > > > >         - CPUID access
> > > > >         - MCAMSR access
> > > > > 
> > > > > Akshay Gupta (5):
> > > > >     hwmon/mfd sbrmi: Move core sbrmi from hwmon to MFD
> > > > >     mfd: sbrmi: Add mfd cell to I2C probe to be used by hwmon
> > > > >     mfd/hwmon sbrmi: Use regmap subsystem
> > > > >     mfd: sbrmi: Clear sbrmi status register bit SwAlertSts
> > > > >     mfd/hwmon: sbrmi: Add support for APML protocols
> > > > > 
> > > > >    drivers/hwmon/Kconfig         |   1 +
> > > > >    drivers/hwmon/sbrmi.c         | 284 +++-----------------
> > > > >    drivers/mfd/Kconfig           |   9 +-
> > > > >    drivers/mfd/Makefile          |   2 +
> > > > >    drivers/mfd/sbrmi-core.c      | 490 ++++++++++++++++++++++++++++++++++
> > > > It's not clear to me what any of these 500 lines do, but they do not
> > > > look like a good fit for MFD.  Perhaps I'm missing something.  Can you
> > > > provide some more information about the device and why you think MFD is
> > > > a suitable location for it?
> > > Hi lee,
> > > 
> > > Data center processors from AMD provide a side-band (often called
> > > out-of-band) path for manageability
> > > 
> > > called Advanced Platform Management Link (APML), which consists of i2c/i3c
> > > client devices called
> > > 
> > > Side-band Remote Management Interface (SB-RMI) and Side-band Temperature
> > > Sensor Interface (SB-TSI).
> > > 
> > > 
> > > We have i2c client drivers upstreamed under drivers/hwmon sbrmi.c and
> > > sbtsi_temp.c reporting power and
> > > 
> > > temperature via hwmon interfaces. However, sbrmi device can also provide
> > > performance, telemetry and RAS
> > MFD knows nothing of these characteristics.
> 
> Yes, we will modify the implementation to define ops structure with
> functionality that
> 
> can be called by platforms drivers in hwmon and other subsystems.
> 
> > 
> > > monitoring, management using AMD defined protocols. One of them
> > > sbrmi_mailbox_xfer()is defined in
> > I large portion of this should be moved out to drivers/mailbox.
> 
> we have explored the mailbox subsystem, APML xfer is not a ful-fledge
> mailbox interface as such,
> 
> it is a custom protocol, which accepts inputs and provides outputs over
> i2c/i3c. It does not support
> 
> multichannel (tx/rx) or have IRQs or a memory mapped IO and it is one of the
> protocols supported
> 
> by the RMI device.
> 
> > 
> > > drivers/hwmon/sbrmi.c.
> > > 
> > > Patchset would do the following
> > > 
> > > 1. Move core functionality from hwmon/sbrmi.c to drivers/mfd/sbrmi-i2c.c as
> > > an i2c_driver.
> > > 
> > > 2. Convert the hwmon/sbrmi.c to a platform driver.
> > > 
> > > 3. Use mfd_add_devices() API to add cells which will probe the platform
> > > driver under hwmon/sbrmi.c
> > How many devices will mfd_add_devices() be registering?
> 
> This patch is adding one hwmon device.
> 
> We can add additional cell which probes a platform driver in drivers/misc
> which handles
> 
> the user space interface part.

It sounds like MFD is (once more) being used as a dumping ground for
random devices which do not fit anywhere else.  A Multi-Function Device
driver's role is to create shared resources (memory, IRQs, Clocks,
Regulators, etc) for and register more than one real device that uses
those shared resources, that's all.  Even if you were to move the Misc
part out, using that as a second device to prove it MFD-worthy is not
going to fly.  Take a look at what these devices usually consist of:

  git grep -W "struct mfd_cell.*{" -- drivers/mfd

This submission results in a 650-line driver that registers a single
cell.  One that is attributed only to the device it's being removed
from.

I see that Guenter already said:

  "This is not hardware monitoring functionality and would have to
  reside elsewhere, outside the hwmon subsystem."

Well it's not MFD functionality either.  Sorry.

-- 
Lee Jones [李琼斯]
