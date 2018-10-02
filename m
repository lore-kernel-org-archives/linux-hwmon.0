Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:21070 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727204AbeJBPtL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 2 Oct 2018 11:49:11 -0400
Subject: Re: [PATCH] hwmon: Fix the 'No sensors found' error after replacing
 the parameter NULL by the actual device
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-hwmon@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        =?UTF-8?B?RHVuZ++8muS6ug==?= =?UTF-8?B?44K9?=
        <nv-dung@jinso.co.jp>, Hoan Nguyen An <na-hoan@jinso.co.jp>,
        cv-dong@jinso.co.jp
References: <1538469324-8028-1-git-send-email-cv-dong@jinso.co.jp>
 <CAMuHMdXOQdJL14xNj3AHL6RC-fu=SWReXmh1JOS4s9cc-ZL5iQ@mail.gmail.com>
From: Cao Van Dong <cv-dong@jinso.co.jp>
Message-ID: <4ed65427-ce94-5586-82ef-f73d7ff413ed@jinso.co.jp>
Date: Tue, 2 Oct 2018 18:06:13 +0900
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXOQdJL14xNj3AHL6RC-fu=SWReXmh1JOS4s9cc-ZL5iQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Dear Geert-san,

Thanks for your comment!

>> In __hwmon_device_register() function of hwmon.c, we have assigned 'dev' directly to 'hdev->parent'.
>> Formerly, when registering the hwmon device, we pass NULL as the device. This is not affected.
>> Recently, the developer has replaced the parameter NULL as the device by the actual device.
> Do you know the commit ID of this recent change?
> It's useful for review of your change, and to know to which versions your
> patch should be backported.

The commit ID of this recent change is"f6b6b52 thermal_hwmon: Pass the originating device down to 
hwmon_device_register_with_info".

>> This causes the "No sensors found" error. This patch is to fix this error.
> On which platform do you see this failure?
> Thanks again!

This error is found on Gen2 Lager board v4.19-rc2 by RVC team.


Best regards,
Dong/Jinso
