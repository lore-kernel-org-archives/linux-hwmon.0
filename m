Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A5E149C57
	for <linux-hwmon@vger.kernel.org>; Thu, 13 Jun 2024 17:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718298319; cv=none; b=uJ2+YHupwLZauBafU/9LEKXWjJ7IZOnL8iDcOKkYF6Sim8DXmzeCyTF+5NsvlcVospvkApZHXs+gCr3jddruFb766pwW7MchpcuLZI5jUrhSBqy3XvC2Tt0IDLxRaRpta1esbEwSUbgL3hOrfRt70JWkC2FrOGJ4mYCq8G7y8fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718298319; c=relaxed/simple;
	bh=jFnL2eqmbJg8XKrczu9UPC6nU72DOpEWCvPJLjmelzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P2p9VeknFFJmG95WfRCN5HiNPzDmOL8ZsmM4VOgeMa868XjNGzjouNoVvkwXmELqNKDYHnP704pgztniVh/uQJap1Dm/taHxXWmPmiY/pRZNs0tFtwKQhitGj6z8h3GCx+zpLYa2/hBhe+QX4xDCKHsviyJlNQT5idirxDJK4q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GAV3Ybqw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GAV3Ybqw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96BDBC2BBFC;
	Thu, 13 Jun 2024 17:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718298319;
	bh=jFnL2eqmbJg8XKrczu9UPC6nU72DOpEWCvPJLjmelzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GAV3YbqwNJNhHW8JjdB4BDsm/yEyUwD6haXg+qZw1nUyylZo0dhhaWEkcezS8EKVc
	 pI1m+sMU1tdeL9QMHcp6V0TNDMF68hg0Hf6ECQB3hJcluEI0hS6/InYAneuYqLY8oH
	 Covr6paADXhkbiO4/LVYEuJadFyCctDeII+XFVeu4xqCF+9PiDqc74kvkT/D0bGRQy
	 XfXc6e+bHxoN4+OS0f5Kx5H4CZ8zQl9Oh9OGL6qRkOuPhPsn3nYUanErLEQjZwDWbh
	 x0yJcCuJG7kzzARbxBfHrAGq2/38P+azAd1xwjCJFDwnq4kBR+1f1gEt/ayM9OcvWL
	 MqeYo71qlt0TQ==
Date: Thu, 13 Jun 2024 18:05:14 +0100
From: Lee Jones <lee@kernel.org>
To: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Cc: linux-hwmon@vger.kernel.org, inux-kernel@vger.kernel.org,
	linux@roeck-us.net, gregkh@linuxfoundation.org, arnd@arndb.de,
	Akshay Gupta <akshay.gupta@amd.com>
Subject: Re: [PATCH 0/5] mfd: add amd side-band functionality
Message-ID: <20240613170514.GQ2561462@google.com>
References: <20240530112307.3089696-1-naveenkrishna.chatradhi@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240530112307.3089696-1-naveenkrishna.chatradhi@amd.com>

On Thu, 30 May 2024, Naveen Krishna Chatradhi wrote:

> From: Akshay Gupta <akshay.gupta@amd.com>
> 
> At present, sbrmi under hwmon subsystem is probed as an i2c 
> driver and reports power.
> 
> However, APML interface defines few other protocols to support
> OOB system management functionality.
> 
> This patchset the following
> 1. Based on hwmon maintainers feedback, move the i2c client
>    probe and sbrmi core functionality to drivers/mfd/
> 2. Add an MFD cell, which probes the hwmon/sbrmi and continues to
>    report power using the symbol exported by the mfd/sbrmi-core.
> 3. Convert i2c to regmap which provides multiple benefits
>    over direct smbus APIs.
> 4. Register a misc device which provides 
>     a. An ioctl interface through node /dev/sbrmiX
>     b. Open-sourced and widely used https://github.com/amd/esmi_oob_library
>        will continue to provide user-space programmable API for the following
>       - Mailbox xfer (already defined in sbrmi_mailbox_xfer())
>       - CPUID access
>       - MCAMSR access
> 
> Akshay Gupta (5):
>   hwmon/mfd sbrmi: Move core sbrmi from hwmon to MFD
>   mfd: sbrmi: Add mfd cell to I2C probe to be used by hwmon
>   mfd/hwmon sbrmi: Use regmap subsystem
>   mfd: sbrmi: Clear sbrmi status register bit SwAlertSts
>   mfd/hwmon: sbrmi: Add support for APML protocols
> 
>  drivers/hwmon/Kconfig         |   1 +
>  drivers/hwmon/sbrmi.c         | 284 +++-----------------
>  drivers/mfd/Kconfig           |   9 +-
>  drivers/mfd/Makefile          |   2 +
>  drivers/mfd/sbrmi-core.c      | 490 ++++++++++++++++++++++++++++++++++

It's not clear to me what any of these 500 lines do, but they do not
look like a good fit for MFD.  Perhaps I'm missing something.  Can you
provide some more information about the device and why you think MFD is
a suitable location for it?

>  drivers/mfd/sbrmi-core.h      |  37 +++
>  drivers/mfd/sbrmi-i2c.c       | 165 ++++++++++++
>  include/linux/mfd/amd-sb.h    |  55 ++++
>  include/uapi/linux/amd-apml.h |  74 +++++
>  9 files changed, 871 insertions(+), 246 deletions(-)
>  create mode 100644 drivers/mfd/sbrmi-core.c
>  create mode 100644 drivers/mfd/sbrmi-core.h
>  create mode 100644 drivers/mfd/sbrmi-i2c.c
>  create mode 100644 include/linux/mfd/amd-sb.h
>  create mode 100644 include/uapi/linux/amd-apml.h
> 
> -- 
> 2.25.1
> 

-- 
Lee Jones [李琼斯]
