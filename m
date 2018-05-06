Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f178.google.com ([209.85.192.178]:33519 "EHLO
        mail-pf0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751814AbeEFUg6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 6 May 2018 16:36:58 -0400
Received: by mail-pf0-f178.google.com with SMTP id f20so12384821pfn.0
        for <linux-hwmon@vger.kernel.org>; Sun, 06 May 2018 13:36:58 -0700 (PDT)
From: Cengiz Can <cengizc@gmail.com>
Date: Sun, 6 May 2018 23:36:53 +0300 (+03)
To: linux-hwmon@vger.kernel.org
cc: Guenter Roeck <linux@roeck-us.net>,
        Nicolas Boichat <nicolas@boichat.ch>,
        Henrik Rydberg <rydberg@euromail.se>
Subject: hwmon: How should we represent Apple SMC's temperature sensors?
Message-ID: <alpine.LNX.2.21.99.1805062318450.8088@nostromo>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hello,

As Mr. Roeck knows, I've been refactoring applesmc into a MFD driver and 
cells for a while now.

Refactoring attempt is almost ready to be reviewed however there's a 
question that's keeping me from further progress.

As I read in hwmon api docs, most drivers are not constructing sysfs 
attributes by themselves. They're using helpers like SENSOR_DEVICE_ATTR 
and delegating sysfs management.

And as I read in `drivers/gpu/drm/nouveau/nouveau_hwmon.c` this API 
abstracts sysfs creation/permission tasks. (I assume that nouveau_hwmon is 
a properly implemented example).

However, as you know, applesmc is constructing its sysfs attributes 
manually. (`drivers/hwmon/applesmc.c#L1108`)

I don't have much context (and this is my first hwmon patch attempt) but I 
think this is due to the dynamic nature of 
Apple SMC temperature and fan control values. Not all Apple devices have 
same temperature values nor same number of fans. 

For those who don't know, `drivers/hwmon/applesmc.c` queries an LPC device 
during init and creates sysfs files according to the result that query.

What I would like to know is:  

  1) Should I try to implement a solution that's using SENSOR_DEVICE_ATTR  
or similar helpers to provide sysfs attributes in my refactored Apple SMC 
driver? Is there an example for that?

  2) Should I just keep the manual sysfs creator method?  
(`drivers/hwmon/applesmc.c#L1108`). Is this acceptable?

Thank you

	Cengiz Can


