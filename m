Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C4CBC433EF
	for <linux-hwmon@archiver.kernel.org>; Thu,  7 Oct 2021 17:59:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B29C60F3A
	for <linux-hwmon@archiver.kernel.org>; Thu,  7 Oct 2021 17:59:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242977AbhJGSBW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 7 Oct 2021 14:01:22 -0400
Received: from mout.gmx.net ([212.227.15.18]:47719 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242931AbhJGSBV (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 7 Oct 2021 14:01:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1633629553;
        bh=wDol4ObOAkDMeQ6juEd3abUazfgPBkET7ozJWGTLUxQ=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=bDPHL5OE3o1EzMfpQOG45kWbI8DU//HlgqliRKO9FXx0DbDoSO37TAGKJYTl44D4D
         fVwrscuKxzLsZKR8rtjRy5mUpHqmLSuYi1dhOroWky2g30jKyMOBl4ziD1rJycFHR3
         6/lr7KJ701KpkWlBtLKQKnT5EAEQScgWZYrzJBb4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.2.42] ([91.137.126.34]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mxm3Q-1mi5TL1dkc-00zBkM; Thu, 07
 Oct 2021 19:59:13 +0200
Subject: Re: i5k_amb temp_mid replacement
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <7aaa2734-514d-3752-01f1-fe3895718f55@gmx.de>
 <20211002140451.GA34532@roeck-us.net>
 <ce066c64-bf13-e6fa-278f-0dd6f2c2f45e@gmx.de>
 <def290d3-8c45-a44b-ebc7-166a77e8a2b9@roeck-us.net>
From:   Armin Wolf <W_Armin@gmx.de>
Message-ID: <9f5c769b-416c-c431-5145-2ce9c0bb69ef@gmx.de>
Date:   Thu, 7 Oct 2021 19:59:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <def290d3-8c45-a44b-ebc7-166a77e8a2b9@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:MtyA4s4eOy8oygRX34yCxR6lOdOd1BAJxNXglzvz+FML2nbFneV
 O1SB8HFeQhbRq3pfXSbuBitb3s+DPmdUcQFe2LLVY7RK4wgRWae83R2CsdE/fJCBh9K61US
 qp5/Llse2AbNhyhqCazA4HEaG6oLFPOPH09TUfOrDWlBdK71YhGpRHjO8O9NCzGwSbieagN
 pGjVGNk3Z3zqthn7s6C+w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:01kh0KX6v/s=:djcIDAnWOWf4N9rSR0Ykwu
 VhBSCMA1uuq5Z5kpTVBfmPoch5W4V03VycMPBflEi6zZ9bT5sfF4jln6TiuAv7n1mgf7GAQEJ
 OExoW84gw9Z0lnhzwSx4fMptPaLzH65bq7dvHnZlN6frmf7eSV7ehoYkjd8PmNNY0uTUrVN8P
 kmtvfVr3WMWSma/kyqegbEDsk/tLmRysR+Ocg91xFmmjOFOatA4pwKIKuPsVOjJ62lGBqc3B6
 c4Nhw7iBg2SPaoL2wikO0yt1EffD+nOFUKBfZdQh01+OW9w/HRYfPRpjSbDima6mwERvVvdkK
 LDkG+rYi6DZfAIelsLhRzVniiXRn/csQvcQiQEXQVZAc/n8psHV2K7pDAQdOXWxeSgv72bedk
 7NDcmvP5BEN1aoQ2PkFE1aRNZ+VuYXORwsLR9Kj99wpC0gWgSkMfGYDTbqSbPOETZPBVLp5VO
 Hn6y6g0rmWq9j+BUBIS41hOnw57yx7yJCSzI6Fc7G/UbUBv8EGRpW2PKxbV1Q1rwOVcUiQbn6
 18U8uUJQUxOgVTNefIYc0BOWvArsQ9H37vDoxKNP4Ey4PRj8VIUZWQp7l1vevA5T1BhbLjoso
 XshNiMdRM0YLJuyIo0htQIBBXxRsZgYRqCmNpomz4rEeXAR2dNESgN1Y3OVJeUKA54wErUWkW
 LbN5fdbyPzm6CAb9pcAs6RjrnotHGFFgBpaH3o08O+Cens/u1yeGZ0MRFdaAQsm5OnXGN1t+G
 NR3SNKSMw2ar8x1pA5l7GCG54NmrftoiiLqAwTlaVVC03Fz1JMjgZxkNCiaf3XjoUwdecBF73
 E95uu4ulMEKL7svaQqDPCQ/zG+Hi6yPxJezRzny8efh9Twan4A5qsvvPZRs0flaQGvN9PTogM
 gZD1ujaLbE+I4hcQCEXzMe4+i9+PgLtpYP5uvnWYpvxhu+N4VsLXIcIWHakls8UEyUSacU8OM
 Q5XX7umlRUxtFyVfvD4TBD+KVuifWjNatxvK2nPmwUdwYj7VJU6v8msECU25P9PUzOQUqHF4/
 K7i6ZoqN8D/lyjzT374oez5U/S2HdGiba/KLUcSfFrGqsc+U3IGZYQ5LZSGR4oJh+awRVFbjv
 AtTw4zBBL8u2s8=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Am 07.10.21 um 18:30 schrieb Guenter Roeck:
> On 10/7/21 7:20 AM, Armin Wolf wrote:
>> Am 02.10.21 um 16:04 schrieb Guenter Roeck:
>>> On Fri, Oct 01, 2021 at 12:13:53AM +0200, Armin Wolf wrote:
>>>> Hello,
>>>>
>>>> while trying to convert i5k_temp to the new hwmon API to resolve
>>>> https://bugzilla.kernel.org/show_bug.cgi?id=208693,
>>>> i was asking myself whether or not temp_mid could be replaced with a
>>>> standard sysfs attribute?
>>>> Since afaik temp_mid and temp_max are both temperature limits, they
>>>> could potentially be replaced with
>>>> temp_max and temp_crit.
>>>>
>>> Quite likely. Unfortunately, the chipset documentation is not available
>>> to the public, so it is difficult to determine what those temperatures
>>> actually mean.
>>>
>>> Guenter
>> Darrick Wong says the chipset documentation would support such a change.
>> However, he fears that the changed meaning of tempX_max could confuse
>> userspace
>> programs.
>> But i think the current not using standard attribute names will confuse
>> even more
>> programms.
>
> I still don't know what temperature limits temp_mid and temp_max actually
> reflect, so I still can not really comment.
>
> Guenter
"Intel 6400/6402 Advanced Memory Buffer" seems to document that.
