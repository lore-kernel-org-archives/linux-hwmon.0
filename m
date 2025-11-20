Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C78284888;
	Thu, 20 Nov 2025 07:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763622868; cv=none; b=XEvMxz1T2IXyr+Zm3+ubL+e9b0cwNE09gP2dKnHFTQ4jkRNqGeNFn4u/VG6NwiD3nGFvgTz0E9RkwTYwo0e9Czy0NdV/U0Xl8igF1IpjYN8amVLaEzhua7zPvaz3wOrartYYG6lrVaESzTwVqfwLLUIBkZLECNoe1qCw5RYX9dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763622868; c=relaxed/simple;
	bh=kt0qyZkW+MeJECkI5Xss7gOhcc8oUs7F0dqKayTW0G8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jXOzLSPxD/CvxSUJPvqMjMMvjiFZQ78DnC2Ng4imTklnTwDLc3Ch4AGBL1DZyQpg+w/6aw/1riiidGdwfpVrpSiFO+TZE2KdZ/9jVWNJhLjNj8IrZVf6uJ9k9VKR9JzTlIl2lLlKcK7CEaGnqoV0106DUkzzt4gmKF+zjEHdTCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=jhEG2d8t; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="jhEG2d8t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1763622867; x=1795158867;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kt0qyZkW+MeJECkI5Xss7gOhcc8oUs7F0dqKayTW0G8=;
  b=jhEG2d8tFcId6uDa0ff+s6ximyQI1HENjDvOxJq8h7/eS4OYvRQAkBby
   nGi0l71UGcEHv6oqz3lazpBebBLEOpZb0I3MLqKhooOFZ2YPr94Dy9TFO
   sB7/LQWiMPYhhxwpv2DLeBblIOw5UWX34RAVZJeiQUJdTjEJ1fryVpPeh
   j7NUqASWBchx+HEBgD7rz01kqjA22EZ6xNkPDZ31/6LNKZmo4lP0x1mgF
   37fMSKMi+8xRCbBOTlpGPFxE5zirgJt7PTNXbaemXFT51aHvOqy+OlzlC
   i0VjuaKpHvcNSGu74SeeeaFGAGN6wvofwT8XYyXYvu3suueS486bRJbuK
   A==;
X-CSE-ConnectionGUID: 7tMF3faYTyyB7jmTWiAErQ==
X-CSE-MsgGUID: K/njos6fQ4C+EoqVr908ow==
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="49909730"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 00:14:25 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Thu, 20 Nov 2025 00:13:55 -0700
Received: from vduicu-Virtual-Machine.mshome.net (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 20 Nov 2025 00:13:52 -0700
From: <victor.duicu@microchip.com>
To: <linux@roeck-us.net>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <corbet@lwn.net>
CC: <marius.cristea@microchip.com>, <victor.duicu@microchip.com>,
	<linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: [PATCH v2 0/2] add support in hwmon for MCP998X
Date: Thu, 20 Nov 2025 09:12:44 +0200
Message-ID: <20251120071248.3767-1-victor.duicu@microchip.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Victor Duicu <victor.duicu@microchip.com>

Add support in hwmon for Microchip MCP998X/33 and MCP998XD/33D
Multichannel Automotive Temperature Monitor Family.

The chips in the family have different numbers of external channels,
ranging from 1 (MCP9982) to 4 channels (MCP9985).
Reading diodes in anti-parallel connection is supported by MCP9984/85/33
and MCP9984D/85D/33D. Dedicated hardware shutdown circuitry is present
only in MCP998XD and MCP9933D.

The driver supports reading the temperature channels, the temperature
limits and their corresponding alarms. The user can set the limits and
the update interval.

This driver is based on the IIO driver for MCP998X:
https://lore.kernel.org/all/20250930133131.13797-1-victor.duicu@microchip.com/ 

Differences related to previous patch:
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

 .../bindings/hwmon/microchip,mcp9982.yaml     | 205 ++++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/mcp9982.rst               |  95 ++
 MAINTAINERS                                   |   8 +
 drivers/hwmon/Kconfig                         |  11 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/mcp9982.c                       | 937 ++++++++++++++++++
 7 files changed, 1258 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,mcp9982.yaml
 create mode 100644 Documentation/hwmon/mcp9982.rst
 create mode 100644 drivers/hwmon/mcp9982.c


base-commit: 7254a2b52279091683e0228095118ee69ce9742f
-- 
2.48.1

