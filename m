Return-Path: <SRS0=vN4T=EP=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07BB4C388F9
	for <linux-hwmon@archiver.kernel.org>; Mon,  9 Nov 2020 00:23:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7605320702
	for <linux-hwmon@archiver.kernel.org>; Mon,  9 Nov 2020 00:23:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=fnarfbargle.com header.i=@fnarfbargle.com header.b="WisbpO3e"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727949AbgKIAXA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 8 Nov 2020 19:23:00 -0500
Received: from ns3.fnarfbargle.com ([103.4.19.87]:54172 "EHLO
        ns3.fnarfbargle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727929AbgKIAXA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 8 Nov 2020 19:23:00 -0500
Received: from srv.home ([10.8.0.1] ident=heh8312)
        by ns3.fnarfbargle.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.84_2)
        (envelope-from <lists2009@fnarfbargle.com>)
        id 1kbuwL-0001vB-Ct; Mon, 09 Nov 2020 08:21:45 +0800
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fnarfbargle.com; s=mail;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject; bh=x3G562EBlCnLaIdICD3s/hGIZ0dw4pzF8OLEtFYzHWw=;
        b=WisbpO3esuWPCPETov1gE8gjVxfyTCWO4t2rKHZ7NaQ2aOvYX5x7DxzxVyOwQsBA+ZHo/pXjzK2s9iwk6uPZ+MigqbufO27dKFMZSCMf+QmGhwpg5JBEHW8p0Vn6IzU0lIlIHB3pHuGpSPleJuNeXWeBQaVsD4Zdm8deaw1E1Eg=;
Subject: Re: applesmc Battery charge limiter
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
References: <0831391e-e8d0-1398-d835-a14d7ac0a310@fnarfbargle.com>
 <9ea3b3e0-3133-d440-9bb7-f34009581882@roeck-us.net>
From:   Brad Campbell <lists2009@fnarfbargle.com>
Message-ID: <d2802eea-a5a7-dc99-2716-f561e1196d02@fnarfbargle.com>
Date:   Mon, 9 Nov 2020 11:21:44 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <9ea3b3e0-3133-d440-9bb7-f34009581882@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



On 9/11/20 3:35 am, Guenter Roeck wrote:
> On 10/25/20 11:43 PM, Brad Campbell wrote:
>> G'day all,
>>
>> As has been recently documented on loads of Mac forums, it turns out that some older Macbook hardware can set the SMC to stop charging at an arbitrary battery charge level.
>> On supported machines this is the BCLM SMC key. I've also found that on my MacbookPro 11,1 the BFCL key sets the threshold at which the SMC changes the charging led from orange to green (that doesn't seem to be documented anywhere).
>>
>> On my machine I set them to 4b & 4a respectively, and the battery stops charging at ~75% and the led goes green. I boot into OSX and use smcutil to set this, but it sticks until either a firmware update or SMC reset and hasn't caused an issues in Linux with suspend or hibernate for the month or so I've had it working.
>>
>> I've been considering adding this to the applesmc driver, but as it tends to take me inordinate amounts of time to do this stuff I thought I'd ask before I start :
>>
>> - Would it likely be accepted?
>> - Apple seems to set BFCL at ~5% less than BCLM. Would it be policy to do similarly arbitrary, or should the keys be exposed independently?
>>
>> I'm happy to do a bit of work and put some patches forward, but I'd rather gauge interest and get some direction before I start.
>>
> 
> How do you suggest to make those changes ? If it fits into some other subsystem
> (probably power, modeled as charger) it might be worth considering, but we
> really don't need any more non-standard code in this driver.
> 

It's a difficult one. As I started to look into it a bit closer I thought adding more specific code was limiting. For example, I have a daemon which handles automatic brightness control for the display & keyboard, but the code to read the light sensor in applesmc discards resolution on my machine, so I use the existing infrastructure to read arbitrary keys to read the sensor key directly and work with that.

The SMC is a bit of a Swiss army knife. There is already code in there to read arbitrary keys, so I added some code to write arbitrary keys.

My SMC has over 500 keys, and there are all sorts of bit to twiddle so limiting it to the battery care function seemed a bit short-sighted. I modeled it on smcutil for MacOS which just gives you read/write access to the available keys in the SMC and trusts you not to do something dumb.

Right now to find a key we have to iterate all the keys by number until we find the one we want, then reference it by number. So I have 2 patches I've been working on.
The first is a write handler for key_at_index_name which allows you to write a key name to it. As in
echo BCLM > key_at_index_name
That will then look up the key and set key_at_index to the correct number (which can also be read back).

Right now arbitrary reads are raw binary data (key_at_index_data). So I've a second patch that adds a new sysfs attribute (key_at_index_data_hex) which when read serializes the data as a continuous hex string :
root@sys:/sys/devices/platform/applesmc.768# echo ALV0 > key_at_index_name 
root@sys:/sys/devices/platform/applesmc.768# cat key_at_index_data_hex 
0101ffff502b03ffc000

You can then write serialized hex to the same key. Example. To set the Battery Care SMC value :
root@sys:/sys/devices/platform/applesmc.768# echo BCLM > key_at_index_name 
root@sys:/sys/devices/platform/applesmc.768# cat key_at_index
80
root@sys:/sys/devices/platform/applesmc.768# cat key_at_index_name 
BCLM
root@sys:/sys/devices/platform/applesmc.768# cat key_at_index_data_hex 
64
root@sys:/sys/devices/platform/applesmc.768# echo 5b > key_at_index_data_hex 
root@sys:/sys/devices/platform/applesmc.768# cat key_at_index_data_hex 
5b

So it's adding a bit of extra non-specific code that allows direct manipulation of the SMC on a per-key basis rather than trying to integrate keys into subsystems where they may or may not exist. The BFCL is a good example. One of the guys who writes the charge-limiter app for OSX said he'd had all sorts of issues integrating BFCL into the app as it turns out depending on the machine and SMC version it may or may not exist even if the BCLM key does.

I thought it'd be easier to supplement the already existing generic read infrastructure with an easier way to look up keys, and a write method and let userspace handle the rest rather than add more code that only addresses specific keys.

Thoughts?

Regards,
Brad
