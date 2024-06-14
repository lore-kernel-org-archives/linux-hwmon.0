Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B788489
	for <linux-hwmon@vger.kernel.org>; Fri, 14 Jun 2024 14:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718376575; cv=none; b=hsFbr/guGBb77xkYK2uV9ddkzwIxMoE2SoRc6WkTAKVJor4CjRyEjrGfSRNcZvX2Ju1uL/p05yN2O+1rMmkfqecGEMpVRQNnlJWgCtfwOQTxYHNaWriRZzT39bm9ROaG9uhvlU8CbVJh/0WR0j1bA721tKUA+nKSL6yUUTpQvOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718376575; c=relaxed/simple;
	bh=Saasomk/NdIiwuCB3ajluKIEyesYFfT2sW5qKknf4/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ImRrieQJoKb3xo25ibMDWQew4IDin62n1Yy637Rpx/ADrIwBU7rk+JailfPHQFpuUyLhh2ebDRZexNmQtSm3Zl37VSvWl9RvVz4ZDOy5Ie0LjSrb904tubFkkTfeEigyL2pZVLjijMmm76l1vPMv+kP+/1BccOv771j7bhsusCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aS74eviN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aS74eviN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29218C2BD10;
	Fri, 14 Jun 2024 14:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718376574;
	bh=Saasomk/NdIiwuCB3ajluKIEyesYFfT2sW5qKknf4/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aS74eviNAfSFdP2vo1HJXXFpig6+JXgOXnZBNO0RceS8p0UT2ectDoNPHSIElp1MN
	 Uz/DI/QzkrKyFVPQgoc56IhvT9xkoqia6ZjjBuDuM9DRW7b4xuRk+29p/kBWbUUurU
	 OH+zIpZK+UqyS9qzctFLNuJMvhRZmtumhdyWiJcrbELzV7zGYlayjCr3tXAejY9tZw
	 hcpEeyjyeMi+zd2gw7Ua/eGb4B7Q8FSVUe//PSADAAwgOc4rfgkoiP1+8Et+xICj9V
	 zHFU72wz/4A79pFIVSzzRXIGuKwYtfbvQMXxE713PwkN5UvW3AdhnOUVxXrfmrmhFx
	 RkIBP+T5+tIMA==
Date: Fri, 14 Jun 2024 15:49:30 +0100
From: Lee Jones <lee@kernel.org>
To: "Chatradhi, Naveen Krishna" <naveenkrishna.chatradhi@amd.com>
Cc: linux-hwmon@vger.kernel.org, inux-kernel@vger.kernel.org,
	linux@roeck-us.net, gregkh@linuxfoundation.org, arnd@arndb.de,
	Akshay Gupta <akshay.gupta@amd.com>
Subject: Re: [PATCH 0/5] mfd: add amd side-band functionality
Message-ID: <20240614144930.GJ3029315@google.com>
References: <20240530112307.3089696-1-naveenkrishna.chatradhi@amd.com>
 <20240613170514.GQ2561462@google.com>
 <e37f0503-0ae2-4651-8e32-1e6444e852c2@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e37f0503-0ae2-4651-8e32-1e6444e852c2@amd.com>

On Fri, 14 Jun 2024, Chatradhi, Naveen Krishna wrote:

