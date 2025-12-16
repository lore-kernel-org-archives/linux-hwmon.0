Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010027.outbound.protection.outlook.com [52.101.56.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E17125F7A4;
	Tue, 16 Dec 2025 06:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765867787; cv=fail; b=a1NAUzsRpxhZ8DiyVuVdmxJgc/SIoiX9Q9M/v1LcRNxEHvbKoo320i+zWvV/TaarX6ap9LBzZbQSTuUL/GYkxnOkzdB/HqwUcZE1wXCIns4z8z40lrq/lrGQzzFm7g0QGiBCn47nKokbIzH6HfmCaa1nzB6wXKVUrIkUjL5oAFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765867787; c=relaxed/simple;
	bh=7AJ9nsc8jHlRujlyoPfjhAJ7ZbtsyaDbdk00Z5AVLTo=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BxzjZrqFyWU2cc6dUA/xGYz9rzjKOjk0q3xJ/RXzQhRXyt0+dxAKGalWa5dV4mQV9R1nXCXVkJT2na3WGMytPd0NMHovq7068EsyKfr20pWV3V21YPTVpJHj67ohSUub1cmCX3LFouHMcXJ5RtKdQwZ/ovkJNiDno5p0QeA13R4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=xAQAX8XG; arc=fail smtp.client-ip=52.101.56.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="xAQAX8XG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VX8MlM/djQCSQA+g+NoDP3U3GG8HM5dJQnsz9t1xM0D6S7Ikpwr7ug0TwEc9sR4ZHuo59YpFASk9EOTSKim8yeKnhYVJaNPutdGk2VtvN2np0pvfWxgA6P3f+2tRsESYn9MIS3f3Cdq1fvoBYC0sD+rz7gUZe5U7CY06aJdxUi2Un4vJ52eK8NHDXCGNMoiQrExVbMEhzgzD+6mH8NN82e4BgS2iZteLWJCIgC5oJkq0tg3aiLmMD78Owh4uDfAjJk37e0cGsxuP3RekzMuB/LCE9SCgapASsOQTxM6NwRI3d/AcUAEEqCuffteJzfUBeyETmuJ13gkSCUAi7gycRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gp9ZnT7FyrZJ8xn6LGBOhKKikKdJco3u6NQJ7g8cW2s=;
 b=CBWuDxfaQfLNU1BCQiAGmjKW8UJwMKP/AVNWRb3VY26nRDogre21meHiJgUzY1YLXh7Rm8aPqecKOHNa/MG6/V6ivHneiQuk32v/gmnsG/+7lxwIWvPmK3Lab7sPW5CQY4oYL4hAeBxU3gEnuoROWtHUqS9b9Rr84CU7Q0TxzZHsOMxGHha75Cu+2Rdv/YSvVa7uYNj2p3Y2guaYYlw4OnUV91WiUzpMek6JFw6pJ4q+AjRC8hagORB4X8fkY+rCU9n7Fz2oR+sMS1L1Iphj59NIrqTMf7H0wOik/k7QCESnRszovjfk5cvPmt5DLuD1nl8DAOxgxVK/1CtKGFWaaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gp9ZnT7FyrZJ8xn6LGBOhKKikKdJco3u6NQJ7g8cW2s=;
 b=xAQAX8XGkz2nGO9Euyr8pDOaTcKuLQ7jtEGkZnbR01x8O9zoo5cZ5Un93F47f8UsJy3Uj7y/n9Kj6PaGznCnijKqHCHm1BJDyRJbQiWTgAgoBY9exa/VpkHTKcNJgBGDTRkNgAuRwaxGbJlMnLAAZpeIjc/2MLv9w2KwFbqspa75/33c3Ciaut27wq4sFyb7t1GL41H86WO7xYDm4jv7DjSHi1xBMFaiwdD1BbabBPpG+I1Z0i+BezhEiILyGnEI+PGeT8YK7gj/+8nAoGf/k2DP8Zf+i0ULoa2qf+dHyZ3dKj5TTbhcFEGDyiiz1g5QsAvqVfiBqix7gn8mp5WVtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BLAPR03MB5458.namprd03.prod.outlook.com (2603:10b6:208:29d::17)
 by DM4PR03MB6857.namprd03.prod.outlook.com (2603:10b6:8:40::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 06:49:30 +0000
Received: from BLAPR03MB5458.namprd03.prod.outlook.com
 ([fe80::7eda:fa34:15f9:e656]) by BLAPR03MB5458.namprd03.prod.outlook.com
 ([fe80::7eda:fa34:15f9:e656%5]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 06:49:30 +0000
From: muhammadamirulasyraf.mohamadjamian@altera.com
To: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ang Tien Sung <tien.sung.ang@altera.com>,
	Khairul Anuar Romli <khairul.anuar.romli@altera.com>
Subject: [PATCH v1 1/5] dt-bindings: hwmon: add altr,socfpga-hwmon.yaml binding
Date: Mon, 15 Dec 2025 22:49:22 -0800
Message-Id: <20251216064926.15817-2-muhammadamirulasyraf.mohamadjamian@altera.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20251216064926.15817-1-muhammadamirulasyraf.mohamadjamian@altera.com>
References: <20251216064926.15817-1-muhammadamirulasyraf.mohamadjamian@altera.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0008.namprd08.prod.outlook.com
 (2603:10b6:a03:100::21) To BLAPR03MB5458.namprd03.prod.outlook.com
 (2603:10b6:208:29d::17)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR03MB5458:EE_|DM4PR03MB6857:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d785098-61b5-4f79-9044-08de3c6f4342
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YU9SMTkyVFN2TFdiOFpuZ2tpSUprVkd4NC9FenpVUld4VVBmUlRrY0dlK1BU?=
 =?utf-8?B?eDVZNUN3NjZwaUsyN1d1VU84MnJ5ZkhhVWJVYWwzcVlrOU9oczFTcXJuMndM?=
 =?utf-8?B?V2FwcWFmZENwTXl3bzNkS1I5dDNkRlUwUDViNjJQM3piQWF0RTZ4ZzU2S2Qr?=
 =?utf-8?B?a2tOcDJFU3owSjhPdVpveExrRlZQZXpmMGhiUmxXb3RiY0pDZU1FYXV0KzdC?=
 =?utf-8?B?UnRnNEdydTVLYkwwelEvQWdubG1aTFc2RmgxY3NKQzZsanlOY3BCT3h4RUp5?=
 =?utf-8?B?VDc2ZDlZUVE0aFYyQ043Nk5MRGRPNjZocVhJQkIvZVJkK2orQVEwb25QdEJE?=
 =?utf-8?B?QWJPU25qeGpEQU9KampMclFMTGpNYVN5SnRzL3dqR1JDV1RqU2pTS3BqLytq?=
 =?utf-8?B?L1JmaEI1WGpnVzJ2VTFMdkNJZUMvOHNMTjBzcU0yNHhscWovUzA3SWF4dUg2?=
 =?utf-8?B?cjZpQ0U4RUQ3N0FlWm9FaU5xOVp5NGlzcUxDSWVWcU1LblMvbDVOKzNPMmRo?=
 =?utf-8?B?YnJHVEdZS1B4OXZuV0VBOWtqc2xtT2ZuWFU2Z2o0bUdnOVB0TWpPR2xlWTl3?=
 =?utf-8?B?RTBVa1Z6YXlwcmJmMWZCYXFSczJiZmF0bTcwOVVCQjdIT1FJdlhhU2xsWWRq?=
 =?utf-8?B?dkNjY0lQcUtIUm9Ed25Ia2ZqREx4REtoZVlEaUo3a1ljRFJad05VT3JIbzBO?=
 =?utf-8?B?QkpRY0hJcmFob3YwUzh1WlRZYmJxaGNoekR3di9NODFRNDcxaTAyNVBocjR2?=
 =?utf-8?B?N3RXbHgycHJ2dU9nNlBvUDFsR0lSYklzWkFHWVplUEhQL20rdkUzNU9LU0s3?=
 =?utf-8?B?eWY3S3ZGTSs2RFl3VU5aemk4K2NyeXRRZXA5eXBzWTdhSVdBS1FZbEZkZmhv?=
 =?utf-8?B?Rm1UTDNvYy8rREoyT0JKUzNiQklNOGxBOGI4aXR1VGcwQm1wdktQcyt5ckcw?=
 =?utf-8?B?cGI3NERDYkNuQS9DTlBGMTZldXVXcjJxY1ZKNzVYbm5RVHNycU85L1NIM0tG?=
 =?utf-8?B?YWtneEU4NVdLWjJOVkpvdG44SFhDS0I4NXZzcXNaUHg4L0RVOG83cXJHSXl1?=
 =?utf-8?B?QVQwaVJKSHI2Z2p4WmxYdkJLNmNvT0QwbVdhbHhwWDA3QlNqYS9kSUpxbFg2?=
 =?utf-8?B?b3hsRGNjbW9tbk9wZzA1TSs4THljb3pjU2xCUnEzSUJtWVFpY0p5QnRjNUhv?=
 =?utf-8?B?US9PYmd6U3JJVk96M2ZCL0RlaVU4OFVXS2tiRWlNc0l5cGJoV1Nxek81ZWZC?=
 =?utf-8?B?cnZsL05obGhqeWFSOERoMzR6cnFBbk5GUXkxazgyR0JNeVgycTJkVHM0WCtV?=
 =?utf-8?B?NmxyWEJuRWVaSU9xMWlNZmNsbkp1OVRNSlRsYm9sclB0bWRYR3JqbTNybk9C?=
 =?utf-8?B?S04xTEZOcGVaRy84UG1YRldXdWxvVG14b0xkMDQ5akVmaUJES3BHNXFseXVS?=
 =?utf-8?B?NnJZbTgwY2x1RUlWY1U2R3FDSkdzSWZDT0xudTNDcXpRQUtsOEpsMHBtWWlO?=
 =?utf-8?B?bUF6dTNoOTJlWW1rQldpaGpKY1BBYjVaM0oyb0h6Y3o0eFJJWks0WWtzRmps?=
 =?utf-8?B?Wm5tT0FtOGhrL2QxdFV5YzcraXJ6dEFLbkFqaElhWTQwckFPZWxKKzlFT3RO?=
 =?utf-8?B?RlZSa1VFRWJzNWY0bkNGOUIxQytxek13Y2trQ1lHRVNtQnRIUk1VRVVJb2lM?=
 =?utf-8?B?c3VEZkNUZzNyOU8rZWtONlVSWlJLZUxTSTVFYVViUW1zbDYxbWpLMk5laGd5?=
 =?utf-8?B?ZStxYzI4T25jQ3F3TExBd0NuclRXNnozZmcxSmJZWnFtMjNqMC9ENE1vaEFT?=
 =?utf-8?B?R3BqK25mMWFNS1FNRWRDcmJqSzF2S1lNRy9GZUZEWFpsQXk1Z2tUZG0wbXdD?=
 =?utf-8?B?ZHZhLzRYc1hscDByMnVjTFdSVkFuWkVVdTB1SEpqMGZaN3BMQkJwbEZTRUZs?=
 =?utf-8?Q?rt0knLdYhkXWd3nnIek5qObLENBMo4tP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR03MB5458.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEZNblZwcXBFVVJ2eGwzVHZGa0JYN2R2MEp6QXo1SDJkbzJIVysyT2U0b3lP?=
 =?utf-8?B?QWdoRGFqbG9zQXRibnl5Q1g2NDlWcHkwNlNpckRxSVlhS3VhZkdGSXNTWllt?=
 =?utf-8?B?bG5tU1pXUitUeEpGaDBUZkNSNHQ0VXRKdUNFMU5vOHUyZDZaUXRnTU5oV2lF?=
 =?utf-8?B?Nnc2SDdOSnFoME5jVUx5ZlJzQ29icS82V3lidlUrTC9WMzJUWmpOMmVOTWtl?=
 =?utf-8?B?YTA4bHJVVDF5N1F2NVZicVZ2SXNldDF5UENKYkgvSCtUdGNFcG5nWVB5Nysv?=
 =?utf-8?B?YzVPMk9YejROSFJZR3VaVnFQT29wbHhsaHh4TTZ3eDNHVXNLNE9BWlJURy9z?=
 =?utf-8?B?L0RuUzl2Qlk4bTlvUjl0dmFLSFRBWmpDZlp3SGpNZXUxTmdBemRZQlRSY1RO?=
 =?utf-8?B?blF2WjlGamd1YjcwN1ZDbk5EWkJEU1JaTU94b3A5QmY1SFJndWxrRThLbm5O?=
 =?utf-8?B?UHAyWXppd01raWJ4MWJ5UVFjUzY3UTF5TVlqMGkwakNxNXNURlF0OGUvQWty?=
 =?utf-8?B?eWkwLzcrOE5ib0xVdEN1bmNTQmtZNjBKVWJuNUN2TWV5ZGJ4SEQ5MklCVmo0?=
 =?utf-8?B?N1pyWHQrRFNhcTlPSWQxRkpGd2J1TXJTT3BFdVRFeXE5REdndU9ZWWF1dC8z?=
 =?utf-8?B?eHFHVU42UmMwTWhrRTRoRHR3UkJxeFJtRGNXTVVPc01nSENHYlprZ2dJcE1X?=
 =?utf-8?B?dmxJMTJHdmRiWVIvbEFBK2NXQjF2S0U1TG9tREFqbk9QMmJmZG9qT3JWVW5h?=
 =?utf-8?B?VGdEc0FENklnbkUxdytQZ3p1TnFMT0N1ZDVwaUR6akFEWTFhNi9SNm5aSUFN?=
 =?utf-8?B?ZGw5UW5QVE5JS2FnMUFvT2IzRWhBN3M1SG1FME9tT2JWZllEaEVhYlFLOUhv?=
 =?utf-8?B?U2JoTERveUJyeDNwUEE0UEppNm4wcy9wUEhEOFQyWnlRZTIyZFlydzZjbWFD?=
 =?utf-8?B?ZkRRM0RwVUhWODlrRzJMTFl4Uk12U0pCTTliYmpvR2RUZjh2SktYeDVPTnNG?=
 =?utf-8?B?cTdYNFFzK0dicTRmdkdSakp3cU8wQ3BTbWl2Nzd2cVdVaUpXbGpTTEtsQmpY?=
 =?utf-8?B?OEFDWkEydTBGWVd5SWRWa1BjcDVSd1lyM2FPdXFyTkh0emZ6OWlQOFlidERC?=
 =?utf-8?B?cHkxVE0ybzhobDMxTzdISWxjbjhLY0oxZTBHaldGMU5XNVNqZUFKT1lEYktZ?=
 =?utf-8?B?MVV1cC8waE9UTzk1alNoUlY5ZjZGR1B5UUorbGRNTEV0UU03ZGczQXM4L3RX?=
 =?utf-8?B?U3BnWU9WSFlnTXorSm43VlBwSnNMdkRXZDJDWWtPWlNyV0duNHc2K3FWelFl?=
 =?utf-8?B?WXg4ZUZNNVIza01jQUhBZStncys5a3FPUmgxM2lRQk5uR3B4alI0VEFyRmxW?=
 =?utf-8?B?aVk0eFBHcVQ3ZnVLWEd4SnBiUG5lN1gxanNjSjFhVzdtWkRmZWoxeDdZUkZq?=
 =?utf-8?B?YVFJZVUzT2RITExvTzQrWlZJcHZnVS9mVWs1c21adXVjVkNkOEhYZ3cyVW4w?=
 =?utf-8?B?enZxR2Fra1RMQkdSZEVySVNKUFNkVC8zeEllekdabGROMDk3MWhSb2hxcFBO?=
 =?utf-8?B?emxYckpVVkROaTZvZ041dVZNUDVOK04vaERad1VtSDBQems4MDBqUER6UlBI?=
 =?utf-8?B?eDhwNUxkem9GbjV4dWViTUJEajAxMTQ3TnFOeExDcFkzaVJJbTY2MWZxMmpp?=
 =?utf-8?B?OWE4eWhwSlh1VjFLSWJIT0NQdmROS1kxc0pYTmErOTVsUzhtdmtoTGNuTEpj?=
 =?utf-8?B?N21yQUNubml1OC9KempBdFpPR3YzUm9xS3VIR3YrUXNPaXlleDdWRGJLMWh6?=
 =?utf-8?B?MDJubXBTRTlHTEtQN01qcWJaREZrejVLRzN6WHJyKzE5MU0veUtJcStwSUdO?=
 =?utf-8?B?NmJjb0gwQ0Z3TVF0UGN3NzgxOHQ2VEpBQ3dtN0w0SmcrN3lrcVJsMDBZM3RH?=
 =?utf-8?B?WXlLRzhPZkhzS09STTF2NXh0ZzVYczh0ZHZnNVd0STZiTjZQOFFiWXVqZjRk?=
 =?utf-8?B?MGFIWGpjK2p4VXUrVEpDNDNld1VPOWptaUMwZFk0TFBtU09UTjdwUDNUTlpk?=
 =?utf-8?B?RnFLUFd4UEl6Yms3K2J0RzI3RlhoK3VYZ0xwRjh0Z0VzQ2UvanJsT1dudjJV?=
 =?utf-8?B?VS8vNm9ENmxJREpsQlBCREJxY3NRQU9VSVZnS25uMDg3VmFqcTM4V2JGOVFr?=
 =?utf-8?B?cTdWMnQvSnNUZ2lsbERDRHI0Vy9peEFrQ0ZsY05ZZXZ3TmRGdGRWc0U4cXZ0?=
 =?utf-8?B?cnpOYkFPb2ZaalV1SkhGWFpyZ1NwSnVieFAyYWpLOXFpbzh5Y0J6L2pLazhi?=
 =?utf-8?B?U0JSTmpFdE8yUlMwb2orZWlUMVB5TSt1OG1YT1N5RmNISVF0YjVYbFJlN2J2?=
 =?utf-8?Q?siI+Ssto7wfG0karwMlHIyLlZoR83XgmtUrTYZEgdjDkD?=
X-MS-Exchange-AntiSpam-MessageData-1: 3MGm7bBOkGd3tA==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d785098-61b5-4f79-9044-08de3c6f4342
X-MS-Exchange-CrossTenant-AuthSource: BLAPR03MB5458.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 06:49:30.1771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HbEMCh5+NHSW27nEGwULjrSRMJOggr6UhS/m+9hPSyYL0H8imF1AQD7isYbseXuRxnaIrz2X9LgLcB60APDA0j0ZQVUlqQBkPZfIT7KLSOMZFeenUf1NrQc5Q5RAhIVGI5qPYveRCZx+U/cLdbBo5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6857

From: Muhammad Amirul Asyraf Mohamad Jamian <muhammad.amirul.asyraf.mohamad.jamian@altera.com>

The Altera SoCFPGA platform includes a hardware monitoring (hwmon) device
that reports voltage and temperature sensors critical for system stability
and safety. Without a proper device tree binding, the kernel and
userspace tools cannot correctly interpret or configure these sensors.

This binding provides a formal description of the device’s properties,
including the 'compatible' string for driver matching, voltage and
temperature parameters with scaling and threshold definitions. This enables
the kernel to correctly identify the device, interpret sensor data
accurately, and manage threshold-based events.

Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
Signed-off-by: Muhammad Amirul Asyraf Mohamad Jamian <muhammad.amirul.asyraf.mohamad.jamian@altera.com>
---
 .../bindings/hwmon/altr,socfpga-hwmon.yaml    | 286 ++++++++++++++++++
 MAINTAINERS                                   |   7 +
 2 files changed, 293 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/altr,socfpga-hwmon.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/altr,socfpga-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/altr,socfpga-hwmon.yaml
new file mode 100644
index 000000000000..b69611c8bc7d
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/altr,socfpga-hwmon.yaml
@@ -0,0 +1,286 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/altr,socfpga-hwmon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Altera Hardware monitor SOC FPGA
+
+maintainers:
+  - Ang Tien Sung <tiensung.ang@altera.com>
+  - Muhammad Amirul Asyraf Mohamad Jamian <muhammad.amirul.asyraf.mohamad.jamian@altera.com>
+
+description: |
+  The Altera SoC FPGA hardware monitor unit provides on-chip voltage and
+  temperature sensors. You can use these sensors to monitor external
+  voltages and on-chip operating conditions such as internal power rails
+  and on-chip junction temperatures.
+
+  The specific sensor configurations vary for each device family and
+  each device within a family does not offer all potential sensor
+  options. The information below attempts to illustrate the super set of
+  possible sensor options that are potentially available within each
+  device family, but the user should check the documentation for the
+  specific device they are using to verify which sensor options it
+  actually provides.
+
+  Stratix 10 Device Family
+
+    Stratix 10 Voltage Sensors
+
+      page 0, channel 2 = 0.8V VCC
+      page 0, channel 3 = 1.8V VCCIO_SDM
+      page 0, channel 6 = 0.9V VCCERAM
+
+    Stratix 10 Temperature Sensors
+
+      page 0, channel 0 = main die
+      page 0, channel 1 = tile bottom left
+      page 0, channel 2 = tile middle left
+      page 0, channel 3 = tile top left
+      page 0, channel 4 = tile bottom right
+      page 0, channel 5 = tile middle right
+      page 0, channel 6 = tile top right
+      page 0, channel 7 = hbm2 bottom
+      page 0, channel 8 = hbm2 top
+
+  Agilex Device Family
+
+    Agilex Voltage Sensors
+
+      page 0, channel 2 = 0.8V VCC
+      page 0, channel 3 = 1.8V VCCIO_SDM
+      page 0, channel 4 = 1.8V VCCPT
+      page 0, channel 5 = 1.2V VCCRCORE
+      page 0, channel 6 = 0.9V VCCH
+      page 0, channel 7 = 0.8V VCCL
+
+    Agilex Temperature Sensors
+
+      page 0, channel 0 = main die sdm max
+      page 0, channel 1 = main die sdm 1
+
+      page 1, channel 0 = main die corner bottom left max
+      page 1, channel 1 = main die corner bottom left 1
+      page 1, channel 2 = main die corner bottom left 2
+
+      page 2, channel 0 = main die corner top left max
+      page 2, channel 1 = main die corner top left 1
+      page 2, channel 2 = main die corner top left 2
+
+      page 3, channel 0 = main die corner bottom right max
+      page 3, channel 1 = main die corner bottom right 1
+      page 3, channel 2 = main die corner bottom right 2
+
+      page 4, channel 0 = main die corner top right max
+      page 4, channel 1 = main die corner top right 1
+      page 4, channel 2 = main die corner top right 2
+
+      page 5, channel 0 = tile die bottom left max
+      page 5, channel 1 = tile die bottom left 1
+      page 5, channel 6..2 = tile die bottom left 6..2 R-tile only
+      page 5, channel 5..2 = tile die bottom left 5..2 F-tile only
+      page 5, channel 4..2 = tile die bottom left 4..2 E-tile only
+
+      page 7, channel 0 = tile die top left max
+      page 7, channel 1 = tile die top left 1
+      page 7, channel 6..2 = tile die top left 6..2 R-tile only
+      page 7, channel 5..2 = tile die top left 5..2 F-tile only
+      page 7, channel 4..2 = tile die top left 4..2 E-tile only
+
+      page 8, channel 0 = tile die bottom right max
+      page 8, channel 1 = tile die bottom right 1
+      page 8, channel 6..2 = tile die bottom right 6..2 R-tile only
+      page 8, channel 5..2 = tile die bottom right 5..2 F-tile only
+      page 8, channel 4..2 = tile die bottom right 4..2 E-tile only
+
+      page 10, channel 0 = tile die top right max
+      page 10, channel 1 = tile die top right 1
+      page 10, channel 6..2 = tile die top right 6..2 R-tile only
+      page 10, channel 5..2 = tile die top right 5..2 F-tile only
+      page 10, channel 4..2 = tile die top right 4..2 E-tile only
+
+  N5X Device Family
+
+    N5X Voltage Sensors
+
+      page 0, channel 2 = 0.8V VDD
+      page 0, channel 3 = 0.8V VDD_SDM
+      page 0, channel 4 = 1.8V VCCADC
+      page 0, channel 5 = 1.8V VCCPD
+      page 0, channel 6 = 1.8V VCCIO_SDM
+      page 0, channel 7 = 0.8V VDD_HPS
+
+    N5X Temperature Sensors
+
+      page 0, channel 0 = main die
+
+properties:
+
+  compatible:
+    const: altr,socfpga-hwmon
+
+  temperature:
+    description:
+      The temperature node specifies mappings of temperature sensor diodes on
+      the SoC FPGA main die and tile die.
+    type: object
+    properties:
+      '#address-cells':
+        const: 1
+      '#size-cells':
+        const: 0
+    patternProperties:
+      "^input(@[0-9a-f]+)?$":
+        description:
+          The input node specifies each individual temperature sensor.
+        type: object
+        properties:
+          reg:
+            description:
+              The temperature sensor address format contains a page number and
+              a channel number to identify a specific temperature sensor. The
+              page number selects the region of the device that the sensor
+              resides. The channel number selects the temperature sensor diode
+              in the page. The page number is defined in the upper 16-bits of
+              the reg value while the channel number is defined in the lower
+              16-bits of the reg value. Channel 0 is represented by the value 0
+              and channel 1 is represented by the value 1, and so on.
+          label:
+            description:
+              A label to describe the sensor.
+        required:
+          - reg
+        additionalProperties: false
+    required:
+      - '#address-cells'
+      - '#size-cells'
+    additionalProperties: false
+
+  voltage:
+    description:
+      The voltage node specifies mappings of voltage sensorson the SoC FPGA
+      analog to digital converter of the Secure Device Manager(SDM).
+    type: object
+    properties:
+      '#address-cells':
+        const: 1
+      '#size-cells':
+        const: 0
+    patternProperties:
+      "^input(@[0-9a-f]+)?$":
+        description:
+          The input node specifies each individual voltage sensor.
+        type: object
+        properties:
+          reg:
+            description:
+              The voltage sensor address format contains a channel number to
+              identify a specific voltage sensor. The channel number is defined
+              in the lower 16-bits of the reg value. Channel 0 is represented by
+              the value 0 and channel 1 is represented by the value 1, and so
+              on.
+          label:
+            description:
+              A label to describe the sensor.
+        required:
+          - reg
+        additionalProperties: false
+    required:
+      - '#address-cells'
+      - '#size-cells'
+    additionalProperties: false
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    temp_volt {
+      compatible = "altr,socfpga-hwmon";
+      voltage {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        input@2 {
+          label = "0.8V VCC";
+          reg = <2>;
+        };
+
+        input@3 {
+          label = "1.8V VCCIO_SDM";
+          reg = <3>;
+        };
+
+        input@4 {
+          label = "1.8V VCCPT";
+          reg = <4>;
+        };
+
+        input@5 {
+          label = "1.2V VCCCRCORE";
+          reg = <5>;
+        };
+
+        input@6 {
+          label = "0.9V VCCH";
+          reg = <6>;
+        };
+
+        input@7 {
+          label = "0.8V VCCL";
+          reg = <7>;
+        };
+      };
+
+      temperature {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        input@0 {
+          label = "Main Die SDM";
+          reg = <0x0>;
+        };
+
+        input@10001 {
+          label = "Main Die corner bottom left 1";
+          reg = <0x10001>;
+        };
+
+        input@10002 {
+          label = "Main Die corner bottom left 2";
+          reg = <0x10002>;
+        };
+
+        input@20001 {
+          label = "Main Die corner top left 1";
+          reg = <0x20001>;
+        };
+
+        input@20002 {
+          label = "Main Die corner top left 2";
+          reg = <0x20002>;
+        };
+
+        input@30001 {
+          label = "Main Die corner bottom right 1";
+          reg = <0x30001>;
+        };
+
+        input@30002 {
+          label = "Main Die corner bottom right 2";
+          reg = <0x30002>;
+        };
+
+        input@40001 {
+          label = "Main Die corner top right 1 HPS";
+          reg = <0x40001>;
+        };
+
+        input@40002 {
+          label = "Main Die corner top right 2";
+          reg = <0x40002>;
+        };
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..8ac7fef4563a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -936,6 +936,13 @@ ALPS PS/2 TOUCHPAD DRIVER
 R:	Pali Rohár <pali@kernel.org>
 F:	drivers/input/mouse/alps.*
 
+ALTERA 64-BIT SOC FPGA HWMON DRIVER
+M:	Ang Tien Sung <tiensung.ang@altera.com>
+M:	Muhammad Amirul Asyraf Mohamad Jamian <muhammad.amirul.asyraf.mohamad.jamian@altera.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/altr,socfpga-hwmon.yaml
+
 ALTERA MAILBOX DRIVER
 M:	Tien Sung Ang <tiensung.ang@altera.com>
 S:	Maintained
-- 
2.43.7

