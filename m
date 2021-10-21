Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B207C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 18:17:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11CCB61AAD
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 18:17:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbhJUSTP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Oct 2021 14:19:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:39600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229550AbhJUSTP (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Oct 2021 14:19:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E1E5261AA9;
        Thu, 21 Oct 2021 18:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634840219;
        bh=rwoABGE/r/pC+L0hxeOj1lqBA0lukyECBcpUXErC6dE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I9MJMaXWorqjuPhliWm1Oe1isF/Z7k6w13vu3lhPJngk7j77CJ9+9scKgdB1ukLJB
         FYeZ8Ev55TGUpXIxGHj2p980IPFP1fKh5/KNGb27NduiDaxLfEtbJxx531MVmqAR9N
         ULlIUwY/NnfeHrURQsRoqdHbxPplOmm/fNmDQYlV8xQAb64opu/CumZDJtlhMKoDCe
         XTp8QMGYY1pigmjGb9wr/nag13i9p08Zo2KNzUWEkA6ebDTnQD84h/6x39gXTvDmRw
         zx6jiI6RUdvYKdX0UGx5UgDLPaMN5g5ijlpqCEL0b6WfMS/3VOYkhTTgqqS6dcmrZx
         MJid9y8RLcC+g==
Received: by pali.im (Postfix)
        id DAFE285E; Thu, 21 Oct 2021 20:16:56 +0200 (CEST)
Date:   Thu, 21 Oct 2021 20:16:56 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     W_Armin@gmx.de
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/5] hwmon: (dell-smm) Sort includes in alphabetical order
Message-ID: <20211021181656.pnwatgk5wkpg7way@pali>
References: <20211021175447.5380-1-W_Armin@gmx.de>
 <20211021175447.5380-2-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211021175447.5380-2-W_Armin@gmx.de>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thursday 21 October 2021 19:54:43 W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> Sort includes for better overview.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Acked-by: Pali Rohár <pali@kernel.org>

> ---
>  drivers/hwmon/dell-smm-hwmon.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index af0d0d2b6e99..9773d6c0477a 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -12,22 +12,22 @@
> 
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> 
> +#include <linux/capability.h>
>  #include <linux/cpu.h>
> +#include <linux/ctype.h>
>  #include <linux/delay.h>
> +#include <linux/dmi.h>
>  #include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/init.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/platform_device.h>
> -#include <linux/types.h>
> -#include <linux/init.h>
>  #include <linux/proc_fs.h>
>  #include <linux/seq_file.h>
> -#include <linux/dmi.h>
> -#include <linux/capability.h>
> -#include <linux/mutex.h>
> -#include <linux/hwmon.h>
> -#include <linux/uaccess.h>
> -#include <linux/ctype.h>
>  #include <linux/smp.h>
> +#include <linux/types.h>
> +#include <linux/uaccess.h>
> 
>  #include <linux/i8k.h>
> 
> --
> 2.20.1
> 
