Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA3F7EED602
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 Sep 2023 15:00:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234752AbjIOPA4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 15 Sep 2023 11:00:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjIOPAz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 15 Sep 2023 11:00:55 -0400
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A41310D
        for <linux-hwmon@vger.kernel.org>; Fri, 15 Sep 2023 08:00:50 -0700 (PDT)
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-34dee07e676so6815085ab.3
        for <linux-hwmon@vger.kernel.org>; Fri, 15 Sep 2023 08:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694790050; x=1695394850; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=IsgvyT2pi1/tsO2whSiw6LLP8C07Dh9N8yrhYMtrav4=;
        b=DzuASJL5M1j3lAP+eyMSeqVcdA/4fqcZl1T16bH/3WX7M0H10eJJ648cTz7XhV3NYw
         vLJikAoH2hE7jfqIIlBjxOl3ihFNu6LiOmFlEn1akY4n68nspDoAv/h8WfrJ1185sqfh
         3Gk4NLvc1QvAPGze+KLLLj5OcQNwGUhja84wKAxZF1bHoE/MdPiD+wJmu4KytrluVz/2
         j1KJNGrziwsEUoAfljBvlP+Pl3mRacmuPAIIM2SaPMYYpcSQmbwXQlt5Fc7X5d48id3V
         6X+PxH4hMHN3/CIQpkD9CJ5o++yNtKKqvokrUQKERDn9/k6DFb5L6JiP0bsZnzDWVmNm
         1PTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694790050; x=1695394850;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IsgvyT2pi1/tsO2whSiw6LLP8C07Dh9N8yrhYMtrav4=;
        b=vWnJVWm/sNgIyQbtBbwMecLzW5GtmipvGuW8S4O6wG7IRH+eYr2jW7DIHoBfQs7eka
         VrWRfl59LCfDW+Bh0sdolV7E5NWGxAKJcP2ES3UkLX6qQCGO3Wli7kTvW8DHCW/l522B
         EOnoSG/mXkEN20nSIfoH+JQMYeVDRm2nBB6CaPW2JlnqUSPtqNJMS/eCwA9LxerAHkd+
         5Y2+PjNp2JiNxMVABeb07wEJrq2LYDpa3tfk/YPDBT+UREA3xxVNc8Wkn6lO+a+CrRd2
         3MJ7DupANrYOBP4jl8gNHJzdRz9xAoo6O53Drjz9UkL8OwNmHNoNhQNVmWNeUZsrRIe4
         9tGA==
X-Gm-Message-State: AOJu0Ywz6MxUMBACkL9otryaCJPYsip81YRqpczy0b1SRyj8QNQ+Y3c3
        ilNN/U8aJUd0kHALCfgJaeBNutRJEWg=
X-Google-Smtp-Source: AGHT+IFfeu7oH0R0HMrC7qvMRsCk0h979cDXWrLc+6aVxU+JdSpFmZr9NMpkx5ec7N+J2rzwZM6k/w==
X-Received: by 2002:a05:6e02:1786:b0:34f:9f86:dd3d with SMTP id y6-20020a056e02178600b0034f9f86dd3dmr2376424ilu.24.1694790049567;
        Fri, 15 Sep 2023 08:00:49 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s20-20020a02c514000000b00430979b6aa5sm1085361jam.0.2023.09.15.08.00.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 08:00:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1b747280-a1cc-d125-a40d-c3bcce39297e@roeck-us.net>
Date:   Fri, 15 Sep 2023 08:00:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: hwmon: (nct6775) Regression Bisected
Content-Language: en-US
To:     Doug Smythies <dsmythies@telus.net>,
        'Ahmad Khalifa' <ahmad@khalifa.ws>
Cc:     'Jean Delvare' <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <002101d9e7e0$f67c4490$e374cdb0$@telus.net>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <002101d9e7e0$f67c4490$e374cdb0$@telus.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On 9/15/23 07:28, Doug Smythies wrote:
> Kernel 6.6-rc1 has an error during boot. The guilty commit is:
> b7f1f7b2523a6a4382f12fe953380b847b80e09d
> hwmon: (nct6775) Additional TEMP registers for nct6799
> 
> There seems to be confusion between the indexes into
> the NCT6799_ALARM_BITS array or the
> NCT6779_ALARM_BITS array. I do not understand the code
> and do not know if it is the indexing that is reversed or the
> wrong table is being used.
> 

Thanks a lot for the report. Ahmad, can you look into this ?
If it can't be fixed quickly we'll have to revert the offending patch.

Thanks,
Guenter

