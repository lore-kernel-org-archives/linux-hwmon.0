Return-Path: <SRS0=zZlJ=SH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA437C4360F
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 16:22:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C359A206C0
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 Apr 2019 16:22:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbfDEQWa (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 5 Apr 2019 12:22:30 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5675 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726291AbfDEQWa (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 5 Apr 2019 12:22:30 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 4FF54E4C0D14F1D46258;
        Sat,  6 Apr 2019 00:22:27 +0800 (CST)
Received: from [127.0.0.1] (10.202.227.238) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.408.0; Sat, 6 Apr 2019
 00:22:22 +0800
Subject: Re: [PATCH v2] hwmon: (smsc47m1) Use request_muxed_region for
 Super-IO accesses
To:     Guenter Roeck <linux@roeck-us.net>,
        Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <1554480333-17945-1-git-send-email-linux@roeck-us.net>
CC:     Jean Delvare <jdelvare@suse.com>
From:   John Garry <john.garry@huawei.com>
Message-ID: <2d7c42e0-ae96-d7ce-f8a5-731f792b88de@huawei.com>
Date:   Fri, 5 Apr 2019 17:22:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1554480333-17945-1-git-send-email-linux@roeck-us.net>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.238]
X-CFilter-Loop: Reflected
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 05/04/2019 17:05, Guenter Roeck wrote:
> Super-IO accesses may fail on a system with no or unmapped LPC bus.
>
> Also, other drivers may attempt to access the LPC bus at the same time,
> resulting in undefined behavior.
>
> Use request_muxed_region() to ensure that IO access on the requested
> address space is supported, and to ensure that access by multiple drivers
> is synchronized.
>
> Fixes: 8d5d45fb1468 ("I2C: Move hwmon drivers (2/3)")
> Reported-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> Reported-by: John Garry <john.garry@huawei.com>
> Cc: John Garry <john.garry@huawei.com>

Acked-by: John Garry <john.garry@huawei.com>

> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2: Fix subject, handle error in smsc47m1_restore()
>
>  drivers/hwmon/smsc47m1.c | 28 +++++++++++++++++++---------
>  1 file changed, 19 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/hwmon/smsc47m1.c b/drivers/hwmon/smsc47m1.c
> index 5d0c6eaae6f2..5f92eab24c62 100644
> --- a/drivers/hwmon/smsc47m1.c
> +++ b/drivers/hwmon/smsc47m1.c
> @@ -73,16 +73,21 @@ superio_inb(int reg)
>  /* logical device for fans is 0x0A */
>  #define superio_select() superio_outb(0x07, 0x0A)
>
> -static inline void
> +static inline int
>  superio_enter(void)
>  {
> +	if (!request_muxed_region(REG, 2, DRVNAME))

I note that some other drivers give an error message here.

> +		return -EBUSY;
> +
>  	outb(0x55, REG);
> +	return 0;
>  }

Maybe this can be factored out later into a common helper, as there does 
seem to be a bit duplication in kernel drivers (including gpio and wdt also)

But I'm not sure if it's worth it now.

Thanks,


>  static inline void
>  superio_exit(void)
>  {
>  	outb(0xAA, REG);
> +	release_region(REG, 2);
>  }
>
>  #define SUPERIO_REG_ACT		0x30
> @@ -535,8 +540,12 @@ static int __init smsc47m1_find(struct smsc47m1_sio_data *sio_data)
>  {
>  	u8 val;
>  	unsigned short addr;
> +	int err;
> +
> +	err = superio_enter();
> +	if (err)
> +		return err;
>
> -	superio_enter();
>  	val = force_id ? force_id : superio_inb(SUPERIO_REG_DEVID);
>
>  	/*
> @@ -612,13 +621,14 @@ static int __init smsc47m1_find(struct smsc47m1_sio_data *sio_data)
>  static void smsc47m1_restore(const struct smsc47m1_sio_data *sio_data)
>  {
>  	if ((sio_data->activate & 0x01) == 0) {
> -		superio_enter();
> -		superio_select();
> -
> -		pr_info("Disabling device\n");
> -		superio_outb(SUPERIO_REG_ACT, sio_data->activate);
> -
> -		superio_exit();
> +		if (!superio_enter()) {
> +			superio_select();
> +			pr_info("Disabling device\n");
> +			superio_outb(SUPERIO_REG_ACT, sio_data->activate);
> +			superio_exit();
> +		} else {
> +			pr_warn("Failed to disable device\n");
> +		}
>  	}
>  }
>
>


