Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:49572 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725726AbeLBHrd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 2 Dec 2018 02:47:33 -0500
Subject: Re: [PATCH 2/2] hwmon: Remove multiple space after dot
To: Joe Perches <joe@perches.com>,
        Corentin Labbe <clabbe@baylibre.com>, jdelvare@suse.com,
        linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1543522155-17406-1-git-send-email-clabbe@baylibre.com>
 <1543522155-17406-2-git-send-email-clabbe@baylibre.com>
 <188e822951d0b3a30cf4eea8ec0ea7b6d3bb4fca.camel@perches.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f1819f01-3de8-2e76-bfb9-950a98e0326c@infradead.org>
Date: Sat, 1 Dec 2018 12:34:07 -0800
MIME-Version: 1.0
In-Reply-To: <188e822951d0b3a30cf4eea8ec0ea7b6d3bb4fca.camel@perches.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 12/1/18 12:27 PM, Joe Perches wrote:
> On Thu, 2018-11-29 at 20:09 +0000, Corentin Labbe wrote:
>> This patch remove extra space after a dot.
> []
>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> ---
>>  drivers/hwmon/Kconfig | 236 +++++++++++++++++++++---------------------
>>  1 file changed, 118 insertions(+), 118 deletions(-)
> []
>> @@ -11,7 +11,7 @@ menuconfig HWMON
>>  	  of a system. Most modern motherboards include such a device. It
>>  	  can include temperature sensors, voltage sensors, fan speed
>>  	  sensors and various additional features such as the ability to
>> -	  control the speed of the fans.  If you want this support you
>> +	  control the speed of the fans. If you want this support you
>>  	  should say Y here and also to the specific driver(s) for your
>>  	  sensors chip(s) below.
> 
> Please no.

Ack.  No need for such a patch.


-- 
~Randy
