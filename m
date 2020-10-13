Return-Path: <SRS0=maGh=DU=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE140C433E7
	for <linux-hwmon@archiver.kernel.org>; Tue, 13 Oct 2020 16:57:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95F59252FC
	for <linux-hwmon@archiver.kernel.org>; Tue, 13 Oct 2020 16:57:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fu3Bv6r8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728667AbgJMQ5R (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 13 Oct 2020 12:57:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728624AbgJMQ5Q (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 13 Oct 2020 12:57:16 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2747C0613D0
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Oct 2020 09:57:16 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id w204so130519oiw.1
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Oct 2020 09:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jrzW3KaM4aEDVaIJ7RT+amjkw8uUP5hl9Ao2KynyIJ4=;
        b=Fu3Bv6r8W6ZyBqqxqpIeyRfJ+cU5jnntUgc5iovft8Cr5nadqKV8ReWL1Pj8Tkhzh4
         USidniDYLvh9J4ItQoiVfK0OLxmljOW9sJRXFEkn3PAGUh3nTk9iqdT0C/Ir9YlR4BOZ
         deiMkfCuWyrIShrHUwHN7i6yBdemDxYuRMi9Z3T4phUQFWK3px1RL9CB9Nahuj7piZOj
         M3JtunKU0EGqezvmjRJn97AlOpyqComfn52wz0PkiOw1CXMJijnBON4xvHeuO+vxAxeS
         sGPjDiO8YfbiV4xmInZEx2ChNTxIqgDAy9rYL3AKKZkn777UkkJNadCyVR6DhtgSDHsn
         105A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=jrzW3KaM4aEDVaIJ7RT+amjkw8uUP5hl9Ao2KynyIJ4=;
        b=k2zgloznvxQ1j1Dh6L+BWE9NwTVJBS1MQI28iiBQz0o6gzQ1qN0l4SM1sW80vZceah
         +FwI2RzaiVu8OHqhXk5szVZlOaUoGWI3qF6AVd+KKilyTDbHbTGFCXKSPEJsP5bmsmgj
         JwqAz8pb7XXIltArzw8H5a4SrBfkJqQ1JTtLRsR2ktjXTt6wNopvPjFRGe6lQyiBgEjy
         OQXnY7OqS3dsAZHvQkw8sTN29NH5TDQg419M0IDcs1QerKqlrD/lXl47FDtjeMWbhjQO
         hednkNzoqZoiUyd0KsWNMH/1pZ+k216OJzqhVS+9wQ3eo8fopEXSbilUfzC6BZ5S4rs2
         FnVQ==
X-Gm-Message-State: AOAM530piJedLtlJsAc1J0XzIGdmAdl+coFzRQwdrJti+7VB8SuWSLJ7
        TN0yfQ3chCAhZhvhCzW8BTQ=
X-Google-Smtp-Source: ABdhPJzoNq7Ru7de5yGCHEuCJA8AogWJDK8+FDgF3bwN7t7WJPuqNGaYicXf08m6JxPzV/nJOb2F/A==
X-Received: by 2002:aca:5212:: with SMTP id g18mr399785oib.107.1602608236245;
        Tue, 13 Oct 2020 09:57:16 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y51sm104641otb.47.2020.10.13.09.57.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Oct 2020 09:57:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 13 Oct 2020 09:57:14 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     rahul.tanwar@linux.intel.com, linux-hwmon@vger.kernel.org
Subject: Re: [bug report] hwmon: Add hardware monitoring driver for Moortec
 MR75203 PVT controller
Message-ID: <20201013165714.GJ251780@roeck-us.net>
References: <20201013140858.GA375361@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201013140858.GA375361@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Oct 13, 2020 at 05:08:58PM +0300, Dan Carpenter wrote:
> Hello Rahul Tanwar,
> 
> The patch 9d823351a337: "hwmon: Add hardware monitoring driver for
> Moortec MR75203 PVT controller" from Oct 5, 2020, leads to the
> following static checker warning:
> 
> 	drivers/hwmon/mr75203.c:479 pvt_clk_enable()
> 	warn: 'pvt->clk' not released on lines: 479.
> 
> drivers/hwmon/mr75203.c
>    471  static int pvt_clk_enable(struct device *dev, struct pvt_device *pvt)
>    472  {
>    473          int ret;
>    474  
>    475          ret = clk_prepare_enable(pvt->clk);
>    476          if (ret)
>    477                  return ret;
>    478  
>    479          return devm_add_action_or_reset(dev, pvt_clk_disable, pvt);
> 
> Do we have to disable the clock if devm_add_action_or_reset() fails?
> This is sort of a new Smatch check so I'm not entirely sure of the rules
> mysql.

devm_add_action_or_reset calls the callback function (here:
pvt_clk_disable) if there is an error, and the callback function
releases the clock. This is a workaround for the missing
devm_clk_prepare_enable(); you'll find it all over the kernel
by now.

Guenter

> 
>    480  }
> 
> regards,
> dan carpenter
