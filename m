Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:43167 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932571AbdKBTVL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 2 Nov 2017 15:21:11 -0400
Date: Thu, 2 Nov 2017 12:21:08 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Romain Porte <romain.porte@nokia.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pmbus: added possibility to change timeout for device
 update
Message-ID: <20171102192108.GA6049@roeck-us.net>
References: <20171102113116.14791-1-romain.porte@nokia.com>
 <6d1bc013-52ef-ffd6-52c7-5dac6c8d1e9c@roeck-us.net>
 <cf1535cf-7a76-6d4d-a23f-72077db821ac@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf1535cf-7a76-6d4d-a23f-72077db821ac@nokia.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Nov 02, 2017 at 05:17:21PM +0100, Romain Porte wrote:
> On 02/11/2017 14:58, Guenter Roeck wrote:
> >NACK, I'd rather drop the caching entirely, and possibly convert the
> >driver to
> >regmap for caching non-volatile registers.
> I need to familiarize myself with regmap then, it looks like a nice
> abstraction to have.
> 
> Do you think I can propose an intermediate patch for removing the cache
> support? (both time-based and data->valid based, so that every read actually
> performs a read, everytime)
> 

If you manage to do that, yes. That should limit reads to required reads,
not just drop ->valid and re-read every register for each attribute
access. Essentially, pmbus_update_device() should be completely gone.
That isn't easy to implement, which is why I never got to doing it.

Guenter
