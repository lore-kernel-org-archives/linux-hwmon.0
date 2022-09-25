Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C851C04A95
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Sep 2022 14:26:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbiIYO0h (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 25 Sep 2022 10:26:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbiIYO0g (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 25 Sep 2022 10:26:36 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAD002C66A
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 07:26:35 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id j6-20020a17090a694600b00200bba67dadso4501468pjm.5
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 07:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date;
        bh=PAoMVIYjjOvlQmjyxtmGAY3vyXiI4SINgpUarkS0qr8=;
        b=e43Us48eJJLBzXW3ncvbSRl9CeS5kyKs2L1fSclOv9pl+naFuqLIg8mk+kmgChfzbA
         Zmh5Pl2qMRYRb4hyTI2l44Y86WJETOntvHgXuaDSf9fY0I6OLklG1zHqUD6yHUlvmthx
         M4oIreVmPBqANiiXfUlf3gFdeW6QvJwEuT36mYabKxRyhjzq9G8yK8/BzqQTzbjpljSE
         6w1Rotp+4gaiadAvb2UojeTsBeqt+4YykIW/w/T7jFnC2QtZPPMVsVo3wY0YIjGjTAA6
         VkAjX/AqwCmvfxrqo1gQWWx0nCb22sgOyQlBu11k+VEsPYQDN9fso09iJWH9ZWhhNX6G
         N68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
         :to:cc:subject:date;
        bh=PAoMVIYjjOvlQmjyxtmGAY3vyXiI4SINgpUarkS0qr8=;
        b=3bowa0j5f99Q0J9H0NonNr9eBNHKQVnO/EIg2f8asbc//b13twpA0MHvmKzCyFc7Zy
         5/YgD5V2ezJHVa+IbWmU53YwKXJgxRjX5vfxUjtD+Oa7e5OTwIdjijFc15vFsKHVK/vq
         fPtvleYAH3OY0XPxxW08qPsTCMcxFLcTNclVjsFOY19PR/DQ93z94rRJQgEKw0azCNom
         xgrmWLkpVU0K44GknMVEv4HUu9xa2tUT9C+JGvAtaMqUalpJ1+o+nX710NrGPqd1QBFt
         CCE6r7hHSvxo2xqOBEL880vQaP94kA34Gs4jGjava+QwWenIY0Z2HnD3kWmWDj30Xgef
         AYYw==
X-Gm-Message-State: ACrzQf0gmgh7ioGFu8fwQhk80k8U4Y62ygaC/70Pl3soutbehpz4f1MA
        Si5JDkzOUw9A32JeL3s0fd3qi0a17aCdVg==
X-Google-Smtp-Source: AMsMyM43HD6RaAVr/NJVW2OAKMguewG7M9pMUdWoggVf67f7zRlOhUUv8LA78NYSx++fEpfcOGtS3w==
X-Received: by 2002:a17:903:2412:b0:178:796d:c694 with SMTP id e18-20020a170903241200b00178796dc694mr18038232plo.42.1664115995201;
        Sun, 25 Sep 2022 07:26:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y13-20020a17090a1f4d00b001fd7e56da4csm4866461pjy.39.2022.09.25.07.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 07:26:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 25 Sep 2022 07:26:31 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] hwmon: f71882fg: Reorder symbols to get rid of a few
 forward declarations
Message-ID: <20220925142631.GA1751571@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Sep 24, 2022 at 11:28:52PM +0200, Uwe Kleine-König wrote:
> Declarations for static symbols are useless code repetition (unless
> there are cyclic dependencies).
> 
> Reorder some functions and variables which allows to get rid of 42
> forward declarations.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Applied to hwmon-next.

Thanks,
Guenter
