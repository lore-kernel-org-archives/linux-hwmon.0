Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2FE0C433B4
	for <linux-hwmon@archiver.kernel.org>; Wed, 14 Apr 2021 03:26:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88F3F613B6
	for <linux-hwmon@archiver.kernel.org>; Wed, 14 Apr 2021 03:26:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233207AbhDND0c (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 13 Apr 2021 23:26:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232296AbhDND0c (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 13 Apr 2021 23:26:32 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4C7FC061574
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Apr 2021 20:26:11 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id t17-20020a9d77510000b0290287a5143b41so6889458otl.11
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Apr 2021 20:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Mtuou56iVHqZq7GnT52xFOik0yUH+vUoEUo9YJNa7/w=;
        b=Fh7uGGVLliOJ0xWtGx5vN4AVb3/ETOB9Ru9gD5uZfA0FNVH1rVUHuCsXIoAuKsx7jQ
         7VXSiEsSquBz+xrbWXzO5uE+lkJjnZpYi+uu9Xa0eBt/U2noYulrTayKjjVXGwoy0vob
         M/n5Rg4b8M9LyG60yqwEIGB0XQ7w5SoGJWT6RTg/VwdbPGmaHWlC3cEL/JlCSJFMiq1s
         E7H5/MxYI5n3HuvblTUhPcW/OspNGJK3aVTWUhRctd/32j07PU+HJ4TL5sWBoYEECGyw
         xabK5dpYBeITv+anZ9Gxq3Z37LRik1bZR1hEDNWMRLyiCyh1ciG7k5QaHqWwUVNa6mwT
         +lnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Mtuou56iVHqZq7GnT52xFOik0yUH+vUoEUo9YJNa7/w=;
        b=ZsIZUgIb0q9ijATyIIMBEyiiclaMc760nUIYHqd+omqg8bCoKi8tyAtEO1tNxf6JV4
         ysi3Z/Mz3sQ5NLGBaXoAJbUlhwzJf12RnOJ+AUJ2VIlgJNPeLXi+dzKuAzw+maCoT56Y
         wvUvGhcCSFR36bluQ5xq1uKA9YcYxGM5GCRJgkzEYJjGbe1b8uBfCYBDMHmVUiQJFapT
         SS5Qny47Nu0mC1Vj0ewnATr6x4AWKquON1QExQh9VNdNwOAb1s2Lw2HrHXWyvSS8oWhL
         TfJLXh2I6Qh63un9VI3fpZ2gI9w1WTIzpnHWWD4UfhQVzD3Hb1qMFEb39rM3MvezVenv
         Jlog==
X-Gm-Message-State: AOAM532Vy0GelQjRr9032XeC/xHZG/WQyNw/+/FlswfHAWtuK4R10X72
        BchU+glbdT7sysS+KiMaYHU=
X-Google-Smtp-Source: ABdhPJyJfGRpyWPxotBNBjzvPFoyfNtIHUhbSNk21YdDCZhXDSRAEUKVF/3ATdlWyNTuaTZ29ZKX4A==
X-Received: by 2002:a05:6830:1515:: with SMTP id k21mr30695464otp.269.1618370771040;
        Tue, 13 Apr 2021 20:26:11 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q10sm3166007ooo.34.2021.04.13.20.26.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Apr 2021 20:26:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 13 Apr 2021 20:26:07 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Armin Wolf <W_Armin@gmx.de>
Cc:     kbuild-all@lists.01.org, linux-hwmon@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [hwmon:hwmon-next 30/32] drivers/hwmon/sch5627.c:439:79: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <20210414032607.GA241536@roeck-us.net>
References: <202104141009.37vhPPLC-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202104141009.37vhPPLC-lkp@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Apr 14, 2021 at 10:13:15AM +0800, kernel test robot wrote:
>    437	
>    438		data->hwmon_dev = hwmon_device_register_with_info(&pdev->dev, DEVNAME, data,
>  > 439								  &sch5627_chip_info, 0);

I fixed this up, no need to resend.

Guenter
