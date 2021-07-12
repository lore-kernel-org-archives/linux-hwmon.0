Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF57EC07E99
	for <linux-hwmon@archiver.kernel.org>; Mon, 12 Jul 2021 14:46:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7F0161164
	for <linux-hwmon@archiver.kernel.org>; Mon, 12 Jul 2021 14:46:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235188AbhGLOtO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 12 Jul 2021 10:49:14 -0400
Received: from mout.gmx.net ([212.227.17.20]:56677 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235288AbhGLOtO (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 12 Jul 2021 10:49:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1626101184;
        bh=LBfHTMRzlXpyebqV1SFXKnGSZhhQx1hhTvHBhw9VkOU=;
        h=X-UI-Sender-Class:Subject:Cc:References:From:Date:In-Reply-To;
        b=RaULi2/PVD6erJU+Ai36nE8jN97nx+Y/HwlDxB6/1juWiz71flY0yqGzGhVXzS+7E
         kSeri/QAmkQA9r8qWTpd3zvYq/FVdkvODQivl01l0+E9Ru5hSC1h1EoIK/WJ/aU9c3
         +4Nuh8fjSZKNTfNNdv+fmcewuRJWQ0v8q/o50R14=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.2.131] ([79.242.183.242]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTiTt-1lZV1x3AM9-00Tyeh for
 <linux-hwmon@vger.kernel.org>; Mon, 12 Jul 2021 16:46:24 +0200
Subject: Re: [PATCH 3/3] hwmon: (w83627ehf) Switch to SIMPLE_DEV_PM_OPS
Cc:     linux-hwmon@vger.kernel.org
References: <20210709184501.6546-1-W_Armin@gmx.de>
 <20210709184501.6546-4-W_Armin@gmx.de>
 <20210712023825.GA3552025@roeck-us.net>
From:   Armin Wolf <W_Armin@gmx.de>
Message-ID: <9e9c73ed-450c-fda6-539c-8dfbab1009a1@gmx.de>
Date:   Mon, 12 Jul 2021 16:46:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210712023825.GA3552025@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:V4CQoXJRZW+kJIOSJbI4EmAyZusPJH0KRgWbgZuxkZL/rsYV7qI
 Ywevqm/2FF3X2/KWShFuVIkdsBNv+gz0GioXAYBgRnzKpF+iR5reHfbVtQvyp+J+3YQ9Nrw
 xk+/BtByM8jXFFGlSMEr96u9xgX3oBE8gtdTb9yaaPv+KzYixJjr3fZ4+pBP0645IkqpL4/
 T/K3RbYsL5FK32V6Jgs1A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:07hU1j+7UJ4=:T8NDSDkmfEpmzXeWUnt3rh
 PUuEoeW26WmxWBB/8EKa6LLHGriAOnZqUDQHotytBAfJwoUTmD36Y7ivon0Io9lQS8kal1MFC
 HTorEITkUsT1J5rwHsNyLvwKM1DB5JFmlI1JrgkexxFUh9IAPmFD//Pvl02bQrNcMCxp54KGM
 nvZB4aIn9NMrmVpil7fH5rr8mu1CWG8GtlVrK60SnCqCh/g7WJxPjT/FhlhZiBY8aPoDkn2mM
 KYY8S/LW0cq340R9K+c10y0Knr7IY5pWYsMnFReljr3cNS7Q/6xxH1q1vjyc10jHbZ0GE+gaf
 eucTvR5b62BOIjs6bEjJO5/GqweYYuUdZrxtXZug37CtQ5y19U5gVmZnueaeOImUceTLdTo8r
 zTNCiUVNB2RZnZZ3mBGC26p16hzgEQj6FOSAaGrlsDEeEFtTSOntcmIiAU8ZHffjNfZSIkTCI
 BI06ANu3MXJj/8KzcwxixlTB5UYuGn7iffV2R9KR3f/hHApjZtaHKVKHUEuEBQmqDtAKQdnUB
 9cdWQXdFb0dA25UPV8Nsya28Q5LJGFWrSgW0uYILppWOpwyPP8wIFSbyD1AUcGt6QSkDFSwFH
 RkfWpoTtjkSgS0hABQ5/leU0irwmpq5fpwvWMCagrC+F4SXZ8ErykLR8YfOswTz5JA/zp/FM+
 ttndinMGk+mm1+J16iZuPrXDbZMiJWV3lV8aczcnzhACfO7Syk13TvWRzTkCtSIK4g1mAhNt4
 SJpx9CI5lfs7aKbNMXgZZYgXkUc/Jp6C/purFep3bLAwo4cMwifmhG6/PalO+oLMvvnzpU7Ns
 eqV5EBSEFkaacaM/gh9ZA4GlhX0iAtqFhchFzSWpV394VqPUKAB9AEvjjAQ0hfT6wW/dvGwoi
 x2N5bgSjT/DtHIg9+4wDY6/BSkYElYO1l2rA/UzGo0FSfxdXMtkrAjOLYrnIlIM9rT0xsNXvm
 UxSjgBa7hCOh4f90DTQdxTphd9yH6Z4aWd/1dBx/xbJJJoycocfU4A4qTIapC68KG7haewTKe
 3NxUFuFIbp3sMVtWiPo1EToRHg3/JK1YdenWNtobJ4Pp/Mx+YkUj7tG3yqUbmwRLY0WNn43sD
 dW+w+ggMLPd5RjSKVX1L0CFBgRPtjHGcvk7
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Am 12.07.21 um 04:38 schrieb Guenter Roeck:
> On Fri, Jul 09, 2021 at 08:45:01PM +0200, W_Armin@gmx.de wrote:
>> From: Armin Wolf <W_Armin@gmx.de>
>>
>> Use SIMPLE_DEV_PM_OPS() to also assign poweroff
>> and thaw callbacks. Remove the now obsolete checking
>> of CONFIG_PM too.
>>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> 0-day says:
>
> drivers/hwmon/w83627ehf.c:1954:6: error: 'struct w83627ehf_data' has no member named 'vbat'
>
> .... and there was me thinking that this code was at least compile tested.
> Apparently not. Sigh. I dropped this patch.
>
> Guenter

Well, i even tested the patches on real hardware (Asrock AM2NF3-VSTA), however it seems that i forgot to test them
with CONFIG_PM disabled. I already found the problem and will submit a updated patch series soon
(after more testing this time).
Sorry for not doing that sooner.

>> ---
>>   drivers/hwmon/w83627ehf.c | 19 ++++---------------
>>   1 file changed, 4 insertions(+), 15 deletions(-)
>>
>> --
>> 2.20.1
>>
>> diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
>> index 19af84574324..243b9bd8d64f 100644
>> --- a/drivers/hwmon/w83627ehf.c
>> +++ b/drivers/hwmon/w83627ehf.c
>> @@ -1946,8 +1946,7 @@ static int __init w83627ehf_probe(struct platform_device *pdev)
>>   	return PTR_ERR_OR_ZERO(hwmon_dev);
>>   }
>>
>> -#ifdef CONFIG_PM
>> -static int w83627ehf_suspend(struct device *dev)
>> +static int __maybe_unused w83627ehf_suspend(struct device *dev)
>>   {
>>   	struct w83627ehf_data *data = w83627ehf_update_device(dev);
>>
>> @@ -1958,7 +1957,7 @@ static int w83627ehf_suspend(struct device *dev)
>>   	return 0;
>>   }
>>
>> -static int w83627ehf_resume(struct device *dev)
>> +static int __maybe_unused w83627ehf_resume(struct device *dev)
>>   {
>>   	struct w83627ehf_data *data = dev_get_drvdata(dev);
>>   	int i;
>> @@ -2013,22 +2012,12 @@ static int w83627ehf_resume(struct device *dev)
>>   	return 0;
>>   }
>>
>> -static const struct dev_pm_ops w83627ehf_dev_pm_ops = {
>> -	.suspend = w83627ehf_suspend,
>> -	.resume = w83627ehf_resume,
>> -	.freeze = w83627ehf_suspend,
>> -	.restore = w83627ehf_resume,
>> -};
>> -
>> -#define W83627EHF_DEV_PM_OPS	(&w83627ehf_dev_pm_ops)
>> -#else
>> -#define W83627EHF_DEV_PM_OPS	NULL
>> -#endif /* CONFIG_PM */
>> +static SIMPLE_DEV_PM_OPS(w83627ehf_dev_pm_ops, w83627ehf_suspend, w83627ehf_resume);
>>
>>   static struct platform_driver w83627ehf_driver = {
>>   	.driver = {
>>   		.name	= DRVNAME,
>> -		.pm	= W83627EHF_DEV_PM_OPS,
>> +		.pm	= &w83627ehf_dev_pm_ops,
>>   	},
>>   };

