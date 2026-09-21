Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011051.outbound.protection.outlook.com [52.101.52.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE78B3B47E2;
	Mon, 21 Sep 2026 07:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789975014; cv=fail; b=rrlrtQ9hy+nsrP1Lg2O6US7lirt1bgT9aFcVH93EC7D44tAX1l9wt+liNbQcGL9up8OtenS6PPmkfZERXe3k6ZbaZLW/OwmsvM0oT7aRzjXDnyPYUNzWkOQz7SXu090wqFfKfOWBKodTHzPNpY//xDxjifp1qAnUH/jKBI0B8IQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789975014; c=relaxed/simple;
	bh=ww+iVLSI0Yb1NFinPlx2QMQDxBfdiSa0R7Wr1afUDwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=YiKjFroyZFWJkJJ8ix7VNcey2aDa4TrU+ZT53i1FReqTugqwaYjVJqBP1K7Iy17Ik6IVraMZM6UoYIYpLl5qZM02o5Vi/maXrmBjXlFAKcu0hAsDlRowv1NxFyxwJVHJ1omI9Ea08tbV+yGMa7seBw/AQLwL5bWuqqxskOXz2Qg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=amdcloud.onmicrosoft.com; dkim=pass (2048-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b=Epb4z9/r; arc=fail smtp.client-ip=52.101.52.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amdcloud.onmicrosoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="Epb4z9/r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uJT9HifF5Ebex43M0rvbB+10mgVUHzEBypn4+ORzl9FVAh20jUMaTNOjjVhhwzPtXEVRIpF9Hfta4PEYSqHIhaQzpkeemKxN3xDDcmKaLvo+0HxiwEzvIxJJ1YMG69swT2W7NWqFCWh4eTQLgR4O58qI5/q3EqgTFgKJXoVsfZV74lD7ii1nG9qm9loxplU3exUunZYi/KL6jHEJg0bYxqmzK6Wljmhd23fq25kbtQnzJrEIBwNLZ2AP/WzDu28qpNhcsY0d8PC3E8VJE1nDxdZDtRN5jif/mhzHKfyitHnQnTCGbCPGukLQ9QqkgIeXGXFrQ5h0XEpKiWKlLoXKVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vn5z752CuFFSB60FMJH5w+nNHkFDeM4AYgkz6iBZeeI=;
 b=whhyfsH6NsNc6O3tabqSJrsjOz7xcjmEImufvBBlZjzpK/ImQ6IRJVRmJFDMr+LYrrSI9j0fRNnf/ZI4TbGIwmJ64Br+iOMJk9RhZwkS75dnDgmRqY+Y2yBLiEle7bHYmVtzRb+lFep3/uH0viU5K7sJyx5C94adOk5O8vs61ZG62uP3vguJCCSoo510wYdzib8Im3gJUxXC3d1+NY0C7pqfr+ExTLdFXSCkNaI3RcA1tEvWXZlOpsxHKo2ok5RfEIqd/rORVR+f5bXFsiok3sLwvoodz3VLaBih+ihosHJkz0qhtnzRz2Ow++RdXs2lREZ4k+9ts9ImvN6DeTBf1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=gmail.com;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vn5z752CuFFSB60FMJH5w+nNHkFDeM4AYgkz6iBZeeI=;
 b=Epb4z9/roiPC1JTXM4g8iqxohyjJOANhAdh/Z+wGmM3xg+98S/RJof9vNawAmGIvYJa3sxi4om+I3nHpyNVlmiwCLlONdkn2bUH707iGf4gUmwesKRKCrHYeD521gwOJasIOcxuX+oQpOodxx4qTgFput3PtVM+r/fTqV2G7nzEA8GTCcAUhx1TZpcyIbffZ7HHLID3bU92b+DAy58iCCloVzWQmOaI+KD4BL8to96rf3sUFPH1vOcEWIfK0UNksLtL6SDpeCUhAr96O+Ofu5xWhoeewR0tLvKD6B1b/zV3HP1XNG33QFqNIL480xXLHGzXcW2HTvw1ZfGGGPvS5Yw==
Received: from BN9PR03CA0047.namprd03.prod.outlook.com (2603:10b6:408:fb::22)
 by SA3PR12MB995558.namprd12.prod.outlook.com (2603:10b6:806:511::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 07:16:48 +0000
Received: from LV8PEPF00000069.namprd03.prod.outlook.com
 (2603:10b6:408:fb:cafe::7a) by BN9PR03CA0047.outlook.office365.com
 (2603:10b6:408:fb::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 07:16:48 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=gmail.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 165.204.84.17 as permitted sender)
Received: from satlexmb07.amd.com (165.204.84.17) by
 LV8PEPF00000069.mail.protection.outlook.com (10.167.248.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 07:16:48 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 02:16:45 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 21 Sep 2026 02:16:42 -0500
From: Colin Huang <u8813345@gmail.com>
Date: Mon, 21 Sep 2026 15:16:35 +0800
Subject: [PATCH v3 1/2] dt-bindings: hwmon: pmbus: isl68137: Add Renesas
 RAA229639 and RAA229640
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260921-add-raa229639-and-raa229640-v3-1-b104ee8a70b2@gmail.com>
References: <20260921-add-raa229639-and-raa229640-v3-0-b104ee8a70b2@gmail.com>
In-Reply-To: <20260921-add-raa229639-and-raa229640-v3-0-b104ee8a70b2@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Grant Peltier <grant.peltier.jg@renesas.com>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
	<colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789975000; l=959;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=ww+iVLSI0Yb1NFinPlx2QMQDxBfdiSa0R7Wr1afUDwU=;
 b=pNSYdUJk3sN2Xydk/61rVUB5gRnfaFEnrcbzd1cdcF4df8iNUXHqM3Bw/Cm12ORqlT3M4iEvq
 tFIkRGSklgMDr9y5LdFAGuWeI05V/l7+6VesUS4SWslnGHuCm3B1nNB
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF00000069:EE_|SA3PR12MB995558:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f1e3f7c-0249-4c45-2c90-08df17b04ce1
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35950700016|48200799018|61400799027|376014|7416014|82310400026|7093399015|4128699003|56012099006|11063799006|10067099003|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	FzkLlsZC2hjViqPwH0Go8SHwParyp7xNPEVrr0drEzwvXjdUp/EIeLLVyZKzFmIMY5bQP74JkVumDzHbAe38kqeqP4MwSF1J2iSkUPDQtkiFUuBJe3rnSqQbOu53BZL1Mk0OFtwoGnYHsK1uMK3t7rsasGQxcVMHjkwS6rsbrvrHHiQKe5ieeb8x/HGuYmpU4COmPRGG0WeEKorUsZdqMrDlgMUE6pt6eaIBXNfj8BiEY+keHln6pihVYkPvLphXvZvGd0P+ahU9Exv/jZ4zBaOkuJkjO5PhDQXTBluWwPjMVfmqwXCbjpTK+sSQMq1ciiVgUp7Eqf+nXaa1gO68HslDHNbX1KTGqjmSBCfbRtmz+gQ5KMaiJ05CaY/CGmob/aINOPb1Fe+aG+0BP2nsVxMtaxh9JovGwAoE1wizItZcyAeYf3obc6Xu30hwqg2jsLxAbZMJpWpE3XqFM+fjq2XJcXuOKIrLODVeW7cb1fohR8h1RB6lfmKquItwR01jQIPTd2V3N9GcMfbwthSGrO0CKsUZS8UjsnOtBl9PdrKFS8JhhjyUR3rP1AGXxzhCkoDKFyjrnADkt6zZCPtuwkuRPPInO5Pn89axgsEfIZ0mJFpQa+nE+Y6GusK2ovvsBGClySYRafeFBjYaZfhw7xUEq9qtquQobf1CsUd/of2DJRJYsLIlNorur5unInv7hQJAgq6kWKofOyG1yZ3OcA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35950700016)(48200799018)(61400799027)(376014)(7416014)(82310400026)(7093399015)(4128699003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sTZhHpbv/Hv8FY7Kd1IryGPd50EgMpAYtP2MXqRm3jKf4wERFslKfbW8NWavfD4NaM51NPwz/qS4Pt1F2hbMzbQmny3d9m6ugs2crr0uENefL9QSY7496FPoGgzjwCkmLn+QJ+jMvBQng32PPiQkoYyPNQNRizJSraqWXkjyFAa88P596kVQABWtEMJc8XHQMXaFQq4XenS5vP9gLrNtlimw1903foHv4WgbA1axjEyHi5ohXOtRAbTY3nV7us7vULkl1m4xobcQjhxs0z9O2PbNLi5IjlhfrILmJzMDPqOYDwmfDDZczNtI1dxxpd+95/wZbNPDA8qTl/JIdnLa0rWA5bUBcr1GXUeISMGrVoFe8uloIE7AsN+eMHjuUweIY37uRo3p/SDm97YVB6OesUAPJJCU0LJ7qjZMACvznWb3UzkU1LGP73mbOO+wMkYD
X-OriginatorOrg: amdcloud.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 07:16:48.1015
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f1e3f7c-0249-4c45-2c90-08df17b04ce1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF00000069.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB995558

Add Device Tree compatible strings for Renesas RAA229639 and
RAA229640 PMBus devices.

They are compatible with existing 2-rail non-TC controllers
and use renesas,raa228244 as fallback compatible

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
index 8216cdf758d8..a604b67b764d 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
@@ -65,6 +65,8 @@ properties:
           - enum:
               - renesas,raa228942
               - renesas,raa228943
+              - renesas,raa229639
+              - renesas,raa229640
           - const: renesas,raa228244
 
   reg:

-- 
2.34.1

