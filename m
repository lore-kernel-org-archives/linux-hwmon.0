Return-Path: <SRS0=3EK7=6C=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE4EC38A29
	for <linux-hwmon@archiver.kernel.org>; Sat, 18 Apr 2020 17:13:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9683F21D6C
	for <linux-hwmon@archiver.kernel.org>; Sat, 18 Apr 2020 17:13:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0/vreed"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbgDRRNh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 18 Apr 2020 13:13:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbgDRRNg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 18 Apr 2020 13:13:36 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2F6BC061A0C
        for <linux-hwmon@vger.kernel.org>; Sat, 18 Apr 2020 10:13:36 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id q16so3373057pje.1
        for <linux-hwmon@vger.kernel.org>; Sat, 18 Apr 2020 10:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DpX799CWNaXLHgQWlF/POilVyjJueJ7U6RfB0f7se8c=;
        b=U0/vreedoBNEC6jEPlAKOBtrBriZmfSW30pb7Q58dlHVhlsbmbckFW7HRsFT1X1NyV
         Usc/OWVdOQZEAzJG/iXIZar+G2P2rP8MQhzL0OgP7F4xMApwWHn78aSNyKqfZnFKLKTX
         fcZQaDt+8icT+y1L4+KsLPQ4K/wx1XUwoJPbVpqxSgetY45V7KqZV1GZiNXtj/Nw0veO
         sC8TiJ6ww87z1/oDS9yAzZquEZWPOMmrptXKzKWt1Z/rui4q+stRoUQ1KixrJnXiU+PC
         ZMf/evDIjuFITpOb/V/1GKYzmL6XOItHD+PqEKEFTKjNVF0XOLNcMbv3XymUlhXIGTpl
         UgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=DpX799CWNaXLHgQWlF/POilVyjJueJ7U6RfB0f7se8c=;
        b=CbR0RIe4vqUNhECTCqhSVp3z4dQwLtEs+FPSD5VTM4m/hdVDI1ETQ8vkBpf0Kdycpb
         mUO6XUoYBe77EHxQCaJzCms6VhYFEoxKDlUkxyOSLKVq/jLpfCMnbIF5L2Q00Rk6d0SU
         wSs2kQS2m4HWbZAZUc5shckoS6EnwRMPojSWwejzJjZKkwG9w9O6m3i/ZdWSFXszh2xW
         FBdKAVbQKy1HRrj8NreIpoHq5k67wC8ddDwxe/WZr+OjmugQfVCdNVyOxa2BefUb85TX
         8tcNyd6VXASu0xSzmZYa6laeVQBz4fIqU3cBNwOSlPGIt7zDGSjsSV047xvS9uRynSQ2
         BVHA==
X-Gm-Message-State: AGi0PuZXPaETeHPWjvAkI+P2+H3b5oT1Rwuebz+beQJ2eSXKSXhJtAB5
        Vp3acMaXYN6R3Fo45HAhIudRV+qi
X-Google-Smtp-Source: APiQypK+IyEalrpTN9nmyQLEZ/2RW8PwVJXe32IkDzwGYxUPIFkPqKBv+MYDSfMu24UUxqPaFvMluw==
X-Received: by 2002:a17:90a:290f:: with SMTP id g15mr11347121pjd.93.1587230016480;
        Sat, 18 Apr 2020 10:13:36 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q70sm23105350pfc.206.2020.04.18.10.13.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 18 Apr 2020 10:13:35 -0700 (PDT)
Date:   Sat, 18 Apr 2020 10:13:34 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sascha Hauer <s.hauer@pengutronix.de>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] hwmon: (jc42) Fix name to have no illegal characters
Message-ID: <20200418171334.GA51539@roeck-us.net>
References: <20200417092853.31206-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417092853.31206-1-s.hauer@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Apr 17, 2020 at 11:28:53AM +0200, Sascha Hauer wrote:
> The jc42 driver passes I2C client's name as hwmon device name. In case
> of device tree probed devices this ends up being part of the compatible
> string, "jc-42.4-temp". This name contains hyphens and the hwmon core
> doesn't like this:
> 
> jc42 2-0018: hwmon: 'jc-42.4-temp' is not a valid name attribute, please fix
> 
> This changes the name to "jc42" which doesn't have any illegal
> characters.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

I have not heard a better suggestion, so applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/jc42.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/jc42.c b/drivers/hwmon/jc42.c
> index f2d81b0558e5..e3f1ebee7130 100644
> --- a/drivers/hwmon/jc42.c
> +++ b/drivers/hwmon/jc42.c
> @@ -506,7 +506,7 @@ static int jc42_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  	}
>  	data->config = config;
>  
> -	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, "jc42",
>  							 data, &jc42_chip_info,
>  							 NULL);
>  	return PTR_ERR_OR_ZERO(hwmon_dev);
