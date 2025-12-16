Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010040.outbound.protection.outlook.com [52.101.46.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3294E1DF73A;
	Tue, 16 Dec 2025 06:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765867784; cv=fail; b=D+f53vdahk+cbPP5V7XH9oYtDP0lj+TPuKUQkGkP7MEB1Oh196N3E0KJ9op/Zz46Apn4I0unMMz/JkI2Uxx/IbuS5A7tgntAMSOZawOcD6sPcFRRhBSU0aEJgaUJR1Vtw4X9ijePPHGZ62JmBAySBGtZD0KqsDpDLIuRZzgFzL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765867784; c=relaxed/simple;
	bh=irP+dI0fFZZVVCt5tcqbPs3gayP1mmqzRb2TxU5CVW0=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=nrzk7DzAE9rnaSCwvnJdp9vyzSH8aZ0/2ewaR+epg3ZxBpOE6tKrNw8ihcTz2Wc+ZLrl/El8I5FNOrNtSTWyc7WoxRHMu5oSLOJ9Ob6wGjZTu724uUv9mMBw1kF83g9RXkHrBtNX20RkgUPNenAU9FqHdN2V3deA4nZA/w30Mok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=YM1cgp7b; arc=fail smtp.client-ip=52.101.46.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="YM1cgp7b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CDjvsweCgdx6eXi0rLM/dV+GlTF+uT09m3/ps2fKUR/Tn9tEb7NzsdZNxse7+CQR0DGc1ds5ykrp8Ub4uG6tozrjm9HU6EIcO2fTPTr8VFk9FhA4ooLnPtwhxiXh2Qtyvi4xHbI4XIdyenhmNtet4nwtZTfxsBA22W7FP/ryf7Llk95m0hDdUUD9opLG0UCa5rhebcs6p59SCWVx9kMyiGE0B1FTANJx+/g8Mys2Frf9SkABAN7cf7E05HYwSZLk+dxTW5tRIPgXtRtwygs+EvHBu9s4TSROPCQCh11FtjwEozssCVoiH9VyJXBowpFCevPMfDfRzhbSEB9Px8DF/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A27boBvg76sRmOgOHTAeUTtTWRBSUIOC7uCN3ItaANk=;
 b=LJE6L5AnriIYeceYdLEuxmkJQK85Mt+8F581BznpeE8Su8HwniDKYcybz98j/kWMa0s1hc2wLS4oTOnzPQZ3SREm4gcNJiDN/SJrLWUO2kkr/+xiuPCNR7ustLm2ehkkCmDJFO1h6hy/3dYpfR8sVCPy1jMHtnNVgXOxgGyRwg1qD7cN6NyXfvhBqjdzI19wNH2iNgreVwFNRqaqFE9BM4nZApGSXgSgeZ1NBUrDHEzumQ9Us/8u0eCJYQXGue3QsG8Oj/OWLLa54RIG/459zZoQkPdqicFLisW8pfad/BaaVdY1xlxZZxChSl7okipczGGke9JM+oJm/1buLRAU8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A27boBvg76sRmOgOHTAeUTtTWRBSUIOC7uCN3ItaANk=;
 b=YM1cgp7b89sEA3szhnzmgmidRSke7hBt5I2HGbA7qsxFPFGhkEF2CmrCYkpuPVvhlaSy07lPaI1/7D/wRG3vGCQ3E7aB1HvR78HyPz9/UEEll7lHFLOJ43gBkCSkSGg/2vCMFkkkKAtD8aSdPaTnKFJ3rCPmqIEd6/UY5TjPDV5tq3wICOQ/B0xVvcTxVbQy1QSdDG8xnmk2c8y1RG/ij0Ks2UqvnQ2Y0KRHHuXP6YwL4q1gowIwfjILmJU40KUGhRYD2L4JAeMZY4MZntVp+s2bod3VUD9luv0nopwUp7BNpozY/gfAxZFRlQMrqwAiVMY0OkN880fcgX4xp9tZ9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BLAPR03MB5458.namprd03.prod.outlook.com (2603:10b6:208:29d::17)
 by DM4PR03MB6857.namprd03.prod.outlook.com (2603:10b6:8:40::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 06:49:29 +0000
Received: from BLAPR03MB5458.namprd03.prod.outlook.com
 ([fe80::7eda:fa34:15f9:e656]) by BLAPR03MB5458.namprd03.prod.outlook.com
 ([fe80::7eda:fa34:15f9:e656%5]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 06:49:29 +0000
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
Subject: [PATCH v1 0/5] hwmon: Add support for Altera SoCFPGA hardware monitoring
Date: Mon, 15 Dec 2025 22:49:21 -0800
Message-Id: <20251216064926.15817-1-muhammadamirulasyraf.mohamadjamian@altera.com>
X-Mailer: git-send-email 2.26.2
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
X-MS-Office365-Filtering-Correlation-Id: a8ba829d-bd6f-48db-5e27-08de3c6f4293
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q3ZTcktSRjg1a1FXcENkdXkvcDhrbVhXMkJoRGgxTHIvbjFGT2xuajJEUEpl?=
 =?utf-8?B?TVYxSDZRS2pxakE2V3Rybjh0Ri9vaDBxQWoydW5lWnVJOTBUR1JTTFVCRE16?=
 =?utf-8?B?MHpUalFzUUQzRjBSTTRqTVZMejZkbDdXendLWkNsaEFLaHN2YVpRV0tudVJy?=
 =?utf-8?B?U0hVeFRpZHF3bUE3cFQ1bHdqL2xwVGtjdlBodFBoZ2VBY2hybHlrYTFNa3hW?=
 =?utf-8?B?a00xZ3NlSU0rSXZRNnJSQ0Y0UnE0UW5JV1BKZjV0R0cyODdzdWROZlNnaEU1?=
 =?utf-8?B?UG9scmxsVDNMS0NFYjBjaHhLaWFLMU9KUDVaaFlFejBqbmovSTVIOVRvOWNL?=
 =?utf-8?B?MkJzZy9ncnV3bkdiQytvK2RRUmVaeU43WW8wd3ozU2pwN2NiQVB5WG05U01K?=
 =?utf-8?B?VHVPaEo2Z0Y5U3UreldiRUJUUHkzczF1Y01oZ3lYT1ZIQWY2NGdQYThLVXd6?=
 =?utf-8?B?YVpyUkhFTWFTUVJnVDZDemVFVnlJU0xjMjV6UGcreE5ncUpDMTQ3QlpZN2ZZ?=
 =?utf-8?B?MUxScDRCNzQ2U1didlNjK1ZFUWphcGF1SjZkay9lTUZ3VUVrYi9DbHFzdmln?=
 =?utf-8?B?UnRlVnNKa0RteEd2QVJZdlFYS1ZJUlU1MXhqVm1JRjRRSkxQaXFQVUtmRFZG?=
 =?utf-8?B?RTRSNTQxVWNjT3BWbHE4RDZNYUVqOE9iN2t1MUU0aDNYWnZUTGxjY3pjSGNO?=
 =?utf-8?B?QWdGZHVvcElyMHZxcGZGa3JuYzVtN1lWMjgwU1hKTGxneVp0eC8wM2xOYXFy?=
 =?utf-8?B?M01wZW5hSkM2cmtSdFp5Ym05WGo1T3g2eUZUZUJIWCtWYXhMcGYrQnBjeVI0?=
 =?utf-8?B?dVdvRzU2T29JdU10NVh0WmtML3FubXBJQ0RyeEo1SmFFK1Arb3NmdmhIdC9p?=
 =?utf-8?B?amZSeGc3OHFJUlJvc0dVaHZHcjR3WFFMWk5UUDUwbXdaUHZRZTg3WkFMQlpm?=
 =?utf-8?B?L3JHT0diNURaR0RKTHNiTkRjZ0FBZlVwYmswdVZGVXR5dDFrdTZzTVR2eXVv?=
 =?utf-8?B?dHJLNlFzRnRlR3JKNFdYSkJlV3JaZlRsT2NhejFwUnl6SzYwQjVNWDh1UWRQ?=
 =?utf-8?B?Tlh2VU5hLzVNOTRkOWI4Ri8yak14VXdpV0h4M1dDRHBFUnRwd1NLd3duM01J?=
 =?utf-8?B?UDFRbE1QOUNRUUJGWElKRW5uL25pd0dETUp2QXhHK2dXYUxhaE1ic1ZWb1NU?=
 =?utf-8?B?cDV6TjI5NzM5eGdKMkdnZ2c5cEViRFh4UFVUMVRSZDNxRUFqQTIzQzlvMmNq?=
 =?utf-8?B?ZU5MMjZMZWo3QVlFTTZHZlVtQ2puM2lWZTdsNE1nSmxpQURNTFdjMGYxQWpi?=
 =?utf-8?B?cEZHVkJmbVBVUDBIenFaZE4rRUd2TG1BN0J0NkpvTGhFVXAvSzFvNUFNL014?=
 =?utf-8?B?RjIwOWM1aXMrdXFQT2hkdHdZMWRqZi9JY1Yzc3VlZWp5MUdKclVJQ0JNL2hF?=
 =?utf-8?B?TVNCUE0wWnNka0E1WTRPOW4rcFh4M2U4STBwd21Ed0NMWkFGdjBIOTNrRDJF?=
 =?utf-8?B?VDJQVXNXM2xPNHNBTDRFZGFHbjd6bDRzd01sT3VMQVZ0YWNtMFdpNHBiMGFq?=
 =?utf-8?B?NGhURFB5T0JIWU1Ka29CZkpEanB5UUtBOVE4TndIVWdndm93YzJvOGJBZ3lI?=
 =?utf-8?B?dlhnYTloSFdveEtBd3haeG50cWJwd1liOFhwQXAvU3k1c0VxS2pNTmN0WlVn?=
 =?utf-8?B?MTk3c3h6M20xTUFIUm1QV3VRZWJQdkMrekprdVl4UjlSUGwvNTRnRnY2cE9y?=
 =?utf-8?B?clBVeiszYzkrMHpEb2kxcGM3NTFVb1lOVHcwRnJsT1Z5c3EwaVJBRDdsRFlO?=
 =?utf-8?B?MlY2TERrZHdFbUNxT1F3M0hmbER6K29zYVYwQnFmamVLQjNvdGVMNkl1QkRr?=
 =?utf-8?B?TDNqQUFDNzZvaVozUFNDRjQyOE5hSnB5SHFxcldnSmg5eWFkYi9UV1gvMjln?=
 =?utf-8?B?NmNRajRkZXBmTUs2U1JieGZQMUdHT2FHUCtobjVzS2RPYlF4SzlkSGg1aFRR?=
 =?utf-8?B?RWs2cURCc1BVRHpCU0g5Zk5mR2lFa1pCTXhmL2dRamJ6WDZwek5odFp0K2Mv?=
 =?utf-8?Q?GatqfQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR03MB5458.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmdxMGxXVWZRMXVLZW1FYWtCQVRXTEluajB1a3VCMmEwS3VCYVMwb1FIZTRY?=
 =?utf-8?B?MUZER3NadWxlMko3WkFmOERlT2lscTRKbVdUSWdoYVhFT0FSOFFsZXY1OEov?=
 =?utf-8?B?dU5FOXMyS1JYcURRc1NoZzAzUkY1SGx3Mi9JUnhiR1lPbUpDNmlsKzNRVTlK?=
 =?utf-8?B?UkRKb0M0U0c2KzlJRWtlVjV0NkovRmNMbnozbnRJUXJYY29EN2R5VzltN0xt?=
 =?utf-8?B?eExCUStzb3VVK3RjeE1xV0pEZzZ4V3ZSRXRmYzNKT2xsVDE2Z0lPd3NydDFY?=
 =?utf-8?B?TVVVaG1PNzNyOHM1UVVTQWw2ekJvaXdLMFVCSUQwSWwrNG9TVWJPSTlya2Z2?=
 =?utf-8?B?TnNrL0xEUkhuTkM4ZE0zTFNISHV5Vm9vVnJNSUo0UER2YVBCL2xOM2ZwQ1Ri?=
 =?utf-8?B?ZDRLY2EwQ0JEYXhiRVE1QkhoWit5TGpldUNPMGxKeGxmeFg2a0FDUXNLODUr?=
 =?utf-8?B?bWlVUGNjSVRGenMycmRhY3YwMUtJdDAvSVZtTzFjMUxqYUREa0FJZEhlTDVk?=
 =?utf-8?B?cFZablBmc0pqNkVCckNtOXFGTFZpNzlCNGVRY3pKc3hheHZFWnZyUWFUYnRL?=
 =?utf-8?B?a2pKcXY3RFVDRXhSaWI4RXFGdUp1b01nQWdvWGhXUytXSkREYTlRRGl6eDlo?=
 =?utf-8?B?bWxIRmlhQWF5Sno3aTRDK25xUTB0dFRKWENobzNqRDFKMTBYbEJtRlM1d215?=
 =?utf-8?B?YnNySXQ2amFFTzRqY1hEcnREc3F6N0VseHhjTitWd3haeGZWZ3FoaWNVZFZq?=
 =?utf-8?B?UUdQdlRMSkYwd2VxK1ptRFJNNkNNTzFYMUV3d2xMYXFIYm43SjMvMG5wSHVP?=
 =?utf-8?B?eDhoZnZPdUlCWUhKSm93cG91Vk4yNjNwdXFTN291d0tRaFdxU3ovUTJGa1F1?=
 =?utf-8?B?c0REU0t0YTBNZUVBbXpPMDB6S1BLMWtNbWZScWJMT204amdicVRnUDR5ZXJD?=
 =?utf-8?B?ZWVraGNOckpWV1luVitFT2FYb3E0SStCS3k3dTdZcWt3WTIwZFJsWGkrdzVw?=
 =?utf-8?B?aWxnSGdmbGp0WVU4N0tXWXdyeDRkY3Zwdm5XWjRjSk5HVVVmYTUvZTlsQUNL?=
 =?utf-8?B?ZzlwOVZIbE1hWjdGd3Q2eDBScW43TnNrNGlqRmFLMkh3eGFTOEs2Z0M5cjlM?=
 =?utf-8?B?UFdZQlN2eUpqd1I5K05jQ2ptK0dKaGVHOTR6bWRaMDJobHZhQzVNN2thSVVS?=
 =?utf-8?B?MXFXOW5kZDVIWjVwdDlRMWFzUjJhc2dYSlIyN2NBZzhQNXZOSTh2Tk1hUVRG?=
 =?utf-8?B?QU9icmFjbXFoOUJjWUdBTXRWRWp6UG1Wc0M3R2dyOUZkTDhSQ2ZtT3FRRU9i?=
 =?utf-8?B?bWRVWldHQ0NJVm04UDZFNXpJV2FwdnJSTHdzb2RQNDQyWkc1Y0dJcWZwLzUx?=
 =?utf-8?B?Rm45RWpmL251VCtjbHZxLzkzdXRMV2dzdWNxRVhncGVGdGtMd2R3R3ZIMlhs?=
 =?utf-8?B?V1VVL1lydVZKRWRzTHZSZkplTEdidTVkaVdUMDE1ZDJ0U1NpWTUrVnhJSzhx?=
 =?utf-8?B?enA4aXRwWUNzaTV4ZVlqZXRVdE8vNy9KODF1ZWw2b25NL0o3REx0SlJyMy9P?=
 =?utf-8?B?UmdzdjZyazRacGRrajJQakFWZzV2dnVUZGVtU0JoREVNQWV6S3lNK0Uya2E5?=
 =?utf-8?B?MEFOZU55Ti9rRFljZHZtNSt5U1RkeXRqby8yWG1OTWxnTXR1S1RQd1Z1ZVI1?=
 =?utf-8?B?SlgyZC9RYjhWd0lkWWxGTUM5TTArT3puT0JURE5oSGF2VXhPTy9OSk9OV1kv?=
 =?utf-8?B?Tk9vcStYNU1yUGNtMTVLaks3bTJTaWM0T0E1RDlvUFN0Mk5QYS9hOWZENjFj?=
 =?utf-8?B?VTJFcVFBZmdEYWVkYk1xZUdnaEhEL050dzJSV3RhYnRFL28zNEd3MjdNZVJ2?=
 =?utf-8?B?cU5wQ0oydjl5cWMvMndCS0lRZlZtbjhlRytQVHZGQmRUNE1OZlpHbVFRR2ph?=
 =?utf-8?B?cXFNTWJPdXRpbWNUNERUWVFtck5zdGpnVEJxd2IweGhpQjJBYUdtak9XUDR2?=
 =?utf-8?B?UkJSTFBKOWRpaTc3b3lsT013UzVRYUlUSW9wbnRwdC9pZkFHcXdIQ1d6WjJW?=
 =?utf-8?B?YWdPSERLSXpYYkk1TlN2RDdsb2kvdlFFRXR6aVZaaDA2dnlOWWNUSDYxNFBo?=
 =?utf-8?B?S1VxSWhwMThvd2J0c3ViSnE1emF0NW53MjQvbEJwVWdMWVdNUTBRUE5vcklI?=
 =?utf-8?B?M3Y4VUlOTkdzWDNTUmtkUVpUdUVUdCthcFJwaWZWZ09iVm1MaVFKOGxSelBk?=
 =?utf-8?B?Y21SQnVTZkZzQldDa2E1bGttVS9POSt6OExaWG82Z1lucVZHQlU3Z0E0eEtC?=
 =?utf-8?B?NUI5WkZZbUxESGdpNkpEY0RhLzBLaGExcXlPMnN3NkVwemlIRzVzaEpZcHhs?=
 =?utf-8?Q?DWaGOA7qpaNoOF9y6a8g3cP8F0AcbYSIHz22Pd3mXdHBo?=
X-MS-Exchange-AntiSpam-MessageData-1: rzMUj16mrZJtew==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8ba829d-bd6f-48db-5e27-08de3c6f4293
X-MS-Exchange-CrossTenant-AuthSource: BLAPR03MB5458.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 06:49:29.0644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 37HCI/wntztciBLZDCD+/8FZge7WpC09C3uApa8wYB12LVUpbsLHrnF8sYoNNtZGVwr/rxsD/Iaq4r3SEvMH7/JUwGd04Z3xLX2V8WinfdBO0TLQ+JpJpauBaVQ3S/UQT5dQI32SxMbtsNKZaBxwYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6857

From: Muhammad Amirul Asyraf Mohamad Jamian <muhammad.amirul.asyraf.mohamad.jamian@altera.com>

This series introduces hardware monitoring support for Altera SoCFPGA
platforms (Stratix10, Agilex, N5X), enabling voltage and temperature
monitoring through the existing firmware secure service interface.

The SoCFPGA platforms provide sensor data through secure firmware calls.
This driver interfaces with the firmware service layer to expose voltage
and temperature readings via the standard hwmon sysfs interface, allowing
userspace tools to monitor system health.

The series includes:
- Device tree binding documentation for the new hwmon driver
- Extension to firmware service bindings for hwmon capability  
- Driver implementation using the firmware service layer
- Device tree enablement for Stratix10 and Agilex platforms

---
Notes:
This patch series is applied on Hardware Monitoring maintainer's tree:
https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/log/?h=hwmon-next

This changes is validated on:
    - Documentation/devicetree/bindings/hwmon/altr,socfpga-hwmon.yaml
    - Agilex and Stratix10 development boards
---

Muhammad Amirul Asyraf Mohamad Jamian (5):
  dt-bindings: hwmon: add altr,socfpga-hwmon.yaml binding
  dt-bindings: firmware: svc: add hwmon property
  hwmon: (altr-hwmon): Add initial support for SoCFPGA
  arm64: dts: socfpga: stratix10: Add hwmon node
  arm64: dts: socfpga: agilex: Add hwmon node

 .../firmware/intel,stratix10-svc.yaml         |   4 +
 .../bindings/hwmon/altr,socfpga-hwmon.yaml    | 286 ++++++++++++
 Documentation/hwmon/altr-hwmon.rst            |  32 ++
 Documentation/hwmon/index.rst                 |   1 +
 MAINTAINERS                                   |   9 +
 .../boot/dts/altera/socfpga_stratix10.dtsi    |   4 +
 .../dts/altera/socfpga_stratix10_socdk.dts    |  31 ++
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi |   4 +
 .../boot/dts/intel/socfpga_agilex_n6000.dts   |  66 +++
 .../boot/dts/intel/socfpga_agilex_socdk.dts   |  66 +++
 .../dts/intel/socfpga_agilex_socdk_nand.dts   |  66 +++
 .../boot/dts/intel/socfpga_n5x_socdk.dts      |  46 ++
 drivers/hwmon/Kconfig                         |  10 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/altr-hwmon.c                    | 427 ++++++++++++++++++
 15 files changed, 1053 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/altr,socfpga-hwmon.yaml
 create mode 100644 Documentation/hwmon/altr-hwmon.rst
 create mode 100644 drivers/hwmon/altr-hwmon.c


base-commit: c6bb982894b51c0ebaf94bbeb55ccbd1d4145a22
-- 
2.43.7

