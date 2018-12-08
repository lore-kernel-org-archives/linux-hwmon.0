Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39547 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbeLHQxA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 8 Dec 2018 11:53:00 -0500
Received: by mail-pl1-f194.google.com with SMTP id 101so3243917pld.6
        for <linux-hwmon@vger.kernel.org>; Sat, 08 Dec 2018 08:53:00 -0800 (PST)
Subject: Re: [PATCH] dell-smm-hwmon.c: Additional temperature sensors
To: Michele Sorcinelli <michelesr@autistici.org>,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20181207202927.14168-1-michelesr@autistici.org>
 <20181208005603.11721-1-michelesr@autistici.org>
 <3f1b847e-2b70-70bb-f5e6-5f68ffbc63ed@roeck-us.net>
 <cabfdc6d-069d-0b75-cafb-1a108178d4a0@autistici.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <cb2acbb1-b506-11c4-9fbc-e9d2ff685b4f@roeck-us.net>
Date: Sat, 8 Dec 2018 08:52:56 -0800
MIME-Version: 1.0
In-Reply-To: <cabfdc6d-069d-0b75-cafb-1a108178d4a0@autistici.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 12/8/18 7:34 AM, Michele Sorcinelli wrote:
>> Please _always_ version your patches, and add a changelog, at least if you
>> would like to see it applied. I have now two patches which look almost the same,
>> meaning I would have to pull both versions, compare, and hope to apply the
>> correct one.
> 
> The only change is in i8k_is_visible():

Please consider reading Documentation/process/submitting-patches.rst,
chapter 2). For simplicity, I am copying the relevant paragraph here.

"
When you submit or resubmit a patch or patch series, include the
complete patch description and justification for it.  Don't just
say that this is version N of the patch (series).  Don't expect the
subsystem maintainer to refer back to earlier patch versions or referenced
URLs to find the patch description and put that into the patch.
I.e., the patch (series) and its description should be self-contained.
This benefits both the maintainers and reviewers.  Some reviewers
probably didn't even receive earlier versions of the patch.
"

Thanks,
Guenter
