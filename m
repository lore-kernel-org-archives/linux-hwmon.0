Return-Path: <SRS0=o4ty=ZG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19349C432C3
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Nov 2019 19:14:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E0E882071F
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Nov 2019 19:14:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KnibOcAE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbfKNTOn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 14 Nov 2019 14:14:43 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:38726 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726098AbfKNTOn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 14 Nov 2019 14:14:43 -0500
Received: by mail-pl1-f193.google.com with SMTP id w8so3066278plq.5
        for <linux-hwmon@vger.kernel.org>; Thu, 14 Nov 2019 11:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=eEgMwv4stYpP/dtbh27yGsGdSdg4kPUVFwkU2s2SmcI=;
        b=KnibOcAELnyreaUyZfu9T1C9xnp2J1iyoVIYgNWPG3CLCVSbZa7E/MAMt/2Tz7b7Yn
         xgOpwnWKVcWQloaaoTXlJSm1XxIQhu6v5dctuwdxNRPiqeBc32d9EWP77LhQcOd097uU
         0v2EeQeCV5996gmoKk4tW+5FSDiqJPdUmLFYkOK+gdULVj7UFWvR7rwp920D9GS5JCud
         EBeajhvChHcJRwaHTeTReuJ1BUKTTEMv6dp0t8ALsm/KK8dluDOtL5HoDxXVSlJDh512
         YIvEEdCOGiT386GCg6NUkfJXNJTzZIL4vSVCeJZ57eeeGLXfmJAQq1TetbynTP3ixpiN
         CQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=eEgMwv4stYpP/dtbh27yGsGdSdg4kPUVFwkU2s2SmcI=;
        b=KTMJRLicPVsOm86mvATEzRW8qBSO5uy1h0gdO05W8vyurLERa/hKTNAzarxAn3Tg3z
         /oVJzZyUtYULhx4y10g3A6468dF8WPXSOlnKvD9dksJg3a9BwZGoNfER7HfzRmnjwu5S
         Zdr0yZNCWMlRLQW/rUhFbhVpYI1m27aFLElq2dwR+CSRiPaQEkcMzxdl8xUviOKplkF0
         qkHVw8V2UBmK5j3+AQmuK0XDtm4h4Y7pK/JpcUnZjpHVbTz2/VSPbo4DDQXDJPVkX076
         Vc8YbBaL2IGLrEG3OjDeEsiGe2/w95lmxboNPKsCVk4+MAqC6ltMTiCNTitReCgCDh07
         T8GQ==
X-Gm-Message-State: APjAAAXcotUNFZHnIS6gJHMW1aBCb+kbiUNCfiAAzTxPFM84ur9sBJAu
        hKBqbuxnMov+rFDNczKohg4=
X-Google-Smtp-Source: APXvYqxEwalysafupc/hxFAIWDdIp3t9KjjysJERhvel2CwWU6Z1VmwPIoL2g0i21O0jO8EIbjZoCg==
X-Received: by 2002:a17:902:b218:: with SMTP id t24mr11247613plr.267.1573758882326;
        Thu, 14 Nov 2019 11:14:42 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v14sm5375539pja.22.2019.11.14.11.14.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2019 11:14:41 -0800 (PST)
Date:   Thu, 14 Nov 2019 11:14:40 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     linux-nvme@lists.infradead.org, linux-hwmon@vger.kernel.org,
        Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
        Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v2 2/2] nvme: hwmon: add quirk to avoid changing
 temperature threshold
Message-ID: <20191114191440.GB11288@roeck-us.net>
References: <1573746001-20979-1-git-send-email-akinobu.mita@gmail.com>
 <1573746001-20979-3-git-send-email-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1573746001-20979-3-git-send-email-akinobu.mita@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Nov 15, 2019 at 12:40:01AM +0900, Akinobu Mita wrote:
> This adds a new quirk NVME_QUIRK_NO_TEMP_THRESH_CHANGE to avoid changing
> the value of the temperature threshold feature for specific devices that
> show undesirable behavior.
> 
> Guenter reported:
> 
> "On my Intel NVME drive (SSDPEKKW512G7), writing any minimum limit on the
> Composite temperature sensor results in a temperature warning, and that
> warning is sticky until I reset the controller.
> 
> It doesn't seem to matter which temperature I write; writing -273000 has
> the same result."
> 
> The Intel NVMe has the latest firmware version installed, so this isn't
> a problem that was ever fixed.
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Cc: Keith Busch <kbusch@kernel.org>
> Cc: Jens Axboe <axboe@fb.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Sagi Grimberg <sagi@grimberg.me>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Tested-by: Guenter Roeck <linux@roeck-us.net>

