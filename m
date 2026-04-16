Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB48438E5EF;
	Thu, 16 Apr 2026 08:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776326422; cv=none; b=PjKbsukBEVfwIoyaal1BFQgM2mZ0JYwGB3ltfq2EfDeTi1Lx55MkppUchkQec2FdPfilBKqMBgtqtL5nHAITVnJwKAkcjrLAsBYMYmJqGiTgUg8bpqZVIjy70KvNKU8HjEoTk3uSLeOrCXdCCnQwYsWPFMbJsDcCv5MJ6K9GP5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776326422; c=relaxed/simple;
	bh=GPF1TfGOqzcqdTNO5Mh6DsmNyK7qEBczUVGwRXxwemI=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=HEx0UN1KYwjt4+woL8bWYgkSeBniy/eyJStl+vUl8MZ6sJDmnl36claLYfi0zK3UOR87cXkdfZ+M8lX7l/PdFV49FuN95Fxmw8GuRiSsWVDFx+/3Y4D/lMsJPrur/q2JdUVTSiXWykGfq/Sobe57eNawW8FTPfFZux1V22DjYE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=x6QHXlli; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="x6QHXlli"
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G7QGoR3359996;
	Thu, 16 Apr 2026 04:00:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=O0gh3tgfUuAMymqw1xMuN6uE5BE
	W0UfqtQMWfOAvnyU=; b=x6QHXlliS6gRccHp8ZVdq8djXJEPw9xypkOx71WE63U
	49vW11Sh6+yu6oZ3Tu9YeCN6cBP1BdZ3hhVLr8cB7YcHZfUQiK9SzJazk0o32/Hk
	QfH4pFwE7yPkjOUIXjUp+SAX6l5SnZo/q5PJuMgBS18edHlxLCIog5h2IBlcDaKI
	mmOOQDSMXC4pFT0rm4m4841tUHh5ygjXuElOOa4cEAQNxQ9Kn0DyxOE+ik07G3pR
	O85R1TDS1XNAsAac6T/3dzrxFqWLRUC4B4354X28lz4j0vVP7wAgjIu/qsL56QHH
	FVFgvin2XxDBAZ7ixw2O5k9HSwmuZq6WD+olFa6xxSw==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4dh859dgnf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Apr 2026 04:00:00 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 63G7xw4A042620
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 Apr 2026 03:59:58 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 16 Apr 2026 03:59:58 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 16 Apr 2026 03:59:58 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Thu, 16 Apr 2026 03:59:58 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.193])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 63G7xbdx025993;
	Thu, 16 Apr 2026 03:59:46 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: [PATCH v2 0/2] Add support for MAX20830 PMBUS
Date: Thu, 16 Apr 2026 15:59:09 +0800
Message-ID: <20260416-dev_max20830-v2-0-2c7d676dc0bd@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM2W4GkC/3XMQQ7CIBCF4as0sxYzTBFbV97DNAaBtiQWDBhS0
 3B3sXuX/0vet0Gy0dkEl2aDaLNLLvgadGhAz8pPljlTGwhJouCCGZvvi1oJuxZZLyQ+etKjVAr
 q5RXt6Naduw21Z5feIX52PfPf+gfKnCEjjqYdO9KnM78qr55hOuqwwFBK+QLJqdbRqQAAAA==
X-Change-ID: 20260414-dev_max20830-9460b92cf6aa
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        "Alexis Czezar
 Torreno" <alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776326383; l=1936;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=GPF1TfGOqzcqdTNO5Mh6DsmNyK7qEBczUVGwRXxwemI=;
 b=16+t065flkcUIGvZRwYWvlu2cRYg901H1i7NAIwBYCiobC6E9cL+/WGLe8JjAmIA4How9xJVv
 vxSdNxC1tbZAwC0xBVZFn5vQ1ISfjbQzlDFsqQmx3qUeupA5Se5OCig
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: o1o8N6D4kH4mGTLCs_uHO2LmYO0-OQuk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA3NCBTYWx0ZWRfX8iRnKc4tSYni
 jfe3/uSv5r5xN6toaDPeivfAYT9sw8zIJVnRFeYLEgBtesklG6kXnV26fGLl+cu6rcxO8dkKdPo
 ENfwAc6lyokAVIB4Kl48lN9rsxjXWCpMcs5uU62HvHdk/nKPlYrxUEe9m3WQcT941bUKek32E0O
 PEL4FMJBRw3BOL882CM6bBrHqS7YMcQj3MemYLIKrbrRjC9QifseWDkb8cwRR5dFyKMNwgRsNKq
 uTfYeZoCvuj8T8tLOgfEztSqIYIcPMFCUqNZpoR06NRlACLKc5rMC2XSIbKVa+IqwGei9prnsub
 ruZB1kj+bdpWLqPjQIQsxJN4V5PbcsCWdGRU0h/Jlb+Xj5Yttsq8xzqKr4j1Kxc+YoYB4SUlN+/
 lJO/jkW+FtfHmRhSF34b3LcUTItPkX0Lf0NKNBA8O2nVTKAh7zsf7/gJctIIGDczqrDAMpD8ENi
 39P2ni9f8uML0YYUSxw==
X-Authority-Analysis: v=2.4 cv=Ivkutr/g c=1 sm=1 tr=0 ts=69e09700 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=gAnH3GRIAAAA:8
 a=VwQbUJbxAAAA:8 a=r-qAA2OrMi8oRDqhcIUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: o1o8N6D4kH4mGTLCs_uHO2LmYO0-OQuk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160074

This series adds support for the Analog Devices MAX20830 step-down
switching regulator with PMBus interface.

The MAX20830 provides 2.7V to 16V input, 0.4V to 5.8V output, and up
to 30A output current. It supports monitoring of input/output voltage,
output current, and temperature via PMBus.

Datasheet: https://www.analog.com/en/products/max20830.html

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
Changes in v2:
- bindings:
  - did not add interrupt, smbalert pin does not exist in device.
  - added allof with ref to regulator.yaml
  - changed additionalprop to unevaluatedprop
  - device node name in example changed to regulator
- driver: 
  - max20830.rst: Added missing in2_alarm
  - max20830.c: 
    - added missing quotes in MODULE_IMPORT_NS
    - added comment on why i2c_smbus_read_i2c_block_data is used
    - first byte of buffer used as length instead of the return value
    - "unsupported device" log now does not print first byte of buffer
- Link to v1: https://lore.kernel.org/r/20260414-dev_max20830-v1-0-210d3f82c571@analog.com

---
Alexis Czezar Torreno (2):
      dt-bindings: hwmon: pmbus: add max20830
      hwmon: (pmbus/max20830) add driver for max20830

 .../bindings/hwmon/pmbus/adi,max20830.yaml         | 61 +++++++++++++++
 Documentation/hwmon/index.rst                      |  1 +
 Documentation/hwmon/max20830.rst                   | 49 ++++++++++++
 MAINTAINERS                                        |  9 +++
 drivers/hwmon/pmbus/Kconfig                        |  9 +++
 drivers/hwmon/pmbus/Makefile                       |  1 +
 drivers/hwmon/pmbus/max20830.c                     | 86 ++++++++++++++++++++++
 7 files changed, 216 insertions(+)
---
base-commit: fb447217c59a13b2fff22d94de2498c185cd9032
change-id: 20260414-dev_max20830-9460b92cf6aa

Best regards,
-- 
Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

