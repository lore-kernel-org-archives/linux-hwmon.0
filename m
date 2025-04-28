Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06911185E7F
	for <linux-hwmon@vger.kernel.org>; Mon, 28 Apr 2025 02:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745808305; cv=none; b=B3H9Ihvs27jzLp8fThi5od4T+3HYtNXEs8wfRkz/juLdqoEIMqWkrPpMH3u1udUUBmIdTOaVS7zw0nMF3zqfArLHKmAeZEY+8YjbbKsrYBg5IDbj1MR4HlrfmwlB8yLnIk4cqOOl8bKrcmgzwC2NTHXdz6VXa47QRu5JLo2XFd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745808305; c=relaxed/simple;
	bh=b8w5k6qmb3PwV5u7bOVQtsX/3ycE+6Ev4zLgQgmtMI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XwCGZb47txJ9hMKH0PasGGrTtzdSaPhzpxrxYp04+yXSbNdeBD6hjWfcs10uy05hQAjLbfiuQLydNkgzo3E2wOArUbfMRbxAegWvcVyzmGkV0Jn8Tlj60fgGZGMUPHE6UejtqT3j4oklziOsNjmppMBJ47Zd5wpMAdfiebWlqtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Zm77y0BlfzsSKp;
	Mon, 28 Apr 2025 10:44:30 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 410B91402C4;
	Mon, 28 Apr 2025 10:44:53 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 28 Apr 2025 10:44:51 +0800
Received: from [10.67.121.59] (10.67.121.59) by kwepemn100009.china.huawei.com
 (7.202.194.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 28 Apr
 2025 10:44:51 +0800
Message-ID: <75f76d28-3a48-439a-8ad5-897d7a9fec41@huawei.com>
Date: Mon, 28 Apr 2025 10:44:50 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Consultation on extending hwmon channel attributes number to 64
To: Guenter Roeck <linux@roeck-us.net>
CC: <linux-hwmon@vger.kernel.org>
References: <1f8f24e8-0ca2-4fb0-bb69-21965e1c70c2@huawei.com>
 <2562b90c-39fa-4fd6-8acf-777fe17b2611@roeck-us.net>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <2562b90c-39fa-4fd6-8acf-777fe17b2611@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemn100009.china.huawei.com (7.202.194.112)


在 2025/4/28 1:08, Guenter Roeck 写道:
> On 4/26/25 23:32, lihuisong (C) wrote:
>> Hi Guenter,
>>
>> Currently, the implementation of hwmon core limits the maximum number 
>> of hwmon channel attributes is 32.
>> The maximum number of used attributes in hwmon.h is 31(namely, 
>> hwmon_power_attributes) .
>> Actually, we can extend this upper limit to 64 without any impact on 
>> driver. And the main modification is as follows.
>> It's also mentioned in series[1].
>> I want to know what do you think about this? I will drop this thing 
>> If it's not necessary to you.
>>
>
> I dislike complicate solutions if a simpler one is available.
Ack
>
> Your suggested change still increases the size of struct 
> hwmon_channel_info
> for every single driver. It is also not complete, because any definitions
It does't increase the size of struct hwmon_channel_info because the 
'config' is pointer type.
> exceeding 32 bit would have to use BIT_ULL(), not BIT(). If we need the
Yes, we need to use BIT_ULL(), not BIT(), which will increase the array 
size of struct hwmon_channel_info.
But the size of variables in driver should not be an obstacle for this.
> increased size, we can either add a second group of power attributes or
> something like
>
> diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
> index 3a63dff62d03..837c11fb1e3b 100644
> --- a/include/linux/hwmon.h
> +++ b/include/linux/hwmon.h
> @@ -433,13 +433,13 @@ struct hwmon_ops {
>   */
>  struct hwmon_channel_info {
>         enum hwmon_sensor_types type;
> -       const u32 *config;
> +       const u64 *config;
>  };
>
>  #define HWMON_CHANNEL_INFO(stype, ...)         \
>         (&(const struct hwmon_channel_info) {   \
>                 .type = hwmon_##stype,          \
> -               .config = (const u32 []) {      \
> +               .config = (const u64 []) {      \
>                         __VA_ARGS__, 0          \
>                 }                               \
>         })
>
> [ plus BIT() -> BIT_ULL() in include/drivers/hwmon.h ]
>
> and handle the fallout for affected drivers which assign .config 
> manually.
>
> I still hesitate doing that though because of the data size increase.
> My strong preference is to add a second group of power attributes if
> and when needed.
I understand you.
Perhaps we can compare the advantages and disadvantage of the two schemes:
*Scheme A*: add new u64* config for struct hwmon_channel_info
Advantage:
No need to define multiple attributes for single hwmon type, which is 
friendly to use for driver because of no need to use two similar name 
hwmon types.
Disadvantage:
Increase the array size of struct hwmon_channel_info for the existed driver.

For this scheme, we can suggest all later drivers use the u64 type config.

*Scheme B: *add a second group for needed hwmon type.
Advantage:
1> Don't increase the data size for every single driver.
2> No need to modify the code in hwmon core.
3> All are u32 data type, which is simple.
Disadvantage:
Driver may see two similar name hwmon types when in use, which is not 
very friendly.

 From above comparing, I think they're all ok.

/Huisong
>
>
