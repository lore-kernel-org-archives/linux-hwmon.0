Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7BFDC07E96
	for <linux-hwmon@archiver.kernel.org>; Tue, 13 Jul 2021 05:02:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A6BFB61249
	for <linux-hwmon@archiver.kernel.org>; Tue, 13 Jul 2021 05:02:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbhGMFFm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 13 Jul 2021 01:05:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbhGMFFm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 13 Jul 2021 01:05:42 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C344C0613DD;
        Mon, 12 Jul 2021 22:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=Y9SCFUFvDiiwNKATD/MeNeTY42rYD5q8ZmhhYCeG3N4=; b=nS2M2lPZSduOe3g5f4fbr8Y9Jz
        Wgt3kMyZg2plfxTU8lGiFrHllqm4+ayu+ZsaAoSJ1jaOE1fL18lpVXBOmPbe8XWmcUoErZzTy43/q
        1ZhwoXphWOilbDlGZXkEbYSgfnGsYG9dv9Bk7qpKul/zK4Cr9mhakYmQuxI2eh0s+1G0M8IQkSrCg
        VahLxPcl5b3Tc/gJm0nNI0biEiQXOhTqenY6pR9gyaiSeXiKWI0jqFPLdkWi5rpinPv+UEUqIZEB8
        4XZAoZaH2uJvxlzNMHzP79nT0U7K/Oipe5lu2GeOru970nnmzR1uTDxcLzYjPWXm96OJgfLfvagBA
        okQLXZNg==;
Received: from [2601:1c0:6280:3f0::aefb]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m3AYd-0097z2-JX; Tue, 13 Jul 2021 05:02:11 +0000
Subject: Re: [PATCH 07/14] peci: Add peci-aspeed controller driver
To:     Iwona Winiarska <iwona.winiarska@intel.com>,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Cc:     x86@kernel.org, devicetree@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andy Lutomirski <luto@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Yazen Ghannam <yazen.ghannam@amd.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Tony Luck <tony.luck@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-8-iwona.winiarska@intel.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b894ba5e-e1ae-e5dd-87be-dc33912dd5c0@infradead.org>
Date:   Mon, 12 Jul 2021 22:02:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210712220447.957418-8-iwona.winiarska@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/12/21 3:04 PM, Iwona Winiarska wrote:
> diff --git a/drivers/peci/controller/Kconfig b/drivers/peci/controller/Kconfig
> new file mode 100644
> index 000000000000..8ddbe494677f
> --- /dev/null
> +++ b/drivers/peci/controller/Kconfig
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config PECI_ASPEED
> +	tristate "ASPEED PECI support"
> +	depends on ARCH_ASPEED || COMPILE_TEST
> +	depends on OF
> +	depends on HAS_IOMEM
> +	help
> +	  Enable this driver if you want to support ASPEED PECI controller.
> +
> +	  This driver can be also build as a module. If so, the module

	              can also be built as a module.

> +	  will be called peci-aspeed.


-- 
~Randy

