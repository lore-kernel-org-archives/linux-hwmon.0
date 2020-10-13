Return-Path: <SRS0=maGh=DU=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F41BBC433E7
	for <linux-hwmon@archiver.kernel.org>; Tue, 13 Oct 2020 14:12:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93195247D8
	for <linux-hwmon@archiver.kernel.org>; Tue, 13 Oct 2020 14:12:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NUU1IAYt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388446AbgJMOMI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 13 Oct 2020 10:12:08 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:47024 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388308AbgJMOMI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 13 Oct 2020 10:12:08 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09DE8NXQ098830;
        Tue, 13 Oct 2020 14:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=SACND/0FV9nJk+nJuMR0KaCaor95bU1/H/ACseLtUP4=;
 b=NUU1IAYtfUhQuBWlSooFBp/Yh0ATA9HCcX0XIGu08DB8CazwNsV/cyGOJ0HAfrKZHqE/
 8IsADirenCZvmyPPVAZBb2ZOD2TFLEiB9/x1uIP1U/HamXeMfjBx/AtI6hc2yIqnFP3D
 GiORSp5vL0SW834Z72a82U932IXOXVfooeyE2K342suerU/2ZPI30HgvvJJzlnY2PbpP
 7LlKyIIJ9NVIfCVQkZJXotXjFV5WOTx5n9VKn3RxD/Ucn1YGSOwPAF0sqv5MvQBEGehT
 0pJeMhnX6zLAZpwLchBTZ3XlWAkEKXn9SICUuU2Jxj0qrqaEyENlZlMjM4Dmo7rxfDKR zg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 3434wkjd9p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 13 Oct 2020 14:11:05 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09DE1c0B143025;
        Tue, 13 Oct 2020 14:09:05 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 343phn7bj1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 13 Oct 2020 14:09:05 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09DE93nT009006;
        Tue, 13 Oct 2020 14:09:04 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 13 Oct 2020 07:09:03 -0700
Date:   Tue, 13 Oct 2020 17:08:58 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     rahul.tanwar@linux.intel.com
Cc:     linux-hwmon@vger.kernel.org
Subject: [bug report] hwmon: Add hardware monitoring driver for Moortec
 MR75203 PVT controller
Message-ID: <20201013140858.GA375361@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9772 signatures=668681
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 suspectscore=3
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010130106
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9772 signatures=668681
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 phishscore=0 suspectscore=3 impostorscore=0 clxscore=1011
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010130107
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello Rahul Tanwar,

The patch 9d823351a337: "hwmon: Add hardware monitoring driver for
Moortec MR75203 PVT controller" from Oct 5, 2020, leads to the
following static checker warning:

	drivers/hwmon/mr75203.c:479 pvt_clk_enable()
	warn: 'pvt->clk' not released on lines: 479.

drivers/hwmon/mr75203.c
   471  static int pvt_clk_enable(struct device *dev, struct pvt_device *pvt)
   472  {
   473          int ret;
   474  
   475          ret = clk_prepare_enable(pvt->clk);
   476          if (ret)
   477                  return ret;
   478  
   479          return devm_add_action_or_reset(dev, pvt_clk_disable, pvt);

Do we have to disable the clock if devm_add_action_or_reset() fails?
This is sort of a new Smatch check so I'm not entirely sure of the rules
mysql.

   480  }

regards,
dan carpenter
