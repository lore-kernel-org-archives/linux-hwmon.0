Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012052.outbound.protection.outlook.com [40.93.195.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFCC35CB81;
	Tue, 24 Mar 2026 10:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774348626; cv=fail; b=orvQik9WKf9Cl9w8ANj7jCrVHkgRyEXqn9RvecrfiLCwQlqqGW893KhMLAsyEsYcjnFCbTOt6R8pUUkVwEiuuMo0++igdLuiThmj7cBMmlhfV7E/y565lPW9Io1WCwtdYhawo+pfSyMNOFiH/In8qJrp981ma/YslEWwUA9HwxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774348626; c=relaxed/simple;
	bh=PAWRbdFli7Bp9uPmL06aaDc8SGcKLNENgeJENr5UCoQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hC7HZ8q1pr6Xq/vJ6LbKpYxKuWU0+jYsbJTGPKc6njSpu0j3WMtOSJb4EHrPk7q90omHhr5uYjsKEy7cyXgJhRAnRqKIC8mzGQVXNavbOVdVdURxFxUFeeqSrDt6FAuU4buJGGGzqkefR4GBBW9a6KaXynrzz/I29Rnj3stDM6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Cm9IUMOm; arc=fail smtp.client-ip=40.93.195.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Cm9IUMOm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oI2ljZMiOaxBwJzp0jk4554nh/ZUTkWfZAoQX4RR83F7gFhz/22pktWxGwKh4xbYGVQmgAYGO5yBcrAz5snglryPVooLmOqB/4VUFXXkipwJfbEPTUZM64NUGYfdSf5yQWnb623Up0TrtwLmOtbG/l8XMx3YwsfUxrXBuL1/J/qr7E92eJKhDVFMtKLkJ9sddhhxNXeOkaW/H2cG2w3csHm4KW4wxGEm2Y4KwlL1Q17IqLMntYEOTq2eD/rq2rBZiyo9BRKUu4lEAH4rMj+tpU4rCByT5IUhNrMbxU+bkV0gyVP+I6/cI9mSQlIf4BDMQZz0OaOB/aYywCnxAQl7Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Vk+/vBDHo/28m8vVyi2feTWF16pdYevK7hNqJLpeJ0=;
 b=gpJD2q1rnX8vLTP8jgcBr3g/5g473AU2J+emnK9aTk0ReEGl1riX68Dxq81A9yKLwldPlE5OTc+2uYCGQhxdyoJQEMj1mheIVpcEBejtkQObTuos4TpwZN8bDzY2BvbMz6wwH4WBUX0dyz/fYK1UajVnMR3Kq7Mt+cfwleqRbKaZsCACB/gsqACTDDSwsO/gKTrbeaTMLwAFlLB95qW/JdEEcygvQqoJ2VhZKk3A82gyqOrEjoAZmIkrMtDkPxHHlTk7hVy/kKtwkMwmnngnwY5/OAxQ8vjO3OXDsbCqWsEcuNmw4JZPZsr/QtG2oTh707b5cQWve3HGAtKWQs7fZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Vk+/vBDHo/28m8vVyi2feTWF16pdYevK7hNqJLpeJ0=;
 b=Cm9IUMOm8VnBGMnq+qEiP4SonhKwtyw2F574v6S3AwDiE7d5OpJ0KsrjnbHTyBrA02kOsEujZM2/Caiai3Mf+62PBHHad9veguk6EiGyuSI1jVmVUpzxLELe18PtmV1ie3B+m4MWJ/XR9HSFfxUXUcNAqDBeIn0rX3FJCXrgrWE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3023.namprd12.prod.outlook.com (2603:10b6:208:c8::26)
 by SA1PR12MB6823.namprd12.prod.outlook.com (2603:10b6:806:25e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 10:37:01 +0000
Received: from MN2PR12MB3023.namprd12.prod.outlook.com
 ([fe80::dc22:f915:3ddd:11fa]) by MN2PR12MB3023.namprd12.prod.outlook.com
 ([fe80::dc22:f915:3ddd:11fa%7]) with mapi id 15.20.9745.012; Tue, 24 Mar 2026
 10:37:01 +0000
Message-ID: <d0ed96aa-529d-42fb-a680-917c325998ee@amd.com>
Date: Tue, 24 Mar 2026 16:06:47 +0530
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
Content-Language: en-US
From: "Gupta, Akshay" <Akshay.Gupta@amd.com>
In-Reply-To: <86ec222b-d252-4586-a1cc-2a7a5674e1b4@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0125.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b2::7) To MN2PR12MB3023.namprd12.prod.outlook.com
 (2603:10b6:208:c8::26)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3023:EE_|SA1PR12MB6823:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cd3349d-9c11-471b-a6b3-08de89914836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	mayxu3jtmOM6T7Fw6Bx9JBorsbBQsFTkX9fMUk898ieGsDNVQ+rjIjmwz+ywX9MqACRiz7MlnuMqk3vlY+roNrW4OqUoCX75/wc2dKjwQM7xB0skoIGVx3sxsh46bujSnJeIXSjFp9GhxtcSXRKYVWThaAVhv700Jo22onaKlEH9GUgx+9uC4WXJFNLanqL8C/swJ5pFy3cGaLE4coNmc5ypePi45VAarvIWrqsUtFFnCnJFxqrBdeEnwyFx6M4h59fSusKyOYs7nT8juu0L8QTul3EYHxYTVGq3hNVqwcjczG6PrTsh/5chXW9aifZERUtxaq0z2z7iP11uCGH50SLIesrNgsGHh+CWWXB1PmGIw81KHIbReomPpZc+DsBrwPDAvhi78G0RfzanynU7LYix/Na5OAcE9wrHi0iaaG0FuTA67/I21Dkq/wqHes0acWdn7xx3Fry4/6kmpZpRBnblRMt6hVeo1h+Ewwm7kPnYjNHxAoJPv5byNZ7IA8mFovA9g6dMm3QpkNZeC7F2zonrJeBhPoO6PlxVHAqwmELdiapz1yplEhm4b2mB5ih0zARqTnnbD5fnW3PPK774P0IpyUHOaeM4EjmA6PEg7UIV8DH+uQkQtltdy7ZwnXGGddQo0cKiIyO+BStxuT+l3WnJkr+JEajRIsDUMPI4yhOtQOvszhlrSOKtKS8N3YHu5GLTziVxrE8qJjl49/XVupCd0GO90vn6/LKZpgt09Vg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3023.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzBPK3dXZXI2MW5LRmlNeWtMY1BMMjlkcWdLczRhdHZ4M1R6MGV6SjBSbktx?=
 =?utf-8?B?bEVUSUpZdTVpbklLVytpQU9jUjhhcWlOWTRHWjkwL2h5b25RT28zVmRNWnU2?=
 =?utf-8?B?a3J3RWJKdUNoYWYxLzhvUjRMejhNUW40UTFhT0N0ZnhaMTZqcEhsb0svSkd0?=
 =?utf-8?B?amVxTkhPT0d4aTlvSlJ6RDZ2ZGZmanFaZkkwZld1NlZpeVZCNlN1dFpuZHBm?=
 =?utf-8?B?VGlGa2tvVDBzRmNET1I5bTRVUjVYU3JQNHRqbzJDajhvS0tGM01EWXZ1dTYr?=
 =?utf-8?B?dzlIM1ZBVUk4ZU9lTTh1RWJvaDZKSy82ZFZhaU5uQU00NzE3b1ZWYkVaMGJM?=
 =?utf-8?B?M2I1a2hvQkVPNXdmZUVoL1VDY2I0SkNLbm83Rmt5Tmtud0lBaEMzNmp2bWFM?=
 =?utf-8?B?clh1bmtXamw5WFU2L1JxbmJ5VUxJbFVrN2k2Z2gxVEsxSXp1ZFNUSzZTY0NO?=
 =?utf-8?B?Z3Zyd1JEUGZ1a3dkWjB4eTFwSTZLdGhNd2w5dlZkWGJDOThCMWY0ajh0OS9J?=
 =?utf-8?B?ZzYwWUZaRHNLN0FkQ2NrZVhibDRWbFY0OUhSM2RibEF2WHlZbmdkbkJpV1hK?=
 =?utf-8?B?azlZbGxwMzBpbkpPbXU0MG1qREd3UWxEZkpqc3lhZ212c3FxMk5WVmx6Umpl?=
 =?utf-8?B?bjNDbnBnTlhWeWYxb3cyRHh1OXNsNXpzRnpDaUZMOE1jQ1RIZHpra0lGK1lX?=
 =?utf-8?B?LytweEpDVDdLUk1pZWZNbk5LVmZKcFZsdVZ6YTRQUDh6Nk85dGNJZG5FWHlT?=
 =?utf-8?B?SFBwU1ZmTmJCdUthV1pPUThYWkFMUHc4bjJjbVluU0l4OGFLaG1QU3VjaFNy?=
 =?utf-8?B?TnA3SlptYVUxNFVWeFhJb2dFeFdvSXdsQ0FtVU5UcWYrTFJybWJMOEN4bjhG?=
 =?utf-8?B?ZXJXTlJuMlVvazFKblgzUHFPblhWbjBtbUlnaXl6WDNsVExTMFBXZUk4TjRk?=
 =?utf-8?B?Z0JMY3RibmQwcHVZbEltUUFCODlwejZBNlU3T0dPczE0WDFrZDJOUFY4Qnpt?=
 =?utf-8?B?VjIxREJnb2dJOXdQQWRtNHk3RVZrN0VjYVdNN2VoWjVPTWdheXRRKy82VGhh?=
 =?utf-8?B?Y2k4QzFMOTdXZTUrL2dSMW1vY3dOWnNtVHRCZ2xFaVZNU2J6aGpQNmpFWExK?=
 =?utf-8?B?bTZ2ZWQ4Mmkya3N5Q3Qzb1dyVnZBSG9USXEvZ0xlSVI0d0QrUXMxMDE4dzEy?=
 =?utf-8?B?YkV3UWo0djg1eUlieUtSMVp4V0NZWm90OVlITzl3VWMxa2x6djFWOGIycmdQ?=
 =?utf-8?B?MUt4YkJHUDd0NmU4Umh6OXNYRjkrRlFyTHlFbEhENng1L2s3aG9MSU9aTkxz?=
 =?utf-8?B?ZXp3ZWxaTHg3ZEI4c2E5SzJLODREazlEUDV6V3JwQWpWUE1ubmgrMHlvbkxh?=
 =?utf-8?B?b004R3E5UXM5WmtkT0tRazJ6YktJNTk4ZXNGWXd3YVhrOEJsanlTZWgyWi8y?=
 =?utf-8?B?UUpJckxCSWk3RFlMRFNaaTNFZHpoOHNKUUYwcEdqYU9EeDh6dTVzNFMvRmdz?=
 =?utf-8?B?UmxmUndGZWN0MWk4d0xQcm8waWU2WmpJMmc5RmYxT0FGemFPNTQ4Umo2YzZp?=
 =?utf-8?B?a2hsWktHRTZkb1ByT0REaEdyUW5ha0dQZFM4cXJEdi9weUtpd21IajNDVTlX?=
 =?utf-8?B?MEVuQlRKR3ROeEZGVGhXMmwzdDNxRVREYndQbVNrTElsdHJlaSthMWx3R0VN?=
 =?utf-8?B?YVhxN0VlcjlHQ0JsZlBZSzFyVW5jQXVSVXJJZWkxenY2eGkvTi9JWkQ1UCtE?=
 =?utf-8?B?RWNQa1lzQkVScUZJT01mY1hIeU96V1JmaEViaGQ1NDR4L3FIdFJ5N1dwMGt2?=
 =?utf-8?B?cEpwTHFhcmJQSDlOdERFbHBtTUJDSzd0MFRJNExJSHVFZjk3ZzU1OVRJbTQz?=
 =?utf-8?B?bVpXN2Roc2lKcWdqM1BYMmZTSHduN0hmWE1RVk9PNm90cTdyOGlxVjlVdE5i?=
 =?utf-8?B?WkV6OHJBSUhLcjFjbE9nd0sxeG03WUZRSS9pc1ptZVEzSHROK2hqU0JDWTV2?=
 =?utf-8?B?eDU5VDZpWWhyYTdUVUdhb1pBTGdwZEVOVXQ5ZCtrSkI2a29VTHp2SWorWGtt?=
 =?utf-8?B?SDY0bDRQS1Uwa1Q3a3ZzaU8xTUNZOEthTHBNdTJDNGM2ZlBFMm9BUXJBQUYx?=
 =?utf-8?B?OVA2NDZoSmlBbFNjTkpFU0FzVVpwREJTT0gyalZnTXZLcjJ0dGEzMXJvcXF4?=
 =?utf-8?B?ajdzUm1LSGZ1SGNFd3Vxc3Z0MUQ0MGlRb3l4My9lYWJSMm0yU0JZWFExWGNV?=
 =?utf-8?B?b2JwNnhrTzF6RVRTSGZkWVA5SWNuNzZwOVhpUW9GZmpxTWpHZVVUa2hkQ0J3?=
 =?utf-8?B?RnZCc0dQRnJLcGFGdlZ1S1pNZFY0T2ptc1VqV3FqNnczM2RqUXVydz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cd3349d-9c11-471b-a6b3-08de89914836
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3023.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 10:37:01.1706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Q1GrAUTPUaJdG2OjPVIS8EW6MNsOkT8zCxiSEV1nDIY3UVBhyQvxEC1feDtvfcB6onGyg3cRQO1/cNegd94kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6823


On 3/23/2026 7:45 PM, Guenter Roeck wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On 3/23/26 04:08, Akshay Gupta wrote:
>> From: Prathima <Prathima.Lk@amd.com>
>>
>> Move SBTSI core functionality out of the hwmon-only path and into
>> drivers/misc/amd-sbi so it can be reused by non-hwmon consumers.
>>
>> This split prepares the driver for additional interfaces while keeping
>> hwmon support as an optional layer on top of common SBTSI core logic.
>>
> This moves the driver out of hwmon space into misc/amd-sbi which,
> in my opinion, is completely unnecessary to accomplish the stated goals.
>
> I assume this is to be able to make changes which do not follow
> the hwmon ABI and/or to bypass hwmon subsystem review, similar
> to what has been done by others.
>
> Obviously, I think this is a bad idea. I won't give it a NACK,
> but I won't approve (nor review) it either.
>
> Guenter

Hi Guenter,

Thank you for your quick response.

At present, TSI supports a range of functionalities that cannot be 
exposed through hwmon. Additionally, a new protocol leveraging the TSI 
endpoint in hardware has been introduced, which, to our understanding, 
cannot be accommodated within the hwmon subsystem.

Since we already support the RMI interface via misc/amd-sbi, we believe 
this remains the appropriate place to continue AMD's out-of-band support.

I will update the commit message and cover letter to clearly articulate 
the rationale behind this change.

Thank you

