Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A99AC433FE
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Apr 2022 15:45:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236546AbiDRPsI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Apr 2022 11:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345929AbiDRPrl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Apr 2022 11:47:41 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 850EDB1FD
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Apr 2022 08:15:48 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id k29-20020a056830243d00b006040caa0988so5659768ots.6
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Apr 2022 08:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NPg4RbGFpq5pQJOd2vSGzKp8vEaIg01T18SZDoi/BrY=;
        b=bRbhavXm/SXSZL6Ds7lvqe7t6tfKYL00/YdVmFFJRUlgvy+vmBA3g6QLwe+bZ6yNN+
         d3Bvq53F7VBSrLTIK9nSr9gZImnvOXOe9v1IO966cN0omtDTJCwC6suCWytcIGe3B8kM
         zS5RYC2PfpYyqoJmKZGAEpiQybFr/qWPbcINSCm9eUfgQGYrT5DbXSWapyfmkorBSvD2
         dO47nH6sWxplgojVY/Io7S/2HKPJCZm1OTp7uxTPkgZ4MSX0ecslo18U23GOr0oqy2OU
         El/rUiGV+zV1jGDh9lvx1wBwCVJWsprniU69+JhjSvnaLdK1f+ofay8SS1nSL/u67ecM
         CjBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=NPg4RbGFpq5pQJOd2vSGzKp8vEaIg01T18SZDoi/BrY=;
        b=OPddl4cIb2TQtKA8r0NnnQsCwPAH00dKHlJTLpb6RmWSmur1PO/PQkhPz5yZtg78/O
         3d5kIP9b8EZXPpsMFQAos8+lBehGUIZoVvrfTY3cpV1hIgAs5o/CB+jiHMk11yQ5xnQx
         1qKx4BpP8PcHxc8IA5QNKB/NBDmVHPjKkiEXzfujMtkIyvbtNj2ytgtuNJk10vcEqL3N
         ejDzuV6g0zepok7+6IoFOKc1MTkZIsepSeO2dE6jold4NS2vzchy6BYGgbxaNVvDiKh4
         1+XgobZQf+3UTxAl2tOSO2bJQKTMAiclmrbLsgWTUejbkpNo1harzrWPE0oJtLFs6D6Y
         WiLw==
X-Gm-Message-State: AOAM533gmbWL0RlFMAy6XSz7wVFbiA/I0q9GM5YZq5+YQrQQ/CmURE1c
        MqOemKkPzb/M42xuptF5EWg=
X-Google-Smtp-Source: ABdhPJwQYRxc3As8EryFvi+glgqbbsoqF1WpQCHcnWWuqR0WTiBhVuDjHbPMJhfm4OsYnsL8S0ZmPA==
X-Received: by 2002:a05:6830:23a7:b0:603:edbb:1426 with SMTP id m7-20020a05683023a700b00603edbb1426mr4113195ots.317.1650294947739;
        Mon, 18 Apr 2022 08:15:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c3-20020a056808138300b002f76b9a9ef6sm4120820oiw.10.2022.04.18.08.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 08:15:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 18 Apr 2022 08:15:45 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Ji-Ze Hong (Peter Hong)" <hpeter@gmail.com>
Cc:     Menghui_Wu@aaeon.com.tw, fercerpav@gmail.com,
        peter_hong@fintek.com.tw, acelan.kao@canonical.com,
        linux-hwmon@vger.kernel.org,
        "Ji-Ze Hong (Peter Hong)" <hpeter+linux_kernel@gmail.com>
Subject: Re: [PATCH V2 1/1] hwmon:(f71882fg) Fix minus temperature
Message-ID: <20220418151545.GA4119180@roeck-us.net>
References: <20220418090706.6339-1-hpeter+linux_kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220418090706.6339-1-hpeter+linux_kernel@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Apr 18, 2022 at 05:07:06PM +0800, Ji-Ze Hong (Peter Hong) wrote:
> All temperature of Fintek superio hwmonitor that using 1-byte reg will use
> 2's complement.
> 
> In show_temp()
> 	temp = data->temp[nr] * 1000;
> 
> When data->temp[nr] read as 255, it indicate -1C, but this code will report
> 255C to userspace. It'll be ok when change to:
> 	temp = ((s8)data->temp[nr]) * 1000;
> 
> Signed-off-by: Ji-Ze Hong (Peter Hong) <hpeter+linux_kernel@gmail.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/f71882fg.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/f71882fg.c b/drivers/hwmon/f71882fg.c
> index 938a8b9ec70d..6830e029995d 100644
> --- a/drivers/hwmon/f71882fg.c
> +++ b/drivers/hwmon/f71882fg.c
> @@ -1578,8 +1578,9 @@ static ssize_t show_temp(struct device *dev, struct device_attribute *devattr,
>  		temp *= 125;
>  		if (sign)
>  			temp -= 128000;
> -	} else
> -		temp = data->temp[nr] * 1000;
> +	} else {
> +		temp = ((s8)data->temp[nr]) * 1000;
> +	}
>  
>  	return sprintf(buf, "%d\n", temp);
>  }
