Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9060DC7EE25
	for <linux-hwmon@archiver.kernel.org>; Fri,  9 Jun 2023 23:34:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233210AbjFIXeP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 9 Jun 2023 19:34:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232932AbjFIXdQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 9 Jun 2023 19:33:16 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4249D3C39;
        Fri,  9 Jun 2023 16:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
        bh=lufy/ezNAeUbR/JheOSHrV1cD2JJd1bYnsaGsmZuXMg=; b=yVU7fzidhDNoB2h2l+GKecnMla
        cZ1gAPG7LOoOjVGIk9P9YJ2b8B7IIBzKBc+1Le9WolPESJBWbLyGAmMukLxn7hewdSkpDjzVTi7hm
        A44dYJQ4B49Ua/7yxpMHjVTnJpaEhAoDvWbbhzW983E1pQTOdAiJBFRwH08X0ioneoPsgQxGm7NE/
        25FIrVxQj5YUaKTtJvE2tcqKtUTMNAJ5YizPtAmaXtLsnE5UCtl778bHHd5jIAQ2Eb7rodwEhw8PH
        zmkq5tev43w3qrJzoFBPdB2KMT5RfYJ5TRXyhyUCYSB1zrSpCskuNrPYqFXcAHytpfuSDZ0zxuRxy
        cmCo948g==;
Received: from [2601:1c2:980:9ec0::2764]
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1q7lYZ-00EZR4-2X;
        Fri, 09 Jun 2023 23:30:11 +0000
Message-ID: <332b83a8-779f-73a6-8113-50f59c7e7184@infradead.org>
Date:   Fri, 9 Jun 2023 16:30:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] Enable AMD3255 Proc to show negative temperature
To:     Baskaran Kannan <Baski.Kannan@amd.com>, Mario.Limonciello@amd.com,
        babu.moger@amd.com, clemens@ladisch.de, jdelvare@suse.com,
        linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230609231139.3006-1-Baski.Kannan@amd.com>
Content-Language: en-US
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230609231139.3006-1-Baski.Kannan@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi--

Style issues:

On 6/9/23 16:11, Baskaran Kannan wrote:
> From: Your Name <you@example.com>

Fix that. ^^^^^

Provide a comment message (not empty).

> 
> Signed-off-by: Baski Kannan <Baski.Kannan@amd.com>
> ---
>  drivers/hwmon/k10temp.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
> index 489ad0b1bc74..58e4d90de5e3 100644
> --- a/drivers/hwmon/k10temp.c
> +++ b/drivers/hwmon/k10temp.c
> @@ -77,6 +77,11 @@ static DEFINE_MUTEX(nb_smu_ind_mutex);
>  #define ZEN_CUR_TEMP_RANGE_SEL_MASK		BIT(19)
>  #define ZEN_CUR_TEMP_TJ_SEL_MASK		GENMASK(17, 16)
>  
> +/* AMD's Industrial processor 3255 supports temperature from -40 deg to 105 deg Celsius.
> + * Do not round off to zero for negative Tctl or Tdie values
> + */

Linux multi-line coding style (except for net/ and bpf/) is like:

/*
 * AMD's Industrial processor 3255 supports temperature from -40 deg to 105 deg Celsius.
 * Do not round off to zero for negative Tctl or Tdie values
 */

End the last sentence above with a period.


> +#define AMD_I3255_STR				"3255"
> +
>  struct k10temp_data {
>  	struct pci_dev *pdev;
>  	void (*read_htcreg)(struct pci_dev *pdev, u32 *regval);


For the next patch version, please make sure that it says v2
and explain the differences in v1 and v2.

thanks.
-- 
~Randy
