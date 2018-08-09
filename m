Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35802 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726976AbeHIVN3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 9 Aug 2018 17:13:29 -0400
Received: by mail-pf1-f196.google.com with SMTP id p12-v6so3269953pfh.2
        for <linux-hwmon@vger.kernel.org>; Thu, 09 Aug 2018 11:47:22 -0700 (PDT)
Date: Thu, 9 Aug 2018 11:47:19 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Michael Larabel <Michael@phoronix.com>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (k10temp) 27C offset needed for Threadripper
 2920X / 2970WX
Message-ID: <20180809184719.GA7696@roeck-us.net>
References: <962bacd7-4369-0e36-ef55-ee3681baa27e@phoronix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <962bacd7-4369-0e36-ef55-ee3681baa27e@phoronix.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Michael,

On Thu, Aug 09, 2018 at 11:26:14AM -0500, Michael Larabel wrote:
> Guenter, list:
> 
> I was able to confirm that the AMD Threadripper 2920X and 2970WX also
> require a 27 degree Tctl offset.
> 

Thanks a lot for the update. I'll update (and simplify) the driver
and Cc: you on the patch.

Guenter
