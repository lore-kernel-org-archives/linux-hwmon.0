Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9920BC4708C
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 May 2021 20:41:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E37E61248
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 May 2021 20:41:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbhE1UnF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 28 May 2021 16:43:05 -0400
Received: from mout.gmx.net ([212.227.17.22]:51107 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229482AbhE1UnF (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 28 May 2021 16:43:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1622234473;
        bh=23VodmjfsYHDCsa+2USEh9ODiUyHk1/Yoce7Mus3HFE=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=GNQgnb7SvPXWBHWIIjMKVJMp7TG/DJLFt8G6gp2VggNZqmXQ1qOz7/n++o7gf+DVN
         Qd9WCUFVx5vEqL3vCrIR/hOUdUSq4DZTzLC/9v9BM5xoFJ0ujM6Ij5slcJsQnS71lS
         RtUt7twxzvqeFiA869OIwsn4wJ0VuRpZpdykQLv8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.2.140] ([79.242.180.99]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYNJq-1lrd5X2JsY-00VNGq; Fri, 28
 May 2021 22:41:13 +0200
Subject: Re: [PATCH v2 6/6] hwmon: (dell-smm-hwmon) Update docs
To:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
References: <20210528173716.10975-1-W_Armin@gmx.de>
 <20210528173716.10975-7-W_Armin@gmx.de>
 <20210528175310.53ey6xq5ttpfkod6@pali>
From:   Armin Wolf <W_Armin@gmx.de>
Message-ID: <758552b4-584f-bc52-b798-4d4bc3c6d72a@gmx.de>
Date:   Fri, 28 May 2021 22:41:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210528175310.53ey6xq5ttpfkod6@pali>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:CcvKBPMiXOBSktCliwuUSgaWozgWXE4ngaq038ACpihY7/dq70D
 VYG9/Vih5vjW5A/pvAHkNj2NBgqG20/57S/LV+F7TwoF37m7r2R5/pwH06K+KW9aOG74F15
 Qhi8ZSr+vksFmKjKHyiFmS+SBd8i63A/wIBYXhvA/FIciHgpvBZJSNr9tKLSMJYGY/5M/M0
 8VZ8vrH1Hn4sb3QF8njiQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RUVgiDmrqnM=:gjMrwt91RQDOO1ABrXlu95
 rhRy19/D+p+bT2pW1P1ZmEbvoFrlaN8atNyjXgMPBBAwmsETxRiukypJqUg6mZjW3I9O0U4QK
 LJfj+pdJrzuOUPRDnG81Xre9ZY6fevJPqCzQeSJd7vdok18RqD6bQhEw8qElo2dM/Gum9mqGF
 eMZI5UTjJIKkZQOeV3X+DuYE4H9xXFpWmh4C3KHy0XOtqIdQDw7QP2IhdzgUkLXK/Fn3M30+M
 8vUI4bo/+2+DR5lF7AOqUO9epDBih/MO/E1EGxbjJHcA9XNgNxbkJy9JvzVIsb/91N9aaDU0T
 qCw/qGS6VPvxKDLfvFmdHvZ7O0nKkcXnmTcomL3HYeQNk2bGdkYPQeEkjwM+Gmq+sFvP7ulGd
 X8ohfCIzrUEMl3IwIzdszMcPAUjfi7+zH9WL4t7d8YeJtKwAjLMXltZpnqBdMadD4OXoNCtPY
 yDoV1e6lpmBHDJa8QdfxzpLxcZbj3l1RMpFQhSog2aVlcctKUFh9ogkXx3E4knAlXacclj4u9
 3biV7UIR7Phx946HFFIGBqDEa06dtedxvH4OzUchZUJ22fP17h8dx72mxJS6qk2PeReQRhXu7
 j0im5J5ze5ojvCE2Ji/MaseKfwWZ4Zt4KFUR/67l/A3Kiap/YXmcQdtaQscerf5d+y6x5fi+m
 qGteRr+PjgkzbXqLhjWUWX274vHmyFcWRhylWXzj9ZyH/F89l/9ZhkYhlkHZCSxJ35sN3BaNG
 jQgg8nhlM17bCR8QacKWB0r54lljwVCJL3dQwNzSSyPhm2st37d4yjBZVhAjPziR/EeVauYOy
 4FLXLSrDE2seGXb3cK1l7Fsioldhg5t6c76DSAZgMTMWIt5JccljYVL6nIZLTfuT/4hBFY1Pj
 kZr9rpXRzwE+CII8RK9+s6dHYnLhvi3G3BT4XSlgWXmpGyRC73FD3rVwKP2w1miN0TA+6n7lf
 cln7f1nqxHcg5UZTRgeAlLoqAk7iX4KVoabPQtC2wauL8oT5Oe2IPncILCiachpB5TW/nsMm0
 aHRKGmNugTzchCqd2LfOhML+3u9QlgPHII2R+XPZ4Mm4ZizuAFghPpyp0AsMxJHu0juSRQuPA
 NEuAjWI5lsXG7X7N9MBkTKPNtWYHh6n3dbJOwSiR6QCS7GIc2MO/jzbRxJJXvfnEQjl3Mz7kP
 OkbPWefhkm1gcX2f8VCnIDHSCJsPDrMV5QApmBjAsHs7g4nn2N6SDW3wf5lrmb6/GyWYE=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 28.05.21 19:53 Pali Roh=C3=A1r wrote:

> On Friday 28 May 2021 19:37:16 W_Armin@gmx.de wrote:
>> From: Armin Wolf <W_Armin@gmx.de>
>>
>> pwm1_enable is now readable too.
> Hello! pwm1_enable cannot be readable. It is write-only node. See also:
> https://lore.kernel.org/linux-hwmon/201605221717.26604@pali/

Hello,

in Documentation/hwmon/sysfs-interface, pwmX_enable is marked as RW, and t=
he document also states that
"Read/write values may be read-only for some chips, depending on the hardw=
are implementation", so i
thought that pwm1_enable being WO is a violation of that rule.

Also i belive the i8kutils are not calling SMM anymore, so can we just lea=
ve a note saying something like
"this value is cached and is not correct when using certain userspace tool=
s which disable/enable BIOS fan control"?

>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   Documentation/hwmon/dell-smm-hwmon.rst | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/hwmon/dell-smm-hwmon.rst b/Documentation/hwm=
on/dell-smm-hwmon.rst
>> index 3bf77a5df995..d6fe9b8a2c40 100644
>> --- a/Documentation/hwmon/dell-smm-hwmon.rst
>> +++ b/Documentation/hwmon/dell-smm-hwmon.rst
>> @@ -35,7 +35,7 @@ Name				Perm	Description
>>   fan[1-3]_input                  RO      Fan speed in RPM.
>>   fan[1-3]_label                  RO      Fan label.
>>   pwm[1-3]                        RW      Control the fan PWM duty-cycl=
e.
>> -pwm1_enable                     WO      Enable or disable automatic BI=
OS fan
>> +pwm1_enable                     RW      Enable or disable automatic BI=
OS fan
>>                                           control (not supported on all=
 laptops,
>>                                           see below for details).
>>   temp[1-10]_input                RO      Temperature reading in milli-=
degrees
>> --
>> 2.20.1
>>

