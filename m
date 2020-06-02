Return-Path: <SRS0=V20P=7P=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A0C9C433E0
	for <linux-hwmon@archiver.kernel.org>; Tue,  2 Jun 2020 18:37:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 363952072F
	for <linux-hwmon@archiver.kernel.org>; Tue,  2 Jun 2020 18:37:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KHb66AHD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726728AbgFBShc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 2 Jun 2020 14:37:32 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:59970 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726373AbgFBShb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 2 Jun 2020 14:37:31 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 052IWqsK023682;
        Tue, 2 Jun 2020 18:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=ZJQlDe7bs8LytER1h7RkJ002AKdwvI2onGWHsVP+KyQ=;
 b=KHb66AHDLAkpAY8657bmG5r+A0PponENtzelCm50Vlhngm3djApXfkcnvMeIgeD476mu
 hosXA95/gWiUIbNWdEV+lp5y7bVnOJh0cNJhjuGjrOXpeSPsnrKB0JdIJbciZkb/Ncoa
 rzX8QP6yxLTE6VeBTL+6wLDb99BAHB7F++/Fz9ikAXWKmIXjWUuukfTytutmE5lo5mrt
 1ZSfED4c7+z2uaqsScXs3y0nS2R2vyYuxV8tOyyhif9vU/8qyJscxBWXeyl6dEZEDJlL
 FUNOVFxlLVK9XlS9X0CIMxwDJyBXtrgUjpHP8QuRgpDnboKMQ2A2fBZ8fGIp+R4/zFf8 +A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 31bfem5g9a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 02 Jun 2020 18:37:02 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 052IY06O120924;
        Tue, 2 Jun 2020 18:37:02 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 31dju1xm5c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 02 Jun 2020 18:37:02 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 052Iavfl006124;
        Tue, 2 Jun 2020 18:36:57 GMT
Received: from localhost (/67.169.218.210)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 02 Jun 2020 11:36:57 -0700
Date:   Tue, 2 Jun 2020 11:36:53 -0700
From:   "Darrick J. Wong" <darrick.wong@oracle.com>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        Joshua Scott <joshua.scott@alliedtelesis.co.nz>,
        Axel Lin <axel.lin@ingics.com>
Subject: Re: Questions about adt7470 driver
Message-ID: <20200602183653.GK2162697@magnolia>
References: <20200526112259.4356fb2f@endymion>
 <20200527224252.GB89212@roeck-us.net>
 <20200527233334.GL252930@magnolia>
 <20200528120256.63023d63@endymion>
 <4ddb3fb5-8461-8269-5fa1-ca8421342903@roeck-us.net>
 <20200529001858.GP252930@magnolia>
 <20200529154157.18a5e4b5@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529154157.18a5e4b5@endymion>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9640 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 phishscore=0 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006020134
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9640 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=1
 mlxlogscore=999 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015
 impostorscore=0 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006020134
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, May 29, 2020 at 03:41:57PM +0200, Jean Delvare wrote:
> On Thu, 28 May 2020 17:18:58 -0700, Darrick J. Wong wrote:
> > I vaguely remember that the adt7470 temperature inputs were connected to
> > the CPU, and the PWM outputs were connected to the CPU heatsink fans.
> > The BIOS appeared to set up the adt7470 for automatic thermal management
> > (i.e. when you cranked all four cores of the machine to maximum) it
> > would gradually raise the CPU fan speed, like you'd expect.
> > 
> > The reality (again, vaguely remembered) was that the chip wouldn't run
> > its pwm control loop unless *something* poked it to reread the
> > temperature sensors.  A different model of the same machine had a BMC
> > which would talk to the adt7470 over i2c and take care of that.
> 
> That I understand, and while it is poor design in my opinion, it makes
> sense to some degree.
> 
> > The other problem was that /some/ of the machines for whatever reason
> > would adjust the pwm value that you could read out over i2c, but
> > wouldn't actually change the fan speed unless you whacked the adt into
> > manual modem.
> 
> Ah. That would be the reason for the extra code. Automatic fan speed
> control that needs to be refreshed manually. Oh my.
> 
> > Neither of those two behaviors were listed in the datasheet, and we
> > (IBM) could never get an answer out of either Analog or our own hardware
> > group about whether or not this was the expected behavior.  I
> > disassembled the BMC code to figure out what the other model computer
> > was doing, and (clumsily) wrote that into the driver.  For all I know we
> > got a bad batch of adt7470s and all these weird gymnastics aren't
> > supposed to be necessary.
> > 
> > The next generation switched to a totally different chip and supplier,
> > so I surmise they weren't happy with the results either.  Those machines
> > tended to overheat if you were in Windows.
> > 
> > > > 4* Why are you calling msleep_interruptible() in
> > > > adt7470_read_temperatures() to wait for the temperature conversions? We
> > > > return -EAGAIN if that happens, but then ignore that error code, and we
> > > > log a cryptic error message. Do I understand correctly that the only
> > > > case where this should happen is when the user unloads the kernel
> > > > driver, in which case we do not care about having been interrupted? I
> > > > can't actually get the error message to be logged when rmmod'ing the
> > > > module so I don't know what it would take to trigger it.  
> > 
> > Urrk, what a doof who wrote that.  /me smacks 2009-era djwong. :P
> > 
> > kthread_stop blocks until the thread exits...
> 
> My experiments seem to confirm this.
> 
> > but strangely we don't
> > even try to interrupt the msleep_interruptible call.
> 
> How would we do that if we wanted to? Later you say this is not
> possible?

You /could/ theoretically send the kthread a signal to interrupt the
sleep, though I can't remember if kthreads are sufficiently special that
signals don't work...

> > That's fine,
> > though device removal will take longer than it needs to.
> 
> Yes, up to 2 seconds in my tests. Not pleasant, but also not
> necessarily something to worry about, as rmmod is usually not needed.

...but probably not necessary since nobody's complained about the 2s
yet.

> > We also don't
> > care about the return value of msleep_interruptible at all since one
> > cannot interrupt the kthread.
> > 
> > I probably picked interruptible sleep to avoid triggering the hangcheck
> > timer.
> 
> I don't understand that part. Is a 2 second uninteruptible sleep in a
> kthread considered bad somehow?

Not really, but the sysadmin can (probably ill-advisedly) set the
hangcheck timer to go off after 1 second.

> > > > 5* Is there any reason why the update thread is being started
> > > > unconditionally? As I understand it, it is only needed if at least one
> > > > PWM output is configured in automatic mode, which (I think) is not the
> > > > default. It is odd that the bug reporter hits a problem with the  
> > 
> > Yes, the driver should only start the kthread loop if someone wants
> > automatic temp control.
> 
> OK, I'll give it a try. I don't want to add too much complexity though.

<nod>

--D

> Thanks,
> -- 
> Jean Delvare
> SUSE L3 Support
