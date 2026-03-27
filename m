Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012019.outbound.protection.outlook.com [52.101.48.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CA6EEBB;
	Fri, 27 Mar 2026 05:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774588074; cv=fail; b=vBWtNOAOqDD99X4zDSGBsZzEQrj+bMGZVDDqIQztpAUNKY31nbK0DnNjb5RRcrkuQ99HTMQBt4/Lq0e/AJ9t5c3hYOvVRD//V7hu87y//Q2NZuFS/GzORMVdBbI8zKUB48X2b1gMQne9aokUHL4MhOhg7YqWFyLOl61p9Ie9G9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774588074; c=relaxed/simple;
	bh=ipJiMarZgRvd54AFnOBLAGuafZ9MYqBcGO2ZpRVyGcU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uT8WPbgHj6uDMz+6YQbO6okTESJtqDJU0P/T1OIV1VX9Ga/6xKfAi+jMv+VER4ObJA2Hiw8cN6lSYR1gRvH0KKr4L1Nf3FMx8K3lSI4aWJ9E84rHHHTtF1JLQ2D7G6MgF4kqUnd2iH7f4Lezpasblh8RoBmrv5VwR80HC/r/QqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RcRq0V0K; arc=fail smtp.client-ip=52.101.48.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RcRq0V0K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cJXrWTipjnUX8cbUdagKEh73Nq2f4cXWyW/ZErIxFDf+oYmBs/YB7JksEEoisjha3LWpBStLG7BHm/pbgHhaA04LpHLA7uJpG8Grq08rFjeThzENqrKPvMWskXCQtZspbb1O5IB7Q2wIE/HcMyIFoyxQBjdIpKmuXjwBlxIRf9iPECihUaV98RBTnYirBnd+jxQP2cg2T1hdQs1EPDNRaKC7LQMRbCFO0WJHy86EDRH1kyVRUFiVnhbmdbUk7FBIygKOWp0PHBHFiM4kOAmp+TIuzwpo0OaMlC//N3u48T4ojUn1SNx40mw6+N0fV4Za/3arzUdYdJjbY0e8lljwww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=If9tzVmx3TfVgvFOnhLTgksAEAxrt5K4YWbg1L/kwaE=;
 b=cMbuwcG+cZ4q9/5ulJ0Tr3u2C2mrwhVEgJxnnNU1oL05WWtJ1NtE1krTWKYIqUJiApkdWFnzxjfEr7OUCxf6laptZbd8tKRzFveQnkgH/4qeUezEtVEihhpTfvtTsQ0TsLZNuYGGjaa5My8ySzBYHOVdFOGnGw6biaThzRYOCmTTt/EfRD+N7HnnpKfDKxdxMPkmwYRQDqVUH/aE19FHDfRUGR9RpzFM1b6oWqvTsefoJ2bzqXTmH/p583GA71wb/3oW9kKtaada/6qp9KU+YsaSzLGlMPtyGMIKimBpHnOYbb7A76SD0BHB8yG2G3eGKUNATgNWfb90in57xps+Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=If9tzVmx3TfVgvFOnhLTgksAEAxrt5K4YWbg1L/kwaE=;
 b=RcRq0V0KQFFkNh+dgODyhELNWyovzNasBN5W3F+wKnhLrhsgFMXBKcwiSJ/c/tiHCxBfYKVQczXnohRSwZBsiVKAxICJjOTI1EQOjx9FgeKLGUIJD60bRD4tr2RLbFJjUUrASKdJOlalbW3NHUag/LivxAkoy+Vd+tPrWZSWK8o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3023.namprd12.prod.outlook.com (2603:10b6:208:c8::26)
 by PH8PR12MB7376.namprd12.prod.outlook.com (2603:10b6:510:214::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Fri, 27 Mar
 2026 05:07:48 +0000
Received: from MN2PR12MB3023.namprd12.prod.outlook.com
 ([fe80::dc22:f915:3ddd:11fa]) by MN2PR12MB3023.namprd12.prod.outlook.com
 ([fe80::dc22:f915:3ddd:11fa%7]) with mapi id 15.20.9769.006; Fri, 27 Mar 2026
 05:07:47 +0000
Message-ID: <9e05e255-6245-415c-8c74-ee4f1809976c@amd.com>
Date: Fri, 27 Mar 2026 10:37:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/6] hwmon/misc: amd-sbi: Move core SBTSI support from
 hwmon to misc
To: Guenter Roeck <linux@roeck-us.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "corbet@lwn.net" <corbet@lwn.net>,
 "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "L k, Prathima" <Prathima.Lk@amd.com>,
 "Chatradhi, Naveen Krishna" <NaveenKrishna.Chatradhi@amd.com>,
 "Umarji, Anand" <Anand.Umarji@amd.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "kunyi@google.com" <kunyi@google.com>
References: <20260323110811.2898997-1-Akshay.Gupta@amd.com>
 <20260323110811.2898997-2-Akshay.Gupta@amd.com>
 <86ec222b-d252-4586-a1cc-2a7a5674e1b4@roeck-us.net>
 <d0ed96aa-529d-42fb-a680-917c325998ee@amd.com>
 <91e527b8-f753-411b-bdf5-7439edb48c34@roeck-us.net>
Content-Language: en-US
From: "Gupta, Akshay" <Akshay.Gupta@amd.com>
In-Reply-To: <91e527b8-f753-411b-bdf5-7439edb48c34@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::11) To MN2PR12MB3023.namprd12.prod.outlook.com
 (2603:10b6:208:c8::26)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3023:EE_|PH8PR12MB7376:EE_
