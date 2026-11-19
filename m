Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.65.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106839;
	b=a6wLwODvTlb/ZHZK19yz66WgW7tb5gNuUrcIxbPNOFBEENVsbH3vPgLaDdD2aoTxi36C
	 NMg5L2PypCSLc6MJkn6C3HLSxGdVV9llhbsXUcq7yfxzNtkwBuHMqyzSq3TzilYEGB/eV
	 JI/e0Vfk+6+PkO4ErQnqk1oCG3wpjwfeYdek/d8LRIl8CbUn0YjV4tTSoiVEjHmtZjVpr
	 dK8nmCz3gXgj4zZPO6Yln6EsQJjh04KlTLKAwFgQ24KM0UUYZ0khnB7qGU+f4yslgF7WG
	 ZDXaP6GsRO0bUFCMMiwDYkdwL3nCH2nJ4VulNZB0ei/d4vlZYVkp/hJ0kRmbPrjgERQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106839;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:
	 X-Flowmailer-Platform:Feedback-ID;
	bh=pSfD6mxVZkV2AbHzR5iF3vXQ/L7+l0gg10u1UbVpqxs=;
	b=HLAU/cJPXCYKEggN81rcJZ+YYb6hq7WXyQf97GwQXo8ldMkuhWt9jeHd82bU6MC7j5mB
	 jMI7Y5YnVFE0w1kEzsMInOZS7LTfNa35XLf/wzK/3i/0pnUUpSVjwDo/XhrbpTqYQes4O
	 p2UR505TWOn8qoZXO4AJm7Hx2llZOVSUlyrvyQQI7QumChgvhg5tRHoSmQKDlVWDw+gb0
	 b+rN7RFfhbgklR9fG+ZtRvVBq680rWAnpgTOqm92GxtCYdXvUftrmh+dxkKwnPFpg+XSm
	 b+in6Lc/M2tUFJLTht/mRv0udd1x5YWQcYT+vnYYXEx1l8toZzFC+Av5LPJ8lwk9s+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=benedikt.niedermayr@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=UW09TIOM;
	arc=none smtp.remote-ip=185.136.65.227
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAD260A2630
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 16:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EAD260A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=benedikt.niedermayr@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=UW09TIOM
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20261119164709d511067dd900020719
        for <linux-hwmon@vger.kernel.org>;
        Thu, 19 Nov 2026 17:47:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=benedikt.niedermayr@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=pSfD6mxVZkV2AbHzR5iF3vXQ/L7+l0gg10u1UbVpqxs=;
 b=UW09TIOMP/Bc6ipLkj6Yf6YCI1ac8mQkidnxWAqBhzyB7oZWAd3YVMHZvxk++qVf392oN1
 48wXV1yX8dOhGVtbzGSDJrFlZi3Vq/t4QKW2tGoBpuAo9hWrsNrIvAn44QPvvDUOui8bYpzw
 7rn78UbGUaLxyZpItdsCQj5OSJVcgP/m8S2/Z57cxJfXJTgmaZDdzErbObPyXA6B6za2g3X5
 SQUdI2n8gSmkvwN8yuhzER0YwG9Xvep0IbY8ekxOb9yDwXKhrbMPA6NFtKk+ii/RsSFOrSkX
 xuj/yXuqoiSwn9jaYfh/s4icOH6aD1Ox/Jn7HphWE75FO27Q6Ap0pb7A==;
From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org
Subject: [PATCH v3 0/2] hwmon: simatic-ipc-ec-sensors: add BX-54A EC driver
Date: Thu, 19 Nov 2026 17:47:06 +0100
Message-ID: <20261119164708.1280862-1-benedikt.niedermayr@siemens.com>
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
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1323861:519-21489:flowmailer

Hi,

this patch adds a hardware monitoring driver for the embedded controller on
Siemens SIMATIC IPC BX-54A systems.

The driver loads directly via ACPI "_HID" which is reserved for Siemens.
See commit for more information.

I'm not the original author of this driver but I reviewed it as carefully as
possible and I would step in as maintainer for it.

This patch does not enable the hardware platform on which this controller is
present.
Instead I just routed the enablement through the i2c tree, which is currently
in review [1].
I wasn't expecting the review to take that long, so it's maybe better to route
the platform enablements through this tree instead... I dont know...


changes since v2:

- fix: shared mutable temp config array in simatic_ipc_ec_hwmon_probe()
  Switched to a dynamic allocation approach for the temperature channels


changes since v1:

- fix typo (drviers -> drivers) in a comment
- improve fan speed decoding (my own AI finding -> considers little-endian)
- Sashiko review:
  - add documentation leaning a bit towards asus_ec_sensors.rst
  - sanitize chip_name in simatic_ipc_ec_fan_probe()
  - temp channel config: Move to a static approach.
    Use a static array sized for the maximum number of channels that fit into
    the 256 byte EC address space.
    Also reject configurations (from the firmware) that exceed this limit.
    IMHO this was only a theoretical issue since there is only a single EC.
  - fix uninitialized reads on ec_read()
  - validate pwm_enable
  - clamp before cast in simatic_ipc_ec_temp_write()
  - fix pointer-sign mismatch passing s8 to ec_read()
  - fix wrong assignment to temp*_min_alarm and temp*_max_alarm


[1] https://patchwork.ozlabs.org/project/linux-i2c/patch/20261116142351.1228943-4-benedikt.niedermayr@siemens.com/

Best regards,
Benedikt

Benedikt Niedermayr (2):
  hwmon: simatic-ipc-ec-sensors: add BX-54A EC driver
  docs: hwmon: introduce simatic-ipc-ec-sensors

 Documentation/hwmon/index.rst                 |   1 +
 .../hwmon/simatic-ipc-ec-sensors.rst          |  64 ++
 MAINTAINERS                                   |   7 +
 drivers/hwmon/Kconfig                         |  11 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/simatic-ipc-ec-sensors.c        | 567 ++++++++++++++++++
 6 files changed, 651 insertions(+)
 create mode 100644 Documentation/hwmon/simatic-ipc-ec-sensors.rst
 create mode 100644 drivers/hwmon/simatic-ipc-ec-sensors.c

--
2.43.0
