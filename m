Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12EC5C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Sep 2021 18:54:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E8E5D6023B
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Sep 2021 18:54:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232143AbhIUSzm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 21 Sep 2021 14:55:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:55426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232142AbhIUSzm (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Sep 2021 14:55:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D030361186;
        Tue, 21 Sep 2021 18:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632250454;
        bh=GwEOPGnYH840jIa561ZjtdeJSkWyb1ueu8GYxnujEVg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tcFzFYDIvh8MLo3tTTg6F1tYiQnVTTaC+XGndHbyk1WKfQMWmbED+ACL5u0z2XXE6
         fnZEp9Lq9TGwNGTptawhAK6vLsvcc5+tHmYZSAvuWAHC87vot/131ISPXy318rrJHC
         pifOivaHzu4gbnAumMUQfopz/Hr4C/iu1F8Ka//xdSXrs4xvFwLcMQ5Q9dl6b6jOTA
         NfvXag59mCv27Nmt7ndnx6bmZk6zmNeeVFv7zfAcicWTcPYCLdgviQLJmZvl24VrvC
         XVI2jIXDY3zPpzi/0oGUvxVT2UqMP1ZwNFFswFqcXTo9RJxEkTDIkfI9nQnZ4CvOE4
         7TL/s8JnB51IQ==
Received: by pali.im (Postfix)
        id 89E917DD; Tue, 21 Sep 2021 20:54:11 +0200 (CEST)
Date:   Tue, 21 Sep 2021 20:54:11 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Jackie Liu <liu.yun@linux.dev>
Cc:     jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        W_Armin@gmx.de
Subject: Re: [PATCH] hwmon: (dell-smm): make struct dell_smm_data *data
 __maybe_unused
Message-ID: <20210921185411.fxh4xoidjb7hk7pk@pali>
References: <20210918051300.1171578-1-liu.yun@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210918051300.1171578-1-liu.yun@linux.dev>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Saturday 18 September 2021 13:13:00 Jackie Liu wrote:
> From: Jackie Liu <liuyun01@kylinos.cn>
> 
> The compiler warns when the data are actually unused:
> 
>   drivers/hwmon/dell-smm-hwmon.c: In function ‘i8k_init_procfs’:
>   drivers/hwmon/dell-smm-hwmon.c:624:24: error: unused variable ‘data’ [-Werror=unused-variable]
>     624 |  struct dell_smm_data *data = dev_get_drvdata(dev);
>         |                        ^~~~
> 
> [Why]
> If CONFIG_PROC_FS=n, proc_create_data is NULL, data is unused.
> 
> [Fix]
> Mark them __maybe_unused to suppress that warning as well.

See: https://lore.kernel.org/linux-hwmon/20210920121421.93297-1-arnd@kernel.org/t/#u

> Fixes: ba04d73c26ed ("hwmon: (dell-smm-hwmon) Move variables into a driver private data structure")
> Cc: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
> ---
>  drivers/hwmon/dell-smm-hwmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 774c1b0715d9..d73f4a4bd96e 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -621,7 +621,7 @@ static void i8k_exit_procfs(void *param)
>  
>  static void __init i8k_init_procfs(struct device *dev)
>  {
> -	struct dell_smm_data *data = dev_get_drvdata(dev);
> +	struct dell_smm_data __maybe_unused *data = dev_get_drvdata(dev);
>  
>  	/* Register the proc entry */
>  	proc_create_data("i8k", 0, NULL, &i8k_proc_ops, data);
> -- 
> 2.25.1
> 