X-MS-Office365-Filtering-Correlation-Id: 87dfa506-1752-47ec-7398-08de8bbec97a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	VdrbHENKDFtLfPu4yFBZQDzohQbVF1BSK4zS79XDa5HgR9ECaVth/KeR4njmE0lv5JfPuUzEy9MiWlajlxTqwfR7jySMOVPmoQNUVooMDqBx/Xs5lg4iVuLAimm5YrVUXIg2QLFrsvou5B7BnDFVDEA0pxCklR9oFXLnaGwLUo+Wgc7C6rN0K4RNO5sx5uFwKaCkaT/vW1bLcavw06lPbG/87F4/ZjPpTf7bDlJq4m/4xfJG2xLpXLVU3MY4lNEyrz39vtdqKsmCQe26cxmHZBl4b4iSV415pOY01KW/uhWsKZ2p7it3wR7YBW8+Ci2OKFx10hCz881hWzAyPrswpjPaoooYENyPYyx2TLrElu+zjwpLtTtwKxO/g3k/ixZM6mUEgpE6yuxmqbFp8T53cqvbrx1X9eClm5J1VHYBSi95Y+r8eLzUVSl1YnFHJJCIRqLDmzzvq8k+GjebkiMGyfzNWNimyKepSp2ZF3E5jPorJ6Rask15Ntf1+vRvkvhJX1irVo11bvL25J5rFEdPUPze72+JkD794MDJPhXINeDgIHwQcDjQPfbDlEZxtqs/ZLl2PSSwNnQvEI1ybHDzWMA/vrzm643G1PGKLKX8+QKjGaLPLo8I4HySY2LrWAoxj24o64mXAumpgxBf0z84CdCtqjN9x/tx8o+JTrjozDMzbWsT/lT5M5KZygltvdRMVFMWx26cOhJgj7Z3JbO7QDUN02MEJ3QCU+JzTbRzNG4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3023.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnE1YkkvTk9sZTBxVitHRWdhNzhZK0o3UDJ0VDdHZEl1amRuelE2WDluWjhH?=
 =?utf-8?B?WmVBQWxJamdjbzJqaWFVM2QvNDk0NkdLNktkUWVCdkhYQUtOcnc1MWl3S2lV?=
 =?utf-8?B?RGM4V1NxUVdNdXRKYm85OCttK29OR0ZPRmcvMVQwZHYxTUlNdysyY2FTckhH?=
 =?utf-8?B?bUdkOURhQ3VTUnZRQ083MHlLVGhtZ3VIc042MVZKMWFGR29QUkpsbnI1RzJ5?=
 =?utf-8?B?WWxMN3pKTXBjM1NQNDFKejZyNmlPeWY3aitFbEl6eGo1WkFOMy9BVkpXQU9U?=
 =?utf-8?B?SG56cldKTU1pdTE4RjFLc1pIMjZZSE43OW1CenhMdFhRYlQ3RHJKK1ZuYVVs?=
 =?utf-8?B?d3lBN2ZjM1lPQys0UVlLWFFVMDZEdG1RN2dtRWkwWlhXMVByMktiTVRTdG16?=
 =?utf-8?B?YkFzQ0VZNTYzQW9leTdsQmFyTlRNSEI5dmlJVkJ6RHdIajdrbEszeXlrKzRs?=
 =?utf-8?B?MlNYZGVLNm5XaEZlU2VUZEI2RktEOUg4cEJVZGIrVy9GNEMwVytSUnRTMk1C?=
 =?utf-8?B?MHArazZnbkc3RDgydEVaSGZ3THdOd2puZVJGV3FCVVNCMk85TWVCcXFVbGlV?=
 =?utf-8?B?U1hmUm5kMWJhSnJIQk9hQ1hkQ09UL3Vva1NkMlVQNU5sYzlMYmczeFJ2bU8w?=
 =?utf-8?B?ZkYyeElITzJnK1V1WHR1THdobnlBZFV1RzdRY3FWRnFIZEVBaFlVeHAySlpY?=
 =?utf-8?B?ZWtLWThZZ1R2TGlwRlg2c20zQUlQRjB6WWNzOGNQc1RWMGRWbDlJYTFEdFY1?=
 =?utf-8?B?elVCSERqVEdScC81T0dwcUplZ1krTnFENjJEckdES3JkWStSeDFyOXpNUnFQ?=
 =?utf-8?B?Qjl2S21FaWRERGxWalc0VmRhblU3M0VReEJMN2dQa2JpWlo1WnN3TEZVVUZ3?=
 =?utf-8?B?eFZWS3ptYlBVa1JsTnJFNFhzY3Y3MmN4My9PU2M1L1dURStwYTNkUUFTc1ly?=
 =?utf-8?B?amVIN1VFNHd1M1BFYnc0dGdKWFlzS2I1YUl0T3J0MGJidldlU1hwaTZHcFFY?=
 =?utf-8?B?K3JCYkZOMEFZa3NvTTdwUGEweHgzNVdxc29HRVVybGdnczdVWXZIL2E3ZVRy?=
 =?utf-8?B?WHpXZWxMNmdNaXpDZWlUc1JVWDRaeGZLT1ZORldXdlFwbDRsYnFRRmpqcWJC?=
 =?utf-8?B?RXJwUWZoWE5TbGhDR1BXQ09xelR0TEdIcWI2c3hNRVVjY3ZTYmJobFp6VG5W?=
 =?utf-8?B?ak9aaXZXaDFmaktRSXZjWE83dkdLTm04R1JwVmVwamY0K3RjZ1JUb3Q4U3Fy?=
 =?utf-8?B?YmY0SmtscE9JTURUQkFIR3RxbU1qdWhCbCtVZjhRU0pKOEhPM04vSzFTak96?=
 =?utf-8?B?WWtKSTUwWmRRT2Z2a3pFVXdDYmN3S3gzTHNJc1lVZytiNUorYzlubml0Umh1?=
 =?utf-8?B?M0VzanB5WVVvRDhUM2FuVGN0QzdhaU5UV2pCUHN6bkkrWUo4a0ptb0VKUmY1?=
 =?utf-8?B?SFJzcEsrUDNuL3lkeDM2RXdlZkVmWFYyKzI0TVFucFM1TDZkZ0IzQmFhSWdj?=
 =?utf-8?B?OGwxRm1HeEd1WmU4NkVMNS93UDdweVV4WlhrakVHZ2N6SGxTa25FcHVyRnlw?=
 =?utf-8?B?NHE1M3REbGwzLzZWWlZ3eEZoMml6Y3hoWUthb3dVblR0UWFXZTJlaW84VTN1?=
 =?utf-8?B?dE9aMmdqRVhyZHN5OE1Fa0w0N200MnMvNlFEbW9HakVud204MVRmMU1SMzdH?=
 =?utf-8?B?NmhNR0lXQVRMK3h0ZVhhSURlQkk4Skd1dXFMMjhPK0NGMDdLK0JXVlVPVERG?=
 =?utf-8?B?Zk1hNVRqWElodldnMXoxRy9FOEV5WVRZdXh6clNsdFJPeTlTQ01CSGoyMTRU?=
 =?utf-8?B?MXNiNkhzRXpsNUNNb0RHZGpsL3h6WjdTalB6L3RVNmtrdjRqdGptNnVuTmhr?=
 =?utf-8?B?bmJtSi93SVRNUG92SmhjMHdwRlpNTVhjRHQ2QzZsRHplRzB6V0J4SWFHOENU?=
 =?utf-8?B?UUVMTW41NUtSU2VLYmc2cWQ2VUEzbDZBRHBVdUZqN0NVNUJMMGsvOFV2N1hh?=
 =?utf-8?B?WitNbFNTQ3FSSXRMVkVicERJWldUVFRCbHZiNzFzYjdEUE5FZ2xST0Z1bEVO?=
 =?utf-8?B?ZXFIWXhQQWJzRzFFY3gxYVU5ek5ndE1JaHcrU2czWEZEbk5UTXRqUTRVOUtr?=
 =?utf-8?B?WGlrMDlqNGYrcTBlUUZreHVDbmNLQVZrQVpWSDBNc21sckNLbmNXcXp3VG5G?=
 =?utf-8?B?dzJiNktIb05PamVZZVQ3Q05XQW54OUtGN0R5a3ZJdEhXYTdhMVE2eHlUSTZE?=
 =?utf-8?B?UFlGMnFZY0ppWDFNUGtWMTdwRkFpSXd2bldrYVo0N29FSldnUkx5Z1BleXNN?=
 =?utf-8?B?Sm9nS1kzTnZxbGQ2M2s5Y0N0THN3UDdPL0NHVEs4U0pPM1htcytjdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87dfa506-1752-47ec-7398-08de8bbec97a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3023.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 05:07:47.7529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cAoYuY7nJjATYZs1Y/p7tP5s/Ar7V+JIPYDDmQZQ9S5BfvF055TmMrxQtpwQFPvkrIEDIkRpSz0aYrNNJcdeAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7376


