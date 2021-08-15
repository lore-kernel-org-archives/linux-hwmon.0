Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB53DC4338F
	for <linux-hwmon@archiver.kernel.org>; Sun, 15 Aug 2021 10:12:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C446761056
	for <linux-hwmon@archiver.kernel.org>; Sun, 15 Aug 2021 10:12:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237053AbhHOKMa (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 15 Aug 2021 06:12:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:52062 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232507AbhHOKMa (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 15 Aug 2021 06:12:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8B85D60FC3;
        Sun, 15 Aug 2021 10:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629022320;
        bh=3b45mbTlNAGE7wJntgyq1kWrAiIAIKOxwGnliS6FPxA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=toj2cuYPwGRPd9ub+b4Ep91L4hP496rlhQTA0fcAph307tGj9S5CiTQ1Pf7w3HigH
         aT5kSRbrU3IsPRYvtWtAlpGrS6b8FFaanLBm5NYVS/6oGqErWrXDi5xIF798EhhBCG
         3O/4g5W2lZGrd5ne5lDfDbzTCZbLI/tBKny6XMR5cgv7l9+lMYY11pfCGB/N4kiS8d
         jabdKt1IS3/cwgpGsulapbjAg4B1l7BeNLBVaPrGkR+gqFdQy7fhnoArEKRfEQgpUV
         ypkw4FxdILf8u+PbzPXtUeSbZqCTGu/OUK50/bvigKtG8LScnV6yKBZsoC7ljvDfQa
         WeuwF/qyM2Ejw==
Received: by pali.im (Postfix)
        id 12E1998C; Sun, 15 Aug 2021 12:11:58 +0200 (CEST)
Date:   Sun, 15 Aug 2021 12:11:57 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     W_Armin@gmx.de
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH RESEND v2] hwmon: (dell-smm) Rework SMM function debugging
Message-ID: <20210815101157.ppv62azxsu2l4pmp@pali>
References: <20210814190516.26718-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210814190516.26718-1-W_Armin@gmx.de>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Saturday 14 August 2021 21:05:16 W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> Drop #ifdef DEBUG and use ktime_us_delta()
> for improved precision.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Looks good,

Reviewed-by: Pali Rohár <pali@kernel.org>

> ---
> Changes in v2:
> - remove #ifdef DEBUG completly
> - init each variable at one line
> ---
>  drivers/hwmon/dell-smm-hwmon.c | 21 ++++++---------------
>  1 file changed, 6 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 68af95c1d90c..25fac796fc86 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -158,17 +158,12 @@ static inline const char __init *i8k_get_dmi_data(int field)
>   */
>  static int i8k_smm_func(void *par)
>  {
> -	int rc;
> +	ktime_t calltime = ktime_get();
>  	struct smm_regs *regs = par;
>  	int eax = regs->eax;
> -
> -#ifdef DEBUG
>  	int ebx = regs->ebx;
> -	unsigned long duration;
> -	ktime_t calltime, delta, rettime;
> -
> -	calltime = ktime_get();
> -#endif
> +	long long duration;
> +	int rc;
> 
>  	/* SMM requires CPU 0 */
>  	if (smp_processor_id() != 0)
> @@ -230,13 +225,9 @@ static int i8k_smm_func(void *par)
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
> +	duration = ktime_us_delta(ktime_get(), calltime);
> +	pr_debug("smm(0x%.4x 0x%.4x) = 0x%.4x  (took %7lld usecs)\n", eax, ebx,
> +		 (rc ? 0xffff : regs->eax & 0xffff), duration);
> 
>  	return rc;
>  }
> --
> 2.20.1
> 
