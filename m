Return-Path: <SRS0=gn2i=D6=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CAE0C55178
	for <linux-hwmon@archiver.kernel.org>; Fri, 23 Oct 2020 21:14:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1CEE021D6C
	for <linux-hwmon@archiver.kernel.org>; Fri, 23 Oct 2020 21:14:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKJCfCHQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755382AbgJWVOP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 23 Oct 2020 17:14:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752910AbgJWVOP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 23 Oct 2020 17:14:15 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8D61C0613CE;
        Fri, 23 Oct 2020 14:14:13 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id w191so3341909oif.2;
        Fri, 23 Oct 2020 14:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=s0NHPR/nJgg775J0R2R73WYg6RL14uedubm92HfyUys=;
        b=bKJCfCHQpFJyASF00DP/bz4ZXftPm0IeAn8l9nTQbQAjOPtG1LJXpIMx4m42XJqGFA
         f8wvVwz0sg/hEtOsoZoCxKJI4z0SYxL6WmrjQDZsK7ioI8C3yUZeDlwbDm8WlSNnssap
         GJ0kA31M57rrGvjPRYEdTwCzo75iPwB1g5pa575xLAza1vZKbqfY/oF/116WcMyKKvw/
         v2mLA9nhhm4niAokF1nIvskuUFNZcLGwadw6osrqmalgTMw71GwLUkuuyVEuQuIRQOCc
         a+1xtbFStMHH3SAAqACjQ31rK+v9O+hO2jSmZTWtBo3MfSJ3DL9PPDYnDWWsyD0rbrFM
         lQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=s0NHPR/nJgg775J0R2R73WYg6RL14uedubm92HfyUys=;
        b=CVFQSuv/tbNqOGHmBWRRJ3ZHDavurEwDtGZVjO/gJNc+42oz2Msjf8E1C48cDB4pmV
         77xLzADA6H20cfmgboN27LrFHx4TivulU5YoD4GjqmesSeHer0i69gDUHGlrm32xDq7n
         28Zh5Kga7tF9z9kRlZB0TOOd3+OHF8rjRty39udS5VQdVgj/rlce9g1oWHDmCTydfjXL
         3ocGcaAmi/6OKFgDLaf01rOo3kt9G4rF1WFUSfqXmlRY+GBdFdQ1uxB/W7VJI5hrmG1v
         0IN1cjruUuDODJhccTaqpan1som/LBxM3kIdjYntpDV+8mL0TdchODRyUc5gBauuapwg
         6PuA==
X-Gm-Message-State: AOAM531aWrKiRo0oKpTx/0NIsXwNA6Vl4j2FB8fu6koxGxc1rJIuigIH
        ub8aHexDEQcQdxidpkVIPxz1A7D6QF8=
X-Google-Smtp-Source: ABdhPJxyeAyKSN6Vf5nKPoaMZTwffvMBQX+Rxsmsq5ssE2aVeAIF9CQ/eLhdB1zm+a1XQG/FZTmZ+A==
X-Received: by 2002:aca:e0c3:: with SMTP id x186mr3045215oig.140.1603487653139;
        Fri, 23 Oct 2020 14:14:13 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b139sm772065oii.19.2020.10.23.14.14.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Oct 2020 14:14:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 23 Oct 2020 14:14:10 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Ugur Usug <Ugur.Usug@maximintegrated.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/max20730) delete some dead code
Message-ID: <20201023211410.GA28103@roeck-us.net>
References: <20201022070659.GA2817762@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201022070659.GA2817762@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Oct 22, 2020 at 10:06:59AM +0300, Dan Carpenter wrote:
> The debugfs_create_dir() function never returns NULL.  Normal users are
> not supposed to check the return value so the correct fix is just to
> delete this check.
> 
> In the case where the debugfs_create_dir() fails, the function returns
> NULL.  The other debugfs function check for NULL directory and handle
> it.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/max20730.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/max20730.c b/drivers/hwmon/pmbus/max20730.c
> index be83b98411c7..00fea16acab4 100644
> --- a/drivers/hwmon/pmbus/max20730.c
> +++ b/drivers/hwmon/pmbus/max20730.c
> @@ -328,8 +328,6 @@ static int max20730_init_debugfs(struct i2c_client *client,
>  		return -ENOENT;
>  
>  	max20730_dir = debugfs_create_dir(client->name, debugfs);
> -	if (!max20730_dir)
> -		return -ENOENT;
>  
>  	for (i = 0; i < MAX20730_DEBUGFS_NUM_ENTRIES; ++i)
>  		psu->debugfs_entries[i] = i;
