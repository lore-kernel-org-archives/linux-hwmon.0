Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7593DC433EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Apr 2022 15:12:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242637AbiDYPPg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 25 Apr 2022 11:15:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232572AbiDYPPf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Apr 2022 11:15:35 -0400
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 549C385961
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Apr 2022 08:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1650899551;
  x=1682435551;
  h=date:to:cc:subject:message-id:references:mime-version:
   content-transfer-encoding:in-reply-to:from;
  bh=+yLLc67DZOFDPqzAzaJ4Dqjsv1ZlA7Xb5pnBcCNvFVs=;
  b=PcAOStLhBrkAgotk26O2BCzP2AWMJ6HdOqNSa+kZ1ZJ2pkRZhkKZaFyn
   Pp5/rps95IJarepJA0udqiIcDN/oPNIwn+HPeCrOZDcf1L3Nt+P7pot3X
   HZcHGhcaQmZFJXspnqvjByiD7T/3DWhbM56cj4dBKlGcMOzRQMMtpJtJT
   6s+c5GhyjXfI5f12Hu+aYMJP0tZUq14xBlGJon81hYpcmT+x1HcfiEKfq
   8sQAmC+a9c0SOtnvVAu8wfVVvTo3pvwpBRkNx8qs2MjgsE0gepwFmDRZW
   +WXe//Iy+jjFcnJzwFB97D2MMHsrRZZzEnABZuqoXb2BifkpHMjrzxuwx
   Q==;
Date:   Mon, 25 Apr 2022 17:12:28 +0200
To:     Guenter Roeck <linux@roeck-us.net>
CC:     =?iso-8859-1?Q?M=E5rten?= Lindahl <Marten.Lindahl@axis.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        kernel <kernel@axis.com>
Subject: Re: [PATCH 1/2] hwmon: (pmbus/ltc2978) Add driver specific regulator
 ops
Message-ID: <Yma6XCxeodboX25V@axis.com>
References: <20220406124321.1184133-1-marten.lindahl@axis.com>
 <20220406124321.1184133-2-marten.lindahl@axis.com>
 <20220424164910.GA747863@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220424164910.GA747863@roeck-us.net>
From:   Marten Lindahl <martenli@axis.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Apr 24, 2022 at 06:49:10PM +0200, Guenter Roeck wrote:
> On Wed, Apr 06, 2022 at 02:43:20PM +0200, Mårten Lindahl wrote:
> > Several of the manuals for devices supported by this driver describes
> > the need for a minimum wait time before the chip is ready to receive
> > next command.
> > 
> > This wait time is already implemented in the driver as a ltc_wait_ready
> > function with a driver defined wait time of 100 ms, and is considered
> > for specific devices before reading/writing data on the pmbus.
> > 
> > But this driver uses the default pmbus_regulator_ops for the enable/
> > disable/is_enabled functions. By using these functions it bypasses the
> > wait time recommendations for several of the devices managed by the
> > driver (ltc3880/ltc3882/ltc3883/ltc3884/ltc3886/ltc3887/ltc3889/ltm4664/
> > ltm4675/ltm4676/ltm4677/ltm4678/ltm4680/ltm4686/ltm4700/ltc7880).
> > 
> > Lets add driver specific regulator enable/disable/is_enabled ops which
> > takes the wait time into consideration for the specified devices, by
> > overriding pmbus_read_byte_data with internal ltc_read_byte_data.
> > 
> > Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>

Hi Guenter!
Thanks for your comments.
> 
> This patch solves the wrong problem. The real problem is that the
> regulator code in the PMBus core writes direcetly into the chip
> and doesn't use the driver functions to do it if needed, and that
> the PMBus core does not support a chip-specific write_byte_data function
> (because so far it wasn't needed). That needs to get fixed, and then
> we won't need chip specific regulator functions.

Good point. I will add support for driver callback functions in pmbus
core and remove the ltc2978 enable/disable/is_enabled functions.

Kind regards
Mårten
> 
> Thanks,
> Guenter