On 3/24/2026 5:03 PM, Guenter Roeck wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On 3/24/26 03:36, Gupta, Akshay wrote:
>> On 3/23/2026 7:45 PM, Guenter Roeck wrote:
>>> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>>>
>>>
>>> On 3/23/26 04:08, Akshay Gupta wrote:
>>>> From: Prathima <Prathima.Lk@amd.com>
>>>>
>>>> Move SBTSI core functionality out of the hwmon-only path and into
>>>> drivers/misc/amd-sbi so it can be reused by non-hwmon consumers.
>>>>
>>>> This split prepares the driver for additional interfaces while keeping
>>>> hwmon support as an optional layer on top of common SBTSI core logic.
>>>>
>>> This moves the driver out of hwmon space into misc/amd-sbi which,
>>> in my opinion, is completely unnecessary to accomplish the stated goals.
>>>
>>> I assume this is to be able to make changes which do not follow
>>> the hwmon ABI and/or to bypass hwmon subsystem review, similar
>>> to what has been done by others.
>>>
>>> Obviously, I think this is a bad idea. I won't give it a NACK,
>>> but I won't approve (nor review) it either.
>>>
>>> Guenter
>> Hi Guenter,
>>
>> Thank you for your quick response.
>>
>> At present, TSI supports a range of functionalities that cannot be exposed through hwmon. Additionally, a new protocol leveraging the TSI endpoint in hardware has been introduced, which, to our understanding, cannot be accommodated within the hwmon subsystem.
>>
>> Since we already support the RMI interface via misc/amd-sbi, we believe this remains the appropriate place to continue AMD's out-of-band support.
>>
>> I will update the commit message and cover letter to clearly articulate the rationale behind this change.
>>
>> Thank you
>>
> That is neither a reason or an argument for moving _hwmon_ part of the code
> out of the hwmon subsystem.
Following feedback from the Greg and MFD subsystem maintainers, we 
introduced an sb-rmi driver under misc/ that calls 
devm_hwmon_device_register_with_info(). We are considering the same 
approach for the sb-tsi driver. Would you recommend a more suitable 
alternative?
>
> FWIW, your patch series removes a lot of error handling code. Sashiko has
> a field day with it.
>
> Guenter
Thank you for the feedback. I will review and address this in the next 
version.
>
