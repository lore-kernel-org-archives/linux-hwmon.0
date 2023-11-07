Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEB27C4332F
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Nov 2023 18:05:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235312AbjKGSF2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Nov 2023 13:05:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232233AbjKGSFZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Nov 2023 13:05:25 -0500
Received: from 10.mo561.mail-out.ovh.net (10.mo561.mail-out.ovh.net [87.98.165.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E40DB0
        for <linux-hwmon@vger.kernel.org>; Tue,  7 Nov 2023 10:05:23 -0800 (PST)
Received: from director3.ghost.mail-out.ovh.net (unknown [10.109.156.242])
        by mo561.mail-out.ovh.net (Postfix) with ESMTP id BDAE028430
        for <linux-hwmon@vger.kernel.org>; Tue,  7 Nov 2023 17:26:12 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-xkfc9 (unknown [10.109.138.121])
        by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 6B5531FDBB;
        Tue,  7 Nov 2023 17:26:11 +0000 (UTC)
Received: from RCM-web9.webmail.mail.ovh.net ([151.80.29.21])
        by ghost-submission-6684bf9d7b-xkfc9 with ESMTPSA
        id HPouDjNzSmXyXQEAGls1mg
        (envelope-from <jose.pekkarinen@foxhound.fi>); Tue, 07 Nov 2023 17:26:11 +0000
MIME-Version: 1.0
Date:   Tue, 07 Nov 2023 19:26:10 +0200
From:   =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     evan.quan@amd.com, alexander.deucher@amd.com,
        christian.koenig@amd.com, Xinhui.Pan@amd.com,
        skhan@linuxfoundation.org, airlied@gmail.com, daniel@ffwll.ch,
        jdelvare@suse.com, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] drm/amd/pm: clean up redundant comparisons with 0
In-Reply-To: <98e8490e-6608-47a8-890c-f1fe894dac7f@roeck-us.net>
References: <20231107082910.92508-1-jose.pekkarinen@foxhound.fi>
 <98e8490e-6608-47a8-890c-f1fe894dac7f@roeck-us.net>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <65d132b0dbef66039fd6938ecbc2bf68@foxhound.fi>
X-Sender: jose.pekkarinen@foxhound.fi
Organization: Foxhound Ltd.
X-Originating-IP: 185.220.102.4
X-Webmail-UserID: jose.pekkarinen@foxhound.fi
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8301260013758293697
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddujedgtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeggfffhvfevufgjfhgfkfigohhitgfgsehtkehjtddtreejnecuhfhrohhmpeflohhsrocurfgvkhhkrghrihhnvghnuceojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqnecuggftrfgrthhtvghrnhepkefhgeduudefgedvleegtddvffeghedvtdekveekjeevvdegiedtfeelhedtiedtnecukfhppeduvdejrddtrddtrddupddukeehrddvvddtrddutddvrdegpdduhedurdektddrvdelrddvudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhhfihmohhnsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehiedupdhmohguvgepshhmthhpohhuth
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2023-11-07 16:08, Guenter Roeck wrote:
> On 11/7/23 00:29, José Pekkarinen wrote:
>> There is a couple of function return checks of functions that return
>> unsigned values, and local variables to hold them are also unsigned, 
>> so
>> checking if they are negative will always return false. This patch 
>> will
>> remove them, as well as the never reached code.
>> 
>> drivers/gpu/drm/amd/pm/amdgpu_pm.c:2801:5-8: WARNING: Unsigned 
>> expression compared with zero: val < 0
>> drivers/gpu/drm/amd/pm/amdgpu_pm.c:2814:5-8: WARNING: Unsigned 
>> expression compared with zero: val < 0
>> 
>> Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
>> ---
>>   drivers/gpu/drm/amd/pm/amdgpu_pm.c | 4 ----
>>   1 file changed, 4 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c 
>> b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
>> index 8bb2da13826f..e7bb1d324084 100644
>> --- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
>> +++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
>> @@ -2798,8 +2798,6 @@ static ssize_t 
>> amdgpu_hwmon_show_power_avg(struct device *dev,
>>   	unsigned int val;
>>     	val = amdgpu_hwmon_get_power(dev, 
>> AMDGPU_PP_SENSOR_GPU_AVG_POWER);
>> -	if (val < 0)
>> -		return val;
>> 
> 
> This is reporting errors returned from amdgpu_hwmon_get_power() as
> large integers.

     Alright, that case it is a false positive, thanks for the comment!

     José.
