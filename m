Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746992;
	b=IUuNEVU+Vve3KnNWh8umAUrFu6cSCmIr+YgdnzLyXqoxbSEilS9FZD/CL/lI54Ht0XoA
	 83a+RXD5UoS8ucVCkqaEkKt9nlwHA96YnoVFARfLyp5lDjwacn8BgiKmOinxwm5nZSAax
	 r26emMH3ggWnUAcPvMQGBREPPu6Gtcu+r23+R973OS/GClZkvOlE1F3VpbqoTObLmNixw
	 KhH61ydfg9YrZ8gScSM8ZOBj5FrkgioQU3u9Dh/v2T6OSokOtDHlFcSDaBszvoEbmjbYE
	 FbAOaYzJF0NbauDozRh0GODjEdy+PgZKWXeCKhc1WbmEtZUFl+ESIR3/zGn9pOE7WEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746992;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-ADIRuleOP-NewSCL:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4nuVbqjmwVtBwkEi5lYOaDCphgBSo6SLRygw+zLWz5I=;
	b=UZqLGEX6GM7PCgzoe4dKlot/Jen2UdcOOl/5FJ7NfUk5U7pMiuFSmEGcmgHt8XHz0Nsl
	 wsW5o7LkDRboB0mKTHIEVVXSHUpavZGLW3qVhQ/XhSf1sZ4ojliARU/nD9OozxgVwMdKU
	 9XWpO7V/pDuOp5wKNHqzxh3QoC3MkPbxPVeiy21aHFCKHXX/kgT8yeXGkdxYBMq7U3kdb
	 PLgyLHfUR4F35qkR0HbvkEH7D9WNZWzr/5YwUAd99VAPXxjeR4FStzA/hmEMzjW/5bP3R
	 TVqc3TMLwUw+SPpR/HEREuXetJ0o6szHTMIF7gL51jtJiZzYaFdaCOC+9gN3xtNFS3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=ewnVWNE2;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=K4d1fxQ+;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A59F606A322;
	Fri, 23 Oct 2026 09:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A59F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=ewnVWNE2;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=K4d1fxQ+
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7GmN4820734;
	Fri, 23 Oct 2026 05:16:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=DKIM; bh=4nuVbqjmwVtBwkEi
	5lYOaDCphgBSo6SLRygw+zLWz5I=; b=ewnVWNE2zbWqgeek4lJcYe/KfCozU9Mn
	JWBKauKJfZnBELQHP4KLlJWItI9SqAce8VW+xEhc/PEEJttUwjhrKgol2SwGtu8T
	eFgyZujc4HAgmDLqaizywwaZs4vZNyR0LV+8V4h+b78ow82rqUV9HkxVXjwpvXXn
	KxZTQ6kfwdCbmVjskrJUYnOMITGnZrED/CtLkifclO0Ae5rbrBTRLvArYS6qaG3/
	lz1yTrhsKPD9ECtrRMyzxEosAqJtalM6KsFcJuGIMDU7O68kuQZuYEyGbzc/ckxn
	u//P70ckMBj2dnXcBT/RLRYvT1B3PDMRlKAKIbjY07Q6XfMDJUnW2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=4nuVbqjmwVtBwkEi5lYOaDCphgB
	So6SLRygw+zLWz5I=; b=K4d1fxQ+GYGyBA3ZieXJI9/IAnjgY/VPXHF/ScTqo44
	F7Ln5pUtJ2mHJc7pz8xa6eCbTdWHV4TqIT0fi18s9/YMHD8WjwIfrSvgn8VuofG+
	qMlEo3Dx2koghX2lz9U02qLQCRKKgFXPoyKkGh3tyBzeCmVRBJ1sz2qAqO48Zjlo
	LRRiPohRwihPhL9b69KKQsyBgLf+cVMnT2XHioRGFr6tPEU/4/BgAzljvlOoqNMI
	zfxDx98SU2gHMy7c3A2gopz5cSsEk2e2dMbwVANlGpoPlwz/fBC661jwOPJ0HPnO
	vDD/ikOGFqBBYEnRrAesKn6W/ccL4RKxbzZca4QRZ/g==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4hfy3wsrsa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Oct 2026 05:16:16 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 69N9GF49049047
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 23 Oct 2026 05:16:15 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Fri, 23 Oct 2026 05:16:14 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Fri, 23 Oct 2026 05:16:14 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Fri, 23 Oct 2026 05:16:14 -0400
Received: from JGERONI2-L01.ad.analog.com ([10.66.6.192])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 69N9FwZC023047;
	Fri, 23 Oct 2026 05:16:01 -0400
From: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
To: <linux@roeck-us.net>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <corbet@lwn.net>, <skhan@linuxfoundation.org>, <jdelvare@suse.com>,
        <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: [PATCH v4 0/3] hwmon: (lm75) add MAX31875 support
