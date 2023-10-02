Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07203E784BB
	for <linux-hwmon@archiver.kernel.org>; Mon,  2 Oct 2023 14:49:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237823AbjJBOtF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 2 Oct 2023 10:49:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237832AbjJBOtE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 2 Oct 2023 10:49:04 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D29D94
        for <linux-hwmon@vger.kernel.org>; Mon,  2 Oct 2023 07:49:01 -0700 (PDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 392Egmeb026264;
        Mon, 2 Oct 2023 14:48:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=HeTWcML4oqhU/rNDCjnz3VB5yJDijve2z+0ZmZSFQ9Q=;
 b=SwiDLVzt4BA/lbmvvLFzEZSxdW/0N+G4X5Az1pxC0d/bUOVID9i//gegzZ+oL63cFIb2
 /4Leh8Xf7O/OTq17YExVgQJbdipSz7BymWAwHq3/AXKAUCEAqN1cuNyoqstrYxEz2sUd
 LuF9Gvidr5uUxuaZbMO40TDwNRud/jyWwg0bdKbqNTWPewtNuY7yPjknvxZTpYCmSzcm
 LBsgbKdlqP8K2Y5ARrffl1rRvrtV05sGs0mmTcteMwehSju5cIQOkTDXdOYO3fK2Fg9B
 /ApO/Mj+AKwvMbbCQbZlRZd8lQVGFfPEW8y5ccM913zobPUHpMkcsuTEr+JugemQb6XJ 3w== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tfyf4gv6p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 02 Oct 2023 14:48:38 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
        by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 392DcBPV007437;
        Mon, 2 Oct 2023 14:48:37 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
        by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3teygk23hy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 02 Oct 2023 14:48:37 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
        by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 392Emblj6619862
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 2 Oct 2023 14:48:37 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id F26CD5805E;
        Mon,  2 Oct 2023 14:48:36 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id CABC35805A;
        Mon,  2 Oct 2023 14:48:36 +0000 (GMT)
Received: from [9.61.141.201] (unknown [9.61.141.201])
        by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
        Mon,  2 Oct 2023 14:48:36 +0000 (GMT)
Message-ID: <2a63545f-f327-5708-0d3b-6ceb1ddce2ff@linux.ibm.com>
Date:   Mon, 2 Oct 2023 09:48:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 11/24] hwmon: (occ/p9_sbe) Convert to platform remove
 callback returning void
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Joel Stanley <joel@jms.id.au>, linux-hwmon@vger.kernel.org,
        kernel@pengutronix.de
References: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
 <20230918085951.1234172-12-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
From:   Eddie James <eajames@linux.ibm.com>
In-Reply-To: <20230918085951.1234172-12-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tCItfrG9ZlZI6KiSSKZBcpXL8v-p0gIY
X-Proofpoint-ORIG-GUID: tCItfrG9ZlZI6KiSSKZBcpXL8v-p0gIY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-02_09,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 adultscore=0 clxscore=1011 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310020110
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


On 9/18/23 03:59, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() is renamed to .remove().
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>   drivers/hwmon/occ/p9_sbe.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
> index 96521363b696..b5993c79c09e 100644
> --- a/drivers/hwmon/occ/p9_sbe.c
> +++ b/drivers/hwmon/occ/p9_sbe.c
> @@ -167,7 +167,7 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
>   	return rc;
>   }
>   
> -static int p9_sbe_occ_remove(struct platform_device *pdev)
> +static void p9_sbe_occ_remove(struct platform_device *pdev)
>   {
>   	struct occ *occ = platform_get_drvdata(pdev);
>   	struct p9_sbe_occ *ctx = to_p9_sbe_occ(occ);
> @@ -178,8 +178,6 @@ static int p9_sbe_occ_remove(struct platform_device *pdev)
>   	occ_shutdown(occ);
>   
>   	kvfree(ctx->ffdc);
> -
> -	return 0;
>   }
>   
>   static const struct of_device_id p9_sbe_occ_of_match[] = {
> @@ -195,7 +193,7 @@ static struct platform_driver p9_sbe_occ_driver = {
>   		.of_match_table = p9_sbe_occ_of_match,
>   	},
>   	.probe	= p9_sbe_occ_probe,
> -	.remove = p9_sbe_occ_remove,
> +	.remove_new = p9_sbe_occ_remove,
>   };
>   
>   module_platform_driver(p9_sbe_occ_driver);
