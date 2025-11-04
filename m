Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020101.outbound.protection.outlook.com [52.101.84.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327FD2D7392
	for <linux-hwmon@vger.kernel.org>; Tue,  4 Nov 2025 10:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762252935; cv=fail; b=OYfc8LZ+gk6SwrkeQLFbN5XLuLXIuiDbGPCxaer5qjhjq35RBLtdURB2n7q2/lvQ+0ipd4rBhlx5ytvwH/KGEqdR7IWKhIGQ0dqCHin25+3xMtWrij20TyeSRQQaYPqd5iUxQvnolUi4kiiecxUBfd+dkA43DSC47h/wDBThMi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762252935; c=relaxed/simple;
	bh=yi2Ql2/zT8/ZBAsmdDMBwJcOqwD8zydsGstcuOJye9Q=;
	h=To:From:Subject:Cc:Message-ID:Date:Content-Type:MIME-Version; b=PMn1WPpD4BCxKX+i7PTZ+DvvipRlrItTnotql2/GWM4BbmbYeCa2eR8xt2LW7ZAeRqjMo+MeUf3i7Uc8KSvX1ZC4tM31ZXeF5IHNXDEBtAlTVxpgMLHlniH7Q8Azqpt7QAVPwJ5pwY9LkqpKzUp8IEQhnB+N4asyRFK983XxUAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kontron.com; spf=pass smtp.mailfrom=kontron.com; dkim=pass (1024-bit key) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b=EaDEnHV6; arc=fail smtp.client-ip=52.101.84.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kontron.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b="EaDEnHV6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ym1Q5/qjkG1aMIeTMhPVuBejQ/v+EWyUW68loU/1/mLImsLa8/T50h7SiA5UMCmi/tijT8ITZfhUcQQ1aFeHfizIpMJtJnS+ScSAKx0JGNp2T0GWqG0b3y+n76g1qOIrGCcv2mKsDsMO4fzdoNwEoGBQUYerR5sHYT42FK2wRmXqjNKR2UGnNsA0nV3B5unEyLLJSN+LF1b41xarzsSOx4demK2+8u1rioh1sgZIGXtm1wCGILTwHFVZLOACIPCIHTIyaQoGcixPaF6ANUOivnYInvx/o0ZaVEYxKeNISw6ZyjCZSHjzUaNznQnJ1v/vUNpki2h41FyIEo3Tc7RPBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yi2Ql2/zT8/ZBAsmdDMBwJcOqwD8zydsGstcuOJye9Q=;
 b=Lmk9iIDXzUbG1q4sUfyQD8lLy1FuEoH8cWiA7yRKZtJplqXHnFtpQQIuUlqWXPEMCW9z2B32idkyOt3w90JXnlriAHcZZGvcLKRw6yJHMjIJkUE/5UZFm7jrvMDIM0+zY1uSQYc8kctoH7vx381qY5laMnbLP/tOYyH7gtL+EB0eBlx8Y6qmdJ3mLil2q+Tbip3lZ0Yfwd271uP9EqL/UpcWdqOHbDI/py+bbUgIzyTgpr/YvsVWL+pJBR/BkCuAN0oPtqLPA7v0KctNykrcYtp4sEh7t+q62r29q35aGf9GRkkhhgTJ0nDQo6HV06gA7A/k+ttdRCkQ7rLL/Uj5kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.com; dmarc=pass action=none header.from=kontron.com;
 dkim=pass header.d=kontron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yi2Ql2/zT8/ZBAsmdDMBwJcOqwD8zydsGstcuOJye9Q=;
 b=EaDEnHV6c3c5ezdKxCNX+CO7ce9LHUSe7aCLNJ4aYn1pryP1ic1/UDyNFg5GZsGqwA82JznJR75ikVKhug1tjNJ9a8maUd/IBhR79KvcxSPMfEeOJZxAs+eM8YA/V1OfHeCWF4t0EVKwFyj4lMUTq5Dc27SnszZ+LsTBRSpg8Q0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.com;
Received: from AMBPR10MB9319.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:6af::10)
 by PR3PR10MB4127.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:a1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 10:42:07 +0000
Received: from AMBPR10MB9319.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e931:a4ae:91cc:ea1c]) by AMBPR10MB9319.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e931:a4ae:91cc:ea1c%7]) with mapi id 15.20.9160.008; Tue, 4 Nov 2025
 10:42:07 +0000
