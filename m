Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60381552FE;
	Mon, 29 Jan 2024 16:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706544651; cv=none; b=RJe7+VgiwXo2sPO2Idrwpdlto413TGxmh+YwQpJruIU7tCpDGjag3egnN638cqaZEQqAH6XiR9d0xnnq+cvSejwaTsZ/AGIJk+nl0NyGRdPtwfdIrlgwtEiXh9ePGFjAaWzlCw/63xnDtWXsfnAWxKZE88yVoAvzNYJutDz9kMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706544651; c=relaxed/simple;
	bh=EbFpr9ZKDmCOAJdluDZ3z64ekFircDWxS2WbS/tts3o=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=O2zV2Lii0FeRi64KlHEHVhCfkmuyL1nCmhsSK9L05cY30vpOvjW1QeaTbcXT6dZtbZ/2d0jk+xlIq8d3Ys9Ldi+hdY4TtpxHnc3N9atYdXmzIfn/C0zrmXTLMPMZy4UHxFFyTyEl2JkJB6LHuUREpY75xcHnhJ9mn53Q26xqRVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Bj567jN9; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Bj567jN9"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40TElDxT021654;
	Mon, 29 Jan 2024 11:10:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	from:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding:to:cc; s=DKIM; bh=oEBDrzAlQ12hosSNut/
	8e3TfatdsA94M7gemXVu6V9w=; b=Bj567jN9k9oI4sYixtMm7+yGlCVC9aEFl8W
	QIj23KnWMCClHInSlYxdEYwbbkMx5mMsAkm2cG8JBe0+9vA6JYkNjV868TKkuNfx
	sYxpmggegwNL9PMM4OOu2SxS97lp64QzQqRsExbxeiTIBT6cRABnUbvdc5V4jBYV
	58Qkywdp4fHUN3+sNzTQsUo5RmjISlP6vYI7H5m1WXoyXEYFFOY1LtCPma6QVp7t
	sr1kPEtL25ksswhl4jlbSFQRtdMcILCMIA9E7VAH5jefW3vujDTrJJ6bJxAJL6JH
	e6eZZJ334TjV+o+RUqRgvQ6xk1J0NXiwg0qrQXUmZsrxQ/NnKPA==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3vxe398af2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 11:10:23 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 40TGAMQg050399
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 29 Jan 2024 11:10:22 -0500
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 29 Jan 2024 11:10:21 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 29 Jan 2024 11:10:21 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 29 Jan 2024 11:10:21 -0500
Received: from [127.0.0.1] ([10.44.3.54])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 40TGA9Cf002356;
	Mon, 29 Jan 2024 11:10:12 -0500
From: Nuno Sa <nuno.sa@analog.com>
Subject: [PATCH RESEND v4 0/3] Add support for LTC4282
Date: Mon, 29 Jan 2024 17:13:22 +0100
Message-ID: <20240129-b4-ltc4282-support-v4-0-fe75798164cc@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKLOt2UC/32NsQ6CMBRFf4W82WdKfcXGyUFWBx0NQy0tNEFKW
 mw0hH+34QMcz7255y4QTXAmwqlYIJjkovNjBtoVoHs1dgZdmxk444eSlxKfhMOsiUuO8T1NPsz
 IFZNKCqqEriAPp2Cs+2zSB9zqe329QJPz3sXZh+/2lWhr/2kTIUOyWpT22DKy7KxGNfhur/0Lm
 nVdfx4aQie9AAAA
To: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>
CC: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        "Rob
 Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706544807; l=3062;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=EbFpr9ZKDmCOAJdluDZ3z64ekFircDWxS2WbS/tts3o=;
 b=Y4lnBaCLK6MEVOtqSQ4D9G+NfZPzQnPpEEHjNzhRp6z3H92G1A51y7vJmZPgyNTmKynn0hc7s
 XZY0lWA7fNxD4NDLrj6/L/cE9e0yom5V7RMBF5CkPd4VnLYdcvoNc00
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: iMDWAOn5PKRn2Tv7QZQ-Iax9gvBJFdOV
X-Proofpoint-ORIG-GUID: iMDWAOn5PKRn2Tv7QZQ-Iax9gvBJFdOV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_10,2024-01-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1011 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401290118

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

I've also added Conor's reviewed-by tag while resending.

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
---
base-commit: 909d8d33f8b4664c9b6c7fd585114921af77fc2b
change-id: 20231218-b4-ltc4282-support-2a08a85465c6
--

Thanks!
- Nuno Sá

