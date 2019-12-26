Return-Path: <SRS0=r35f=2Q=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB041C2D0DC
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Dec 2019 17:49:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C689F206CB
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Dec 2019 17:49:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GuJbsf/u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbfLZRtV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 Dec 2019 12:49:21 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36977 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726534AbfLZRtV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Dec 2019 12:49:21 -0500
Received: by mail-pf1-f194.google.com with SMTP id p14so13476502pfn.4
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Dec 2019 09:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Q1K9RtmQRYjQRpDSXJgj4RIeSDzn2njFukR3CdNDNCo=;
        b=GuJbsf/unFCYAusqGXYtdejpyhg4HRcSgO1APrPfply9jrzIvyoJiq6pZ8pxOCns+1
         lPLvv/PgvxqQgBpQ89sWg6MkStANIyxmOyPKrH+19krrCHAVc6t4HRIcSoIPuVKMojyJ
         Jxhs8yRdrGNL1PajKLeh0NGWvNSMhvar0MzXhy1KAm0QvzcmmJTeUIoyjSflhIHEI4s9
         FvSCLWs9CLVP4UU9Ro0e9gbepUDOsyXfFZ5mu8T8P0+xfQ5ntKpmIrL+lal8aQhOCSvM
         lL8Q4aMF5jKeDwhMTPaf04bgor9HberC4Vjw9EIPgDP4ttxcfAYO+nRCwZyjEyHvgLwn
         +pXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Q1K9RtmQRYjQRpDSXJgj4RIeSDzn2njFukR3CdNDNCo=;
        b=JzRGmV1XJ77w81wJb2IEX48uV3xNi9ODvnvIBL1zz8KbTqp13wpuqREvloWFLKXVyA
         lqKhWhJCqhwdiIeQMU5HMk1RdCdCznJ6PhgNz+x/YXALa/tKDbQqy3FYsqIr0mV/wSmo
         eGzZEQJ9rlCuWoGkZZrm0VwgME3FWzDc89WAZqRaTObmIbG5Fc+E2n2dwHMdHDAityMb
         vO/vEbYSw2OO8UXx5UwFPEfw6neolxupFNj37k6uFLghD7afPYic02w5zEJC80WUhKv/
         pbNYFbFveDoCcisU7Ifhrf6vZwwXlZ7dq7ZJSRjCzJoMWIjCW9PIkbXWLeIvAhmAB6OY
         3WfA==
X-Gm-Message-State: APjAAAX4vxCHoawCtzRKvRCoqzvL6gsE06YXA6PK1r6EP+vEZFlRzNuH
        XrPXfru8d7ZGfQX87z0VzSPmcphh
X-Google-Smtp-Source: APXvYqxl4RJXxUfkqHx3Vo6lII+ApYwBYplPMQ6zRta6mcfzby342YPCvdv7q8a67KtcbymUvpYZ0Q==
X-Received: by 2002:aa7:94b0:: with SMTP id a16mr49703728pfl.35.1577382560474;
        Thu, 26 Dec 2019 09:49:20 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e12sm11201002pjs.3.2019.12.26.09.49.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Dec 2019 09:49:19 -0800 (PST)
Subject: Re: [PATCH 0/3] hwmon: (w83627ehf) remove nct6775 and nct6776 support
To:     "Dr. David Alan Gilbert" <linux@treblig.org>, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org
References: <20191225023225.2785-1-linux@treblig.org>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <fe7d71fb-9daf-fcf7-0615-0117c63f506c@roeck-us.net>
Date:   Thu, 26 Dec 2019 09:49:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191225023225.2785-1-linux@treblig.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 12/24/19 6:32 PM, Dr. David Alan Gilbert wrote:
> Guenter pointed out that we should remove the nct677[56] from
> w83627ehf since there's a separate nct6775.c driver.
> 
> It removes a quite satisfying amount of code.
> 
> Built ontop of hwmon-next 848a25f01ee.
> 

Series applied to hwmon-next.

Thanks!
Guenter

> Dave
> 
> Dr. David Alan Gilbert (3):
>    hwmon: (w83627ehf) remove nct6775 and nct6776 support
>    hwmon: (w83627ehf) Remove code not needed after nct677* removal
>    hwmon: (w83627ehf) Now only one intrusion channel
> 
>   drivers/hwmon/Kconfig     |   5 +-
>   drivers/hwmon/w83627ehf.c | 624 +++++---------------------------------
>   2 files changed, 74 insertions(+), 555 deletions(-)
> 

