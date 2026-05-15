Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11022076.outbound.protection.outlook.com [52.101.53.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18933D75CB
	for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 18:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778869895; cv=fail; b=BICy60jo6vID6MrDm/OM9vIcOhGLFDnP5/adWLynRIqFbaXvcrA6MmcfZD+G7cUwpgR+kds2+EBcVEEvrCUaW/CryOgjl2Nzl7tSWYVJDwjGy+ppEUWaBDltbsD342oBXeEwsHi63pSLZtU1zfFb1Hv2qu/Nxf2TXnui9257+Pc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778869895; c=relaxed/simple;
	bh=Vd4264ikIzf4dDrwr6+HPyjqEg8ILp1vhnhWLb7lTmI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=b3cKx98Yz+7URn2u35fZD+Pd/VfX+oO6dLl3L1VpjwiD6gw4FLhNl8rfxzrweTmqpUW/XnUnzZdrRWvVeTpBm1wUY26ExzVT6sJT7D+feEq2k2xF8ueMhCD2h1vTIvDIk++NY6eF0vpNybD2YQAtj78w/YI/JLrkdxPVONu08ns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=fail (0-bit key) header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.b=1sYvOW5E reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.53.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.b="1sYvOW5E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PEwFnrlSvE6Oy1e1nvQeBcTdQ6oeqxISMoX8GInMRkpq6Dfjx/z1Zf7mUp8CZQzerOJJnEVbRTliooiumExU5HgA54JxCEtVIVxG73K3ajBKYlEKGWQAW54ux8BlqJTRYOq8u0j5QPp/bDNOnp5FXW0nQrc1HSj6f/KNiO/ubKQnBsTYZA0KzqDsWx8nkNhWb/31BpmfpQmuaKEm7+1JOLlb0sYC7KwIfL/AnYtqEyDw8do8yPXKdJMJyw8Pwk8qoHkpQN2+QdeADPzkBQPuJqx4faqFKJ4vxB+5EeDZ24KAIX885CtYrHoGZQA2uEryxVu40PXM/SKVwOSEbqJgtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2gdS1RPP2MHzphbVQPvv6D0pMT38V31lPmXFNNkmbiI=;
 b=JbrNRgKR3hUGUApHr7xzo78VqqD2e/Pr0t1w6Z/buAKxbhB21+X6wL3FBzDdYpDDm0m5AIHOG9Dv+eqzL4kpDRuG0qzp8rgPAC5CYlTjZouZvtZGNyO9iLShj922udFkwM67XfGjYyUzUfqkgp3TmtnT22jx9nrmPAUJgvU2X/iOXgzhRTyUe/ctP2rF4AF23g8/hJk3bDeNZJpqkICV8Sv8RHDqd+3zM76iz/2K12v8/+bvMuNeEEO+O1K+JUvkt2rcT79YwUrxynlWYLZ/ww6Q2MElJMb/KwsjBskVpxrhJ51gRuu0s0lObCIvvRIh9qWQypJVhEcIvym/7pYZGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2gdS1RPP2MHzphbVQPvv6D0pMT38V31lPmXFNNkmbiI=;
 b=1sYvOW5EgTQnGhpuA7DocaczL++9LLfSoGTgMq1pSsqCyqwZoRw6dBZAVTfI95geza2TmFdf0ORQ7mJ+2EWfUp8l3X5MIIbCkc3zBHWHB5K18mLSN9060StxEChN80hQOAUTFNxPTWtgFfb1IiKeZM3ipTj8vzJaAess3DOC+mI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BN3PR01MB9212.prod.exchangelabs.com (2603:10b6:408:2cb::8) by
 PH0PR01MB8072.prod.exchangelabs.com (2603:10b6:510:29d::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.18; Fri, 15 May 2026 18:31:27 +0000
Received: from BN3PR01MB9212.prod.exchangelabs.com
 ([fe80::44f3:1050:dce8:1ea9]) by BN3PR01MB9212.prod.exchangelabs.com
 ([fe80::44f3:1050:dce8:1ea9%6]) with mapi id 15.21.0025.012; Fri, 15 May 2026
 18:31:27 +0000
Message-ID: <d9b6f61a-af1d-4af2-abf7-470f62f5e848@amperemail.onmicrosoft.com>
Date: Fri, 15 May 2026 14:31:24 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox/pcc.c move shmem unmap to teardown
To: sashiko-reviews@lists.linux.dev,
 Adam Young <admiyo@os.amperecomputing.com>
Cc: linux-hwmon@vger.kernel.org
References: <20260515161001.699470-1-admiyo@os.amperecomputing.com>
 <20260515164905.337DAC2BCC9@smtp.kernel.org>
Content-Language: en-US
From: Adam Young <admiyo@amperemail.onmicrosoft.com>
In-Reply-To: <20260515164905.337DAC2BCC9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY5PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:930:8::42) To BN3PR01MB9212.prod.exchangelabs.com
 (2603:10b6:408:2cb::8)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PR01MB9212:EE_|PH0PR01MB8072:EE_
X-MS-Office365-Filtering-Correlation-Id: 23632e4f-6d26-4ce2-38d6-08deb2b02cf2
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|56012099003|22082099003|18002099003|55112099003|4143699003|11063799003;
X-Microsoft-Antispam-Message-Info:
	P9GkMe/yuuGm5dXqPFYohSNZjn5EYg/33XwM7W9scGwphZY1B9pXmtMm6Yld0oSKDGI2NRbkSv25okQxCBhBEEkp/IxAQNsuZmYqqHQ2ZbWBkwzxB055ay1vssL+cKII3ZTEXxjMp+jpZdiBBm4j8hdxYmaww2zCHM2lDN636qj/SNr1SoyNFi4JNS7sKpHSEfCIbThAZR/5Q4cVJi2AhlJgrvLPZvEWVAnymKa33lW9J30vpSfe1dLVdekDC9sDIdVXnFSz21EEwGVUaRSjG6uWplPmHWIr2QT1s2WPeN8RX5xLj8q46WllkH5A404e3wInJKJgXvGoigbZxh/6EpXBa8dsjsyIUFgsVJIWG2X1FNfWbNilFXPsZNx5M/H7QkkqVjDFur55t3Xtu9bf/vrCh3qRBSxR3BUdC21gj7eNDN1lmIWzHqgnTW+EEkbliombdTc/s/OUUO0J9lVoL8sSBiokoKy+rNtX+KtUhvlspjfmZA8Rew8Y1GL9ODpjBRgSyM3dzerRpOI+miWzorZsFBRgTcVEBCa59SSdWGQk1JAaMXns8ifUneQ+BRiB0u+veDYG1kzGlhoe4G45xudkxHLcZm/yFqWfMA1rBt+kDcSUS2RiEcvZgnmYTjh49IrKZAtryrLG8M54w4WnhSOtMwsqlo3twH3p/PpCsxBo+9sT+PydcWO3KjZZGOcc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN3PR01MB9212.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003)(55112099003)(4143699003)(11063799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUhJVVNjV3pBTEJnQlRQU1k1aXJTZFRjaUhuQWpqL3lGaE1FeW1rcUprc1dr?=
 =?utf-8?B?aG5tYU1CaEVqSWViM2Vvb1NmYUlDckVlcmNkeWRVOW1wN1grNnhuQVBWbFVq?=
 =?utf-8?B?N2VXdjdwR3JXMG5yVTNkb2ROaERlalFKL3VUSXdyK0U5clFBMU1TY3h2U0tt?=
 =?utf-8?B?UXZOTlg4QmFTZ09VSUFQUG5MQnZDa0NtaTFQa3l1RUJhSXRQVnFDY3R5M0ZI?=
 =?utf-8?B?cW0yQ0lhOHNLTEhscXoxemg0V2RIRjZLa05Ld3MwVGp6dmxMV3ZpdGYxM25R?=
 =?utf-8?B?RE1jVXlKbFFLTVduYW5TQzZCRjBYcThJdHJNcy9SaVVWL1VoMUR4TzJ4c0Yv?=
 =?utf-8?B?a1RXRU80Z3BXd1cvRVRXRmxBNmhuQ1ZoKzRVdjJieGR5ZzRnUVp2ZVNaQWNw?=
 =?utf-8?B?UlVjUFo2T3NmbS9QVWRzYWIyNk1wOU9BeWpZZS8wYWhreFpWbmNaMnYxTmFl?=
 =?utf-8?B?NEE4V09oaEcxa1VqR1plcFp4U2hFOG9XaWtrYkUxdU5mTXRUVlBuc2tRNTRG?=
 =?utf-8?B?cmxsYmZ4RFVhTHlTSzExejRKdVI5bWhWNi9IMm9kd1dQek5sUzdoNXA1WHZQ?=
 =?utf-8?B?Q1ZocTQycXNIb3I0UkU0S0VZaVhSNE5la2hjN2JMS3I0dC9FR3FxRG1HVnpl?=
 =?utf-8?B?NENFVjhqV0lDMzh6ODZuK2tWbnRPRzhnVWNxY0F1ak1vQXJwSjlQQUhDUzVn?=
 =?utf-8?B?ekw2VzN0R3R2NHRuWEt3ZTIzd0JKZkdna2tSdmxqc0hvcTMxMmJxOWN1SmVP?=
 =?utf-8?B?QjYvYUtZSS94citYV1ZDUHluS09FOEhpVFU2ajFUd2Nqc0ZpbGxhSWRGUEg1?=
 =?utf-8?B?d1BkQkVycWRVT09nSGFTaEVVemY4U0hyblcrZlRhU0xLRG1BczYrMGUrNUZi?=
 =?utf-8?B?UWtJZ3B0U3FjZm1VTUI2eVBHaFlJdUc3aTBLeFFJVkxDSTRCZnNqSG80RVlh?=
 =?utf-8?B?VlhpRHF3U2V1QWk0UlArVDlQR0xuWFgvSmE1ZEZRSUpoTHVWZ0x0c1pQMkJ2?=
 =?utf-8?B?WWFadlhpUnBDZDU5eWgzaWRNNXpmdnozVnZkZ2hQU3RDU0p1VS8ra3NETklV?=
 =?utf-8?B?RlBmM3VLN0VCMXIvVUtsd2ZGei9RVlFhemlxeS9QeDhibTd3UnlncUs1NUdY?=
 =?utf-8?B?aHd3ZWZqMFhvSDBpUEhOaE56b0Q0cnZJVDcvdG1Ta3BZZS9pYjdrV1JHTWlk?=
 =?utf-8?B?UDN6cy9Lbnp4WUpSMXgrTGNLRCtTTXJ1SlRHMUtwZUoxZm5FQVFSZkU0cVBT?=
 =?utf-8?B?Szl5VVMyeldqZExxdzRMQW1mT29DY2xqbWFtM1R3and5S01iVzNKSnBiYUc4?=
 =?utf-8?B?dkloRzArZnlwUDV4VVhJeGE4NFpqd2h1YmU0SVh3QUxBZ1cyZDRod3lpN2Qy?=
 =?utf-8?B?a1JaRzFZNlByUWlsNXR6MXNraUU5a0JvZXFYZEV2RmIySkljT0hoOXhIY2du?=
 =?utf-8?B?bDI4dDJuU0ZrNEhTaTR5aW1VTlVHYzV6UHJDaGpjUFFLR25MWlNsTkhHVi9T?=
 =?utf-8?B?amh1RE0xb1BXblh5NFFZZHdaOFdUSVI3Y3hwcU1ENGl0SzBIOWpxdUFLdmR6?=
 =?utf-8?B?eEJEQ3NRMHhzeGpzanZoKzVkQ2FFVUJ4bzNRTSt4aHZxS2YxYlFtaFhQdXQy?=
 =?utf-8?B?ZnR1THlLOWE4RWh4REdmZWV4VlVldkRQQWErNkZSVVRML01MdkNKeDBNdENH?=
 =?utf-8?B?V0VDTElneXhDeTMrN3BrY0hDbzc3ME5QTFZxbmZZTEdXcG1TejBoZk9QcWg4?=
 =?utf-8?B?NDZISkhYYjRSSU5qRzcxRncxeDl0SGIzblJPL0dRczN5UGhIZmJqTHRaS0Nx?=
 =?utf-8?B?UFRQQm9zRGVOR2NJYjhjcFNMUEJncTZocXBqcXpTTmMxMmhCamlVM0p2dVZx?=
 =?utf-8?B?SHpOMkFZU29Fd2xUalUzZ2dtb1FxS0piWVM3K2UwWG9uVVo3aHVlVmVzRmh2?=
 =?utf-8?B?V3dIRDMrb0svSUt1QlhFS1VrbVd2OHBxektvMlRVbjJMYm1tZll4Y0w5ekx1?=
 =?utf-8?B?bXY5MWZ6ME9ZOFVabVczZUlnb2draC9tMWNwaEIwSEp5YjhHV2ptb2JxU0xF?=
 =?utf-8?B?VWk1SHVYMGF0Sll3ZU1jWVVJZzZNVEdTSkNXY1lrUnFROEZMMDh3UGFXSW93?=
 =?utf-8?B?elBYZVBGNmZmcUk0T1BuejZka3NIRW1PUHBUUW4wdHRGT0QrOUdJdUFFTVZK?=
 =?utf-8?B?ZFhVOVM2TUdTVnJqeEc1dVdoZUxmR2dpbTNCNnhiTkxpcVJoMUJtcVM3b2tz?=
 =?utf-8?B?d0xuMlZiUGM3ZmdYR01DK2FpQk9CdHZiRkJ1dVljQUhkMWdUU2MrNUdXaitp?=
 =?utf-8?B?RVVPcXVoQnNta2h2TU9ValJmQW44dkw3VXBUTXMwMUhVWmFjRVZac2VscCs0?=
 =?utf-8?Q?3w0c60T3G7/h2fK6WCz+F2IQBc7GIIDkNni2Tr9BfL9Jx?=
X-MS-Exchange-AntiSpam-MessageData-1:
	I4k+HDo96A5gZBsHH/6hFhUGkIqrsM/JO9qECPUlsyvzJGuLtOsXo3MO
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23632e4f-6d26-4ce2-38d6-08deb2b02cf2
X-MS-Exchange-CrossTenant-AuthSource: BN3PR01MB9212.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 18:31:27.3070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kzaRRPjcBIetWcxQYkl5YdO9p/8BUfp3zsXK6h9lrekC717CnQ+xlc5a2IVtDfQ84oRkwn2T9dTxGoMaUGfD3I+meMAvkQ7xpVFroLrFFMyJws196CPobBO00szRb9ch
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB8072


On 5/15/26 12:49, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Double Unmap / iounmap(NULL) in pcc_mbox_request_channel error path.
> - [High] TOCTOU Race Condition in pcc_mbox_request_channel leading to panic.
> --
>
> commit b19a3a11311850c88f208492b1f19cd0503eefd7
> Author: Adam Young <admiyo@os.amperecomputing.com>
>
> mailbox/pcc.c move shmem unmap to teardown
>
> This commit moves the shared memory unmapping from pcc_mbox_free_channel()
> to the pcc_shutdown() callback. This is intended to fix a race condition
> where late interrupts could write to unmapped memory if the channel was
> torn down while the IRQ was active.
>
>> diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
>> index 636879ae1db76..7fa2f6b5c492a 100644
>> --- a/drivers/mailbox/pcc.c
>> +++ b/drivers/mailbox/pcc.c
> [ ... ]
>> @@ -488,15 +478,22 @@ static int pcc_startup(struct mbox_chan *chan)
>>   
>>   /**
>>    * pcc_shutdown - Called from Mailbox Controller code. Used here
>> - *		to free the interrupt.
>> + *		to free the interrupt and unmap the shared memory.
>>    * @chan: Pointer to Mailbox channel to shutdown.
>>    */
>>   static void pcc_shutdown(struct mbox_chan *chan)
>>   {
>>   	struct pcc_chan_info *pchan = chan->con_priv;
>> +	struct pcc_mbox_chan *pcc_mbox_chan;
>>   
>>   	if (pchan->plat_irq > 0)
>>   		devm_free_irq(chan->mbox->dev, pchan->plat_irq, chan);
>> +
>> +	pcc_mbox_chan = &pchan->chan;
>> +	if (pcc_mbox_chan->shmem) {
>> +		iounmap(pcc_mbox_chan->shmem);
>> +		pcc_mbox_chan->shmem = NULL;
>> +	}
>>   }
> Will this cause a regression with a double unmap and an iounmap(NULL) call
> during the error path of pcc_mbox_request_channel()?
>
> If mbox_bind_client() fails during its startup phase, the mailbox core
> automatically unwinds by calling mbox_free_channel(), which invokes this
> updated pcc_shutdown() callback.
>
> When control returns to pcc_mbox_request_channel(), it sees the failure
> and executes its own error path:
>
> drivers/mailbox/pcc.c:pcc_mbox_request_channel() {
> ...
> 	rc = mbox_bind_client(chan, cl);
> 	if (rc) {
> 		iounmap(pcc_mchan->shmem);

Yes this call needs to be removed.


> 		pcc_mchan->shmem = NULL;
> 		return ERR_PTR(rc);
> 	}
> ...
> }
>
> Since the pointer was already set to NULL in pcc_shutdown(), won't this
> unconditionally execute iounmap(NULL)? This violates kernel API contracts
> and can trigger a stack trace on architectures like x86, or potentially
> cause a kernel oops. Should an explicit check for pcc_mchan->shmem be added
> to the error path?
>
> Additionally, there appears to be a pre-existing regression in
> pcc_mbox_request_channel() that wasn't introduced by this patch.
>
> If two threads request the same subspace simultaneously, can both observe
> chan->cl == NULL without locks and proceed to map the shared memory?
No they can't.  Locking needs to be introduced but is beyond the scope 
of this patch.
>
> drivers/mailbox/pcc.c:pcc_mbox_request_channel() {
> ...
> 	if (IS_ERR(chan) || chan->cl) {
> 		pr_err("Channel not found for idx: %d\n", subspace_id);
> 		return ERR_PTR(-EBUSY);
> 	}
>
> 	pcc_mchan = &pchan->chan;
> 	pcc_mchan->shmem = acpi_os_ioremap(pcc_mchan->shmem_base_addr,
> 					   pcc_mchan->shmem_size);
> ...
>
> Both threads blindly overwrite the shared pcc_mchan->shmem pointer.
> When both threads call mbox_bind_client(), one thread will successfully
> bind and begin using the channel, while the second thread will fail
> with -EBUSY.
>
> The second thread will then enter its error path:
>
> 	rc = mbox_bind_client(chan, cl);
> 	if (rc) {
> 		iounmap(pcc_mchan->shmem);
> 		pcc_mchan->shmem = NULL;
> 		return ERR_PTR(rc);
> 	}
>
> Doesn't this unmap the active memory mapping for the winning thread?
> The next time the winning thread interacts with the hardware, won't it
> dereference the NULL pointer or access unmapped memory, resulting in a
> kernel panic?
>
