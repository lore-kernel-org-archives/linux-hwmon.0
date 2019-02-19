Return-Path: <SRS0=3Mac=Q2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7E60C43381
	for <linux-hwmon@archiver.kernel.org>; Tue, 19 Feb 2019 15:08:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9789820859
	for <linux-hwmon@archiver.kernel.org>; Tue, 19 Feb 2019 15:08:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="emovxxhj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726356AbfBSPIf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 19 Feb 2019 10:08:35 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42928 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbfBSPIf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 19 Feb 2019 10:08:35 -0500
Received: by mail-pg1-f193.google.com with SMTP id b2so4530278pgl.9;
        Tue, 19 Feb 2019 07:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=W6Hd5sZy+wPBS8w27mmEbVfiXnWBtSxklu7+i6OVV+M=;
        b=emovxxhjRqrrAIrn6qITy+HzzXZv+PR1/rJpYoTvVhkQKx0P3+On6mvWhfRE3p9H5v
         fvryDaChPJvUOj5zVQgcQvzuIihaTOxxUk96co2Lzkp9L89/sfprOVD3/C/0CH9maNFw
         OYVSbK7C957C6v+gHypCYzVh6JU0zMxQDnk8kz4Tq3OZdZyer5CwXxSVGQNRByKyBbev
         YZP2pqJMDsbwvlRpXtXGZhJYJcy77zh209fYqwCSM/Cq0WeSj3CRbrcHUbJaZg0SsN3g
         JSxsYvFmX0e9qDen1OOxmLH6AQ3VgKVenxESubHSa/C+OY3AvZb5Z23XRlR30QMHu3jA
         /nrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=W6Hd5sZy+wPBS8w27mmEbVfiXnWBtSxklu7+i6OVV+M=;
        b=fJWa4JgXJido8x+sQ6ZP4ZpgQv+2hHcQGrFHVgnaOaEhKbRAUGxH+mF2GekCRF6/B4
         gEw566T57uSjcmUpIbSZsKkaJwrt3Sz4o3rwqf4sgDO5COZHz2a8Rhmexgsz4ovVMxIP
         g6p0deM5e7AZxbsOKtfn/yTcxiPF3ONMlUmU0UjFUGm972d1+UpGNZgdPXQtY2VXX8C+
         tbAZhYUUF8nqG6DIKNoJnyJ+02f9F8+xbV7dZcOTn9aQrDjKvR1IMCkuAZ2OnbnoWpPW
         O5s/VRTcwCVVIJf+nOX+SQFoKaM6gTb6zcOapl3h0tTmhOvYobWKzQts7Llsn8C2pcm8
         q+eQ==
X-Gm-Message-State: AHQUAuYHFnhrEQkYNw4fte29BDO7jaeJrSiu51iDU77HSYn8olozTFdk
        jSkWt5f9T7IPWXmAB/8hek4vvzgc
X-Google-Smtp-Source: AHgI3Ia12Vnu3TPiysituutLrck+fp+Snb0Nhw9OiuRFFQmoTnzDjUzulVciLa6a25yjhjuRFdvUlA==
X-Received: by 2002:a63:4a0a:: with SMTP id x10mr7804074pga.325.1550588913581;
        Tue, 19 Feb 2019 07:08:33 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 20sm11350365pfs.182.2019.02.19.07.08.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Feb 2019 07:08:32 -0800 (PST)
Subject: Re: [PATCH 11/11] hwmon/coretemp: Support multi-die/package
To:     Len Brown <lenb@kernel.org>, linux-drivers-review@linux.intel.com
Cc:     Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org,
        linux-hwmon@vger.kernel.org
References: <635b2bf8b1151a191cd9299276b75791a818c0c2.1550545163.git.len.brown@intel.com>
 <8ce75b95ef6105ebe5fb8c9e43b33f06516e3c16.1550545163.git.len.brown@intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <46024e46-c5af-f6de-c6bc-71fb7a4cd6bd@roeck-us.net>
Date:   Tue, 19 Feb 2019 07:08:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <8ce75b95ef6105ebe5fb8c9e43b33f06516e3c16.1550545163.git.len.brown@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2/18/19 7:22 PM, Len Brown wrote:
> From: Zhang Rui <rui.zhang@intel.com>
> 
> This patch introduces coretemp driver support
> for new dual-die/package systems.
> 
> On the new dual-die/package systems, the package temperature MSRs becomes
> die-scope. Thus instead of one hwmon device per physical package, now
> there should be one hwmon device for each die on these systems.
> 
> On the hardwares that do not have multi-die support,
> topology_unique_die_id() equals topology_physical_package_id(), thus the
> only difference is that physical package id is used as the coretemp
> platform device id, instead of logical package id on these systems.
> 
> Signed-off-by: Zhang Rui <rui.zhang@intel.com>
> Signed-off-by: Len Brown <len.brown@intel.com>
> Cc: linux-pm@vger.kernel.org
> Cc: linux-hwmon@vger.kernel.org
> Signed-off-by: Len Brown <len.brown@intel.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

I assume this will be pushed together with the rest of the series.

Thanks,
Guenter

> ---
>   drivers/hwmon/coretemp.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
> index 5d34f7271e67..a0b6b2247c3a 100644
> --- a/drivers/hwmon/coretemp.c
> +++ b/drivers/hwmon/coretemp.c
> @@ -435,7 +435,7 @@ static int chk_ucode_version(unsigned int cpu)
>   
>   static struct platform_device *coretemp_get_pdev(unsigned int cpu)
>   {
> -	int pkgid = topology_logical_package_id(cpu);
> +	int pkgid = topology_unique_die_id(cpu);
>   
>   	if (pkgid >= 0 && pkgid < max_packages)
>   		return pkg_devices[pkgid];
> @@ -579,7 +579,7 @@ static struct platform_driver coretemp_driver = {
>   
>   static struct platform_device *coretemp_device_add(unsigned int cpu)
>   {
> -	int err, pkgid = topology_logical_package_id(cpu);
> +	int err, pkgid = topology_unique_die_id(cpu);
>   	struct platform_device *pdev;
>   
>   	if (pkgid < 0)
> @@ -703,7 +703,7 @@ static int coretemp_cpu_offline(unsigned int cpu)
>   	 * the rest.
>   	 */
>   	if (cpumask_empty(&pd->cpumask)) {
> -		pkg_devices[topology_logical_package_id(cpu)] = NULL;
> +		pkg_devices[topology_unique_die_id(cpu)] = NULL;
>   		platform_device_unregister(pdev);
>   		return 0;
>   	}
> @@ -732,6 +732,7 @@ static enum cpuhp_state coretemp_hp_online;
>   static int __init coretemp_init(void)
>   {
>   	int err;
> +	struct cpuinfo_x86 *c = &cpu_data(0);
>   
>   	/*
>   	 * CPUID.06H.EAX[0] indicates whether the CPU has thermal
> @@ -741,7 +742,7 @@ static int __init coretemp_init(void)
>   	if (!x86_match_cpu(coretemp_ids))
>   		return -ENODEV;
>   
> -	max_packages = topology_max_packages();
> +	max_packages = topology_max_packages() * c->x86_max_dies;
>   	pkg_devices = kcalloc(max_packages, sizeof(struct platform_device *),
>   			      GFP_KERNEL);
>   	if (!pkg_devices)
> 

