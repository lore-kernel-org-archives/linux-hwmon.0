Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795830641;
	b=fgNL0lb+0m1/SDjQmvk340Co3Hv79/MU15o9NlWbboaJjD+dj7t88pZ3vZ5GsLl/j8jr
	 fokzHEGYvVWsVojpQ2rj/StDUuJhR/QYbVGPHXNojAAEe+RXqUH6tSvullEkdOLBWlszO
	 icfmV27Ub7xCyMYcYGlug0jXC77rM1DWY4dv+m0hxbbsHFAxxJ22mVnTTd/DaY6omQhIs
	 rJV/4Li7daGit4astliJo7OTy4eIBPzhuA5a3/t2vTHlymvwwcYwcY0y+fSCV5iYCylTK
	 67ELgDHUF+xb2jyaDmrpsYLj23+erJVezJKY+i5Wmlo6++VsB55jamWhnEnebsMfBvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795830641;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=jTkWjHu4Sgk8WdZ81Zw8P7Rf3jH+36wh03WSsnJk744=;
	b=HKRhZEfkkBQa+iBNVcoPozH0ZlN+ZwtuNQD4uugyVuId3FWoWLlwx9CskMFRUHo+c8mD
	 cfYy940n2qOgS/Bkhb9c82HjeOpTbp9vjcAJqcgMjHO68z499vxGmKpWVbdWITvmeHt08
	 JiIRVcc4mc1py+NjZ8kYcE0Y5td7uNhMFhsmuFAIbTrDtQeIS60L6VOKIdBv8KdjXK0nx
	 x5Ar23rqAN7RnRYdFdbQvNxiPMXg+F3pcBijHW4hex7dZsrdM/pID3x246hZK9l+Eb/n8
	 MXDTfJoboNIo3WIzod1SXkjZw1B3yT2TXdhjQNnR6G1oEAW0VPgpQ2dxkDmvKCyMEyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=0MQpzQL1;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A4E606A31E
	for <linux-hwmon@vger.kernel.org>; Sat, 28 Nov 2026 01:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62A4E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=0MQpzQL1
Received: from eig-obgw-5005b.ext.cloudfilter.net ([10.0.29.189])
	by cmsmtp with ESMTPS
	id X5rIxph2BAR1iX7aKxFHxm; Sat, 28 Nov 2026 01:50:40 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id X7aJxVFbcYskhX7aJxuGmh; Sat, 28 Nov 2026 01:50:39 +0000
X-Authority-Analysis: v=2.4 cv=CKMqXQrD c=1 sm=1 tr=0 ts=6b0a336f
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8 a=zjfLJ7VQdEjd3HVhXVoA:9
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jTkWjHu4Sgk8WdZ81Zw8P7Rf3jH+36wh03WSsnJk744=; b=0MQpzQL17bDhNUHs+UIhngDZvP
	Or4VNy3L03Yr81BfOR2vk0If+dlax2JSjZdT9s2kaDQ3v+Xs3PaBEWUO6Ob5LbCWXED9zn1Nyo46H
	oVVliMV3xNqIo/LM7ndp8ubNFyF74vAhhls8XnKi7LP07a7Y2CzAhu7LHdfHM9Ic5B+1bPRm7T12M
	unvolxyUzyx6YZFEOqTsr2iMXvcAo/PdRk5FDs0x/QFa5oqIrgxoUKNtgDR18gPvn2Gu8qTgpmjHg
	eupJtLkldZ3cruO9WA7MNpPdzfQGLHBcgGq9Xthoh2mU6xBxAJV+wJLiUQ3k31rMcBTW7Y7GsKoJX
	qfc/n4nA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:55232 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.2)
	(envelope-from <linux@roeck-us.net>)
	id 1xX7aI-00000002CGM-3hky;
	Sat, 28 Nov 2026 07:20:38 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v7.4-rc5
Date: Fri, 27 Nov 2026 17:50:38 -0800
Message-ID: <20261128015038.3132946-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xX7aI-00000002CGM-3hky
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:55232
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLouI0kqXNNYBxcsPmCUxH/uI7Sl9xdTmc0ymFCh1uT5eb9TiX0hzzL2aSBdvavSVFIy+aWlHH52rpo26tFi7hfQ8lJBGGZJGj+ZmHBH0EqQqQAX74Ix
 D+kyW1wSVs5dudu8QkNrc98hTPea7nqhnP2pEuIaEugyUgxwpuhaGx9tXgrSiGF1wz+8WsG7BMEuVoELMGcd9NwQTowXGcMaNfEsEionyTz32uNLCG5pmxTU

Hi Linus,

Please pull hwmon fixes for Linux v7.4-rc5 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.4-rc5

Thanks,
Guenter
------

The following changes since commit b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f:

  Linux 7.4-rc4 (2026-11-22 14:57:40 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v7.4-rc5

for you to fetch changes up to ab8ea038584868fbcc91878a6caccf6404582fce:

  hwmon: (pmbus/ltc2978) Fix peak comparison for IEEE-754 chips (2026-11-27 11:27:21 -0800)

----------------------------------------------------------------
hwmon fixes for v7.4-rc5

* Fix a v7.4-rc2 regression in aquacomputer_d5next that rejected
  single-collection Aquaero sensor interfaces during probe by only
  checking collection[1].type when maxcollection > 1.

* Fix peak value tracking for IEEE-754 half-precision chips
  (LT7170/LT7171) in pmbus/ltc2978: compare binary16 values as
  sign-magnitude integers instead of decoding them as LINEAR11, and
  use -infinity/+infinity for peak initialization and reset values.

* Fix ACPI fan paths for the Lenovo Yoga Pro 7 14IAH10 in yogafan by
  using the dual-fan FA1S/FA2S configuration instead of the nonexistent
  FANS path, and update the driver documentation table to match.

* Add the missing platform:cgbc-hwmon module alias to cgbc-hwmon so the
  driver autoloads when built as a module.

----------------------------------------------------------------
Christopher de Guzman (1):
      hwmon: (pmbus/ltc2978) Fix peak comparison for IEEE-754 chips

Guenter Roeck (1):
      hwmon: (aquacomputer_d5next) Fix collection check for Aquaero devices

Markus Haberlander (1):
      hwmon: (cgbc-hwmon) Add module alias

Navon John Lukose (1):
      hwmon: (yogafan) Fix fan paths for Yoga Pro 7 14IAH10

 Documentation/hwmon/yogafan.rst     |  3 +-
 drivers/hwmon/aquacomputer_d5next.c |  5 +--
 drivers/hwmon/cgbc-hwmon.c          |  1 +
 drivers/hwmon/pmbus/ltc2978.c       | 66 +++++++++++++++++++++++++++++--------
 drivers/hwmon/yogafan.c             |  8 +----
 5 files changed, 59 insertions(+), 24 deletions(-)
