Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793763060;
	b=DTA0vA9vLbuOvsM6ZN3lt+QKh499j9P3J5G5tx2LY1Tavhqboudf9ayj7UNGI/mCMwpo
	 56AwwSqW/a1rxqxnh6actrcaVCbiOJkUV9q9l3c9U/5pRL8TtSRey0hbEzekTUq/qmvvt
	 tFPYGRgOfHTEPgjBx/R1+qa9nDMV6WTC+ZjK0m6LyUkhKKJLpuifRrfwsxE8RGI592Dar
	 iiHPr3h+/JwsfcavXeSpCNfgu7rJOPppRr4UuEiERku/08rkxNOYgP7Cr8PrlzAmI0bR7
	 zn4HkbFV7A9LnGqyzFoV3cPv6Mt7NwamdkP4ObV2ZdlcOPjN2T9Oj4UGA1ZAXoqpjtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793763060;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:
	 References:In-Reply-To:To:CC:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-ADIRuleOP-NewSCL:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Pa+iuCTRXGwhZsYYsBHhGMlF/VaO03OUt5T5rVxFsGk=;
	b=O18JZn+jNZkwjYp0QReQaDO4CSJgJ4wlp4Ez8GIUkrlf4Whk1pp9nmajClv96zynmxA8
	 0QsN10gGbQKyNg3UlobL0gQNV/xEjTbBXFeliTPH4zmAxgdWoylygJT31XFJJ1ORqBfyF
	 rZzIciF/ecAnWExlC5oquL3zbZz3q9iD/n+wzvlHKJQN75Yb1J+sEww0GD9nQ4HEMrE6o
	 DImWrzrc8JSbtY5VzdVHi4yqTPQO99jNlj8LUzTfn74c6Ow1vMrgWrZVmDA4KWKYSvd5d
	 qgKaIL9jQpAfbSIrS+omKjGQ328wZ/J1VMZZ0eyJV9bZzsK/e6lvqpHEegf52NOiEhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=OaDu+yeB;
	dkim=temperror header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=pySFyvIG;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5550606A331;
	Wed,  4 Nov 2026 03:30:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5550606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=OaDu+yeB;
	dkim=temperror header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=pySFyvIG
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A42n0oc581134;
	Tue, 3 Nov 2026 22:30:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=Pa+iuCTRXGwhZsYYsBHhGMlF/VaO03OUt5T5rVxFsGk=; b=OaDu+ye
	Bj83D8kXBRaF5f0gzfnQ6zL/KCP8u36ea2OVECKZokyxBi/36ik36hQplMBdTI5Z
	qPs1ixIOJO3XSTmMSfQBvfnzXuECbk7Y8UX69Jc7er+Jh40qeorRP8f3MiyV7BCG
	K3XcJDEwS7Sp1k3X7qTDcdgVO/EhZbRcws1Kn/b8919QyK8C8VT6xMRemnFqXlnz
	pt89UlI97gwkaPn70AehXX1n1Ay3pPIZ4AUXoSqZTWNtBqruV//C8dRsdfsfXLB5
	9cKO5jKpYFwCV9Sqa9ymAqqZEL0rBgLiS5Xhntv/pkcUAYxKheUuvBqPGI9kQbUw
	sa5BOBmnfVwa9nA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=Pa+iu
	CTRXGwhZsYYsBHhGMlF/VaO03OUt5T5rVxFsGk=; b=pySFyvIGA7ZnN1m/kYmzC
	YNWfQUwaOTEwz9b4aevu16H0vMxDf5R5PhopvNMXS+hi33wPZKzcnzfOqZAEQNg5
	vDE2whL4jhEzyepOWZI3J9w1onUDgM9pj7xdNjAZ9PQ0CHV5k9DTRcrAkPu1Zr7W
	qKcOQw/1hC636jwqB+EZ7FP19OdTr1kq/Y/5X0tlDsHJOsJbbKYlu7Q2c//s60s9
	5Ha6F7QMcC2ifM4pevzE8jumkNY+Ntmd4MxqK2XuFHEp8nPA+S6H2vENzd+ZLUxP
	MxtYe3qzRnrhswMPSo/J/pKX2vb/hnvr4nZEZMfwBhUzfQWcHZSoxF/oxbxTzsCJ
	A==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4hqk2pu4tt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Nov 2026 22:30:42 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 6A43UeEg059106
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 Nov 2026 22:30:41 -0500
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Tue, 3 Nov 2026 22:30:40 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Tue, 3 Nov 2026 22:30:40 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Tue, 3 Nov 2026 22:30:40 -0500
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.191])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6A43U7Hc022108;
	Tue, 3 Nov 2026 22:30:31 -0500
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Wed, 4 Nov 2026 11:30:02 +0800
Subject: [PATCH 3/3] gpio: gpio-ltc4283: Add support for the LTC4284 Swap
 Controller
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261104-staging-ltc4284-v1-3-49fce67ebc48@analog.com>
References: <20261104-staging-ltc4284-v1-0-49fce67ebc48@analog.com>
In-Reply-To: <20261104-staging-ltc4284-v1-0-49fce67ebc48@analog.com>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Guenter Roeck
	<linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
	<rdunlap@infradead.org>,
        Linus Walleij <linusw@kernel.org>,
        "Bartosz
 Golaszewski" <brgl@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>,
        Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793763007; l=1055;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=oZTp3B0vat1dt7z+SD0+77UnT0wp1F7pBAbbGQThaTY=;
 b=I5mKC3dLLZDXssGbjfiJwjNShiGn2SJlKMhTw6VE07BGB8tiLCEDl39Vl78LVPETcSx84Smti
 4GnBituLmyLAJcjf7CJkF7rj9mP++fMFWI1BpnhZMSwjRMn96zvCb0o
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: 9sMAUd_4EvqcnaOYyjdXSpJ1eBPwHcdT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAxMyBTYWx0ZWRfX7NPaQnk45lXW
 e1SQySbt2unUol1jDzLBZ8HnpI/acUOead05OYxMAXAywmrE2ZJ7YM5QMcch3jglG4Rm8uKnx6X
 CStnEsbDP5Q2CnCCbDKkJu4td9pmLJhUqaH6MFFIdl6XUs1j6az2
