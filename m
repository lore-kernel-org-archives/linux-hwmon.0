Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011054.outbound.protection.outlook.com [52.101.52.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D3C3624DB;
	Fri, 19 Jun 2026 09:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781861955; cv=fail; b=Sc8d4E0tLuDtt95KMA/URz/fG/EtGcshUBKGn9HEBKzrinIQdOoNQIqjlbmzewHiF901Sio75FJushrdwRFj/P+6vqFlGlb+CGvDOWoHu8v34g6xT/f5FOADRMz6VKWxZywMInbn/6W6if3eGW1JYIFtXJv5ItJ603Alkg2qbE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781861955; c=relaxed/simple;
	bh=hk8zt57lUCs+FFFcRex0ETUcm81UXdPAHhUxwO01z9E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bxQE6op68+c4JE5Wn/8gGLcoy3hoL8ok/zE0gFegRdgKjR2j/vNXfwlfGknsdIRvLGEri165L9639p1miNDrH1gsMsrNbDJSlT4T4kt/OrDJJdTGYX/Xzc0gmAWNkmzvqNEX4LZ+q7yaxx6p1pwWtYwLhhXO6PGv13NaIt4ojhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=ruDjR0UR; arc=fail smtp.client-ip=52.101.52.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="ruDjR0UR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YZJ/5JYAMlaj3U/bp18XlEp1P94h02wz1oJI7RLM9Jkc47QA/kY9dBTuwdNbVAC3mzukp8qw72JgqXsdW1pL6Gqctj57kPRyZbWqVu+Bn0Zx6N5gJLdwu9G1tEh5/1czTw0Nn46/6HBtyAT+2TBrjn7IxzObKqeJelVVNSV7dpiI83wVMxKwbRhyNDTKtas89uxtR5PCgc1rjJF9hD3ykGpLoC7fLQ8hVl56Z76f7H5mVf+Vpl7vgERkuvME+S2CCaJQ9kzxoQ+XnclOERT0T18m/KBWjkgLGmsXfZ4koKgi9UZluwqa4Pdl21HwLyA7ndbOs2xqeM6/BagBUbtr0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qciAwPwXwdBvf4Wwj/vRw/98cVXPhcU+08EA9IcHlHc=;
 b=mUqenafLpHKYFfjJ4L3sB+BROub0ZvKPvdBHHyLvj45hxgI/t6G5hn71Zb/amlM5O5Jh3oe5R8KlZmE5SlbwvHm5R/L06LNqU7Trt4GP6T1EeI7dk4Fn1Ad6JnLIxzsyHzw5Zd3jcht06EI8Rca2VqCqyFd1kyQndC2unyXFwSDr9dgxWjDIlZ5p3Vrw4/3ZYjb7O380fb9xBjBDVIcMx7FC8+9fLxXPVn/PiPwu6QH7QI3nYJhDmwC5h+CGyJ0hBo+uraY5gP6e8g/qh/BcXGKR/BHsG7fAsNrDENL+Bvh2aF/ycp22iIw9bPYNojm5NB/TNiTjI0zv2uSZHenGpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qciAwPwXwdBvf4Wwj/vRw/98cVXPhcU+08EA9IcHlHc=;
 b=ruDjR0URYogbt+LzHAcNlVAztyUXCkD2M5Ehqf3F7oMu/Zt1vwDJpGs5VPYrnd80rTv7nuwaoXeMPFKNMxPETMZqPH7Y5Xx8CINdpgd5ph2UgGe4RAM8FLjGy3LW1viJh9zIY/k10LhzMpkK/44cZs4MsVsHNx4MbK/y5vCPWeBvRUXTtNrVjCgefwDwQWOLuF+mvvlg/4QM9XqEayyffARLSrVfWuoNZjFXNCrkEv4wDYEYBC8YbcSWCvcv+pVbwo3/vRMFPGIiFai2MLieO1NFkOlprFCeNk6bQwcF+VRTeuwZx6PJpqy0qDohqm1KFUVO2BCDncprRZBMR+SQ5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by LV3PR03MB7562.namprd03.prod.outlook.com (2603:10b6:408:28f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Fri, 19 Jun
 2026 09:39:02 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%4]) with mapi id 15.21.0139.009; Fri, 19 Jun 2026
 09:39:02 +0000
From: tze.yee.ng@altera.com
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dinh Nguyen <dinguyen@kernel.org>,
	Mahesh Rao <mahesh.rao@altera.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: socfpga: stratix10: add hwmon node
