Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=130.239.18.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794212737;
	b=dpZcCAfEAV4tM2vhYqs4AuTIXraeYYPtCWFmwJ+3pvqa2ojwawnijsZqQHlID1pq7shC
	 jrgflu5I88EK8cwNcOLEgDnQdfYASYCo0npIxj0ijGXj9quxzW4/3/E7s4sXbmFvlltAq
	 CQWcKCZYMBpeov18UKB5E2sRCum0boImATUjr2XCvtX1HDMOs9IkA251QHPhWcgF35GRE
	 LBnDE6vqk4Dn3U3awREt+8/mKIfpJkxditSTSqK/fmvLQJ8Fiz8MTRXgVDDQPS5GH2JEu
	 iaRtVF3DulRNMMxwFwsZLYTwoDIoZoYufDpsSD92krw67inzImwabCUVoMsv4G5bgYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794212737;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gmjDTdofrmfo8vrNpeX+Qsl6bWNDfIxpwYV1FXiCU7E=;
	b=0GamG/m5Z/8ypsIXRBoeX24n2CkDy51bPLDaYv5yD2D6dDCLue/95Exs0iuxiYs4qx5F
	 NcWBmbd9BL7KHj/v+CI2JOhy0i/VY8uhQHrFw+NbCgcc2oOG0lBwyFEh20tMjNCzViyEv
	 v7yWV5SXdqUv86OgfQjrfyXd/mnpaFeRCbUla5soCjJj69eEmZv9tVzIjzvDhgMIxOsk3
	 bYEyvYSQlUYAVqzdRPMXbKf14ZBSV5SWzdlSqIG8WztBgz5qyfY3XKQtNdaAZv0+AFD7M
	 Iwzqq3O+1k/97dUYIKPVcoBsXfEsVDwzA5PaSXKJOaVFcjcme7GE6R8AD31KafU1YQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ac2.se;
	spf=pass smtp.mailfrom=accum.se;
	dkim=pass header.d=ac2.se header.i=@ac2.se header.a=rsa-sha256 header.s=default header.b=hUHbFoiC;
	arc=none smtp.remote-ip=130.239.18.156
Received: from mail.acc.umu.se (mail.acc.umu.se [130.239.18.156])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F491606A323
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 08:25:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F491606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ac2.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=accum.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ac2.se header.i=@ac2.se header.a=rsa-sha256 header.s=default header.b=hUHbFoiC
Received: from localhost (localhost.localdomain [127.0.0.1])
	by amavisd-new (Postfix) with ESMTP id 9387144B92;
	Mon,  9 Nov 2026 09:25:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ac2.se; s=default;
	t=1794212725; bh=SFr7bJ6qT4GHcFS6x+ms3hcSYf5ANJXNdu0GseYkmEM=;
	h=From:To:Cc:Subject:Date:From;
	b=hUHbFoiCtqK9xxUPUs11pN4adWO6C5LaKfLjOd0JBiLtasWkH4J4o6IehNhhcXN3e
	 oiqDaKyBYawqtlj5BYcJokkfM/ZYxpRlM9gc5laq3M556tLHrp7/kNocOZWf4XiUns
	 LGFS2j6XEsI5GU2occYvBNxxd/cZPKeEV4lfSquc=
Received: from suiko.ac2.se (suiko.ac2.se [130.239.18.162])
	by mail.acc.umu.se (Postfix) with ESMTP id CB91944B90;
	Mon,  9 Nov 2026 09:25:24 +0100 (CET)
Received: by suiko.ac2.se (Postfix, from userid 24471)
	id B4C6042B4B; Mon,  9 Nov 2026 09:25:24 +0100 (CET)
From: Anton Lundin <glance@ac2.se>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Zev Weiss <zev@bewilderbeest.net>,
	Anton Lundin <glance@ac2.se>
Subject: [PATCH v2 0/3] hwmon: (nct6775) Add support for NCT5525
Date: Mon,  9 Nov 2026 09:25:08 +0100
Message-ID: <20261109082511.851377-1-glance@ac2.se>
X-Mailer: git-send-email 2.47.3
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

This implements support for the NCT5525 super I/O chip.

First two patches are minor fixes in the driver in preparation, and the last
implements the actual support.

These are tested on a ASRock 4X4-V2000 board.
That board has a monitoring of the raw dc comming in to the board, which I
thought I would be able to find as a monitor on this chip, but it's either
a external voltage divider or it's monitored by something else.

Changes in v2:
- Dropped devicetree bindings
- Alphabetic order of chip lists
- Fixed word size access to dual-use registers
- Fan debounce fixed
- Fan support modeled as NCT6116 with fan3 and 4 unpopulated
- Corrected detection of AUXFAN2 rpm and pwm
- Corrected beep functionallity
- Link to v1: https://lore.kernel.org/all/20261103132948.144216-1-glance@ac2.se/

Anton Lundin (3):
  hwmon: (nct6775) Handle dual use registers
  hwmon: (nct6775) Avoid reading nonexistent PWM-mode registers
  hwmon: (nct6775) Add support for NCT5525

 Documentation/hwmon/nct6775.rst  |  10 +-
 drivers/hwmon/nct6775-core.c     | 154 +++++++++++++++++++++++++++++--
 drivers/hwmon/nct6775-platform.c |  17 ++++
 drivers/hwmon/nct6775.h          |   5 +-
 4 files changed, 174 insertions(+), 12 deletions(-)

-- 
2.47.3

