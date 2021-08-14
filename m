Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD725C4338F
	for <linux-hwmon@archiver.kernel.org>; Sat, 14 Aug 2021 15:05:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C3FD60FC0
	for <linux-hwmon@archiver.kernel.org>; Sat, 14 Aug 2021 15:05:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234665AbhHNPGD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 14 Aug 2021 11:06:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:52392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234654AbhHNPGD (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 14 Aug 2021 11:06:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 976C560EFE;
        Sat, 14 Aug 2021 15:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628953534;
        bh=6TAdKwvlHath+Ke7jGM9JHV9+qNGubogLYJGzOM3CGg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dABS8NipJq7DZxiFv8VKvzE5N3B09cjsZ4ApkxSPj03KkF/l+px8awgboc/Ah7vOM
         zUr9UrJWbjmUQTNJWPigEktMdEmUVyrchCE860uPaAvg4GBauhlVbu7Wttv9QGqN7I
         o+WpqyLrQXwjWNIuVDUsjJ04HoV8iB4Mse48imLnC/cwqewxKDM59OundBuhLR/iOy
         RI/xXkUFVOqYhiGKSk2SIu9xk7W3MkZP/Jof+U4/H2eFphiEquvzsWEscJFs+2BJ4i
         Dj1Qxvbc+lPC2uY0AbZjHjDGQL4g/aLnUmtJzZ0UyFLxRc3nICm9QzCQDJHU04JSWF
         EkO8XbzNZVvTw==
Received: by pali.im (Postfix)
        id E6AF59CA; Sat, 14 Aug 2021 17:05:31 +0200 (CEST)
Date:   Sat, 14 Aug 2021 17:05:31 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     W_Armin@gmx.de
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 2/4] hwmon: (dell-smm) Rework SMM function debugging
Message-ID: <20210814150531.3ssa6dc22tqtmbdn@pali>
References: <20210814143637.11922-1-W_Armin@gmx.de>
 <20210814143637.11922-3-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210814143637.11922-3-W_Armin@gmx.de>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Saturday 14 August 2021 16:36:35 W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> Use IS_ENABLED() instead of #ifdef and use ktime_us_delta()
> for improved precision.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/hwmon/dell-smm-hwmon.c | 26 ++++++++++----------------
>  1 file changed, 10 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 68af95c1d90c..3aa09c1e4b1d 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -158,17 +158,13 @@ static inline const char __init *i8k_get_dmi_data(int field)
>   */
>  static int i8k_smm_func(void *par)
>  {
> -	int rc;
>  	struct smm_regs *regs = par;
> -	int eax = regs->eax;
> -
> -#ifdef DEBUG
> -	int ebx = regs->ebx;
> -	unsigned long duration;
> -	ktime_t calltime, delta, rettime;
> +	int rc, eax = regs->eax, __maybe_unused ebx = regs->ebx;
> +	long long __maybe_unused duration;
> +	ktime_t __maybe_unused calltime;

I think that new coding style for declaring variables is
"reverse christmas tree", longer line before shorted line.

But here, I'm not sure if initializing more variables with its default
values should be at one line...

Also I'm not sure if usage of __maybe_unused is better than hiding
variable behind #ifdef. #ifdef guards variable to not be used when it
should not be.

> 
> -	calltime = ktime_get();
> -#endif
> +	if (IS_ENABLED(CONFIG_DEBUG))
> +		calltime = ktime_get();
> 
>  	/* SMM requires CPU 0 */
>  	if (smp_processor_id() != 0)
> @@ -230,13 +226,11 @@ static int i8k_smm_func(void *par)
>  	if (rc != 0 || (regs->eax & 0xffff) == 0xffff || regs->eax == eax)
>  		rc = -EINVAL;
> 
> -#ifdef DEBUG
> -	rettime = ktime_get();
> -	delta = ktime_sub(rettime, calltime);
> -	duration = ktime_to_ns(delta) >> 10;
> -	pr_debug("smm(0x%.4x 0x%.4x) = 0x%.4x  (took %7lu usecs)\n", eax, ebx,
> -		(rc ? 0xffff : regs->eax & 0xffff), duration);
> -#endif
> +	if (IS_ENABLED(CONFIG_DEBUG)) {
> +		duration = ktime_us_delta(ktime_get(), calltime);

But I like this ktime_us_delta() as it fixed conversion from ns to us!
Current conversion is incorrect (>>10 is /1024; but it should be /1000).

> +		pr_debug("smm(0x%.4x 0x%.4x) = 0x%.4x  (took %7lld usecs)\n", eax, ebx,
> +			 (rc ? 0xffff : regs->eax & 0xffff), duration);
> +	}
> 
>  	return rc;
>  }
> --
> 2.20.1
> 
