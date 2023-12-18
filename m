Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D947E4988B;
	Mon, 18 Dec 2023 16:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BIDjKHK011764;
	Mon, 18 Dec 2023 11:27:01 -0500
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3v1etvqmr3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Dec 2023 11:27:00 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 3BIGQxp1043885
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 18 Dec 2023 11:26:59 -0500
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 18 Dec 2023 11:26:58 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 18 Dec 2023 11:26:58 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 18 Dec 2023 11:26:58 -0500
Received: from [127.0.0.1] ([10.44.3.56])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 3BIGQiuV024955;
	Mon, 18 Dec 2023 11:26:46 -0500
From: Nuno Sa <nuno.sa@analog.com>
Subject: [PATCH v4 0/3] Add support for LTC4282
Date: Mon, 18 Dec 2023 17:29:41 +0100
Message-ID: <20231218-b4-ltc4282-support-v4-0-4fc51f7d04f0@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHVzgGUC/x3MQQqAIBBA0avErBvIyUK6SrQwm2ogUrQiiO6et
 HyL/x9IHIUTdMUDkS9J4vcMXRbgVrsvjDJlA1VUK1IGR43b4TQZwnSG4OOBZCtjTaPbxrWQwxB
 5lvuf9sP7fnYLTjNkAAAA
To: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>
CC: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        "Rob
 Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702916989; l=2885;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=UPLwrZBTRlfFBbpU0VSluTqlCz4GuN1K3TUKhqrsvyc=;
 b=DtC/nR0y8Sdn1eMHxOyX7Dt8BGBAvFKd7l1xAmfvAEurbVgNWWFxMsL6TWYsN8HBRRr7CllMe
 8o1DOqH5No8Cws5OqgzAJMlmoXimaQi7YinMmVkCXtyvsxUAEUH+of2
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: RMlf-M5QstOJc-u6IeMzEDtFm_kUW0pA
X-Proofpoint-ORIG-GUID: RMlf-M5QstOJc-u6IeMzEDtFm_kUW0pA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-02_01,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 mlxscore=0
 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312180121

v1:
 * https://lore.kernel.org/linux-hwmon/20231110151905.1659873-1-nuno.sa@analog.com/

v2:
 * https://lore.kernel.org/linux-hwmon/20231124-ltc4282-support-v2-0-952bf926f83c@analog.com

v3:
 * https://lore.kernel.org/r/20231205-ltc4282-support-v3-0-e0877b281bc2@analog.com

Changes in v4:
- Patch 1:
 * New patch. Support fault attributes in voltage channels.
- Patch 2:
 * Add default values for gpios and divider properties;
 * Add adi,gpio3-monitor-enable property.
- Patch 3:
 - Docs:
  * Document that fault logs are also cleared when writing in reset_history
    attributes;
  * Document debugfs entries;
  * Add new in0_fault attributes and remove dropped ones.
 - Driver:
  * Add hwmon_in_fault attribute to report FET failures in VSOURCE;
  * Clear fault logs in reset_history;
  * Constify 'ltc4282_out_rates';
  * Add missing error check in ltc4282_cache_history();
  * Removed unused functions;
  * Renamed clk provider name so it's unique per device;
  * Support new adi,gpio3-monitor-enable property;
  * Dropped power1_good, fet_bad_fault, fet_short_fault, fault_logs_reset
    custom attributes. Note that only power1_good was really dropped.
    The other ones are supported in standard ABI.
  * Renamed debugfs directory for ltc4282-hwmonX;
  * Added in0 prefix to FET fault logs so it's clear they affect VSOURCE;
  * Fix in_range() condition (false means error);
  * Fix reset_history attributes. We should not write 0 in the lowest
    value. Write the theoretical max value in there. For vsource/vdd,
    also do it during device setup (or we would end up with 0).
  * Directly store the chip vdd instead of vin_mode in our device
    structure. Easier to handle reset_history;
  * Moved the vin_mode enum to reduce it's scope.

As mentioned in v3 discussion, clearing the power bad fault log has no
effect but I'm still doing it for consistency and because we also allow
to read it in debugfs (so better allow to clear it as well)

---
Nuno Sa (3):
      dt-bindings: hwmon: Add LTC4282 bindings
      hwmon: add fault attribute for voltage channels
      hwmon: ltc4282: add support for the LTC4282 chip

 Documentation/ABI/testing/sysfs-class-hwmon        |    9 +
 .../devicetree/bindings/hwmon/adi,ltc4282.yaml     |  159 ++
 Documentation/hwmon/index.rst                      |    1 +
 Documentation/hwmon/ltc4282.rst                    |  133 ++
 MAINTAINERS                                        |    8 +
 drivers/hwmon/Kconfig                              |   11 +
 drivers/hwmon/Makefile                             |    1 +
 drivers/hwmon/hwmon.c                              |    1 +
 drivers/hwmon/ltc4282.c                            | 1784 ++++++++++++++++++++
 include/linux/hwmon.h                              |    2 +
 10 files changed, 2109 insertions(+)

Thanks!
- Nuno Sá

