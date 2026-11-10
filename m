Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794335684;
	b=S25z/2y2F89H9dZwitng9Zbz9Rn6RJdgjo1BPwAejx85WlzyEQWztcUBFf+0BE0J3blr
	 nYr2Za56vmBcUWt6eG2G2yFVB45QWI0ue73u1rDnw/iaymLu7p6lhLlqMqAxc4pLcpXkE
	 rJqwP2vy3f4EpEHNdLVN9kFMZBwFJ8L6GpmZF/YM0o823cYGxtafBqiZYFKAaLGP5aAbs
	 0HPbPRnvwZBJxpEp3xRUU9h93fLr3Fx7XFiraL80+/yNJ/APLch/hnCdJp8yGj/HZIrgz
	 ChhF59y5aqXzllma5ZfzUpHYEM2CmYGJQZs69IK4aSbRNptqzDZ2ou0a8JZ+4Tz2e9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335684;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=b5zakHmq8nt2+1hEwHPjEnM6vGwmcWm+izfQHjtzbIg=;
	b=I3j4bzADjzsZD8pP5SMeBiObBNYMIZIks3mcGQoymtmu70dFImvdpBmcwf0s0RUTEEA/
	 /RWgJfsUzTqM9Z44CreLPiFnfNdt4sL7nNtqSPAVLt4I2FjSOUZX/OZPpb5c5vLi1wi7a
	 QING87CQyS0a0J082E7FPKbuJDy8XFfen+Agbv1JrXDhkbDFWxr89ZuDgqSvir1PETm4A
	 OxFFTwaZ+83VAz9jb7MD3/H6J8M4ozT7w5r3JQseJtqCZL7AFu19UCfYFbvN9DLSlhBVA
	 7IGZowOXnweAmotIDW8oMDfslH+lGyAJ/nVOwrWRVVBsyRDwhX2/NgZEayw7CUOH79g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=aYrCj+pm;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DF4606A321
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 18:34:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01DF4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=aYrCj+pm
Received: from eig-obgw-6002b.ext.cloudfilter.net ([10.0.30.203])
	by cmsmtp with ESMTPS
	id QmNBxG6VNyb4YQqg1x0tBP; Tue, 10 Nov 2026 18:34:37 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Qqg0xgf258cn4Qqg1xd4eb; Tue, 10 Nov 2026 18:34:37 +0000
X-Authority-Analysis: v=2.4 cv=Qrde3Uyd c=1 sm=1 tr=0 ts=6af363bd
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=AgWW5FNtAAAA:8
 a=gAnH3GRIAAAA:8 a=DSR6cjNvz5TOvLP8GJ0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=8DkScU8FlKhdH4yH5W0q:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=b5zakHmq8nt2+1hEwHPjEnM6vGwmcWm+izfQHjtzbIg=; b=aYrCj+pmc3UVif4fuF0jI9gz3U
	D0iPNN8u3HGhkOHHz+t/UCMq/1Y6IK71RMtQ41aHQQ9+uFVyVhVss1mQXVCsZTyOT6mVhcpflN5YI
	GJ7l6xVIZ/HlnfIWdl2P/YWWzGTDhVn8ClGL6HiyVFiyV5hkYuK7JiDfQD7B9qA6qD2wK1lsvhtCd
	Eoe1YrMmJdX5f7iNUUfXXIHewdzn8MUPYe1wWi4QCLBFSqLgEZAovVYSD4468g3gY5fKPDTfv5xe/
	vNfoaCSMqqwbmFjV+YHpHzreUjroqco4DnUt0PNiNYgZDeOVJXblxcr1cBgotrmW/rVFJxnuv3fOt
	fKE+eJMA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:52512 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQqg0-00000003PWL-1aSN;
	Wed, 11 Nov 2026 00:04:36 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Guenter Roeck <linux@roeck-us.net>,
	Tim Harvey <tharvey@gateworks.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Riku Voipio <riku.voipio@iki.fi>
Subject: [PATCH 00/10] hwmon: Drop unused platform data support and max197 driver
Date: Tue, 10 Nov 2026 10:34:23 -0800
Message-ID: <20261110183434.181711-1-linux@roeck-us.net>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQqg0-00000003PWL-1aSN
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:52512
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 5
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfAO8KB+tGxW8Q4OoqmZYLZZHlx2oeBwAHSBbGrpLbzIk/+0xs8x63AQhDM5SO7BykFqWdaoSySA4WPlcYQO0KraNt3ZKoG5TwNA3hmxSCrY7r+Hn3O06
 AATX0O+Ol3wLYK6ISK8gWjBOE+41nszzO77JegSx8Sert2OW7k8lFFmnoL+w+ybFOtPCD1/nxfMzq0Pq7IaGTzB8R7/MmmG3IQyn/N9agMBIz45h8mjjo8to

Several drivers in drivers/hwmon still support configuration through
platform data structures even though no in-tree platform or board code
ever instantiates or supplies that platform data.

Audit all hwmon drivers using dev_get_platdata(), dev->platform_data, or
headers under include/linux/platform_data/ and drop dead platform data
support where it is never provided in-tree:

