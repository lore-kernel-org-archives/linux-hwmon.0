Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11023133.outbound.protection.outlook.com [40.93.201.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A94C288C3D
	for <linux-hwmon@vger.kernel.org>; Tue, 19 May 2026 03:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779161169; cv=fail; b=lLcxWCZl9At16fgMeWisvnCech2/Z7nl4w0U9bZjLJcIXcX0WNMHap5zwUd1EwT+jBFZDtZ6oX7xZMyGdPgS0qD9KGiUul33w1bMRjgwFNe3lDBrVIrSZsvU3dJ8v/T+8FuMsMeKSkuHH3SMwQD4sdQfGYH506lzSqLsJMJcnYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779161169; c=relaxed/simple;
	bh=zRH6IUACUcQRqnpiPQ7QiKYsPdxzuKjLd0gc/qfBn7E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ac6n9LciB+g7CF1zdrp9LgSQC3mGfTKJAsBZzmWqjuUdJz5HlsXUZSaaIbviykKfy0hJHwA552qLW7TwMMm3MgsFh5p7nKS0UQhsH/c7AdOOTk1QT+dYNXAzblV/b8az5R2lqQCBWCqdiyBpsuqsVRT7XroLWagFKxLeS5ibhow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=fail (0-bit key) header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.b=dby8HjhW reason="key not found in DNS"; arc=fail smtp.client-ip=40.93.201.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.b="dby8HjhW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RuDtOU++XwM/9aoZaNAuUrGCrAWfIUojd3dthSsZKNkidY4U/CGVCc/QShjnB9q3PnMWdDi8BDDzMtFtPw8fO9mmeLIBtpGU3sErP8FZUwvV6N5oHGHfXqFNIXudhwMbNhdPeWqSKhMFei3cwmxdYEdchbC4njQrvB4+XbMeRKENiisOcclFC1gUf5oIAmvoWjdlPrQ3+0dyjjOo3l7pxcJweStEkTBuLGcYFwTkEiRUpCIDqprbiG9FhjbG0Lya3xtEpm+wE3F7cOVBeAsV8Ke2nJ8ritGl3xp+WJ//V9gSwkAg3gNQUYielX/zjgQLc1RVXe+pT1GTFkDGXvOBRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Td4/Gvg32SJYA8BxSPJ/qCLxwwyR/y3zo0FDriS5XdQ=;
 b=OGcVdkwKdGuo8O11KOe9ePqJosXjZmhkYquXSbOsiHNj3VuG2KRJZW2hzNyfsWbyOGMFWToGmz74GLLs0rIar+zIZD2h9jjUxMIuCK5SZ0613qQFsXKlr6MeS5Wetnl1C3cvhIlg2kaKE3N8KYTQwRsTp+rom/LzWwMiGaCHm+59XaBWk1QShOH5IgYXWesaXMWEfpkvwfvCTZmpNLwGToACTdh04QWZx8jBnE93c1Ui+E0d4Ff8pRUEjobPg84A5pHRlmpSeI/rpdJu0lUPnwxbTEU0r/8EQxvLzUi0B/wPkBs3KlumlWbseB7nnCEWkZzaHI2TK9dxRfzi4/w2Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Td4/Gvg32SJYA8BxSPJ/qCLxwwyR/y3zo0FDriS5XdQ=;
 b=dby8HjhWlS5bVzu69UPydj6AT0gOwOwMPiZaRtRBJxYQZGT4ZusfzR3G5obLlBFwwf6sLEG87YCrBSftmcqMY5WBXQOC7EginqM6rFDUXrdyj3yfkzXc3n3en56Kmc+Y0NVSPrxEsR4xq0R6lqeSO0eR/OibAS9MuvkkUQkqd0I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BN3PR01MB9212.prod.exchangelabs.com (2603:10b6:408:2cb::8) by
 SA0PR01MB6170.prod.exchangelabs.com (2603:10b6:806:ec::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.24; Tue, 19 May 2026 03:26:05 +0000
Received: from BN3PR01MB9212.prod.exchangelabs.com
 ([fe80::44f3:1050:dce8:1ea9]) by BN3PR01MB9212.prod.exchangelabs.com
 ([fe80::44f3:1050:dce8:1ea9%6]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 03:26:05 +0000
Message-ID: <23b56652-d191-40cd-a382-f261a912b1f7@amperemail.onmicrosoft.com>
Date: Mon, 18 May 2026 23:26:02 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v02] mailbox: pcc: report errors for PCC clients
To: sashiko-reviews@lists.linux.dev,
 Adam Young <admiyo@os.amperecomputing.com>
Cc: linux-hwmon@vger.kernel.org
References: <20260518193006.27425-1-admiyo@os.amperecomputing.com>
 <20260518203533.56E46C2BCB7@smtp.kernel.org>
Content-Language: en-US
From: Adam Young <admiyo@amperemail.onmicrosoft.com>
In-Reply-To: <20260518203533.56E46C2BCB7@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY5PR18CA0017.namprd18.prod.outlook.com
 (2603:10b6:930:5::34) To BN3PR01MB9212.prod.exchangelabs.com
 (2603:10b6:408:2cb::8)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PR01MB9212:EE_|SA0PR01MB6170:EE_
X-MS-Office365-Filtering-Correlation-Id: c9dd764d-96a5-4876-a242-08deb5565c41
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|55112099003|22082099003|18002099003|56012099003|4143699003|11063799003;
X-Microsoft-Antispam-Message-Info:
	Zaemzz7+mZ37MGSHPHlpM6yM2bsPaXnj2S8s/a7HnIkqv1jRHa5Ryu2VZ9YDuOg7lMZwbJwSE0zOcAola5EwlKY+qt1K4ETc2qSYXP1gH8xymlk+ThlwDPflO2gpLsnWMoj+X4LoRwY92MmwtCGwjW8RO3WoIGF5EvVajX7lyhATBQYcj9oq8QLECNJ9kESFnMFeEC5WlpkOQHGrorTzY7Ed/6E5PCXSGazVL4XRYhl5ZL4IHnBwHEfSBh2GyoxCyybL8MMJqwyY9R+M6cjuan4qu1j6OON9yFe1vQ66VvBPLtWCu/gphmtpQ13J/PPmuZU1UXCXFemdqC2MyqWpAXHUgzREutM3Va+e9j1GJ3GNh0h9C0s/Ru9nvzo4F46VMQLda31fvBqoAHsiihQrEXeQpZp4NXzJf4IaUN51ZA4iYR2AxHewwWFJseXjoJ4/HNgUFJTNwUim0JckJscbdOLF8ayl3cgIo+Wff/4xod2HDvwDyueNJQHVkdY7YRLiu/2u3FsJDV6XF9vURbSnYrgLbx3Los+VXrnwPBQdDiPJv19QUT3neCjbZ3iXfyR5V2E39qk0dvpZMToLS0SZvskbVQTSW8CuQyzg7+dgQ1go2ibya1ek2SJs1885pb64Bf3D8TVFsriUbhAMwUFefDp9ZtPhvBcNfkCJ64t6ZMdOaukWd+3XFD2gi8rHFJCL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN3PR01MB9212.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(55112099003)(22082099003)(18002099003)(56012099003)(4143699003)(11063799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVcwY201NVRGNGxWYzJxejh4aG9QR1ZGNCtpRjcrZnA0RC9sL2tpWHN0Tk9r?=
 =?utf-8?B?TVc1d0hYVzNjZ2g2eU5BQTB4SU9hajJJUTB4MDVzRDJCejByRk5SQUxPNkhE?=
 =?utf-8?B?RTRLSFhxVlYxbWxMa2V4OXhnVFJYMU41VFFjSHRoTjBtZHdqR2ZqNlJmR3hJ?=
 =?utf-8?B?dkxQUCtvb1BYVFZaN0tKM3I3MHVkUk5FZkplSFlSRDU4Y2FMRUZBaFovbndR?=
 =?utf-8?B?MFAzNXhtSDZ0WTJGVmdZZGRnS0lxaTBKWkxRSlYveWJ4cWQ3WkN0MTJRVmVm?=
 =?utf-8?B?WDR6WnViZ09WTGt6eWJDOTArWnpQcDJQbjFXYU0xY2lYMXJJWXRIc1hnMHFv?=
 =?utf-8?B?czM3RXFIRjZGb2pKbUMzdC9kZFoyWk05RGNJbmljN1hHdFNzNXBjb0lkeUwy?=
 =?utf-8?B?U1NjSC9IVTV2WEtZU0VIenlGZm11NG5LeC9lVi9LekxMWHRMbTNLYWRxSUdH?=
 =?utf-8?B?MmU3OFZaeENMRjk0RFhtL1B6TTI5TEF1TDVyL2ozYXo2Zm9wb0d2U3l5WE5v?=
 =?utf-8?B?ZFdadUUrci93OEdXNzlJOXJLeEdCNGNSQXlZUjN0bVVYNTB0OE14WDNJY1Fm?=
 =?utf-8?B?WkMyVmdGcWl6NHpLL1ZuUWpjakVtV2ZzenpFQTRHcHFTM2dWTFgzMXdEMmsy?=
 =?utf-8?B?K3ptd000SHFzUjdrc0RyM0NVSnoxV00xcFFoSEw0Y1lBNTNCM2V5YzAyVWFH?=
 =?utf-8?B?NTZPc0E2VmpQZGtIcTBpZnV4Z2N2TUFyWmg2eFdwTys0UWNnK3JmZWk1MjQv?=
 =?utf-8?B?NEJEY1F3STk2bVYyYS80NVRDUGRhbjhXRHJYSXcxWnprRW12YVppenpZOWUx?=
 =?utf-8?B?d05XL3BvQUdHRG1WRUZGaUdTN0RtTjdwcTd1V3owbHB0eHQrVjNvWjRvL09i?=
 =?utf-8?B?RGpacytxWnNPaThhQXFaZEhuem11NHAyc0hIUjQvVWhMY3l5bm5kbFVaaC9H?=
 =?utf-8?B?cUZPSWhsL3U2cTd5S0xLTGg0cEpid1E4aWFHOXpWYURLMi8zeURUMFFsa0Jl?=
 =?utf-8?B?cTg5THI3dGZkekNFVU83emM1WEVVYjNBZGNqemZueWl0Y0J5MXVQQ09UVk9P?=
 =?utf-8?B?aTZ1WjMxaER4NzRYVnYxQjdwUkRjaE5PaWxmcHFvdlJVZlY3M1VHdmZUZnhr?=
 =?utf-8?B?NFJnUGd6VkdQcEZPMjVtK2xYRkVudVIwbmsyUVlmeWUrT0ExN0VUS3VnV3dM?=
 =?utf-8?B?a1R4ODlkOGgzdUsrRTl4V0ZDekVNdFN3L0V4clRIak5pcEU3TW9LT09tOGhH?=
 =?utf-8?B?dzliY1Jtb2MzVlREamRwWUkwZ1l5NXozaDZFQ1d3QjNXRWY4QjB2d3FCOGJM?=
 =?utf-8?B?U3lvbHgzVzh1L3k5QWswb1p6WGszYlhJcjhHWFprRzJ2OEZCUXpqS3ZsZlk1?=
 =?utf-8?B?ZGFDQ0QxYWNPTUc0QU9nYmJyUllGUVdiSEs1aU9TbkFhWWMrMTF6R0JoNEFi?=
 =?utf-8?B?clFDakt3ckNpaW14QnZzaHVFQnRYZlRRVFZnMVdHb20veWxMUmx4MmZ3RlRt?=
 =?utf-8?B?MmpXT1J3U2pCbVFQdS9pU2FzV0pZc1dtUTM4VWV2WlUxZlkyMWxwYzRsa3Zt?=
 =?utf-8?B?enJEcWtLNHFqcE5rOEVQTk5ZNXhFVWFnaVhjZE5WQUpaSmEvTktXelpOMWlo?=
 =?utf-8?B?MmtxNnE3aktodkI0eDc5cm1ML2JUUmc4Zkd5ZVdUaUdGRDJiZTJCN0Nmd0Zo?=
 =?utf-8?B?YVJTRFBxMXhPY1Ixa0J5b2pCbVRBNGkxQnZvcC9NMHRhVmxSNUNOMUhsdTR1?=
 =?utf-8?B?T1BldnFXYjE0V2FNcUNZQzh3enY4MVVZZG5ta3ZreExLTk5ObDF3OHZLeU01?=
 =?utf-8?B?SUt3LzdiUHk4aStvUDF5LzJoL3p4WkpkcDNDMEtYcmM0NndTOHRTNEdHaWJS?=
 =?utf-8?B?YnFGZUxKL09ZY1kvTVlQWmNkZEtzQjZKdXNzbTRiVllhNkVWTHd1dVVUV1Ur?=
 =?utf-8?B?UjNVT1ZjcnJRZHJGN2VDQUplMkJoYzUyTU4zbVl3a2VCQzNWalB6RkFtdG9r?=
 =?utf-8?B?U1k5d2k0VVY1MTZCaFJFcVZ1b0ljOXVKUTFLbGRIWittNWJXZ0x2LytOL3Bv?=
 =?utf-8?B?OG42VG5KQklDQ0FtRGFzM3FNMWhSNnVYamhxYXBJb0VQZWdNd3VVdnY3cGdP?=
 =?utf-8?B?dkRLa3Bmb1BWa1k2OUUyb3RoSEpBQVhpMEV6bjRhNGpqNG10R2ZFQ2VnMUlX?=
 =?utf-8?B?emtPSTBydFNMSTI0VDgxY1FaMm94S0dMamVzNlpndWxhUkF4eTR6WTB4ZWVr?=
 =?utf-8?B?V1gxWXJRTzl1bzF3TDlZTFVZaFZsendqVVlrb1BEVm5YRTZvYXhWVFd1OHY4?=
 =?utf-8?B?bzZlelR5V3lZanVYZnVMcE14czZSS0Q0TVM0UG5ob3NpS0tXTk91bmpPdmZl?=
 =?utf-8?Q?Oxx2JgRCl6uEGMC0cljpjHO+BKVX6+DtbuDwdisGRovR/?=
X-MS-Exchange-AntiSpam-MessageData-1:
	2iFVmOE3IaelFsRpeE6hDy1IAwP0XiE48zgSNEB0IBjhglzAzE0k8xVj
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9dd764d-96a5-4876-a242-08deb5565c41
X-MS-Exchange-CrossTenant-AuthSource: BN3PR01MB9212.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 03:26:05.4061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GFwgwoZcQvLb5IFeqvmfgPM5vJ+2u2oHGuJaCsGqQZMuD1myMOAQtqwE8vn57xBe3C4oXlJ9kGl6PMJoyoOutilIebC1bHgidkLlClVt7rS51M3PHbvvT3hhcTkugE7V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR01MB6170


On 5/18/26 16:35, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Clients relying on `rx_callback` for completion will timeout on error because `mbox_chan_received_data` is skipped.
> - [High] Slave subspace (Type 4) messages from the platform are silently dropped and acknowledged on error.
> - [Medium] Positive ACPI status codes are leaked into the mailbox framework as error codes.
> --
>
> commit 02ebdabd8b273de3b908d80f12b3a4d373284736
> Author: Adam Young <admiyo@os.amperecomputing.com>
>
> mailbox: pcc: report errors for PCC clients
>
> The commit modifies the PCC mailbox IRQ handler to read the error status
> and pass it to the tx_done callback. It also skips the receive callback if
> an error occurred.
>
>> diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
>> index 636879ae1db76..16b9ce087b9ec 100644
>> --- a/drivers/mailbox/pcc.c
>> +++ b/drivers/mailbox/pcc.c
> [ ... ]
>> @@ -327,8 +328,7 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
>>   	if (!pcc_mbox_cmd_complete_check(pchan))
>>   		return IRQ_NONE;
>>   
>> -	if (pcc_mbox_error_check_and_clear(pchan))
>> -		return IRQ_NONE;
>> +	rc = pcc_mbox_error_check_and_clear(pchan);
> Can pcc_mbox_error_check_and_clear() return a positive acpi_status value
> (like AE_ERROR) if pcc_chan_reg_read() fails?
>
> If so, this positive value would be passed to mbox_chan_txdone(), which
> might cause issues for clients that check if the returned error is less
> than zero.

Anything is possible. It depends on what the PCC endpoint put in the 
register.  Right now, the value is ignored, and only used for error 
reporting, which never happens.


>
>>   
>>   	/*
>>   	 * Clear this flag after updating interrupt ack register and just
>> @@ -337,8 +337,9 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
>>   	 * required to avoid any possible race in updatation of this flag.
>>   	 */
>>   	pchan->chan_in_use = false;
>> -	mbox_chan_received_data(chan, NULL);
>> -	mbox_chan_txdone(chan, 0);
>> +	if (!rc)
>> +		mbox_chan_received_data(chan, NULL);
> Since clients like drivers/acpi/cppc_acpi.c and
> drivers/soc/hisilicon/kunpeng_hccs.c rely on rx_callback (invoked by
> mbox_chan_received_data()) to signal their completions, will skipping it
> here cause them to block until their timeout expires instead of processing
> the error?

It is the same path as what happened before the change.  So they would 
not have gotten the error passed to them.


>
> For ACPI_PCCT_TYPE_EXT_PCC_SLAVE_SUBSPACE channels used by the platform to
> send notifications to the OS, does skipping mbox_chan_received_data() cause
> the OS to silently drop the platform's notification?

That is what happens now.


>
>> +	mbox_chan_txdone(chan, rc);
>>   
>>   	pcc_chan_acknowledge(pchan);
> If a slave subspace notification is dropped due to an error, does calling
> pcc_chan_acknowledge() falsely indicate to the platform that the
> notification was successfully handled?

All it says is that the error was processed. If this is not returned to 
the caller, the caller will never send another message.


>
