Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9221133C5
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Oct 2024 11:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728905202; cv=fail; b=MoNRsBmCM4w3R70hqGjbQeXB8/saawOLPN8FX/Ab8jOVy2pCyDHQWvQw2UERZXxYnaUX5zB7OmFGCZfucVJinMpvTylLZPhNdzTGM2VbNBm7YpoNQehn74D7zdm9Aqc3JBaenZt1ROoBdIcPwtqf7hCTThB+uaNRgQmyBW1UPus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728905202; c=relaxed/simple;
	bh=3lwD1CVN//1M5lziu8qnnWkaeUTyaBwHwCKDHkjmc6A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lKCNIC0HzPToVnAAhEtwwv8FM1WxY82PE/Lrg1mLUE7t9UAEVM7gTTjnNfjsA6ql9KbDe3oQy06dTbXjPwkelb3HKZ/EOpdOn/rctB7dN01KQ4JoYcUSPBSMmC9y350EMFOKtW18+7FAvZVc+vfzPscYZCyvg9GWv7eLHMKCN68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GjXmLiu7; arc=fail smtp.client-ip=40.107.92.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GjXmLiu7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UtJZqS+1LWkbnbTBWr/VnOG0xPM+WL1WTuBiNDkzMP36rXfHQ69t8bW/Vn/rdBmlS/pWug0KloiOq4CIokgOtJDv7Y0GqS3SeXsewynr49nmWMw9JvgKdIjlVTWzgDeXLeSzMIGUqcHcK3ekVG2KZlbCRSH3vZgRTVSqlnTPfs5WbhgxZ4sFWy/2HKTUbFnnX6rPxBAD2phX9lJVN1Ayl5eVrAW55bD62Mga/Nl0Qt0spGC7+8fJrJeBnupcZy454D3VZenlo8/t9rX7kgUU1GvC7J+ESU6CFZ/XoLpnq4TRjzBnpX2iq0RVptRg6EUJEBLjqr/UKOcCrmM7LjyKww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+zy4HlwvgESbgpBGv0PhDxj6KQNnfBdm8W/85SxqMc=;
 b=mGrD97709CcEgyr+rPA/54DRdG3Vh4EDq+4TBsdaao1CKpcJj85SDTtaYhZCeXrUMOOd4H3bRHLa3Bes1uPDdWu9BZR78PrxDtrx7vmtT8F5ML17BIR0BEqZmQ+Z0iuE29q+os8ERrRKg0ZgTJzmmJMqzjCiHOgNsqir95zHKRWZo6tYNUo/OtH0TzMc7uYfsGr/HHulnE3aqdhAkNOHlev0NFMYW3p1ZE3spRIglCoFKdjRpxQS1NxzDS93pkiDH4P4qp4+oCJaWz0VyQRD76obmOwNAv5MObTl3YXS9p8ouWgt6JoDZnuoqhGfDd8Owk0tugsoEApwNUr5A2QrFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+zy4HlwvgESbgpBGv0PhDxj6KQNnfBdm8W/85SxqMc=;
 b=GjXmLiu7TdfbQs547SkSDSYKRo1FsfOV0GnztCQw0DmzMQ/JGGQbcnPMp1Ia3QTh/Q0gGd2mS5bL/usZ6JfdJBKhZJ4CgFAmmaT3LogCa4ceGPqFxyfLOrYvC1frO4YGkRl32fUP88dYivVTVmNYd+6Z2s+EaycGTGI6Byrmt/c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8909.namprd12.prod.outlook.com (2603:10b6:610:179::10)
 by DM4PR12MB7672.namprd12.prod.outlook.com (2603:10b6:8:103::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.24; Mon, 14 Oct
 2024 11:26:38 +0000
Received: from CH3PR12MB8909.namprd12.prod.outlook.com
 ([fe80::b55b:2420:83e9:9753]) by CH3PR12MB8909.namprd12.prod.outlook.com
 ([fe80::b55b:2420:83e9:9753%5]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 11:26:37 +0000
Message-ID: <b50f19e3-1d53-f521-76b9-46cfa12b389b@amd.com>
Date: Mon, 14 Oct 2024 16:56:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 4/9] misc: amd-sbi: Add support for AMD_SBI IOCTL
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, inux-kernel@vger.kernel.org,
 linux@roeck-us.net, arnd@arndb.de, naveenkrishna.chatradhi@amd.com
References: <20240912070810.1644621-1-akshay.gupta@amd.com>
 <20240912070810.1644621-5-akshay.gupta@amd.com>
 <2024101327-dropper-ethanol-6d1b@gregkh>
From: "Gupta, Akshay" <Akshay.Gupta@amd.com>
In-Reply-To: <2024101327-dropper-ethanol-6d1b@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0191.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::18) To CH3PR12MB8909.namprd12.prod.outlook.com
 (2603:10b6:610:179::10)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8909:EE_|DM4PR12MB7672:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a3813af-e676-4024-03ae-08dcec431135
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TjlmV1RXQlY2cGJ1T2Roa0lrMTlWRWxrTE5FQ2Z1MjlIMTNQSTd6VmlPa0E5?=
 =?utf-8?B?MlBVclNBaFNiMGtBNjFwRXE3ajk3d3ZOSFZ3ZHdXTU9ReUtaVjFmRmZRSnRl?=
 =?utf-8?B?UjRaNUJxYkFGbnpJNWNTTGZObFF5WEdYNk0rcFNyck1Cdko0MHUrR2o5c2NO?=
 =?utf-8?B?NVdXdUc2NlJJVFZVSWw3N25udUpMY2lQTkRlS2UyR21rcG1JbmRBcWdYTVpy?=
 =?utf-8?B?cXk3NXRqMXpVSzh4blBwN1ZFdU1MR3NEbS9xSXZzRmFKeGUvcjkxZU1QbjdM?=
 =?utf-8?B?amV1Rm40WVB5S2NEMnRZdGNiSG8vdHMrYmJ6WTBmUkJsTmVmWlV6YndrQmVF?=
 =?utf-8?B?M0xzRURkRFE0L21idHdYNFJNOWdqaUNDSVk3dHhSQ05JdUdGdFFSM1c2Sjgy?=
 =?utf-8?B?dCtEMC93VlB4M0tDQmVxYTNMTjQxdDBHbGRkUnV6RjZvVXhVV044dXVJTXo1?=
 =?utf-8?B?RFdTV2pVdm9oaUtsc1RrMFp0WHpxZHVDanJwMkdXcEdhR2ZhYzNPRFc2ajhK?=
 =?utf-8?B?emVyaHlEOUc2WUVSbmtCMmZORzd5NWtTUlJZSkt6ZE5vSmRnQWFQNCt3cHJN?=
 =?utf-8?B?ZlJ2T3lJNk1QYlJtYVZFTDltZUJLSXpOZ0xROGxlQTBjWWd2SU1sRWIwZDVl?=
 =?utf-8?B?ZHdwTGlwTkZUWUFSeGtpYWROWlp3VzkvS1AyN2VKbjRRY3RNaHRVLzhaekp0?=
 =?utf-8?B?WStpWnFtRXdLc0tVZXRocXl4Znhlc0FPWWtYMkVOS2JmMVFpY2VwNkY1UFNI?=
 =?utf-8?B?NVpVK3cxbVZoUy9rQS91bHBudlRMQ1dGaTJjSWhIdmZXengvWThZbGdKTk15?=
 =?utf-8?B?QTdBU28wdGw4VzNOU2tVSm5LcDk1a2RFTjJHMnZ6dkZ6dXJCQVJJc0ducVhX?=
 =?utf-8?B?NnRJZzU5M1lLN2NMQ1M5aGFETTRBQk5SdDJGMjAvcGxGYlkvclN4U2hSYzFR?=
 =?utf-8?B?UE9tK2NudkFiOStYREowMXZZNnlvZFRtcnQ5NlIvdmI5KzN1OXhkS3M0Ukw3?=
 =?utf-8?B?SUlXL25UbWdCK3NjM3dYZEtwcmVETFlhcXJvTzY4N3A2UW8vYVB3RXFscnNa?=
 =?utf-8?B?NmNFSHAvOXRySlRoUDZ6dzUveUQrUmUzWnRZV3BxL2dTNXR4UlhMVXdGaW9o?=
 =?utf-8?B?WGFpYTRya0JtMit6c0wyRTZIc1pYV0dKTFg5aE81bGtnMUJTYzkwWXoyaVE0?=
 =?utf-8?B?R0VuQW01aHprZ3RFUms2NjVLS2N1bFhBWEJuajlhdytZckJoc1lwd3JFQk9R?=
 =?utf-8?B?Z2xmbFZpemZkUHR4RVlwY2NkYVlQNkdWd3k3N0VBOTczSjVjYTFaYkhxeWpS?=
 =?utf-8?B?SHNYOHVFclpCcTgyeVBqZlB6OEJ2UXE1Y09GNHJUYzAyS1FPN2gwRUhPM3JE?=
 =?utf-8?B?S0t1UzcxVkZyYWEzTUk2WDM2cm9obUIzaVNxelpCaDBYU2tqaUpPVUgzRUpX?=
 =?utf-8?B?MzVVNE1ObEVQUDFvSmtrczlya1FyZUFnY2w1TEFTZTdrMGlrTVRMOVFHOEhz?=
 =?utf-8?B?SXpVUUNPQldVckRuZEx5RW5IaThZcHF4azEzUk51aUUxbHBLOEE0Rmx6OE5k?=
 =?utf-8?B?bldpTFU0dGxDdkJYVmpabDZjeHJ4YzFtL091T1Nlbnp4M2x1Y2M0REQ1UGl4?=
 =?utf-8?B?bVg0L3F2RkE0WHMzL0ZRUUVneVV0YXIwU1NpY1NZU256L3p3WlcxZlRwd1Bk?=
 =?utf-8?B?Ry9lNTFRVGdsbmdFTVkvZjZiUXE0cjFNbFFzNzQrWWdaU1NqbzQvMFJBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8909.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vis5TkdraDQyYTdEZloyaUFMbEprbmIyd3o3Sm8rZW5qYkNvS1VueWZWZ0xY?=
 =?utf-8?B?TEV0UHNnVGM5cGptMktmU212eHBlRjVjVUM2WFBNRHBCT3RpRlRWR3o2MzRU?=
 =?utf-8?B?YUV5bUs3T1BLdVU2QWdSWURXMVJtV203LzdocGRBY1IxVEFnRWh1MHpEV1lu?=
 =?utf-8?B?ZGxzODloejdsQVBOU2JxbUF6N1NRbXRoTDBCMndYRTV4ZVp6aUdGZlBxV2dl?=
 =?utf-8?B?b2E2bDFhZGRCOTVKbENCclJDaXM3MStjVlFLY2VNcnoycGxYRHNlcjhNVjg3?=
 =?utf-8?B?MUdVa1U4bXJNanNZVC9CMnovWlhYU2NacDVZL1JOUnQ0Yjg3d2JKbVl4QlBX?=
 =?utf-8?B?akJYRy80NFF3WW1jSUtZMjFyRWI1UjJkV3dYQVMvMVB5T0ZVTFdIOHNsOERl?=
 =?utf-8?B?dmFITTZRTk42QjRRN2pEck96WjFPbWhQNEo3Z1JrckhWVm95c1lJRkh4eUVL?=
 =?utf-8?B?VWV3TFRtRGtPT2NYUCtwRk83T3VINjIrZWdFK01XWlkzRmI5WTRTZWZqdFha?=
 =?utf-8?B?VHFteWtZSDFxbDkzZWU2QnREUGgzN2J0Ri9tWDRMcjlpa2w0b2QzTnRxMU5H?=
 =?utf-8?B?OWczamdUeTRUQndUN0JiVGt6ZEpIK3VZVmhnckd6QVNwSEdpUkwwSTUxeHV1?=
 =?utf-8?B?NURvekRESFhNVVFQYW02UHdmd1lra1p6ZXIwazhLTmZIV2o4WkxwRHE4RXRu?=
 =?utf-8?B?OHBPaEd0dVRUTlY2WGtjSWgzVHM0VE91aEhra0N3dFlad0JzaUFZNlhSak1L?=
 =?utf-8?B?WGdudFhoKzc1Mm40UFg0YTNiR21wSFNic2NjSE5jNjVJMWtqVEk2VWh3b3B1?=
 =?utf-8?B?NTJWcVNlVmh6Q1psQVlwMGhzVE91VjJxS3lYOEw1NUJtZ0dtaG1TbCtES3hY?=
 =?utf-8?B?WDZPNDVWS0VaM0xYNTZVRWVzeTc2RXJkUVMyMi9EZTArR0J5cFByQ0RmUldv?=
 =?utf-8?B?Mlp0YmZ1Yjl6a0RVS2d0WEFvQmMxTkN2YUdxS0NMRTBDcGU2UXp4cENJWjBY?=
 =?utf-8?B?dGtOVjR2YWFCeE1USjVSdFlnbTRhVmJjYW1nVXU1YXFEdkRiNzB4OVR5cWNZ?=
 =?utf-8?B?cENmUkJ3dUZ6a0VDckpkTHdpb214VG0xQ0pSMHovVkdvZVJtWDdIRlJuRnk4?=
 =?utf-8?B?LzNiTnJsMTl1UFpiRUFId0pONFlYcW5FZHk2bktUOWF3SXcxbTVXendOOHJs?=
 =?utf-8?B?SFJKU1RJTDV0TVFlMm1xT2N4UGY2KzcxY3JUOGdVVkhERHo5MDlneUZ3Zzhu?=
 =?utf-8?B?YXo4K2NJT2xRekZ6SmJ4NzVKc0xjSjRHZ3g3LytibmdNQnV0RUx6UExRL1pX?=
 =?utf-8?B?MFROQWhQZmNmVWhtYm42eDVPOEFpano1NzVKcGNOdGZScVVpVFBaVFRaUFY5?=
 =?utf-8?B?MWk3Rmc3ejVleGhGWUcvVW9OWXBqT0dSQ0NoakhmWXEzTVFWczRBZTdGWklF?=
 =?utf-8?B?OFZ2K1N1Z3ZTaHlqNHZvY1BVNDdUYjNnZ1hvU2FLK1d5ZjQxeFJNOVZSYi94?=
 =?utf-8?B?WWo2VmJlNnNRaklaYTlLMkdyQUhQWnpLcEJ3aUhUQ1N1VXM0T0lBa0swM2RO?=
 =?utf-8?B?K2JFRE5VMWh0SzA4NDN6eW1sbC9IeUw0R3NSeE13emRXUUEzL0t0RmNYUXZS?=
 =?utf-8?B?RFR5VGxSTUc0My91dkdDbVROc050ajB3ZUNSL3I1dC80LzIyNmV4OHVYaG8y?=
 =?utf-8?B?eko0Zk9UcksrTzJkcUh2dUY3SE9VZDRHaERHZEZXUGFhK2d5aFM1bmNqbHNn?=
 =?utf-8?B?QUtLUU13UXZSOExWTEpCOU9wK00yV050N09KZFEzOXpJQkNMckxzTHZnS2oy?=
 =?utf-8?B?MnVLRGFTZ2c5NDc2ZkdJQWc4NFVSOFIvMEVXVDBWZXUzbEZsakZWcExjQ0Ey?=
 =?utf-8?B?TE1lMFNuRlg0c3d1bjM3SUd3TkxYdms3YVBRSVV5SXl4eXdCZ2NqYzZvakow?=
 =?utf-8?B?NlJFeG01bHBDcjN6aDVKSm9WeVErc2x2aTM2NWhqOVhIQkZRdWF5L0RUa2V2?=
 =?utf-8?B?cnZ3QjV3WGhnUjlPS1pIa0xpRVRuRFNWVWU1NVhidWVlT3Rmbks4U2xuUjN4?=
 =?utf-8?B?TTJCSnAvVjB4a0FycU1wbkRHbEFVeXFRWVJ4TXA3U2VXUmhFVE9zcGV0R25L?=
 =?utf-8?Q?gKCKxNgmYcdBPaa+Qs/Xpi88o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a3813af-e676-4024-03ae-08dcec431135
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8909.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 11:26:37.8914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ieCJKeGgPxjOrrV0A41mThR9hE7tsf6I3LJmXzsqQfObHCzuIzFxaY0aCbwm6LKvxijPJ8nP4K/I2FHd7BbsXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7672

On 10/13/2024 8:48 PM, Greg KH wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Thu, Sep 12, 2024 at 07:08:05AM +0000, Akshay Gupta wrote:
>> +     dev_info(dev, "register %s device\n", data->sbrmi_misc_dev.name);
> When drivers work properly, they are quiet.  Please remove this line.
Thanks, will remove.
