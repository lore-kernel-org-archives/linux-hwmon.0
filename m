Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42284C432BE
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Aug 2021 20:02:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1AC6E60F45
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Aug 2021 20:02:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230326AbhHZUDd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 Aug 2021 16:03:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230286AbhHZUDc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Aug 2021 16:03:32 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15510C061757
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Aug 2021 13:02:45 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id x10-20020a056830408a00b004f26cead745so5036006ott.10
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Aug 2021 13:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0zpiVOfX8+EEw4ODGuCKnbqs6h3slDzU5VXv23feEv0=;
        b=lnsIycGH5x7nE8IHy0at+9BpkXi7kNRTFoyR/oT5pPSFw3fXvYuTrxG90hwOk0Z0N1
         CzI3mj6fgMWjQFdWVW0Zfy4uqGwN69qt05LddYVrDnRQ8jA0mee/A48NVeISeCfaNpuO
         saFjUJYYFm2glsVvWrU4bEi8KQhbb4F66VGK9Qx0KUSz0OEYGNXlFC64uOEuD4bexFkX
         DewObSy6t8uV/8B6ogf8DYCPjg6BCyfcSX171b7gLCY0yE1E8Q+tMHrbRCNoQEvsI6ph
         xb8cem9coGS8BolPaOc1RH2o7pjE8kjMAPlvs7o3Znsb+cTmc8PXtX5w4CXPVnW8/pFR
         GVCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0zpiVOfX8+EEw4ODGuCKnbqs6h3slDzU5VXv23feEv0=;
        b=H3yk+VofikkdS0IL9oH72EsJ4WkSwFVH9KGgsQDw4soErDbwo+4AMhWY0i0mzVZzI1
         bxPFoWSLilKG1h2/b8B61dEgyBesUypsyB/wOL8K3cDaAXGi3lq1302l2DkTSt7gyv/Q
         dp3/lGgir5BKUnE8xsx+gTCMoAVplgOGjh4k9/L9c2qeKCho0IVkiTJTbH6laIZWYuJH
         GQFerex5ix+/0MZ9p+CtNxv4iVBhotvNZeqEcRLPeUcHbWH0igmYYHaQCoWgtP6x6bbX
         /DKorUm/dc2mRzYLNsEuvifiGVJzu9kJL1AjdAsT9b+c4FMh+C9H0qnByE+1byV2lmeA
         2yfw==
X-Gm-Message-State: AOAM532tDEqEpmcLgU77kRUtUaIVd5kp84zL6nT/vKmM9nD7hfBRoHTa
        f3MojNGTt6lRMhPAiBnvSSQ=
X-Google-Smtp-Source: ABdhPJx4neIttk2hSWAKlBfzq7+Ip39yydyLWlrAgA8AWKqeDGZkqZj9AMTZ2D2tdf1cQCzjEpXW/g==
X-Received: by 2002:a05:6830:10d2:: with SMTP id z18mr4767260oto.341.1630008164396;
        Thu, 26 Aug 2021 13:02:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s22sm719067ooh.27.2021.08.26.13.02.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Aug 2021 13:02:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 3/6] hwmon: (k10temp): Rework the temperature offset
 calculation
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Clemens Ladisch <clemens@ladisch.de>
Cc:     linux-hwmon@vger.kernel.org,
        Gabriel Craciunescu <nix.or.die@googlemail.com>,
        Wei Huang <wei.huang2@amd.com>
References: <20210826184057.26428-1-mario.limonciello@amd.com>
 <20210826184057.26428-4-mario.limonciello@amd.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <a5a24983-b40c-8373-c1e3-79d869f547b5@roeck-us.net>
