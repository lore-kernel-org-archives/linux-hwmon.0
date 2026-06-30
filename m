Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A2440D58C;
	Tue, 30 Jun 2026 02:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782787645; cv=none; b=etDBJw1nzshC5EOR57yd3SyLVXXNgLQjN+ITpsYU27setarMyOkdpn/5G69tCdJ46aSeEpZtzDTwECkn8w17Coz+7CJB8FD/Rvnt7XRGHmFpMurxm4o/DR0Ce4Z9Kwkjl8s5oPYO+5/e3HLpYX/cD7kYJikQIuPSF1cU1oE3VqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782787645; c=relaxed/simple;
	bh=/XOt8VjZbq3IlHnFcaiWStfUQzdzYcJ+oBdobczrAFo=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=Xq1cW9CTnFT4a94HrYcgd3N51DW6vTBq7xlMxK9nhPXuYkvGEgGI17qegW0apniP6T7kqqq5rs10IhDiT1b1ljYcPP2N8tEG5Xg5jQ6ITveQrUMXwLWljprvDfaU9zUihUfb4hiq2R+mcukf+2bgWvmSnm/f/bXARRgNndNE88I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=mARmZ+/s; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="mARmZ+/s"
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U1GaDN3611087;
	Mon, 29 Jun 2026 22:47:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=mOQ9yrVOnGdqq37irpDrk2uyrxB
	94ao4zwmdHglGVu8=; b=mARmZ+/sgNhyj+iAURfNbBqSCyeprk3tHnTdrJbap8O
	3EKU0Ople+eZzE9G3njgaSw2qNqv3JmA5qTHGxwOGy5tx65yc2eDsMhQVeTtiwWD
	Z1SIFeSGC4DIAGkcdVN+0BEVI2bDkgwXUmMuzGA936OuqOZhJIeCfiukS3KxAW+z
	wQ4cTIqmSfVMi/PADXzSXcTIXBob9aQbBOR9wHNFf85zcO8ck/A6YiD/o7SrCIPA
	soCYTiTCdZTRMFrMnzVjMUduunR0CSxiT7poU4dLeVA9e7hY5Kl0MRzQ/XyJTAVg
	vo19zG6mSyaApTRW/61gszMq4A0E3VKGpNXbg0vctyw==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4f3u1mte3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 22:47:09 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 65U2l77G032969
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 29 Jun 2026 22:47:07 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Mon, 29 Jun
 2026 22:47:07 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Mon, 29 Jun 2026 22:47:07 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.193])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 65U2kqhd019448;
	Mon, 29 Jun 2026 22:46:55 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: [PATCH 0/6] Add support for MAX20830C and MAX20840C step-down
 DC-DC switching regulator
Date: Tue, 30 Jun 2026 10:46:42 +0800
Message-ID: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABIuQ2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDM2MD3ZTUMt3cxAojAwtjg2RdyxRjixSLJINEczNTJaCegqLUtMwKsHn
 RsbW1ADZJpkdfAAAA
X-Change-ID: 20260630-dev-max20830c-9d38d8b0a765
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Alexis Czezar
 Torreno <alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782787612; l=1547;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=/XOt8VjZbq3IlHnFcaiWStfUQzdzYcJ+oBdobczrAFo=;
 b=GzzGeuDrxhH582ZQ3M3ZpCH03PyaQyTqodJilWIL+Ds+HoDUgJ0QOfaKipaal05+jFzs068xK
 zUkjeyzdLOVAiVEAW0WFva1uU1PcvfubVPXxJhlpjw/eV/9IZMNTDj2
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: QkhgtxWmjosT9ceh8dAS-vteqxXtIrC3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDAyNCBTYWx0ZWRfX3LguymopKAaJ
 hsGthQCsIdKIduUt3oeQc5unjB8ZJKqmWklFjmnJ6mlVHSpthCjhJEugCR1K/Cf+i6D9BsOBnD3
 8ijf7pRoZL9lIrCQVLa0yZqwBLf6q51gBnry/QUnuLj99kUMaiH7VQ+Y12p2WoevMjlPPa1ZFL3
 D1g2oZPcm+immWJLmR8cG2r20t+syS3tj023D4f17/i2YD9yuQDRsaN0znsYkmHiF0p+ajYFnzD
 Eaj1b6R/X5HfCEFXoyHsohKpV//ziP0t7sL0N4aNRJtaNSRC0hyUvs4Jm9tWddyCPbnupeaX17k
 /Hwtl+4gQzT8wVm8qqypCzf2XpoPftRLnfan+bBCilSFXVNqz3vapvwrjZph6Zkj5dJ8X7X4Q5A
 tiFugWEntmNnNSIEbWS6/3XWUChKuNLbjIMZZdNTf3usNcvMiYHrE0VLDKm0l/wYFXykUKsTwER
 K95birVjrgZ68BJaiqQ==
X-Proofpoint-GUID: QkhgtxWmjosT9ceh8dAS-vteqxXtIrC3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDAyNCBTYWx0ZWRfXwkvaBuGzUc0L
 0F9V5XxBehsSDzELXxZUjFHVBBv++FqDFM5Lafie6d+HiNTG+doJo3oG4FhsJhGm5jKSVxGp5tn
 CMF9zdvFP41h1ccHToNr5zEWl1g3y/iTVnlf/N/0mrsCILRZIaZA
X-Authority-Analysis: v=2.4 cv=R8cz39RX c=1 sm=1 tr=0 ts=6a432e2d cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=gAnH3GRIAAAA:8
 a=pX8K7AMcFWmkIJv9s54A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1011
 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300024

This series adds a few features before adding support to MAX20830C and
MAX20840C.

Patches 1 and 2 adds an enable gpio that should have been included before.

Patches 3 and 4 adds new resistor feedback properties that is needed to
properly scale VOUT

Patches 5 and 6 adds support for devices MAX20830C and MAX20840C.

MAX20830C and MAX20840 are step-down DC-DC switching regulator with PMBus
interface. MAX20830C is a different packaging for MAX20830, and MAX20840C
supports 40A regulation compared to MAX20830 that is only 30A.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
Alexis Czezar Torreno (6):
      dt-bindings: hwmon: (pmbus/max20830): add enable-gpios property
      hwmon: (pmbus/max20830): add support for enable GPIO
      dt-bindings: hwmon: (pmbus/max20830): add VOUT feedback resistor properties
      hwmon: (pmbus/max20830): add VOUT feedback resistor scaling support
      dt-bindings: hwmon: (pmbus/max20830): add max20830c and max20840c support
      hwmon: (pmbus/max20830): add support for max20830c and max20840c

 .../bindings/hwmon/pmbus/adi,max20830.yaml         |  30 +++++-
 Documentation/hwmon/max20830.rst                   |  27 ++++-
 drivers/hwmon/pmbus/max20830.c                     | 117 +++++++++++++++++----
 3 files changed, 148 insertions(+), 26 deletions(-)
---
base-commit: 1a42625604046790ea8ec61c2a749bbf76b28943
change-id: 20260630-dev-max20830c-9d38d8b0a765

Best regards,
-- 
Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

