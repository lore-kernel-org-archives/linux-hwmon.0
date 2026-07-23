Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1C6447818;
	Thu, 23 Jul 2026 14:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784817791; cv=none; b=Khfl79lLR8+tKF35/PSEINKhbO3JT7rGZefes1DaxqIVujCdeJz6B+RSQYt1JD2w00uLqKaH2ex6GvIx2KLQSQLsHOi5wXKilmpYF8XTDsC5gspcuB+DQWha9+cnIAV3ON/sqaADD1q6vy1Xsrj7fkSWyk5MSkwCu9mWTxOHV+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784817791; c=relaxed/simple;
	bh=s+90TIMlAgkRuTbRIWsiZLA/SX5RB1AtNdi90FmN19I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d9EL+AhWyVcCOViLP/B08QGm0oOK6VkjUc+IGbv+fzGPtlKyxyQeQ9PDZBaKvb16JZeQ28EJzYsoM3qlUak+81cZoBkxunZnK7Gpk782rREZNenmjyNN8pAZ3GfDYxw6zRepTgwiHJEhruuIXNDwFL9L+s3qLcclAJNjE7+r9hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=Z+Jrows5; arc=none smtp.client-ip=212.27.42.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="Z+Jrows5"
Received: from L30177.local (unknown [213.36.7.12])
	(Authenticated sender: vjardin@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id B6741780506;
	Thu, 23 Jul 2026 16:42:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1784817784;
	bh=s+90TIMlAgkRuTbRIWsiZLA/SX5RB1AtNdi90FmN19I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z+Jrows52qPHrntvg9sDv9V2rMDrUu6s/E+qFGZY3LGYtFlnlGF4lboGNKnOdhvKs
	 LhiGKNet5JowFFAQAVfWtbNLlbhE4Jll/uTI7dhr6R7mM/wkHBZ/10llE7qX3uzeaZ
	 kQtxvCD/AL87F8KQZptQHl52DRG2mumIYKtGuTBzTzsNFBsvUmV74c+cFtfRnBVuKZ
	 3dhHLarj5n6f3BscBVeSP/JqaBWLfr01pr4NrEXsZmwiY8FHDqcsnd6DmiyKRRPAfU
	 iXCYPyriPz245P0hjRzHucNGmWcJFNGi+A05gFReNE+NEiMMw35d8OZNDIz5t0ZgvW
	 pk5WZKuGbRUdw==
Date: Thu, 23 Jul 2026 16:42:58 +0200
From: Vincent Jardin <vjardin@free.fr>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] hwmon: pmbus: add MPQ8646 driver
Message-ID: <amIocoxA_omNKz-I@L30177.local>
References: <20260723-mpq8646_v0-v1-0-14363c75916f@free.fr>
 <20260723-mpq8646_v0-v1-3-14363c75916f@free.fr>
 <20260723131952.198BD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260723131952.198BD1F000E9@smtp.kernel.org>

Hi Bot,

> [Severity: High]
> Does this pass stack-allocated buffers to i2c_transfer()? Since many I2C
> host controllers use DMA, mapping stack memory for DMA can cause a kernel
> panic if CONFIG_VMAP_STACK is enabled. Should these buffers be dynamically
> allocated?

According to Documentation/i2c/dma-considerations.rst:
"it is NOT mandatory that the buffer of an I2C message is DMA safe

Since DMA safety is opt-in per message via I2C_M_DMA_SAFE which means that
Users of i2c_transfer() shall set the I2C_M_DMA_SAFE flag manually,
and the host drivers doing DMA get "either msg->buf for the I2C_M_DMA_SAFE case
or a bounce buffer" from i2c_get_dma_safe_msg_buf().

These messages do not set the flag, and at 1 and 2 bytes they are far below the
about 8-byte DMA thresholds the same document describes. This is also a root-only
debugfs probe helper.

-> So no.

> Will these coefficients result in the correct voltage scaling? The Direct
> format equation converts register Y to physical X using
> X = (Y * 10^-R - b) / m. With m = 64, b = 0, and R = 1, the effective LSB is
> 10^-1 / 64 = 1.5625 mV/LSB.
> 
> To match the 6.4 mV/LSB mentioned in the macro comments, would the correct
> coefficients be m = 15625 and R = -2?

My code and comment were not aligned, comments updated for v2.

> [Severity: High]
> Does returning 0 here prevent the PMBus core from automatically unlocking the
> chip? The core initialization code checks PMBUS_WRITE_PROTECT and writes 0 to
> unlock it only if it appears enabled. By faking an unlocked state, the core
> skips the unlock command, which might cause the hardware to silently ignore
> sysfs configuration writes.

ok, shall be fixed for v2

> [Severity: Medium]
> Does this sequence need to hold mps_lock during the NVM register reads? If
> an nvmem read races with a force clear or an NVM store/restore operation, it
> might hit an undocumented NVM-busy window, resulting in NACKs and silently
> returning zero-filled snapshot data.

ok, shall be fixed for v2

> [Severity: Medium]
> Does this code leak the dentry reference returned by debugfs_lookup()? If the
> directory already exists, debugfs_lookup() returns it with an incremented
> reference count, which requires a matching dput() to prevent a memory leak.

ok, shall be fixed for v2

> [Severity: Medium]
> Does this unconditionally reschedule the worker even when an IRQ is already
> configured? If client->irq is present, taking the goto rearm path will cause
> the worker to perpetually wake up and reschedule itself without performing
> any checks.

ok, shall be fixed for v2

> [Severity: High]
> Can this early return cause a use-after-free in debugfs?
> 
> Since mpq8646_debugfs_register() has already created files referencing the
> devm_kzalloc-allocated priv struct, returning -EINVAL here leaves dangling
> dentry files. If these files are read later, they will dereference the freed
> priv structure. Should mpq8646_debugfs_unregister() be called before
> returning?

ok, shall be fixed for v2

Best regards,
  Vincent

> Sashiko AI review · https://sashiko.dev/#/patchset/20260723-mpq8646_v0-v1-0-14363c75916f@free.fr?part=3
