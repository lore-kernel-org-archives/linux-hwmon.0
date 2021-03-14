Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1DA5C433DB
	for <linux-hwmon@archiver.kernel.org>; Sun, 14 Mar 2021 15:52:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A673F64E51
	for <linux-hwmon@archiver.kernel.org>; Sun, 14 Mar 2021 15:52:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233369AbhCNPv6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 14 Mar 2021 11:51:58 -0400
Received: from out20-38.mail.aliyun.com ([115.124.20.38]:36388 "EHLO
        out20-38.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233529AbhCNPv2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 14 Mar 2021 11:51:28 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.2933226|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0895482-0.000206275-0.910245;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047194;MF=wangyugui@e16-tech.com;NM=1;PH=DS;RN=4;RT=4;SR=0;TI=SMTPD_---.JkyPIWb_1615737080;
Received: from 192.168.2.112(mailfrom:wangyugui@e16-tech.com fp:SMTPD_---.JkyPIWb_1615737080)
          by smtp.aliyun-inc.com(10.147.40.200);
          Sun, 14 Mar 2021 23:51:20 +0800
Date:   Sun, 14 Mar 2021 23:51:20 +0800
From:   Wang Yugui <wangyugui@e16-tech.com>
To:     Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] nvme-hwmon: drop not common HWMON_T_MIN and HWMON_T_MAX
Cc:     linux-hwmon@vger.kernel.org, dwagner@suse.de, hare@suse.de
In-Reply-To: <86ec9dc2-5c4b-1a03-8f58-ea132bd0aef1@roeck-us.net>
References: <20210314064445.785F.409509F4@e16-tech.com> <86ec9dc2-5c4b-1a03-8f58-ea132bd0aef1@roeck-us.net>
Message-Id: <20210314235117.8386.409509F4@e16-tech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 8bit
X-Mailer: Becky! ver. 2.75.03 [en]
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

> On 3/13/21 2:44 PM, Wang Yugui wrote:
> > Hi,
> > 
> >> On 3/13/21 12:32 AM, wangyugui wrote:
> >>> HWMON_T_MIN is not common in NVMe SSD, so drop all of them in nvme-hwmon.
> >>>
> >>> HWMON_T_MAX is only common in NVMe SSD Composite sensor, so drop them in other sensors.
> >>>
> >>> Before this patch(SSD: PM1733):
> >>> #sensors
> >>> nvme-pci-4300
> >>> Adapter: PCI adapter
> >>> Composite:    +49.9°„C  (low  = -273.1°„C, high = +71.8°„C)
> >>>                        (crit = +84.8°„C)
> >>> Sensor 1:     +47.9°„C  (low  = -273.1°„C, high = +65261.8°„C)
> >>> ERROR: Can't get value of subfeature temp3_min: I/O error
> >>> ERROR: Can't get value of subfeature temp3_max: I/O error
> >>> Sensor 2:     +49.9°„C  (low  =  +0.0°„C, high =  +0.0°„C)
> >>>
> >>> # cat /sys/class/nvme/nvme0/hwmon1/temp3_min
> >>> cat: /sys/class/nvme/nvme0/hwmon1/temp3_min: Input/output error
> >>> # cat /sys/class/nvme/nvme0/hwmon1/temp3_max
> >>> cat: /sys/class/nvme/nvme0/hwmon1/temp3_max: Input/output error
> >>>
> >>> After this patch(SSD: PM1733):
> >>> #sensors
> >>> nvme-pci-4300
> >>> Adapter: PCI adapter
> >>> Composite:    +48.9°„C  (high = +71.8°„C, crit = +84.8°„C)
> >>> Sensor 1:     +46.9°„C
> >>> Sensor 2:     +48.9°„C
> >>>
> >>
> >> Signed-off-by: missing.
> >>
> >> Either case, no.
> >>
> >> On one of my NVMEs, after setting the limits:
> >>
> >> nvme-pci-0100
> >> Adapter: PCI adapter
> >> Composite:    +29.9°„C  (low  =  -0.1°„C, high = +76.8°„C)
> >>                        (crit = +78.8°„C)
> >> Sensor 1:     +29.9°„C  (low  =  -0.1°„C, high = +254.8°„C)
> >> Sensor 2:     +37.9°„C  (low  =  -0.1°„C, high = +254.8°„C)
> > 
> > high = +254.8°„C is a real value or unconfigured value ?
> > 
> 
> This was a configured value, as mentioned above. Same system and NVME,
> with differently configured limit values:
> 
> nvme-pci-0100
> Adapter: PCI adapter
> Composite:    +31.9°„C  (low  =  -0.1°„C, high = +76.8°„C)
>                        (crit = +78.8°„C)
> Sensor 1:     +31.9°„C  (low  = -10.2°„C, high = +126.8°„C)
> Sensor 2:     +49.9°„C  (low  =  +4.8°„C, high = +89.8°„C)
> 
> Default values, with a different NVME, on a different system:
> 
> nvme-pci-0100
> Adapter: PCI adapter
> Composite:    +38.9°„C  (low  = -273.1°„C, high = +84.8°„C)
>                        (crit = +84.8°„C)
> Sensor 1:     +38.9°„C  (low  = -273.1°„C, high = +65261.8°„C)
> Sensor 2:     +42.9°„C  (low  = -273.1°„C, high = +65261.8°„C)
> 
> Same NVME as the first one, in a different system, with default
> values:
> 
> nvme-pci-2500
> Adapter: PCI adapter
> Composite:    +38.9°„C  (low  = -273.1°„C, high = +76.8°„C)
>                        (crit = +78.8°„C)
> Sensor 1:     +38.9°„C  (low  = -273.1°„C, high = +65261.8°„C)
> Sensor 2:     +44.9°„C  (low  = -273.1°„C, high = +65261.8°„C)
> 
> Guenter

Most of the users do not like something like 'low  = -273.1°„C' or 
'high = +65261.8°„C' that just seem noise, or software bug, or hardware
error, and that will cause unnecessary worry.

We can support more HWMON_T_MIN and HWMON_T_MAX for advanced 
user iff a valid configure value in the futher, and without any noise.

Best Regards
Wang Yugui (wangyugui@e16-tech.com)
2021/03/14



