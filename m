Return-Path: <SRS0=H1Hd=DY=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE96C43457
	for <linux-hwmon@archiver.kernel.org>; Sat, 17 Oct 2020 06:07:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 43DC120720
	for <linux-hwmon@archiver.kernel.org>; Sat, 17 Oct 2020 06:07:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U6p4Mlar"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2411680AbgJQGDQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 17 Oct 2020 02:03:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2411675AbgJQGBg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 17 Oct 2020 02:01:36 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04614C0613A8;
        Fri, 16 Oct 2020 18:25:48 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id i12so4256205ota.5;
        Fri, 16 Oct 2020 18:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1OY4vbRstZY0AGALFDf+P1lCgcA6iSccF4ewjoFKP9Q=;
        b=U6p4Mlar10HZto+ovMoz/g5W2NVuoD93ftAg7d9N5Bl8ezDXulF9uEQQk40JzAWRuS
         dYSXMGhtq4hiHlruVhXedPydhkzRm/POKna7dbXDEbSnG3x9QFjJS+mtWDh+r3jcVp3r
         bTLCJIqCVFLLLDJoT6eQZudhqT//9Wvf/7enJNNH52DTaZcuyJgAfYyPXNSVEVUgYv5L
         /YSSoY2vXM+oDcgLhLpEKB2SEgww0hgXXWLMRPEHHmzb9bBCQPS5e9hmCZ20LO1nTRYR
         lYBVO1e9WrL74byIBvw3J12L44cLAR/senarmvo8VkuJu+xU+XLS+U/xWKZc9OqFdT5/
         aJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=1OY4vbRstZY0AGALFDf+P1lCgcA6iSccF4ewjoFKP9Q=;
        b=r8sBMHmGYj6c96ONXMAz0IwMWPGUvIviErelmzX0tGvunuAfLQPfKoGVNsOZFdnQdl
         zgGJ2u4HFoust+gKnbWjE/pTVdWCRd0/oDC+wlH/hAXV+gOuSrvNmVwRcK4En4+8qArS
         mYYbf1020e/wz+WiUIM4dS30LuPsScHtQ4gHn0NlMbUj9p9lBy0/XFsyVihonQhrxRGI
         oHF1/qPOiusSDR84jTEp3fZcU8wz0KD8lsNIAOevesmXQWls/5ZLXZRIOAwChPRtd7Vw
         D0VhI4EawUI8MR0FWgaGXYmzktK/CUTOehsP1xL3YNPxL0e/1y/Jp/5XL4QxStVJCl+v
         C57g==
X-Gm-Message-State: AOAM530L2/TAv3r3iqXxNZFYfgbp5iM21RJ3AJAa1ymfpfMu/yVpOE4f
        smUi07+oN/Fl0Tocn+4AbWk=
X-Google-Smtp-Source: ABdhPJxphmJkCql+c3zCiqTBlX2tOQjyRfoltYamh9bMknovT2CIh0w1wrNVw78q9TTPtL1swdnQWw==
X-Received: by 2002:a9d:1406:: with SMTP id h6mr4450957oth.59.1602897947627;
        Fri, 16 Oct 2020 18:25:47 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z4sm1520502oid.33.2020.10.16.18.25.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Oct 2020 18:25:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 16 Oct 2020 18:25:45 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] hwmon: (acpi_power_meter) clean up freeing code
Message-ID: <20201017012545.GA195203@roeck-us.net>
References: <20201007075148.GB2529578@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201007075148.GB2529578@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Oct 07, 2020 at 10:51:48AM +0300, Dan Carpenter wrote:
> This code works okay but Smatch flagged it as a double free.  I've
> changed three things to make it more clear.  1)  Remove the call to
> free_capabilities() in acpi_power_meter_add().  This call is a no-op
> because the capabilities have not been allocated yet.  2)  Set "*str" to
> NULL in free_capabilities() so that way the function can be called twice
> in a row without leading to a double free.  3)  Call free_capabilities()
> in read_capabilities() instead of open coding the free.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Hmm, somehow this patch slipped throigh the cracks.
Sorry for that. Applied.

Thanks,
Guenter
