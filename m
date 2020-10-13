Return-Path: <SRS0=maGh=DU=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA59C433E7
	for <linux-hwmon@archiver.kernel.org>; Tue, 13 Oct 2020 18:44:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7400D208D5
	for <linux-hwmon@archiver.kernel.org>; Tue, 13 Oct 2020 18:44:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="u+ZmLncL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731640AbgJMSoG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 13 Oct 2020 14:44:06 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:35852 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731636AbgJMSoE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 13 Oct 2020 14:44:04 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09DIe0Pq048129;
        Tue, 13 Oct 2020 18:43:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=ZnO81SjQj/6CkQFYCkEDNt/zsQ1cTVDZu+HiCeZ35qY=;
 b=u+ZmLncL2/A2/W29PKbGN9eKRHsqIqJnYOLw/mg8k2siqspXdqLc5U02j6bPNGvMExrd
 uQtPAADMBdEjdNIcW5CACp0PdMobA5QzJ6JxpfLpob1clWD70NkmtAu0NxaxOZRSioRf
 JiMD/3RK8GFJBC3Hof4+itUvuENEhdcMDz3g+iDryojSnjSI1V2aBnYblvK7e43mNxVX
 Faeumr+JZpN+fzSqKv3DNE3gQdR7j1mys+bKA5CUEQJCV+WTpByikxvP8k9ZL5yeQGEN
 xXVi0rt1+oQzFKVdc8T1JdhNV+ubNk3/ReOh3H4K/XCZCuhPnscaTiCEGmlOHfH8aIXJ 6Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 343vaea53s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 13 Oct 2020 18:43:50 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09DIZe3M093781;
        Tue, 13 Oct 2020 18:43:49 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 343phnk9ga-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 13 Oct 2020 18:43:49 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 09DIhm5X011818;
        Tue, 13 Oct 2020 18:43:48 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 13 Oct 2020 11:43:47 -0700
Date:   Tue, 13 Oct 2020 21:43:42 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     rahul.tanwar@linux.intel.com, linux-hwmon@vger.kernel.org
Subject: Re: [bug report] hwmon: Add hardware monitoring driver for Moortec
 MR75203 PVT controller
Message-ID: <20201013184342.GV18329@kadam>
References: <20201013140858.GA375361@mwanda>
 <20201013165714.GJ251780@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201013165714.GJ251780@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9773 signatures=668681
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010130131
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9773 signatures=668681
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010130131
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Oct 13, 2020 at 09:57:14AM -0700, Guenter Roeck wrote:
> On Tue, Oct 13, 2020 at 05:08:58PM +0300, Dan Carpenter wrote:
> > Hello Rahul Tanwar,
> > 
> > The patch 9d823351a337: "hwmon: Add hardware monitoring driver for
> > Moortec MR75203 PVT controller" from Oct 5, 2020, leads to the
> > following static checker warning:
> > 
> > 	drivers/hwmon/mr75203.c:479 pvt_clk_enable()
> > 	warn: 'pvt->clk' not released on lines: 479.
> > 
> > drivers/hwmon/mr75203.c
> >    471  static int pvt_clk_enable(struct device *dev, struct pvt_device *pvt)
> >    472  {
> >    473          int ret;
> >    474  
> >    475          ret = clk_prepare_enable(pvt->clk);
> >    476          if (ret)
> >    477                  return ret;
> >    478  
> >    479          return devm_add_action_or_reset(dev, pvt_clk_disable, pvt);
> > 
> > Do we have to disable the clock if devm_add_action_or_reset() fails?
> > This is sort of a new Smatch check so I'm not entirely sure of the rules
> > mysql.
> 
> devm_add_action_or_reset calls the callback function (here:
> pvt_clk_disable) if there is an error, and the callback function
> releases the clock. This is a workaround for the missing
> devm_clk_prepare_enable(); you'll find it all over the kernel
> by now.

Ah right.  I have seen that before, yes.

regards,
dan carpenter

