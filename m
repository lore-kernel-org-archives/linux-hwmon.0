Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99DA3D34A4;
	Tue, 30 Jun 2026 02:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782787666; cv=none; b=ffQ9cpQGNQBzGVw9CAq4GfUOvCOEC28CoNP4spzbIQmOl7RzY4xBGKrkQ2K8Z4JXLp0JW8ahw+4BWMrLo2OpMdHlRpxgY8tBlw6nbBOc5Qz09Gr2ljIovIWRWz2wBKT+3RhO3IQIwsnEKuXSR5mftc6WfiPJGoYlheHJcpXogu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782787666; c=relaxed/simple;
	bh=xWkCcdVs0/ZkHJSDER1dQhlCT4iBQ5ChhXvXugGioWw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=OpkK/egllvAYpr/B8QCpKxj6CFMzIfMrpdJODlbTIL1jThKOkVquNjkYqr2LUrJHyNnDUQVZ9SVlB/t9YfyszO6iQfREJ5PNqyPIkIFPhznKoxXgpvToGc/IZe5sLAdSgdbTLBayLHD6REHr1wPqtspbCTB3ABWdsQNrD+gh6k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=YWOEyr9A; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="YWOEyr9A"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U1GKYd3623843;
	Mon, 29 Jun 2026 22:47:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=wpLFq
	81P9GVXRi2YgC3W5O/Bdfu5p6JlTzvtcx+TxYw=; b=YWOEyr9ARo3IN6neH57/M
	9R188gmeR3JSw3S3eFzTHnLBrhlrKFSpWI9d+XdIntYkNs91Kn4Vhcr+MKqGyKep
	F83YyCi/7Gdz6hlXv/Y/oUQacKT5Y34smixSmuRpq7Q6pNUBnCBfnPxEpm0yL6b/
	uBN5SZIPkIc0z4LEBBzZOoqzUYEMl0pOuGkjg917RR0X251xVBS5OfB9PYkMrBgN
	V3ukKT65DWiVZJx0fWPcdywo1CRiMEPODW2n04MyWMPFh8zjsX4RsV4950SDTM0A
	1mgjoHQEhRJK/BQz9XYENjwahLIUGsm6siqMW6QkG+4PvV1OxvSa0i4GQ6IWIa/r
	Q==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4f3k4emnjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 22:47:30 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 65U2lQQf033011
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 29 Jun 2026 22:47:26 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 29 Jun 2026 22:47:26 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 29 Jun 2026 22:47:26 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Mon, 29 Jun 2026 22:47:25 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.193])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 65U2kqhi019448;
	Mon, 29 Jun 2026 22:47:18 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Tue, 30 Jun 2026 10:46:47 +0800
Subject: [PATCH 5/6] dt-bindings: hwmon: (pmbus/max20830): add max20830c
 and max20840c support
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260630-dev-max20830c-v1-5-a02786bde470@analog.com>
References: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
In-Reply-To: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        "Alexis Czezar
 Torreno" <alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782787612; l=1107;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=xWkCcdVs0/ZkHJSDER1dQhlCT4iBQ5ChhXvXugGioWw=;
 b=yIu0cl+iafsEv4vr3pY8zB3gVFMqYpZ/ax3cr5nrD5p8cj7tkG6YEO598prvalXabf0KRzaYX
 p0vtTmX5r4PA5CAZQN+vMkZan9L2YCAHC7Sj3xFrxlrQEkjY8IpADcJ
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=bIgm5v+Z c=1 sm=1 tr=0 ts=6a432e43 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=gAnH3GRIAAAA:8
 a=wmL6Cgq2dR32m5AAhy0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: kFegtIhuC9MTIqFi4aihIcbI7B5fQkiP
X-Proofpoint-ORIG-GUID: kFegtIhuC9MTIqFi4aihIcbI7B5fQkiP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDAyNCBTYWx0ZWRfX7/9EWnKZfSvT
 3ky70wRFcNSQF9GBGS+y714+u0qBAF0fek0r+GnkIt13813iFjttnvwl6ySoCsDya2e1p48Cfsv
 zJNyLFr4GEz8/TTeHY3oivLJixg7/mmp0n8To5l9oVzQNRVds0Px
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDAyNCBTYWx0ZWRfX5FechK/8M2G8
 xNyky+X2aQ33FbFQk0YGwJDYQoOvA7h32a3uj2mN40CkFhNttSYldH4ygXX+OaN44pEocS5tA1x
 37PPPCNCPQxV95Zydq/YyhLKnoVu9LSl1xhwilOW0L2C2VtE7/cO571ZG4f0vUUNDKtEGOxxFYi
 UhZQ2iMD4kG1qTPK3brnR26BoZyX1qJVjMCQd2zPr1KSwHHAkdwIj754LCkAuAQBgcMFOO/Ls23
 qvkfYyxYiP18wVomOGgW+QiegGKt/Mqn5RuVb1jPgIeFEaKYDnMscLsmWtMWdQHPwhWxLU/aQl5
 Wz659+93bpV2i2KT1Y3RJg0C6W4ennUrPAWJAp1V56EuvkDcYr5KvZgtsqgfSOIl22qSBIeKAmv
 wbEcJlQZcGLIZjmcMvq8JaZa5Yo1dVU7aronziw8dbJxKFbzN6aPd5a7O9aW+Ys5PA0BlsvhthG
 oUxszPYUK5FaIwOsd8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300024

Add compatible strings for variants of MAX20830 which are MAX20830C
and MAX20840C. These devices have the same register functionality with
MAX20830 but with a longer IC_DEVICE_ID.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
 Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
index caedad40bc592c8489df235f02c6ff051070cb1e..b8ca8ec0446fae2a16484e5ff8f1bb563cdb2405 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
@@ -22,7 +22,13 @@ allOf:
 
 properties:
   compatible:
-    const: adi,max20830
+    oneOf:
+      - const: adi,max20830
+      - items:
+          - enum:
+              - adi,max20830c
+              - adi,max20840c
+          - const: adi,max20830  # Fallback compatible
 
   reg:
     maxItems: 1

-- 
2.34.1

