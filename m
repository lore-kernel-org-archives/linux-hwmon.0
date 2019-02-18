Return-Path: <SRS0=HSB5=QZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA594C43381
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Feb 2019 20:20:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9907A217D7
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Feb 2019 20:20:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qQyjbPQD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728443AbfBRUUv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Feb 2019 15:20:51 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:40085 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727400AbfBRUUv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Feb 2019 15:20:51 -0500
Received: by mail-pl1-f195.google.com with SMTP id bj4so9253406plb.7
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Feb 2019 12:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SY0cGADtZqFKNQOucqlh9aqj/jUR4lRzOMUJ2VL49L8=;
        b=qQyjbPQDuqN/wYC1lxORxOKl5AzwbKPeCzjTI+22hToqa6Vun+YTjo7Nczujxg3I7z
         1oKigelR9HqZmbAzxGB7dQ51Ddrxgt6YXvdAI7Rzvu0gLdkQ391P7yUH1enE1EGRRc40
         Mu1pLOct8zTjU6zKGoDb8jqOo05+xtA+2Jr1GzukFAtMbtGcNXYNGeHJmt7Czd2vatXN
         zSMDBuleFq0goMDJD2RpoKWTiWTdZcFp+ZD8cnB6DKVozeCzOsDBE4c6xBEwli3mdf90
         fjeLDhvRjfKzbfnb0FFYhd/8jutK3HHodvjb1X1sKslknJR62egYTBsvWf8COSrt7iwY
         nq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SY0cGADtZqFKNQOucqlh9aqj/jUR4lRzOMUJ2VL49L8=;
        b=XAdys5HTnhxQsLtZvviPuWvNp85MbWuBCISK/FzqWlIboHr0d8y6xgChIxtmtBGKQA
         nHu22E+lJkrzZD0kixkXSrFSaul5ddT+S3XtjlUF0JK/n1RmCT7/nKNa10fcRkhRP6WD
         s83OBAM+HWj8ayg4XHqqPPZhY6Z1TLX/2Poks217rF2srEOQnqb+TqGXTj0Tk3jCV79y
         GETEOMtvNL38Db4a/mLCtxqStgzD2USAcFjYDGj2IOEtspXnTWW+09WP+TwZKj1UaLw2
         qS0tmYP7PyhJPEm7SnCx4gWISIyBr7RTdwMoS3/Z1TwyhTPzAuNFkCHmQcB2zM+WeH4W
         9ArA==
X-Gm-Message-State: AHQUAua0ov6gXSWM4kaVDlEcbHEvLLhuE4KX4A0GvP5uFbFRpBJvhigB
        t62vGpV+ynD8bI4w79RyQ6ZP7yTM
X-Google-Smtp-Source: AHgI3IaCH3V8SSkEvAifLZbRH1ckZFA1pwleDFdKQ6pLCJ8fQqWXPULJ61GUsT6uLQddTisSW8eJHw==
X-Received: by 2002:a17:902:24e7:: with SMTP id l36mr27239188plg.61.1550521250137;
        Mon, 18 Feb 2019 12:20:50 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e63sm7749877pfa.116.2019.02.18.12.20.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Feb 2019 12:20:49 -0800 (PST)
Subject: Re: query for hwmon: (mlxreg-fan) patch
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <AM6PR05MB522493FB8E567BFFFE1A95EDA2630@AM6PR05MB5224.eurprd05.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <c5619fa9-b05c-5a84-26ec-382c7fed80bf@roeck-us.net>
Date:   Mon, 18 Feb 2019 12:20:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <AM6PR05MB522493FB8E567BFFFE1A95EDA2630@AM6PR05MB5224.eurprd05.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2/18/19 12:07 PM, Vadim Pasternak wrote:
> Hi Guenter,
> 
> I would like to ask you about the way of sending the patch for
> drivers/hwmon/mlxreg-fan.c.
> 
> This patch makes use of new "capability" register, but required commit
> "platform_data/mlxreg: Add capability field to core platform data"
> from platform for-next branch:
> http://git.infradead.org/linux-platform-drivers-x86.git/blobdiff/9b28aa1d0eae1be1016c8f4ba504545caff01da3..946e4e02b11889cb161b15ff4712a8ba21a50eb6:/include/linux/platform_data/mlxreg.h
> 
> Is it possibly to send a patch with such dependency? Or I should wait until
> "platform_data/mlxreg: Add capability field to core platform data" is got
> to upstream?
> 

A single series submitted through one maintainer, with acks from all
the other maintainers, is always the easiest. Otherwise one maintainer
would have to create an immmutable branch with the essential patch(es)
needed by all the others. Or, yes, you could wait for the infrastructure
to be in place.

Makes me wonder, though: If you are open to doing that, why the complex,
confusing, and risky mlxreg_wdt_check_watchdog_type() in the watchdog
driver (instead of providing a means for the driver to get the HW version
directly from the parent) ?

Guenter
