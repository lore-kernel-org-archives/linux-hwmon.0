Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010053.outbound.protection.outlook.com [52.101.84.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401B947CA64;
	Tue,  1 Sep 2026 22:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788301382; cv=fail; b=kodPLcL0cwgFuokj2l8m9jYBrZ0h6ji5IQdikz9uHUdFl5a25bcju9XRrGgclz9jxiHTfIaJG+a9Pye5m3dk7p1LdQo007k2ReT3O9ankkHr6faE4eUnYcmPgkaI8gT2f8EjUdcuYOQztj3QxJkJYba5TutnKUvK4Sr5Yq7aUAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788301382; c=relaxed/simple;
	bh=fPLOciu8p3yJDm3DBJXtWHJB1sJXwlkQ9ojw8QI0C68=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=JwvQTYzL+VuKDIPtQvWS1fq5vsYaPakdSN1Sxy9EhSRVxtkQdTSrkGsPPtfor28yAoUZhgH1hGKh9CDCejfc+ugeYqn+tIYzY9S5pkLV40NR7m8oefWb1YseS2OY/jK3TCAFI9q3nuqJJzI2EGMrlVYu3MrhmKw5Gj5AxBue2fY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fTdz1jwz; arc=fail smtp.client-ip=52.101.84.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fTdz1jwz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d8FMoyOnC97P09My+1zhHQ7bPrRFlCb1f94kKKj+Hy/RphrdOdc0oDNNxCWo/JQhXBgdl0A7mye4hO5MOX569hyN6yuJ5DJ6kOwEQVT+qLwwx2S9s3EMoFLSxwo8cJ0F+oVnnY3Ya5CrLijRo2Hqh3T/JZCh7pTM76I7/rboJYj373BZrp5ep8teZlcpW21WodeLC0iX9vMA/ZqGTapChO0PuvmXg2H03z94ofg5UQNXYo21ADdvN3jmKdPhuNRahaM4bYd9yg2yy0pyzSNy6ZLTIxh8d795m+JT0lEcon5X4fra1BZF7qG2z04RTsUYuRPnki5n1QYYGb9kmLY1hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3mN4Xz/lzwTV09s78ADviQUpG3ZPSqUiMDVWPb1dJ/M=;
 b=inplQ29D+KwGTR3JzEx2P9H97WiVDTZcH6MFd1lZRUxTnLJ6XjoNSrj8ZTIqBadHpXRQQGJ+1b9g79YC+hStLlJZI2km8WD4jdwFmbYEhiuZMyY8pPR9SwLejsdbdltF8nLpg3hSScyjlzhoL1Ub27TLx7lkV2CS6vlOi9ierauHh4CX11Sj0sMLfgX56YWq4O9qcp7CzP6RjklofYB/2otheIllWc8go3THODpzsuZA9Mz6D0nNM5XiGmLdRHOgqNZLpwt8QJuQ1I3qLTZMDof2029uYtmq+mlnTXsGUgnY6ePBNM8mIhtjhP1AvgE2RNNySoytjFeH+yOQXdjbQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3mN4Xz/lzwTV09s78ADviQUpG3ZPSqUiMDVWPb1dJ/M=;
 b=fTdz1jwzCm7itXP8oqgcgLqPJQ+rwaPyCAxbathwM+5ShPDZpT8etP8fT3KlZ+ZBL40YhseI4KMmlIqKrAFWvRL8sWSv+r+SYdto8rujnPqKX1/41l16mfNSjpvoKH8L98TwRNcWqP5Gr2n/V+c3wYMnDJbl1C1myE9NWWY2KFPith4bvxSzF0bEGnVb0wy/LNW2SSZ3eDbuZcvx+YFu+KggqCGd3yk43dzLMMGkgrTyhg1FXICbUdt1GXvzb6HTyWPwOgO1ZH8GwQq0w5656O06vLVqVbQN8nDy3L2k5CU+wQ8e0tPuxRtCf2uDikBzsLELjryTb1LU7UQw0Ab2gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by BR0PR04MB591767.eurprd04.prod.outlook.com (2603:10a6:2c8:33::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 22:22:58 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 22:22:58 +0000
From: Frank.Li@oss.nxp.com
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 1/1] dt-bindings: hwmon: tmp102: move ti,tmp103 to enum from items
Date: Tue,  1 Sep 2026 18:22:48 -0400
Message-ID: <20260901222249.1194299-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR15CA0196.namprd15.prod.outlook.com
 (2603:10b6:930:82::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|BR0PR04MB591767:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f22f814-fb10-4f11-5df3-08df0877937b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|19092799006|366016|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	0QWljwpQlPvHlqaM5MDDuH0AehbrzLVr7J+zbxyR9bO+GBDDqYu8bngGqyKqyYFU4XuJuJggUzMQy3GHhlbLyxovJYheca7GQQsTq+i9mRMJYW0FrkrTPYvWp9wAuH7v4NQnXu8aS7sG5vgWmL9FtmpsV0PcMx+iuPdXr50yNsZZ7EkwDoQeMNSduW5WEW40J5nYLm2WuxvaMrK+PKF+VSWYvh6drBqVJ6vv7MVOtnhpmvd2ASIlZVveTYTPXRLBYY65Icb4FH5vnuHRl84eTdru4ZnObSZ1jGruYhqoWpEIFYj4spoyRsua+GgcVJo31ZrhLAUAeI1Sqk8sdPneeP93fkjgUp7SigMPKqZPHuX1Y+UsZEKDmsfk3gAaO0jKQIYRkIaSTyFgLmq8M3Tk3uk3RwqBzRL+fiq7b6vS5yMEJ4/ORh8S08ZEC8Fa/XXeItRV9m+Vsy41u/g5peIQX4DBr4odK4H7pyrBjqh9IyQFmkptewupW0SO4+GO+AyOXwCqspU4VjOX2SJEVdsvd/dqwAAeSW4BUOQujmsPADW6SJkekzovQPCvyNSqUYvCJfvsFGCyzG6MTdZhbblDRL7B3YMIkLaGH1q4ZOftL8wi4Gl3MMnd2UfWxWOpfidxj4ShsYyc3gBoWg09W0658V1QS4egr/bFfl/G0O3Uhak=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(19092799006)(366016)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Tg4O9I1bmV2qgIuLRRU95nefjD42TXCV806hx74Jrh5urS7SvvbfDlk/h4VF?=
 =?us-ascii?Q?GiNEqvJBoL3W9OH88LPjDQdYNu/UrLqY1+ORBlrel1bx0VDnOQoGUuymu1yF?=
 =?us-ascii?Q?vrz2ciAWde4vv+Cq12OynIqTbz3lelP0k8yoeaJIPI4twIpMMrc5BWquKUdO?=
 =?us-ascii?Q?uA6VR/746ecqrXxLSQQWVwddWKNMTWKq34U1h7+92fJ0YzpHrNlA9NocCcWH?=
 =?us-ascii?Q?fk+l14FUs0MgL6OlNoOFZpmMhwuBppI6sBgtHDry8buK6ZVosH8DIH+PGqs3?=
 =?us-ascii?Q?xkcHmpJ+yJKc4X2CIQ+kQ6icwFlc3Ny/8oJdlCQKDw2GQZYT/JRcMPDvjn6U?=
 =?us-ascii?Q?NhuvblxAUbqqQLjJA0dZs/nxEsk0p55m1P6A0uT5qpLwaYFIavV2POwm9yuu?=
 =?us-ascii?Q?iwRcreQWf+li0J7y+NRLNv4WKZyLE+LhSXQdKV0rpG+/Zd0h2lc2dd3DDXMC?=
 =?us-ascii?Q?sxP+xPyBd6+oC2emmyonkx64zLEhpUsqM1ByCIRjPb7ewT+qGTP89DP4gyV1?=
 =?us-ascii?Q?ORNEmvONvic66BCI+iR2lgYbcAG6LWQjgUkp3g2lMBpRXziLe1nD/ru6hRMG?=
 =?us-ascii?Q?75dW5c/mhOE9og90I1jmkomVWq1/MjetOP9YaRsi4Sb93n0MDcAALPU0Mmik?=
 =?us-ascii?Q?Umktnmv4IdPsh8Wd9uhN0nsURun/mMzGLbBePEup85CcnquP88u1ythVTjUF?=
 =?us-ascii?Q?sK8nbcuoSQMi3oSqCBAJ/Z5ntu4LsIDgDBIQwlLXpetsAR9tksJZyl/FwPVo?=
 =?us-ascii?Q?vXMt2RKxNoP94iqQPRp9XF222sIeMeaJJcxyMvkxAxogvLhWZMI+fg8IyMIm?=
 =?us-ascii?Q?k1JK68jKqObcBnqhYSSAFYVr2JPeUD+pjpBXwHDeEeKHk40GofmCQN9gvRr0?=
 =?us-ascii?Q?Ek/C6hRwJGaGQIX2nEX3VG9EKicJRjCYMWOdiGHHD+WrwOlh0eEg6r1mN7BQ?=
 =?us-ascii?Q?C+Qu9FJBBDbm34G8dveSQZtLFnlb3IDP4woxI1J1LY4F+QmBSJgP7iGUx6Qy?=
 =?us-ascii?Q?tqMVvRQ47PUjtLrMnNZiIkpRbiHRv81HstgUWxqTiZz0ruui/wJ/7LXMsgqe?=
 =?us-ascii?Q?P2l8HPLrMtjhQZIkueEAjL8hI8N6qJY1W52OnusoRvUl7rQXhlsbW3klHid3?=
 =?us-ascii?Q?czhfoJDfNbmFrUzzRJG9LxG2oqQ75Lde5d3rbK4jCx2RZK+Hmpe7l06ZTBby?=
 =?us-ascii?Q?gtA1G9mOZcuddsLMqIM5o2k8Rx0hhmOWlkudgCHe6eB8ei96sqXGIYT6TdJf?=
 =?us-ascii?Q?HkZITncCMcPtrwIxXK1T0HBTYOFRzdvlNwrt6/S5nfep3OXvnLK+BAafrzAJ?=
 =?us-ascii?Q?aedd/NBpQSQrX4f2Rh1X0RV3n/ANYf0L8+gwAlc2HMoXKs4TPNAXTCB8eU7u?=
 =?us-ascii?Q?GUN6LvvjHxbR+Tlu68moziW89seWDVW/WImbtK/pWINSs78BCYakFS7rXCoW?=
 =?us-ascii?Q?AJLGcItS9J3YqsbdViSG+VthOeCw4ZZgAtV5nbIP5eVyrHZDnKSg+0Rr5uob?=
 =?us-ascii?Q?nF5c/nt77TTHso0mCBWfjHhKU99Q6Pmt9fi2Ydpetg9/TBI6O3OujAjv0UEp?=
 =?us-ascii?Q?bR1yyi06uXpixEaAjQRcI2mm0iUnUsMqKhUPV1h2qLcxgCLJG2hyAYhUu3WW?=
 =?us-ascii?Q?fIqeLnxPoI1eJxbbq+hMh54aLRbEBFyr8BgW1PjTZUbsd9R+bUKQ5OdmNOc1?=
 =?us-ascii?Q?kDze1BmQfOIj2Xz4tEhODPNoBySYJoy61vzMnpTg/JZ5BUAoQQH4k11lgkMR?=
 =?us-ascii?Q?q6rsnLdkSrrVQ6By9jX7DK2Dxd9P9FrykEt17k+lxm4rwN4BhHO0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f22f814-fb10-4f11-5df3-08df0877937b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 22:22:57.9800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H+U4J0csSUuvO2LYXlqSualNXioqnpzhYNC7+5/FO1g+kub/SywKPHHNBq0xq+MwKDsq1KKv3qQx17O+QiQj/Dh28XurS4furpUb9wyTT6Aoc1E2VOEcu+GRxNEoKYOd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB591767

From: Frank Li <Frank.Li@nxp.com>

Fix patch merge error. ti,tmp103 should be after ti,tmp102 in enum, instead
of in items.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
original patch is correct
https://lore.kernel.org/imx/20260826211422.3299728-1-Frank.Li@oss.nxp.com/
---
 Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml
index 55d9f106465d7..431e308e352c1 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml
@@ -14,10 +14,10 @@ properties:
     oneOf:
       - items:
           - const: ti,tmp102
-          - const: ti,tmp103
           - const: ti,tmp110
       - enum:
           - ti,tmp102
+          - ti,tmp103
 
   interrupts:
     maxItems: 1
-- 
2.43.0

