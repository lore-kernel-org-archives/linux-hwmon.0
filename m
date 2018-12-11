Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f181.google.com ([209.85.215.181]:37744 "EHLO
        mail-pg1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726134AbeLKVNW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Dec 2018 16:13:22 -0500
Received: by mail-pg1-f181.google.com with SMTP id 80so7229508pge.4
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Dec 2018 13:13:20 -0800 (PST)
Date: Tue, 11 Dec 2018 13:13:18 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Ranran <ranshalit@gmail.com>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: How to detect which device is mapped to hwmonX ?
Message-ID: <20181211211318.GA3004@roeck-us.net>
References: <CAJ2oMhJgfNZbfsnnyUdRQLUdt9xiE4++_C7R8a_sFsyy7PxWPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ2oMhJgfNZbfsnnyUdRQLUdt9xiE4++_C7R8a_sFsyy7PxWPg@mail.gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Dec 11, 2018 at 10:30:58PM +0200, Ranran wrote:
> Hello,
> 
> I have several nodes /sys/class/hwmon/hwmonX ,
> but checking the fields I could not find yet a way how to identify a
> device (for example i2c address) to the given mapping of hwmonX.
> 
> Is there a way to find out which device is mapped to which hwmonX ?
> 

Maybe libsensors would work for you ?

Guenter
