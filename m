Received: from smtpfb1-g21.free.fr (smtpfb1-g21.free.fr [212.27.42.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CA3036655D;
	Thu, 23 Jul 2026 20:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784838203; cv=none; b=Lk4P8ibnNXqyvEviumr3sg2cGaBDB9wlSPa10s91wRaeR407E/E50ii7MInI4yiNMpl/G0GvvwH2b8Q8ZcgTg19KduKGcUEgFT/D7VzF14rfXMKDwsFAq37+GnSKh7lSeOSC49fJEEMc06IR8Cqfvpnm3mP5jKYS3AiF9pChtVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784838203; c=relaxed/simple;
	bh=DFY3Uzx+4ICb+0rQ1bSYdRMAl6vfvJhy/9J+rNwPn9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LQ9YtAXsbCQggVC+uN+gnBOG8kYaCFbdWSsicRKVMIr3uLJ870v0QmTMi6v+Hx/ixPy5GA1lRsbwVfCgk01kodmkIvoTW6XDAQ+lMWcFbqljXFYkpJAsEZr3qTHcCO4a6cAXCrJJPVeGOmo2Pt93NAz4jsh29bkRXKfGXfG7j7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=Xe/+QOrr; arc=none smtp.client-ip=212.27.42.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="Xe/+QOrr"
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id 4E6DD8351CD;
	Thu, 23 Jul 2026 22:23:16 +0200 (CEST)
Received: from L30177.local (unknown [IPv6:2a01:e0a:ac2:22b0:8906:6856:2485:2c53])
	(Authenticated sender: vjardin@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id F0AED19F5BE;
	Thu, 23 Jul 2026 22:23:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1784838188;
	bh=DFY3Uzx+4ICb+0rQ1bSYdRMAl6vfvJhy/9J+rNwPn9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xe/+QOrrRzfrKMK2G8b7wv8NdvqXQNJZr0fknroRf6qCt7XnU3BmV7CjowcT319pC
	 tQABt5y/2YLH39fEq2j5b0QYu5oevE3mK9bIMAPhBIdNsCOSz3gzKjVhJ77Sb2MD+I
	 YHfrcPRj2DXcCA8t+SviTmFS1zrBN/h74yGfkWgSsKXR9C3udlSdVQDD0gjvrDVWbR
	 yfurKTWUO2WHmMz4R7PFZlIlmZw6RvbAm6T4yX3Qbc10yJVUw6gbvjCmbeRWp1e84k
	 9b1fxw6I2LF8KI0X73HTUL8t1q4NqOqCeeBuWLEZ+38TFfW7H9T9OtHndev7I1l4vx
	 fN+NQLUa2S8Tg==
Date: Thu, 23 Jul 2026 22:23:02 +0200
From: Vincent Jardin <vjardin@free.fr>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] hwmon: pmbus: add MPQ8646 driver
Message-ID: <amJ4JvsnoQNIaTaD@L30177.local>
References: <20260723-mpq8646_v0-v2-0-3c4cb71f23c0@free.fr>
 <20260723-mpq8646_v0-v2-3-3c4cb71f23c0@free.fr>
 <20260723160717.8AEA61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260723160717.8AEA61F000E9@smtp.kernel.org>

Hi Mr. Bot,

> [Severity: High]
> Is it safe to pass stack-allocated buffers to i2c_transfer() here?
> If the underlying I2C adapter driver uses DMA for transfers, dma_map_single()
> will attempt to map these stack addresses. On systems with virtually mapped
> stacks, this violates DMA mapping rules and could lead to memory corruption.

It was already argued into v1, no change. See v1's answer to your analysis.

> [Severity: Low]
> Does this hook effectively intercept page writes?
> The write_byte callback is used for the PMBus Send Byte protocol, but PMBus
> page changes use the Write Byte Data protocol via i2c_smbus_write_byte_data().
> It appears page changes will completely bypass this check.

You have a point, I'll send a v3

> [Severity: Medium]
> Does this sequence bypass the PMBus core serialization?
> By using the private mps_lock instead of pmbus_lock(), the PMBus core could
> concurrently issue sysfs reads during these NVMEM reads.

I'll propose something for the v3.

> [Severity: Low]
> Could concurrent debugfs writes cause torn diagnostic state here?
> The last_probe_rc and last_probe_data variables are updated sequentially
> without synchronization. This might expose mismatched values to userspace
> readers in mpq8646_dbg_last_probe_show().

Yes !, v3

> [Severity: Low]
> Could this direct hardware page write desynchronize the PMBus core page cache?
> Since the core's software page cache is not updated, and the driver declares
> pages = 1, the core assumes page switches are unnecessary and will not restore
> it. This could cause sysfs telemetry to return incorrect data until reload.

OK, I did revisit it. Because the chip is for .pages = 1, the core never re-writes
PMBUS_PAGE, so a raw write of a non-zero page via this debugfs hook would
fail with the hardware on that page and the core would keep reading it as page 0
until a reload

So v3 will remove probe_page_write entirely (same rationale as dropping the
now-useless PMBUS_PAGE swallow in write_byte).

> [Severity: Medium]
> Does this multi-step unlock sequence bypass pmbus_lock()?
> The PMBus core could issue interleaved sysfs reads while the chip is unlocked
> or busy writing to NVM, potentially leading to I2C NACKs.

yep, ok.
The v3 will wrap the whole sequence with pmbus_lock()/pmbus_unlock(),
nested outside the existing mps_lock.

> [Severity: Medium]
> How is the worker restarted if a user writes to this debugfs file after
> disabling polling?
> Because the variable is exported directly without a setter function, writing
> a non-zero value updates the integer but fails to call schedule_delayed_work()
> to re-arm the worker.

right, the raw debugfs_create_u32() export cannot re-arm the worker.
I'll check it.

> [Severity: Medium]
> Does this direct hardware telemetry access also bypass pmbus_lock()?
> Without the core lock, concurrent accesses from this background worker
> could conflict with other sysfs polling.

Confirmed. The next v3 will wraps the worker's STATUS_WORD read within
pmbus_lock()/pmbus_unlock(), so it shall no longer race the
core's sysfs telemetry accesses.

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260723-mpq8646_v0-v2-0-3c4cb71f23c0@free.fr?part=3
