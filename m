Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C068C38A02
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 Oct 2022 18:16:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbiJ1SQI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 28 Oct 2022 14:16:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbiJ1SQH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 28 Oct 2022 14:16:07 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DD0A230AA9
        for <linux-hwmon@vger.kernel.org>; Fri, 28 Oct 2022 11:16:02 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id bb5so3959981qtb.11
        for <linux-hwmon@vger.kernel.org>; Fri, 28 Oct 2022 11:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8FEjwmAlGCF9DftBi4q3gPLOuGfhXXV/QT/oQnizxu0=;
        b=XrFsWJmsIhUYGTlVezfOR3jNzu9w04q0b8eDff/C/mjyWcwWR4qJUi+QpD702iJl/D
         EFJ5EuJjnPsdg4FnEaw5PQdvIIObEez/jixTMnFdOFMr+8alDBkss2zGWqW5bHXNNHrh
         evVTE5fFgvTnrnBf7aGE6X6rWDD7bp2QleOIauY153Bm8DoY7IAeVzbVx+6OCMDGthhN
         swIoYhsIDZEWx6IjdSzFkKkCJWCoyYzbCcVRdkm+Z21l3z4pkD1cbO9p2XQO3mFnxN41
         5AZZL5ftBG9QfqOyRKp0/s5X5OL1jrq39rsU8qbmCGxv8Rx9Sm3ur5C4OxudwUQ6Jox8
         Saeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8FEjwmAlGCF9DftBi4q3gPLOuGfhXXV/QT/oQnizxu0=;
        b=efySS6K20BxD4uzvYYYeRK/jwZZPVWLYLJIz5JrrgHXX3IjRIRBcu14EsUXyomucLj
         2XwoChpqQbEwQJnI5FjF60Bh1kKieQWoaQXmfU/XrHRymdC845x5tEcjJV9xXVPfwRZs
         kD3VkGibC8wQmHx/IjODC/QgojNuGleEWzRGy62S91lzAe0nfGvhtqW3S0DNaFhGzH+U
         vzMfICAogIJgNxMWe18TZb7Yon8VjH9lCOG2rtTDtBbKlKx3/yt7f+nFaR9Ca5XaQH8+
         T0+oK68IflXtonXyUHTg1ti6wOm9j/YbkvNDKxdz5gmXZhoiAZinBU+/vJJoKaZJ33an
         WbRw==
X-Gm-Message-State: ACrzQf1IYiXIuxBS74ffCU6WxcDL0HY1uDxXnjl715o2IK6dThB8mauh
        /Q0S0oNElwqdfZn9S9hRsd9ZQIwYR5E=
X-Google-Smtp-Source: AMsMyM6RRWYP3gfudYAyWl1zSJ6EmUwFrS7su5w1LPn7Yg/Aex0MSE293KNwb8yJZYHtvMnllhfoHg==
X-Received: by 2002:a05:622a:1747:b0:39c:d4f5:a65 with SMTP id l7-20020a05622a174700b0039cd4f50a65mr646310qtk.583.1666980961504;
        Fri, 28 Oct 2022 11:16:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h129-20020a37b787000000b006e702033b15sm3353300qkf.66.2022.10.28.11.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 11:16:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 28 Oct 2022 11:15:59 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Felix Nieuwenhuizen <Felix.Nieuwenhuizen@etas.com>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v2] hwmon: (pmbus/ltc2978) add support for LTC7132
Message-ID: <20221028181559.GA2132092@roeck-us.net>
References: <0221027133201.GA566451@roeck-us.net>
 <20221027145135.31802-1-Felix.Nieuwenhuizen@etas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221027145135.31802-1-Felix.Nieuwenhuizen@etas.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Oct 27, 2022 at 04:51:35PM +0200, Felix Nieuwenhuizen wrote:
> Add support for LTC7132.
> The relevant registers in the LTC7132 are identical to the LTC7880.
> So it's just a matter of adding the chip id.
> 
> Signed-off-by: Felix Nieuwenhuizen <Felix.Nieuwenhuizen@etas.com>

Applied to hwmon-next.

Thanks,
Guenter
