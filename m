Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-ot0-f196.google.com ([74.125.82.196]:38151 "EHLO
        mail-ot0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752998AbeA0QHh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 27 Jan 2018 11:07:37 -0500
Subject: Re: i8k_smm_func() takes enormous of time to execute
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>,
        Jean Delvare <jdelvare@suse.de>
Cc: Oleksandr Natalenko <oleksandr@natalenko.name>,
        Jonathan Buzzard <jonathan@buzzard.org.uk>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mario Limonciello <mario.limonciello@dell.com>
References: <12093169.Rm9IG5ILEB@natalenko.name>
 <2197616.V8s6m9LJcd@natalenko.name> <20171124112543.3css4fwwmbiu36bm@pali>
 <2978620.NBCOB6I8fo@natalenko.name> <20171204103507.gymmjw46lzggzndo@pali>
 <0cfe104c062adcd7cc35e0b94c5bfba1@natalenko.name>
 <20171204121829.m6zk3imp47ru2od2@pali> <20180127140928.ndukidmhklsm5fpf@pali>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <ff7c2143-e081-b1b5-9956-c3ec1e3c937d@roeck-us.net>
Date: Sat, 27 Jan 2018 08:07:33 -0800
MIME-Version: 1.0
In-Reply-To: <20180127140928.ndukidmhklsm5fpf@pali>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 01/27/2018 06:09 AM, Pali Rohár wrote:
> On Monday 04 December 2017 13:18:29 Pali Rohár wrote:
>>>> Your last patch in bugzilla looks ok, you add my Reviewed-by: Pali
>>>> Rohár <pali.rohar@gmail.com>
>>>
>>> Could you please advice on how to proceed further? I can submit all 3
>>> patches (incl. yours two), to a ML.
>>
>> Now it is up to hwmon maintainers (Jean Delvare & Guenter Roeck) to pick
>> up these patches. I think nothing more is needed from your side. (And if
>> yes, Jean would write.)
>>
> 
> Jean Delvare & Guenter Roeck: PING
> 
> Can you process patches from that bugzilla ticket?
> https://bugzilla.kernel.org/show_bug.cgi?id=195751
> 
No. You should know better. Please follow the established process for
submitting patches into the upstream kernel.

Guenter