Date: Fri, 23 Oct 2026 17:15:47 +0800
Message-ID: <20261023091550.1494-1-johnerasmusmari.geronimo@analog.com>
X-Mailer: git-send-email 2.44.0.windows.1
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
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzNiBTYWx0ZWRfXxxUKP6Aqbm/y
 hln7sGXtLTvEFQ3aHpxwkqLz8PFPX75Xke5IzvJME2gfJ1QGXDrtZOHEtWnWdS5pH+vNbOEbYl4
 sGI1UWHjvxQukVz8MH8bY08IuHIT17tdgK4N1rbpa47W3DQAEZYc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzNiBTYWx0ZWRfXxnbsOh7sBSc1
 EFfOMCKyfZRIaAxijvaC4vTXMMqkbsn7Pucjzzka5XOR6iVfguUtoLYcJnztqmlTxVK5hcZ35A3
 dWaQTI3DtaWrmhhzg4aI/GdDyJkTXJSEomiZCd7TJ8cEqgQagy+xTfEWzOepqpXLw3m512lp63M
 +P2Ht88kiaG2xed+XUAh28SNAuG7o5ZUsnH1aXPiGZjlVQvpRNGPeyhvP4VlONbj4RCmTMq7pv5
 fL0BQkVUTlBqD9+qN3LWFGIfsC7vDFdy8GtySgkAGvQSyj4c9KXsCP7zLvkvU/BZt7Pw8iwevnZ
 fTLVidilxkuIetoJafQZMvp7JpycAWZL2Aqgln8sBVnY+wJC5hKLJ6AJKCwmyTkFliwAyidrYAC
 shj8lZ9gEd3VWSlKnGXK891seL3xDsPNvHnpJ0L1Ny93V54mk5/QVn21gnf1CDQ1L56XpJZlgN7
 8bWT07ZW2yQG+ARcFlQ==
X-Authority-Analysis: v=2.4 cv=fJ+sTpae c=1 sm=1 tr=0 ts=6adb25e0 cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=OmVn7CZJonkx5R5zMQLL:22 a=vFOL9JNIDB1nI9Vvyn0A:9
X-Proofpoint-ORIG-GUID: Jn-lZmP5oFTMNcKv1zU6d6VNUVaYzYsm
X-Proofpoint-GUID: Jn-lZmP5oFTMNcKv1zU6d6VNUVaYzYsm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230036

Add support for the Analog Devices MAX31875 I2C temperature sensor by
extending the existing lm75 driver.

The MAX31875 provides a 16-bit configuration register, selectable
resolution of 8, 9, 10, or 12 bits, conversion rates of 125 ms, 250 ms,
1 s, or 4 s, and an alarm output.

Changes since v3:
- driver: skip the alert polarity configuration for the MAX31875. It has
  no polarity bit, and the bit used for 16-bit chips is part of its
  conversion rate field.
- driver: set the default resolution and conversion rate at probe so the
  driver state matches the chip.
- The conversion rate field is D2:D1 of the configuration register (see
  the datasheet's Configuration Register Definition). It is read here as
  0x0600 because the driver reads this register without byte swapping.

Tested on a Raspberry Pi 4B with a MAX31875: defaults are restored at
probe after the chip is set to 12-bit/125 ms, update_interval selects
each of the four conversion rates without changing the resolution, and
temp1_alarm follows temp1_max. This was run on the Raspberry Pi 6.12
tree, which reads the configuration register byte-swapped, so the
equivalent bit positions were used there.

Changes since v2:
- dt-bindings: expand the commit message to explain why the MAX31875
  needs its own compatible string instead of reusing an existing
  lm75-family one, and pick up Conor Dooley's Acked-by given
  conditional on that fix.
- driver: drop the .resolutions table, which incorrectly tied
  resolution to the sample-time index even though the two are
  independently configurable on this chip (Guenter Roeck).
- driver: use the BIT() idiom for the alarm bit read to match the
  rest of the file (Guenter Roeck).

Changes since v1:
- Rework the implementation to use the existing lm75 driver instead of
  the previously selected max31827 base driver.
- Add the MAX31875 Device Tree binding, documentation, and driver
  configuration for resolution, conversion rate, and alarm reporting.

John Erasmus Mari Geronimo (3):
  dt-bindings: hwmon: lm75: add MAX31875
  hwmon: (lm75) add MAX31875 documentation
  hwmon: (lm75) add MAX31875 support

 .../devicetree/bindings/hwmon/lm75.yaml       |  1 +
 Documentation/hwmon/lm75.rst                  |  6 ++--
 drivers/hwmon/Kconfig                         |  2 +-
 drivers/hwmon/lm75.c                          | 30 ++++++++++++++++++-
 4 files changed, 35 insertions(+), 4 deletions(-)

-- 
2.34.1

