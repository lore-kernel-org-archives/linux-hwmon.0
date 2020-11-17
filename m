Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 617FBC64E75
	for <linux-hwmon@archiver.kernel.org>; Tue, 17 Nov 2020 14:04:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 19F1F20729
	for <linux-hwmon@archiver.kernel.org>; Tue, 17 Nov 2020 14:04:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Umb9pxQM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729950AbgKQODn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 17 Nov 2020 09:03:43 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:39438 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729738AbgKQODm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 Nov 2020 09:03:42 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AHDxbeX029566;
        Tue, 17 Nov 2020 14:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=kitl5mLhJmkYXqyVlDCtBJVc+yrO76KhbHJjBLhRZEM=;
 b=Umb9pxQMNriJxFvLdSY27pS1IYFJsNFz7eBFuOZ64ElGNPQnKoHO89km2xhOTuw71Bnl
 53bD9oeqFvf6dY2H/cFZIMo7hcVnIpuQVekKG6ADBP1lWbXEeQvS4NfL3RU/pa1QU9GE
 z3j2IehgGo7wAI816WXzWi6nfznYIW3IYj6mg7x5Mfg9pZDpGQ+1UjVS7Av89ipmiZog
 wuITOJOutewTEZ0m8YMMhyps20meZGRY0+2LhB0ImvaD5rNRopGkIBFFmgpa3UH/O3p8
 /j2/MvgrgXleXgMycv3MDdjgJKrNK7jxuWU84iSrYL9VR5pGuev8KhzJz7+feeMf2ANn 3w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 34t7vn2hth-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 17 Nov 2020 14:03:09 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AHE1HVq050707;
        Tue, 17 Nov 2020 14:03:09 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 34umcy799g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 17 Nov 2020 14:03:08 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0AHE36cf015452;
        Tue, 17 Nov 2020 14:03:06 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 17 Nov 2020 06:03:05 -0800
Date:   Tue, 17 Nov 2020 17:02:59 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Brad Campbell <brad@fnarfbargle.com>
Cc:     Henrik Rydberg <rydberg@bitmath.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] hwmon: (applesmc) Fix smc_sane() function
Message-ID: <20201117140259.GG18329@kadam>
References: <20201117072401.GE1111239@mwanda>
 <5000a18a-1aa1-e9b0-c51a-80f65654c65b@fnarfbargle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5000a18a-1aa1-e9b0-c51a-80f65654c65b@fnarfbargle.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9807 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 phishscore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011170104
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9807 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011170104
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Nov 17, 2020 at 08:58:47PM +1100, Brad Campbell wrote:
> On 17/11/20 6:24 pm, Dan Carpenter wrote:
> > This test is reversed so the function will return without sending
> > the APPLESMC_READ_CMD or completing the rest of the function.
> 
> That is as designed. The routine looks at the busy line and if it's
> already in the right state then it simply ends. If not then it tries
> to "re-align" the state machine by sending a new command.

Ah.  Ok.  It looked like a typo.  These "if (!ret) return ret;" typos
are surprisingly common so I review them every time they are added.
It's a static analysis warning, that I haven't published.  I kind of
feel like it would be more clearly intentional if it were written like
so:

	ret = wait_status(0, SMC_STATUS_BUSY);
	if (!ret)
		return 0;

But I try not to get too bogged down with style so let's leave it.

regards,
dan carpenter

