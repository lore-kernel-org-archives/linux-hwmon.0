Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9942C001B0
	for <linux-hwmon@archiver.kernel.org>; Thu, 10 Aug 2023 16:18:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235040AbjHJQSv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 10 Aug 2023 12:18:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234494AbjHJQSu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Aug 2023 12:18:50 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65937E53
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Aug 2023 09:18:46 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-6bca857accbso1010543a34.0
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Aug 2023 09:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691684325; x=1692289125;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WehWiSYBzWbyr2koxZsYuwUhdPIR1gTPp0gnTc3B5zA=;
        b=DCcKhOrCz++FLdL2pDl1o8wpuuOy5Kzo216lZ1qlE/7OkLDpH4edP8o0L1HpV8jrPA
         7TIArD4Liw1JdYjtexDbB6cmMT8ce6fDQgc21DZRS0XxLzt6zDwdG8NjnXiykYedIAhV
         snNMFT5HKgGuP43J6s1Y7JfUBQNqVduedgDyWDvR6OwgfGmHNf7tkCo3045/zLyRiqpa
         K5DCt5lNNjxmpOCtjDDxAbaMtqMkLU3AFonhFl/iX8TYMsFELSP23cJD93QA3me0l93H
         Xbx17px9Nb6YqWg+iLr4laTVgfI+qmt5dZdsXQb9F2jiw7KcZVPSSpWAwKMf8qwZxlXW
         s3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691684325; x=1692289125;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WehWiSYBzWbyr2koxZsYuwUhdPIR1gTPp0gnTc3B5zA=;
        b=l47mvJ/pzNTWozMplii0ftbhrx+VkuMl2LREx+ZD7NBZxKWwmqPDv7aB3zEe8UbrI+
         bHftWkntqjx7DAp9jaQ0CzWDo/eXIiKVe8iMVIxXDOc8MKjDfuAUC7Ds+KHMt7s5VaRB
         k4/ibMZ1jFrq328EW2XDr0QBr31y9EwSBLEAjNvxYoLYWcF5X1XBCNloxBkgXj7Ht7KQ
         RSIml1DQDfdil2LwqLuKlv+BhWAIIZvcrE5+bher7Om6EsPZUahV9offa3Tyx6HOO10E
         ZS7e35ZUOSFlXV9Y8Yt4h9/Ax4Jcv2PxpK2RX+09gXSZK0ilmhmmJhaYXOCTzUw66XHd
         Id8A==
X-Gm-Message-State: AOJu0Yw7TXaE+C4PVnvhx8onfvKHQuutvDLEzyOk9cfqetxutd0Wu6N2
        NzcuXlvlJy/0KOlZXcBOrAAh9LrCf28=
X-Google-Smtp-Source: AGHT+IEOTFuYRv5umYhu0AT2o0nvyl41cqPxsqj5dEg5Ja1zieV7zw3ZGk/nnhqlUvH9aapCQIv9Zg==
X-Received: by 2002:a05:6870:e889:b0:1c0:fcbd:2345 with SMTP id q9-20020a056870e88900b001c0fcbd2345mr1413605oan.20.1691684325629;
        Thu, 10 Aug 2023 09:18:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id pc16-20020a17090b3b9000b00263154aab24sm1678335pjb.57.2023.08.10.09.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:18:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 10 Aug 2023 09:18:44 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ruan Jinjie <ruanjinjie@huawei.com>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH -next] hwmon: (nsa320-hwmon) Remove redundant
 of_match_ptr()
Message-ID: <c0172785-4c02-4479-bd93-30a84d76b808@roeck-us.net>
References: <20230810062635.1947552-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810062635.1947552-1-ruanjinjie@huawei.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Aug 10, 2023 at 02:26:35PM +0800, Ruan Jinjie wrote:
> The driver depends on CONFIG_OF, it is not necessary to use
> of_match_ptr() here.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/nsa320-hwmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/nsa320-hwmon.c b/drivers/hwmon/nsa320-hwmon.c
> index e26334469549..18076ba7fc14 100644
> --- a/drivers/hwmon/nsa320-hwmon.c
> +++ b/drivers/hwmon/nsa320-hwmon.c
> @@ -191,7 +191,7 @@ static struct platform_driver nsa320_hwmon_driver = {
>  	.probe = nsa320_hwmon_probe,
>  	.driver = {
>  		.name = "nsa320-hwmon",
> -		.of_match_table = of_match_ptr(of_nsa320_hwmon_match),
> +		.of_match_table = of_nsa320_hwmon_match,
>  	},
>  };
>  
