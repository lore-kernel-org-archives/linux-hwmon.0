Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazhn15011022.outbound.protection.outlook.com [52.102.140.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C6441B374;
	Fri,  6 Mar 2026 17:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.140.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772817174; cv=fail; b=VhU9Xq8kgra4eG3iZFJ3Rlq9+nIAC2g2nLNVHJd9AoSH4xpBhZOHDsE1Yx8iulVZ9TWRWUGCR/Mn4F+f2MHzckuCtaE0Ag8YY4XrwsEsFSkvDmsJShLBsAF9LODawpcK6s4rfUVP0CRK0hG094z7312AcxaaxN5IeWHOXTzSJdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772817174; c=relaxed/simple;
	bh=ZlcExRyl/OMp09+i2mAQ/J9Bi7y93f5J/E4DGUqBF7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tHS//EVqe0IqfGuiD/ruuTOJvSF9UmlkIjr8x2kAJ2Npacb5N/PBXerUeTXSdZi4bnixIxRfR+zuADqSm8EJoIYk0edsEGz/W3RLtTHduCt8DtxwiBcLNxmyhuqmb7KgKsNpo/9dPMDRXM9nby+QIo25d9ab+i6+dBCP+PefIfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=h4tuWnPM; arc=fail smtp.client-ip=52.102.140.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="h4tuWnPM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=muTeIiRaHL3wh20Py66pJ5hJeeBywjCorZd3L7r6Jm/VnfKidyGQEzMQUzD6umFIuK2TwNxjn9B5feeD+FkJavgUwl0ORnj1jSpVuE7bCq7U9/ZpzTiRdtk2Uvk1tr+u1f6dX6yy8nlZRFbc7qLwVx34OtHUs2BJJnWavSCliw49aZE9M/f/4Jb5CemN9oSMI7RSmbci5MZyfMdIKx8vobrQAkL5GBCLGj5BYy5iKKsuQK7KzcHW1IRMvR+Rf0PmLKq9ZHw0Mq3Ynxiu5c9lzRpJ7UNCIbdXG8jIM54m8uBmOwZVHSEC+x8vjPzo91f5GkV5DAITOq2lyQdMK+Y4xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPxAx4VuGL3YW5rN7rj8LQXbTk+4F+eNC5UWZSiqmF4=;
 b=ClQ/k4u3LabcsxMz7rtOpgpYi8WUZVu94tP+TCAa6MOeYubEd5bKLt0LlJV/cOyHdlhGhfaannYUCJ/8poPRztifEmcs4jogjxmWh6+TpjDMvM5O1EHn4LwbVit5orNmdDy20/voUJzbN50gZkzytYlMbzOOgv40Muu9ot3SPGJBdKanOkNuwYk8hQ50uo8OvERYfVrsv7Mx+XzXIw6lGip0K9NQRrelpBIuR1foUr0axO1TFxtWvLZJNK+h0CEBYuVuVDbtfVrvMY5t14rU3j+DCFz4liyzXUs2ABcZZtjFjhHbZZcXxRjCHtyDKmnmFez2Bm3Ag9NjBqT1s1BHEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SPxAx4VuGL3YW5rN7rj8LQXbTk+4F+eNC5UWZSiqmF4=;
 b=h4tuWnPMIG4fkdBN0SYRfq3QujBRDbDwAXosX+3GP2Oe6A4feQoER/97SZGog1pqyRgBVJTsglgAeVoEbU+WnQ3dTt/Gc2lVBJmdrPMGOCREOwWxiBKzUKx4/n4xkf301v0U3bTP8/OlN2gY2gngYDBYEajm59AiU4KX9TfTGXA=
Received: from CY5PR03CA0017.namprd03.prod.outlook.com (2603:10b6:930:8::41)
 by LVUPR10MB997811.namprd10.prod.outlook.com (2603:10b6:408:39e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 17:12:50 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:930:8:cafe::90) by CY5PR03CA0017.outlook.office365.com
 (2603:10b6:930:8::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Fri,
 6 Mar 2026 17:12:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 17:12:50 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 11:12:49 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 11:12:49 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 11:12:49 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 626HCmqN485755;
	Fri, 6 Mar 2026 11:12:49 -0600
Message-ID: <7cd5b9c2-0880-4776-960e-b4923f7759dd@ti.com>
Date: Fri, 6 Mar 2026 11:12:48 -0600
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] hwmon: (pmbus/ibm-cffps) Remove use of
 i2c_match_id()
To: Guenter Roeck <linux@roeck-us.net>
CC: Chiang Brian <chiang.brian@inventec.com>, Erick Karanja
	<karanja99erick@gmail.com>, Grant Peltier <grantpeltier93@gmail.com>, "Jeff
 Lin" <jefflin994697@gmail.com>, Cherrence Sarip <cherrence.sarip@analog.com>,
	Kim Seer Paller <kimseer.paller@analog.com>, Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>, <linux-hwmon@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260305195642.830695-1-afd@ti.com>
 <20260305195642.830695-3-afd@ti.com>
 <4dc0c4b5-12b4-4fdd-b247-13d8c88c8c20@roeck-us.net>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <4dc0c4b5-12b4-4fdd-b247-13d8c88c8c20@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|LVUPR10MB997811:EE_
X-MS-Office365-Filtering-Correlation-Id: affcff33-ba7b-4233-fa59-08de7ba3987b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|34020700016|36860700016|7416014|376014|1800799024|12100799066;
X-Microsoft-Antispam-Message-Info:
	BChNGn8l/eSTSS8d5g/Y3pSofZlc9w80ac0NJs/QnK03X/nDbYMt+PfQ5Mv50g0dXWIP20WoFbzKaZJ69h+Ty3EpGuXS+wy4oPE1ZNoWXkQNsf8EykT/h1ns4Ez7voV3dgwR6Wet4A3Yyd1tab6vS4bIRltaRPh66Gvq4o10hNVKWa3uZLDFXLo/9patL16w4c0bdiflD8Cvn1cxKtjARGCqe8sBe5mwini+ieV0MKfWD/pXczqAulEq8JJwXTd/iPMxzzEJ6+Mut5u5s46FYoUfnXjacsSaD9YCRjT2wSjGPReXXexEZnm8gCjihPYU5GkBhVoBOyG2ynvuqeFmja6heONVCubMzN6JhHBidT1ql1dbxNwoXCdfzRMJeQbNc6VwlHaN99QHzOe80IOKXa+wV8mBjh5su3m6R/0LfTE4DWXgcUSslRcowG8bxW530v33hiaaQXIVT4BDxR/YGBk9UrUjq9MVD/s9qs+XOiRu/sPVlRGORoNXphnyKLYeXCeEqWzU++tzWX3uSvmGqXxWtI1hL0zz26EVHdx5YFbbp0nR5zZEA+R2Q2+zDa7TPrr0icZBwt3j8fJMybkZT2RXkcyThAiId0YU31jjErKOKXTuqUzz3A+uKKFJ1q0AhifEeCvlfc3nuarSRvKPz04Upnf1Am9VfR2ta5oNkDrAiKW30metIIw2GlUaJoCoF5MVt0utHOAlSiub8PAI9BGCJU4HYE+XD53nv8V6kSy/IuKUfIaKmdl3cBFgZI5Nsakec49jzrdx+bav8HIphg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(34020700016)(36860700016)(7416014)(376014)(1800799024)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	u0kDtSr8lCJLr/SvtAJEFlmwFtfx9slS6ict4U5fSQhvuCEyVcFRtUCDky+lIFHVS9NNOgW3CT5wXW/CvskQvWsSsLov1b7bWEoZRtF11/shBDSVAitASzi47OwVn82Ov/jDSVH47Ub+NqZwTREBBSQlq3dD0ALBVctf88gEPAMH0Uj5m8eVdffxqYleRtP2FVfrO0rztCNHm6JxvGG2/3l/pi4S+I9yWVuTWm3HFH4oPUvINzXVgTY1iWAYQVIUz6ZFCFO6W0zNM7GhdpX/TX3YADMpc5yG4gwFsMBk+Zqxe4SrtzV31E9J8Pj/jSYKGIJ8wQa+2jRLKJOfQRwklT3LOhF301ppafKxiNdmCF952Jrr5YNhw6+Z8p9Qe1aeI6ONO1vygveebWzTHzlxO1jZl12ruWBBI4TpqhmMwgIocyFV70y1CvbNCGnxaLov
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 17:12:50.0486
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: affcff33-ba7b-4233-fa59-08de7ba3987b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR10MB997811

On 3/6/26 10:19 AM, Guenter Roeck wrote:
> On Thu, Mar 05, 2026 at 01:56:33PM -0600, Andrew Davis wrote:
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
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   drivers/hwmon/pmbus/ibm-cffps.c | 12 +-----------
>>   1 file changed, 1 insertion(+), 11 deletions(-)
>>
>> diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
>> index d05ef7a968a96..884b17de3b623 100644
>> --- a/drivers/hwmon/pmbus/ibm-cffps.c
>> +++ b/drivers/hwmon/pmbus/ibm-cffps.c
>> @@ -482,19 +482,9 @@ MODULE_DEVICE_TABLE(i2c, ibm_cffps_id);
>>   static int ibm_cffps_probe(struct i2c_client *client)
>>   {
>>   	int i, rc;
>> -	enum versions vs = cffps_unknown;
>> +	enum versions vs = (uintptr_t)i2c_get_match_data(client);
> 
> AI feedback:
> 
>    Does this inadvertently change the fallback behavior for unmatched devices?
> 
>    In the old code, `vs` was initialized to `cffps_unknown` (which is 2). If a
>    device was instantiated manually via sysfs without a matching I2C name, both
>    `md` and `id` would be NULL, and `vs` remained `cffps_unknown`. This
>    correctly triggered the dynamic version detection logic using
>    `CFFPS_CCIN_CMD`.
> 
>    With the new code, if `i2c_get_match_data()` doesn't find a match, it returns
>    `NULL`. Since `NULL` casts to `0` (`cffps1`), the driver will now default to
>    `cffps1` and skip the dynamic version detection entirely.
> 
>    Additionally, because `cffps1` is `0`, `i2c_get_match_data()` cannot distinguish
>    between an explicit `cffps1` match (where `.data` is `0`) and no match at
>    all, since both result in returning `NULL`.
> 
>    To safely support fallback, `cffps1` could be assigned a non-zero value in
>    `enum versions` (e.g., `enum versions { cffps1 = 1, ... }`).
> 

This does seem valid. I will make `cffps_unknown` the 0th enum so existing
behavior is preserved.

Andrew

> Guenter
> 
>>   	struct dentry *debugfs;
>>   	struct ibm_cffps *psu;
>> -	const void *md = of_device_get_match_data(&client->dev);
>> -	const struct i2c_device_id *id;
>> -
>> -	if (md) {
>> -		vs = (uintptr_t)md;
>> -	} else {
>> -		id = i2c_match_id(ibm_cffps_id, client);
>> -		if (id)
>> -			vs = (enum versions)id->driver_data;
>> -	}
>>   
>>   	if (vs == cffps_unknown) {
>>   		u16 ccin_revision = 0;
>> -- 
>> 2.39.2
>>