Date: Fri, 19 Jun 2026 02:38:56 -0700
Message-ID: <d62c4188cd936883bc14c95dcd27555ec94df7cf.1781861409.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1781861409.git.tze.yee.ng@altera.com>
References: <cover.1781861409.git.tze.yee.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0039.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::14) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|LV3PR03MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: 17c54349-7231-4439-e972-08decde69895
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|7416014|56012099006|55112099003|11063799006|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	AWc1lBjWEj5LpSnsrfYQ/80sB86BgOs33SKI9nNeLQm1bEsewElCQ3MDjIZ+9yOJXoEq9w22ht90k8NB8U0WFHScTSt3QRleVBXAAs1IkDZYhKcemyCQcH/StGXjAquxU6XKo2UFRSJQ//PRZlPLkYDuQdtaiKt0b/LjZRAMY7fSETaHacaBy3C8aLcdT0AgZdBK++Z6edroa/UBeqVK0+aRfFgih6TpfJE2wuX4nccUOnj3au1yINAf4sIjDzesJkPPxj144rmiDO1ZFLc0a6XXjjQ3T0T4vVSyVseioFZjtyufvvlHuS73XFBsYjSZ9jRcD+O+/R0H8dkE9ayDdkxagf0gFdIVOA/rVLmI9Xu1L5xIHUuJi73Kng6MTNPIpa3rDu/ygNoH0De6ZeK1W03NdbinWVkO/hvQvd9WH60wMQbvbjHJV0W8fOTlbDgWDmKa9rU6YfGsSIDT41W1QpxCV9tpPFibcyVunekc6pI6JluYpbog0x/7VujM3wyuKrXfLbq+X9o6ip3+2eyImgVa7x5qCYpYXpnN5ETh8odxSw5O5tb5uXGARIcE9OrwbjRsHN4ZNbcplKzaJC8Lu4eZy9u7vLxKJ3W5nuGKX3Emn7yZjCmdU0sjQh+AztA1z29BFWsYJlFj2tf0BuGCtru8U19WErj3SNkxJmYlAMIr4SbeVPgIvWtpTUVAdV/dbMfXUvrQxndA3cIeu38mGg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(7416014)(56012099006)(55112099003)(11063799006)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Gbfu4U0MsCiMAmTsAFced3VFXX75zIa0fSGtN7iRGp8cOkmsHioA8ZWI0vlR?=
 =?us-ascii?Q?1PXw+G3UZUPDsce0XJBVuJKhI2I20NqJ2hEn+ztourzYMclcdkk8S3RzjzMd?=
 =?us-ascii?Q?Ygn11LgYh9rhCI5+Nyzk0NQRtmmeCeL+BVCdytpDEJ1mVTcet81M671ELd68?=
 =?us-ascii?Q?ErX7Rjwq0ei2vYefCpGxjyYK10oMNWyWy8v4kROKSK3YhGXITpZampEsnIxL?=
 =?us-ascii?Q?UAlXDcQPCURJf8vty8yBoHL5LAgH6VuD2qM08NA6SMZOvT3hvn9g/iZI230J?=
 =?us-ascii?Q?zGTC2KwHtddXEAIvb+qt7A7LV/ydRFapK9saPhDzUtlOitdinKx9Qf29sj59?=
 =?us-ascii?Q?//VDuTMg81O/sNsDfdszPGgBWjxex2hE8By7jW2Es48d13HgKmZy/kPkY/o6?=
 =?us-ascii?Q?2A+QUEqCxMSPBPVWDYaQFLajbIs3aA3hHhBjPqGvRLRFk9jVMlaFpQD61x/2?=
 =?us-ascii?Q?RUa+lVBscKCxRKp7C2Uz6Aih6UzG0mapXKszo2JXbF5hpZv+pUhDqdc6XpXa?=
 =?us-ascii?Q?cw4qXUnww21l24jTHiMIyn0tYzJ3WjKlDsFTIfB4f8l05xKXxpSOypzw8vVe?=
 =?us-ascii?Q?KBgwknyJ/UsCW99nWcdJOAbemDmYWOG6E8bUD1S8+kVYBhaAf2q0VtyrVQXB?=
 =?us-ascii?Q?xs1LPSocoQHOolv5SXx+YUqKW5CZa9dnq27gwyNMeRNWxRANnDQsY+jwHPli?=
 =?us-ascii?Q?plRm1X/4Mvs2NBMrBBJ3xXyci83SzWSse+SbYC9JZBBUsR+FM54BsZr3qKtV?=
 =?us-ascii?Q?KWyaBUBBZA7dwvLRVYc+7VJ0g07weDbmRZlBC6jRrfUdVxFXks4QuDXbqvdt?=
 =?us-ascii?Q?n7bGkgTBH6qJKArl/37K9E1HPYec42tDmqKDRuHsBkGZjF3sIJJfEj9JYCpW?=
 =?us-ascii?Q?dG66Hf1PbZw9hgxPUorlxpxYsiamv4yRw/4kamMqe793DjEOHCis8cucR/Ij?=
 =?us-ascii?Q?7U/FNFf/to8COfP07Yca2BKvzcTk17Xw7ylsZVhYXCpZAvBocHBIeZcw/6aX?=
 =?us-ascii?Q?LOvfILV5TcZaqSgT4NhBIFG9P6oBK64tuFJFdXQTaP6f4b0sqK6vNB6RFTn9?=
 =?us-ascii?Q?9jtN8xJbGB4zXjg4vV3U/uomTiovCDGe++mg6/KYwFGA6GBtKUiBeDEqxyWV?=
 =?us-ascii?Q?shac2H3lYV2goqKYKxJMZxB9sy2cgEzNb57YyQeGqYe0CAh+ntokugeJOpgb?=
 =?us-ascii?Q?KMX/kF66MkNJwwiC1gSA3upBnYhYvZnYXZVC6nd1eLQndwXtdAhzV+Y1uYRS?=
 =?us-ascii?Q?A6XZ0xKeen3fdtfVC1jFv/QLVo/K5n5FVaLR2SvNuFhQAeMK/Qh+9VEp0ARH?=
 =?us-ascii?Q?cjFFmBvYpqmf7p4KqJAAAImwFOvU5E+P1j+s96hX0Zkq+mX1ohsmJwXo3GiX?=
 =?us-ascii?Q?MaDp7ZCEVoPEjR766dEiYjCC0aVAQ8+l7ZYiNu/tWt/7MArBnD1Kn3JhiTyc?=
 =?us-ascii?Q?MWe9J6rNSKXtqx6ilD2dlfeuhhjXjYtLytxzovUOQSW8wOVxDeJcpCjehOpc?=
 =?us-ascii?Q?arJ+zdsjUPYapU09GGmh/cWX33Y0B9s2LoLS9x2vqJyjlJrYFZxuxoP7NNNO?=
 =?us-ascii?Q?AzrQqg4Xw8oJYvJXEvKq/qalOqg7GUsxuoJDYWT4DtsXKBmBGf27f0Y26BZU?=
 =?us-ascii?Q?JoHjnVXCZtG1n7a8eFPcJuSa9wQOSe26PjcrEjNVo4xEjruodSj/NgrjXLYE?=
 =?us-ascii?Q?kXXJV6Z7SuGPbKJS3sZTqbfSsZZUdmWW4aCfTwduSrtxuN4htnMDpFA2dub4?=
 =?us-ascii?Q?dLpKqZ4Bzw=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17c54349-7231-4439-e972-08decde69895
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 09:39:02.0656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 66MHYiLTCr9HtR59wCXt8yctwdyFbQ7OpEyHU9CZJYFUgSyX7bbIwYcpND67mXy+yyZpN8VL9RDbXZxbQtatAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7562

