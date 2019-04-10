Return-Path: <SRS0=HmyG=SM=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C547C10F11
	for <linux-hwmon@archiver.kernel.org>; Wed, 10 Apr 2019 18:02:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 38F3B206BA
	for <linux-hwmon@archiver.kernel.org>; Wed, 10 Apr 2019 18:02:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730721AbfDJSCu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 10 Apr 2019 14:02:50 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:56614 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728749AbfDJSCu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Apr 2019 14:02:50 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x3AHjDm1071953
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Apr 2019 14:02:48 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2rsjvwykp0-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Apr 2019 14:02:42 -0400
Received: from localhost
        by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.ibm.com>;
        Wed, 10 Apr 2019 19:02:37 +0100
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
        by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Wed, 10 Apr 2019 19:02:34 +0100
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com [9.57.199.108])
        by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x3AI2XXJ23199928
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 10 Apr 2019 18:02:33 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0D2E7B206A;
        Wed, 10 Apr 2019 18:02:33 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id BCFDDB206B;
        Wed, 10 Apr 2019 18:02:32 +0000 (GMT)
Received: from [9.85.133.108] (unknown [9.85.133.108])
        by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
        Wed, 10 Apr 2019 18:02:32 +0000 (GMT)
Subject: Re: [PATCH v2 1/2] hwmon: (occ) Move common code to a separate module
To:     Jean Delvare <jdelvare@suse.de>, linux-hwmon@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>
References: <20190410124726.2d7e9d38@endymion>
From:   Eddie James <eajames@linux.ibm.com>
Date:   Wed, 10 Apr 2019 13:02:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190410124726.2d7e9d38@endymion>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19041018-0040-0000-0000-000004DF1C68
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010903; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000284; SDB=6.01187163; UDB=6.00621822; IPR=6.00967927;
 MB=3.00026379; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-10 18:02:35
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19041018-0041-0000-0000-000008EA2333
Message-Id: <cc624b5c-f6c5-adb2-7709-f2fc5d851562@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-04-10_08:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904100119
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


On 4/10/19 5:47 AM, Jean Delvare wrote:
> Instead of duplicating the common code into the 2 (binary) drivers,
> move the common code to a separate module. This is cleaner.
>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Eddie James <eajames@linux.ibm.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> ---
> Eddie, can you please give it a try and confirm it works?


Yes, this works well.

Reviewed-by: Eddie James <eajames@linux.ibm.com>

Tested-by: Eddie James <eajames@linux.ibm.com>


>
> Note: I kept the module names as they were before, hence the extra
> "*-objs :=" statements. They could be removed if we rename the source
> files, but that's better done in git directly. I don't mind either way
> personally.
>
>   drivers/hwmon/occ/Kconfig  |    3 +--
>   drivers/hwmon/occ/Makefile |    6 ++++--
>   drivers/hwmon/occ/common.c |    7 +++++++
>   drivers/hwmon/occ/sysfs.c  |    2 ++
>   4 files changed, 14 insertions(+), 4 deletions(-)
>
> --- linux-5.0.orig/drivers/hwmon/occ/Kconfig	2019-04-10 11:30:05.579537638 +0200
> +++ linux-5.0/drivers/hwmon/occ/Kconfig	2019-04-10 11:31:20.843383376 +0200
> @@ -27,5 +27,4 @@ config SENSORS_OCC_P9_SBE
>   	 called occ-p9-hwmon.
>   
>   config SENSORS_OCC
> -	bool "POWER On-Chip Controller"
> -	depends on SENSORS_OCC_P8_I2C || SENSORS_OCC_P9_SBE
> +	tristate
> --- linux-5.0.orig/drivers/hwmon/occ/Makefile	2019-03-04 00:21:29.000000000 +0100
> +++ linux-5.0/drivers/hwmon/occ/Makefile	2019-04-10 11:33:23.631765535 +0200
> @@ -1,5 +1,7 @@
> -occ-p8-hwmon-objs := common.o sysfs.o p8_i2c.o
> -occ-p9-hwmon-objs := common.o sysfs.o p9_sbe.o
> +occ-hwmon-common-objs := common.o sysfs.o
> +occ-p8-hwmon-objs := p8_i2c.o
> +occ-p9-hwmon-objs := p9_sbe.o
>   
> +obj-$(CONFIG_SENSORS_OCC) += occ-hwmon-common.o
>   obj-$(CONFIG_SENSORS_OCC_P8_I2C) += occ-p8-hwmon.o
>   obj-$(CONFIG_SENSORS_OCC_P9_SBE) += occ-p9-hwmon.o
> --- linux-5.0.orig/drivers/hwmon/occ/common.c	2019-03-04 00:21:29.000000000 +0100
> +++ linux-5.0/drivers/hwmon/occ/common.c	2019-04-10 11:44:53.035573580 +0200
> @@ -1,11 +1,13 @@
>   // SPDX-License-Identifier: GPL-2.0
>   
>   #include <linux/device.h>
> +#include <linux/export.h>
>   #include <linux/hwmon.h>
>   #include <linux/hwmon-sysfs.h>
>   #include <linux/jiffies.h>
>   #include <linux/kernel.h>
>   #include <linux/math64.h>
> +#include <linux/module.h>
>   #include <linux/mutex.h>
>   #include <linux/sysfs.h>
>   #include <asm/unaligned.h>
> @@ -1096,3 +1098,8 @@ int occ_setup(struct occ *occ, const cha
>   
>   	return rc;
>   }
> +EXPORT_SYMBOL_GPL(occ_setup);
> +
> +MODULE_AUTHOR("Eddie James <eajames@linux.ibm.com>");
> +MODULE_DESCRIPTION("Common OCC hwmon code");
> +MODULE_LICENSE("GPL");
> --- linux-5.0.orig/drivers/hwmon/occ/sysfs.c	2019-03-04 00:21:29.000000000 +0100
> +++ linux-5.0/drivers/hwmon/occ/sysfs.c	2019-04-10 11:39:38.627003382 +0200
> @@ -12,6 +12,7 @@
>   
>   #include <linux/bitops.h>
>   #include <linux/device.h>
> +#include <linux/export.h>
>   #include <linux/hwmon-sysfs.h>
>   #include <linux/kernel.h>
>   #include <linux/sysfs.h>
> @@ -186,3 +187,4 @@ void occ_shutdown(struct occ *occ)
>   {
>   	sysfs_remove_group(&occ->bus_dev->kobj, &occ_sysfs);
>   }
> +EXPORT_SYMBOL_GPL(occ_shutdown);
>
>

