Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83889C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 Jan 2022 14:12:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350782AbiAUOMO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 21 Jan 2022 09:12:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344906AbiAUOMN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Jan 2022 09:12:13 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C176EC061574
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Jan 2022 06:12:13 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id a10-20020a9d260a000000b005991bd6ae3eso11875059otb.11
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Jan 2022 06:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SSwmXQZDbC3qlpmnXNdLFNvAx1tOvySK7UuCW1X5YyQ=;
        b=bQZbXZ+6q8mMWgJAoqyj2nEymVC/ey4YcXH+coQF6KO3UUdQLrrlRrv/6ppjBVCEQx
         GUyW+SZnpBaTPy15AxtznE7TYAJ80Vj7As3CCbqNvooELlwP1STC4xxiFGnZhLyiRLaU
         JhkTz3ZU/es68TxXRFq5f+2f0/0ucvKu3wHX/vI69SbaqmpqtemJfhWQi9CONd2ZTDPU
         uYnxHUxc8jTUS++yVSJGGcFHJhC3tCitFBSsIygCcSQN1KHt+9xYOeQjRa/rcQz7axBb
         GiLRGFFVkA8uq37XxISHnNrNeYZ9vcGEFNantFuPefXRphjEN4pSYmvcfkRzFWTnzTZW
         NMGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=SSwmXQZDbC3qlpmnXNdLFNvAx1tOvySK7UuCW1X5YyQ=;
        b=y6s4BZUD8WlKw29/p3HeVb6SuXPraoo/SDs1BIOxf/DhhgXICjpsJW70IABXw5rPS9
         N5tTX21VT0WusVwGbKJtmyMJLM2aT7zjUlDzgjJJHcXg/8bnaCmTrsNcCW9mWknXXeJm
         sBvwXdYywo1P2f/qjNeETh9BzPHtjtenhwPU3CVbOcy08f9ZTtNpZ+B0mKpn/6hiWpiA
         aD331qG3LKmpA3T0uHamdqp4eSSCeK7J5ygyB2Mqh70AEO1OcZTFfO5ABmiuFsV/eQn9
         vRNSIWUwxkEo5Ks6CqForrQ6eF7W+/5377ctVJMqBtWL07WDhN3ejrP1UWWHq/x0eR4g
         i89w==
X-Gm-Message-State: AOAM530nSX8a7SzveNuDjY4EV+z5QaW4lqQAqFAdg8kvWgEUwhSLnbMM
        lN1WGomqw80cEK8ZKQvwcLAns2XOPOw=
X-Google-Smtp-Source: ABdhPJyvatbgjkFbpHxMwR+OGO8pIWOdmQ4A9UbEyg7WcBoNjdvJvfN2VTliwCA52EYUqrb5nJ9Q9Q==
X-Received: by 2002:a05:6830:b87:: with SMTP id a7mr2919096otv.109.1642774333183;
        Fri, 21 Jan 2022 06:12:13 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w13sm1365817oik.52.2022.01.21.06.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 06:12:12 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 21 Jan 2022 06:12:11 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     michaelsh@nvidia.com
Cc:     linux-hwmon@vger.kernel.org, vadimp@nvidia.com
Subject: Re: [PATCH v3 2/3] hwmon: powr1220: Upgrade driver to support hwmon
 info infrastructure
Message-ID: <20220121141211.GA308448@roeck-us.net>
References: <20220118075611.10665-1-michaelsh@nvidia.com>
 <20220118075611.10665-3-michaelsh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220118075611.10665-3-michaelsh@nvidia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Jan 18, 2022 at 09:56:10AM +0200, michaelsh@nvidia.com wrote:
> From: Michael Shych <michaelsh@nvidia.com>
> 
> Reduce code by using devm_hwmon_device_register_with_groups() API by
> devm_hwmon_device_register_with_info() API.
> The motivation is to reduce code and to allow easy support for similar
> devices by the same driver.
> 
> Signed-off-by: Michael Shych <michaelsh@nvidia.com>
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>

Applied.

Thanks,
Guenter
