Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46424C54EE9
	for <linux-hwmon@archiver.kernel.org>; Tue, 20 Sep 2022 14:26:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231795AbiITO0r (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 20 Sep 2022 10:26:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231807AbiITO0a (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 20 Sep 2022 10:26:30 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB2883F317
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Sep 2022 07:25:55 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d24so2553306pls.4
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Sep 2022 07:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date;
        bh=bcx8RtVjcYFIvVgXWx6GIztH9f27AKbF+ni0baIW3XA=;
        b=bkWFlLIX+aT8K52+plBK0eFlw2u3r/Q6YMH8i0AfMDdTss+N/f0Xcuryrz4Qqv8qkc
         oXTSgJo/PqDtDhvNL28MI+MAI3oADJZy7u/9BY0oVYgEdQT474PM/lkY1ePMCLVHCc6G
         +0SLFeUrmGLRiZif+5IIWEY7rw2OU1vy1cTtJj5112w3ZGxLKV5y2nEWZkLBLYboyvwJ
         3ZLx5dtGeYaA3Zxr8ZFtV1YC8jslgMb488maqUnfsZhpDU0MMKnxKLHGVPJlHtZKF8xo
         A6smsiIKvOvKsJeL3hsk59Ve5Y+iFAkQGAJ6Yia1IH8mbU2XB2D6/tr4fJGgNACpYdym
         DV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date;
        bh=bcx8RtVjcYFIvVgXWx6GIztH9f27AKbF+ni0baIW3XA=;
        b=1qg0YZukzQKqrefReKzBORd8fgt3h7h+shDOO15m8pm30Cd0w+uo4F5tcvfJtO9cwf
         JTvg5WuJcECtoXR0nHsKZdDDdNokjQRuFffOI761u8oaXu4z6v67MpSptOapGn38sOWT
         DhMJVQVuD3orBrxTnwanEdnQbNiGdNbQ6dzZdJ/AaUcu8X89TwUnIP8tW3Le/PKWDymh
         8w0NhmfVe+k3VuWBtISfFLdpspvf2uH58lt0NO3rWFNvqwLJ4MVxskcy588gd1w4wJkc
         2yGN3sfFqRzuW8d106OMk458hrafXrj7PdnwdqweW5VcRDtzK9WfU6pVHcMBaIQ/+Smm
         r/Eg==
X-Gm-Message-State: ACrzQf16wdCfQ0ak5I1sEe6K1upBUq0IWzDMhPWDklIhbK85zWbayJig
        tGSrmTWR9t1yJrF+1Pclk0Y=
X-Google-Smtp-Source: AMsMyM7sTku9LQKLgXWU0D0zSvpEBGhXX8vwWHRFbKiPyuZHx83Ln8IuYMK8GA4hNjsbBiuQWHf4Qg==
X-Received: by 2002:a17:90b:180e:b0:202:a0c3:6da with SMTP id lw14-20020a17090b180e00b00202a0c306damr4081316pjb.94.1663683955044;
        Tue, 20 Sep 2022 07:25:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z129-20020a623387000000b00537daf64e8esm1726151pfz.188.2022.09.20.07.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 07:25:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 20 Sep 2022 07:25:53 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jim Cromie <jim.cromie@gmail.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 2/2] hwmon: pc87360: Reorder symbols to get rid of a few
 forward declarations
Message-ID: <20220920142553.GA3928095@roeck-us.net>
References: <20220919103155.795151-1-u.kleine-koenig@pengutronix.de>
 <20220919103155.795151-3-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220919103155.795151-3-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Sep 19, 2022 at 12:31:55PM +0200, Uwe Kleine-König wrote:
> Declarations for static symbols are useless repetition unless there are
> cyclic dependencies.
> 
> Reorder the functions and variables to get rid of 6 forward declarations.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Applied to hwmon-next.

Thanks,
Guenter
