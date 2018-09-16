Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:32768 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726939AbeIPGF0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 16 Sep 2018 02:05:26 -0400
Subject: Re: [PATCH] hwmon: scmi: Remove redundant pointer check
To: Nathan Chancellor <natechancellor@gmail.com>,
        Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>
References: <20180916000506.28905-1-natechancellor@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <568ec241-baf8-7ccd-c0e3-7724a5eb90ae@roeck-us.net>
Date: Sat, 15 Sep 2018 17:44:25 -0700
MIME-Version: 1.0
In-Reply-To: <20180916000506.28905-1-natechancellor@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 09/15/2018 05:05 PM, Nathan Chancellor wrote:
> Clang warns when the address of a pointer is used in a boolean context
> as it will always return true.
> 
> drivers/hwmon/scmi-hwmon.c:59:24: warning: address of array
> 'sensor->name' will always evaluate to 'true'
> [-Wpointer-bool-conversion]
>          if (sensor && sensor->name)
>                     ~~ ~~~~~~~~^~~~
> 1 warning generated.
> 
> Remove the check as it isn't doing anything currently; if validation
> of the contents of the data structure was intended by the original
> author (since this line has been present from the first version of
> this driver), it can be added in a follow-up patch.
> 
> Reported-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Applied to hwmon-next.

Thanks,
Guenter
