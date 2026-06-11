Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8951367B9A;
	Thu, 11 Jun 2026 07:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781163867; cv=none; b=hWPRr4WqrNRn3mj+eAehW1XRCT8UKeP2Tx9Wl1GPXrnPc6qL8WYolkTNGN/5au86zfeNUXvWpVeO8Z1Q7UKfOhXGzJGb8V1/y69M9O6+a4b600qRd7CF8mQRq0twbCF+f+tTr+v5X933Qgd3W+bCT/m+kuDUT/lpaUuF07RNUFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781163867; c=relaxed/simple;
	bh=NumEs+92TayyxRbnZN8gnUdUNWhwmg8H4g+xgcWb0ws=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r+rUahOLah8ZIkAXhaLkUpTwT8S/yGyso6rcSLEOt6W06RXX/MBSuoDp01ngBLOIrTvtDeGIGxgA2/gqRrx9P5hNTiiXiKjraQlNvGeHKNmrpNCUtf94sphbsgbTBY1ZOwADWbIBQeDaZ+jmzIbp2fpuvcr9xJyGXjttxvp64/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=JKgQyOc4; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="JKgQyOc4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=8c
	/s81jJ8XfUFj1XX+nPJWWR3FWC7S9JSVsCchKpsKQ=; b=JKgQyOc4akzrt0bj9G
	w2YKp9xFtyrjakSuobdwxLC5biQ6NneFEWQykQ7XmXf2vn1nHgDm1flB3kdH7gAt
	SC9RrMcfmDpzzLHaufd0ExK5rWk+34KjpLO8RlaqIaaSlVYYzfPLz5aAAYq71wSY
	rv9MbJmLGVPCGyODkx0VNKGgE=
Received: from ZM.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3PvcqZypqI94RCw--.19273S5;
	Thu, 11 Jun 2026 15:43:43 +0800 (CST)
From: Ziming Zhu <zmzhu0630@163.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Ziming Zhu <ziming.zhu@silergycorp.com>
Subject: [PATCH v3 3/3] hwmon: Add documentation for SQ24860
Date: Thu, 11 Jun 2026 15:43:35 +0800
Message-Id: <20260611074335.4415-4-zmzhu0630@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260611074335.4415-1-zmzhu0630@163.com>
References: <20260611074335.4415-1-zmzhu0630@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3PvcqZypqI94RCw--.19273S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxJF1DXry3Kw47Zw13Kry7trb_yoWruw4DpF
	93GrySkw1UXrW7WFW3tw18Zrs8Gay8Ar43AF1kJryrZ3Z8Ar1v9rnrKr13Ja4DKrn5AFWr
	KF4UtrWUJw4jkFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U_b1nUUUUU=
X-CM-SenderInfo: x2p2x3aqwtiqqrwthudrp/xtbC6BALBGoqZzAGAgAA3k

From: Ziming Zhu <ziming.zhu@silergycorp.com>

Document the supported sysfs attributes for the Silergy SQ24860 PMBus
hwmon driver.

Signed-off-by: Ziming Zhu <ziming.zhu@silergycorp.com>
---
 Documentation/hwmon/index.rst   |  1 +
 Documentation/hwmon/sq24860.rst | 96 +++++++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+)
 create mode 100644 Documentation/hwmon/sq24860.rst

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 8b655e5d6b68..6184b88e2095 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -243,6 +243,7 @@ Hardware Monitoring Kernel Drivers
    smsc47m1
    sparx5-temp
    spd5118
+   sq24860
    stpddc60
    surface_fan
    sy7636a-hwmon
diff --git a/Documentation/hwmon/sq24860.rst b/Documentation/hwmon/sq24860.rst
new file mode 100644
index 000000000000..f0182b955d8a
--- /dev/null
+++ b/Documentation/hwmon/sq24860.rst
@@ -0,0 +1,96 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver sq24860
+=====================
+
+Supported chips:
+
+  * Silergy SQ24860
+
+    Prefix: 'sq24860'
+
+Author:
+
+	Ziming Zhu <ziming.zhu@silergycorp.com>
+
+Description
+------------
+
+This driver implements support for the Silergy SQ24860 eFuse. The device is an
+integrated circuit protection and power management device with a PMBus
+interface.
+
+The device supports direct format for reading input voltage, output voltage,
+auxiliary voltage, input current, input power, and temperature.
+
+The current and power measurement scale depends on the resistor connected
+between the IMON pin and ground. The resistor value can be configured with the
+``silergy,rimon-micro-ohms`` device tree property. See
+``Documentation/devicetree/bindings/hwmon/pmbus/silergy,sq24860.yaml`` for details.
+
+Due to the specificities of the chip, all history reset attributes are tied
+together. Resetting the history of one sensor resets the history of all sensors.
+
+Sysfs entries
+-------------
+
+The following attributes are supported. Limits are read-write; all other
+attributes are read-only.
+
+======================= ======================================================
+in1_label               "vin"
+in1_input               Measured input voltage.
+in1_average             Average measured input voltage.
+in1_min                 Minimum input voltage limit.
+in1_lcrit               Critical low input voltage limit.
+in1_max                 Maximum input voltage limit.
+in1_crit                Critical high input voltage limit.
+in1_min_alarm           Input voltage low warning alarm.
+in1_lcrit_alarm         Input voltage low fault alarm.
+in1_max_alarm           Input voltage high warning alarm.
+in1_crit_alarm          Input voltage high fault alarm.
+in1_highest             Historical maximum input voltage.
+in1_lowest              Historical minimum input voltage.
+in1_reset_history       Write any value to reset history.
+
+in2_label               "vmon"
+in2_input               Measured auxiliary input voltage.
+
+in3_label               "vout1"
+in3_input               Measured output voltage.
+in3_average             Average measured output voltage.
+in3_min                 Minimum output voltage limit.
+in3_min_alarm           Output voltage low alarm.
+in3_lowest              Historical minimum output voltage.
+in3_reset_history       Write any value to reset history.
+
+curr1_label             "iin"
+curr1_input             Measured input current.
+curr1_average           Average measured input current.
+curr1_max               Maximum input current warning limit.
+curr1_crit              Critical input over-current fault limit.
+curr1_max_alarm         Input current warning alarm.
+curr1_crit_alarm        Input over-current fault alarm.
+curr1_highest           Historical maximum input current.
+curr1_reset_history     Write any value to reset history.
+
+power1_label            "pin"
+power1_input            Measured input power.
+power1_average          Average measured input power.
+power1_max              Maximum input power warning limit.
+power1_alarm            Input power warning alarm.
+power1_input_highest    Historical maximum input power.
+power1_reset_history    Write any value to reset history.
+
+temp1_input             Measured temperature.
+temp1_average           Average measured temperature.
+temp1_max               Maximum temperature warning limit.
+temp1_crit              Critical temperature fault limit.
+temp1_max_alarm         Temperature warning alarm.
+temp1_crit_alarm        Temperature fault alarm.
+temp1_highest           Historical maximum temperature.
+temp1_reset_history     Write any value to reset history.
+
+samples                 Number of samples used for average values.
+======================= ======================================================
+
-- 
2.25.1

