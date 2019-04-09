Return-Path: <SRS0=FEvN=SL=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5394BC10F0E
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Apr 2019 15:20:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2A2AF2084F
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Apr 2019 15:20:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726431AbfDIPUa (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Apr 2019 11:20:30 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:40950 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726396AbfDIPU3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 9 Apr 2019 11:20:29 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x39FAC5B118860
        for <linux-hwmon@vger.kernel.org>; Tue, 9 Apr 2019 11:20:28 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2rrwt30kuc-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Apr 2019 11:20:28 -0400
Received: from localhost
        by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Tue, 9 Apr 2019 16:20:27 +0100
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
        by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Tue, 9 Apr 2019 16:20:25 +0100
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
        by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x39FKNCJ33947682
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 9 Apr 2019 15:20:23 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 4860FAC078;
        Tue,  9 Apr 2019 15:20:23 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id DA456AC075;
        Tue,  9 Apr 2019 15:20:22 +0000 (GMT)
Received: from [9.41.179.222] (unknown [9.41.179.222])
        by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
        Tue,  9 Apr 2019 15:20:22 +0000 (GMT)
Subject: Re: [PATCH] hwmon: OCC drivers are PowerPC-only
To:     Jean Delvare <jdelvare@suse.de>, linux-hwmon@vger.kernel.org
Cc:     Eddie James <eajames@linux.ibm.com>,
        Guenter Roeck <linux@roeck-us.net>
References: <20190409144509.19da00c4@endymion>
From:   Eddie James <eajames@linux.vnet.ibm.com>
Date:   Tue, 9 Apr 2019 10:20:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190409144509.19da00c4@endymion>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19040915-0064-0000-0000-000003C88067
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010896; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000284; SDB=6.01186633; UDB=6.00621502; IPR=6.00967394;
 MB=3.00026364; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-09 15:20:26
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19040915-0065-0000-0000-00003D008DF4
Message-Id: <a07ecf9c-2ad2-70f6-0f2f-1c438be3acdc@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-04-09_07:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904090095
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


On 4/9/19 7:45 AM, Jean Delvare wrote:
> Don't propose PowerPC-only drivers on other architectures, unless
> build-testing.


This driver does NOT only run on PowerPC; rather it runs on a BMC 
processor connected to a PowerPC processor. BMC will most likely be ARM, 
but shouldn't be restricted to that arch only.


>
> Also drop configuration symbol SENSORS_OCC which serves no purpose
> that I can see.
>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Eddie James <eajames@linux.ibm.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> ---
> SENSORS_OCC *would* serve a purpose if the common code between the
> POWER8 driver and the POWER9 driver would go in a separate, shared
> module, and occ-p8-hwmon and occ-p9-hwmon would only contain the
> specific code. This would avoid packaging the same code twice in 2
> separate modules, therefore saving some storage space for ppc
> distributions.


Well you'd never have both P8 and P9 enabled at once, so space shouldn't 
be an issue. I agree this could be cleaner but I think I was getting 
duplicate symbol errors for the compile test and so I did it this way. 
If this doesn't lead to errors in the compile test, I'm fine with this 
(without the change for PPC only though).


Thanks,

Eddie

>
> As far as I can see, this would simply require exporting 2 functions
> (occ_setup and occ_shutdown). Is there any reason why things were not
> done that way in the first place? This would look cleaner to me.
>
>   drivers/hwmon/Makefile    |    2 +-
>   drivers/hwmon/occ/Kconfig |    8 ++------
>   2 files changed, 3 insertions(+), 7 deletions(-)
>
> --- linux-5.0.orig/drivers/hwmon/occ/Kconfig	2019-03-04 00:21:29.000000000 +0100
> +++ linux-5.0/drivers/hwmon/occ/Kconfig	2019-04-09 14:08:41.316551071 +0200
> @@ -5,7 +5,7 @@
>   config SENSORS_OCC_P8_I2C
>   	tristate "POWER8 OCC through I2C"
>   	depends on I2C
> -	select SENSORS_OCC
> +	depends on POWERPC || COMPILE_TEST
>   	help
>   	 This option enables support for monitoring sensors provided by the
>   	 On-Chip Controller (OCC) on a POWER8 processor. Communications with
> @@ -17,7 +17,7 @@ config SENSORS_OCC_P8_I2C
>   config SENSORS_OCC_P9_SBE
>   	tristate "POWER9 OCC through SBE"
>   	depends on FSI_OCC
> -	select SENSORS_OCC
> +	depends on POWERPC || COMPILE_TEST
>   	help
>   	 This option enables support for monitoring sensors provided by the
>   	 On-Chip Controller (OCC) on a POWER9 processor. Communications with
> @@ -25,7 +25,3 @@ config SENSORS_OCC_P9_SBE
>   
>   	 This driver can also be built as a module. If so, the module will be
>   	 called occ-p9-hwmon.
> -
> -config SENSORS_OCC
> -	bool "POWER On-Chip Controller"
> -	depends on SENSORS_OCC_P8_I2C || SENSORS_OCC_P9_SBE
> --- linux-5.0.orig/drivers/hwmon/Makefile	2019-03-04 00:21:29.000000000 +0100
> +++ linux-5.0/drivers/hwmon/Makefile	2019-04-09 14:33:49.605510047 +0200
> @@ -178,7 +178,7 @@ obj-$(CONFIG_SENSORS_WM831X)	+= wm831x-h
>   obj-$(CONFIG_SENSORS_WM8350)	+= wm8350-hwmon.o
>   obj-$(CONFIG_SENSORS_XGENE)	+= xgene-hwmon.o
>   
> -obj-$(CONFIG_SENSORS_OCC)	+= occ/
> +obj-y				+= occ/
>   obj-$(CONFIG_PMBUS)		+= pmbus/
>   
>   ccflags-$(CONFIG_HWMON_DEBUG_CHIP) := -DDEBUG
>
>

