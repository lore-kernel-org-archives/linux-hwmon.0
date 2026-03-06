Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazhn15011020.outbound.protection.outlook.com [52.102.139.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644F536680B;
	Fri,  6 Mar 2026 16:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.139.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772814839; cv=fail; b=KKyH8V4uVYxTi1Eq7jtfOYFBuCfvRLHe8Qo/c7h7lwQbvOKRq+9C7+lRtDdsgl73pA7kEurXVNKZ3I5dw+fdAWDioYrBeZ9VWFqDIqJZe/2+oxTK90DbM4h3jvLh/bMR3gNVafTiLPRIvMw8dgpd9D7nvVEFJzSVNo//38plFnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772814839; c=relaxed/simple;
	bh=UAL8S4JD7twq8e4LnonGA/+damFBG3vqiIqLryp6xLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Bx1hRtPcriv2M5HYIZ8CNxulXTiCRuuipy8ShqB7dFguHS08DjWzlOHm6PKGgV8p8vIXsJdH3XQNRxEbNYc1bbqoFwnqM1fNA1bm13hIxegwPnkbXZi6DOUigW6Eu3JUCwZ777t8OvmJD6+ZDpLB5HXbTNLNZ8F13TKuyT11hYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=pHy2Dqiv; arc=fail smtp.client-ip=52.102.139.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pHy2Dqiv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rppUmihPGK+jNczKkjgTcPV3jPXwiAmR3AadC0VO9p8LH/18GmPopEmoTPXouC3LsJ8tXH7lX75s/CmQHKdN6+sI9PEWK4h3JS1xpCVoT9maMkh5LTbMs1pA4fFhpoyea6hKANcwaNThq2tKYPZQfjxcrd+iq6DIECSQxDlaKUja1s0oZPYLwZMg3gG+4voc41god5rmrLG3PjH4n4C+2ijksdkYMbHVhuSjL5k/jneVTfzEyq5It0NevwHGjXxuK7Hf27brJhA5JqyDgS0stnsOtpa1kxrp2uE1xx3PDbXJbaui/gqGy7VktR3l8tF0BPEnqfCJK4IQTXTHoEVosw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ry1bL6o1qBCriZGX0SURqhBrjqHrGvSNtDogmmSDNQM=;
 b=hJdopH5Yemm9M8luMco/zbCP5JgKqbVjee53ppZq3Rdqj0oWWbFfLQ80gXmoLW27aFwaCd1AaPYu4yy6lAHTQbXNjtzAQv5B8GauXuQRIbkEJwx36Fqp2qeOvGYb1mLJk+VnzyJQL03YDfQWY07sO7qwWHWg2OrYnShw2incA+nB7lAoJaI73jgzPnYVOkUdBfgHx4liPxbkVzlCMF+aajCXIYvCKkF7LLO30CjGJjKhRi1a9BYw/gEru9oJ0kjT/CrITRisagyEKNZAshCBVc/NHN0AfHhK4rpPMY8/fM6cr7skzodDP8Dw3Gl4tuprJaFl82pMX3iJ1BDuw/JoBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ry1bL6o1qBCriZGX0SURqhBrjqHrGvSNtDogmmSDNQM=;
 b=pHy2DqivRFYbERNiGBpFCj+GVSBVuA0Ki13IlXs7oNXdUU7KECDk9JS7VO38T99RiDJcQ71qCJIWeCFPLDWWHwd1iF5g87NACWVmfpEQt348sCzX30EG3aa+iWNAvuvm+v2xu/HMHF32TYNWCNOaKhw6TRoS5Ru5Q1NwSgX/4jI=
Received: from BN9PR03CA0057.namprd03.prod.outlook.com (2603:10b6:408:fb::32)
 by IA3PR10MB8017.namprd10.prod.outlook.com (2603:10b6:208:512::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 16:33:55 +0000
Received: from BN1PEPF00004684.namprd03.prod.outlook.com
 (2603:10b6:408:fb:cafe::78) by BN9PR03CA0057.outlook.office365.com
 (2603:10b6:408:fb::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.19 via Frontend Transport; Fri,
 6 Mar 2026 16:33:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00004684.mail.protection.outlook.com (10.167.243.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 16:33:55 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 10:33:53 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 10:33:53 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 10:33:53 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 626GXrZT4128503;
	Fri, 6 Mar 2026 10:33:53 -0600
Message-ID: <0788ea03-a11b-4a84-b0db-5cd891962385@ti.com>
Date: Fri, 6 Mar 2026 10:33:52 -0600
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] hwmon: (pmbus/bel-pfe) Remove use of i2c_match_id()
To: Guenter Roeck <linux@roeck-us.net>
CC: Chiang Brian <chiang.brian@inventec.com>, Erick Karanja
	<karanja99erick@gmail.com>, Grant Peltier <grantpeltier93@gmail.com>, "Jeff
 Lin" <jefflin994697@gmail.com>, Cherrence Sarip <cherrence.sarip@analog.com>,
	Kim Seer Paller <kimseer.paller@analog.com>, Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>, <linux-hwmon@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260305195642.830695-1-afd@ti.com>
 <20260305195642.830695-2-afd@ti.com>
 <a39c4e55-ca0f-48cf-a3f5-fe678e23467e@roeck-us.net>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <a39c4e55-ca0f-48cf-a3f5-fe678e23467e@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004684:EE_|IA3PR10MB8017:EE_
X-MS-Office365-Filtering-Correlation-Id: c32abcf9-81e4-4d5c-e265-08de7b9e28b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|34020700016|36860700016|82310400026|12100799066;
X-Microsoft-Antispam-Message-Info:
	pfn9Yslu/kTuxs/G5AxYfnnTPM+ikHehRPyWDHpZYuljc+FTtKrzUiyH72SMkyizOtmnedIntSzzorlQK/OK/wbO4KQKxc3iLaJaMqfFIufuS09ux7Zy173lLCX24+A6AljwHwPU+e49yy63OVtj2zAEccJPBORdXha58lpd9x1B3PC1K/2BenWMhCOjTmR+4Wbz65h8PCXuf6wzuUA2NjnmRTcxtTj82+DWiP4jQfYiXQ1ARgYRM86WWyAkD34C4V+pufSXPWpjzjmz+gdMGwpjF8ZYNuKaR4u0CGk48O20vshjazoc92fznljFrIi6NLsk9tY6Sr9QR/n9W06SalT3IiuacqkYmVQNerjRuQ23d+J7XBc8mTValX1Du1F0TiO/YmYm73dKFm4au4czw8zOg7rO3MSsWpb5A8b/vBHVwIy9yVyAX4tct9Bz9wkEmMVpm5TwXUXxTTGR+4hKHS0dqAztD0ZVqaUMNMlqnaXROUL5AgJpnM636Fgkp6+/Y2rOZs2vd35WRScSjfqiHKnwD7AZXBZ7pvi+fJanKKwrCu5zQ261Bd7rPfSsvzPwmq6Hyj5tYKeDAfAElwvvS9ID5pgOymeEziWSh5gNZ3tHK730VxKIrbLp3tiSjG5HYGY6SpnOvRnB2u2uSAoTntFM/6T0GWuZhP1hUBt306vBfskOzIcJChs0RRyrRa1x0C8lAyUQX2Sma/+nbQ5Uh1FxiCNW4zXuFhYPY7kErvjPiMsrruYFMsl1tLqyLmk5JYx8KSig4l5pomAIOol4Lg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(34020700016)(36860700016)(82310400026)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AQ6yoY6qoNc0IFRvjRgy0JpIbME3rBszF8+4xL53EHZ6X/VOOFrRXlA4jvm3urDdRUenvWnoiVjDeyRqzdcgShf79dTSjHPG35bfU5vKQ3lPbNKrx7k92bUlsPnLF0jGQ6DtqNb+p4Scyej/i7QmzwfhXkYoNIiWcTDB2nAChnzjuVoTKdr5t0Vt+kOE1bTrcPlaTubEoSGBr92bs91SqIQMAgR4a5rGJaM6I37Xjv+HuxmN0eRZJ+ukzcRTMvl1SWLBPV7ZtR09oszwEmf8p7pbxaJlieDehbtm6T4C0jnEVyGB05EeTlcgnPosVOg8CRieAcRMa3q5tC0Vz023Ho+HGlm3hL+NqlSseYDp1M3AcJklNpk8Y37lbZ925fbDXMOgvl/MimhCWwr9FAPYZC/TNcga3iTi41jsvfAi6a7XaPPetMB774Q0hJyN1KyP
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 16:33:55.0242
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c32abcf9-81e4-4d5c-e265-08de7b9e28b7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004684.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8017

On 3/6/26 10:16 AM, Guenter Roeck wrote:
> On Thu, Mar 05, 2026 at 01:56:32PM -0600, Andrew Davis wrote:
>> The function i2c_match_id() is used to fetch the matching ID from
>> the i2c_device_id table. This is often used to then retrieve the
>> matching driver_data. This can be done in one step with the helper
>> i2c_get_match_data().
>>
>> This helper has a couple other benefits:
>>   * It doesn't need the i2c_device_id passed in so we do not need
>>     to have that forward declared, allowing us to remove those or
>>     move the i2c_device_id table down to its more natural spot
>>     with the other module info.
>>   * It also checks for device match data, which allows for OF and
>>     ACPI based probing. That means we do not have to manually check
>>     those first and can remove those checks.
> 
> The above seem to be boilerplates, not matching the actual patches.
> 
> AI review says:
> 
>    This isn't a bug, but this description is inaccurate for this specific driver.
>    Looking at the code before this commit, there were no manual checks for OF or
>    ACPI match data (like of_match_device or acpi_match_device) in
>    pfe_pmbus_probe(). The driver only ever relied on i2c_match_id().
>    Could the commit message be updated to avoid claiming it removes manual
>    OF/ACPI checks from this specific driver?
> 
> Similar feedback applies to most of the patches in this series. Please resend
> the series and drop inaccurate information from the commit descriptions.
> 

Yes, this one superset commit message was used for all the patches.
I'll go though and manually trim out the parts that are not relevant
for each given patch.

Thanks,
Andrew

> Thanks,
> Guenter
> 
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   drivers/hwmon/pmbus/bel-pfe.c | 5 +----
>>   1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/drivers/hwmon/pmbus/bel-pfe.c b/drivers/hwmon/pmbus/bel-pfe.c
>> index ddf9d9a2958c4..6499556f735b4 100644
>> --- a/drivers/hwmon/pmbus/bel-pfe.c
>> +++ b/drivers/hwmon/pmbus/bel-pfe.c
>> @@ -88,13 +88,10 @@ static struct pmbus_driver_info pfe_driver_info[] = {
>>   	},
>>   };
>>   
>> -static const struct i2c_device_id pfe_device_id[];
>> -
>>   static int pfe_pmbus_probe(struct i2c_client *client)
>>   {
>> -	int model;
>> +	int model = (uintptr_t)i2c_get_match_data(client);
>>   
>> -	model = (int)i2c_match_id(pfe_device_id, client)->driver_data;
>>   	client->dev.platform_data = &pfe_plat_data;
>>   
>>   	/*
>> -- 
>> 2.39.2
>>

