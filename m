Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6A51C43219
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 Apr 2022 15:08:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351915AbiDZPLq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 26 Apr 2022 11:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351933AbiDZPJz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 Apr 2022 11:09:55 -0400
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9186E15278C
        for <linux-hwmon@vger.kernel.org>; Tue, 26 Apr 2022 08:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1650985604;
  x=1682521604;
  h=date:to:cc:subject:message-id:references:mime-version:
   content-transfer-encoding:in-reply-to:from;
  bh=nHkfyfU+8IAS4isZKA7A6htR0IUvryn0lnglvP1Bx8k=;
  b=AwsTnYFIPknmab//XwzQ2cKDMKy80nR4xbJHYLqOvzVa8OfxFLAE7QCj
   EN0iL4qLmF1hfOum//IvoHarVYCA/Zc8H1t8IepD3wumU+rt+U83btqLx
   2Iwk6Hg45bFXoXiVhfx7ZNiuDMVbx3B5HzYFXbF0HpjE8qSOKEhUBlyyf
   wLYqr8hgwOQCUo+Ml0al0wT/fCEv69pf9sahkwbyu1Vcn0lpU9JV2aw8y
   1ey1+L4eLPgIntymx7NTd3GlUAumlASXO6+iVZhANvlkNvu/Wuka75ZcJ
   WwYryPuS/v5r1nikmhMt9ba29q9Ox6oR77H8esLByHdDPoizIFPFTmkyw
   Q==;
Date:   Tue, 26 Apr 2022 17:06:41 +0200
To:     Guenter Roeck <linux@roeck-us.net>
CC:     =?iso-8859-1?Q?M=E5rten?= Lindahl <Marten.Lindahl@axis.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        kernel <kernel@axis.com>
Subject: Re: [PATCH v2 1/2] hwmon: (pmbus/ltc2978) Use driver specific ops if
 they exist
Message-ID: <YmgKgYEPMlLRBnRG@axis.com>
References: <20220426092936.1127114-1-marten.lindahl@axis.com>
 <20220426092936.1127114-2-marten.lindahl@axis.com>
 <a7fa7c5f-578f-480d-a2c3-eecb38032202@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a7fa7c5f-578f-480d-a2c3-eecb38032202@roeck-us.net>
From:   Marten Lindahl <martenli@axis.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Apr 26, 2022 at 03:39:15PM +0200, Guenter Roeck wrote:
> On 4/26/22 02:29, Mårten Lindahl wrote:
> > Several of the manuals for devices supported by this driver describes
> > the need for a minimum wait time before the chip is ready to receive
> > next command.
> > 
> > This wait time is already implemented in the driver as a ltc_wait_ready
> > function with a driver defined wait time of 100 ms, and is considered
> > for specific devices before reading/writing data on the pmbus.
> > 
> > Since this driver uses the default pmbus_regulator_ops for the enable/
> > disable/is_enabled functions and these functions do not check for driver
> > specific read/write ops, the wait time recommendations are bypassed for
> > several of the devices managed by this driver (ltc3880/ltc3882/ltc3883/
> > ltc3884/ltc3886/ltc3887/ltc3889/ltm4664/ltm4675/ltm4676/ltm4677/ltm4678/
> > ltm4680/ltm4686/ltm4700/ltc7880).
> > 
> > Lets add support for driver specific callbacks in pmbus core which takes
> > the wait time into consideration for the specified devices.
> > 
> 
> This should be two patches: one patch to add the callback to the pmbus core
> and a second patch to use it from the ltc2978 driver.

Ok, I will do that. Thanks!
Kind regards
Mårten

> 
> Guenter
