Return-Path: <SRS0=ZqwK=VF=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C23BC606C7
	for <linux-hwmon@archiver.kernel.org>; Mon,  8 Jul 2019 18:20:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 102E3217F4
	for <linux-hwmon@archiver.kernel.org>; Mon,  8 Jul 2019 18:20:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DF1Oe+UE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728765AbfGHSUB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 8 Jul 2019 14:20:01 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:45002 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389636AbfGHSUB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 8 Jul 2019 14:20:01 -0400
Received: by mail-pl1-f194.google.com with SMTP id t14so5594863plr.11
        for <linux-hwmon@vger.kernel.org>; Mon, 08 Jul 2019 11:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xI/sEYl43OtPof7UfKDNbgGyWxaXGDlWGIUHW2ZyHNM=;
        b=DF1Oe+UEsw9Ovzm+flyu8qpz6mI/fSbvgGIwccV1mf4s43Jj4aPXEztbKKDlLrkEkU
         jGD/0mbqvgCFThd1H1itMRC7kQ5XXF+4DqPUkfhpUR1Pdvw8FQssCFzlJXFqv+e41qTI
         eTFGRspzk/RlkKDYAgKqToCEQ+Qxggx14gzfvuDto5PHuWT8pRFOTCMPHAGdg1piOApB
         3fTUVLfNivhavlDlOmoJfsjtMFahW4WCZEKHI3+153L4Y3/hTLsbXuiEhvHb8tWvGqe5
         CgtELW1YyClgvY9PAeR7LDi2d9dQnXZ7hgCRNKFA0fGBrmTj0sFx6pklogNRzth5vd2D
         0sgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=xI/sEYl43OtPof7UfKDNbgGyWxaXGDlWGIUHW2ZyHNM=;
        b=tzh2Tht3m3MrXH3WgunsimdZoaONrNbEZOLFW2qJCvQrfMq3xrlWjSmIauLE9JpXTA
         ZT4ymYS64gqJldUSfoQyGTDV6V1IyspgAu7fWcB094n4Dy7cfOmwQ1Moen/xxRa59/kT
         TzRdiIXIxuDe0VOajAhx9UWpnpy2HyjkNWosblVUtHiCnb41JMuXoxeCTFJ0b/qhLaj8
         wxK34+jf26E34scjkdUDNlURvfpRO4q8yjB6sQZDjSeOKWcGzk9xSjLU17O1vzRJBA4c
         blxh6cHQFI2J09P2TMuyf8XNn8v6m2iSqCW9XTX/fnsa0DcdLfe8v5vOrWWXEH3IEuOq
         bnuA==
X-Gm-Message-State: APjAAAXi5/USLCtCEpvm6r7RggNLFGNkyPZkl/umQE1zDHcA2Eo/jdvD
        1Tu3o0xewFgF7D7ITM3f/v/VOyKF
X-Google-Smtp-Source: APXvYqxTriu9wa1iUlW7903GNji//U7+mmQIZulZIwXiuOOTk0R26VPqdgKTOqaNYjGZaaPkOUfHow==
X-Received: by 2002:a17:902:76c6:: with SMTP id j6mr26677042plt.102.1562610000931;
        Mon, 08 Jul 2019 11:20:00 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x12sm2297383pgj.79.2019.07.08.11.20.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jul 2019 11:20:00 -0700 (PDT)
Date:   Mon, 8 Jul 2019 11:19:59 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org, eibach@gdsys.de
Subject: Re: [PATCH] hwmon: ads1015.c: Add of_node_put() before return
Message-ID: <20190708181959.GA15323@roeck-us.net>
References: <20190706132357.3185-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190706132357.3185-1-nishkadg.linux@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Jul 06, 2019 at 06:53:57PM +0530, Nishka Dasgupta wrote:
> Each iteration of for_each_child_of_node puts the previous
> node, but in the case of a return from the middle of the loop, there is
> no put, thus causing a memory leak. Hence add an of_node_put before the
> return in two places.
> Issue found with Coccinelle.
> 
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>

The ads1015 driver is about to be removed from the hwmon subsystem
in v5.4 (see https://patchwork.kernel.org/patch/11026555/), so I won't
apply any cleanup patches to it.

Thanks,
Guenter

> ---
>  drivers/hwmon/ads1015.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hwmon/ads1015.c b/drivers/hwmon/ads1015.c
> index 3727a3762eb8..a0d62f6fa4b6 100644
> --- a/drivers/hwmon/ads1015.c
> +++ b/drivers/hwmon/ads1015.c
> @@ -195,6 +195,7 @@ static int ads1015_get_channels_config_of(struct i2c_client *client)
>  			if (pga > 6) {
>  				dev_err(&client->dev, "invalid gain on %pOF\n",
>  					node);
> +				of_node_put(node);
>  				return -EINVAL;
>  			}
>  		}
> @@ -204,6 +205,7 @@ static int ads1015_get_channels_config_of(struct i2c_client *client)
>  			if (data_rate > 7) {
>  				dev_err(&client->dev,
>  					"invalid data_rate on %pOF\n", node);
> +				of_node_put(node);
>  				return -EINVAL;
>  			}
>  		}
