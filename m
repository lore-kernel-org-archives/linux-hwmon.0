Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013022.outbound.protection.outlook.com [40.93.201.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8983A8734;
	Tue, 31 Mar 2026 10:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774954011; cv=fail; b=TurVJ0jNzTvI74H0Xz2s1Y6sRhept+09zUovclu5ZiKkZFA+2RfKyb2IyBUSJ37RpVwDkv4iREKAQWC//T4/nX9UqyM46PWA8eUzSaoCH13OukqYhXYeG2qfbFO9nhkXPHBuXTtdZ/xKSxsvyter1Dth8bClAAbFiIEamCO/8jc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774954011; c=relaxed/simple;
	bh=bSGK64hlvYGvdXibX2erL/eWAm7P/Zv11V+AEvkJ8Tw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SLiunWZbiZfKnT8TW/YNFVj+tCmmQOzi+Rle9T6g48r8vTrxaPEvxpik4koVvYsnT4LXlba/JxbBepWn3+FIqHVDF+RKYbx8AfC90ZF+UBeGZ8zYVoyZcFtmaDADwwzF5W+aJhSKzQttrJ/gVwaMedpvg7wpyMVDFmB+QFs7cEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XpLzAZ6X; arc=fail smtp.client-ip=40.93.201.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XpLzAZ6X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sBcMhPxa2Yz8zJwN/cIFuIS4YZx4WF1HKdBz9x708XRkKMOvK1zSVp5gLMiFPkNjPtD4bR+wHGnDeqj8691qL6k77XpErslc9F9ImNMB2SbNrmiGPy+FHFjNT668ouHAlDBHNyplCjovBK2xUVSrIruiqYvEInLUn3kU4EXmFyrAd3ZlgcBcZf1qbDNtla5zQ9IBByfcTsPGkk5rF6G7awNzD0emHu7TvG0yQs8zxOeHbEW4NbPk4seXCl7XNamsU5xXWCpvLCU+0UddpAbkGj7ucW/sdhokgIdljq9R1nKBcKi2zQOCMK45twKrZoKQeIFNBos+hJFXbaBJsu7qEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQOAbcqrQ3zb79vNv/xOkd3Vv1RqIoAzY2/u8parrVY=;
 b=v1ScaO9OJWUy7AffMwQdXn6/xcHR2MQJ5xKQB6neb2ZMYUOFnkl0uFPrw5UF73B0mRjK1qZx8z5jKhGyorqdK0jEZk54KJNqwZ51q0aicDanLkrPBt0QS10Jb6ncHOsJvB+ZqbB32razowIyBnjMCbnQghJXR5pebBfXxVJAARZAGiaBzw0D26YAtPYsHy/t7wv3HrIOAspsFDgcU+941PRjNf072qKpCoE4kVgRzANNEwk5L94pgJuV+shfsl6AwXBxe+/4mt2PNRcuigy94V6frBMKPkoplpuC80BDbpGnLDYRZ3JLXOQbJniVwF1Vphsuu5CIV7uBVUX5GsqCHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQOAbcqrQ3zb79vNv/xOkd3Vv1RqIoAzY2/u8parrVY=;
 b=XpLzAZ6XM7nEmBpZJ2HsDkSbxCTOHco2vzcAHHTMaAdCrxpvT2w9BYWWNNMqpBgjxOsu0fPeYIYAX6p+5t95PY9JBWdLmD2AOo39dE2ltlT1FSdcx0cGFkBpH+DCOOVH7f7xH+FJ6ZhAqUlfgQSTtPkWW74tYhQcuFhynuQnbhc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3023.namprd12.prod.outlook.com (2603:10b6:208:c8::26)
 by SA1PR12MB6919.namprd12.prod.outlook.com (2603:10b6:806:24e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 10:46:45 +0000
Received: from MN2PR12MB3023.namprd12.prod.outlook.com
 ([fe80::dc22:f915:3ddd:11fa]) by MN2PR12MB3023.namprd12.prod.outlook.com
 ([fe80::dc22:f915:3ddd:11fa%7]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 10:46:45 +0000
Message-ID: <8eda258f-1a56-426e-bfd4-22983acae5ab@amd.com>
Date: Tue, 31 Mar 2026 16:16:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/6] docs: misc: amd-sbi: Document SBTSI userspace
 interface
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 linux@roeck-us.net, arnd@arndb.de, Prathima.Lk@amd.com,
 naveenkrishna.chatradhi@amd.com, Anand.Umarji@amd.com,
 linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org, kunyi@google.com
References: <20260323110811.2898997-1-Akshay.Gupta@amd.com>
 <20260323110811.2898997-7-Akshay.Gupta@amd.com>
 <2026032753-contently-overfeed-5872@gregkh>
Content-Language: en-US
From: "Gupta, Akshay" <Akshay.Gupta@amd.com>
In-Reply-To: <2026032753-contently-overfeed-5872@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0085.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::16) To MN2PR12MB3023.namprd12.prod.outlook.com
 (2603:10b6:208:c8::26)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3023:EE_|SA1PR12MB6919:EE_
X-MS-Office365-Filtering-Correlation-Id: 6938a898-6603-4c93-9461-08de8f12cd5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Eq/97iC8Asu22ARbWt8XOT2BrmGRk4PAI+0rDEqgZ+/IG/Aj8g/epg44vrjpit4j72oJD1UhLH9Oaiv2e9Pew6yrqCvXbDvrjIZoBJYc5oxmFh3V5620kA+QJcRC4eJUGh2NwE+3KG5GQgU1DOIqbvwXCJaQGyaO7UqCbkiN2DakjU8+YAVg7VSNDluZTQKL9O41yIz73Jh2Opbf7j2nWzI47Yat7TazN2RmxteDDpl9FWe8vkIs/+Qscxtym8eyDebQwNgwQQ3GldCqCD9b00rGfbclUD032jGddEoa3J9y9I2K+XteB0RiCLAbB5mddDOccxNCVOohJPpBP8EMhukB2zV/znjNJrso5iYn8PZsp2Tl5Ud3l8aZXcbw5v9rB+wGXKKhATPRPmzLdZgKoVo8KsPqkXpQsohQxSKZ62dw6Y2HuELOZ5uAFmDHmQk0+UtVhNNs0DGkh+loV8ghPgwKeRoKCAZ/DgPsc7J0RRW4jsMRJy2TeOFWOSFe3nfhfrTh57gPbXUm0Ne+LSvXAeNRHvOgqU0xK7uyXSaFrveA8N1KxYDbVYEPBEdAPOAkOjqsn94UY1Vpk3wY6ckvx340mbOUdIT5nvcmnwpBKEcEw9qGITkHEEJ/oaR1r9a6maoJwnXOi9QHWn77QMi2Ds0KehBLc5uZYrl8buHm9Gmr0Icgv6vSX5L2Y0qdSYvDZpIfoVz58SmChIsHdUDbEIX1+S+Ft1Rxi5H6s+O/8Rw2zMKgcCm8OZzwuMFwPtdf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3023.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVRuRCt5endZVDdSMUFOeGVIS0ZXd1dyVExXU09ZdDlFQmlsVDM4UEFwNHhy?=
 =?utf-8?B?SG0vcHk3VUJUaUlvamlGYmZQVjhwZHI5Ni9iYldZbEFHWGo3WWVrbXRRNkJv?=
 =?utf-8?B?N0o2bFlmdmdweWxlS1hBcmt3a2Vkd0pqcmc4V0ZlVjlNcldzK3dSd1NHamNw?=
 =?utf-8?B?UjR5cHRHSjJnaVdvQitLNDQvYS8wRUFwR1pXUHFOK1ZHV0ZNa05VY2FvWGhv?=
 =?utf-8?B?UW1MMXdMVDNpeWZabmVzMWRIYXdkbGlCNnhmNjdEUXBDSFNBSWFHNm5qSEVT?=
 =?utf-8?B?M1VVd24xd0dVajJhYzdpUnNSVlZvZzUwWHF2VTFtbkhwaEpkTW81WDFoS2Vl?=
 =?utf-8?B?N3NWNmJHMURZOHBiRmY3SzRLUEF2WmthTUZCdGVhTlpBdmdPUi9aUlI4VFRK?=
 =?utf-8?B?S2ozQytBWXJpdkVuUXJRb3hEbHZGanFmVjNSMjhiZ1JmNGkwSWkwVjRqency?=
 =?utf-8?B?WFhINlNBMkU3U3N6K2tMTUdaajhCd1FJdmVyRTY2QTJINGxianQ4M2hzNDJC?=
 =?utf-8?B?L1MvZmtmMldzbFJ5Qjh3aGVhUVk5bFRidHBsMWdzMDh3TTFPNW1lYmY0WUh1?=
 =?utf-8?B?MnY4YmN2Z1VkOExrb2FpclNpc2NEa244Y292dXNhcGw0MStPWWxCWXl0YUVa?=
 =?utf-8?B?QlJNMXkySTBwT0VkSmx4N0tMNlk5eHdMZmM1cE03YWEwQ0NvTGJIUjJYdXBk?=
 =?utf-8?B?MmQvWWFHcWltWDBWeVVDajdrN20yUGdkYVFZQjRreitHWU1ZdWZkaUM3KzhB?=
 =?utf-8?B?OW43b3JOOUZ1R0hPeGdpZ0U3OXlrcDdhTU9JTlc3VzQ3TmVucVlkNVA0MGNK?=
 =?utf-8?B?SU9FTGdhMjRUQjFaTDhVUHFIdkg4cVZGend6V2JkM3pwWXd0R0pySmlLL05O?=
 =?utf-8?B?cmxyNVkrV20wdzJ1TWhpK2s4L1dzV1dxRm5iTm9DZDl1MlJrSGppVUg2eUd5?=
 =?utf-8?B?L3lTSW03SjZlbGtXWUgwNnFsZy9MREg3OWZVbzJGQWdUSW9ZNEVNNnVxRGFa?=
 =?utf-8?B?MlhFQWc3ZzlibnhmLzZoaWF2aHBBS0JzaHRmSG5oV0lGenZhS3ZKam9SblZr?=
 =?utf-8?B?aTY1eEptQXYzcG90YSs1dmI4VzVJUTJkVXhld2NONTlGb3RRREpYT242ZDJK?=
 =?utf-8?B?T0NXYzBFYjJ5Nk02RHlOSFAwUSswQThJWE9GemRZemtzNk5WSXBaUzZVSENz?=
 =?utf-8?B?NUVnV3FTekVrODRTY3B6TXBIMWl6ekMzdmF3NDlQUTkyTlhKQmtBZlUrRDV3?=
 =?utf-8?B?ZnlBUUorR0VmdWpJZ0pQWUhvZDNuQ1dkN3BBY0FrVTlnS2hrNm5DOTF3RWRM?=
 =?utf-8?B?OFZFQTZRdkpOSWgyYjNaYzh3bGxjMGZkWkVBR0kzMzhqdDdtWWVtVjUrQnBy?=
 =?utf-8?B?YkdveUJjMTlHVlBXYmpxeVZyb0pzSHZJYUtGNWRWazhhaGdkdXdmOWJTUmpm?=
 =?utf-8?B?a2VQUUt3WS9uTXVDVGFMdEsrYVEvdWphWmYvWlNsbHo2NGNjL2tydzNLb3lq?=
 =?utf-8?B?TWhLVUE1SzU0dHhlYXBMdERyOCtmazltVTcyZHdqSWdYbkMxUlU5K0VDR1lm?=
 =?utf-8?B?VHZ6S1h3YU9TdVZxNVFvazZXczVlc3dSbUM0R2lkZy9aeWVsV29XdDVEQ0o0?=
 =?utf-8?B?QUp0ejhaTWlsVTBUUWNBWVRQb1dWS3RIRkpjNFhEQW9KZFg0T21CZHFwUklY?=
 =?utf-8?B?UVh4dEt1WStoZWdoOUlOb2tkN0hGa0hSdUZKdG8wOTJmTlZWak11NEpWK1ox?=
 =?utf-8?B?MVdMRmZ1ZzREbHJrb0JsM3lOVUdxVU9hOVlkMHpQNUd6N280a1laM2E1L3VD?=
 =?utf-8?B?elB0NGJ1U09KcUJMYzk0OEJqRWdXV3FCeUZyNW5CU2kwbExNZWRkU0ZaWGl2?=
 =?utf-8?B?QUxwL2JBMzN2aTI3aWtiZmVuMnp3NC9hbUdrMlI4aVE1SEhKWW9nbVFqWWJx?=
 =?utf-8?B?U05GL0ZQb1Zaem0xbGplWkVPWnhCRHZrQ3NNaS8wVXRTdlFyZks2V0RsbmJB?=
 =?utf-8?B?cmUvWFNCU2pSM3FDR0Q4SGZzbmV4WWZlblJKdXJzRmVRdUd6cFFvWFJoeHVj?=
 =?utf-8?B?L1BuZWh2Rm84bHc5Z2ZteXFrbTd6YW9tZDhuZkRJRmxTQWhMeXRwMEJVSXVE?=
 =?utf-8?B?N1YvamQ1WXd4MnZURkQvbzdrdlh5KzBnTTJOc0gvZDgxd2t1ZzlIYTZ2Mm5x?=
 =?utf-8?B?NUQvcUE3MDg4WlhjNDVnbndUeWpTN1VQRjQyN0NKbTRyUS8rR0NXc3Q1clN3?=
 =?utf-8?B?enJmT2VTa0s0dVloZFBhUktsZk9Rbm5RSTBMbmdicjJZMm9TRlM3NE4zalpt?=
 =?utf-8?B?dm5ZOTVrME9rbkw4dUdCOERycmZDZ0RPVDluUzlPajZVMzVRcUlaZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6938a898-6603-4c93-9461-08de8f12cd5c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3023.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 10:46:45.4907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VcHQmKMtE2iRwABNQ22TcuNV8vckAJbvJu3Sn3IEduAi7/te6Bb1XKGpGmmcLo5B9wZ3AbD1B3ZwNywh1VSqKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6919


On 3/27/2026 12:55 PM, Greg KH wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Mon, Mar 23, 2026 at 04:38:11PM +0530, Akshay Gupta wrote:
>> From: Prathima <Prathima.Lk@amd.com>
>>
>> - Document AMD sideband IOCTL description defined
>>    for SBTSI and its usage.
>>    User space C-APIs are made available by esmi_oob_library [1],
>>    which is provided by the E-SMS project [2].
>>
>>    Link: https://github.com/amd/esmi_oob_library [1]
>>    Link: https://www.amd.com/en/developer/e-sms.html [2]
> Ok, nevermind, here's the documentation :)
>
> But it's very tiny, it's not saying what the api actually is.
>
> thanks,
>
> greg k-h

Hi Greg,

Thank you for the feedback, will update the doc in next version with 
details.

