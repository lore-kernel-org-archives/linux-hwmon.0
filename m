Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AF39C636CA
	for <linux-hwmon@archiver.kernel.org>; Fri, 16 Jul 2021 20:44:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD10A613F1
	for <linux-hwmon@archiver.kernel.org>; Fri, 16 Jul 2021 20:44:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234192AbhGPUrq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 16 Jul 2021 16:47:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31554 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234100AbhGPUrp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 16 Jul 2021 16:47:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626468290;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2hOSl7T8uaeeFLE5+UEIkT2Ky1iFxWg4XaCDh/v6oAM=;
        b=VDWvAgdFo74wH50CoRs7JZLx3kQkowsQbBebZ+mQ5848rPMBcBRD1CKV5hERB5ChirGyS5
        8jhLKwmQ0Ya2UgRkYdE1C8Ul8zHngLHRSYeGsd35xriIaOBQPVk9JY3zB2IzdmQQQOPXdm
        jq1L+7wYo5eVKYngGAKCxLcT3DtikNE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-BK31iJffM4yLMq4tZ7y9AA-1; Fri, 16 Jul 2021 16:44:48 -0400
X-MC-Unique: BK31iJffM4yLMq4tZ7y9AA-1
Received: by mail-qt1-f200.google.com with SMTP id w3-20020ac80ec30000b029024e8c2383c1so7082448qti.5
        for <linux-hwmon@vger.kernel.org>; Fri, 16 Jul 2021 13:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=2hOSl7T8uaeeFLE5+UEIkT2Ky1iFxWg4XaCDh/v6oAM=;
        b=YG1uQExz5Sh9sa9MTi3hCKEyOt4E1TfY5XXZTpUQfW7qUn63LHRzLzV6sV3Dp2Ft4T
         nOD1U5F626/azR5bpi34O68iVb0FtukGcp4nS+VkTlGjQma4nXQjovJOSkA2IUoDWEHd
         GxTiUQuWnV6ftMVCCd7LUhPtpCmycF/hhA6yfX0UzApz6/aAY8NfFNB/wj2qsNx4cPQe
         Hz/koC7d1knpRxge1LTubxCqRLlfOTRWuiElzvyftauq/ZwSvp/75IW6jQ9hBgKYw/ri
         RBLeVRDiwJuL1ez+cWXuJJbbgdVSWTA26TKM+q23z02NsHSTrVuHde4jwLeM7eZXSJs5
         xw7A==
X-Gm-Message-State: AOAM533+58udXk7hZulMRvFc4VEqlfNmNBIISMJI5U+CHSbHaK+rxo/f
        yVqPhOudi2YY6iboWN16BaChGg1ih/6+QFaoAM5Y5PO8KGVyGeMbVqI7CBcuIfPtIPABWaD5JjC
        y2lQZ0QlUYA4Z8wdB4teZAG8=
X-Received: by 2002:a0c:cdc6:: with SMTP id a6mr12055699qvn.15.1626468288353;
        Fri, 16 Jul 2021 13:44:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySk4FYXysPvZ8XbnmBZ1swg1qoJWhXD2QzxodwEZF9W9BDb8u8S6hPtBgK6GGEILviRId/pg==
X-Received: by 2002:a0c:cdc6:: with SMTP id a6mr12055691qvn.15.1626468288230;
        Fri, 16 Jul 2021 13:44:48 -0700 (PDT)
Received: from localhost.localdomain (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id a19sm3479074qtb.54.2021.07.16.13.44.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jul 2021 13:44:47 -0700 (PDT)
Subject: Re: [PATCH v5 2/3] spi: spi-altera-dfl: support n5010 feature
 revision
To:     =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>,
        Wu Hao <hao.wu@intel.com>, Moritz Fischer <mdf@kernel.org>,
        Xu Yilun <yilun.xu@intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Brown <broonie@kernel.org>
Cc:     =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <mhu@silicom.dk>,
        linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-spi@vger.kernel.org
References: <20210716135441.3235863-1-martin@geanix.com>
 <20210716135441.3235863-3-martin@geanix.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <be04e83e-bdf7-3a5c-ff34-a7cbf91f6ba2@redhat.com>
Date:   Fri, 16 Jul 2021 13:44:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210716135441.3235863-3-martin@geanix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


On 7/16/21 6:54 AM, Martin Hundebøll wrote:
> From: Martin Hundebøll <mhu@silicom.dk>
>
> The Max10 BMC on the Silicom n5010 PAC is slightly different than the
> existing BMCs, so use a dedicated feature revision detect it.
>
> Signed-off-by: Martin Hundebøll <mhu@silicom.dk>
> Reviewed-by: Moritz Fischer <mdf@kernel.org>
> ---
>
> Changes since v4:
>   * Moved spi board_info structure from global/static scope
>     to function/stack scope
>
> Changes since v3:
>   * Changed "BMC's" to "BMCs"
>   * Added Moritz' Reviewed-by
>
> Changes since v2:
>   * None
>
> Changes since v1:
>   * use feature revision from struct dfl_device instead of reading it
>     from io-mem
>
>   drivers/spi/spi-altera-dfl.c | 21 ++++++++++++---------
>   1 file changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/spi/spi-altera-dfl.c b/drivers/spi/spi-altera-dfl.c
> index 39a3e1a032e0..44fc9ee13fc7 100644
> --- a/drivers/spi/spi-altera-dfl.c
> +++ b/drivers/spi/spi-altera-dfl.c
> @@ -104,13 +104,6 @@ static const struct regmap_config indirect_regbus_cfg = {
>   	.reg_read = indirect_bus_reg_read,
>   };
>   
> -static struct spi_board_info m10_bmc_info = {
> -	.modalias = "m10-d5005",
> -	.max_speed_hz = 12500000,
> -	.bus_num = 0,
> -	.chip_select = 0,
> -};
> -
>   static void config_spi_master(void __iomem *base, struct spi_master *master)
>   {
>   	u64 v;
> @@ -130,6 +123,7 @@ static void config_spi_master(void __iomem *base, struct spi_master *master)
>   
>   static int dfl_spi_altera_probe(struct dfl_device *dfl_dev)
>   {
> +	struct spi_board_info board_info = { 0 };
>   	struct device *dev = &dfl_dev->dev;
>   	struct spi_master *master;
>   	struct altera_spi *hw;
> @@ -170,9 +164,18 @@ static int dfl_spi_altera_probe(struct dfl_device *dfl_dev)
>   		goto exit;
>   	}
>   
> -	if (!spi_new_device(master,  &m10_bmc_info)) {
> +	if (dfl_dev->revision == FME_FEATURE_REV_MAX10_SPI_N5010)
> +		strscpy(board_info.modalias, "m10-n5010", SPI_NAME_SIZE);
> +	else
> +		strscpy(board_info.modalias, "m10-d5005", SPI_NAME_SIZE);
> +
> +	board_info.max_speed_hz = 12500000;
> +	board_info.bus_num = 0;
> +	board_info.chip_select = 0;
> +
> +	if (!spi_new_device(master, &board_info)) {
>   		dev_err(dev, "%s failed to create SPI device: %s\n",
> -			__func__, m10_bmc_info.modalias);
> +			__func__, board_info.modalias);
>   	}
>   

Looks good to me.

Reviewed-by: Tom Rix <trix@redhat.com>

>   	return 0;

