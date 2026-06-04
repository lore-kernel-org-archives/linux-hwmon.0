Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11020119.outbound.protection.outlook.com [52.101.56.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AFA3B8407
	for <linux-hwmon@vger.kernel.org>; Thu,  4 Jun 2026 19:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780601723; cv=fail; b=dtEDU+Ene4CIWGla3yISMONdjU6Oy1a0VR7ESsxxacEAHdcUP8EymquGBBl0m2urSRpgfOHCi8QTdvSr93+BXvoH4oWVYOBakHNYZaEOotdhW5Rk/V4KJKm3FvODBayXE4/9OpbSccDvGxVyXRsf2uEu4cSVox4DzWCHzmYWiMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780601723; c=relaxed/simple;
	bh=FZNkfzkM9pWq64YlyknKuMlIhKMgPcDISr9VeTn+0hc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ls/njBpw4zEZpRDCBOgiTiNjSNBiz3Z/oLYcjvFzwleXXuEm9Py8tDuDsymZf/BwtmSWR9YVLHkIYQb+mzk/Or6sK3ARJtlaNYilJh+C+jNGO+sTduGqpgix3TnkwXKmJ0el49Ruyi7ufNKIwGTjgWaMOMuCMqDkiLchLaj/HKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=fail (0-bit key) header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.b=bI82dUXM reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.56.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.b="bI82dUXM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N/XOn7wEPoQdgGD7+86YaPuRg+aKytCU0X1irusUp/F0kaR6bvo/Y5M4J175hmYEJaHXbXj0frZhJY/YUN373zT/x3ZUM1nFHQ6Dcc3Zsuy8RS+byEhKNb1oIOY4SagMcG5FrI9ZuGjIMpjTMbE8KxqtqMSHjh6WKrlk4FoMKsqXpGhoZsS7N3gcJ7cmuPnnk+QUbAle78Ns7MXaA/G50sODM2A/1ANtidIDSGQT6hT1+jsgbn0uC6fRsnExQQtw1bFVh5O8Mv4A0AS5fJgcP0t7xfqV4HYHX5x/IGBVpfq/EozR5UMTjCiFjQEqsT2s2GOu+CXZBBPRs1XawJK0pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LltaGvn+LfXkcX1QGRfRJIopcYEVVw54o6r1Qn6bzX8=;
 b=NoY1kzdVi11WNjBQrYsoGx95yun9KTeMTdtvJOYBEGNSlzTpuMACWTB9FDo7rIAm+NQlIxGlBSMvjwZJOuhMBqf7wNjg26T0hwRCvZ1a5InfE0jcoeubxAgN0O9WgLEZWJsmojqffXhTMaRSASqpLe06lqPMWZmd2xff+2kA01uKrLjk4SyHEibDALYnUV7GZVM6GxPOltMqan46jN0Yn1dKyzY50472Odw14azKFMqkTZJTmZT0cFwUQ+h4vOfXAM/LTOCim/BjQKIgfAzJyci79+8118C/w5M+e6V6ag0/rjFvvEgHBRJruNbDi3fHn08BKuHbBdIWF+SfWin8nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LltaGvn+LfXkcX1QGRfRJIopcYEVVw54o6r1Qn6bzX8=;
 b=bI82dUXM7igOl1ZQynh1sEPjML5ashle1UyPz8S0zpZzOZwNLxcrr9kWKlrok4z8gSqxeJTouW9kYseb/PyLh7AMMTPmbdMV3oZW5MfeDN1mzbsSnGiM1exbswu+4g7GH2QToEIg9vUCm1zTEi9zFADXAlbQ79hfm8qONF30wRA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BN3PR01MB9212.prod.exchangelabs.com (2603:10b6:408:2cb::8) by
 SABPR01MB994755.prod.exchangelabs.com (2603:10b6:806:50a::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.15; Thu, 4 Jun 2026 19:35:19 +0000
Received: from BN3PR01MB9212.prod.exchangelabs.com
 ([fe80::44f3:1050:dce8:1ea9]) by BN3PR01MB9212.prod.exchangelabs.com
 ([fe80::44f3:1050:dce8:1ea9%5]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 19:35:18 +0000
Message-ID: <5a5ec36a-a2a0-40ca-bb93-c1edf5de3ae7@amperemail.onmicrosoft.com>
Date: Thu, 4 Jun 2026 15:35:15 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v01] mailbox/pcc.c: ignore errors on type 4 channels.
To: sashiko-reviews@lists.linux.dev,
 Adam Young <admiyo@os.amperecomputing.com>
Cc: linux-hwmon@vger.kernel.org
References: <20260604163306.160017-1-admiyo@os.amperecomputing.com>
 <20260604165232.36A301F00893@smtp.kernel.org>
Content-Language: en-US
From: Adam Young <admiyo@amperemail.onmicrosoft.com>
In-Reply-To: <20260604165232.36A301F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY5PR15CA0136.namprd15.prod.outlook.com
 (2603:10b6:930:68::24) To BN3PR01MB9212.prod.exchangelabs.com
 (2603:10b6:408:2cb::8)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PR01MB9212:EE_|SABPR01MB994755:EE_
X-MS-Office365-Filtering-Correlation-Id: 034ff838-db86-4334-11a1-08dec27068b9
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|376014|366016|55112099003|6133799003|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	/JWC6wsaLvgGJX+eNv1MmUUpc+AfX8CPK5k6vObSF1aogWSkFq6YruSPS7kBKjI+8Izi6tUXqzkeDjRCRymE4qf23k5r/JXbw8kQD2QwHcjrtxCGIfmYXvYEPwaTLrx/erIJXmPEgMZ0gfD54/WOCAfTClYiE2590WCuZwC7JtkNgOuqzNtgh7NoyQZSjRWSv+SsqCSUYgSxA1AilL/GzXQUxjb2leY9dW5pkXrYx+Oo64J2RdZf1jcp8KOF3JnBN0Zb9G8O39uyRNUuYEZSlCTueY4HcYqDCDcinq5E2abZnH4iFiprGT0YP6AvLo6qtm+cXQ9l++wMJ+kphqVN1Do13dDdbgM96wlr+7dj6QxVJSXTHh2ALKDn2a0fZbX+yWBzTTpkXCNAAXhXA+s1sQInO3kRm3nGnj2VGcm8TSM+7FRqirillAJO/KjaR0bKBIq7IjJg8fzyw3JinehtnV5j5WsJHBGCv5zh+Ojjg2eMsJpw4q+6vOs51ZuxZ3spRHX7aN8y59/DT8wYTxp3DnoyFeKCcpuRb25qpdXSp7OqGXnWHX1HlpYVadoSkegyKTJ82BjfC1OtLyXDlZVsgCnfwT8I12S/oYg3gnDXLmB4GEypJ0C33KndbSgJNmfl+LOgndwtZU7Prm3GYk+r2A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN3PR01MB9212.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(55112099003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEljZWUxUWg0ZnFkVGV2TmxSZFFJTzYxSlB3cHM5QytVek9vbUZac055cytJ?=
 =?utf-8?B?RkJwL0xCcE9lUDFSQVdzYlhxTmZBVGVBeWZVc2VROExXTGhCSldJdzc1NjVF?=
 =?utf-8?B?NFlkNkQySGVNUFp5V21PUXRJQ1I2Q1I3RlBHcndTcmladmR1OVVWSVdBUWdP?=
 =?utf-8?B?YXdIcXI3VEplOHlLbXVvOGE3OXlKdDhGbmVEOHRTQWpVdUxQY3grZE4rODJI?=
 =?utf-8?B?ZXdhMktpQWVBN1ZjZ3JOakI2RTliU2NRR1VTa3pYczNuRUl0ckRRMHBiNVBT?=
 =?utf-8?B?SldsRXNWMjA2YTZQaTJHY3ovNXdNSVhVTmg0TFh6L3J4dTVqbnhJQ1Bya0xU?=
 =?utf-8?B?eTJKVWhQUjZXQ2xvNnI0ekhFWHBQZXZoL050UjFmY3JteGVqckVrUGhqZ0hI?=
 =?utf-8?B?ckdqOFdSWklVT1NKMUd2VmxxRnRkQjJGRk0vTkhrOGpHdjBCNXd1OTVLWXJh?=
 =?utf-8?B?OFhCNmZqWEZodE9MZWY4T2ovRU5JSlJhL05UZ2xiNi9vcWZpclYyeXNEV0FJ?=
 =?utf-8?B?Mm8ycXhFR25aS0tXVWJjamU2K2xodEVRV2d4czJUOE1VMnduaWVMUkpUS2hS?=
 =?utf-8?B?TTJEMnc3UUxKZndXS1Q3dW1nekVVTExPOUhFMlowRTB2QjVmL3FxdEp6b2Vx?=
 =?utf-8?B?S2ZaZlRPdUNod3ZLSFRJVXAxZWFUU1J1eldZdzhhQ0RCNmNmQzR5UUEzNjNi?=
 =?utf-8?B?MlhBSk9pUUlVZEM1V1NrSnR4S2llZG1XbzU3N0x1SGpRS0Jzb25CVXNpYzlK?=
 =?utf-8?B?T2NMQmZnMjBBejRHdnNuSU9yczhLTHJKaFFoWmtRNUJ5cXhva3JEVFBOY2hY?=
 =?utf-8?B?YVRKWlRFelR3Wm1NUHAxenF4MHJJYWh5djlDWGFvR0tjbmtxSWdaVzRMSHUv?=
 =?utf-8?B?OFdFT2Y2Wmc3K2p6T24ra0ZqLzB6OFhHSy8wbm1TNDNSNCs2NUJsQlU5cE8r?=
 =?utf-8?B?M05qa0lCcDRQRi9vUDN2MjlFeThsYU0wNWx6TnQ3V0lqUWxyNmc3T0lJUVRv?=
 =?utf-8?B?RGlmRFdLMVVNemcwd3VoaUFEcXp5UVVoNnJyKzlOa1BrU0UzcUg5OXdxNHVY?=
 =?utf-8?B?dXowa2JzOHBIa3BpdXVUUDlENThTUXJJaUpUUEgvQTFOVWNsQ0VMNXlyaHpE?=
 =?utf-8?B?Q0t3YzZMaU43cjNTaW9KaWY4YzcwbXB0bjJ1clNnckI3THJTcmYwYXlnMGNz?=
 =?utf-8?B?ODdMQURzWGVvR21ZcVIvR1cwTHZBRElYYWRQZWZEU1RLOTRWbDUvVW0xUUtF?=
 =?utf-8?B?bHRxZzFOODU5bXRVcFFSWWRVd1Jqd3M5RWFRaU9BTGM5MS9FNzNRQU5TYWI1?=
 =?utf-8?B?QXgvYmdvT1pVNk5veUhFeHp5SmtPTmJ0VWV0TDU0T3Boc2tvZ3lOWnN6ajls?=
 =?utf-8?B?WTVIcy9tbHkwYmlhMzBkdzN4bGk0TTNHL1pKYXJ6SnEvQm1qTjN0OStvVW4x?=
 =?utf-8?B?L1dtSjF6WEYzb0l2T0ZkTkF5WlNITi9iZkdTQVM1V2J3dWo2b3daVGpHTUZL?=
 =?utf-8?B?U3N6WVo2ZE5CWk9OSnZEWjBzK2NmWkRtR2ttd1lpUWFlRFJrSDV4QVhjT2NC?=
 =?utf-8?B?VkdXbVh6L01LUFkvdWRGdkQ2c0FhTEEzNGJsekZuU3MzMVlhVTFDKzlvNVA5?=
 =?utf-8?B?SkE0eStLZzd3Vm9ETFVSNW1SWWg4T2dSanhEVEtNUzZuWFpFM2MwdjN2dklE?=
 =?utf-8?B?QU12djBwVnA3dHVRY0NrK2x0aFJJbkZzd0lOK3RhZlp0bEkzSnl6amZBMDRa?=
 =?utf-8?B?Um1ob2dnM1FlL3dtenhzd3hDS3I5UXp2MDNJa1lqZkNjQlRNNTE1VVEwSHlp?=
 =?utf-8?B?YTVITnJSUDFaaUxkc2t3dFRpc1hlWDBRaVo2QXRXTnF5Mm5aMlB5N1VIcDF2?=
 =?utf-8?B?TmVaMnk1OUxqcHQ1NllYZzI4aTFrVnVFcnQzZmd0SlkwUURWWUpzUXlneTBw?=
 =?utf-8?B?L3dvN0ZmeUU0TzFhTTZPa3JoTk1CWStJcnJ6WVZEcTdScFEvbGFYZkRxeVVE?=
 =?utf-8?B?cjA3ZWRWQ25Pc2RMdWFQSGROV1dZSWE5enlHNXNJOHRxWS9uVWtqVWZRT0hU?=
 =?utf-8?B?KzFNelBFckJ6UjJHQzM1d1lQeVNOMDlxbWRIUjYvOFU3Y1hBQThUZ3JZYzI4?=
 =?utf-8?B?M0hyWVo3NW00ZzQvQW5hL2hUeHhRUFFTZ2l3em9kZXlyMWc1MW9qT3hMUWlQ?=
 =?utf-8?B?KzhyWDNzQVVBYTRpdVFNNzlFWkUwTFgyNEZQeGRQWTR3SGttU2ZTTUJvRUtl?=
 =?utf-8?B?cE83a2NVY2J1em1YVUNod0poRUNnVGJTZkVsL0N0SDh1S2tjUk9xL0YxSk1M?=
 =?utf-8?B?dGxFQXJpZWgyTjFCSDJJdkxwSmdONk9sbEUrMXlxYkJPT1ZnR2dza3dHalc1?=
 =?utf-8?Q?8dI3Ae3ARBi6gtPmxE3WyoZT9ozGhq7xBZYMhLawm6eUp?=
X-MS-Exchange-AntiSpam-MessageData-1:
	yhYDhpfZmt6zckiG4qqzMwV4WUPVdVR+bMYEsPWjGWFWKzRzJkd19/yT
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 034ff838-db86-4334-11a1-08dec27068b9
X-MS-Exchange-CrossTenant-AuthSource: BN3PR01MB9212.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 19:35:18.4110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qsvUSLT/PbFbA5cce0a6JWrgFzY+eouanC3TYTcEyjhHixByX78eI4+Xefr8x3mOf12rQF/Pk2OPRW/Lce2T2xWi6OV+xIb+ZT6xfGRNrPlo06thjP4/27d5g82IJHba
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SABPR01MB994755


On 6/4/26 12:52, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] Incomplete fix for Type 4 slave channels leaves a probe-time failure when the Error Status Register is properly zeroed by firmware.
> - [High] Out-of-bounds read and memory corruption when parsing ACPI PCCT Type 5 channels.
> --
>
> commit 682ec44d669bd318031fe1a1eb86dca6cabd5735
> Author: Adam Young <admiyo@os.amperecomputing.com>
>
> mailbox/pcc.c: ignore errors on type 4 channels.
>
> The ACPI spec states that the Error status register is ignored by the
> OSPM on slave channels (Type 4). This commit skips checking and
> clearing errors for ACPI_PCCT_TYPE_EXT_PCC_SLAVE_SUBSPACE.
>
> Link: https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/14_Platform_Communications_Channel/Platform_Comm_Channel.html#hw-registers-based-communications-subspace-structure-type-5
>
> [Severity: High]
> This is a pre-existing issue, but does the driver handle Type 5 channels
> safely here?
>
> In pcc_parse_subspace_db_reg() and pcc_parse_subspace_shmem(), channels
> with types greater than ACPI_PCCT_TYPE_HW_REDUCED_SUBSPACE_TYPE2 are
> unconditionally cast to the Type 3/4 struct:
>
> drivers/mailbox/pcc.c:pcc_parse_subspace_db_reg() {
>          ...
>          } else {
>                  struct acpi_pcct_ext_pcc_master *pcct_ext;
>
>                  pcct_ext = (struct acpi_pcct_ext_pcc_master *)pcct_entry;
>          ...
> }
>
> The Type 5 structure (struct acpi_pcct_hw_reg) is 96 bytes long, while
> the Type 3/4 struct is 164 bytes.
>
> Can casting a Type 5 entry to the Type 3/4 structure cause the driver to
> read misaligned garbage memory past the end of the Type 5 structure into
> the next ACPI table? Could this populate GAS structures with arbitrary
> data, leading pcc_chan_reg_init() to potentially map incorrect physical
> addresses via acpi_os_ioremap(), and misread the shmem base_address and
> length due to offset mismatches?
>
>> diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
>> index 636879ae1db76..0deaf7907ed66 100644
>> --- a/drivers/mailbox/pcc.c
>> +++ b/drivers/mailbox/pcc.c
>> @@ -270,6 +270,9 @@ static int pcc_mbox_error_check_and_clear(struct pcc_chan_info *pchan)
>>   	u64 val;
>>   	int ret;
>>   
>> +	if (pchan->type == ACPI_PCCT_TYPE_EXT_PCC_SLAVE_SUBSPACE)
>> +		return 0;
>> +
> [Severity: High]
> This is a pre-existing issue, but does this fix need to be applied to
> the probe path as well?
>
> While this skips reading the Error Status Register at runtime,
> pcc_parse_subspace_db_reg() still unconditionally parses and initializes
> it for Type 4 channels:
>
> drivers/mailbox/pcc.c:pcc_parse_subspace_db_reg() {
>          ...
>          ret = pcc_chan_reg_init(&pchan->error,
>                                  &pcct_ext->error_status_register,
>          ...
> }
>
> If compliant firmware provides a zero-filled Generic Address Structure
> (GAS) for this ignored field (evaluating to System Memory with space_id
> == 0 and bit_width == 0), pcc_chan_reg_init() will fail its validation:
>
> drivers/mailbox/pcc.c:pcc_chan_reg_init() {
>          ...
>          if (gas->space_id == ACPI_ADR_SPACE_SYSTEM_MEMORY) {
>                  if (!(gas->bit_width >= 8 && gas->bit_width <= 64 &&
>                        is_power_of_2(gas->bit_width))) {
>                          pr_err("Error: Cannot access register of %u bit width",
>                                 gas->bit_width);
>                          return -EFAULT;
>                  }
>          ...
> }
>
> Will this abort the mailbox controller initialization and leave the
> channel unusable?
>
>>   	ret = pcc_chan_reg_read(&pchan->error, &val);
>>   	if (ret)
>>   		return ret;


While these all look plausable, none of them are caused by or fixed by 
this patch.