From: Tze Yee Ng <tze.yee.ng@altera.com>

Add an hwmon child node under the Stratix 10 service layer and describe
the SoCDK voltage and temperature sensors using the altr,stratix10-hwmon
compatible.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
 .../boot/dts/altera/socfpga_stratix10.dtsi    |  5 +++
 .../dts/altera/socfpga_stratix10_socdk.dts    | 33 +++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
index 0d9cad0c0351..afb11e6f6813 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
@@ -78,6 +78,11 @@ svc {
 			fpga_mgr: fpga-mgr {
 				compatible = "intel,stratix10-soc-fpga-mgr";
 			};
+
+			temp_volt: hwmon {
+				compatible = "altr,stratix10-hwmon";
+				status = "disabled";
+			};
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
index e2a1cea7f3da..01a8ffe430ed 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
@@ -134,3 +134,36 @@ root: partition@4200000 {
 		};
 	};
 };
+
+&temp_volt {
+	status = "okay";
+
+	voltage {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		input@2 {
+			label = "0.8V VCC";
+			reg = <2>;
+		};
+
+		input@3 {
+			label = "1.8V VCCIO_SDM";
+			reg = <3>;
+		};
+
+		input@6 {
+			label = "0.9V VCCERAM";
+			reg = <6>;
+		};
+	};
+
+	temperature {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		input@0 {
+			label = "Main Die SDM";
+			reg = <0x0>;
+		};
+	};
+};
-- 
2.43.7

