Return-Path: <SRS0=nzsd=7L=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98469C433DF
	for <linux-hwmon@archiver.kernel.org>; Fri, 29 May 2020 00:21:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A23A214F1
	for <linux-hwmon@archiver.kernel.org>; Fri, 29 May 2020 00:21:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HIelXGJB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437625AbgE2AVe (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 28 May 2020 20:21:34 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:53312 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437985AbgE2AVc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 28 May 2020 20:21:32 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04T0IDrF046641;
        Fri, 29 May 2020 00:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=pCE8ivZIhHylNlz1rjweXE7jgc2GofKZRA/P+bkSSnI=;
 b=HIelXGJB6cNKxMlEjWqxxy1sP01/SoL20HC/8a8mH2lC3WDxDnVZxYcMIHnw6iKUZ2+C
 tPc8yzzNRWS8ke0jzfZH0iomDlx6Ch/08tGjGEmDyH9vyvR0aG/cBq2IR/fk2waP1GCY
 7B1mErtsRVT3Irw5M26YpqoJPb11zQNv3mRLGrxckSZ0ntugfKrLcM9s8GA9dVSpojbH
 uIXcijIMwPxS5zpS5eY/fzZK6ISVzjEkoLOq+N/Wd46axlHWMg5IxG3gN4F2cYXvSeZl
 kibuf/K2fnCTeefiZKNGZ4Iqacp8DUxhuMBQe9WCSm/5ASOUJY9JClEWoulMgFZQjchN iw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 318xe1qt3h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 29 May 2020 00:21:04 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04T0HhiA073354;
        Fri, 29 May 2020 00:19:04 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 31a9ktd2m6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 29 May 2020 00:19:03 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 04T0IxmW027401;
        Fri, 29 May 2020 00:18:59 GMT
Received: from localhost (/10.159.250.122)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 28 May 2020 17:18:59 -0700
Date:   Thu, 28 May 2020 17:18:58 -0700
From:   "Darrick J. Wong" <darrick.wong@oracle.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.de>, linux-hwmon@vger.kernel.org,
        Joshua Scott <joshua.scott@alliedtelesis.co.nz>,
        Axel Lin <axel.lin@ingics.com>
Subject: Re: Questions about adt7470 driver
Message-ID: <20200529001858.GP252930@magnolia>
References: <20200526112259.4356fb2f@endymion>
 <20200527224252.GB89212@roeck-us.net>
 <20200527233334.GL252930@magnolia>
 <20200528120256.63023d63@endymion>
 <4ddb3fb5-8461-8269-5fa1-ca8421342903@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ddb3fb5-8461-8269-5fa1-ca8421342903@roeck-us.net>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9635 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 mlxscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005290000
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9635 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 adultscore=0 cotscore=-2147483648 mlxscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=1 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005290000
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, May 28, 2020 at 06:52:37AM -0700, Guenter Roeck wrote:
> On 5/28/20 3:02 AM, Jean Delvare wrote:
> > On Wed, 27 May 2020 16:33:34 -0700, Darrick J. Wong wrote:
> >> On Wed, May 27, 2020 at 03:42:52PM -0700, Guenter Roeck wrote:
> >>> On Tue, May 26, 2020 at 11:22:59AM +0200, Jean Delvare wrote:  
> >>>> Hi all,
> >>>>
> >>>> In the context of bug #207771, I got to look into the adt7470 driver.
> >>>> I'm slowing understanding the logic of the background temperature
> >>>> registers update thread, still there are 2 things I do not understand:
> >>>>
> >>>> 1* Function adt7470_read_temperatures() sets data->num_temp_sensors,
> >>>> however this value seems to be only used to limit the wait time of
> >>>> future calls to the same function. In the general update function we
> >>>> still read ALL temperature sensors regardless of its value:
> >>>>
> >>>> 		for (i = 0; i < ADT7470_TEMP_COUNT; i++)
> >>>> 			data->temp[i] = i2c_smbus_read_byte_data(client,
> >>>> 						ADT7470_TEMP_REG(i));
> >>>>
> >>>> Shouldn't this loop be bounded with data->num_temp_sensors instead of
> >>>> ADT7470_TEMP_COUNT?
> >>>>   
> >>> Guess so.
> >>>   
> >>>> 2* Function adt7470_read_temperatures() also sets
> >>>> data->temperatures_probed to 1, and this boolean is then used to skip
> >>>> further calls to that function. But do we really need a separate
> >>>> variable for this, given that num_temp_sensors >= 0 matches the same
> >>>> condition as far as I can see?
> >>>
> >>> Agreed. On the other side, those are optimizations. I am not really sure
> >>> if that driver is worth spending time on, given the age of the chip.
> > 
> > Well it's still in use and apparently at least one user cares enough to
> > report a bug and propose a candidate fix.
> > 
> ... but at the same time that user doesn't have any temperature sensors
> installed and won't be able to test any changes.
> 
> >> I /think/ the answer to both questions is yes, but I don't have the
> >> hardware anymore so I have no way to QA that... :/
> > 
> > Thanks for both of you for your answers.
> > 
> > Darrick, I have 3 more questions for you if you remember...
> > 
> > 3* I understand that the temperatures need to be read periodically in
> > order for automatic fan speed control to work. What I do not understand
> > is why you bother switching PWM outputs to manual mode each time? What
> > bad would happen if we did not do that? I see nothing in the datasheet
> > justifying it.

I don't recall the specifics very well, sorry in advance. :/

I vaguely remember that the adt7470 temperature inputs were connected to
the CPU, and the PWM outputs were connected to the CPU heatsink fans.
The BIOS appeared to set up the adt7470 for automatic thermal management
(i.e. when you cranked all four cores of the machine to maximum) it
would gradually raise the CPU fan speed, like you'd expect.

The reality (again, vaguely remembered) was that the chip wouldn't run
its pwm control loop unless *something* poked it to reread the
temperature sensors.  A different model of the same machine had a BMC
which would talk to the adt7470 over i2c and take care of that.

The other problem was that /some/ of the machines for whatever reason
would adjust the pwm value that you could read out over i2c, but
wouldn't actually change the fan speed unless you whacked the adt into
manual modem.

Neither of those two behaviors were listed in the datasheet, and we
(IBM) could never get an answer out of either Analog or our own hardware
group about whether or not this was the expected behavior.  I
disassembled the BMC code to figure out what the other model computer
was doing, and (clumsily) wrote that into the driver.  For all I know we
got a bad batch of adt7470s and all these weird gymnastics aren't
supposed to be necessary.

The next generation switched to a totally different chip and supplier,
so I surmise they weren't happy with the results either.  Those machines
tended to overheat if you were in Windows.

> > 4* Why are you calling msleep_interruptible() in
> > adt7470_read_temperatures() to wait for the temperature conversions? We
> > return -EAGAIN if that happens, but then ignore that error code, and we
> > log a cryptic error message. Do I understand correctly that the only
> > case where this should happen is when the user unloads the kernel
> > driver, in which case we do not care about having been interrupted? I
> > can't actually get the error message to be logged when rmmod'ing the
> > module so I don't know what it would take to trigger it.

Urrk, what a doof who wrote that.  /me smacks 2009-era djwong. :P

kthread_stop blocks until the thread exits... but strangely we don't
even try to interrupt the msleep_interruptible call.  That's fine,
though device removal will take longer than it needs to.  We also don't
care about the return value of msleep_interruptible at all since one
cannot interrupt the kthread.

I probably picked interruptible sleep to avoid triggering the hangcheck
timer.

> Not sure if rmmod generates a signal. In theory you could possibly
> keep writing -1 into the num_temp_sensors attribute, execute the
> sensors command (or just read a temperature), and interrupt the
> sequence.
> 
> > 5* Is there any reason why the update thread is being started
> > unconditionally? As I understand it, it is only needed if at least one
> > PWM output is configured in automatic mode, which (I think) is not the
> > default. It is odd that the bug reporter hits a problem with the

Yes, the driver should only start the kthread loop if someone wants
automatic temp control.

> > polling thread when they are not using automatic fan speed control in
> > the first place so they do not need the polling thread to run. I was
> > wondering if it would be possible to start and stop the polling thread
> > depending on whether automatic PWM is enabled or not.
> >
> 
> 
> The datasheet says nothing about the need to run such a thread for
> automatic mode either. As I understand it, the chip is supposed to
> repeat temperature measurements automatically once configuration
> register 1 bit 7 is set. Of course that is difficult if not
> impossible to confirm without access to the chip.

IIRC my experiences with that chip were that the one I was using didn't
conform to the datasheet, i.e. the automatic temp management bit /was/
set by the BIOS, but the chip didn't do adjust the pwm control until
something came along and poked the adt7470 to re-query the temperature
sensors.  Unfortunately it was being used to control the CPU fan on a
socket 771 Xeon, which meant that we really /did/ need it to cycle up
the fans when the CPU went to full load.

Needless to say I don't have that Xeon 5080 system anymore. :/

--D

> Guenter
