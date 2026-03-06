Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azhn15012028.outbound.protection.outlook.com [52.102.149.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FA02EC0B5;
	Fri,  6 Mar 2026 18:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.149.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772821858; cv=fail; b=MNI/PSgjTZqjrK9vx1GEKGCvlrE4K/mGBfBtwoepgNKPTbLoz1//deadLpuzWye4yaZs2K1yhplc69BPcoKwpHNGcXcE0qdC6PBGjcrR4xH64YfXQj+PQcbCW2MyN/v1Yesm3kyVUGOMGg4vuIoxQvwYDwb9Qb93VGbM1mRM2r8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772821858; c=relaxed/simple;
	bh=qtJyuWM6fCSoljVkj6JQEfOxEy0a80KQeNq7ZlfV0LQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TgOmea+AZ7amG5hTTk3ojCEOdRlhgUgB4Tcgv9rT97HRX2wLFScj4GsKVsir0KKRv2KhTtxHEUseT7kvxoHuNUAeg0XDv7yNVMKN2xkW+7ov83qVwTGb1vk1Za4l9lxD1MAqUOnqxdSmrZVVyXM4KSFfBMU0g1rDgZp6tJo+YcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=b20HJJ0m; arc=fail smtp.client-ip=52.102.149.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="b20HJJ0m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZESJnpTeUUx/bUG29QqTCdyfSgMvPclnEvYU/rv4Xaof7HLDK9jownaJpPclFiVMp0wUx78H/JYABZ3Kx3xL62Ee7Wulh6ELI0DJPJfWmOXUcv8HiQxn5PsWkgmtfoPnOpmguC+/XXP8PEnWUSQmvxhCEd2S+DUrARS7sBB4Z2UIg83wux/K1GMt3JN90N0vp8CKDp6hlVWOYHi5dcxQp4tWFilLk4Hn5LAy9nXCGReXhzqGMLOt5AY+K+rn3VnV5indDhYyYzemBzR3KMLwytAyxc8qPzkH6oEY2XgtjZ8mOAvTUH0mo6y6MR/8Gaa/QOgJ1Gq3Ua7usb+7tygrLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iJuf1Auz7yCLS7fvF28siTkzGcRmhAEFOWQXyE9WiD4=;
 b=LkSZ2nlh6ihLVq8Sh+mKVJSyj2qP0z/MnoGxKLdVhNI7L5o6f42Lu6At1VbLYXJE+WHeBs7AoE5r+sfWiZpQFBxfWu8Y8HM8XfcIry5QOTAgXEpO8yKDlPrYij9D1wBUn++NINTY+UdV4fffY1GSUQvCThy5YGhi+qDy7k3fAw6b/MIqJ2SC+VhPUIKpHufkxxhhV4XXBzOfrqieVQCCPJyUypA5nxTlnhbgfo/pdedtPKNVx9CvwXW6IuDA4s4NxSeaCOsCeqp88N/wCXQ4D7+BM0wz+TYllicwXCG/DUEyV81ip2jky/uSKbA7AnCB6h4W5rTdUZNBmcqW2F9LXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJuf1Auz7yCLS7fvF28siTkzGcRmhAEFOWQXyE9WiD4=;
 b=b20HJJ0mg50nYC5ASDwxJ0v7MeCIGozXkedyV6fbLXgyHLkQIEmNowKecn8zv1deOMu9UPow2VR4DQHP812NVn2elGjUpcRgCBEBQlFfePJ2Ju1Lt1RiKe2pDM/FLj5VDiMqyojKHgBurRJvjjbkq1OKZq5WiDJdXQ4QhG5jVVk=
Received: from BLAPR05CA0005.namprd05.prod.outlook.com (2603:10b6:208:36e::14)
 by DS7PR10MB5973.namprd10.prod.outlook.com (2603:10b6:8:9f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.20; Fri, 6 Mar
 2026 18:30:54 +0000
Received: from BL6PEPF00022575.namprd02.prod.outlook.com
 (2603:10b6:208:36e:cafe::84) by BLAPR05CA0005.outlook.office365.com
 (2603:10b6:208:36e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.19 via Frontend Transport; Fri,
 6 Mar 2026 18:30:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF00022575.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 18:30:53 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 12:30:52 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 12:30:52 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 12:30:52 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 626IUpmA588883;
	Fri, 6 Mar 2026 12:30:52 -0600
Message-ID: <5b09b726-ff5e-4c2e-8b68-29e1ce8e64d6@ti.com>
Date: Fri, 6 Mar 2026 12:30:51 -0600
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] hwmon: (pmbus/ltc2978) Remove use of
 i2c_match_id()
To: Guenter Roeck <linux@roeck-us.net>
CC: Chiang Brian <chiang.brian@inventec.com>, Erick Karanja
	<karanja99erick@gmail.com>, Grant Peltier <grantpeltier93@gmail.com>, "Jeff
 Lin" <jefflin994697@gmail.com>, Cherrence Sarip <cherrence.sarip@analog.com>,
	Kim Seer Paller <kimseer.paller@analog.com>, Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>, <linux-hwmon@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260306171652.951274-1-afd@ti.com>
 <20260306171652.951274-11-afd@ti.com>
 <85d35de0-943d-4efc-925f-d42eae941948@roeck-us.net>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <85d35de0-943d-4efc-925f-d42eae941948@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022575:EE_|DS7PR10MB5973:EE_
X-MS-Office365-Filtering-Correlation-Id: b9698797-3583-4cb9-1dc5-08de7bae7fd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|36860700016|82310400026|7416014|1800799024|376014|12100799066;
X-Microsoft-Antispam-Message-Info:
	lWCLLHxAZOj5v96w0ArB3WXgf0nCYUK2F0N/sjtdwI8b7sx2Zc+/SkPs5FJNy/RUHtjlZOxh4BLoXVPv9SSwU9rPphrmrQA+fTi8odVoCYUeIXWZ2+xkHJcr6CKb3US4wJdeHGMxtii/y2DsUKTKv/QBmm3LPIDFc4RwYGJCObSmPP1hE0+epKbxjAFNpR5rTrdG8/SsP7FhF5wss7CV2v3ePmzxconfrtl+7bEcg03dFhdyKANvl4eBd1TQZMW2WGAhv40f2uWkZWRBgU9cF6D5BNfMGK8Qrmbs6GbYBx/ixfD0hxVcJKsaZlVDji+NTdMk58TfbUZv4q09I9D/5ssw1fIZ0woL8Cr7aGeVr3mR+ZsSu82tz0gT/S46D+0lKOBJTaMgiQRzfsbxilZvwp91hUvzeT1csQiIT2LLvTALcgs+N3Pw8qkbwRh5E2H4WSqKmNagakyHsAqPvY32mgYySQdDgAiOnqM2iWOvae+gmAGGPnyZdC1tfFLyTqacOUevHWPEnq1mP3BpcIokEmf+yyzhX3sO4fKLqXlruvzB22iYLSs2eEWJdaqHQagYURaq31aJIB3SC4x+EGn9Qk554mVSBVfuF5ywgHMV30so3CvALBm6wcS45806jHojA/FKWULIGEgqasW4QlDgD45XWf2AQqLAN81SZAht8gvbBXi0at5uUx3TVIi9AJojImzY8otShcgqjn6xp0LYPnyFUXHVh6a71oUe0VKiiKAmT4/c4niOmFNsfrwyQUOetqsZ0nztsvUtF524EN6WEg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(36860700016)(82310400026)(7416014)(1800799024)(376014)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zkE/rliYq7CzdYHSnyUnTNq4Mn8URqDftjIti3ythWWpkRAJ30r7yXR+qq/33Mv1xSf/R8gnyCUYIVGUMDZgF5zNCUeIFijjtUOD9QoEhgeixK/dXKY1skbhDLYihDUWHuEsX2o7jJjqfgSs8s10M0/ooYrNUIrk6TTCgX9sHIwaWevqdxHxY4CoFCEYLBVNuzpmrjFU+ES13yCWsqBqegwAiheslTQnSG9hvQkgWKl4rm4JYuAeFP8yyisfuly432+kyFlxMmrlQM6ioPK308ObLACRXC8oA35T3hb9ZK6ZwESTTDWhvMUh2CxVw7rssJmUMQtILyp93SD/1sUqzlnHvEH+WnSJlwfDS7PN8o3gSlQcyUpV8N29g1aoEpJJj6z2Np/5QtoUBK/vul+JDt7Esk+hKjdgjxej7HJJoWqSkfzkdONUq6x3N/Q9Szkx
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 18:30:53.1130
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9698797-3583-4cb9-1dc5-08de7bae7fd4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022575.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5973

On 3/6/26 12:10 PM, Guenter Roeck wrote:
> On Fri, Mar 06, 2026 at 11:16:51AM -0600, Andrew Davis wrote:
>> The function i2c_match_id() is used to fetch the matching ID from
>> the i2c_device_id table. This can instead be done with
>> i2c_client_get_device_id(). For this driver functionality should
>> not change. Switch over to remove the last couple users of the
>> i2c_match_id() function from kernel.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   drivers/hwmon/pmbus/ltc2978.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
>> index 8f5be520a15db..d69a5e675e80e 100644
>> --- a/drivers/hwmon/pmbus/ltc2978.c
>> +++ b/drivers/hwmon/pmbus/ltc2978.c
>> @@ -733,7 +733,7 @@ static int ltc2978_probe(struct i2c_client *client)
>>   		return chip_id;
>>   
>>   	data->id = chip_id;
>> -	id = i2c_match_id(ltc2978_id, client);
>> +	id = i2c_client_get_device_id(client);
> 
> AI feedback:
> 
>    Is `id` guaranteed to be non-NULL here?
> 
>    If the device is instantiated via ACPI `PRP0001` or using a fallback DT
>    compatible string where the first compatible string is not in the
>    `ltc2978_id` table, `i2c_client_get_device_id()` will return `NULL`.
>    This leads to a NULL pointer dereference when accessing `id->driver_data`.
> 
>    While this vulnerability existed in the old code with `i2c_match_id()`,
>    adding a NULL check here might be a good idea while the code is being
>    refactored.
> 
> I never know if this is real. Any idea ?
> 

The AI is right on both parts, the second being the important one that
this was preexisting. i2c_match_id() should never return NULL in
practice as we must have matched on something to have gotten probe()'d
in the first place. And for the same reason i2c_client_get_device_id()
shouldn't ever return NULL either. So no change here.

But I see how this would confuse an AI as both functions have a
"return NULL;" statement in them. This problem of returning the matched
ID in-band with returning 0 for errors (which could also be a valid ID)
is one of the motivating reasons for me removing i2c_match_id(). Even
though its replacement has the same issue, once we get everyone over
to the same single API then switching that one API over to something
safer becomes possible.

Andrew

> Thanks,
> Guenter
> 
>>   	if (data->id != id->driver_data)
>>   		dev_warn(&client->dev,
>>   			 "Device mismatch: Configured %s (%d), detected %d\n",
>> -- 
>> 2.39.2
>>

