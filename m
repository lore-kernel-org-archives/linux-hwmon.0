Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D483D9DC8;
	Sun, 20 Sep 2026 06:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789885422; cv=none; b=gbzIPuojQSBMJ4QiUL6Ju86PjvztEoas7Kw9dYavSLdqwezHfCuVz6rBE973TsCsMZTsRzPhGBSH+wAF5deelSE4NvNaLghpzznS1ErsSoWOtDVQB2LQP8crqWbq+VQAHT5gYUmuzEeZwzOSfCDdN3SV5Mub3euQYG+yo725z4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789885422; c=relaxed/simple;
	bh=CnkKxM+1BOOz8jRFOwG/jq3a7TFgC1pGgIXUl1bMxVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I/4VgVWD3Tm5FXTDEY8fr7m5EiLEudpKhOdPol0IXyXAyxSS+CMwJaxl9NGgxUFupaHhBBmNJexlYoMRrL6SW2UPQ+BbtatrYJ0Xu2Z78L6HLAK2Bh36CDW77CrK7RcnZC3h41meTNhgvc3DHedxfYi8eq8fHUOsdswE9kiJgZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=gVVUekOa; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="gVVUekOa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=oX
	DxTNY7UTbkhWm6RoF5VVFhpxPvYGKLr0gOewXHrZg=; b=gVVUekOapKmHKn9zKh
	TImJNuJD5Io7W5tCRP3p+UJ8Cv+Z0mnf6z416dpwT9Klw/fpS2u9kdLyW9ns/vxD
	F9EVXAE/pMdPOumm0e/CtdmyxCgDWOBSB4O6YxMddAtnPU8NgopffoVVlKcK9l39
	1JJzs8KzXvkx+UknHao/LijGw=
Received: from debian.lenovo.com (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wBX5l+oe69q2VvwBg--.62082S3;
	Sun, 20 Sep 2026 14:22:36 +0800 (CST)
From: Kean Ren <rh_king@163.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kean Ren <rh_king@163.com>
Subject: [PATCH 0/1] hwmon: (spd5118) support write protected devices
Date: Sun, 20 Sep 2026 14:22:25 +0800
Message-ID: <20260920062230.2437291-2-rh_king@163.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920062230.2437291-1-rh_king@163.com>
References: <20260920062230.2437291-1-rh_king@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBX5l+oe69q2VvwBg--.62082S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxWr45uFyxur13Aw4rGr4fAFb_yoW7Jr4fpa
	97J3yftr4DtFW7CFsrCr48Aa45AF4rJ3y7Jr1xtw1Uuwn8W342qFWIvr4YqayUCrnaya4q
	qrs0q34DGrWDAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRhF4_UUUUU=
X-CM-SenderInfo: 5ukbyxlqj6il2tof0z/xtbC-AyQP2qve6zKOgAA39

This patch makes the spd5118 driver usable on systems that do not allow
writes to SPD devices, while keeping the temperature sensor available.

Problem
=======
On many systems the SMBus controller is configured to block writes to SPD
addresses 0x50-0x57. On the i801 family this is SPD Write Disable
(SMBHSTCFG bit 4), set by the BIOS; reads are unaffected. There is no way
for a driver to query this.

The driver assumes that it can write to the device, which does not hold on
such systems:

 - writes to the hwmon attributes always fail with -ENXIO
 - the temperature sensor disable in spd5118_suspend() fails silently
 - spd5118_resume() fails in regcache_sync(), and the kernel reports a
   device resume failure:

     spd5118 0-0050: Failed to write b = 0: -6
     spd5118 0-0050: PM: failed to resume async: error -6

Register 0xb in that message is the page selector register, which regmap
writes back from its cache at the end of regcache_sync(). The write of the
saved configuration register before that fails as well, but the cache code
does not report that error.

What the patch does
===================
Detect write protection once at probe time by writing the page selector
register back with the value just read from it. This is a no-op on a device
which accepts writes, and it fails if writes are blocked. If writes are not
possible, run the device read-only:

 - drop the register cache (REGCACHE_NONE), so that regcache_sync() cannot
   attempt any write; this is what makes resume work
 - skip the writes in the suspend and resume callbacks
 - expose the writable attributes as 0444
 - do not clear a latched alarm status from the alarm read path, as that
   requires a write
 - limit the nvmem 'eeprom' attribute to the currently selected page,
   instead of returning errors for pages that cannot be reached

What is kept
============
The temperature sensor remains usable. For a chip which is already on page
0 - the normal case - reading the temperature and the temperature limits
does not need any write: regmap only writes the page selector when the
selected page actually changes.

What is not available on such systems
=====================================
 - the temperature limits cannot be configured
 - the sensor cannot be disabled during suspend, so it keeps running
 - SPD EEPROM pages 1..7 are not readable, because selecting a page is
   itself a write (the attribute is limited accordingly)
 - a chip which reports a non-zero page and needs the page reset in
   spd5118_i2c_init() is still rejected at probe, since that reset is also
   a write

Relation to earlier proposals
=============================
Two other approaches were posted for the same problem:

1) Make the driver read-only as well, and additionally avoid instantiating
   it on an i801 adapter when SPD writes are disabled:

     hwmon: (spd5118) restrict writes under SPD write protection
     https://lore.kernel.org/all/20250416-for-upstream-spd5118-spd-write-prot-detect-v1-2-8b3bcafe9dad@canonical.com/

     i2c: i801: don't instantiate spd5118 under SPD Write Disable
     https://lore.kernel.org/all/20250430-for-upstream-i801-spd5118-no-instantiate-v2-2f54d91ae2c7@canonical.com/

2) Expose the restriction as an adapter quirk and have spd5118 fail probe,
   on the grounds that write access is mandatory (including a follow-up
   suggestion to skip SPD instantiation on such adapters):

     i2c: i801: Detect SPD Write Disable and expose as adapter quirk
     https://lore.kernel.org/all/20260205102942.28745-1-tinsaetadesse2015@gmail.com/

This patch is deliberately limited to the driver side. It is complementary
to gating instantiation on the adapter side rather than competing with it:
not instantiating avoids probing a driver which cannot work on a given bus,
while tolerating a write protected device keeps the driver correct when it
is instantiated anyway - from devicetree, from userspace via new_device, or
on a controller which blocks SPD writes without the adapter driver knowing
about it.

The trade-off this patch makes is that DDR5 memory temperature monitoring
keeps working on affected systems, instead of not being available at all.

Testing
=======
Tested on a Lenovo ThinkPad P1 Gen 9 (DDR5), with SPD Write Disable set by
the BIOS:

 - before: suspend-to-idle woke immediately; suspend_stats.failed_resume
   incremented on every cycle (14 times) and last_failed_dev was "0-0050"
 - after: 10 suspend/resume cycles with failed_resume and failed_suspend
   remaining 0
 - the chip is still detected and reports its temperature; the writable
   attributes are 0444

Kean Ren (1):
  hwmon: (spd5118) support write protected devices

 Documentation/hwmon/spd5118.rst |  10 ++++
 drivers/hwmon/spd5118.c         | 110 +++++++++++++++++++++++++++++++++++-----
 2 files changed, 108 insertions(+), 12 deletions(-)

-- 
2.53.0

