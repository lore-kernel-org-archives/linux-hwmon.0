Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011068.outbound.protection.outlook.com [52.101.70.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F06366565;
	Thu, 12 Mar 2026 14:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773325658; cv=fail; b=Ojv4d6SHt8RYPQ5Hp9/Rxy1J8uEg0gARpZlsbmuy1vCr+4jHKAYlhs+7/zxRnda6A7r3NRybGdFP3A/nn66/MHQIv+SypsmVFGGVigtpL/pSqz+2i+pah/EkWLE6qLjTQ6yd/0sJUYKnEWPswbxATazsZBstu5c0pWO0vwQRRng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773325658; c=relaxed/simple;
	bh=YOzWf3PXR0xvLiEN7GDxKJjoJu+Us1Xf6pJhCECx+OI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dE1TXWkYQ++WBrl+eBXff31OA6sfoTcZpylLK4B39Xg+JTPwd1NecUR0bbr6MGBdaI/hWLGtRjho0B0Q14TzL4VmpeTjXo3+dBtZGVSOFLAhvSfEDSSmE9M5rzCU+VJamVFvwZWBiD4AazzRo7i5Sp2bPc9ssIav+jFB1yJ/XwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mOzVIUCt; arc=fail smtp.client-ip=52.101.70.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mOzVIUCt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JfcrelIJU8nfQEXacvHV5O5yBFksLy5gkSxPjVIFoX1eZmMtrl45N3TJNr6Q4Kx2ZH5GuKHelYPqBCA0BA2w8qK44Qo//hlQjHRCOp5vQ13JiC3vl8uRXBeL188YV7Dykdm/yP8avdwBDlfQT9NgGm8n7WCBQn5/k5cIxxxPQd/vBManM/F9X+wOt5wqKdQjVZGP7j3rEsCX2Q42yn7ajGjgXWqv0iUkaMJQSdvePtm6PEsyRIKAbiBQKzigmwFzLy2Dee2aXsod8QJy1aUHc4VktOyDt4V3/GT4zK7UohDinQFYcivgw5SrGEruKya2btM8gTQGPPsB41N+dzXaxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWSdgW+wnKlyKMAhPxD8SdOyOpwC4w5O3NUQJUIZBSw=;
 b=KPqojyZKH8fFjYVBRvJmFWHjYCM36u39qxuL2IODmFWfra+a/mb7ADVJCtSXNA73t0actX1pgC8aB5bmEVmtusqPKmiEeFPxIdAoI/nIV0ciJriqGlLkCQqn44UH7JY6YVCRfwMIT8D5y+GC37bqr7JDJLdfNZzl/Uq+BEqqr5L6C/ps7cVpl/Y1rpVEf79OK9+TNOLJ1pP6qN+4B21ZJriSGhK5pmG21zRv5IEsNAvkLvyjW61F9D+81iayxrSXAL1/GhZlIpd84S25d6iQ5cxa8jc8RH8qsijNo2jmRWSqInoJr02UUXHrtf2UjZV6PXGRlr2c+vDYt4jwShXlOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWSdgW+wnKlyKMAhPxD8SdOyOpwC4w5O3NUQJUIZBSw=;
 b=mOzVIUCt+HV5W91lJDwK0CA35CFuWy/LL5gC8o+WfOOYP48RuWRStdXjvl4Hh++66AqH3Qj/vzHeWeWOrMjFNcMwSZdr89nb7EBsk827jkGyXFdmlcfdtQrihw95byiXdHJT31DmCmmVSj2QZgM6gY4d/2uZLBj3I6goEt3nE2ahs0Va4wvaYtYhGPJrYl/Y1I7N0/Kjy+8XDNzD7ppytHPvD0kGX92Nx8xRx/M9zChaO+mv+yj9tNUTjnGX1kxHOI3Ct3UAMFIhyrxdK3TDCB1oetO/N1ovFjyo5EBTR596iZDwDRnUw6f5TekhjbP0FpRHvYvdoeLS4LEOL/o8EQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by AM6PR04MB11268.eurprd04.prod.outlook.com (2603:10a6:20b:6d1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Thu, 12 Mar
 2026 14:27:33 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a%6]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 14:27:27 +0000
From: florin.leotescu@oss.nxp.com
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: daniel.baluta@nxp.com,
	viorel.suman@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	festevam@gmail.com,
	Florin Leotescu <florin.leotescu@nxp.com>
Subject: [RFC PATCH v3 1/2] dt-bindings: hwmon: emc2305: Add fan-shutdown-percent property
Date: Thu, 12 Mar 2026 16:43:24 +0200
Message-Id: <20260312144325.1311314-2-florin.leotescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260312144325.1311314-1-florin.leotescu@oss.nxp.com>
References: <20260312144325.1311314-1-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::13) To DU7PR04MB11163.eurprd04.prod.outlook.com
 (2603:10a6:10:5b3::14)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PR04MB11163:EE_|AM6PR04MB11268:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a928971-0899-417b-5ef5-08de80437c84
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|19092799006|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	YXB/QmTQyUS4d5FY0A3T0Nvrvx087UYxRdR5W1YJohfYZ65Jy6ZIwYV1wOq36XgE5OkSLvQM1BbsbrA/8+xGhZ4B/Zx9S8bGH0QpXhb72KSYQ6uMEhq90djh+t15bH6A7wfwioFQVCfb6ynN3zti0ib+cdkT9ic+8DfwTjVwZk2c5xFfd5HPfD/snZReRKKGF2OKS3J831oIXUiSNc/xm6sOu60ccIGonh2i115q6iUJzhmmaHxmoUnXieHY94ONPiPnBEQZ04f6In2e+6NNdvYF45C0j16vkM7/ujcyDTJEzTpLFLx5qTl7B/qxvyy6v44O0kbS49b/42Ky5e99GoNZmG3KEL5HT+/91kxHozEdF7u4vakqC5XcPkBNTs29RP7mNlm6T8/Yms1ZBTq+/5y7ZstA19irfB4xBMdCyMvBCW2RFOf7NAZJLhq9Rpvl9y5JmwTQhK7Nb1lJDZY/8TjUhRxTSpuQbcSBxhDmIxZBqHcPvDQXZyrNaNl5DNEflRx2MbLOdqnIeqRfvRBOIzuzfl0ZhNV3Tkj+R9xCxzbZyXAGnEglaU2vFdzVz8PViM6ylDXB+Sx5k+5pWOBqv3erDN6PYxEeR9aGgEpwi1rdosKegPaMHgRozxxKFAqLZSzOYah+TXbOalD+oHalDOZsYyGgK+otVcE5C1PT7GUfj/AIeYNNL7HbOEPmr37rgDoWwOVTDNNipEcfCqNVgPYoiOAfwvKW/uQWC2DQQdc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(19092799006)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?uF/Un4VSoNQ/ng8WMD2HTq5C2SFKO+CTVU9CwWWF1HpogOBIaCV20/W6qr?=
 =?iso-8859-1?Q?1YlrRhheoVVkoXBSJwKL/hb5ZK3+juQ7gwMwTH2Q1hzouI+pyj+Mivq/8N?=
 =?iso-8859-1?Q?TI4Cfji0DzV1O4a26eiJSFUWVd14mKiKFZYC3ZmxRHhGVHZ1V7WFvJog3+?=
 =?iso-8859-1?Q?wDDXnr1zyiEL0cov9RU/5sf+uhetxpN/0SVYDuLzOH/tI0cer/qFyH9x2A?=
 =?iso-8859-1?Q?xbVtEcRg3GWAbYhe5yBBcO3cLkVZiGxIkWHs+PDqXa2lww/3xLacriEIkA?=
 =?iso-8859-1?Q?qhjM5nv5JxX6Sm2DlWgQspsjvV9WEOPpT/FAQda6slPEHnku1ORN8nVQ8G?=
 =?iso-8859-1?Q?rg6tlH7PZiJ0OPWn9o6y9bkegTlar/hE15Hq4P821hRcsg5f6eXuLmSF4u?=
 =?iso-8859-1?Q?xvjtRsotCsF89+W2xYozUyvl30JVmtRvgY1QTBt3ZSjSLfkmQ6sqbaq4/I?=
 =?iso-8859-1?Q?0B+3dkyco2Kz7cdB/33ONstnbETfB3j4RlRFmGAwBSLL3kW0NJCVmoK+i9?=
 =?iso-8859-1?Q?8DpGc518eCiQNwgkfTX9xrkjgaqxbuBvvep5/RkZtgu4ysXQTcvS9XASSC?=
 =?iso-8859-1?Q?4TPn8XtBkqsVctJkMSTXrzuSkakm/HpXIprj38fH2QMT0WCh5dzNV1ugeI?=
 =?iso-8859-1?Q?bIIwuK8SZlGpm6iAzZx0l1bggsmP3e79lWZB9L02I61D92cng3APaSILvc?=
 =?iso-8859-1?Q?ots1/U8GxNWYHNuoN3ELx7a8JCEouj2uhP8kCMfWrx9lU5iWfYHO4JY7V7?=
 =?iso-8859-1?Q?fbGRfREF86Uv8qU/Iu5Zt4TTMiUeRAVZ0erz5+lpiSPHAZhU2AkouYPHxi?=
 =?iso-8859-1?Q?LKIonhyRWCgh6oGjtKMKj2xsoZV6FiUcWpZL1RNo9u/iPBrOS2vm4DXY87?=
 =?iso-8859-1?Q?K7j1UgUNFXjNuG0ECsOQH5qRHeN1Uk5Gla5f2yJCG3aXj2uq7xGNW7gK3z?=
 =?iso-8859-1?Q?MB8TyBwwauS8ujqzPj++xusgXVMHpZsspbaXPBvmosbLRtBXWtGY+MM/lb?=
 =?iso-8859-1?Q?GURnmnj5c0jw4fuZr9wzWZIDHroDE4fgnutq8fztjhH51UqLZMqtLy2TDs?=
 =?iso-8859-1?Q?t8pZu2VJh4XRNawoQVobRfYc6yHLV4XoIlQtbTM6Uvmg6+bLKi2WbxIY4T?=
 =?iso-8859-1?Q?R1KNVruAaCF8pK2cpgeCAqDqCOk2rEhcRh6ihGxYkyazZ1xkQorRM3QRyW?=
 =?iso-8859-1?Q?1uqXsIn0kgqS8ezIUUykb6s4xk5fBouGaAoyMllOMm4IUC2qlqJypABWL/?=
 =?iso-8859-1?Q?VEVEBRer7CY+1BWlXEBp9/kyzoH8SQyEgCOqbpo/+GEgBDzVk6nFdAB1ri?=
 =?iso-8859-1?Q?rAzKBiQ5U/YDXegfPEozL5g2KMx/TadfN8Tp3X/BWzpkzbjfWkfDR9EkaY?=
 =?iso-8859-1?Q?5qNViDplaQeDYSEqlEtaMYlHajx9y67NzqXS3X/JjqNsg2scl73mt4Gz2B?=
 =?iso-8859-1?Q?fYgpUburfJka0TVr2Tp80r+U3RPdBwmvxZVbQRS0hYGkpwvQ7wuo8DTqKP?=
 =?iso-8859-1?Q?q+o7CLhHAL3kL4oJyvj2wIN8o4INNfK1TWeu51XuNM8HxwdAL++Psxu5jP?=
 =?iso-8859-1?Q?uU/K22WkxUbaeaxGTJF6vuJsi5cJ8XjhE5urbTwBbmlNcaID4veM9Onp45?=
 =?iso-8859-1?Q?7DsSX04UByefjDT1IE8+o04kKdXjQ0N9kxsHH5E6M//k4j8J5Vfub6Mqbn?=
 =?iso-8859-1?Q?riGm5zqQaU/Symf6O12UECmAltqlYkmIyd8FXT82kkEf+p56qtpv1XWbCv?=
 =?iso-8859-1?Q?yV7wRt4IQUZmxW6bjvZMzOwSGZV4g9JR6emyUowOZSMrvh4/DyIipxXuVl?=
 =?iso-8859-1?Q?wJaetv7b6A=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a928971-0899-417b-5ef5-08de80437c84
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 14:27:27.5491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kRywfVaE//ZYr6g2v1QBJ1z6O8ml5RyO3/xqIFuLboXg2SNETMob4O4GvyLRX7PaRUJtQyeLe7wtdkrmdPslyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB11268

