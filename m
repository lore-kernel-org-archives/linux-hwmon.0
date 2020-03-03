Return-Path: <SRS0=zXU2=4U=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35092C3F2D1
	for <linux-hwmon@archiver.kernel.org>; Tue,  3 Mar 2020 15:22:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 073482083E
	for <linux-hwmon@archiver.kernel.org>; Tue,  3 Mar 2020 15:22:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="d/NyIsGH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729544AbgCCPWH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 3 Mar 2020 10:22:07 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:46514 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727070AbgCCPWH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 3 Mar 2020 10:22:07 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 023FItBW136815;
        Tue, 3 Mar 2020 15:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=mime-version :
 message-id : date : from : to : cc : subject : references : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=6ZRTOf9U9cxbeGDpkRRNF6vhzOSMHsFT3ig88QfEl7c=;
 b=d/NyIsGHN3o5Hu2R3MBknyurLuWogV9gRXVu7S8mPgSfB2J6rHdzpGPRK8/ASj69j8cM
 gS1S2Dc/ZnXBbmx6Njjjz3+YPBj1jLvUchq+IpP4/WKsJGJYctb8pwS2rDtq4leCgmpl
 zZl812dE1nXqNvLpjgzEi98uISHCQd/zjehMpNUrB9Pb2/yw+emDc5ReDp1ua5XT4sPn
 5ylztrBPylZlfrWxoso/MlicpgSf03UYyAhaT56Qx6Y3IJsWvkhdSE4PDjsroarWh494
 59dKAePlIEpwAL/Tje67I06CpB5BalWJjvBielkgcqU8gNVqHj7r56CJ9dW66XwmLbat fw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 2yghn33r29-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 03 Mar 2020 15:21:46 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 023FHE56028707;
        Tue, 3 Mar 2020 15:21:45 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 2yg1gxnat8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 03 Mar 2020 15:21:45 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 023FLhxn031991;
        Tue, 3 Mar 2020 15:21:43 GMT
Received: from localhost (/67.169.218.210) by default (Oracle Beehive Gateway
 v4.0) with ESMTP ; Tue, 03 Mar 2020 07:20:47 -0800
USER-AGENT: Mutt/1.9.4 (2018-02-28)
MIME-Version: 1.0
Message-ID: <20200303152046.GB1752567@magnolia>
Date:   Tue, 3 Mar 2020 07:20:46 -0800 (PST)
From:   "Darrick J. Wong" <darrick.wong@oracle.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] hwmon: (adt7462) Fix an error return in
 ADT7462_REG_VOLT()
References: <20200303101608.kqjwfcazu2ylhi2a@kili.mountain>
In-Reply-To: <20200303101608.kqjwfcazu2ylhi2a@kili.mountain>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9549 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003030112
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9549 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 mlxscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1011 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003030112
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Mar 03, 2020 at 01:16:08PM +0300, Dan Carpenter wrote:
> This is only called from adt7462_update_device().  The caller expects it
> to return zero on error.  I fixed a similar issue earlier in commit
> a4bf06d58f21 ("hwmon: (adt7462) ADT7462_REG_VOLT_MAX() should return 0")
> but I missed this one.
> 
> Fixes: c0b4e3ab0c76 ("adt7462: new hwmon driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks ok to me (though I no longer have a machine with a 7462 to test),
Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>

--D

> ---
>  drivers/hwmon/adt7462.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/adt7462.c b/drivers/hwmon/adt7462.c
> index 9632e2e3c4bb..319a0519ebdb 100644
> --- a/drivers/hwmon/adt7462.c
> +++ b/drivers/hwmon/adt7462.c
> @@ -413,7 +413,7 @@ static int ADT7462_REG_VOLT(struct adt7462_data *data, int which)
>  			return 0x95;
>  		break;
>  	}
> -	return -ENODEV;
> +	return 0;
>  }
>  
>  /* Provide labels for sysfs */
> -- 
> 2.11.0
> 
