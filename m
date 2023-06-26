Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A932CEB64D7
	for <linux-hwmon@archiver.kernel.org>; Mon, 26 Jun 2023 13:46:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbjFZNqY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 26 Jun 2023 09:46:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbjFZNqX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 26 Jun 2023 09:46:23 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AAFF134
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Jun 2023 06:46:22 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6686a05bc66so1865067b3a.1
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Jun 2023 06:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687787182; x=1690379182;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xQ/eFvYi4a992bYCxd+sF4zYUpnRaBp8eSaohH63fRA=;
        b=OBuBuxnaK0gLXC5J/QqKNLHYBk8DwodaAbsrfjoYNv4njgVBLlCudfGReaHB5QaMm1
         uwWgvZKJ3BE7Le+bEtfMc95IX2uQOg6SuIphgmM4AsSu5DREzjzZ7NPbCmjX3xx8izsp
         xHXVSL33urllT5GGTNpbfrjwP+74ZQBWFFDNSHePBkEOh6la0BxG5LK2EkYC2rktccvk
         Q77kEM3u7NSbDwt/k9JqWrGI+9tAoa8hWpe/rXJoxROafs5L0yplEFBErTZQdGl0NqUD
         gfPuwSL+qeGJPGh6lZKp96WiZWiv40n5pUDTBAJdHmTtmw0VXvPCbmnzkWst+i+hE6RL
         /nIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687787182; x=1690379182;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xQ/eFvYi4a992bYCxd+sF4zYUpnRaBp8eSaohH63fRA=;
        b=ahdtgPK3yeqCt8quZkzEkcShqOoHZRPB+1OpyvXRkakYLyfFPnkAHvWoXWJdAGi7jW
         E84IGauX+W5HGFuClelDyRaSscQv0BvdnEEudkZdoIMtuVn85HWQi5w9yW0r5hqxiqR1
         QU+0/IkVCVbQpFGsN5R3lfAAeecYooIn0gCFCIqq+L0H0/trTglKq4NUw5ANxAaZO6GN
         xgX9fwu1PdR7xyCbDMRwVWpHkUtRMGO6BOZbm3H2YB+cmaVWKjn3vBxF6SSUyt4Vo1KC
         qVYRTwggdcUruxZDQmiHTnTZC3RpHz+bCXdB1jIjhjxknmaL+CrMLsB7dklEXII3H9nP
         pDsA==
X-Gm-Message-State: AC+VfDxlcArLnCzghouKILBadnGP8ShWAbRLvXBptl0itnKdHL6yU0X5
        GgAz++VxeOXQ4dAndIHo+Hs=
X-Google-Smtp-Source: ACHHUZ4UX9ZwrdC7KP41xuwTuCbF6OicBEbTxVYccRB80cfTu86TxCH06OD+LwqFUcx/ZQIuU9kRsw==
X-Received: by 2002:a17:903:1ca:b0:1b3:f8ca:751f with SMTP id e10-20020a17090301ca00b001b3f8ca751fmr5379082plh.66.1687787181817;
        Mon, 26 Jun 2023 06:46:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y7-20020a17090322c700b001b3a21fbb4fsm4247984plg.12.2023.06.26.06.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 06:46:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 26 Jun 2023 06:46:19 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Daniel Matyas <daniel.matyas@analog.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] hwmon: max31827: Switch back to use struct
 i2c_driver::probe
Message-ID: <b6b7271c-6184-4574-9404-36f3e11abb6c@roeck-us.net>
References: <20230626085145.554616-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230626085145.554616-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jun 26, 2023 at 10:51:45AM +0200, Uwe Kleine-König wrote:
> struct i2c_driver::probe_new is about to go away. Switch the driver to
> use the probe callback with the same prototype.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/max31827.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> 
> base-commit: 16d60ba8fdc4c6e4745005889dea6ed82b6b5cbd
> 
> diff --git a/drivers/hwmon/max31827.c b/drivers/hwmon/max31827.c
> index 7735e8087df3..602f4e4f81ff 100644
> --- a/drivers/hwmon/max31827.c
> +++ b/drivers/hwmon/max31827.c
> @@ -456,7 +456,7 @@ static struct i2c_driver max31827_driver = {
>  		.name = "max31827",
>  		.of_match_table = max31827_of_match,
>  	},
> -	.probe_new = max31827_probe,
> +	.probe = max31827_probe,
>  	.id_table = max31827_i2c_ids,
>  };
>  module_i2c_driver(max31827_driver);
