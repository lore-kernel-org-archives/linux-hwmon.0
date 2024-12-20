Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F4225949F;
	Fri, 20 Dec 2024 01:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734657650; cv=none; b=V6ujWFLyCTcYQ8FONBvY26zlRkhqt65hAC8j8H4r+lD65qYmwRwA597PBUGAMNoUnkzCwRh8ltgG2xjpyfllODOLRmVQRLiQgZPd35ofCnpMz3sTGhK4JPGVf8nSwKnH7w0K8siiE5Pp2Ciu1FUmMfK+9EjIn0yHCBYmGtORAzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734657650; c=relaxed/simple;
	bh=inD3qlCkrxXZEGfMQVoE8kOpOHYdCSOzwOIqBMIi8vs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GaiJx0W2Z3bpSK8qe4cQyHa3b+zcceRC3Ae/UkITGr5bKOyR5jUlDhAuR1f3VDJKW7IB9yEiv9sNeQQCsv3SDlqW04gi9P89xmWYVmoJuscVIJ4+HxwLYOhoZp2clpu1ECRKQjhz1Y9lT8IQVAcEkteGXfZnvbNeO9uPiZ4PnIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=ZmpdNE9Z; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="ZmpdNE9Z"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJNPFhl026421;
	Thu, 19 Dec 2024 20:20:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=gVN/MPsZwAX+c7aHZTOvkYoyZwE
	I7RKMeYHRE1vwV84=; b=ZmpdNE9ZlpNeWDOA4rd58aQLbY+aoDDK++AL7chTdf7
	UDjGMLQicVIV5bXHspc1PwVo9FNN/O394c8vUCGrDL1W1XFZvdWhMHORYBRf446c
	AfbcPevueD+4jiwDzCaimRvJvjcKcK7yuksTZ/Y/kqJ+H+D8M0sVQhSL7SZiYRCJ
	fPZli9f0w0JfMGkpce6zrOchjbCgmCT8NNxJlVAL7Z9seRhQXNnAveqDSqUI0x+e
	oo64RUf3G72+tPeJuyuhDwytyrXA5QmVURF6VZYG1nQ5g7XSrgT6qARCHQiZ0KnS
	rli3XwOq+Fi6BGgR5YpNe6kLm0/HvA2l4mNaTMSiFJg==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 43mbbkwe2x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 20:20:27 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 4BK1KQXv046493
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Dec 2024 20:20:26 -0500
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Thu, 19 Dec 2024 20:20:26 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Thu, 19 Dec 2024 20:20:26 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Thu, 19 Dec 2024 20:20:26 -0500
Received: from KLIBETAR-L03.ad.analog.com (KLIBETAR-L03.ad.analog.com [10.116.44.206])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 4BK1KE7b019479;
	Thu, 19 Dec 2024 20:20:17 -0500
From: Kent Libetario <Kent.Libetario@analog.com>
To: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>
Subject: [PATCH 0/2] Add driver for MAX42500
Date: Fri, 20 Dec 2024 09:20:01 +0800
Message-ID: <20241220012003.9568-1-Kent.Libetario@analog.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: IiC2NaoJbCbC1FyshuCkJVVdFv-1EEeb
X-Proofpoint-GUID: IiC2NaoJbCbC1FyshuCkJVVdFv-1EEeb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 clxscore=1011 mlxscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200009

This patch series introduces a new hardware monitoring (hwmon) driver for
the MAX42500 hardware. The driver is a SoC power-system monitor with up to
seven voltage monitor inputs. Each input has programmable OV/UV thresholds
over the full temperature range and support DVS through the I2C interface.

The MAX42500 contains a programmable flexible power sequence recorder
(FPSR) and a programmable challenge/response watchdog with a configurable
RESET output. These are also accessible through the I2C interface.

The patches are organized as follows:
1. Patch 1/2: Add documentation for devicetree bindings of MAX42500 driver.
2. Patch 2/2: Add the core implementation of the MAX42500 hwmon driver.

The driver has been tested on the raspberry pi-4 platform.

Kent Libetario (2):
  dt-bindings: hwmon: add adi,max42500.yaml
  drivers: hwmon: add driver for max42500

 .../bindings/hwmon/adi,max42500.yaml          |   42 +
 MAINTAINERS                                   |    7 +
 drivers/hwmon/Kconfig                         |   13 +
 drivers/hwmon/Makefile                        |    1 +
 drivers/hwmon/max42500.c                      | 1049 +++++++++++++++++
 5 files changed, 1112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/adi,max42500.yaml
 create mode 100644 drivers/hwmon/max42500.c


base-commit: de076198d1e4934c5fc17aa52d5f1884f469ce1a
-- 
2.25.1