X-Authority-Analysis: v=2.4 cv=NPlAaE6g c=1 sm=1 tr=0 ts=6aeaa6e2 cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22 a=gAnH3GRIAAAA:8
 a=iYeKZkTQcfneQMIFD6gA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 9sMAUd_4EvqcnaOYyjdXSpJ1eBPwHcdT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAxMyBTYWx0ZWRfX5bgorpH64RwS
 3eu9leFrN+5AsYEOKAoOgHIuqu5T97BGsP8QmR9yxNG87TIMmcQS8KxAKRaVPnk9dgJihYU/p6s
 0NUxBNldAoZjRkaXm30ABLtIooEOcwKy8Xeg/2pESPC02JcIZ+dFSj4iZBKi8ValZ4vsQWQvey4
 W3TBscqSXKa5n0t1znuDooxu0cGw1ktzNKiYgQNPZzTwRA7243W/BoCIgeDsBk8CCTpuYaTfz25
 kGkIWzTS4vadmRIDlQTD4MrSgEyCB+g8ByvARbMbFSF14rnrZGW07mCuVAGejLxcq7vPpSUKa1t
 9kiuWUpMHGuRguOvsFIxnLMRcNwrSkOxetMjfyRBXgIqJXIZqyssRUOCP0HLW7zDCqZuX7UksKf
 WueFApf6rC8QrA29ZBefAUVtKfBk1D3lIoQsssimFpM24JV7l2YncokpLl0/UkN3DKNDUQxZ/H+
 og3bVs7G1Z7jfoeCIFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 clxscore=1011 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040013

Similar to LTC4283, LTC4284 has up to 8 pins that can be configured
as GPIOs and behaves the same.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
 drivers/gpio/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 55e4280029d86e7701d9a043c89537f60bb70c6e..de9226619ef2f77fdded123657a14c15cbba07b1 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1864,11 +1864,11 @@ config GPIO_AD7768
 	  called gpio-ad7768.
 
 config GPIO_LTC4283
-	tristate "Analog Devices LTC4283 GPIO support"
+	tristate "Analog Devices LTC4283 and similar devices GPIO support"
 	depends on SENSORS_LTC4283
 	help
 	  If you say yes here you want the GPIO function available in Analog
-	  Devices LTC4283 Negative Voltage Hot Swap Controller.
+	  Devices LTC4283 and similar devices Negative Voltage Hot Swap Controller.
 
 	  This driver can also be built as a module. If so, the module will
 	  be called gpio-ltc4283.

-- 
2.34.1

