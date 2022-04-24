Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BCD1C433EF
	for <linux-hwmon@archiver.kernel.org>; Sun, 24 Apr 2022 16:49:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234211AbiDXQwO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 24 Apr 2022 12:52:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbiDXQwN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 24 Apr 2022 12:52:13 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0137328E0E
        for <linux-hwmon@vger.kernel.org>; Sun, 24 Apr 2022 09:49:13 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id r14-20020a9d750e000000b00605446d683eso9220815otk.10
        for <linux-hwmon@vger.kernel.org>; Sun, 24 Apr 2022 09:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=DwRo0pGNGvKXUP6YVNPvbQmwvkG+awRzZfzLVTlyqVc=;
        b=c9kcuc+tSc3aOX+OLa1/KCM/B8EqeaYEth/h31Ww8uNKpQOVjJL8VYRdLUvZXuYpT+
         IMVoBkb5kVmIrDorLMAVjLXHDSsp0r4DJlu9VtnL658IV9tTUWRVA/tdCajGmWQ8FC1O
         yAHaZbvsy+BRVajm3jrbu1v3SqqE9g2fy9J7910J6JNutRlIxGuYAHqtG4Y+6wv4ZiUy
         jc7smmmPOlqNdSkrjYIAdNzsIGEFU+xhRgXYi2nDcYhTNj8QHg0Zv8Wbwf9qiXBwGVZX
         KuUILWsX5bWnVT9eLjXz+husD0irLCF/Q5ezX/aLHyd5fNauotBmDAZjB7+A3S6Fj+2+
         mejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=DwRo0pGNGvKXUP6YVNPvbQmwvkG+awRzZfzLVTlyqVc=;
        b=DdsjNbcm6Ca/KNe6KjFmbq81Nsmp+NwIFgWp3IeJlNvh3WD4QioY7V/NywvC8OJzSR
         5EILNYblHYly4iQ3PbiP9QN8MG19Az9iSTnChIHn0BTiT0ZHfoKbJajG5b3kOqFhpiDl
         Syw4x9CmB1O24kGzQkM+jJzVLOJL6bmOtlM92M9Ff70w3gu6wcfgdRT+mxriwL6RfpOO
         Fn1grX1KLKTOQE8ER+8eVlzxslIB+T3saIiKLowl5e22HD4VPZ1KMPo5oCnLc1ZGf/2h
         M/t8Z4FcrLFJf20C5Gla1bHpmr5RZiANwblng17bWL6S8IaOGo/RlRMyBJQSi+LmX6w4
         mrQQ==
X-Gm-Message-State: AOAM530io2hq5BK9rG7ANV8xgG5EPPQPheiOL1Uii+8fqXgEy9vxcs/y
        kniCGg8KKK0Qpo1UHl6aE4x9erwxeIA=
X-Google-Smtp-Source: ABdhPJxMIKEzMVjmlPSjeZijS4S/+deMQ1uWzGGTZuI3KbgXYHvz48VJpAA2i29tHxDs+aI8azizUQ==
X-Received: by 2002:a05:6830:1d61:b0:605:4956:c1b0 with SMTP id l1-20020a0568301d6100b006054956c1b0mr4904321oti.118.1650818952361;
        Sun, 24 Apr 2022 09:49:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 123-20020a4a0181000000b00324a1217e96sm3280870oor.35.2022.04.24.09.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Apr 2022 09:49:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 24 Apr 2022 09:49:10 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?iso-8859-1?Q?M=E5rten?= Lindahl <marten.lindahl@axis.com>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel@axis.com
Subject: Re: [PATCH 1/2] hwmon: (pmbus/ltc2978) Add driver specific regulator
 ops
Message-ID: <20220424164910.GA747863@roeck-us.net>
References: <20220406124321.1184133-1-marten.lindahl@axis.com>
 <20220406124321.1184133-2-marten.lindahl@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220406124321.1184133-2-marten.lindahl@axis.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Apr 06, 2022 at 02:43:20PM +0200, Mårten Lindahl wrote:
> Several of the manuals for devices supported by this driver describes
> the need for a minimum wait time before the chip is ready to receive
> next command.
> 
> This wait time is already implemented in the driver as a ltc_wait_ready
> function with a driver defined wait time of 100 ms, and is considered
> for specific devices before reading/writing data on the pmbus.
> 
> But this driver uses the default pmbus_regulator_ops for the enable/
> disable/is_enabled functions. By using these functions it bypasses the
> wait time recommendations for several of the devices managed by the
> driver (ltc3880/ltc3882/ltc3883/ltc3884/ltc3886/ltc3887/ltc3889/ltm4664/
> ltm4675/ltm4676/ltm4677/ltm4678/ltm4680/ltm4686/ltm4700/ltc7880).
> 
> Lets add driver specific regulator enable/disable/is_enabled ops which
> takes the wait time into consideration for the specified devices, by
> overriding pmbus_read_byte_data with internal ltc_read_byte_data.
> 
> Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>

This patch solves the wrong problem. The real problem is that the
regulator code in the PMBus core writes direcetly into the chip
and doesn't use the driver functions to do it if needed, and that
the PMBus core does not support a chip-specific write_byte_data function
(because so far it wasn't needed). That needs to get fixed, and then
we won't need chip specific regulator functions.

Thanks,
Guenter
