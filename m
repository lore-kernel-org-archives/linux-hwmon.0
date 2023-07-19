Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F82EB64DA
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 Jul 2023 11:21:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjGSLVI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 19 Jul 2023 07:21:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbjGSLVH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 19 Jul 2023 07:21:07 -0400
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED3AA18D;
        Wed, 19 Jul 2023 04:21:05 -0700 (PDT)
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id 892FF61E5FE01;
        Wed, 19 Jul 2023 13:20:20 +0200 (CEST)
Message-ID: <c1988d23-c19c-0ec0-9f61-01cbb00ead3a@molgen.mpg.de>
Date:   Wed, 19 Jul 2023 13:20:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/3] peci: cpu: Add Intel Sapphire Rapids support
Content-Language: en-US
To:     Naresh Solanki <naresh.solanki@9elements.com>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        iwona.winiarska@intel.com, linux@roeck-us.net, jdelvare@suse.com,
        openbmc@lists.ozlabs.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>
References: <20230712091241.3668454-1-Naresh.Solanki@9elements.com>
From:   Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20230712091241.3668454-1-Naresh.Solanki@9elements.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Dear Naresh,


Thank you for the patch.

Am 12.07.23 um 11:12 schrieb Naresh Solanki:
> Add support for detection of Intel Sapphire Rapids processor based on
> CPU family & model.
> 
> Sapphire Rapids Xeon processors with the family set to 6 and the
> model set to INTEL_FAM6_SAPPHIRERAPIDS_X. The data field for this entry
> is "spr".

Please add, how you tested this.

> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
> ---
> Changes in V2:
> - Refactored from previous patchset as seperate patch based on subsystem.
> ---
>   drivers/peci/cpu.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/peci/cpu.c b/drivers/peci/cpu.c
> index de4a7b3e5966..3668a908d259 100644
> --- a/drivers/peci/cpu.c
> +++ b/drivers/peci/cpu.c
> @@ -318,6 +318,11 @@ static const struct peci_device_id peci_cpu_device_ids[] = {
>   		.model	= INTEL_FAM6_ICELAKE_X,
>   		.data	= "icx",
>   	},
> +	{ /* Sapphire Rapids Xeon */
> +		.family	= 6,
> +		.model	= INTEL_FAM6_SAPPHIRERAPIDS_X,
> +		.data	= "spr",
> +	},
>   	{ /* Icelake Xeon D */
>   		.family	= 6,
>   		.model	= INTEL_FAM6_ICELAKE_D,

It looks like it’s incorrectly sorted, probably due to merge conflict 
resolution?


Kind regards,

Paul
