Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C22C242D84;
	Tue, 27 Jan 2026 15:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769527186; cv=none; b=ktuZ1IWZ8f0GfSFt0XcJtcTQMh2h0ovfI6bNMb//+OvUSsPLDgGFg0QvLCRbABVF/sFm2bEz4dqZ4ajDI85duGYNVoOzIxr/CLGLcnx0MI5TOU3C9t+dGKr5Jy/LZzQCdF46kAwnA+AgTKpcF23olj8xghab2XFrJPVJiefND9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769527186; c=relaxed/simple;
	bh=BqsTfLuyxw/AFqL8l8pnFsC2zOqAYqr1AN7W3ptG+iQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EgMwu3G2AL858iPBPw81drYqVtXvZnvudm85pzAlMTHNEMymlhz0c/wOA8UHxNKdyh8ZzhGQYkE6Z6E00g2SNczCLOalKtF53Sv16toyj/Hej+OXU1t8zq84zzOyR5PxWUtzH7zJK62iOteR/8EF5+j5uYMR2AnescnBSlIgPzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=mAoUKWAt; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="mAoUKWAt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1769527185; x=1801063185;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BqsTfLuyxw/AFqL8l8pnFsC2zOqAYqr1AN7W3ptG+iQ=;
  b=mAoUKWAtDq+Uaf5iwCbOCCdpj1VHVYi7vAPfiSQAuvvHBMSNW4aZGG+2
   h2cPie0JljA8n4q66KMtN6qCPZge+Sgfm+kbVqBTxEpJrDQTJpN7Jkmfu
   yF21lwfNJQZG9mMsimBDrR+aNvEPQmT1BUYC2hG1msFGkL8m+xBdXEIe1
   42m5tUXq1BUGlskzgx6RqC2DsNhKNN25YBcScEQMDoueKEEkjtmKlqQWU
   WlyCZUK2NfKqTYIk2eBIgT5LOrLHGMc8S9gBUybpq6OrvkXZj9kYhbPEM
   tjME+eE1Mo6V1+XCUl9V2ygiFFVP2GMkIGOAGULYrEuOhly/q8pfASVpk
   A==;
X-CSE-ConnectionGUID: xTtkAyu0T72lBJqmICM3yw==
X-CSE-MsgGUID: RPFR8Q10SQ+FbRn+7P/3Sw==
X-IronPort-AV: E=Sophos;i="6.21,257,1763449200"; 
   d="scan'208";a="219793155"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Jan 2026 08:19:44 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 27 Jan 2026 08:19:03 -0700
Received: from vduicu-Virtual-Machine.mshome.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 27 Jan 2026 08:19:01 -0700
From: <victor.duicu@microchip.com>
To: <linux@roeck-us.net>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <corbet@lwn.net>
CC: <marius.cristea@microchip.com>, <victor.duicu@microchip.com>,
	<linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: [PATCH v3 0/2] add support in hwmon for MCP998X
Date: Tue, 27 Jan 2026 17:18:20 +0200
Message-ID: <20260127151823.9728-1-victor.duicu@microchip.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Victor Duicu <victor.duicu@microchip.com>

Add support in hwmon for Microchip MCP998X/33 and MCP998XD/33D Multichannel
Automotive Temperature Monitor Family.

The chips in the family have different numbers of external channels,
ranging from 1 (MCP9982) to 4 channels (MCP9985).
Reading diodes in anti-parallel connection is supported by MCP9984/85/33
and MCP9984D/85D/33D. Dedicated hardware shutdown circuitry is present
only in MCP998XD and MCP9933D.

The driver supports reading the temperature channels, the temperature
limits and their corresponding alarms. The user can set the limits,
the update interval and the hysteresis.

This driver is based on the IIO driver for MCP998X:
https://lore.kernel.org/all/20250930133131.13797-1-victor.duicu@microchip.com/

Differences related to previous patch:
v3:
- update copyright year.
- add tempX_max_hyst and tempX_crit_hyst attributes and document
  them in mcp9982.rst. 
- in include list add byteorder/generic.h and remove unaligned.h.
- remove definitions for temperature memory block
  and status memory block.
- remove individual definitions for register addresses 1Dh->21h.
- add constants MCP9982_WAKE_UP_TIME_MAX_US and
  MCP9982_TIMER_BUFFER_US.
- add checks to ensure that values read from registers are on 8 bits.
- in mcp9982_read_limit() simplify calculation, replace bulk read
  with individual operations and add comment.
- in mcp9982_read_limit() add explicit case branches for limits
  that are on 16 bits.
- in mcp9982_read() replace mdelay() with usleep_range().
- in mcp9982_read() replace block reading for temperature values with
  individual operations, add comment and remove unnecessary
  mask variable.
- in regmap_read_poll_timeout() add final timeout.
- in mcp9982_read_label() remove label check.
- in mcp9982_write_limit() replace put_unaligned_be16() with cpu_to_be16().
- in mcp9982_write_limit() add explicit case branches for limits
  that are on 16 bits.
- in mcp9982_init() write default value for diode alert mask register.
- in mcp9982_parse_fw_config() replace E2BIG with EINVAL.

v2:
- in Kconfig add select REGMAP_I2C.
- in yaml add power state attribute. For chips with "D" in the name
  check that Run mode is set in yaml and driver.
- in the include list: remove cleanup.h, add math.h, minmax.h and
  util_macros.h.
- add min, max and crit limits for all channels. These attributes can
  be read and written. In mcp9982_init() set default values for limits.
- add alarms for limits.
- edit regmap ranges to add the limit registers.
- when writing update interval, don't force the user to set exact value.
  Search for closest valid value.
- in mcp9982_parse_fw_config() check value from fwnode_property_read_u32().
- edit coding style and comments.
- remove constant MCP9982_SCALE.
- rename variable sampl_idx from mcp9982_priv to interval_idx.
- in mcp9982_write() rename variable use_previous_freq
  to use_previous_interval.

v1:
- initial version for review.

Victor Duicu (2):
  dt-bindings: hwmon: add support for MCP998X
  hwmon: add support for MCP998X

 .../bindings/hwmon/microchip,mcp9982.yaml     |  205 ++++
 Documentation/hwmon/index.rst                 |    1 +
 Documentation/hwmon/mcp9982.rst               |  105 ++
 MAINTAINERS                                   |    8 +
 drivers/hwmon/Kconfig                         |   11 +
 drivers/hwmon/Makefile                        |    1 +
 drivers/hwmon/mcp9982.c                       | 1022 +++++++++++++++++
 7 files changed, 1353 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,mcp9982.yaml
 create mode 100644 Documentation/hwmon/mcp9982.rst
 create mode 100644 drivers/hwmon/mcp9982.c


base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
-- 
2.51.0

