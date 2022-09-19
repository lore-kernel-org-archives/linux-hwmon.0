Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C03FFC6FA8B
	for <linux-hwmon@archiver.kernel.org>; Mon, 19 Sep 2022 13:16:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230252AbiISNQc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 19 Sep 2022 09:16:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbiISNQa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 19 Sep 2022 09:16:30 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A4332655E
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Sep 2022 06:16:30 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id jm11so27838912plb.13
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Sep 2022 06:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date;
        bh=I7dPcYrrJEWjFQzinJw5034ZZg8lbD9tDQxNRBKt4Eg=;
        b=a54hVbTmnF5kyd7PFU0W07Cmx8iYLaUFw6vVZd/ZZO9HSEwGTQPkC7LI57ooeuJo5i
         47PwGdT97whhoCRfJy8X8R6xI3jzlU9lh4p/5r77ZoKnGWOtm66GfRSJ/Kj++EsTiWyx
         OQqIcmyazOyaHZLZUJ6cksKP/uh3AfYud68Ko1lZqIdV7MG5+sdnYdPItCTA3mYzIT3l
         tR2IlH6ChTwffpJpPoLu7GRV/Y+9RPSG8j66C46bdMzXDKNI2Xl6ibVh0qzW0Snd4CRW
         jMF0nAWKjklGwRWrHdoz8Rqq9D1EmjmUfGl3tlvyjsPlnWbXZJH5ijnfouNmu7O0bEOD
         Hgrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date;
        bh=I7dPcYrrJEWjFQzinJw5034ZZg8lbD9tDQxNRBKt4Eg=;
        b=cglWxLutUhv3FYBTVn6lseVO2g2Dlbikx4WPdLV5ZmBYHLDm990zONcXZrZkLTIIK2
         5NQeI9dioxG37JLJ0DoxF3JHZHA5eCUbfm7jH/38JA3zqOmj/7oVTc0wiM89q/Mu7OI9
         ySMQY3ivR7xRNjI4tk3ASYeuEslH4rcqkr5YAtuOOtvM9eaCxSDTWpV5CpNmBqAIN8as
         F1BQsbZANyZ4akEkflDH5/Hp1ZoADDNv68XlVhWsO6xA76PslHwy7GoM9I1ogetnXJCy
         8RsVJoLcRLe9DcT56KSh5v2XuDhy73cFET6m+U0nK9FDflJ3Xpfx2ca7T4g76gJ+nzjq
         qvbQ==
X-Gm-Message-State: ACrzQf0LrLQ+Cawu6GijqdoFsP1SyCocB7DNH/fun9EGtulyH2n4brR9
        Ugpd7ZRDJvYDHwJv5ZDxuc0=
X-Google-Smtp-Source: AMsMyM48GJyj6JUtx8WIP51bn2gAvQonka2m/JjKGHAz8FNciUr25rUqA3fqLxem9FhtxemWq2uWfQ==
X-Received: by 2002:a17:902:ebd1:b0:178:5206:5ea2 with SMTP id p17-20020a170902ebd100b0017852065ea2mr12807943plg.42.1663593389735;
        Mon, 19 Sep 2022 06:16:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id ix10-20020a170902f80a00b00174e5fe9ce1sm20499655plb.159.2022.09.19.06.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 06:16:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 19 Sep 2022 06:16:28 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Mengda Chen <chenmengda2009@163.com>
Cc:     tharvey@gateworks.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, windhl@126.com
Subject: Re: [PATCH v3] hwmon: (gsc-hwmon) Call of_node_get() before
 of_find_xxx API
Message-ID: <20220919131628.GA3546693@roeck-us.net>
References: <20220916154708.3084515-1-chenmengda2009@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220916154708.3084515-1-chenmengda2009@163.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Sep 16, 2022 at 11:47:08PM +0800, Mengda Chen wrote:
> From: Liang He <windhl@126.com>
> 
> In gsc_hwmon_get_devtree_pdata(), we should call of_node_get() before
> the of_find_compatible_node() which will automatically call
> of_node_put() for the 'from' argument.
> 
> Fixes: 3bce5377ef66 ("hwmon: Add Gateworks System Controller support")
> Signed-off-by: Liang He <windhl@126.com>
> Co-developed-by: Mengda Chen <chenmengda2009@163.com>
> Signed-off-by: Mengda Chen <chenmengda2009@163.com>

Applied.

Thanks,
Guenter
