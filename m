Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011043.outbound.protection.outlook.com [52.101.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4065D303A12;
	Tue, 17 Feb 2026 09:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771320215; cv=fail; b=dDOyZHPPrZI0nYHg4AfySYnAuLkqHpfyuHULY69j4dXQKoqLEAdQ2ctjI/A8+ya2GXlS+dUkL7mkGCMyHIRjl+LsmgTfNQM9EYyoWEfqA1XD4REclop+ERcWUqBe+cwOCDI724nNBojBFCDQ2HhYS9ouXJhKHhG9ax0CV1FL3bQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771320215; c=relaxed/simple;
	bh=/6Qv3U+vbPTJkpMH7H6TRGklzPdD+LlEvFXu8Okdaeo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JY4+E/IbK3yBteVqqmYCBsjp0Z8eGwgWSbP12rpSAS8JQyyhrjwfqZROswbGqf+Z9jNLpj7lSg4627igQuCgEy3VSG4m5Qzz7PCq/jKsdQ8xy1mH/qwtep/W3fywQJSTJjpNxh5TBZx4z4pZgL5FhdKlvJyXLITQgeA4OFlhQUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=gKX6Yuta; arc=fail smtp.client-ip=52.101.52.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="gKX6Yuta"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fCAP7pVUfm4lMx3wfCBpLe2pY7OCvbJOSg2P83/uGdeKjMzI9K2BjPNbeTda9j4K2Y+GTXx9DMX2j1AL9cRDKCuDzkiXux/gZp+trn+DKE6XPg9q66u7hrgAZy5af1xYLV6zf0HEcxClw2IBrsi1kAgFGMNpAANVHZgsQmvh2Im+1WFcjPiHlmsly5V/GJWPjE1lqK1D/k2J7XBHZb5+Idr7erGu7GomuOQO5ho8966s6XTKFsSacnEcZPnSlpU9HgWz6GnTgSlIgNVIMDLvujl1sQX4DZjXqVMedtN/6J7n+o6q4s4mSxoWXtndNrvi0pUZWmbQJDtoRFj9mYsB+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7EZ/4GSSmEE3IEjFwQrHecd263UsTOtYgXmFF/8ypM=;
 b=nlbLU81skx2XaTrJaKPXZK7+Hb6qK93bjMR9neX5BDKkEIDPeJ50lGcYlqIO05otKPpDAIry0PaOHF4uT4DkQgLecDbczdhf5eC4Ld03x89yK3w1RGCHrTWcUQNBLJlWeRpOa9zy3F6tTwXKH+6R2yAFnFvQDPaOkiWhNA2yIE4BJ4Rf+A87s74gmCgjsaAh6I973SijwMjhDrpgIND46NUETFYUz2Qjbgad0S8hF7ppbqPPUNfDAfVH98j9EE0PjJjCgrKv7t1E6pYCjJ8/4rrwHV3RXB5mxRMB/oQ4AyzLeDBR40PnCVVdS+qp4t5c0o1B/gbttMlcXvG7kUMOLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7EZ/4GSSmEE3IEjFwQrHecd263UsTOtYgXmFF/8ypM=;
 b=gKX6YutaizadKIUdVvJgj13Q0GGzXa3PVlo2YHB6A+HwBEbF1GicVrVlyV3tlmgteR59R9WLJGycuisqEU5rSeXv2eCTejSFH6pkiSUR+pKN6yGXduwvPktiFhayOJ6fGYkihCxWKKcjTVKWgfz6SpI9wViZ4Az2t1FjYQsBx/54kmGTO8vYfHx2e+yKHVcvgsGd/UaBskz8Uf7TlQt5LRHfjbbW0mDnINFbUbQaqDJMWtL9UaahRjC8l12lW1HB9dmqt4j31P5R494V0LO2d1/0c4NC/htkVjpn+0fuIZFW5IO6/g4cSH78ip/AOBYpUpJnUAdc3t3IaLhA+76a+Q==
Received: from SJ0PR13CA0019.namprd13.prod.outlook.com (2603:10b6:a03:2c0::24)
 by PH3PPFFE85138C4.namprd22.prod.outlook.com (2603:10b6:518:1::6db) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Tue, 17 Feb
 2026 09:23:31 +0000
Received: from SJ1PEPF00002314.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::8a) by SJ0PR13CA0019.outlook.office365.com
 (2603:10b6:a03:2c0::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 09:23:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay1.compute.ge-healthcare.net;
Received: from mkerelay1.compute.ge-healthcare.net (165.85.157.49) by
 SJ1PEPF00002314.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 09:23:30 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id EDA51E8F41;
	Tue, 17 Feb 2026 11:23:27 +0200 (EET)
From: Ian Ray <ian.ray@gehealthcare.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: hwmon: ti,ina2xx: Add INA234 device
Date: Tue, 17 Feb 2026 11:23:21 +0200
Message-ID: <20260217092325.15867-1-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002314:EE_|PH3PPFFE85138C4:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ae8dca8f-50be-4372-a383-08de6e06376a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UMtizHfPBRZycjCFsPaxSdhdCjAcKG89mxjNuCP+IzV46ZD86R+lV5znn5Te?=
 =?us-ascii?Q?vj3A/Y/HwkkZfSuVV/icw0FMpw7ZfcO71vMCmlgaW4NoaGxaj25xi3mZJC2K?=
 =?us-ascii?Q?LRa8sueXwM1wOXAaNK3RI3X7SM406KV3gXcnTY2qLxBv8cWYFFsqfb2WX/tW?=
 =?us-ascii?Q?+BITpFrHTnBv5P7A9ARNYIkqH15jcPS7TzVObe/7MHJNOqXv+edd+qlU8woA?=
 =?us-ascii?Q?J/xgI7ZXjlkFa/ZziX6dPsPaOlHiWaZmFOWroj1EycJAzc54105u9Px8ML/e?=
 =?us-ascii?Q?vicJIsXD1Fl+v+mF3ANqrH9S6Xr8hw9WL2YqKORj0kDlB66E5bXJoTHOTMA9?=
 =?us-ascii?Q?Hqpc0dxMbVEf1gjZGM/2jScUZAIch8K9JIdDGu7SBMrueRukq0kpKCmfZE0C?=
 =?us-ascii?Q?LR7XHTjWu//swj/0JXxZMrBT0qp5Rqb+Gxuwjnpc6o8xnurpYxBt3t8TPzPU?=
 =?us-ascii?Q?YqjyR+eiPKHkg8gXXBS3gwrDz6ZJ/b8kApz4wZ4i3ZtZeJK5K66ge1HvLr2+?=
 =?us-ascii?Q?FFXzmgQGQN93IdVeEFzVLTVUv4iU0zQaxj2B3jLngkjmz/dt301FSO3jw9t9?=
 =?us-ascii?Q?JjVJRYJ5LMf19mnSpMxY0TuXH/xJ1TkQshRNeAU8oT7nB2xbajRsLOawRaOU?=
 =?us-ascii?Q?A6yRQA12Gp+w1H09GOg+2tioB4vWRBYvyD72t+M6YEU3Sb4M5ryG8XJh2jFM?=
 =?us-ascii?Q?2vPagY0UhNVkbnJWmz3g5f4Gtz9bVcWkWd9EkRLKFqQrhZ2LdJySnuFUhR9j?=
 =?us-ascii?Q?EMRqYG6z3nNKkHRQYiC5agEYjmx+2OrRhPTzK320ThfTzcce+pk2e2N3WfYV?=
 =?us-ascii?Q?3QT90efUa4lW2JAIZK+CtnVfjd2kDcXCZqIQVS/3WnGk6dqJ2AFglhO726j6?=
 =?us-ascii?Q?kEBVZhHluDASQFY15euAMAR63c5LWvz/jCt7oV2DxTLrxeBFKzqP7Aklui9x?=
 =?us-ascii?Q?0bjYCQvYm7SiMkz+em3lFIp1zeCUaO4fiAiGVFptKukzniWtVQ5dsjnK5d1y?=
 =?us-ascii?Q?Xs++5H7mdfTcgatjKxKyDcbZZ5aNzwadQdP3dmJsuhWKl0Z95HaPA0UuAZjC?=
 =?us-ascii?Q?uewONWhZce89+1VHoCNkuSl7vZiwf6Me3YwHbknP+5NAtkjVST1OZW8zO2rV?=
 =?us-ascii?Q?ANIk0l6UrmkZcSwnfZrPQHTSHg/cwU2OTGOZbuhFtcHL/OAj0xK/iSIditiu?=
 =?us-ascii?Q?Il/E72n+K51F9q3AeHYvYgG+dV+P2wMFtye5oY6BqGctHSUrWOZ+xa6snxWO?=
 =?us-ascii?Q?j2iCGz7rG6A5dbIWYkX5wPeTK9bqjn/UJDt3tm38w9dLz+QSJpyekcaV3/8O?=
 =?us-ascii?Q?QC7ssCTmVvWKX0BeiJHgFBTEYbL2LHeOd6nSOwlBiLJNpFPLJCXYlXbWYpXO?=
 =?us-ascii?Q?LegxMz/8LB0VC0ChzNeM7El9q1n2MfB2MWiukRDw92lzL326UCK20CkuA4mE?=
 =?us-ascii?Q?Zq36kuKHuUX0mTyANSFb2jXodyj2oUaOlfMWQUwcLEiM4LF0clJz+VKwkPgY?=
 =?us-ascii?Q?Aqf00/Skq6ctwNhNkTgoiyAQZm84cIVSRzMGDHusdotnpkmPiKDh5WYtk0r1?=
 =?us-ascii?Q?LEA/bYRNzogbF67rvuO3K/J1q6JRVkSNSX+f6bI71PvQf7QH6HIpKM/P8VL4?=
 =?us-ascii?Q?NFZAeTRw6nVzg8Wl0FRI/NS9qbBYcHmKsx9CqEqHkHOyDFx1VhClJFdJD6x2?=
 =?us-ascii?Q?WddS3Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Fxe0CrIp2Jy/mzoxgWc3LZCcrZjPlDqMwasuUy6iuXYNITxW9vHy7hdlGgQHKOGWT85oVS4pRY6xehqc8gKiGL+Np+rvqhsB+oB3fLK/BK+HAbBdvhYS+GuYSkOKLzj+Ftqp6bIwusbbQd1mGIzncvXNxKUTbTPgN9hZFeVyhMw4xINLbtT03nPX4WYU30r6gJn2L4AyhWF819eqZu27pW11/dpexn7N/oQIk+MRrVuPfz1QYR5xJ0FhathBEmJ8Siu17mQb8uT+SE7aWB4nGUzQMqkrQ2GHeEv5J/BKcmEQBBGyJzI/91jSoKywW79vtBSPkYT006LQD1WfjXEYmDChCBKfTlElhc/WPqdZi/+Cx6yXQE0XoHWbf3CkFEX0mLG3gC7y1pNYpKzH3iF8AvahZmY31sHnVKzDMuQ6oZGD9OcymCv0J9kSNOkxbyuz
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 09:23:30.8005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae8dca8f-50be-4372-a383-08de6e06376a
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002314.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFFE85138C4

Add a compatible string for the INA234 device, which is like INA226 but
has different scaling.

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
 Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
index d3cde8936686..009d78b30859 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
@@ -29,6 +29,7 @@ properties:
       - ti,ina230
       - ti,ina231
       - ti,ina233
+      - ti,ina234
       - ti,ina237
       - ti,ina238
       - ti,ina260
@@ -113,6 +114,7 @@ allOf:
               - ti,ina228
               - ti,ina230
               - ti,ina231
+              - ti,ina234
               - ti,ina237
               - ti,ina238
               - ti,ina260
@@ -134,6 +136,7 @@ allOf:
               - ti,ina226
               - ti,ina230
               - ti,ina231
+              - ti,ina234
               - ti,ina260
               - ti,ina700
               - ti,ina780
-- 
2.49.0

