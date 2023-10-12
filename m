Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DBDDCDB46E
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Oct 2023 10:19:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234179AbjJLKSx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 12 Oct 2023 06:18:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234176AbjJLKSw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 12 Oct 2023 06:18:52 -0400
Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C696CA9
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Oct 2023 03:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1697105930; x=1728641930;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=GOuDzjXZ5plwyWr3LLOzg6GVoIhzrAUvIXZ7R1cAp4E=;
  b=eh3eBOwWjmaZJz7viJVZKXAYlxdZzBOlD6Z28ic81sRaw1gWblSABSQT
   1PdU4gUrvEMz4dvchuKvGaEPoWUKlLe9KblIuFW8w5iurv2U1HSmt8cbO
   zfX/Glmfm5RE44LsUOKOERKcaRqGWG4wHIZFEF4N2OrbFKvEUEZ4EAeLN
   A=;
X-IronPort-AV: E=Sophos;i="6.03,218,1694736000"; 
   d="scan'208";a="356359699"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-pdx-2c-m6i4x-e7094f15.us-west-2.amazon.com) ([10.43.8.6])
  by smtp-border-fw-2101.iad2.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 10:18:47 +0000
Received: from EX19D001EUA003.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
        by email-inbound-relay-pdx-2c-m6i4x-e7094f15.us-west-2.amazon.com (Postfix) with ESMTPS id 8CB5840D61;
        Thu, 12 Oct 2023 10:18:45 +0000 (UTC)
Received: from [192.168.5.1] (10.1.213.30) by EX19D001EUA003.ant.amazon.com
 (10.252.50.232) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Thu, 12 Oct
 2023 10:18:42 +0000
Message-ID: <169cad22-702c-445a-a9d7-74c68509bfb1@amazon.com>
Date:   Thu, 12 Oct 2023 13:18:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: HWMON periodically collection
To:     Guenter Roeck <linux@roeck-us.net>,
        "Ben Shaul, Almog" <almogbs@amazon.com>
CC:     Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <B8B37F39-A91A-4925-8100-4818FDA202DC@amazon.com>
 <2d22df1b-f5a8-4161-b4e3-a3fcba6b3308@roeck-us.net>
Content-Language: en-US
From:   "Shenhar, Talel" <talel@amazon.com>
In-Reply-To: <2d22df1b-f5a8-4161-b4e3-a3fcba6b3308@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.1.213.30]
X-ClientProxiedBy: EX19D039UWA003.ant.amazon.com (10.13.139.49) To
 EX19D001EUA003.ant.amazon.com (10.252.50.232)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


On 10/11/2023 6:09 PM, Guenter Roeck wrote:
>
> On Wed, Oct 11, 2023 at 10:45:03AM +0000, Ben Shaul, Almog wrote:
>> Hi all,
>>
>> We'd like to collect hwmon sensors and get their min/max/avg for our platforms.
>>
>> Those sensors doesn't support min/max by HW and only support reading current values (they also don't support avg but that is likely the case for all other devices).
>>
>> For that goal of getting min/max/avg we have two options:
>>
>> 1. Write userspace service that will constantly read the values and do the calculations (and later report to our database)
> Yes, this is what you'll have to do.
We appreciate the prompt response!
>
>> 2. Extend HWMON subsystem/library so each registering hwmon device will ask the subsystem to do it for you.
>>      Then kernel will create workqueue and constantly read the values and make the calculations (which shall later be readable via hwmon sysfs)
> No. This would add runtime overhead to each hwmon device even if the
> information is not used (which would be the case for almost every user).

That is a fair point.

What about enabling this during runtime in case user will want to 
utilize this?

e.g. ioctl/sysfs/debugfs

Of course users can configure the interval during runtime (or even 
devfreq based?).


The only concern we had for doing it from usrespace is the short 
interval (and multiple sensors) required will create overhead. Of course 
doing that in kernel space doesn't make this overhead go away and even 
worsen it as we don't go via scheduler. (but does ease 
userspace/kernelspace context switch).

And of course the added value of contributing such a feature which does 
make sense as probably many want to know across their HW what is the 
power consumption. are you aware of some package that supply this kind 
of info? or everyone interested is doing some sort of home made solution?

>
> Guenter