To: Guenter Roeck <linux@roeck-us.net>
From: Gilles BULOZ <gilles.buloz@kontron.com>
Subject: [nct7802] : missing of_match_table ?
Organization: Kontron Modular Computers SA
Cc: linux-hwmon@vger.kernel.org
Message-ID: <3aaaf4c8-c063-6461-67e7-2f946adcf585@kontron.com>
Date: Tue, 4 Nov 2025 11:42:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: PA7P264CA0276.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:373::15) To AMBPR10MB9319.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:6af::10)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR10MB9319:EE_|PR3PR10MB4127:EE_
X-MS-Office365-Filtering-Correlation-Id: f0b306d5-c68a-4e17-67d2-08de1b8ecd12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WFI5TmYyQUx1OXlXTmxnKytMRzN6cS9lazh5ZElJSW9lYVQ0bHBkMktBVENm?=
 =?utf-8?B?LzdVY0t0UkVqRlVRZjlNLzFsekVicVFiK2lwZC8yaVoxdS9nSXV4cGxkUUJM?=
 =?utf-8?B?eHNYMjR4STc2K2JvVlU1WU1aS2hESGlHYWtzNzZaMEtpcXBjVDdId1RWak9K?=
 =?utf-8?B?ZS9rYkl3N0Q3cmxocEVTQUhja240SkxlT2g0WkhMb04rVE5OVnVxS2J1Zms2?=
 =?utf-8?B?NzRWZk1TVVIwbnh2TG5CeUtlNEg2YnNndWFDU1FxbjBWMEN2L05FY3Z5T211?=
 =?utf-8?B?bzdNNjlLU3FEVUg2dzV5TzRhVkxFbHErcjk5MExUYnQrKzRuRGFoWEF6YWIv?=
 =?utf-8?B?YVlJbVU0azhlWER5QWpOYmZONFN0S3lBYnlaQjBqdDdCMmNzc0FZNmhmdC9z?=
 =?utf-8?B?cHNnV01ZL2h1bHhvRjhPczJOL0FlV2JLZ3Y5cmY5Q2U3SnF6ZXlSOTJvVmI3?=
 =?utf-8?B?aU94Z2FkdndYbU9uNlZFTFpyZWdrbXJXdnlCUTZwdzNwa0g5TGZxN0J3TUtY?=
 =?utf-8?B?clA1S2xkam85S2ljWW5MTzdxVE93emRXaVkyRXFnS2RqWmpLVGJTQUdldjhE?=
 =?utf-8?B?RVJCcURZMCtsUmtCOHdJS3gwNGNyK2NkWEV6MkYwVFlETHNzQkpoa0pueFZR?=
 =?utf-8?B?NWpjOFYybzNoMlNRTUFmMTV4Zlp3NGxvRU82Yk5tK0JLNVVIbFhxZElUM29E?=
 =?utf-8?B?bXJ6SStUbFlreTVXMWJiQnBQUEMxbFZTZGdIN0dyd3hDOXhOVUhnTVJJc0pM?=
 =?utf-8?B?Z3hQaUY2ajVwei90QnBjUXkwWVU2MURtRzBRcXZHbCtUbHZsVW9sRWZYNDlU?=
 =?utf-8?B?YmN0S29VaHE0VytubXhIODREcFFMWkxmS0ozYmpxL2dZb3NOMHA1OUdrN01x?=
 =?utf-8?B?ZWtKdEZkS2Q4V0tEYUs3blVCQ1JMVVMwaDFwMHZBM052RnNtdG9SZnNIKytU?=
 =?utf-8?B?TTk4bUF3WDhFN0l3ck9UcGpubjJUdS9kTTkrOEtTbGFJUHdCRy83aUhpVkM3?=
 =?utf-8?B?Yzhsa3NuOEpjYzEyT1czODRRR3BrZXltbTJBL2FDODdsZjEvbWVML2NUOTFu?=
 =?utf-8?B?S01SekhOZWhZbjNnVGxEN0tyRS9FeEc2N2VKbXF3UXp3R3BTdllxUFVUSkxx?=
 =?utf-8?B?MlVGNnFJeFFkWGJDTWZ4ckUzUW9ycU93bEo1VUxIRUxOajNiZWJOQzZ1N3cz?=
 =?utf-8?B?YzZLaC92TE4yVU1LSERSQTM5UTI5WGx2dHFDeFJNcDhhWUIva2kvRXVjVnor?=
 =?utf-8?B?bDNrUjd0SGF2dlgrM2NjY2pmVmZFYkYyOTNhZ3h6b2ZMZ2hnelNJc2tHZVUv?=
 =?utf-8?B?eEtNRU5pYk50RjRCa0E1dzBzcmFtd2VKRy8vS24yL3ViSHZtVFFxRThWYkNm?=
 =?utf-8?B?RENqcnM4dHlhSmVPZENWZm8yb0FsWnlvWEFFRGh2dFpQRk9ETmM1WC9XNFR3?=
 =?utf-8?B?d0xGSkVIWjc3eFRwV1ZkT2poY0hCR1IxcW1CRlpUL2Y3YUV4VWlISWNJWkQ0?=
 =?utf-8?B?TU1GaFJaK21jaXhtRmxQS21mdktBSkdEQmpVVEk5ZGdWNStvNHdXNUVqY2Zu?=
 =?utf-8?B?d0RnTVJKUVp4dk93QVNubGlaazUvWXNyM203bkYycVh6ak1xS29wVjBsSWl4?=
 =?utf-8?B?WFZVN3grWDd6VFpGWGVkbDRVRFBpc3k4S29VMS9RRG94Mlh0RFZRM2IvTk15?=
 =?utf-8?B?UkJSWTI3Zkc5M2tGSHF3WWYrbTNYOHVjYVFUWlVuYjhVb3pwaFVjRXEwbDRD?=
 =?utf-8?B?TGZzNkhNMEllbUFwODM2WWxUNVJURFFyMEs3WHBvZ2kxbldreGVVYnlnaWpU?=
 =?utf-8?B?N0p1cEdXNXhCaHJ6aW5ZRGxwZWliTDVKMW8zcmo3dUgvNE14dmFjUDZlUEVT?=
 =?utf-8?B?cnJOMnc2Z3Vob3NWNEhSMC9jT3pxMUd6N3hnWW4yVTF1Tk9aL1hVdlFRQTdC?=
 =?utf-8?Q?smaWPnUY7S4YoD11MC6SAO4n0YkECfwr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR10MB9319.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXArcHQrM29qc1Joa0ZpbnRyWnNyNk5xRUlzV3B2WkkxRzhMYTc2YVQwUVZZ?=
 =?utf-8?B?OS9UQlhjcDM1L3NnWk9DM20vK1pEL21LbVp5TER4MTJDU3hwNVhzOFFoTVJ6?=
 =?utf-8?B?L08yeVVUUFhObGs1ckk5U2FvT1RvR25yQ2NoZk02dUI4Q2llMW5idld5eWJt?=
 =?utf-8?B?WkdTNVl3RzJrVUNqL01YZFRWQmt5QVV4a3ZteDZEbGdvazE2d296NlFIaFo2?=
 =?utf-8?B?YnVtdTJvUW1SMVo1VUhKLzVEbS9mUkpVM0UrZ0FSaUViT1k1RmYrNG1nNU1s?=
 =?utf-8?B?RHROKzIyT29YK2N4Ymc2N1dxZ0lYL0pCYkhNcjhFMUVQSVF5UEFyQkoyUlJT?=
 =?utf-8?B?L3FyZ3pkMnlVcnFBMHowMGxvU09rc1JlZGRFMDdJYUFLUStFZXFJL2p1NzRO?=
 =?utf-8?B?Wi9xQmR0a0Jhc1NVekhDSm5wY0RFNmtUMUk2T2wzd1c2TFNxM2puSS8rYzFa?=
 =?utf-8?B?bG1SR1EyeURCakNGQnBTMkNuNkhlaWx0Y0dycGVVNTU2dW12eWxjazdQbU16?=
 =?utf-8?B?U1Nkbis3K1VVWHFlSDF3WXpYbjFiblMxcFV2SjNnbWtVN21TeGpzcWlSc1hw?=
 =?utf-8?B?bzdvYmVtRmpLZm5zakhEdnNVcFAxaXNNRm16d0JjYml3MGQycTBOSXdFS1Iv?=
 =?utf-8?B?QllsZ21qQVhNdC9lUThTcm9kTVdnVnRWeXE4bTVacGR3dVFBcU5CcUg2WDBy?=
 =?utf-8?B?N3pnUTNsRm5LU2IwS3VjSHdZQmtIci9ONjY5THJ5OTFPeFJubnBvMnQweVha?=
 =?utf-8?B?akRPQkY5NW5jUnZzeTIrS1VIMzVrdVRzckRIMFJxQWVlaFZqWTJEcDV5NnRP?=
 =?utf-8?B?S2t6aWgvbnpCN2grTCt1azJaTGlvOWxKV2pJOGVlS3Mxc2toamtHMDJNeFR1?=
 =?utf-8?B?OWhkbmYrTkFRV2R0SEZVQi9FTk1EU3RQTzVXTjJVK3NDTFVJWjAydmNvUUd5?=
 =?utf-8?B?WXRscVZBTlpHcHgvZXlxLzhBOUQ4S2lRQWQ4blU0R2JKVVhpT01YL3AyMlhp?=
 =?utf-8?B?VnVWeHVlVWFwMktRRkRjNCtMaCtIWnl3OSsrcGx6U3J3T0xFdUFQUlhsOHpo?=
 =?utf-8?B?TmpDT1NveXJESlFZcENHd3ZmSTdFU29EemRmbmU5UzJSMXlyZ2dkWnUrTEJi?=
 =?utf-8?B?VDRPc2YrNlBRN3M2Z09FT3NlaVkwWTVQRnU0UklSd1R0Z0J1cmJQL283V1Bh?=
 =?utf-8?B?MEI5WkpHWENxVk1uQit5SkRxWEE5ZXUxY1dxY3kvdmhQb3k4c0R0ZDBWZjhE?=
 =?utf-8?B?Vmdoa1lzK05oQWVTZC9qZ280ZmdVVVdQZG9NSURqdUVNQUNSeE84Qmc2RmZG?=
 =?utf-8?B?bktydS9GZXlDMXlLUjhiam91OHVFT3ZQanZOUXZpRXphY2VadXBKdzRLdXFB?=
 =?utf-8?B?cFJzSHFuSEJPNUtWcWNrei9wbXhvbStqV2c2VGVycDY4ZGUzeU16SmQ5cUNI?=
 =?utf-8?B?b0I0VWUreFFoWnpLM1BuUmkxZEZRaDZhN1NIbzBXL1pKcnVYeVgrNHhCcXZl?=
 =?utf-8?B?WTdFVUsxblhJM21PbW14R3VIYlRJbkdZNU5hZWRDbHFFT2pETnhuRmhRVEhD?=
 =?utf-8?B?WjFUcWN0aGYxMTJNK3VITnpNV3VtL2k0eDI3eEU1OTd0NzAvRWtuUlRxbXkw?=
 =?utf-8?B?OWJWc0srL29pYm50a001MUIyZldlUjFORUpCMHRCUGlvMGdVZ1dCODV0MUlH?=
 =?utf-8?B?cjhROE1USThBU0FyZWhRRHRFRzQreEl2a0w0NXA2Slhpc1JUakRGbEN3dW9k?=
 =?utf-8?B?enllaHFNMmVFK2pVbmZVbTUwcVE2SmNRd1o2aXJ0NmQ3TC8ySUlrOUVVNVRx?=
 =?utf-8?B?dVc3VFR0aXV6ajUyNUQyVjVGSkhkQXBYS1k2a0VlZ0ZvSWFBWG1INjZuVXJN?=
 =?utf-8?B?Q2N3a1VkanZ2RW50WW9zQ3BNL3MwNjFneEtFZDVmY1JTZmVEWVJlTi91UFJi?=
 =?utf-8?B?bmtTSFJSTEgrMnhrWUdGdDFIQmI2MzJ1blFYVWJjZjM4eDE2dGlyZDBteDBu?=
 =?utf-8?B?SXBQWnkvNTZ6WEZyMWllNnBLRUVyenBNMmNMbWhrdnVLVEpKM1dSUFdZOVZ0?=
 =?utf-8?B?cTNEYkxMTU42TnUvVm4vZU5MSHhxTHZGSXpHREpEVXRWQ0dhSW01VXN2TlBp?=
 =?utf-8?B?cUY0Y3lGR2ZRVkJLbjZTVW85VVdxWXAwRGZzWlpoUG1HUWhwL0ZHaUdFZzZ5?=
 =?utf-8?B?a1E9PQ==?=
X-OriginatorOrg: kontron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0b306d5-c68a-4e17-67d2-08de1b8ecd12
X-MS-Exchange-CrossTenant-AuthSource: AMBPR10MB9319.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 10:42:07.3895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +K58tuQO6EMLPXcLjFERU3azwnfgnZBK01C9JSvdt7ZNxaQBLmRYXWwRUssOf0c/0XP3Gic/5Npz8EMOYk452F+HPNe3l5fyFcMNk1RapF0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB4127

Dear developers,
To have the nct7802 driver loaded automatically by ACPI, it seems an
of_match_table is missing with something like "nuvoton,nct7802", as
done in other driver. Am I wrong ? I've tried to add this table and
the driver is loaded as expected.
Without that I don't see what to put in the ACPI to match the driver,
and also what to put in a device-tree.
Thanks
Gilles Buloz
Kontron Modular Computers