> 
> On 6/13/2024 10:35 PM, Lee Jones wrote:
> > Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> > 
> > 
> > On Thu, 30 May 2024, Naveen Krishna Chatradhi wrote:
> > 
> > > From: Akshay Gupta <akshay.gupta@amd.com>
> > > 
> > > At present, sbrmi under hwmon subsystem is probed as an i2c
> > > driver and reports power.
> > > 
> > > However, APML interface defines few other protocols to support
> > > OOB system management functionality.
> > > 
> > > This patchset the following
> > > 1. Based on hwmon maintainers feedback, move the i2c client
> > >     probe and sbrmi core functionality to drivers/mfd/
> > > 2. Add an MFD cell, which probes the hwmon/sbrmi and continues to
> > >     report power using the symbol exported by the mfd/sbrmi-core.
> > > 3. Convert i2c to regmap which provides multiple benefits
> > >     over direct smbus APIs.
> > > 4. Register a misc device which provides
> > >      a. An ioctl interface through node /dev/sbrmiX
> > >      b. Open-sourced and widely used https://github.com/amd/esmi_oob_library
> > >         will continue to provide user-space programmable API for the following
> > >        - Mailbox xfer (already defined in sbrmi_mailbox_xfer())
> > >        - CPUID access
> > >        - MCAMSR access
> > > 
> > > Akshay Gupta (5):
> > >    hwmon/mfd sbrmi: Move core sbrmi from hwmon to MFD
> > >    mfd: sbrmi: Add mfd cell to I2C probe to be used by hwmon
> > >    mfd/hwmon sbrmi: Use regmap subsystem
> > >    mfd: sbrmi: Clear sbrmi status register bit SwAlertSts
> > >    mfd/hwmon: sbrmi: Add support for APML protocols
> > > 
> > >   drivers/hwmon/Kconfig         |   1 +
> > >   drivers/hwmon/sbrmi.c         | 284 +++-----------------
> > >   drivers/mfd/Kconfig           |   9 +-
> > >   drivers/mfd/Makefile          |   2 +
> > >   drivers/mfd/sbrmi-core.c      | 490 ++++++++++++++++++++++++++++++++++
> > It's not clear to me what any of these 500 lines do, but they do not
> > look like a good fit for MFD.  Perhaps I'm missing something.  Can you
> > provide some more information about the device and why you think MFD is
> > a suitable location for it?
> 
> Hi lee,
> 
> Data center processors from AMD provide a side-band (often called
> out-of-band) path for manageability
> 
> called Advanced Platform Management Link (APML), which consists of i2c/i3c
> client devices called
> 
> Side-band Remote Management Interface (SB-RMI) and Side-band Temperature
> Sensor Interface (SB-TSI).
> 
> 
> We have i2c client drivers upstreamed under drivers/hwmon sbrmi.c and
> sbtsi_temp.c reporting power and
> 
> temperature via hwmon interfaces. However, sbrmi device can also provide
> performance, telemetry and RAS

MFD knows nothing of these characteristics.

> monitoring, management using AMD defined protocols. One of them
> sbrmi_mailbox_xfer()is defined in

I large portion of this should be moved out to drivers/mailbox.

> drivers/hwmon/sbrmi.c.
> 
> Patchset would do the following
> 
> 1. Move core functionality from hwmon/sbrmi.c to drivers/mfd/sbrmi-i2c.c as
> an i2c_driver.
> 
> 2. Convert the hwmon/sbrmi.c to a platform driver.
> 
> 3. Use mfd_add_devices() API to add cells which will probe the platform
> driver under hwmon/sbrmi.c

How many devices will mfd_add_devices() be registering?

> 4. drivers/mfd/sbrmi-core.c will contain the common functions which can be
> used by i2c and i3c based drivers, such as
> 
> core protocol definitions, creation of misc device and an ioctl for the user

drivers/misc?

> interface.
> 
> This patchset is an attempt toadd support for these core protocols in such a
> way that Open-sourced and widely used
> https://github.com/amd/esmi_oob_library will continue to provide user-space
> programmable API. regards, Naveenk
> 
> > >   drivers/mfd/sbrmi-core.h      |  37 +++
> > >   drivers/mfd/sbrmi-i2c.c       | 165 ++++++++++++
> > >   include/linux/mfd/amd-sb.h    |  55 ++++
> > >   include/uapi/linux/amd-apml.h |  74 +++++
> > >   9 files changed, 871 insertions(+), 246 deletions(-)
> > >   create mode 100644 drivers/mfd/sbrmi-core.c
> > >   create mode 100644 drivers/mfd/sbrmi-core.h
> > >   create mode 100644 drivers/mfd/sbrmi-i2c.c
> > >   create mode 100644 include/linux/mfd/amd-sb.h
> > >   create mode 100644 include/uapi/linux/amd-apml.h
> > > 
> > > --
> > > 2.25.1
> > > 
> > --
> > Lee Jones [李琼斯]

-- 
Lee Jones [李琼斯]
