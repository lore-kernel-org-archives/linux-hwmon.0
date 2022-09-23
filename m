Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF6C4ECAAD8
	for <linux-hwmon@archiver.kernel.org>; Fri, 23 Sep 2022 00:23:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbiIWAXJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 22 Sep 2022 20:23:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbiIWAXH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Sep 2022 20:23:07 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A75BD2D40
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Sep 2022 17:23:06 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d82so10827392pfd.10
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Sep 2022 17:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date;
        bh=PVz4+KG4uVnWFqA/L34GT5jB4HLWhw19briLxrO2RjM=;
        b=Vwbrx13pF4faKBw74Zfzhu9hTrnTlr70zS5f7gXOGo6owj7revBbeHWAw4YGD4qQFE
         L91XgpEAxC8+gUFdqCa8DrNZ5A9frHUGfbTvxHrAdrkAt4wKNkSTQoJb5pecykvxCtQb
         kxpWmpEnf9OKuW5SzksIO3JMP9K1LOKUaPbL7egD0sACLQ55tmsJl1wx3zwJjx1lblLs
         W5BZa1PCrACmPv3ZZ2U6fc3ZjSnaXxGBLHbFjnsPvbGe0SM1y9GYJ+DP3sA6oyg84jCr
         HIs8xGfvtyJHZWHPBdn5rwx6eYEF0YqyNqW6xB+SC5EzML4p7nHXDKhhyqZB1iw/PPo7
         bkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
         :to:cc:subject:date;
        bh=PVz4+KG4uVnWFqA/L34GT5jB4HLWhw19briLxrO2RjM=;
        b=Ub/qMijh/lPJptAOva9eJpMKNL/LYI5lAFdJryCmpj5eNzr7hN6s3u2m1ATmHcTbHu
         DuPmOHLUpfsrWwu1U5TbruL6DW+oFqqWxeTWZuXlEKwxqLMoRLs6ACq2vxXbVHRdV/6a
         kiFRjx5lIzR3JTp/FvzldvT6J3xi4tMGyTP6GuAoW/JjaapTHhU+itgbs58cUU/LwRgW
         4xAReEA0QNIrsfgl6P4H+9M45Ovj+p/2Dx4fwdoHna5rp/HgIo408sVmv4pJQR9DRnis
         9p9QuTsqIcqH1Gt+lb1fH2lCEKlbkR8BxepvcNeWOlH0CL7y1Z2TZUOYnNd7JAuSYSa9
         8ocQ==
X-Gm-Message-State: ACrzQf2gnpB32FP8ZWDO65kJo6nxBd5ZtYvlk4UsXFTExc5/Kn51LsIa
        G3lFuffKBrp/rGXyexWDwtg=
X-Google-Smtp-Source: AMsMyM5GPpk9HEm5BPR1hNeqOZT+4aFgAlbZvnxViYpOItICrz0HuHfc5R7SXRLZJnMuu5KF917W+w==
X-Received: by 2002:a63:8942:0:b0:43b:e87e:3fc0 with SMTP id v63-20020a638942000000b0043be87e3fc0mr5323110pgd.531.1663892585845;
        Thu, 22 Sep 2022 17:23:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c12-20020a621c0c000000b0052d4cb47339sm4959018pfc.151.2022.09.22.17.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 17:23:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 22 Sep 2022 17:23:01 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        UNGLinuxDriver@microchip.com, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH] hwmon: Make use of devm_clk_get_enabled()
Message-ID: <20220923002301.GA1159397@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Aug 08, 2022 at 08:06:40AM +0200, Uwe Kleine-König wrote:
> Several drivers manually register a devm handler to disable their clk.
> Convert them to devm_clk_get_enabled().
> 
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Nuno Sá <nuno.sa@analog.com>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

[Finally] applied.

Thanks,
Guenter
