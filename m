Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44469 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727651AbeJZC4A (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 25 Oct 2018 22:56:00 -0400
Subject: Re: [PATCH v1] hwmon: Fix double-free in __hwmon_device_register()
To: linux@roeck-us.net
Cc: Jean Delvare <jdelvare@suse.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20181025001502.Horde.ohnOCUflLESPXB4_wIk6s0-@cp2.active-venture.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <531d2ac7-b081-8d6f-e331-711d16c8c73b@gmail.com>
Date: Thu, 25 Oct 2018 21:22:04 +0300
MIME-Version: 1.0
In-Reply-To: <20181025001502.Horde.ohnOCUflLESPXB4_wIk6s0-@cp2.active-venture.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 10/25/18 3:15 AM, linux@roeck-us.net wrote:
> 
> Quoting Dmitry Osipenko <digetx@gmail.com>:
> 
>> Fix double-free that happens when thermal zone setup fails, see KASAN log
>> below.
>>
> 
> Good catch. I'll apply this as soon as I manage to convince AT&T to restore
> my internet service.

Cool, thanks!
