Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0573CC433E0
	for <linux-hwmon@archiver.kernel.org>; Sat, 13 Mar 2021 22:45:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B862464E87
	for <linux-hwmon@archiver.kernel.org>; Sat, 13 Mar 2021 22:45:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233545AbhCMWo4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 13 Mar 2021 17:44:56 -0500
Received: from out20-134.mail.aliyun.com ([115.124.20.134]:47250 "EHLO
        out20-134.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231329AbhCMWos (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 13 Mar 2021 17:44:48 -0500
X-Alimail-AntiSpam: AC=SUSPECT;BC=0.6324117|-1;BR=01201311R111b1;CH=blue;DM=|SUSPECT|false|;DS=CONTINUE|ham_regular_dialog|0.110711-0.000131202-0.889158;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047205;MF=wangyugui@e16-tech.com;NM=1;PH=DS;RN=4;RT=4;SR=0;TI=SMTPD_---.JkhLCoB_1615675486;
Received: from 192.168.2.112(mailfrom:wangyugui@e16-tech.com fp:SMTPD_---.JkhLCoB_1615675486)
          by smtp.aliyun-inc.com(10.147.44.118);
          Sun, 14 Mar 2021 06:44:46 +0800
Date:   Sun, 14 Mar 2021 06:44:46 +0800
From:   Wang Yugui <wangyugui@e16-tech.com>
To:     Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] nvme-hwmon: drop not common HWMON_T_MIN and HWMON_T_MAX
Cc:     linux-hwmon@vger.kernel.org, dwagner@suse.de, hare@suse.de
In-Reply-To: <adbcff5f-22d2-1d5d-fd61-978b03fce943@roeck-us.net>
References: <20210313083256.68158-1-wangyugui@e16-tech.com> <adbcff5f-22d2-1d5d-fd61-978b03fce943@roeck-us.net>
Message-Id: <20210314064445.785F.409509F4@e16-tech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 8bit
X-Mailer: Becky! ver. 2.75.03 [en]
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

> On 3/13/21 12:32 AM, wangyugui wrote:
> > HWMON_T_MIN is not common in NVMe SSD, so drop all of them in nvme-hwmon.
> > 
> > HWMON_T_MAX is only common in NVMe SSD Composite sensor, so drop them in other sensors.
> > 
> > Before this patch(SSD: PM1733):
> > #sensors
> > nvme-pci-4300
> > Adapter: PCI adapter
> > Composite:    +49.9¡ãC  (low  = -273.1¡ãC, high = +71.8¡ãC)
> >                        (crit = +84.8¡ãC)
> > Sensor 1:     +47.9¡ãC  (low  = -273.1¡ãC, high = +65261.8¡ãC)
> > ERROR: Can't get value of subfeature temp3_min: I/O error
> > ERROR: Can't get value of subfeature temp3_max: I/O error
> > Sensor 2:     +49.9¡ãC  (low  =  +0.0¡ãC, high =  +0.0¡ãC)
> > 
> > # cat /sys/class/nvme/nvme0/hwmon1/temp3_min
> > cat: /sys/class/nvme/nvme0/hwmon1/temp3_min: Input/output error
> > # cat /sys/class/nvme/nvme0/hwmon1/temp3_max
> > cat: /sys/class/nvme/nvme0/hwmon1/temp3_max: Input/output error
> > 
> > After this patch(SSD: PM1733):
> > #sensors
> > nvme-pci-4300
> > Adapter: PCI adapter
> > Composite:    +48.9¡ãC  (high = +71.8¡ãC, crit = +84.8¡ãC)
> > Sensor 1:     +46.9¡ãC
> > Sensor 2:     +48.9¡ãC
> > 
> 
> Signed-off-by: missing.
> 
> Either case, no.
> 
> On one of my NVMEs, after setting the limits:
> 
> nvme-pci-0100
> Adapter: PCI adapter
> Composite:    +29.9¡ãC  (low  =  -0.1¡ãC, high = +76.8¡ãC)
>                        (crit = +78.8¡ãC)
> Sensor 1:     +29.9¡ãC  (low  =  -0.1¡ãC, high = +254.8¡ãC)
> Sensor 2:     +37.9¡ãC  (low  =  -0.1¡ãC, high = +254.8¡ãC)

high = +254.8¡ãC is a real value or unconfigured value ?

Best Regards
Wang Yugui (wangyugui@e16-tech.com)
2021/03/14

> That it doesn't work on yours doesn't mean it needs to be disabled for
> all other NVMEs. Instead, we'll need to figure out how to correctly
> identify that limits for the second subfeature sensor are not supported,
> or what exactly the NVME complains about when trying to read the limits
> for the second subsensor. One possible solution might be to call
> nvme_get_temp_thresh() from nvme_hwmon_is_visible() and return 0 if the
> call returns an error.
> 
> Also, the low/high limit readings on the composite sensor and on
> Sensor 1 only mean that limits are not configured. That is not a reason
> to disable the limit attributes entirely. One could instead write useful
> limits into those attributes.




