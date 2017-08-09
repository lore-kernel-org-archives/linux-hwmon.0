Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from vps-vb.mhejs.net ([37.28.154.113]:55903 "EHLO vps-vb.mhejs.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752001AbdHIJpQ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 9 Aug 2017 05:45:16 -0400
Subject: Re: [v3, 1/2] hwmon: (it87) Split out chip registers setting code on
 probe path
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <ee5698d3-73ae-a468-f800-8fbbc90da3e7@maciej.szmigiero.name>
 <20170809042737.GA21644@roeck-us.net>
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Message-ID: <10d1d311-df9f-30a5-603f-4fa5cbd53dcb@maciej.szmigiero.name>
Date: Wed, 9 Aug 2017 11:45:12 +0200
MIME-Version: 1.0
In-Reply-To: <20170809042737.GA21644@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 09.08.2017 06:27, Guenter Roeck wrote:
> On Wed, Aug 02, 2017 at 01:06:23AM +0200, Maciej S. Szmigiero wrote:
>> This commit splits out chip registers setting code on probe path to
>> separate functions so they can be reused for setting the device properly
>> again when system resumes from suspend.
>>
>> While we are at it let's also make clear that on IT8720 and IT8782 it's
>> the VCCH5V line that is (possibly) routed to in7.
>> This will make it consistent with a similar message that it printed on
>> IT8783.
>>
>> Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
> 
> I finally got to this and tried to apply it, but it fails spectacularly.
> Even patch fails to apply each and every chunk. No idea what is going on.
> How did you generate the patch, and what was your baseline ?

It was generated from
git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
(hwmon branch), but it looks like my MUA mangled it.

Will try to send again in a moment.
  
> Guenter

Maciej

>> ---
>> Changes from v1: Move code of common probe / resume steps to new functions
>> so we don't need to make large parts of probe function conditional on a
>> newly added 'resume' parameter.
>>
>> Changes from v2: Code move of common probe / resume steps to new functions
>> and actual resume functionality split into two, separate patches.
>>
>> Made a message about VCCH5V being routed to in7 consistent across all
>> chips.
>>
>>    drivers/hwmon/it87.c | 138 ++++++++++++++++++++++++++++++++-------------------
>>    1 file changed, 88 insertions(+), 50 deletions(-)
>>
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
