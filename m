Return-Path: <SRS0=HmyG=SM=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A85EAC10F11
	for <linux-hwmon@archiver.kernel.org>; Wed, 10 Apr 2019 18:03:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8343A206BA
	for <linux-hwmon@archiver.kernel.org>; Wed, 10 Apr 2019 18:03:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731097AbfDJSDZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 10 Apr 2019 14:03:25 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:58356 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731092AbfDJSDZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Apr 2019 14:03:25 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x3AI2QWE046114
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Apr 2019 14:03:23 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2rsmn0sxp7-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Apr 2019 14:03:23 -0400
Received: from localhost
        by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.ibm.com>;
        Wed, 10 Apr 2019 19:03:22 +0100
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
        by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Wed, 10 Apr 2019 19:03:21 +0100
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com [9.57.199.108])
        by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x3AI3KPx32440388
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 10 Apr 2019 18:03:20 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 60D05B2067;
        Wed, 10 Apr 2019 18:03:20 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 1CE08B205F;
        Wed, 10 Apr 2019 18:03:20 +0000 (GMT)
Received: from [9.85.133.108] (unknown [9.85.133.108])
        by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
        Wed, 10 Apr 2019 18:03:19 +0000 (GMT)
Subject: Re: [PATCH v2 2/2] hwmon: OCC drivers are ARM-only
To:     Jean Delvare <jdelvare@suse.de>, linux-hwmon@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>
References: <20190410124726.2d7e9d38@endymion>
 <20190410125635.5610857b@endymion>
From:   Eddie James <eajames@linux.ibm.com>
Date:   Wed, 10 Apr 2019 13:03:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190410125635.5610857b@endymion>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19041018-0072-0000-0000-000004181D54
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010903; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000284; SDB=6.01187164; UDB=6.00621822; IPR=6.00967927;
 MB=3.00026379; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-10 18:03:22
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19041018-0073-0000-0000-00004BC73169
Message-Id: <96dc1933-de28-82d4-29e7-394433b88471@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-04-10_08:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904100120
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


On 4/10/19 5:56 AM, Jean Delvare wrote:
> These drivers are for a BMC inside PowerPC servers. The BMC runs on
> ARM hardware, so only propose the drivers on this architecture, unless
> build-testing.


Thanks!

Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Eddie James <eajames@linux.ibm.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> ---
> If PowerPC BMCs are ever based on another architecture and these drivers
> are compatible with them, then the list can be extended.
>
>   drivers/hwmon/occ/Kconfig |    2 ++
>   1 file changed, 2 insertions(+)
>
> --- linux-5.0.orig/drivers/hwmon/occ/Kconfig	2019-04-10 11:54:07.014895111 +0200
> +++ linux-5.0/drivers/hwmon/occ/Kconfig	2019-04-10 12:12:27.379725640 +0200
> @@ -5,6 +5,7 @@
>   config SENSORS_OCC_P8_I2C
>   	tristate "POWER8 OCC through I2C"
>   	depends on I2C
> +	depends on ARM || ARM64 || COMPILE_TEST
>   	select SENSORS_OCC
>   	help
>   	 This option enables support for monitoring sensors provided by the
> @@ -17,6 +18,7 @@ config SENSORS_OCC_P8_I2C
>   config SENSORS_OCC_P9_SBE
>   	tristate "POWER9 OCC through SBE"
>   	depends on FSI_OCC
> +	depends on ARM || ARM64 || COMPILE_TEST
>   	select SENSORS_OCC
>   	help
>   	 This option enables support for monitoring sensors provided by the
>

