Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7920C43460
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 May 2021 16:48:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A908C61186
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 May 2021 16:48:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233204AbhEMQtz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 13 May 2021 12:49:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:40156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232140AbhEMQtv (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 13 May 2021 12:49:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EF0CC613C5;
        Thu, 13 May 2021 16:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620924522;
        bh=pxG4h1WBtMli0Iv08RAN89MSEdJhBFTcSQToehtrm58=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oLm2FFyfqfv6kQKEVGbmz6ksu60cbIzvvK7ftcCLlGaoOSWeeuR3gAkmiTxT2pyUs
         CU2/FKDC2AcltGG6t4AGGUJ7dy1wzVNCG6oi3NtN7HPRri66qDwNPs8x1Wz27mV1Wu
         lSPnow47TaOa6UXEPE7eePF+aMi6Pvzua2Vh8Qso9mc396jpq0OeopenUW8plbjp2L
         2nGAiYIeRO9wBm+24bltiJAxbi6DQ6GMcRWlo1Xnc5YygbqDdLD8mgs+56meQzdfAz
         0iXXgwU/EBCRby3mbDWRaol0b2XE+Zbjv3vivOK0mD2cLw4htcyDPj/pAHjF0Zvl/f
         Cj1irOapMdF/g==
Received: by pali.im (Postfix)
        id 19FD5715; Thu, 13 May 2021 18:48:39 +0200 (CEST)
Date:   Thu, 13 May 2021 18:48:38 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     W_Armin@gmx.de
Cc:     linux-hwmon@vger.kernel.org, linux@roeck-us.net, jdelvare@suse.com
Subject: Re: [PATCH] hwmon: (dell-smm-hwmon) Fix index values
Message-ID: <20210513164838.eacakojhvtb2se2e@pali>
References: <20210513154546.12430-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210513154546.12430-1-W_Armin@gmx.de>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thursday 13 May 2021 17:45:46 W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> When support for up to 10 temp sensors and for disabling automatic BIOS
> fan control was added, noone updated the index values used for
> disallowing fan support and fan type calls.
> Fix those values.

Do you mean this change, right?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1bb46a20e73b0bb3364cff3839c9f716ed327770

Yes, it looks like that it should have been part of that change.

Therefore I suggest to add Fixes tag:

Fixes: 1bb46a20e73b ("hwmon: (dell-smm) Support up to 10 temp sensors")

Otherwise looks good!

Reviewed-by: Pali Rohár <pali@kernel.org>

For future development I would suggest to rewrite/drop these magic
numbers as same problem can be easily repeated in future.

> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
> Tested on a Dell Latitude C600.
> ---
>  drivers/hwmon/dell-smm-hwmon.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 2970892bed82..f2221ca0aa7b 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -838,10 +838,10 @@ static struct attribute *i8k_attrs[] = {
>  static umode_t i8k_is_visible(struct kobject *kobj, struct attribute *attr,
>  			      int index)
>  {
> -	if (disallow_fan_support && index >= 8)
> +	if (disallow_fan_support && index >= 20)
>  		return 0;
>  	if (disallow_fan_type_call &&
> -	    (index == 9 || index == 12 || index == 15))
> +	    (index == 21 || index == 25 || index == 28))
>  		return 0;
>  	if (index >= 0 && index <= 1 &&
>  	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP1))
> --
> 2.20.1
> 