> The error from kern.log (edited):
> 
> ================================================================================
> UBSAN: shift-out-of-bounds in drivers/hwmon/nct6775-core.c:1757:39
> shift exponent -1 is negative
> CPU: 9 PID: 822 Comm: sensors Not tainted 6.6.0-rc1-stock2 #1165
> Hardware name: ASUS System Product Name/PRIME Z490-A, BIOS 9902 09/15/2021
> Call Trace:
> <TASK>
> dump_stack_lvl+0x48/0x70
> dump_stack+0x10/0x20
> ubsan_epilogue+0x9/0x40
> __ubsan_handle_shift_out_of_bounds+0x10f/0x170
> ...
> 
> I added a "pr_info" line (in the below it was as of the prior commit,
> 43fbe66dc216 hwmon: Add driver for Renesas HS3001):
> 
> doug@s19:~/kernel/linux$ git diff
> diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
> index 33533d95cf48..12e3df84c034 100644
> --- a/drivers/hwmon/nct6775-core.c
> +++ b/drivers/hwmon/nct6775-core.c
> @@ -1727,6 +1727,7 @@ nct6775_show_alarm(struct device *dev, struct device_attribute *attr, char *buf)
>                  return PTR_ERR(data);
> 
>          nr = data->ALARM_BITS[sattr->index];
> +       pr_info("doug: nr: %d  ; index %d\n", nr, sattr->index);
>          return sprintf(buf, "%u\n",
>                         (unsigned int)((data->alarms >> nr) & 0x01));
>   }
> 
> And for b7f1f7b2523a got (edited):
> 
> nct6775_core: doug: nr: 0  ; index 0
> nct6775_core: doug: nr: 1  ; index 1
> nct6775_core: doug: nr: 2  ; index 2
> nct6775_core: doug: nr: 3  ; index 3
> nct6775_core: doug: nr: 8  ; index 4
> nct6775_core: doug: nr: -1  ; index 5
> ================================================================================
> UBSAN: shift-out-of-bounds in drivers/hwmon/nct6775-core.c:1758:39
> shift exponent -1 is negative
> ...
> nct6775_core: doug: nr: 20  ; index 6
> nct6775_core: doug: nr: 16  ; index 7
> nct6775_core: doug: nr: 17  ; index 8
> nct6775_core: doug: nr: 24  ; index 9
> nct6775_core: doug: nr: 25  ; index 10
> nct6775_core: doug: nr: 26  ; index 11
> nct6775_core: doug: nr: 27  ; index 12
> nct6775_core: doug: nr: 28  ; index 13
> nct6775_core: doug: nr: 29  ; index 14
> nct6775_core: doug: nr: 6  ; index 24
> nct6775_core: doug: nr: 7  ; index 25
> nct6775_core: doug: nr: 11  ; index 26
> nct6775_core: doug: nr: 10  ; index 27
> nct6775_core: doug: nr: 23  ; index 28
> nct6775_core: doug: nr: 33  ; index 29
> nct6775_core: doug: nr: 12  ; index 48
> nct6775_core: doug: nr: 9  ; index 49
> 
> Observe that the table seems to be
> NCT6799_ALARM_BITS
> But the indexes seem to be for
> NCT6779_ALARM_BITS
> 
> static const s8 NCT6799_ALARM_BITS[NUM_ALARM_BITS] = {
>           0,  1,  2,  3,  8, -1, 20, 16, 17, 24, 25, 26,   /* in0-in11     */
>          27, 28, 29, 30, 31, -1, -1, -1, -1, -1, -1, -1,   /* in12-in23    */
>           6,  7, 11, 10, 23, 33, -1, -1, -1, -1, -1, -1,   /* fan1-fan12   */
>           4,  5, 40, 41, 42, 43, 44, -1, -1, -1, -1, -1,   /* temp1-temp12 */
>          12,  9,                                           /* intr0-intr1  */
> };
> 
> Now repeat the test as of 43fbe66dc216:
> 
> nct6775_core: doug: nr: 0  ; index 0
> nct6775_core: doug: nr: 1  ; index 1
> nct6775_core: doug: nr: 2  ; index 2
> nct6775_core: doug: nr: 3  ; index 3
> nct6775_core: doug: nr: 8  ; index 4
> nct6775_core: doug: nr: 21  ; index 5
> nct6775_core: doug: nr: 20  ; index 6
> nct6775_core: doug: nr: 16  ; index 7
> nct6775_core: doug: nr: 17  ; index 8
> nct6775_core: doug: nr: 24  ; index 9
> nct6775_core: doug: nr: 25  ; index 10
> nct6775_core: doug: nr: 26  ; index 11
> nct6775_core: doug: nr: 27  ; index 12
> nct6775_core: doug: nr: 28  ; index 13
> nct6775_core: doug: nr: 29  ; index 14
> nct6775_core: doug: nr: 6  ; index 24
> nct6775_core: doug: nr: 7  ; index 25
> nct6775_core: doug: nr: 11  ; index 26
> nct6775_core: doug: nr: 10  ; index 27
> nct6775_core: doug: nr: 23  ; index 28
> nct6775_core: doug: nr: 33  ; index 29
> nct6775_core: doug: nr: 12  ; index 48
> nct6775_core: doug: nr: 9  ; index 49
> 
> Observe that the table seems to be
> NCT6779_ALARM_BITS
> And the indexing seems to be for that
> Table.
> 
> static const s8 NCT6779_ALARM_BITS[NUM_ALARM_BITS] = {
>           0,  1,  2,  3,  8, 21, 20, 16, 17, 24, 25, 26,   /* in0-in11     */
>          27, 28, 29, -1, -1, -1, -1, -1, -1, -1, -1, -1,   /* in12-in23    */
>           6,  7, 11, 10, 23, -1, -1, -1, -1, -1, -1, -1,   /* fan1-fan12   */
>           4,  5, 13, -1, -1, -1, -1, -1, -1, -1, -1, -1,   /* temp1-temp12 */
>          12,  9,                                           /* intr0-intr1  */
> };
> 
> You probably need this information:
> nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
> 
> ... Doug
> 
> 

