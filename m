Return-Path: <SRS0=tzLi=6H=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E1E8C54FD0
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Apr 2020 19:11:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5818920767
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Apr 2020 19:11:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+5OBZ9z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbgDWTLZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 23 Apr 2020 15:11:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726447AbgDWTLZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Apr 2020 15:11:25 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 147D0C09B042
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Apr 2020 12:11:25 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ms17so2911522pjb.0
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Apr 2020 12:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=e6uIa4R9TXrCM7Yf8yVNTQtmT8ruDa0qYoboyjeu6w4=;
        b=S+5OBZ9zZprtRpRJY7+Oj6/1nIpYBKDSEOHwg79BZHsmldAo901RoHevCNEWnsPvM5
         ee4G9j1Xn83MQ90CaQnLQrWPovvv8vqWKJGXzaOPV09Bg1bY9gFAZlVvdtyY7lII8OSu
         MpVvnYF6Ld2K1HSpcVXhWo2UYDghmj20qmO2QRixMXhXJxrt6TllJ4jBRL9Nz5uuXr/Z
         2L7czz8v3piD0gDXsPrbRAR/HKptBPmGB00jTbU2n43V0wvnPsOw8NqO0VDcoa6ej64G
         btALc5s6FDHqtQwe6JUe0fCqX7PcDBlDrrovdPF0d5Fw8DLU9DV+mCEuW6+7awN1kehh
         hopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=e6uIa4R9TXrCM7Yf8yVNTQtmT8ruDa0qYoboyjeu6w4=;
        b=etiFEN+FHhVfHwcC9LmIso0QiDjbtI7hj+f/PTq0vSsmr2coG/jbxbly+Z8I9N4s6E
         YJbU//PWkyvaSN4miDiA4AYihAno2J6nV4+WoAHQ8d+otXLr4itIBhDJuXusLvy2grKZ
         HhYDrDFkQKQf+Z7WIYNkr1CMXXO92nAm5zllgnLaRV1t/laVYtzHedA5m2GXQGlugnuP
         4nNnj/DnstLGnol7l40DzGV88B+kwE+TsqYRIPMe6g7ZdYjyrMlDWb4OX8LCfbiz0mib
         AFxXYd2B/h7UkrefqSvMf4pDzLf2k9RDQuC1CMrxunlq11uSYgLhiKWKNmPcLGydYTDf
         3f3w==
X-Gm-Message-State: AGi0Pub2beUzNOy8bAU27SUNRXEh1YcvGflvJgNUh/YgCsbdVFLEkWO9
        CNZxvd5rCybjA6qv7uMrHTQ=
X-Google-Smtp-Source: APiQypK2YsLZVFugIFcjmz5GKQCLhMMk80N+/EPtakuBrMZuEdPhGApg+lgfKOaMofnBl8zE4pFfQA==
X-Received: by 2002:a17:90b:b08:: with SMTP id bf8mr2258957pjb.158.1587669084624;
        Thu, 23 Apr 2020 12:11:24 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w11sm2770223pgj.4.2020.04.23.12.11.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Apr 2020 12:11:23 -0700 (PDT)
Date:   Thu, 23 Apr 2020 12:11:22 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Naveen Krishna Chatradhi <nchatrad@amd.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 1/3] hwmon: Add amd_energy driver to report energy
 counters
Message-ID: <20200423191122.GA174316@roeck-us.net>
References: <20200423175005.9072-1-nchatrad@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200423175005.9072-1-nchatrad@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Apr 23, 2020 at 11:20:03PM +0530, Naveen Krishna Chatradhi wrote:
> This patch adds hwmon based amd_energy driver support for
> family 17h processors from AMD.
> 
> The driver provides following interface to the userspace
> 1. Reports the per core consumption
> 	* file: "energy%d_input", label: "Ecore%03d"
> 2. Reports per socket energy consumption
> 	* file: "energy%d_input", label: "Esocket%d"
> 2. Reports scaled energy value in Joules.
> 
> Cc: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>

That was too fast. I just finished reviewing v2.

Guenter