- ads7828, emc2305, g762, gsc-hwmon, ltc4245, mcp3021, and shtc1 already
  support configuring the respective parameters via devicetree / fwnode
  properties (and/or hardware registers). Drop platform data support,
  remove the unused platform data headers, and update documentation and
  MAINTAINERS entries accordingly.

- f75375s already initializes PWM mode and enable state from chip
  registers during probe and exposes pwm and pwm_enable via standard
  hwmon sysfs attributes. Drop platform data support and remove
  include/linux/f75375s.h.

- ds620 clears PO2 by default when no platform data is provided, keeping
  the thermostat output pin low as a valid default configuration. Drop
  platform data support and remove include/linux/platform_data/ds620.h.

- max197 requires platform data supplying a convert() callback function
  pointer and fails to probe without it. Since no in-tree user ever
  instantiates the device or provides max197_platform_data, remove the
  unused driver along with its platform data header, Kconfig/Makefile
  entries, and documentation.

Tooling and Testing Notes
-------------------------
Per Documentation/process/generated-content.rst:
- Tool used: Jetski AI coding assistant (Gemini).
- Prompt summary: Identify all drivers in drivers/hwmon whose platform
  data is never supplied in-tree; remove platform data support and
  unused platform data headers where an alternate configuration means
  exists (including ds620's default PO2 configuration), and remove both
  the driver and header where platform data is mandatory.
- Scope of generated content: Code changes, documentation/Kconfig/
  MAINTAINERS updates, commit descriptions, and this cover letter.
- Testing: Verified with out-of-tree W=1 builds of drivers/hwmon/ under
  both allmodconfig (CONFIG_OF=y) and CONFIG_OF=n, as well as
  scripts/checkpatch.pl --strict. Not runtime-tested on hardware.

Cc: Tim Harvey <tharvey@gateworks.com>
Cc: Nuno Sá <nuno.sa@analog.com>
Cc: Riku Voipio <riku.voipio@iki.fi>

Guenter Roeck (10):
  hwmon: (ads7828) Drop platform data support
  hwmon: (emc2305) Drop platform data support
  hwmon: (g762) Drop platform data support
  hwmon: (gsc-hwmon) Drop platform data support
  hwmon: (ltc4245) Drop platform data support
  hwmon: (mcp3021) Drop platform data support
  hwmon: (shtc1) Drop platform data support
  hwmon: (max197) Remove driver
  hwmon: (f75375s) Drop platform data support
  hwmon: (ds620) Drop platform data support

 Documentation/hwmon/ads7828.rst         |  21 --
 Documentation/hwmon/ds620.rst           |  12 +-
 Documentation/hwmon/g762.rst            |   4 +-
 Documentation/hwmon/index.rst           |   1 -
 Documentation/hwmon/ltc4245.rst         |   6 +-
 Documentation/hwmon/max197.rst          |  70 -----
 Documentation/hwmon/shtc1.rst           |   3 +-
 MAINTAINERS                             |   2 -
 drivers/hwmon/Kconfig                   |   9 -
 drivers/hwmon/Makefile                  |   1 -
 drivers/hwmon/ads7828.c                 |  13 +-
 drivers/hwmon/ds620.c                   |  13 +-
 drivers/hwmon/emc2305.c                 |  44 +--
 drivers/hwmon/f75375s.c                 | 100 +++----
 drivers/hwmon/g762.c                    |  50 +---
 drivers/hwmon/gsc-hwmon.c               |  72 +++--
 drivers/hwmon/ltc4245.c                 |  21 +-
 drivers/hwmon/max197.c                  | 341 ------------------------
 drivers/hwmon/mcp3021.c                 |  18 +-
 drivers/hwmon/shtc1.c                   |  23 +-
 include/linux/f75375s.h                 |  21 --
 include/linux/platform_data/ads7828.h   |  26 --
 include/linux/platform_data/ds620.h     |  22 --
 include/linux/platform_data/emc2305.h   |  28 --
 include/linux/platform_data/g762.h      |  24 --
 include/linux/platform_data/gsc_hwmon.h |  45 ----
 include/linux/platform_data/ltc4245.h   |  17 --
 include/linux/platform_data/max197.h    |  23 --
 include/linux/platform_data/shtc1.h     |  14 -
 29 files changed, 121 insertions(+), 923 deletions(-)
 delete mode 100644 Documentation/hwmon/max197.rst
 delete mode 100644 drivers/hwmon/max197.c
 delete mode 100644 include/linux/f75375s.h
 delete mode 100644 include/linux/platform_data/ads7828.h
 delete mode 100644 include/linux/platform_data/ds620.h
 delete mode 100644 include/linux/platform_data/emc2305.h
 delete mode 100644 include/linux/platform_data/g762.h
 delete mode 100644 include/linux/platform_data/gsc_hwmon.h
 delete mode 100644 include/linux/platform_data/ltc4245.h
 delete mode 100644 include/linux/platform_data/max197.h
 delete mode 100644 include/linux/platform_data/shtc1.h

-- 
2.56.0
