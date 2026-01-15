Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012017.outbound.protection.outlook.com [52.101.66.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CC4325492;
	Thu, 15 Jan 2026 07:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768460503; cv=fail; b=fcTD4KovOtLQOZOyTIYKU9rC9JmU2Vz20eGjNwTXKuYo9ZcjheT0ejb5HvbTSzHRiFLqPU7nHl/WUli+vd2p49JAE22pEYXd/O8lOeTRPdZydAod2COVdyLTDRFQgrgH8LBvg3w/lbAu7tZh0ZB+AMIJ+Ssc/du3YMDZdVNs+E0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768460503; c=relaxed/simple;
	bh=5pNXsy8+TDghoRWapq0wTyZeWtYMrVHFIJ2YQ3lPwLQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=I4IpTHVBiaislYGsHp4p9Aguv6L7HRZBuMMsflFNJCjz2uQXvDHzhDKFWTuo9+3gVuUZ+jN7O+sfFgljSMBdrXIrGolrTJMbb2yLbM5yufMSNITikb51jmPiG1yOEykwbXm5kC5YE+z1Tng8Z26JCBpbBgqcf/UaK2a6z5YfcXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bonTs47o; arc=fail smtp.client-ip=52.101.66.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bonTs47o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FeVOU+GXqjWT3TNHRWTV5P28jtkGp/UX63DHWS46CYZidtYX5CzK2fzBvioof+lKZ1Cx21a9tN8KRhREvUQCg0yOWukNdsqHN+J0aa0clGta0TRQLiTRUvsEFQV7c3fbNauWAyQUvSCjGKIl+3XFDmLeX7FUNetjzMfG+DJE8nN0Ta9SC38VMR56iN3GTdJ1JWbfeNdYGCVToDmHK/xglzzNSb4j8IElJZry0GQk4drRgkwpUUcGb1fMBQuPYZAPyGEZm6GYkZyk/v6or7Dv6cp2ygv33HKXAwApUaFPqcNyUHpu/9Y750C6qeWhZoecpE08yJvWWaBq7XVbWuOVaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5pNXsy8+TDghoRWapq0wTyZeWtYMrVHFIJ2YQ3lPwLQ=;
 b=KZzLyQ/oxzG6BxHtV1lzjuOuI6BeimQ7cc6s/07st4u/muPVhrdPqTFxUET2sAn2/DOP1NVA5tsAUwplARDHz2iCteXGIjxVqtakLCs/phfkeXD1+szTEyasJ1Rh7Oe/XmJYDsVaPLGmAk/nYVOQ3csAZxWlHhOWpMQ8YIb7oxYxQ+k77koKr2dR8eNzxXJlBRi5akTH/Ema4VMmpMT+oS9R0EhY0d7nEtK23DQgLkS4DDXpPtWBPhiqwJYmfOuUJeC9yCuboJ970TOaR1UQsAQ5OH6xpf4bdFfhJmF8OqTDtH+gpEIS2fqfzJFLEv60gWO1cBX9jLyxeDx5v3Rcog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5pNXsy8+TDghoRWapq0wTyZeWtYMrVHFIJ2YQ3lPwLQ=;
 b=bonTs47oDfEozwEpc247imIEv5I/XV0ve37kO//VjROj2AHavEjLI2+kFgI4rtJNr4S2vRaDfnhretDuDCuk2wE0VBB21GXurIMdQazijtQL0bRkX+rYXG7STAngeaxL7ikOMnBZOvAdE1+pR4MVsE457gjni/4lj/HYMoRvRJhou63PQJXV/56rP5t8Mq/RCd04zh5tZh9T7Qv3Rhld/hbUqCEGH7BGNyr+GpPsEJovHcwWsFZqDGy2TpIfgbHRvseHJfJ2l+9uwUDiZ/r3GkRxx0AFvPRiV2of0sL/hJ1I5TvhGcl2okYqWKzOXPB9jk6PzpGv6fCDsRrUFrI6nQ==
Received: from GV4PR04MB11732.eurprd04.prod.outlook.com
 (2603:10a6:150:2d7::21) by DU4PR04MB11814.eurprd04.prod.outlook.com
 (2603:10a6:10:615::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 15 Jan
 2026 07:01:39 +0000
Received: from GV4PR04MB11732.eurprd04.prod.outlook.com
 ([fe80::c950:7488:2aa6:1c13]) by GV4PR04MB11732.eurprd04.prod.outlook.com
 ([fe80::c950:7488:2aa6:1c13%4]) with mapi id 15.20.9499.005; Thu, 15 Jan 2026
 07:01:39 +0000
From: Mayank Mahajan <mayankmahajan.x@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Priyanka Jain <priyanka.jain@nxp.com>, Vikash
 Bansal <vikash.bansal@nxp.com>
Subject: RE: [EXT] Re: [PATCH 2/3] dt-bindings: hwmon: ti,tmp108: Add
 P3T1035,P3T2030
Thread-Topic: [EXT] Re: [PATCH 2/3] dt-bindings: hwmon: ti,tmp108: Add
 P3T1035,P3T2030
Thread-Index: AQHchGnzXUV0gVWI/ka2k1gg7uD4a7VRZIIAgAFrlPA=
Date: Thu, 15 Jan 2026 07:01:38 +0000
Message-ID:
 <GV4PR04MB117326F71A272C5DE57AC4139F48CA@GV4PR04MB11732.eurprd04.prod.outlook.com>
References: <20260113085224.1176-1-mayankmahajan.x@nxp.com>
 <20260114-hot-khaki-chicken-1dddda@quoll>
In-Reply-To: <20260114-hot-khaki-chicken-1dddda@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV4PR04MB11732:EE_|DU4PR04MB11814:EE_
x-ms-office365-filtering-correlation-id: 37718e1a-299b-4cc6-1d85-08de5403ee28
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZWpUaWFpSE84TU40emhrdGVpWVdFb2FDdStRWTBhK2NrOTQwaWZBUTZIL3hj?=
 =?utf-8?B?WGRkQWJoSytZb0o1azBhbkVIaUp6QUdxUVQ4bVE2Nk94WmFqMkIxK2lHZmo0?=
 =?utf-8?B?SFRiZE95VVJXYmZPaFhEMVZJQkk3NTc3cURNWnZhaktkaFRVK1ZEWmRlQWo1?=
 =?utf-8?B?ZlhyckpDOURCYSt1UVVPTmVuMit2c0J6U1dyMWlHY1c1WmJvcGZocDdGUy9V?=
 =?utf-8?B?M1dJcXVHS01DYWQ3YnVUeE04ZDNCa1hsS3I2VXVnaWZHV1ZZZTZObDBia3JY?=
 =?utf-8?B?Z0FxNERmb1QrOXdWL3MxRVAwOVFWbURuU3VaMklCZHNCRTYrbVpTM3NtV0ZE?=
 =?utf-8?B?WjVMcmZnc3EzSUR0UUpoYmhaa2dJTC9jb3UrL3lKVTMwdHlNU056cDF0SGNp?=
 =?utf-8?B?K3YwdUgyWldJWExSWmtJdHdlTCtvTDlYcmtlVWVpTEtjNGY0WHhvdVJOM1Nk?=
 =?utf-8?B?VFQveWxnbjZnV1VUdDV5ckVacDBtTkhMeGJaM2FaanJHWmZzRlB1UW5sbW1a?=
 =?utf-8?B?UVBUcytzY0ZHQ2QxR0VLT2N0NlF2bkN0SkQrcWhPZW5GZjlUNGxvdkdUN2NQ?=
 =?utf-8?B?UXkyZXlUSHVSa1I4MzgzQklMSVFmTVg4QS80TTEvNHBVckNFVmREaGJKK09m?=
 =?utf-8?B?T0R3UXRBLzB0VHFSREZwdDZHMlF1M1NuaThsY1IrUUk2RWdhOHd0QW1jWTdl?=
 =?utf-8?B?U29ub2JzUkk4bkZCSms3TUYrbVFDcFRUeVl3cXUybmVvRXRRSXdFcHJ2QlUw?=
 =?utf-8?B?em5mY21qdUQ0WWRXaGJTN0Q1U1ZqYzJ2U0haS0Y0c2gzaVJRL0dGY2JjZTcw?=
 =?utf-8?B?MFI3OGowTzBNUzYzSmt6MzI1OElja0M5d3lnRkk5OU93RTROeS9WUzlBVzUv?=
 =?utf-8?B?QmVyNEVOdUpHWG9hRGEvRmcyVW9tUzlCelZLcXlLaFB1bklFSTR1ZlZsQzhV?=
 =?utf-8?B?cHZyVVdJUlVLMEVMRmNFZm5JRzJxbk8vNE1yRDVCMjcwZ0JMaU03UHlMYm8r?=
 =?utf-8?B?SkdaQ2tpdnZDOWtMWFBIbFNmdWZ1M1NXNUZHNU5HUTN4UHNRd3dnZG40dHRZ?=
 =?utf-8?B?V1FCL0pjcnJuMUNYa3ZiUUk3RzZOdkd6YzZHQ1J5TllyQ3BHU0pIMURxaTJ3?=
 =?utf-8?B?QWpJYVF3QkxzMFM0RTBiWjZ1cDFoZlh3aGhsTHZJMmZZQkN2eVdsMVN6VElJ?=
 =?utf-8?B?bEM4RnpZU2ZWcmNiRnlsQ2VhWDUwakFJaE8xb0c3RzNiQXZQekVwaHMzUVg1?=
 =?utf-8?B?SzZEWGVTVUNDOVhJMVNTaDhUZXBhU3Ywbm5VTkRtQWtTMnlFaWlkYWNncU5P?=
 =?utf-8?B?R2lkRWNZaDZsd0RMWjNIT1hMTmNBd3krTHBPZWxjWDVSVEFoTGlrNnlpeXpw?=
 =?utf-8?B?eDBwZEhhMVloV0Zqc2h0aE1nS29rRGNQNXNmTzFzNlNQR1RSaTZydHhuSTlE?=
 =?utf-8?B?cjgxNkNuK3NPcXV4MUFJYjJYWlVYeTZRNmtCbWVLWFZzbXJReDBNYU93c24w?=
 =?utf-8?B?c09oRmVOZUVlSGVCQ00xd0RKNU5SUGxBanU4am1FUnpKa0NnZXZCVDFXZyt6?=
 =?utf-8?B?SHBxWmx0Nm1wWXVuZEMzS09TcDIvMXBUV0VBVFdlMmQrNTRtalhCMmJlM1hJ?=
 =?utf-8?B?WmhQWW1PdDVuNkJxMGNHekxQS3FaeWc4NTRmd2gwMmREaWFsT1FvWWdHM2VF?=
 =?utf-8?B?VndkMStmaFdQL0loWU5FcnZ4YWxiM1VwL216TUxEa2hXWFNPY3MrZWRlOHRq?=
 =?utf-8?B?SHBJTG54WlFHbllCTWJWeGd6dUg1VTd2TU9NTGhwOGJhbGZ6MXdJYkVidDVq?=
 =?utf-8?B?aU4zYjRCb00rZ1hNdkx0YVBRbDcrd2NUeVFSdVNoTGk1dEpIWFhqQW5teldO?=
 =?utf-8?B?WTdZcjJhVmU0T0NLcXZLUUpuU1hsK2VkWmJhdS9uWUJaZXFNOE96bld4L3R5?=
 =?utf-8?B?QytlMUd4anlzYWlLUW1uTlVNakJ6OWNiMnlqMUY1bXBuVnRINEc0S1JUQ3Mx?=
 =?utf-8?B?NWdpQ293MXc3RVVrSndEbloxRkcwVnlURyt2azUxOGE1endOZ3p0VDErZ01r?=
 =?utf-8?B?R1M5VWxsUjgwb1A1ODR2UHBoVG1KTVdYbnJGNlNQR3FTTVVWYTVzbU90Slo1?=
 =?utf-8?B?UDVUQWMxUTJaVzEvai96YjQ4WEtmL0daS0NGcXFFZjczdzM1c3Bsc0RRMFpO?=
 =?utf-8?Q?EydvCJhDhjeyh8nQiOhfF9I=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV4PR04MB11732.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Ykw5YlNIRVpWNHZzRHIrVnE1aDlScXoxMDNZcVd0R1Rybm9xRFlwbU1MbVJ6?=
 =?utf-8?B?ZlR1aWRtb3B2cHFpUFVmbzdDdHVnQzVKY2IwbVF0N041eVFhWmdDZzcrTnFw?=
 =?utf-8?B?K09DZUtGVGZGd3NpUTlJMTN1Q3JBNmcvSUVnR3dZa0RJMXhCY3FSTVNEOG94?=
 =?utf-8?B?T2hiSUs4QVNZa3lrcG5ac3JlVlJzR2NqaU5pczdIVDc3MDBpMFZOTDUxMUtw?=
 =?utf-8?B?aUtjMGltcDlPekplWW9oclFybTJDMDdyWlliUEZUSGxpQ2hkZjBmU0ZSM2li?=
 =?utf-8?B?Vi9VMlJhdkhpY1VJR2pDYmJ2dSt1cTlaRi9sSlR4OGUyOWQ4V1lMYW1oSnNH?=
 =?utf-8?B?VnRsRFZoU3lRSlNLd21VeWFRVldNNGdQV3BaVjRXR3EwR0o0QjRJald0VFJy?=
 =?utf-8?B?NXpnZ0dIajUydUJFZDBpQmZ2UmRyNGI2OU9YeGtHNnBySlVWSXk4aS93d3Vp?=
 =?utf-8?B?REJVeERCVldza0tzYnlZODdKS1FpZGk0SmVqQjk4TU1NM2N4RjhlNGlvUmgw?=
 =?utf-8?B?UG9UTjVmQ3JNRlE5V1VkdEoybHh4YVB5YUxZRmVTd1Z5VEV2UWVtTitVa2NQ?=
 =?utf-8?B?STZQejZHVUdkUXhZZDNkNUkwYnJJWTJRdWprTllNREhqekVJSjFZdWFQelk0?=
 =?utf-8?B?ZC96SE90dEYyYUUyZzM2eEdlWVJ1SlRndHZ2OGNOdTN3QnBGOC9QK1UrYkFO?=
 =?utf-8?B?ME5uc2piTXJMcFoxUnlCaFdnOHdQQng1cHI2NmNHMEpCeGJsZFhiYmUzeDN5?=
 =?utf-8?B?L0ZHdzc1UTdXQVhaMWhGZHg4dlJ3ZjVDVHYzZ2xWNlBjNmtVT3Azd3RnL1Nk?=
 =?utf-8?B?SVVIdVlvT2oxdFhIWHlyTjg3OHl4YkFOVHBXQ0VMeW9YTjRzRm1wdTZHd3hn?=
 =?utf-8?B?QnBSMmtiWXk1VE1ocGJQY1dIK0tQWGJVaDZoZ2JoTUcraEdJSnZOelZwLzZS?=
 =?utf-8?B?WGExcHIzd3RwNFpuZFRyTE11MXg4bUt3ZGg2NHQ5K0tSUVhTRlJud29UWEpG?=
 =?utf-8?B?cEloQlFzek1zU25ua3N0WTQrOUk3Si91MU9jMEIvVlN2NDFjR2plQksrWmYr?=
 =?utf-8?B?Z0RZb1ZxV21IVERmVHRrR21NcE43eVpEOEd1MkNCTUh0SmhTWWpjUWptOS9D?=
 =?utf-8?B?SkFVTHY1NDVjd2VqU2lqVmFDZUYvdzQ2NEZpVURWbW9mcTBWNEFIQ1FYbGhO?=
 =?utf-8?B?aGRzUnE2ZTNQS29aNk82ZVliZlV1YjUzTlpxdHZ2KzlFRjgzU3ZsZ1Z1WUxv?=
 =?utf-8?B?VXA5TTByT3dlVy93RExxRUJSK3lsUWNYU2hmSk5UTDZ2L1FPN3pyclhkMFdZ?=
 =?utf-8?B?UC9zcmU3NElTTUF5RXR2Y2VLM1M5enQxd25uRTVsUFY2a0lwQkM0NHdVQ3Q4?=
 =?utf-8?B?UDZWUkZuZFNSUFordklvcCtjZmVYWmFoSytwa1ZpR2tpcGlHUWJmVkJsSDAv?=
 =?utf-8?B?a1JaQkFaN0ZwZmRoNUlLM1JsRU5tM2lmaHVrbklkdmxqTnIxRlF1aTRZQVdT?=
 =?utf-8?B?MkcyazAwVy9tT2l4VDRpK05WYUlidENzbmJXckc4Slh3T3lyZzRSclI5TldJ?=
 =?utf-8?B?Q1hOT3ZreTVhb2lpakNFZitEYm5wQy8zSVpKOFBSWEtYZk9KQWJkSEtjaXJ0?=
 =?utf-8?B?TCtGbVB4ZXlTWlB2KzVxc1FndUtHcUZub0xoZVE0dU1ZbGZVNTN3N2dzYVBK?=
 =?utf-8?B?cEQ0Qm55OUhxRWwwWWlrajdEQXZ4dWl5Tk4zb3hLK3Nyc1BManV4cEYvZnhm?=
 =?utf-8?B?NXpPTmdHSHl1MEYwb0I1Ti85R09DNEVwWEpaNUtFT3VIdEo5MmszYXZObFRv?=
 =?utf-8?B?elFYK1hELy9ETDJoN0EwTHBmQXV5bHM4QzdZRzlyN3FTbUJJRy9YWi8rMTV2?=
 =?utf-8?B?R1NLbjAxSHNlOFN2Y1BOOUJjNU1BcjJMWDRPSHdwSEF6WVFYYW1OOEVpMkxi?=
 =?utf-8?B?RkplTFFGOXZrM1FOd3UvQkhBeTZFN3dtcTNuL2ozS3BKdlJ2OGxxTHhXOGxq?=
 =?utf-8?B?NURaOVF5N1dJRlF5YWVMajBMRTZDUUlyTCtIajR6Ry9TWmN1aUh0aHdscHND?=
 =?utf-8?B?QklNTTd1SjJZR202WnhMMkdIa1BmNCtEUkU5bXBuMHc2T0VNU2sxWnhWWHVI?=
 =?utf-8?B?aDlIM213c0ZmS2JsNGRONEhibFN6MXdDclR5TWdmUHUxNUFkNDJkdDZGSk1O?=
 =?utf-8?B?REo1cHRQYkIwaGE1L3cxSGM2STJXc09qbXJabnNXUmF6VjhuTWZSbXpkcS84?=
 =?utf-8?B?MFc0VmxpcnAzaXJyaW1hU3poNXhUeFR4bW1RVHVFcko1eXVwQnFnbFZUVFRN?=
 =?utf-8?Q?ZXEBAhbwJoQmstNjBO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV4PR04MB11732.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37718e1a-299b-4cc6-1d85-08de5403ee28
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2026 07:01:39.0067
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jjh73byFij04+SxMPS3LOcpZG8PbrnI+/m4pV7LZTn+HQKX0Nb6VbfIgC0Nh8fbbbB6304R6XlW4LJJ2bQgPRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11814

RGVhciBLcnp5c3p0b2YsDQpUaGFuayB5b3UgZm9yIHRoZSBwcm9tcHQgcmVzcG9uc2UuDQpJIGhh
dmUgYWRkZWQgeW91IHRvIHRoZSBjb21wbGV0ZSBtYWlsIGNoYWluLg0KSG9wZSB5b3UgaGF2ZSBy
ZWNlaXZlZCBhbGwgcGF0Y2hlcyBmb3IgdjIuDQoNClRoYW5rcyAmIFJlZ2FyZHMsDQpNYXlhbmsg
TWFoYWphbg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogS3J6eXN6dG9mIEtv
emxvd3NraSA8a3J6a0BrZXJuZWwub3JnPiANClNlbnQ6IFdlZG5lc2RheSwgSmFudWFyeSAxNCwg
MjAyNiAyOjQ4IFBNDQpUbzogTWF5YW5rIE1haGFqYW4gPG1heWFua21haGFqYW4ueEBueHAuY29t
Pg0KQ2M6IGxpbnV4QHJvZWNrLXVzLm5ldDsgcm9iaEBrZXJuZWwub3JnOyBrcnprK2R0QGtlcm5l
bC5vcmc7IGNvbm9yK2R0QGtlcm5lbC5vcmc7IGxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZzsg
ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7
IFByaXlhbmthIEphaW4gPHByaXlhbmthLmphaW5AbnhwLmNvbT47IFZpa2FzaCBCYW5zYWwgPHZp
a2FzaC5iYW5zYWxAbnhwLmNvbT4NClN1YmplY3Q6IFtFWFRdIFJlOiBbUEFUQ0ggMi8zXSBkdC1i
aW5kaW5nczogaHdtb246IHRpLHRtcDEwODogQWRkIFAzVDEwMzUsUDNUMjAzMA0KDQpDYXV0aW9u
OiBUaGlzIGlzIGFuIGV4dGVybmFsIGVtYWlsLiBQbGVhc2UgdGFrZSBjYXJlIHdoZW4gY2xpY2tp
bmcgbGlua3Mgb3Igb3BlbmluZyBhdHRhY2htZW50cy4gV2hlbiBpbiBkb3VidCwgcmVwb3J0IHRo
ZSBtZXNzYWdlIHVzaW5nIHRoZSAnUmVwb3J0IHRoaXMgZW1haWwnIGJ1dHRvbg0KDQoNCk9uIFR1
ZSwgSmFuIDEzLCAyMDI2IGF0IDAyOjIyOjIzUE0gKzA1MzAsIE1heWFuayBNYWhhamFuIHdyb3Rl
Og0KPiBEb2N1bWVudCB0aGUgTlhQIFAzVDEwMzUgYW5kIFAzVDIwMzAgY29tcGF0aWJsZXMgaW4g
VE1QMTA4Lg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBNYXlhbmsgTWFoYWphbiA8bWF5YW5rbWFoYWph
bi54QG54cC5jb20+DQo+IC0tLQ0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvaHdtb24vdGks
dG1wMTA4LnlhbWwgICAgICAgIHwgMTMgKysrKysrKystLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQs
IDggaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4NCg0KV2hlcmUgaXMgdGhlIHJlc3Qg
b2YgdGhlIHBhdGNoZXM/IGI0IGdvdCBvbmx5IHRoaXMgb25lLg0KDQpQbGVhc2UgdXNlIGI0IHRv
IHByb3Blcmx5IHRocmVhZC9zZW5kIHlvdXIgc3VibWlzc2lvbnMuIEl0J3MgcmVhbGx5IGJhc2lj
cyBzbyBhIHBpdHkgd2UgbmVlZCB0byByZXBlYXRpbmcgdGhlIHNhbWUgZmVlZGJhY2sgdG8gTlhQ
IGFnYWluIGFuZCBhZ2Fpbi4NCg0KDQpCZXN0IHJlZ2FyZHMsDQpLcnp5c3p0b2YNCg0K