Date:   Thu, 26 Aug 2021 13:02:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210826184057.26428-4-mario.limonciello@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 8/26/21 11:40 AM, Mario Limonciello wrote:
> Some of the existing assumptions made do not scale properly
> to new silicon in upcoming changes.  This commit should cause
> no functional changes to existing silicon.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/hwmon/k10temp.c | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
> index 9e704338230d..5c1aebf7a56d 100644
> --- a/drivers/hwmon/k10temp.c
> +++ b/drivers/hwmon/k10temp.c
> @@ -65,10 +65,11 @@ static DEFINE_MUTEX(nb_smu_ind_mutex);
>   #define F15H_M60H_HARDWARE_TEMP_CTRL_OFFSET	0xd8200c64
>   #define F15H_M60H_REPORTED_TEMP_CTRL_OFFSET	0xd8200ca4
>   
> -/* Common for Zen CPU families (Family 17h and 18h) */
> -#define ZEN_REPORTED_TEMP_CTRL_OFFSET		0x00059800
> +/* Common for Zen CPU families (Family 17h and 18h and 19h) */
> +#define ZEN_REPORTED_TEMP_CTRL_BASE		0x00059800
>   
> -#define ZEN_CCD_TEMP(x)				(0x00059954 + ((x) * 4))
> +#define ZEN_CCD_TEMP(offset, x)			(ZEN_REPORTED_TEMP_CTRL_BASE + \
> +						 offset + ((x) * 4))

(offset)

>   #define ZEN_CCD_TEMP_VALID			BIT(11)
>   #define ZEN_CCD_TEMP_MASK			GENMASK(10, 0)
>   
> @@ -103,6 +104,7 @@ struct k10temp_data {
>   	u32 temp_adjust_mask;
>   	u32 show_temp;
>   	bool is_zen;
> +	u32 ccd_offset;
>   };
>   
>   #define TCTL_BIT	0
> @@ -163,7 +165,7 @@ static void read_tempreg_nb_f15(struct pci_dev *pdev, u32 *regval)
>   static void read_tempreg_nb_zen(struct pci_dev *pdev, u32 *regval)
>   {
>   	amd_smn_read(amd_pci_dev_to_node_id(pdev),
> -		     ZEN_REPORTED_TEMP_CTRL_OFFSET, regval);
> +		     ZEN_REPORTED_TEMP_CTRL_BASE, regval);
>   }
>   
>   static long get_raw_temp(struct k10temp_data *data)
> @@ -226,7 +228,8 @@ static int k10temp_read_temp(struct device *dev, u32 attr, int channel,
>   			break;
>   		case 2 ... 9:		/* Tccd{1-8} */
>   			amd_smn_read(amd_pci_dev_to_node_id(data->pdev),
> -				     ZEN_CCD_TEMP(channel - 2), &regval);
> +				     ZEN_CCD_TEMP(data->ccd_offset, channel - 2),
> +						  &regval);
>   			*val = (regval & ZEN_CCD_TEMP_MASK) * 125 - 49000;
>   			break;
>   		default:
> @@ -387,7 +390,7 @@ static void k10temp_get_ccd_support(struct pci_dev *pdev,
>   
>   	for (i = 0; i < limit; i++) {
>   		amd_smn_read(amd_pci_dev_to_node_id(pdev),
> -			     ZEN_CCD_TEMP(i), &regval);
> +			     ZEN_CCD_TEMP(data->ccd_offset, i), &regval);
>   		if (regval & ZEN_CCD_TEMP_VALID)
>   			data->show_temp |= BIT(TCCD_BIT(i));
>   	}
> @@ -434,12 +437,14 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   		case 0x8:	/* Zen+ */
>   		case 0x11:	/* Zen APU */
>   		case 0x18:	/* Zen+ APU */
> +			data->ccd_offset = 0x154;
>   			k10temp_get_ccd_support(pdev, data, 4);
>   			break;
>   		case 0x31:	/* Zen2 Threadripper */
>   		case 0x60:	/* Renoir */
>   		case 0x68:	/* Lucienne */
>   		case 0x71:	/* Zen2 */
> +			data->ccd_offset = 0x154;
>   			k10temp_get_ccd_support(pdev, data, 8);
>   			break;
>   		}
> @@ -453,6 +458,7 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   		case 0x0 ... 0x1:	/* Zen3 SP3/TR */
>   		case 0x21:		/* Zen3 Ryzen Desktop */
>   		case 0x50 ... 0x5f:	/* Green Sardine */
> +			data->ccd_offset = 0x154;
>   			k10temp_get_ccd_support(pdev, data, 8);
>   			break;
>   		}
> 

