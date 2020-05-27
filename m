Return-Path: <SRS0=H3vz=7J=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 159C1C433DF
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 May 2020 23:34:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DFC5F208C3
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 May 2020 23:34:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="J7pRwXPA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725920AbgE0XeI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 May 2020 19:34:08 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:32926 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbgE0XeI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 May 2020 19:34:08 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04RNS0DA157240;
        Wed, 27 May 2020 23:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=L95rqYfIW9W2JlM5ZpgAQS0NEw1yJNA1pKhT3sB//MI=;
 b=J7pRwXPAk13yzO7KTP2wMs5SE+6oFIzlsGEy5/EFsgVzyOZnzJWgd1lE6tbF60yYNvln
 JE1pXj+i3hem9cZ2frxxp83z/feipAK0Nq2jua23mIPIxKqfpFncW0LHhQKIICQOT7Ag
 /noHC6Pvv8npRy6IXLP/BtQUUsB61711BUZ0S28KiTf1v+2OKEHrkaj70uoM3C9L1Ljf
 1/e0J/fvmS6uS4Acgw1wdvCX4hgFlLY1xt3jHdIW3UCfAz07Wib33e+gkPzRmILyNkyA
 mXrX+Rpfq7l49Dhu/BVhEniUeNfJCy5nXNTkREI7RW6ofvydZSa/VV4isYGmNuzwknGv ww== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 318xbk27gt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 27 May 2020 23:33:40 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04RNRr0h111023;
        Wed, 27 May 2020 23:33:39 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 317dkvbp5c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 27 May 2020 23:33:39 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 04RNXaCa011647;
        Wed, 27 May 2020 23:33:36 GMT
Received: from localhost (/67.169.218.210)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 27 May 2020 16:33:36 -0700
Date:   Wed, 27 May 2020 16:33:34 -0700
From:   "Darrick J. Wong" <darrick.wong@oracle.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.de>, linux-hwmon@vger.kernel.org,
        Joshua Scott <joshua.scott@alliedtelesis.co.nz>,
        Axel Lin <axel.lin@ingics.com>
Subject: Re: Questions about adt7470 driver
Message-ID: <20200527233334.GL252930@magnolia>
References: <20200526112259.4356fb2f@endymion>
 <20200527224252.GB89212@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527224252.GB89212@roeck-us.net>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9634 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0 bulkscore=0
 spamscore=0 suspectscore=1 mlxscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005270173
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9634 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 cotscore=-2147483648
 suspectscore=1 bulkscore=0 clxscore=1011 impostorscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2005270173
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, May 27, 2020 at 03:42:52PM -0700, Guenter Roeck wrote:
> On Tue, May 26, 2020 at 11:22:59AM +0200, Jean Delvare wrote:
> > Hi all,
> > 
> > In the context of bug #207771, I got to look into the adt7470 driver.
> > I'm slowing understanding the logic of the background temperature
> > registers update thread, still there are 2 things I do not understand:
> > 
> > 1* Function adt7470_read_temperatures() sets data->num_temp_sensors,
> > however this value seems to be only used to limit the wait time of
> > future calls to the same function. In the general update function we
> > still read ALL temperature sensors regardless of its value:
> > 
> > 		for (i = 0; i < ADT7470_TEMP_COUNT; i++)
> > 			data->temp[i] = i2c_smbus_read_byte_data(client,
> > 						ADT7470_TEMP_REG(i));
> > 
> > Shouldn't this loop be bounded with data->num_temp_sensors instead of
> > ADT7470_TEMP_COUNT?
> > 
> Guess so.
> 
> > 2* Function adt7470_read_temperatures() also sets
> > data->temperatures_probed to 1, and this boolean is then used to skip
> > further calls to that function. But do we really need a separate
> > variable for this, given that num_temp_sensors >= 0 matches the same
> > condition as far as I can see?
> > 
> Agreed. On the other side, those are optimizations. I am not really sure
> if that driver is worth spending time on, given the age of the chip.

I /think/ the answer to both questions is yes, but I don't have the
hardware anymore so I have no way to QA that... :/

--D

> Guenter
