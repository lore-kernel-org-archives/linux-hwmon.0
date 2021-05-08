Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57C71C433B4
	for <linux-hwmon@archiver.kernel.org>; Sat,  8 May 2021 15:31:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 327AF6128B
	for <linux-hwmon@archiver.kernel.org>; Sat,  8 May 2021 15:31:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbhEHPcJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 8 May 2021 11:32:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbhEHPcI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 8 May 2021 11:32:08 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BD08C061760
        for <linux-hwmon@vger.kernel.org>; Sat,  8 May 2021 08:31:07 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id v22so6742492oic.2
        for <linux-hwmon@vger.kernel.org>; Sat, 08 May 2021 08:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=SuDx0vGfKJV3RXH6BSiFLAspiwM/ZvdykMUiBTdCCTk=;
        b=e6qiiSUa0vWrbHr9l9x8Q2aqoR66m+mAl7O5R9POGIu+BHdS/KsVghFeAVUW6PBW0g
         o6eCv8IzHtOCUws7siHrDaxbKmDTLTJ+YF1DnjITjSvjRhKW8snGU4R8A7yXeyVcun8H
         N7z9J3GvPu8K0Wft/1Ih0qK53OAxWAMMe+dirfW09u45vUffD8mxEyHEIA6Vx4Nz7dM9
         Od9Yw5vsH/POLFOxiMpCmSRqf7y8w8rKLF+lusPcYKOmQ0D0kRP0yZ9gRvW8PZCI5Rr8
         HCmana+CsqKIKQsgxD+JM43xipAYHOoet9sVsZ1dF7Riyk/2uFkZeK5a7bif62WFCy53
         CH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition;
        bh=SuDx0vGfKJV3RXH6BSiFLAspiwM/ZvdykMUiBTdCCTk=;
        b=A2ZvC0SZzQFeq76OTrG73o+7BVu+SavkhsHU9TMctWmP1pvEMODcvsFK7HpBqlaX2m
         VlKrvU/XB8IwS01RDIq/h5ajFRyantNUB3Wr7XyKW00uDWl8BATgPii2T9pddi6d08TI
         LNb6/hIDsKQOwC34pW1fgmNBMy4NsX7vM1q8Zp5jjJ+hf6xw5n7F2IFpN/xqQJSCP41Y
         8tpVU959Ihq1RhLt3jRkxlt+K92GzlqH5lg00Hc1yBizoxOmAjJpAOajfrIJnKpG3z/7
         oPg2tls9HmawIekvgFdHCqvcUJEPJm86wOar1kjh94sGs7UmMh84iJJq1cs+4DssJuQP
         yb7A==
X-Gm-Message-State: AOAM533fa/laUP42oaIPUgkN79MdSz+HDi2MTYMzRMzAk9nzmphsc5Xs
        /gbPb6SY/dB0kyAsxv5mD8E=
X-Google-Smtp-Source: ABdhPJzhW4EZGQGIBWpizl43l/8fTdOHjIG75OuuzWehQBnSCH1dNy5Kp92+w5UESqZd2+cNbMNf8g==
X-Received: by 2002:aca:1009:: with SMTP id 9mr813931oiq.52.1620487866402;
        Sat, 08 May 2021 08:31:06 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e26sm121931oig.9.2021.05.08.08.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 08:31:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 8 May 2021 08:31:04 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Tiberiu Breana <tiberiu.a.breana@intel.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (max31722) Add support for MAX31722/MAX31723
 temperature sensors
Message-ID: <20210508153104.GA3116801@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On Wed, Mar 30, 2016 at 07:16:24PM +0300, Tiberiu Breana wrote:
> Add basic support for the Maxim Integrated MAX31722/MAX31723 SPI
> temperature sensors / thermostats.
> 
> Includes:
>     - ACPI support;

> +	{"MAX31722", 0},
> +	{"MAX31723", 0},

Those ACPI IDs are invalid. Are they used anywhere ?  If so,
can you provide references ?

Thanks,
Guenter
