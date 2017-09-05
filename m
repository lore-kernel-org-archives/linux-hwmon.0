Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from webclient5.webclient5.de ([136.243.32.179]:42814 "EHLO
        webclient5.webclient5.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750858AbdIEOMI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 5 Sep 2017 10:12:08 -0400
Subject: Re: [PATCH] hwmon: (k10temp) Add support for family 17h
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1504575935-19476-1-git-send-email-linux@roeck-us.net>
 <0565cf17-62d9-e319-8fe5-fbdf2d69335a@ladisch.de>
 <1e168fdb-862f-60f1-d119-918e00aac1f5@roeck-us.net>
From: Clemens Ladisch <clemens@ladisch.de>
Message-ID: <705bb285-c532-a52e-b350-bd2b44b67b81@ladisch.de>
Date: Tue, 5 Sep 2017 16:12:07 +0200
MIME-Version: 1.0
In-Reply-To: <1e168fdb-862f-60f1-d119-918e00aac1f5@roeck-us.net>
Content-Type: text/plain; charset=us-ascii
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Guenter Roeck wrote:
> On 09/04/2017 11:47 PM, Clemens Ladisch wrote:
>> Guenter Roeck wrote:
>>> Some of this is guesswork, but afaics it is working. No idea if there
>>> is a better way to determine the temperature offset.
>>
>> The reported value is not an absolute temperature on any CPU.
>>
>> As far as I know, the offset is not guaranteed to be fixed for any model,
>> i.e., it would be pointless to apply the offset observed on one specific
>> chip.
>
> What we should do then, as we did for coretemp, would be to collect the various
> temperature offsets (and temperature limits, for that matter) and apply per-CPU
> adjustments. Are the offsets documented somewhere ?

AMD says:
 "Tctl is the processor temperature control value, used by the platform to
  control cooling systems. Tctl is a non-physical temperature on an
  arbitrary scale measured in degrees. It does _not_ represent an actual
  physical temperature like die or case temperature. Instead, it specifies
  the processor temperature relative to the point at which the system must
  supply the maximum cooling for the processor's specified maximum case
  temperature and maximum thermal power dissipation."

(That point is defined as 70.)


Regards,
Clemens