Tested on:
	INTEL SSDPEKKW512G7

Specifically verified that min/max attributes are indeed read-only
on this drive.

nvme-pci-0100
Adapter: PCI adapter
Composite:    +32.9°C  (low  = -273.1°C, high = +69.8°C)
                       (crit = +79.8°C)

groeck@jupiter:/sys/class/hwmon/hwmon0$ ls -l
total 0
lrwxrwxrwx 1 root root    0 Nov 14 10:59 device -> ../../../0000:01:00.0
-r--r--r-- 1 root root 4096 Nov 14 10:59 name
drwxr-xr-x 2 root root    0 Nov 14 10:59 power
lrwxrwxrwx 1 root root    0 Nov 14 10:59 subsystem -> ../../../../../../class/hwmon
-r--r--r-- 1 root root 4096 Nov 14 10:59 temp1_alarm
-r--r--r-- 1 root root 4096 Nov 14 10:59 temp1_crit
-r--r--r-- 1 root root 4096 Nov 14 10:59 temp1_input
-r--r--r-- 1 root root 4096 Nov 14 10:59 temp1_label
-r--r--r-- 1 root root 4096 Nov 14 10:59 temp1_max
-r--r--r-- 1 root root 4096 Nov 14 10:59 temp1_min
-rw-r--r-- 1 root root 4096 Nov 14 10:59 uevent

groeck@jupiter:/sys/class/hwmon/hwmon0$ sudo nvme list
Node             SN                   Model                                    Namespace Usage                      Format           FW Rev  
---------------- -------------------- ---------------------------------------- --------- -------------------------- ---------------- --------
/dev/nvme0n1     BTPY65250EQN512F     INTEL SSDPEKKW512G7                      1         512.11  GB / 512.11  GB    512   B +  0 B    PSF121C

> ---
>  drivers/nvme/host/nvme-hwmon.c | 6 +++++-
>  drivers/nvme/host/nvme.h       | 5 +++++
>  drivers/nvme/host/pci.c        | 3 ++-
>  3 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/nvme/host/nvme-hwmon.c b/drivers/nvme/host/nvme-hwmon.c
> index 97a84b4..a5af21f 100644
> --- a/drivers/nvme/host/nvme-hwmon.c
> +++ b/drivers/nvme/host/nvme-hwmon.c
> @@ -170,8 +170,12 @@ static umode_t nvme_hwmon_is_visible(const void *_data,
>  	case hwmon_temp_max:
>  	case hwmon_temp_min:
>  		if ((!channel && data->ctrl->wctemp) ||
> -		    (channel && data->log.temp_sensor[channel - 1]))
> +		    (channel && data->log.temp_sensor[channel - 1])) {
> +			if (data->ctrl->quirks &
> +			    NVME_QUIRK_NO_TEMP_THRESH_CHANGE)
> +				return 0444;
>  			return 0644;
> +		}
>  		break;
>  	case hwmon_temp_alarm:
>  		if (!channel)
> diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
> index 000a3d9..19e5e87 100644
> --- a/drivers/nvme/host/nvme.h
> +++ b/drivers/nvme/host/nvme.h
> @@ -115,6 +115,11 @@ enum nvme_quirks {
>  	 * Prevent tag overlap between queues
>  	 */
>  	NVME_QUIRK_SHARED_TAGS                  = (1 << 13),
> +
> +	/*
> +	 * Don't change the value of the temperature threshold feature
> +	 */
> +	NVME_QUIRK_NO_TEMP_THRESH_CHANGE	= (1 << 14),
>  };
>  
>  /*
> diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
> index 931d4a9..2c0206b 100644
> --- a/drivers/nvme/host/pci.c
> +++ b/drivers/nvme/host/pci.c
> @@ -3529,7 +3529,8 @@ static const struct pci_device_id nvme_id_table[] = {
>  				NVME_QUIRK_DEALLOCATE_ZEROES, },
>  	{ PCI_VDEVICE(INTEL, 0xf1a5),	/* Intel 600P/P3100 */
>  		.driver_data = NVME_QUIRK_NO_DEEPEST_PS |
> -				NVME_QUIRK_MEDIUM_PRIO_SQ },
> +				NVME_QUIRK_MEDIUM_PRIO_SQ |
> +				NVME_QUIRK_NO_TEMP_THRESH_CHANGE },
>  	{ PCI_VDEVICE(INTEL, 0xf1a6),	/* Intel 760p/Pro 7600p */
>  		.driver_data = NVME_QUIRK_IGNORE_DEV_SUBNQN, },
>  	{ PCI_VDEVICE(INTEL, 0x5845),	/* Qemu emulated controller */
> -- 
> 2.7.4
> 