From: Florin Leotescu <florin.leotescu@nxp.com>

The EMC2305 fan controller supports multiple independent PWM fan
outputs. Some systems require fans to enter a defined safe state
during system shutdown or reboot handoff, until firmware or the next
boot stage reconfigures the controller.

Add an optional "fan-shutdown-percent" property to fan child nodes
allowing the shutdown fan speed to be configured per fan output.

Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
---
 .../devicetree/bindings/hwmon/microchip,emc2305.yaml      | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
index d3f06ebc19fa..7bcadfab9fc4 100644
--- a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
+++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
@@ -54,6 +54,12 @@ patternProperties:
           The fan number used to determine the associated PWM channel.
         maxItems: 1
 
+      fan-shutdown-percent:
+        description:
+          Fan RPM in percent set during shutdown.
+        minimum: 0
+        maximum: 100
+
     required:
       - reg
 
@@ -80,12 +86,14 @@ examples:
             fan@0 {
                 reg = <0x0>;
                 pwms = <&fan_controller 26000 PWM_POLARITY_INVERTED 1>;
+                fan-shutdown-percent = <100>;
                 #cooling-cells = <2>;
             };
 
             fan@1 {
                 reg = <0x1>;
                 pwms = <&fan_controller 26000 0 1>;
+                fan-shutdown-percent = <50>;
                 #cooling-cells = <2>;
             };
 
-- 
2.34.1

